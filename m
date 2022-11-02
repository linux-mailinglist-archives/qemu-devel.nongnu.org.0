Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E6616245
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 12:57:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqCMC-0005ER-S9; Wed, 02 Nov 2022 07:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oqCMB-0005Ds-Fl
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:56:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oqCM8-0003jW-TO
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667390188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PZdIz0gzqMXIXHZMfl6AArnCPJEbFL6nMSjGSIAxQus=;
 b=DORvAvDTel39PMLyfzS2dhVOFMq5zX6yssSsIwZEJO2ofh/UYetLQ8/TZ1cc8TEzM4EIah
 HxPk0cdDcGhj1pTyuNNl/XVRtV1vkFdUYJF+6NR6pd6Jc6KfdMBvs65MzVD61kKeh2WO9B
 aXWVbJcDFGkz9MNeTxN34IDlp46dwUU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-ijqqUoxOP1OosI5H5FHoMA-1; Wed, 02 Nov 2022 07:56:25 -0400
X-MC-Unique: ijqqUoxOP1OosI5H5FHoMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5AA1811E7A;
 Wed,  2 Nov 2022 11:56:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CF2D2024CBB;
 Wed,  2 Nov 2022 11:56:23 +0000 (UTC)
Date: Wed, 2 Nov 2022 12:56:22 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] block/blkio: Tolerate device size changes
Message-ID: <Y2Ja5uT/lArSypAC@redhat.com>
References: <20221029122031.975273-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221029122031.975273-1-afaria@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 29.10.2022 um 14:20 hat Alberto Faria geschrieben:
> Some libblkio drivers may be able to work with regular files (e.g.,
> io_uring) or otherwise resizable devices. Conservatively set
> BlockDriver::has_variable_length to true to ensure bdrv_nb_sectors()
> always gives up-to-date results.
> 
> Also implement BlockDriver::bdrv_co_truncate for the case where no
> preallocation is needed and the device already has a size compatible
> with what was requested.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
> 
> This is based on Stefan's block tree:
> https://gitlab.com/stefanha/qemu/-/commits/block
> 
>  block/blkio.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/block/blkio.c b/block/blkio.c
> index 82f26eedd2..190454cdbe 100644
> --- a/block/blkio.c
> +++ b/block/blkio.c
> @@ -845,6 +845,31 @@ static int64_t blkio_getlength(BlockDriverState *bs)
>      return capacity;
>  }
>  
> +static int coroutine_fn blkio_truncate(BlockDriverState *bs, int64_t offset,
> +                                       bool exact, PreallocMode prealloc,
> +                                       BdrvRequestFlags flags, Error **errp)
> +{
> +    int64_t current_length;
> +
> +    if (prealloc != PREALLOC_MODE_OFF) {
> +        error_setg(errp, "Unsupported preallocation mode '%s'",
> +                   PreallocMode_str(prealloc));
> +        return -ENOTSUP;
> +    }
> +
> +    current_length = blkio_getlength(bs);
> +
> +    if (offset > current_length) {
> +        error_setg(errp, "Cannot grow device");
> +        return -EINVAL;
> +    } else if (exact && offset != current_length) {
> +        error_setg(errp, "Cannot resize device");
> +        return -ENOTSUP;
> +    }
> +
> +    return 0;
> +}
> +
>  static int blkio_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
>  {
>      return 0;
> @@ -960,10 +985,12 @@ static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
>      { \
>          .format_name             = name, \
>          .protocol_name           = name, \
> +        .has_variable_length     = true, \

I don't think this is a good idea, it will read the capacity from
libblkio before every single request, which can't result in good
performance.

We're generally only using .has_variable_length for removable media on
the backend (i.e. for host_cdrom and filters that can potentially sit on
top of it, but will used the cached value on the protocol level again
for other protocol drivers).

If you resize a host_device, you need to use QMP 'block_resize'
explicitly. I think it should be the same for libblkio.

Kevin


