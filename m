Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6E83A6B42
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:06:03 +0200 (CEST)
Received: from localhost ([::1]:46626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsp6A-0006UT-C9
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsp3n-0004iB-Q5
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:03:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsp3i-00062U-1a
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623686607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8HMdULp8lBhHjEzIv2mOgG0hgD82TJM/+TnTi0S8uzo=;
 b=GFbtbbFkwFyhhoAosvf0qu1zptcf/+CSE3C9is4sStdqAEOzaAscHKNo9472vDaaFvu1Ga
 AOLntCTb05uRCmikFb6T0on1ZzGS4GWUstRxjpffkQMvooF8k9CcZqW+MO25y5+Bc3L1Zq
 AJTJg3Zx4QWo587lHgxPK6tIXtkQ6Qo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-kI_E3HyXN0W6rJkwYeYgKw-1; Mon, 14 Jun 2021 12:03:25 -0400
X-MC-Unique: kI_E3HyXN0W6rJkwYeYgKw-1
Received: by mail-wr1-f69.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso7231377wrh.12
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 09:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8HMdULp8lBhHjEzIv2mOgG0hgD82TJM/+TnTi0S8uzo=;
 b=BdViafj9f2ppjj11yzypMGHVroNPXt1kzR3d+jf78WIXoYGu1mnR1fZgptDLmlJGTn
 IBuC/df08HXMWIFMsTmggKe8nBTXoEJhUdv8nGFQ52OZI9WKJSug1mDTCT5bn+R1u/M8
 zbA5tlyVz6SaG4xUBZdHOevXiiYWKY3C3rFebjD8umjDGF10l6cYT0Anm/DA6ifQ7bN2
 WwHI8p5TpZl6ts0MngBLm9RUAP1t/CujwGmME/TJD10c8rnjjjox8dYgRH9rvnD7VDD0
 2sDnwheo0uvFbB0tECZx3KdLgeXjXSFr0nuWTIvo12FwGhKlgj4eLP5xJ6ItMt0USAgV
 GXFg==
X-Gm-Message-State: AOAM532keIwReQBRD/4CvOjlc3W9dSdpn/y5dpMRZYxndf7A5wbLco/v
 QbCvV5YFr4CVnTAUm2SmIJYSChZrxw7KXzni04yhe7emSlgL9rAuYGlkzGpeBjzBuVPQZoj6Tn5
 MSqKJOhQXxJF+VFY=
X-Received: by 2002:a05:6000:1849:: with SMTP id
 c9mr20223243wri.140.1623686603846; 
 Mon, 14 Jun 2021 09:03:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU/u4VONZxttU7n08VkeAaM1i/KlW1IdMsKnUjMkkvW3CmXzX34FmOMtnVf9b5eT4H1RvY3A==
X-Received: by 2002:a05:6000:1849:: with SMTP id
 c9mr20223203wri.140.1623686603611; 
 Mon, 14 Jun 2021 09:03:23 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p23sm12175073wmi.26.2021.06.14.09.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 09:03:23 -0700 (PDT)
Subject: Re: [PATCH] block/nvme: Fix VFIO_MAP_DMA failed: No space left on
 device
To: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
References: <20210611114606.320008-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cb271128-faa2-c557-128f-4ec1133667b8@redhat.com>
Date: Mon, 14 Jun 2021 18:03:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210611114606.320008-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/11/21 1:46 PM, Philippe Mathieu-Daudé wrote:
> When the NVMe block driver was introduced (see commit bdd6a90a9e5,
> January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
> -ENOMEM in case of error. The driver was correctly handling the
> error path to recycle its volatile IOVA mappings.
> 
> To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
> DMA mappings per container", April 2019) added the -ENOSPC error to
> signal the user exhausted the DMA mappings available for a container.

Hmm this commit has been added before v5.1-rc4.

So while this fixes the behavior of v5.1-rc4+ kernels,
older kernels using this fix will have the same problem...

Should I check uname(2)'s utsname.release[]? Is it reliable?

> The block driver started to mis-behave:
> 
>   qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
>   (qemu)
>   (qemu) info status
>   VM status: paused (io-error)
>   (qemu) c
>   VFIO_MAP_DMA failed: No space left on device
>   qemu-system-x86_64: block/block-backend.c:1968: blk_get_aio_context: Assertion `ctx == blk->ctx' failed.
> 
> Fix by handling the -ENOSPC error when DMA mappings are exhausted;
> other errors (such -ENOMEM) are still handled later in the same
> function.
> 
> An easy way to reproduce this bug is to restrict the DMA mapping
> limit (65535 by default) when loading the VFIO IOMMU module:
> 
>   # modprobe vfio_iommu_type1 dma_entry_limit=666
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Michal Prívozník <mprivozn@redhat.com>
> Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
> Buglink: https://bugs.launchpad.net/qemu/+bug/1863333
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/65
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Michal, is it still possible for you to test this (old bug)?
> 
> A functional test using viommu & nested VM is planned (suggested by
> Stefan and Maxim).
> ---
>  block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index 2b5421e7aa6..12f9dd5cce3 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -1030,7 +1030,7 @@ try_map:
>          r = qemu_vfio_dma_map(s->vfio,
>                                qiov->iov[i].iov_base,
>                                len, true, &iova);
> -        if (r == -ENOMEM && retry) {
> +        if (r == -ENOSPC && retry) {
>              retry = false;
>              trace_nvme_dma_flush_queue_wait(s);
>              if (s->dma_map_count) {
> 


