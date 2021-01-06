Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A102EC23C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:30:06 +0100 (CET)
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxCdJ-00053Q-Me
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxCbh-0004FJ-5U
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:28:25 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxCbf-0001MJ-LN
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:28:24 -0500
Received: by mail-wm1-x336.google.com with SMTP id y23so3296286wmi.1
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 09:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Iv1uJHvOpKItOJLXpfA5CB//QyMpFvFHRmxtx+KxLM=;
 b=WB/py2xregr+w0FHU65DoCs90clvwSk17SiD+PtZzCFFcAgLHSk2e9kayTPBlcxkvg
 bXNjJDJeNx0uN5o0oPfXklrGUnxDFz7I3CzntvzV/Wx+sE6K20TOiZMO3UZLHsl8X6BT
 nCxrp4SY4s3RzLbT6hfXXdXCy5+pkNuQkBMSX7NE60gpuOwmgAbzYSWMNTyJ78qUkAo1
 7Naps9yg+QHZnVS7ev3WwkGqb2U/kWBrzwtY/2AtqUG3OB8/WeD9HIXfrGQXD9mLokYu
 nbKqDawbuGjwda4QBf+jYyVEIGPI5dQkHjwjx9xG7T/1ALrV7v2VqFMGJT7vLbWMeEPR
 Xfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Iv1uJHvOpKItOJLXpfA5CB//QyMpFvFHRmxtx+KxLM=;
 b=qzpBUqSdbuVVkpPK9FSlEXMzjyrFBbVf9Lp2hBioRVpO33AsZiyZUYpf8ayfiuCzgt
 tZDuYwR8naD4GOwSTiFw9+NCyT3kIqFmfqoyhB2iqG6IetunNjrVyEcK4Z0DdI1XEu+e
 PwCVJyYqaLtGBwhHB6Hf86pDf1UeeDny621oVNjdq5N0RgcSqx6G1vq3DvZ7EN5UGN5e
 MkVJ+kGae3gSv6YJKYdGfoF5KcCDBDX2w8NOEYZ7uSn2DZ6S3BR5Ac8U8KmwtCEi3Fr6
 smoWQggtHsYJish+a3ClTgT2+VKTC5xjgwEiYsYTO0sLpweiuAEk1yZBaDgGrbgfVtTo
 9BrA==
X-Gm-Message-State: AOAM532RqRiShVup3C4D/4eYqnsLITLaXQ11TIhosJTnkAuds3tHPnpQ
 KJz99H7VZYoCpQAyFGAzEAw=
X-Google-Smtp-Source: ABdhPJy0U9LFVs+6i7RNn2VXHrfN0GRuzmUjEB1SS+mcw/9G5PjkfabPGxF2R83YKX3O9be0wHz9gg==
X-Received: by 2002:a1c:208f:: with SMTP id g137mr4467611wmg.67.1609954101917; 
 Wed, 06 Jan 2021 09:28:21 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id y63sm3931832wmd.21.2021.01.06.09.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 09:28:21 -0800 (PST)
Subject: Re: [PATCH v2 8/8] hw/mips/boston: Use bootloader helper to set GCRs
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064631.30504-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <105f0d1b-ca44-b7bc-aa11-7179f7d7d081@amsat.org>
Date: Wed, 6 Jan 2021 18:28:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201215064631.30504-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 7:46 AM, Jiaxun Yang wrote:
> Translate embedded assembly into IO writes which is more
> readable.
> 
> Also hardcode cm_base at boot time instead of reading from CP0.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/boston.c | 45 ++++++++++++---------------------------------
>  1 file changed, 12 insertions(+), 33 deletions(-)
> 
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index b622222c7d..9f08aa7285 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -281,42 +281,21 @@ static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr,
>      const uint32_t gic_base = 0x16120000;
>      const uint32_t cpc_base = 0x16200000;
>  
> -    /* Move CM GCRs */
>      if (is_64b) {
> -        stl_p(p++, 0x40287803);                 /* dmfc0 $8, CMGCRBase */
> -        stl_p(p++, 0x00084138);                 /* dsll $8, $8, 4 */
> +        bl_gen_write_u64(&p, cm_base,
> +                    cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS));
> +        bl_gen_write_u64(&p, gic_base | GCR_GIC_BASE_GICEN_MSK,
> +                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_GIC_BASE_OFS));
> +        bl_gen_write_u64(&p, cpc_base | GCR_CPC_BASE_CPCEN_MSK,
> +                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_CPC_BASE_OFS));
>      } else {
> -        stl_p(p++, 0x40087803);                 /* mfc0 $8, CMGCRBase */
> -        stl_p(p++, 0x00084100);                 /* sll  $8, $8, 4 */
> +        bl_gen_write_u32(&p, cm_base,
> +                    cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS));
> +        bl_gen_write_u32(&p, gic_base | GCR_GIC_BASE_GICEN_MSK,
> +                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_GIC_BASE_OFS));
> +        bl_gen_write_u32(&p, cpc_base | GCR_CPC_BASE_CPCEN_MSK,
> +                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_CPC_BASE_OFS));
>      }

What about simplifying adding bl_gen_write_target_ulong() or
bl_gen_write_ulong()?

