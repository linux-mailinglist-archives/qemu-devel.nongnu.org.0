Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A752439A60E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:45:05 +0200 (CEST)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqSu-0003za-Ki
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loqEB-0005fx-86
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:29:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loqE8-0000e0-AA
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622737787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z9plmEIMhluKR6UEBpq+5QyVRPIaWMCitWqCQ+p9qH8=;
 b=cRKkB1GJBlYMZr4S9r2RLq9Bnr/Qy8Q/X0+p4nRLoQek6SXLYvt7OnCVMv7dUG+M7Mt/Q6
 2WlkFXAfcuaLJG10v7WO1zT7FJ85aIWoz5VPXDFnLCdnuYxQQkj61QAd2AnAdm7+7P5K1r
 SpaXCT3ogusmri9NqMw4va1ylOfPssg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-SNTkOBS-PU6nMHsV0uRBfw-1; Thu, 03 Jun 2021 12:29:43 -0400
X-MC-Unique: SNTkOBS-PU6nMHsV0uRBfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B169101371D;
 Thu,  3 Jun 2021 16:29:42 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6B3C5D6AB;
 Thu,  3 Jun 2021 16:29:41 +0000 (UTC)
Date: Thu, 3 Jun 2021 11:29:39 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 19/33] block/nbd: split nbd_handle_updated_info out of
 nbd_client_handshake()
Message-ID: <20210603162939.a3bulyj2wlj4oavp@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-20-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-20-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 11:08:57AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> To be reused in the following patch.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 99 ++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 57 insertions(+), 42 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 5e63caaf4b..03ffe95231 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -318,6 +318,50 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
>      return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
>  }
>  
> +/*
> + * Check s->info updated by negotiation process.

The parameter name is bs, not s; so this comment is a bit confusing...

> + * Update @bs correspondingly to new options.
> + */
> +static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
> +{
> +    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;

...until here.  Maybe rewrite the entire comment as:

Update @bs with information learned during a completed negotiation
process.  Return failure if the server's advertised options are
incompatible with the client's needs.

> +    int ret;
> +
> +    if (s->x_dirty_bitmap) {
> +        if (!s->info.base_allocation) {
> +            error_setg(errp, "requested x-dirty-bitmap %s not found",
> +                       s->x_dirty_bitmap);
> +            return -EINVAL;
> +        }
> +        if (strcmp(s->x_dirty_bitmap, "qemu:allocation-depth") == 0) {
> +            s->alloc_depth = true;
> +        }
> +    }
> +
> +    if (s->info.flags & NBD_FLAG_READ_ONLY) {
> +        ret = bdrv_apply_auto_read_only(bs, "NBD export is read-only", errp);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    }
> +
> +    if (s->info.flags & NBD_FLAG_SEND_FUA) {
> +        bs->supported_write_flags = BDRV_REQ_FUA;
> +        bs->supported_zero_flags |= BDRV_REQ_FUA;

Code motion, so it is correct, but it looks odd to use = for one
assignment and |= for the other.  Using |= in both places would be
more consistent.

> +    }
> +
> +    if (s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES) {
> +        bs->supported_zero_flags |= BDRV_REQ_MAY_UNMAP;
> +        if (s->info.flags & NBD_FLAG_SEND_FAST_ZERO) {
> +            bs->supported_zero_flags |= BDRV_REQ_NO_FALLBACK;
> +        }
> +    }
> +
> +    trace_nbd_client_handshake_success(s->export);
> +
> +    return 0;
> +}
> +
>  static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>  {
>      int ret;
> @@ -1579,49 +1623,13 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)

As updating the comment doesn't affect code correctness,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


