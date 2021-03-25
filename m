Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633ED349267
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:51:39 +0100 (CET)
Received: from localhost ([::1]:46244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPPSc-0001xt-Gk
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPPR1-0001Rm-Fv
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:49:59 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:44811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPPQz-0001jl-ID
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:49:59 -0400
Received: by mail-oi1-x22b.google.com with SMTP id a8so1948139oic.11
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AyCUW37oncMKUFOQTdCz7MV5CAHEHprQRLgGkW0v6ro=;
 b=WAvyI+oX9H4HUUJb4Pv1pYgpFyHl7DOb9eq2CbUAaoLqlU+cYhid8veQPbUlefX15/
 U3lir1scC7G5yLBQ++M568O/fGXGhx0ivPX/VWW+iHXXj42Mf/toTAUDBEFwCcsbLrQT
 WMCgH7lokUAqrWIMHfDwUWw0yqWGcyjc/NBBT8RLdTaeo1s1ItPaXydqFz20m0dMvTjp
 08/4GcMwc8pA9pv59O7GXq/ymqvO3DsyQKKMgy3jKZSBkkF/UFGh53LGeuKLfg8+WxAr
 /vl8Y/ea435GtXsxm3KewiHbSZ2GhYj6zzcidj67wPIeCcwRR+zQz0AXGd+NIrGOI4Xm
 EE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AyCUW37oncMKUFOQTdCz7MV5CAHEHprQRLgGkW0v6ro=;
 b=hwHHevQsAD2hlDexuGxe/nXNXFFtYeXFs+/uToOjxLhfYLEY1WgEvntKneV6Z4YNoe
 8C1Y6hMefUOmoCJIYBER3br1IZK+NiBTp4lOUVQYvBHJBkiTu9k6EKv5D+CC0EZmmJGi
 FCLEvH5zMZJ9JD5TVCG9ouX2a9AA9ixqz/FnIDtSnAhg9rwH89TsoHEdbRQiTcnpGbr4
 HVQtbIYdOtLOK3HTPIEKSZ4M23kG8mmWaD8a8sD6FMfhzJQTX3n5s8mlrpBjGs7+gfxA
 r3LhhdSo4S2Unc3QGsL4wcvS+ZRLeKMbU+AI7O9YHsbp2hHdymnYBmZJ1Dny3wCD5ObQ
 WOUQ==
X-Gm-Message-State: AOAM533z0L1hB5iyhjITRnKwV4gBTPmR9LHwDzZJfI1xqeT+i1JJBY9f
 4uet11gyUkiXV1t1g6xGWahUig==
X-Google-Smtp-Source: ABdhPJyZoGQn6T+dWljIiHelvNR7jk7Dk+p+V2ERseJ7MLlb9BoSUkCW2jmnJzgisS45BMqBsDmDrQ==
X-Received: by 2002:aca:c44b:: with SMTP id u72mr5918056oif.33.1616676596046; 
 Thu, 25 Mar 2021 05:49:56 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id z25sm1373197otj.68.2021.03.25.05.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 05:49:55 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 2/2] hw/block/pflash_cfi02: Do not create aliases
 when not necessary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210325120921.858993-1-f4bug@amsat.org>
 <20210325120921.858993-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7bac9f7-f9a1-15fb-b863-a4fc6bc1942e@linaro.org>
Date: Thu, 25 Mar 2021 06:49:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210325120921.858993-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 6:09 AM, Philippe Mathieu-Daudé wrote:
> When no mapping is requested, it is pointless to create
> alias regions.
> Only create them when multiple mappings are requested to
> simplify the memory layout. The flatview is not changed.
> 
> For example using 'qemu-system-sh4 -M r2d -S -monitor stdio',
> 
> * before:
> 
>    (qemu) info mtree
>    address-space: memory
>      0000000000000000-ffffffffffffffff (prio 0, i/o): system
>        0000000000000000-0000000000ffffff (prio 0, i/o): pflash
>          0000000000000000-0000000000ffffff (prio 0, romd): alias pflash-alias @r2d.flash 0000000000000000-0000000000ffffff
>        0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
>        000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram
>    (qemu) info mtree -f
>    FlatView #0
>     AS "memory", root: system
>     AS "cpu-memory-0", root: system
>     Root memory region: system
>      0000000000000000-0000000000ffffff (prio 0, romd): r2d.flash
>      0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
>      000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram
> 
> * after:
> 
>    (qemu) info mtree
>    address-space: memory
>      0000000000000000-ffffffffffffffff (prio 0, i/o): system
>        0000000000000000-0000000000ffffff (prio 0, romd): r2d.flash
>        0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
>        000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram
>    (qemu) info mtree -f
>    FlatView #0
>     AS "memory", root: system
>     AS "cpu-memory-0", root: system
>     Root memory region: system
>      0000000000000000-0000000000ffffff (prio 0, romd): r2d.flash
>      0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
>      000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/block/pflash_cfi02.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 35e30bb812c..02c514fb6e0 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -917,8 +917,12 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
>       pfl->sector_erase_map = bitmap_new(pfl->total_sectors);
>   
>       pfl->rom_mode = true;
> -    pflash_setup_mappings(pfl);
> -    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
> +    if (pfl->mappings > 1) {
> +        pflash_setup_mappings(pfl);
> +        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
> +    } else {
> +        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->orig_mem);
> +    }
>   
>       timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
>       pfl->status = 0;
> 


