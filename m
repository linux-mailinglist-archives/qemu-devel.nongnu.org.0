Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2803C6E53
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:21:29 +0200 (CEST)
Received: from localhost ([::1]:51676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3FXc-0005EW-Cs
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3FWK-0003xh-BQ; Tue, 13 Jul 2021 06:20:08 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3FWI-0002eA-F9; Tue, 13 Jul 2021 06:20:08 -0400
Received: by mail-wr1-x430.google.com with SMTP id l7so28853184wrv.7;
 Tue, 13 Jul 2021 03:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n/aQS5Y7DBS+6/KzXpPMMbFiXGKCUPw797pYsN/2ykw=;
 b=QLkVNCZDAdXlDrQYFfYAEUt5L/+9xv/RQI/9kru7P3jxJ/zzgvHwdcKiPnLjH+Ig7C
 R1B04HFCYiRkDZNQHKYdfNtIs6cx9oyNPy6bZPrtUq9qvqkxVwH7qkeiKxulxEqK+Pgt
 B7vaywqScb0PVqfMlpXDf99tF78aJr24AH60tp075SKkRXcyMFJJU4L01UAHJCDXU/YG
 ZDawh/t3ElWVox+vFv/Yx4EaAFg3D2uOg2/CDzOOSGQUFfEiY9hbnPGK2Rhrv8hz0QSc
 9Jmp4yF1lsTH0RbNjeeOgeeAUheEaoy1Phb2ts5Ip0DhFIxpeFMcFeYVKtTnhRU7/0+X
 +vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n/aQS5Y7DBS+6/KzXpPMMbFiXGKCUPw797pYsN/2ykw=;
 b=BS+Z2yibLDrBQ2gcgB4ZqrYd3gJRBb/InRBclci0nDO3O+sgV+2XYZrap9is/qBVfT
 FF4yEdzqcBGBOnmfROnxB/Y0+5p5XQP+bFcg+lK6E+xgnrWDdBYZLVirdlCIbxeDcIDF
 ne5/y3VH8WKtfhOix8dg+xT2+qbswvkkbqGUPhrL1/Y6TJI8vDRT+0DPfoH4DN/VFZiQ
 iybqCjPOcx5TeQCskn5yCGDLsyqY0ihZglCC0a05GOzKZE5Fo2JFi8c/LaBRMNUtzrUb
 HotIBKeBWTYODWVDUFdzw+wJHCO9BcJuIqj9G+GbU94rJyLYXhi4Fbc5yDcMiuTpziwH
 eQow==
X-Gm-Message-State: AOAM530M76LuTI6259R2xnu6xIShATYJl5wXGtK2LBLjJoC1CBtqMXLI
 SzTZk9xIdVsB/7jOoOGHeJxQ/J9FYf6hXg==
X-Google-Smtp-Source: ABdhPJyLCBoaRA5ddxK22u8nmTLBD1Rh2ReW0mCROKhcObSK+4YCW0to9e/bfiQiufmJRkQov4KFnw==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr4666774wrm.60.1626171604424; 
 Tue, 13 Jul 2021 03:20:04 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id d14sm6644718wrs.49.2021.07.13.03.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 03:20:02 -0700 (PDT)
Subject: Re: [PATCH] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
To: Qiang Liu <cyruscyliu@gmail.com>
References: <1626146083-19434-1-git-send-email-cyruscyliu@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5c8d9875-ecf1-4f67-f26d-da010bdab9bb@amsat.org>
Date: Tue, 13 Jul 2021 12:20:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626146083-19434-1-git-send-email-cyruscyliu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.479,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 5:14 AM, Qiang Liu wrote:
> xlnx_dp_read allows an out-of-bounds read at its default branch because
> of an improper index.
> 
> According to
> https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
> (DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.
> 
> DP_INT_MASK	0x000003A4	32	mixed	0xFFFFF03F	Interrupt Mask Register for intrN.
> DP_INT_EN	0x000003A8	32	mixed	0x00000000	Interrupt Enable Register.
> DP_INT_DS	0x000003AC	32	mixed	0x00000000	Interrupt Disable Register.
> 
> In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
> will write s->core_registers[0x3A4
>>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
>>> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
>>> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
> In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
> the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
> rather than 0x3A4.
> 
> This patch adjusts the size of s->core_registers and enforces the read
> access to offset 0x3A* and 0x3AC to 0x3A4. BTW, because the size of this
> MMIO region is 0x3AF, this patch also removes the assertion in
> xlnx_dp_write.
> 
> Fixes: 58ac482a66de ("introduce xlnx-dp")
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
>  hw/display/xlnx_dp.c         | 7 ++++---
>  include/hw/display/xlnx_dp.h | 2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)

Can you provide a qtest reproducer please?

> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 7bcbb13..8903181 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -713,8 +713,10 @@ static uint64_t xlnx_dp_read(void *opaque, hwaddr offset, unsigned size)
>          ret = 0;
>          break;
>      default:
> -        assert(offset <= (0x3AC >> 2));
> -        ret = s->core_registers[offset];
> +        if (offset == (0x3A8 >> 2) || offset == (0x3AC >> 2))
> +            ret = s->core_registers[DP_INT_MASK];
> +        else 

Invalid code style.

> +            ret = s->core_registers[offset];
>          break;
>      }
>  
> @@ -876,7 +878,6 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
>          xlnx_dp_update_irq(s);
>          break;
>      default:
> -        assert(offset <= (0x504C >> 2));
>          s->core_registers[offset] = value;
>          break;
>      }
> diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
> index e85e428..99a6d47 100644
> --- a/include/hw/display/xlnx_dp.h
> +++ b/include/hw/display/xlnx_dp.h
> @@ -39,7 +39,7 @@
>  #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
>  #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
>  
> -#define DP_CORE_REG_ARRAY_SIZE              (0x3AF >> 2)
> +#define DP_CORE_REG_ARRAY_SIZE              (0x3A8 >> 2)

NAck: this breaks migration.

>  #define DP_AVBUF_REG_ARRAY_SIZE             (0x238 >> 2)
>  #define DP_VBLEND_REG_ARRAY_SIZE            (0x1DF >> 2)
>  #define DP_AUDIO_REG_ARRAY_SIZE             (0x50 >> 2)
> 


