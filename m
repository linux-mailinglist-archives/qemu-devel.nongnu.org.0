Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B7F69B210
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:53:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4u0-00041o-Pz; Fri, 17 Feb 2023 12:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT4ty-00041L-Du
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:52:06 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT4tw-0000kl-Pb
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:52:06 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1718b38d3ceso1605075fac.0
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fLO8uE4MwE+TjjxJWP0Hx1dDkzg54x+hJsFSWNmd2eI=;
 b=EO7Ct7aRpDH51zzos8g8cUwkuyRfxoNTqosiGXPJFad+xgY6QV09eGE+LEz8/BCjtc
 MpAnYeVJ5UbWi3yKGOcLmbPxAkxfA+pWJsDgDwV2Rukpt8VQzY2uGLYLGxg09X+gEnDY
 1HfpEhmTb2r09PrJm1T88oHxn2GFVavpHxVwrBWqlk2GwKDN/WoC/A1TKeDKxQqzOw/o
 68ZEN7j7OijJgSwHMd0tzYGL7TA2IWv5+iz//Qz2AZ2yqEkeG3ArY5FRj1ltEd6GtOmz
 wo49Xpizdhgu49THxcK2ZigiYbZUFGD8VAgEkqREI0rJUHAB9Oi/KW2rDTsFfZhLDw/f
 3Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fLO8uE4MwE+TjjxJWP0Hx1dDkzg54x+hJsFSWNmd2eI=;
 b=Gp3zL/hqll90C0J8/71I4ln4fzBLMej7aqwhq0Ue92R6ecCHDrazAzLm1sMyUyrBTK
 dWk4i+uborztQOjjswPTnDMl4mNlyaKWn6V1KJ2huO/6v7TxAHazCxXUvs4fP6k2gYf2
 cA6hy9Emsk5BendHF6HZ65w+2Fei/SH83nFdJE+9f2df8/tZYyjhG0qwxSEJe2eAie/k
 VHqLJF9r/YxzixnNVEG3otWDja6B9AZRXP1+G7JhA4p3vPuqiomA12lwt8SqvULaTLx5
 2BTlm4bEIbEjDcrgHND6xTNDDRgaYj7Gqtet5UZqAc8X4S43RnykRl9KDvTkR/sWq5zi
 JpoA==
X-Gm-Message-State: AO0yUKXEGVilP7giS3Il6x22CT28VOaLPbIoSkm+GipJAL7XggPxRw41
 8qu3ktau/+s8uZ+e36+kBj3O9g==
X-Google-Smtp-Source: AK7set8Mk+dAYnw/IBBfAi+t+X4eiy/KI1ApI262rHeAonq8qiHymHV3J9zZO+etRxeqaWx7Oqk+iQ==
X-Received: by 2002:a05:6870:479e:b0:16d:cc37:3d7b with SMTP id
 c30-20020a056870479e00b0016dcc373d7bmr763687oaq.36.1676656323103; 
 Fri, 17 Feb 2023 09:52:03 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 du25-20020a0568703a1900b0016a310dc4a9sm1892399oab.9.2023.02.17.09.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 09:52:02 -0800 (PST)
Message-ID: <4c3202fc-654c-8c6c-c754-1d156c2de2a6@ventanamicro.com>
Date: Fri, 17 Feb 2023 14:51:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] [PATCH] disas/riscv Fix ctzw disassemble
Content-Language: en-US
To: Ivan Klokov <ivan.klokov@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com
References: <20230217161027.56859-1-ivan.klokov@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230217161027.56859-1-ivan.klokov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/17/23 13:10, Ivan Klokov wrote:
> Due to typo in opcode list, ctzw is disassembled as clzw instruction.
> 
> Fixes: 02c1b569a15b ("disas/riscv: Add Zb[abcs] instructions")
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> v2:
>     - added fixes line
> ---
>   disas/riscv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index ddda687c13..54455aaaa8 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1645,7 +1645,7 @@ const rv_opcode_data opcode_data[] = {
>       { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>       { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>       { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "ctzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>       { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>       { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
>       { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },

