Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787C5651E3A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 10:59:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Yxc-0003Sx-Lr; Tue, 20 Dec 2022 04:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7YxW-0003Re-4X
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:30:50 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7YxU-0002B5-8T
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:30:49 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so10674701wmh.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 01:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G/dpNMhDj0dkK+eMZPgPDIDAPr8OUqu+urZOVvb2p+I=;
 b=TIPc8/bkp4vKHyyFcA6Ze8WAO0+2twZqpkg0qJLA/JtnqPq5QKAfXtLnt7uygs/PvU
 c0FUlK17MOrA3k+6tyAeKgtCMBQjSfGFXagLxQpFPP5m8+duaquJ6SaR9751N3Zxt3/5
 FdTbZUxS0pXC/6SUeJmg2S04KNLhI4lAA2h1KCTcQ+Tpmd5W28c1hBs3bxne2rA1cXiG
 greNiWzZnhdF/nAWaKnT1WxDWBuhtjhfntbagp6aipCeCL9Znxtqfderttp852E16nkR
 W2W9vvLVgst5dWHdUw6D7WHbsjtf5mUEQUk/CtJ1SzvEXoxWwVoDWIVhsr0n1aqKIkaD
 865w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G/dpNMhDj0dkK+eMZPgPDIDAPr8OUqu+urZOVvb2p+I=;
 b=Sq3cxk+p9lMF/c3kBlacxL4OLHk172+e5mydmAWAPoddhbMkmZbTWpCgjsULL49Ony
 Em0BaaiTQWGFPq6jWr6oif1/pAl1vDMwCjlXn0hYu0Gbo+Ap59DQU/by6ApE4axQc7IN
 ZgQ9dB0bVAwz+cNwfqtaE4GRdYDGTr8ierpqwvlgQzYm+6S0MBxV9wBvosesNs77HS7V
 /QWgqNnjWChW0gH/IxHpXlNE9jNsJcKt6pIl2tw/Dw33ggpNIs2aIl6VdYgaEqI7d2nK
 c9WRNretO2FcmKVwQnPeMN6lVMfR7lbslXQKz0AlCfWEs2TqV2w+iH6HN85IFN4YweWu
 CRLA==
X-Gm-Message-State: ANoB5pmVX7QCic5WDelCfe3BaGDISKOgXNcJuzPQtTTfAgMky55GPULs
 6Ax3NF2I4QnVQWDn8rvEu0VdKQ==
X-Google-Smtp-Source: AA0mqf4BdBL8CIhMzighDePROI6hCYevyeTaUcUKIkeVkWeVFVDCLEqqVwYkNIK5gGTtdx9ZrYLmMw==
X-Received: by 2002:a7b:c30e:0:b0:3c6:f7ff:6f87 with SMTP id
 k14-20020a7bc30e000000b003c6f7ff6f87mr33905266wmj.11.1671528646445; 
 Tue, 20 Dec 2022 01:30:46 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n15-20020a1c720f000000b003cf4ec90938sm14986672wmc.21.2022.12.20.01.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:30:45 -0800 (PST)
Message-ID: <a31967f6-6de5-bed2-8a1a-68a909850dd5@linaro.org>
Date: Tue, 20 Dec 2022 10:30:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2] pflash: Only read non-zero parts of backend image
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Xiang Zheng
 <zhengxiang9@huawei.com>, David Edmondson <david.edmondson@oracle.com>,
 Markus Armbruster <armbru@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <20221220084246.1984871-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220084246.1984871-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

[Extending to people using UEFI VARStore on Virt machines]

On 20/12/22 09:42, Gerd Hoffmann wrote:
> From: Xiang Zheng <zhengxiang9@huawei.com>
> 
> Currently we fill the VIRT_FLASH memory space with two 64MB NOR images
> when using persistent UEFI variables on virt board. Actually we only use
> a very small(non-zero) part of the memory while the rest significant
> large(zero) part of memory is wasted.
> 
> So this patch checks the block status and only writes the non-zero part
> into memory. This requires pflash devices to use sparse files for
> backends.

I like the idea, but I'm not sure how to relate with NOR flash devices.

 From the block layer, we get BDRV_BLOCK_ZERO when a block is fully
filled by zeroes ('\0').

We don't want to waste host memory, I get it.

Now what "sees" the guest? Is the UEFI VARStore filled with zeroes?
If so, is it a EDK2 specific case for all virt machines? This would
be a virtualization optimization and in that case, this patch would
work.

On hardware the NOR flash "erased state" is filled of '\xff'. If
EDK2 requires a 64MiB VARStore on NOR flash, I'd expect the non-used
area to be filled with \xff, at least up to the sector size. Otherwise
it is sub-optimal use of persistent storage on hardware.

But instead of keeping insisting on that, I'd like to step back a little
and discuss. What is the use case?

* Either you want to test UEFI on real hardware and a NOR flash makes
   sense,

* or you are trying to optimize paravirtualized guests. In that case
   why insist with emulated NOR devices? Why not have EDK2 directly
   use a paravirtualized block driver which we can optimize / tune
   without interfering with emulated models?

Keeping insisting on optimizing guests using the QEMU pflash device
seems wrong to me. I'm pretty sure we can do better optimizing clouds
payloads.

> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> 
> [ kraxel: rebased to latest master ]
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   hw/block/block.c | 36 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/block.c b/hw/block/block.c
> index f9c4fe67673b..142ebe4267e4 100644
> --- a/hw/block/block.c
> +++ b/hw/block/block.c
> @@ -14,6 +14,40 @@
>   #include "qapi/error.h"
>   #include "qapi/qapi-types-block.h"
>   
> +/*
> + * Read the non-zeroes parts of @blk into @buf
> + * Reading all of the @blk is expensive if the zeroes parts of @blk
> + * is large enough. Therefore check the block status and only write
> + * the non-zeroes block into @buf.
> + *
> + * Return 0 on success, non-zero on error.
> + */
> +static int blk_pread_nonzeroes(BlockBackend *blk, hwaddr size, void *buf)
> +{
> +    int ret;
> +    int64_t bytes, offset = 0;
> +    BlockDriverState *bs = blk_bs(blk);
> +
> +    for (;;) {
> +        bytes = MIN(size - offset, BDRV_REQUEST_MAX_SECTORS);
> +        if (bytes <= 0) {
> +            return 0;
> +        }
> +        ret = bdrv_block_status(bs, offset, bytes, &bytes, NULL, NULL);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +        if (!(ret & BDRV_BLOCK_ZERO)) {
> +            ret = bdrv_pread(bs->file, offset, bytes,
> +                             (uint8_t *) buf + offset, 0);
> +            if (ret < 0) {
> +                return ret;
> +            }
> +        }
> +        offset += bytes;
> +    }
> +}
> +
>   /*
>    * Read the entire contents of @blk into @buf.
>    * @blk's contents must be @size bytes, and @size must be at most
> @@ -53,7 +87,7 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
>        * block device and read only on demand.
>        */
>       assert(size <= BDRV_REQUEST_MAX_BYTES);
> -    ret = blk_pread(blk, 0, size, buf, 0);
> +    ret = blk_pread_nonzeroes(blk, size, buf);
>       if (ret < 0) {
>           error_setg_errno(errp, -ret, "can't read block backend");
>           return false;


