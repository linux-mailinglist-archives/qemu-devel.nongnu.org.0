Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5325ECA2C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:54:46 +0200 (CEST)
Received: from localhost ([::1]:53192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDr3-0006Co-AX
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@sphalerite.org>)
 id 1odCIb-00087e-Lm; Tue, 27 Sep 2022 11:15:05 -0400
Received: from sosiego.soundray.org ([116.203.207.114]:52162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@sphalerite.org>)
 id 1odCIZ-0001Si-QU; Tue, 27 Sep 2022 11:15:05 -0400
From: Linus Heckemann <git@sphalerite.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sphalerite.org;
 s=sosiego; t=1664291699;
 bh=mmoSWSPony/OOcRS26GkOGGpwYFoZXbHHGHNNYxjq9g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date;
 b=RLg4ZgPFqLBridZr/wCm+pDvE+UnZdhOQGlPLVPYuaQpkFTlF74mGsZNVGC7Ptt61
 h4Jfc/HTgLPCBR5F/v0zS7TOeIFo46l6HGnx1QQl9MOILiMDVWSbGBIfL97PXui/Hh
 DNvOSyGjKyw/kUCIhL7S+KLnSKFXMUD5nONqVoIM=
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Qemu-block <qemu-block@nongnu.org>, Greg Kurz <groug@kaod.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5] 9pfs: use GHashTable for fid table
In-Reply-To: <20220927142503.1694674-1-git@sphalerite.org>
References: <20220927142503.1694674-1-git@sphalerite.org>
Date: Tue, 27 Sep 2022 17:14:57 +0200
Message-ID: <ygasfkcx30u.fsf@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=116.203.207.114; envelope-from=git@sphalerite.org;
 helo=sosiego.soundray.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linus Heckemann <git@sphalerite.org> writes:
>  static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
>  {
>      V9fsState *s = pdu->s;
>      V9fsFidState *fidp;
> +    GList *freeing;
> +    /* Get a list of all the values (fid states) in the table, which we then... */
> +    g_autoptr(GList) fids = g_hash_table_get_values(s->fids);
>  
> -    /* Free all fids */
> -    while (!QSIMPLEQ_EMPTY(&s->fid_list)) {
> -        /* Get fid */
> -        fidp = QSIMPLEQ_FIRST(&s->fid_list);
> -        fidp->ref++;
> +    /* ... remove from the table, taking over ownership. */
> +    g_hash_table_steal_all(s->fids);
>  
> -        /* Clunk fid */
> -        QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> +    /*
> +     * This allows us to release our references to them asynchronously without
> +     * iterating over the hash table and risking iterator invalidation
> +     * through concurrent modifications.
> +     */
> +    for (freeing = fids; freeing; freeing = freeing->next) {
> +        fidp = freeing->data;
> +        fidp->ref++;
>          fidp->clunked = true;
> -
>          put_fid(pdu, fidp);
>      }
>  }

I'm not sure if this implementation is correct. I'm concerned that it
may result in dangling references, but haven't been able to find a
client that will send the TVERSION request on a connection that's
already been used in other ways, as opposed to when the connection is
first established. I suspect this will be very rare in general, so it
might be good to have a test case somewhere.

