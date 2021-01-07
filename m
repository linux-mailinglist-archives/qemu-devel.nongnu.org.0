Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CB02ECF97
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 13:27:49 +0100 (CET)
Received: from localhost ([::1]:56804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxUOK-00072a-PD
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 07:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kxUL0-00057v-Mw
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:24:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kxUKz-0005Qz-6E
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:24:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610022260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FwzxehpDXq3R4yHsvkxSoT8YAou6bQT3fwchV3R4FvM=;
 b=SO7oxQgKoXplHNgpu95/n2+s4yeMDaTqmoMZcGq3MwcDelkp8WhsVhWVKI3K4ypuRePWGe
 IdY5GQaM55XyWH5IPaYGTokJ12MgGHJ5r83dBxVGmIgDRtBYr9oxh5QSY9FAJPV3AyHIfk
 iyXILQdq2RDQCXzHvyAQpqRVBnc1DgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-THsDDsSpMhCJAMMCUaNupg-1; Thu, 07 Jan 2021 07:24:16 -0500
X-MC-Unique: THsDDsSpMhCJAMMCUaNupg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FDF3800D53;
 Thu,  7 Jan 2021 12:24:15 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-252.ams2.redhat.com
 [10.36.114.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE9E760BF1;
 Thu,  7 Jan 2021 12:24:09 +0000 (UTC)
Subject: Re: [PATCH v3 1/5] file-posix: split hdev_refresh_limits from
 raw_refresh_limits
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201217165612.942849-1-mlevitsk@redhat.com>
 <20201217165612.942849-2-mlevitsk@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <ceee451e-4e9a-bd0c-cb6a-1fdf1a274e99@redhat.com>
Date: Thu, 7 Jan 2021 13:24:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217165612.942849-2-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
> From: Tom Yan <tom.ty89@gmail.com>
> 
> We can and should get max transfer length and max segments for all host
> devices / cdroms (on Linux).
> 
> Also use MIN_NON_ZERO instead when we clamp max transfer length against
> max segments.
> 
> Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   block/file-posix.c | 57 +++++++++++++++++++++++++++++++++-------------
>   1 file changed, 41 insertions(+), 16 deletions(-)

I’m aware that most of my remarks below apply to the pre-patch state 
just as well, but I feel like now is a good time to raise them, so, here 
goes:

> diff --git a/block/file-posix.c b/block/file-posix.c
> index 9804681d5c..cbf1271773 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1166,6 +1166,10 @@ static int sg_get_max_transfer_length(int fd)
>       int max_bytes = 0;
>   
>       if (ioctl(fd, BLKSECTGET, &max_bytes) == 0) {
> +        /*
> +         * BLKSECTGET for /dev/sg* character devices incorrectly returns
> +         * the max transfer size in bytes (rather than in blocks).
> +         */
>           return max_bytes;
>       } else {
>           return -errno;
> @@ -1175,7 +1179,22 @@ static int sg_get_max_transfer_length(int fd)
>   #endif
>   }
>   
> -static int sg_get_max_segments(int fd)
> +static int get_max_transfer_length(int fd)
> +{
> +#if defined(BLKSECTGET)
> +    int sect = 0;
> +
> +    if (ioctl(fd, BLKSECTGET, &sect) == 0) {
> +        return sect << 9;

Can this overflow?

(I mean, technically it would still be safe, because either the limit is 
set too low or it isn’t set at all, which would be correct on overflow. 
  But still.)

> +    } else {
> +        return -errno;
> +    }
> +#else
> +    return -ENOSYS;
> +#endif
> +}
> +
> +static int get_max_segments(int fd)
>   {
>   #ifdef CONFIG_LINUX
>       char buf[32];

This function stores max_segments (a long) in ret (an int) and returns 
the latter.  Should we guard against overflows?

> @@ -1230,23 +1249,29 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>   {
>       BDRVRawState *s = bs->opaque;
>   
> -    if (bs->sg) {
> -        int ret = sg_get_max_transfer_length(s->fd);
> +    raw_probe_alignment(bs, s->fd, errp);
> +    bs->bl.min_mem_alignment = s->buf_align;
> +    bs->bl.opt_mem_alignment = MAX(s->buf_align, qemu_real_host_page_size);
> +}
> +
> +static void hdev_refresh_limits(BlockDriverState *bs, Error **errp)
> +{
> +    BDRVRawState *s = bs->opaque;
> +
> +    int ret = bs->sg ? sg_get_max_transfer_length(s->fd) :
> +                       get_max_transfer_length(s->fd);
>   
> -        if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
> -            bs->bl.max_transfer = pow2floor(ret);
> -        }
> +    if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
> +        bs->bl.max_transfer = pow2floor(ret);
> +    }
>   
> -        ret = sg_get_max_segments(s->fd);
> -        if (ret > 0) {
> -            bs->bl.max_transfer = MIN(bs->bl.max_transfer,
> -                                      ret * qemu_real_host_page_size);

(1) Can this overflow?  (Which I suppose could result in a 
non-power-of-two result)

(2) Even disregarding overflows, is ret * qemu_real_host_page_size 
guaranteed to be a power of two?

Max

> -        }
> +    ret = get_max_segments(s->fd);
> +    if (ret > 0) {
> +        bs->bl.max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
> +                                           ret * qemu_real_host_page_size);
>       }
>   
> -    raw_probe_alignment(bs, s->fd, errp);
> -    bs->bl.min_mem_alignment = s->buf_align;
> -    bs->bl.opt_mem_alignment = MAX(s->buf_align, qemu_real_host_page_size);
> +    raw_refresh_limits(bs, errp);
>   }
>   
>   static int check_for_dasd(int fd)
> @@ -3600,7 +3625,7 @@ static BlockDriver bdrv_host_device = {
>       .bdrv_co_pdiscard       = hdev_co_pdiscard,
>       .bdrv_co_copy_range_from = raw_co_copy_range_from,
>       .bdrv_co_copy_range_to  = raw_co_copy_range_to,
> -    .bdrv_refresh_limits = raw_refresh_limits,
> +    .bdrv_refresh_limits = hdev_refresh_limits,
>       .bdrv_io_plug = raw_aio_plug,
>       .bdrv_io_unplug = raw_aio_unplug,
>       .bdrv_attach_aio_context = raw_aio_attach_aio_context,
> @@ -3724,7 +3749,7 @@ static BlockDriver bdrv_host_cdrom = {
>       .bdrv_co_preadv         = raw_co_preadv,
>       .bdrv_co_pwritev        = raw_co_pwritev,
>       .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
> -    .bdrv_refresh_limits = raw_refresh_limits,
> +    .bdrv_refresh_limits = hdev_refresh_limits,
>       .bdrv_io_plug = raw_aio_plug,
>       .bdrv_io_unplug = raw_aio_unplug,
>       .bdrv_attach_aio_context = raw_aio_attach_aio_context,
> 


