Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B7264A22C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:50:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jCD-000497-5r; Mon, 12 Dec 2022 08:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jC9-00048D-QA
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:50:14 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jC8-0002Hn-3D
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:50:13 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-12c8312131fso8399565fac.4
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+/Q06khh1J5GcWfV2io4Fm1kdLvvwuXP3aCFyxvox10=;
 b=rVTQKl1lS/oRsDV0acOZuM18dTjqGb2xBx2GY48zuyn2VH3/wDeMwOOZc7/+22GHuY
 nExXCxcoxUmQAA3gR319FWWwBqDdWhL2RnDri5s3A0gASI+SrpQw9nJpz5xaW6dPervJ
 D3DkVTfZhjHtqnDjwiRK8IpUZ3Q8SGLS3rP4N7D3jWB12k+4keyv8F5xOq/LuyunfKVr
 zW7PWq/gE6O+qF2JoFLOPOtxOHKFNZrlyJdqv8Lydd6P343iiQesfhfGCdqacMe9Wqyb
 6jg30Bx38RQFwmz+nZfRw5c67ZVnUUuea/rK99ogWUTN0AGmkTyD3cCajBevo1Dfi+rx
 Mn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+/Q06khh1J5GcWfV2io4Fm1kdLvvwuXP3aCFyxvox10=;
 b=oZu7ymgaZJbfL5iZdi0WV+8G62S32TzqHH44Q5+MGj9NcIWaSdlWk1gojTwbwnLXLU
 6ZGNLDmXkf8CuwTd731NxfrDmPWWavotiH59hzfaIjQLMvYl0HipEU/h+MjkvCSy+1df
 9eBVssQWxKEKtm+U5TAaqmLKRxtd9tDEZINxeYVC04+2V5pnfMKjiWsOwcQUueTsS/Vn
 9EKUsHf3Q9jxblL+m42aCLzegyVvRZLl6dWerM6MAUjnGytJjaPNB0M29O4Zvy8uSy3Q
 SXm0kBHb621wTUWTg+ksHtht9cA8l1BsYUr62E+nEN7R6skikhj5G6DS388Mx7JwEEgG
 00cg==
X-Gm-Message-State: ANoB5pnXfkYpgKUTqH6wJDX+XvwkTyEVHK3A/vYNSGlEF+KAQXe04hEt
 qmAet7LHfUa1VIgy75KxGjy0vA==
X-Google-Smtp-Source: AA0mqf5VmeNLRxLMooTVt+HZoCiJ+HkstP9Ot+lEbPtcKDJl0+Oekr3Ngij3Qs1WUQDCvGUAv2+Lfg==
X-Received: by 2002:a05:6870:aa8c:b0:143:f29b:2f0b with SMTP id
 gr12-20020a056870aa8c00b00143f29b2f0bmr8299463oab.30.1670853010480; 
 Mon, 12 Dec 2022 05:50:10 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:20f0:1d0e:8e1f:fff0?
 ([2806:102e:18:2efc:20f0:1d0e:8e1f:fff0])
 by smtp.gmail.com with ESMTPSA id
 p33-20020a0568708a2100b0013b0b19100fsm4958438oaq.32.2022.12.12.05.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 05:50:09 -0800 (PST)
Message-ID: <ace38f47-df82-11d0-b80f-7b9fbef585b4@linaro.org>
Date: Mon, 12 Dec 2022 07:50:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 v2 03/11] hw/mips/bootloader: Implement nanoMIPS
 SW opcode generator
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
References: <20221211204533.85359-1-philmd@linaro.org>
 <20221211204533.85359-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221211204533.85359-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/11/22 14:45, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/mips/bootloader.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
> 
> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
> index 0035f37335..3e1e73360f 100644
> --- a/hw/mips/bootloader.c
> +++ b/hw/mips/bootloader.c
> @@ -143,9 +143,27 @@ static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
>       bl_gen_i_type(p, 0x0d, rs, rt, imm);
>   }
>   
> +static void bl_gen_sw_nm(void **ptr, bl_reg rt, uint8_t rs, uint16_t ofs12)
> +{
> +    uint32_t insn = 0;
> +
> +    assert(extract32(ofs12, 0, 12) == ofs12);
> +    insn = deposit32(insn, 26, 6, 0b100001);
> +    insn = deposit32(insn, 21, 5, rt);
> +    insn = deposit32(insn, 16, 5, rs);
> +    insn = deposit32(insn, 12, 4, 0b1001);
> +    insn = deposit32(insn, 0, 12, ofs12);
> +
> +    st_nm32_p(ptr, insn);
> +}
> +
>   static void bl_gen_sw(void **p, bl_reg rt, uint8_t base, uint16_t offset)
>   {
> -    bl_gen_i_type(p, 0x2b, base, rt, offset);
> +    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
> +        bl_gen_sw_nm(p, rt, base, offset);
> +    } else {
> +        bl_gen_i_type(p, 0x2b, base, rt, offset);
> +    }
>   }
>   
>   static void bl_gen_sd(void **p, bl_reg rt, uint8_t base, uint16_t offset)


