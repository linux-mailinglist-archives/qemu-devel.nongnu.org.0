Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AB4606333
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:35:08 +0200 (CEST)
Received: from localhost ([::1]:41344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWd8-0007js-Mr
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:34:47 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWOo-0001oI-4U
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTh5-0002sp-SI
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:26:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTgv-0000O8-4M
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:26:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bu30so33891877wrb.8
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Yp74iDGAwL2LyFqxDnKERAfZCVMyF7ka5nBRvjBfT0=;
 b=dqaN43kF+K5Ljp4Yk9/IgwRY8J9eOGAOFVDcEHpBWSKIdR0DP+JwISzsN9RbInv4rd
 IK2x1Olk8Sie22YBM+ejd5IHd6VEGxlKQkmvJly+BQuPqliD2dLgntCeKxmUGTJKfgHz
 bNUsr6dwmMFdLrjVSsG4DYunZDO2dmyMBIFEspQNoxLBFOs2dBxg/jIhKvOx4K4+8uNg
 SHSQ9Q6wcyl9I41mLneT0OwpUcLnTk4ZzSh5TZyzax9Ef9x/rFZpEYAAe2cA2O6fSuEi
 9Pwzg3IAWeCeM5YQxLbgI6eKoZhYU4IhDpzBb1HK/WGkYg7c7QDzOzcPU/LjdWvTQwlH
 +sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Yp74iDGAwL2LyFqxDnKERAfZCVMyF7ka5nBRvjBfT0=;
 b=ZlcBtDo1Try7yAx2YNuV3jC+htuJa8k3q76sRSpMxdw49gpVV8P/arRQxpIwiUJced
 ErFXwiZb8rYb2XSD29eLTAwYgGwV6HeMYkwxUTTDLKQOjERHj+Das2w/n0mf4Gr5iXD9
 rtdV7qU3hjz7IJhSSLA8K25fi3gDuahu0DoP19vNh8tcSqc+6OGBTHIJ1mOmujffHyx2
 jKR9zcqVgLn8+HQHacBEtD6+s1IybdM8opTQrkdwgF5SGo6fEd3b3zkUS+rj1QvKv86o
 lbtUAF9NOO9TcT3YiTtAi+a0U9jPulDqjdMoicM5GJ+1/TQa16LwCjGnYOq6isg7boBj
 /prA==
X-Gm-Message-State: ACrzQf0PmS94cvg3m1S2yKmGfvHa1Bgw8CmpCiONBn8Bh1UWiFnGmxBE
 stfkisgkgjPHp4g0p8jdDBgfEQ==
X-Google-Smtp-Source: AMsMyM5+FTaxrL23P4q558gdUrfEphXJHBAFD+d/2xg9nteubRIU0ksWDh6py0+hPcSTIWoj70MLng==
X-Received: by 2002:adf:e18b:0:b0:22e:a2ce:7746 with SMTP id
 az11-20020adfe18b000000b0022ea2ce7746mr8264390wrb.468.1666265176244; 
 Thu, 20 Oct 2022 04:26:16 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1c7c13000000b003b4868eb6bbsm3072501wmc.23.2022.10.20.04.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:26:15 -0700 (PDT)
Message-ID: <34c3cd43-3be8-7890-108e-89bd77eedc65@linaro.org>
Date: Thu, 20 Oct 2022 13:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [RFC PATCH 1/3] tcg/riscv: Fix base regsiter for qemu_ld/st
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, lzw194868@alibaba-inc.com
References: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
 <20221020104154.4276-2-zhiwei_liu@linux.alibaba.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020104154.4276-2-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/22 12:41, LIU Zhiwei wrote:
> When guest base is zero, we should use addr_regl as base regiser instead of

Typo "register" here and in patch subject.

> the initial register TCG_REG_TMP0.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target.c.inc | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 81a83e45b1..32f4bc7bfc 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1185,6 +1185,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
>       }
>       if (guest_base != 0) {
>           tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
> +    } else {
> +        base = addr_regl;
>       }
>       tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
>   #endif
> @@ -1257,6 +1259,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
>       }
>       if (guest_base != 0) {
>           tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
> +    } else {
> +        base = addr_regl;
>       }
>       tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
>   #endif

Maybe worth inverting the if statement, otherwise LGTM.


