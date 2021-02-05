Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34114310DE0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:28:43 +0100 (CET)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83yM-0002m0-9F
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l83wZ-0001Lh-Nh
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:26:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l83wU-0006VL-JV
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612542405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TEcq0ltk07Lf0OSF/ygfFrv99IbO9E0evp/LKtf+izA=;
 b=XriXyBROq6wWhrUOFgy7qhwg7wgUOhEQSdFuxSPIN+coW3CGqJXEhy744uzRMTVUqK/Lzv
 rBdqZzVarZZyLBpeCxgO23RFJ9+TjYmtqwVNuKrSD7sEELUNpD2+xhHU7UvZieV/Eu75hF
 lr1oqZsEoO+bhZtk5u4Sd55OCTqegJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-sOBoJFYiN-6vhFhksq91JA-1; Fri, 05 Feb 2021 11:26:44 -0500
X-MC-Unique: sOBoJFYiN-6vhFhksq91JA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A613192AB7C;
 Fri,  5 Feb 2021 16:26:42 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DEA0100164C;
 Fri,  5 Feb 2021 16:26:40 +0000 (UTC)
Date: Fri, 5 Feb 2021 17:26:39 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 28/36] block: add bdrv_set_backing_noperm()
 transaction action
Message-ID: <20210205162639.GF7072@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-29-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-29-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Split out no-perm part of bdrv_set_backing_hd() as a separate
> transaction action. Note the in case of existing BdrvChild we reuse it,
> not recreate, just to do less actions.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

>  /*
>   * Sets the bs->backing link of a BDS. A new reference is created; callers
>   * which don't need their own reference any more must call bdrv_unref().
>   */
> -void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
> -                         Error **errp)
> +static int bdrv_set_backing_noperm(BlockDriverState *bs,
> +                                   BlockDriverState *backing_bs,
> +                                   GSList **tran, Error **errp)
>  {
> -    bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
> -        bdrv_inherits_from_recursive(backing_hd, bs);
> +    int ret = 0;
> +    bool update_inherits_from = bdrv_chain_contains(bs, backing_bs) &&
> +        bdrv_inherits_from_recursive(backing_bs, bs);
> +    GSList *attach_tran = NULL;
> +    BdrvSetBackingNoPermState *s;
>  
>      if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
> -        return;
> +        return -EPERM;
>      }
>  
> -    if (backing_hd) {
> -        bdrv_ref(backing_hd);
> +    if (bs->backing && backing_bs) {
> +        bdrv_replace_child_safe(bs->backing, backing_bs, tran);

The old code with separate bdrv_unref_child() and then
bdrv_attach_child() tried to make the AioContests of bs and backing_bs
compatible by moving one of the nodes if necessary.

bdrv_replace_child_safe() doesn't seem to do that, but it only asserts
that both nodes are already in the same context.

I see that iotest 245 doesn't crash, which I think it should if this
were broken, but where does the switch happen now?

Kevin


