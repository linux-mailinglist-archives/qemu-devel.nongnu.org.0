Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC432ED062
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 14:11:44 +0100 (CET)
Received: from localhost ([::1]:53690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxV4o-0003We-2z
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 08:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kxV2q-0002AJ-Cj
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:09:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kxV2d-0000bC-MH
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610024967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwUsHfEj+tytJosXiZgSnCCacSXZ+3M4H80iLH/9JYk=;
 b=ARO8+EWOx+VQuIQUqX10zw0kmOGeZjkcaJQfEoGw6P8ogDZ9Be528LbUZ2KJjxsH5+NH2t
 oNSl4dzYhUvwTiAnL1w2x8ATKoOrWFQl7/sDwP8ibhwA75fO2A4BGRiR6rQXpP9sNd+gE8
 azqjGqZEd7saWuZG/8CFLGawmj2n9Ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-clMIbd5FMK2AYXsHscb8XA-1; Thu, 07 Jan 2021 08:09:23 -0500
X-MC-Unique: clMIbd5FMK2AYXsHscb8XA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D19B08042BD;
 Thu,  7 Jan 2021 13:09:21 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-252.ams2.redhat.com
 [10.36.114.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCA901876A;
 Thu,  7 Jan 2021 13:09:15 +0000 (UTC)
Subject: Re: [PATCH v3 3/5] block: add max_ioctl_transfer to BlockLimits
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201217165612.942849-1-mlevitsk@redhat.com>
 <20201217165612.942849-4-mlevitsk@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <4c4fa644-ff90-0578-9fae-e888fb4c9bbb@redhat.com>
Date: Thu, 7 Jan 2021 14:09:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217165612.942849-4-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Tom Yan <tom.ty89@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.12.20 17:56, Maxim Levitsky wrote:
> Maximum transfer size when accessing a kernel block device is only relevant
> when using SCSI passthrough (SG_IO ioctl) since only in this case the requests
> are passed directly to underlying hardware with no pre-processing.

So by “with no pre-processing” you mean in particular no pre-processing 
by the kernel?  I.e., that file-posix for non-SG devices actually has no 
max transfer limit, because the kernel will split overly long requests 
by itself?

> Same is true when using /dev/sg* character devices (which only support SG_IO)
> 
> Therefore split the block driver's advertized max transfer size by
> the regular max transfer size, and the max transfer size for SCSI passthrough
> (the new max_ioctl_transfer field)
> 
> In the next patch, the qemu block drivers that support SCSI passthrough
> will set the max_ioctl_transfer field, and simultaneously, the block devices
> that implement scsi passthrough will switch to 'blk_get_max_ioctl_transfer' to
> query and to pass it to the guest.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   block/block-backend.c          | 12 ++++++++++++
>   block/io.c                     |  2 ++
>   include/block/block_int.h      |  4 ++++
>   include/sysemu/block-backend.h |  1 +
>   4 files changed, 19 insertions(+)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index ce78d30794..c1d149a755 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1938,6 +1938,18 @@ uint32_t blk_get_max_transfer(BlockBackend *blk)
>       return MIN_NON_ZERO(max, INT_MAX);
>   }
>   
> +/* Returns the maximum transfer length, for SCSI passthrough */
> +uint32_t blk_get_max_ioctl_transfer(BlockBackend *blk)
> +{
> +    BlockDriverState *bs = blk_bs(blk);
> +    uint32_t max = 0;
> +
> +    if (bs) {
> +        max = bs->bl.max_ioctl_transfer;
> +    }
> +    return MIN_NON_ZERO(max, INT_MAX);
> +}
> +
>   int blk_get_max_iov(BlockBackend *blk)
>   {
>       return blk->root->bs->bl.max_iov;
> diff --git a/block/io.c b/block/io.c
> index 24205f5168..ac5aea435e 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -126,6 +126,8 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
>   {
>       dst->opt_transfer = MAX(dst->opt_transfer, src->opt_transfer);
>       dst->max_transfer = MIN_NON_ZERO(dst->max_transfer, src->max_transfer);
> +    dst->max_ioctl_transfer = MIN_NON_ZERO(dst->max_ioctl_transfer,
> +                                        src->max_ioctl_transfer);

I’d prefer this to be aligned to the opening parenthesis.

>       dst->opt_mem_alignment = MAX(dst->opt_mem_alignment,
>                                    src->opt_mem_alignment);
>       dst->min_mem_alignment = MAX(dst->min_mem_alignment,
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index 1eeafc118c..c59b0aefc4 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -686,6 +686,10 @@ typedef struct BlockLimits {
>        * clamped down. */
>       uint32_t max_transfer;
>   
> +    /* Maximal transfer length for SCSI passthrough (ioctl interface) */
> +    uint32_t max_ioctl_transfer;
> +
> +

Is there a specific reason you added a double newline here?  (All other 
fields in this struct are separated by a single newline)

Max

>       /* memory alignment, in bytes so that no bounce buffer is needed */
>       size_t min_mem_alignment;
>   
> diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
> index 8203d7f6f9..b019a37b7a 100644
> --- a/include/sysemu/block-backend.h
> +++ b/include/sysemu/block-backend.h
> @@ -203,6 +203,7 @@ void blk_eject(BlockBackend *blk, bool eject_flag);
>   int blk_get_flags(BlockBackend *blk);
>   uint32_t blk_get_request_alignment(BlockBackend *blk);
>   uint32_t blk_get_max_transfer(BlockBackend *blk);
> +uint32_t blk_get_max_ioctl_transfer(BlockBackend *blk);
>   int blk_get_max_iov(BlockBackend *blk);
>   void blk_set_guest_block_size(BlockBackend *blk, int align);
>   void *blk_try_blockalign(BlockBackend *blk, size_t size);
> 


