Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2760416709
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 23:01:52 +0200 (CEST)
Received: from localhost ([::1]:36214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTVqn-0006NU-S8
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 17:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTVoJ-0004ru-M5
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 16:59:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTVoH-00079b-Al
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 16:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632430752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V1TkF2x5nfz17VNMBvauL/kUfjaEJfTCx3yirY1jNlk=;
 b=TmMnV0TOHSDIhmgvMYnU6SuWWfWjns9+vl02EdhslzPiZRpt39baKL5w3qWoX1iX7L0blg
 j4CXoo5jbYImLCCLbZ2R8K//vWFmdYDnvIVEDml7N+LCiwPr1I7mCoz8HaNHNSvtokRUbl
 2t1NEmoh4iWURbIokPYht6thvTNgsZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-gjHErX0cO6OnmwAHG4y5JQ-1; Thu, 23 Sep 2021 16:59:09 -0400
X-MC-Unique: gjHErX0cO6OnmwAHG4y5JQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D43E1084688;
 Thu, 23 Sep 2021 20:59:07 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5079F5D9DC;
 Thu, 23 Sep 2021 20:58:54 +0000 (UTC)
Date: Thu, 23 Sep 2021 15:58:52 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 10/11] block: use int64_t instead of int in driver
 discard handlers
Message-ID: <20210923205852.oevcy7upj2ieirlb@redhat.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
 <20210903102807.27127-11-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210903102807.27127-11-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, integration@gluster.org, berto@igalia.com,
 stefanha@redhat.com, qemu-block@nongnu.org, pavel.dovgaluk@ispras.ru,
 sw@weilnetz.de, pl@kamp.de, qemu-devel@nongnu.org, jsnow@redhat.com,
 hreitz@redhat.com, kraxel@redhat.com, ronniesahlberg@gmail.com,
 pbonzini@redhat.com, idryomov@gmail.com, philmd@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 01:28:06PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We are generally moving to int64_t for both offset and bytes parameters
> on all io paths.
> 
> Main motivation is realization of 64-bit write_zeroes operation for
> fast zeroing large disk chunks, up to the whole disk.
> 
> We chose signed type, to be consistent with off_t (which is signed) and
> with possibility for signed return type (where negative value means
> error).
> 
> So, convert driver discard handlers bytes parameter to int64_t.
> 
> The only caller of all updated function is bdrv_co_pdiscard in
> block/io.c. It is already prepared to work with 64bit requests, but
> pass at most max(bs->bl.max_pdiscard, INT_MAX) to the driver.
> 
> Let's look at all updated functions:

> 
> Great! Now all drivers are prepared to handle 64bit discard requests,
> or else have explicit max_pdiscard limits.

Very similar analysis to the write-zeroes.

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---

> +++ b/block/nbd.c
> @@ -1457,15 +1457,17 @@ static int nbd_client_co_flush(BlockDriverState *bs)
>  }
>  
>  static int nbd_client_co_pdiscard(BlockDriverState *bs, int64_t offset,
> -                                  int bytes)
> +                                  int64_t bytes)
>  {
>      BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>      NBDRequest request = {
>          .type = NBD_CMD_TRIM,
>          .from = offset,
> -        .len = bytes,
> +        .len = bytes, /* len is uint32_t */
>      };
>  
> +    assert(bytes <= UINT32_MAX); /* rely on max_pdiscard */

Aha - you used <= here, compared to < in 7/11 on write zeroes.
Consistency says we want <= in both places.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


