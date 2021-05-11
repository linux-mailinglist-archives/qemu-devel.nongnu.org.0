Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB6C37B070
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:03:10 +0200 (CEST)
Received: from localhost ([::1]:49598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZX3-0005LV-MD
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lgZUf-0003Vs-98
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:00:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lgZUd-0000Fj-Em
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620766838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4KOz+hFO1boDDiszRksPWHOIi0dAHXdCz0uwWOT2JM=;
 b=Sp4HP4eK/ddNh6rff4W0UZ5nZA7s4/BivXQ8n8WHC21Nr29AqMDjvQKOREvci8gnxoB9Vb
 l6IBnThAGaNCchIVVtiZKovFjgP8NFh+N+f3z28aEBpRH0QSWC3/4I8FzFpieD9VniPN55
 Ut3OhKQgrvdYo5/NqAGYtdYHG8FIcIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-BzfJdCMQNje_lHY_CX1Luw-1; Tue, 11 May 2021 17:00:35 -0400
X-MC-Unique: BzfJdCMQNje_lHY_CX1Luw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFBCB1854E24;
 Tue, 11 May 2021 21:00:32 +0000 (UTC)
Received: from [10.3.114.221] (ovpn-114-221.phx2.redhat.com [10.3.114.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 603936E51B;
 Tue, 11 May 2021 21:00:24 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
 <20210324205132.464899-5-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v4 04/11] block: use int64_t instead of uint64_t in driver
 write handlers
Message-ID: <733f714a-9092-172e-dfc0-60a2666ffe47@redhat.com>
Date: Tue, 11 May 2021 16:00:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210324205132.464899-5-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 stefanha@redhat.com, pavel.dovgaluk@ispras.ru, sw@weilnetz.de, pl@kamp.de,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com,
 ronniesahlberg@gmail.com, pbonzini@redhat.com, namei.unix@gmail.com,
 dillaman@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 3:51 PM, Vladimir Sementsov-Ogievskiy wrote:
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
> So, convert driver write handlers parameters which are already 64bit to
> signed type.
> 
> While being here, convert also flags parameter to be BdrvRequestFlags.
> 
> Now let's consider all callers. Simple
> 
>   git grep '\->bdrv_\(aio\|co\)_pwritev\(_part\)\?'
> 
> shows that's there two callers of driver function:
> 
>  bdrv_driver_pwritev() in block/io.c, passes int64_t, checked by
>    bdrv_check_qiov_request() to be non-negative.
> 
>  qcow2_save_vmstate() does bdrv_check_qiov_request().
> 
> Still, the functions may be called directly, not only by drv->...
> Let's check:
> 
> git grep '\.bdrv_\(aio\|co\)_pwritev\(_part\)\?\s*=' | \
> awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
> while read func; do git grep "$func(" | \
> grep -v "$func(BlockDriverState"; done
> 
> shows several callers:

...
Thanks for recording the audit.

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block_int.h        | 16 ++++++++--------
>  block/backup-top.c               |  6 +++---

>  30 files changed, 95 insertions(+), 86 deletions(-)
> 
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index e6bcf74e46..928369e0bc 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -237,8 +237,8 @@ struct BlockDriver {
>          int64_t offset, int64_t bytes, QEMUIOVector *qiov,
>          BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
>      BlockAIOCB *(*bdrv_aio_pwritev)(BlockDriverState *bs,
> -        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags,
> -        BlockCompletionFunc *cb, void *opaque);
> +        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
> +        BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
>      BlockAIOCB *(*bdrv_aio_flush)(BlockDriverState *bs,
>          BlockCompletionFunc *cb, void *opaque);
>      BlockAIOCB *(*bdrv_aio_pdiscard)(BlockDriverState *bs,
> @@ -287,10 +287,11 @@ struct BlockDriver {
>       * The buffer in @qiov may point directly to guest memory.
>       */
>      int coroutine_fn (*bdrv_co_pwritev)(BlockDriverState *bs,
> -        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags);
> +        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
> +        BdrvRequestFlags flags);
>      int coroutine_fn (*bdrv_co_pwritev_part)(BlockDriverState *bs,
> -        uint64_t offset, uint64_t bytes,
> -        QEMUIOVector *qiov, size_t qiov_offset, int flags);
> +        int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset,
> +        BdrvRequestFlags flags);
>  
>      /*
>       * Efficiently zero a region of the disk image.  Typically an image format
> @@ -428,10 +429,9 @@ struct BlockDriver {
>                                        Error **errp);
>  
>      int coroutine_fn (*bdrv_co_pwritev_compressed)(BlockDriverState *bs,
> -        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov);
> +        int64_t offset, int64_t bytes, QEMUIOVector *qiov);
>      int coroutine_fn (*bdrv_co_pwritev_compressed_part)(BlockDriverState *bs,
> -        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov,
> -        size_t qiov_offset);
> +        int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);

Someday it may be nice to convert remaining drivers of the old callbacks
to use the newer ones instead, for fewer callbacks to manage here.  But
not the problem of this patch.

> +++ b/block/backup-top.c
> @@ -97,9 +97,9 @@ static int coroutine_fn backup_top_co_pwrite_zeroes(BlockDriverState *bs,
>  }
>  
>  static coroutine_fn int backup_top_co_pwritev(BlockDriverState *bs,
> -                                              uint64_t offset,
> -                                              uint64_t bytes,
> -                                              QEMUIOVector *qiov, int flags)
> +                                              int64_t offset, int64_t bytes,
> +                                              QEMUIOVector *qiov,
> +                                              BdrvRequestFlags flags)
>  {
>      int ret = backup_top_cbw(bs, offset, bytes, flags);

We should clean up the signature of backup_top_cbw() in a followup, now
that pdiscard, pwrite_zeroes, pwritev all pass int64_t.

> +++ b/block/blkdebug.c
> @@ -635,8 +635,8 @@ blkdebug_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
>  }
>  
>  static int coroutine_fn
> -blkdebug_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
> -                    QEMUIOVector *qiov, int flags)
> +blkdebug_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
> +                    QEMUIOVector *qiov, BdrvRequestFlags flags)
>  {
>      int err;

Similarly for rule_check().  I probably called out a lot of the same
spots in 3/11.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


