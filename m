Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAD36F05F1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:39:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0ta-0002XK-Pn; Thu, 27 Apr 2023 08:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ps0tU-0002Wv-Ac
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:38:40 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ps0tS-0000ma-Pb
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:38:40 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50a145a0957so6291955a12.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 05:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682599117; x=1685191117;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XB0bMz2eBLjBAn0q4whlLoAIJYfE5SitTpCJU6/qxyk=;
 b=csQ6jgQpEerrLmmDG6wos13yn47FuueqZV3jmXQpfeG5PwYUMOZUEc/7UmVtA5Q8DV
 OlR2TN77L9eSEs31ja+UpBugo7sgCSDTuD2yUJtb4GM5pSmOx6LSe6FEk/UVfQAJWjZL
 paeY2NYwhRk4qYkwiSYg4ZGU7GkkUf98wNzmmnGYbmcCu6dIjkabk9NAVODErKc8XkI8
 Wg3TVycRVAR9DMoPUtySyk7UtBUtfr3h2LWsS8mg7AED2CF3xk0ICM4okGiIEFWyTC2u
 NwJ2rwKeszv0oxDjBIyBL6XXesAzZqVV+A/JTLbZJFZolhvx+/lvzoyUMV4T6mhxMZMx
 +20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682599117; x=1685191117;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XB0bMz2eBLjBAn0q4whlLoAIJYfE5SitTpCJU6/qxyk=;
 b=Tx9e8sBt368YQme+DutsEKT7uV7pp/lJU4SnRWYbG5CXcduBD29CDqJ5Gjx03PRS/Y
 mifnocSOmt00hi7BIs9d+K6HownGvobQU/HwSWWtxQUGOOI1HAOnppE5EA95xazyBuKs
 ZuErF+0PtU1JVv/BgcjRPCaCdlyaTABOvz6IkL2yoBSlW6y1Yu+VU6RUmGFZpRrVEnXl
 DxtPliAXoD/8ZHrQfJccyfmcSWNgaM1oMT2kOoDSC5ZrGyDNGNaDD87G20TLx7N7paCJ
 gcw/NFLk/nOmATG4GGZz1n/IDcfjtjL6LK00ibSYYHwL6c+dVCGHcF+DZ2eUoPccrYq5
 oRxg==
X-Gm-Message-State: AC+VfDw2DXoYwU5d0xwuFKUIBDZcFqeUZ3S0NbkjHj8ApWOJYg3FLXSu
 ZWfEkMLdvQnBW2yPzGMEMSgm/w==
X-Google-Smtp-Source: ACHHUZ5f4vJ8OjT0N3xKus1icvnvi42fGKsZunSBP/jrI014ZycQkpeYo6t5hPkjKFoLvbREM44UoQ==
X-Received: by 2002:a05:6402:31e2:b0:500:47ed:9784 with SMTP id
 dy2-20020a05640231e200b0050047ed9784mr1621565edb.14.1682599116944; 
 Thu, 27 Apr 2023 05:38:36 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 d22-20020aa7d696000000b00504a7deefd6sm7917965edr.7.2023.04.27.05.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 05:38:36 -0700 (PDT)
Message-ID: <5d1f7e80-adeb-f15a-bae2-c71c26450d93@linaro.org>
Date: Thu, 27 Apr 2023 13:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] target/s390x: Fix EXECUTE of relative branches
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230426235813.198183-1-iii@linux.ibm.com>
 <20230426235813.198183-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426235813.198183-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/27/23 00:58, Ilya Leoshkevich wrote:
> Fix a problem similar to the one fixed by commit 703d03a4aaf3
> ("target/s390x: Fix EXECUTE of relative long instructions"), but now
> for relative branches.
> 
> Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   target/s390x/tcg/translate.c | 81 ++++++++++++++++++++++++++----------
>   1 file changed, 58 insertions(+), 23 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 46b874e94da..2a681428af1 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -1534,18 +1534,51 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
>       }
>   }
>   
> +/*
> + * Disassemble the target of a branch. The results are returned in a form
> + * suitable for passing into help_branch():
> + *
> + * - bool IS_IMM reflects whether the target is fixed or computed. Non-EXECUTEd
> + *   branches, whose DisasContext *S contains the relative immediate field RI,
> + *   are considered fixed. All the other branches are considered computed.
> + * - int IMM is the value of RI.
> + * - TCGv_i64 CDEST is the address of the computed target.
> + */
> +#define disas_jdest(s, ri, is_imm, imm, cdest) do {                            \
> +    if (have_field(s, ri)) {                                                   \
> +        if (unlikely(s->ex_value)) {                                           \
> +            cdest = tcg_temp_new_i64();                                        \
> +            tcg_gen_ld_i64(cdest, cpu_env, offsetof(CPUS390XState, ex_target));\
> +            tcg_gen_addi_i64(cdest, cdest, (int64_t)get_field(s, ri) * 2);     \
> +            is_imm = false;                                                    \
> +        } else {                                                               \
> +            is_imm = true;                                                     \
> +        }                                                                      \
> +    } else {                                                                   \
> +        is_imm = false;                                                        \
> +    }                                                                          \
> +    imm = is_imm ? get_field(s, ri) : 0;                                       \
> +} while (false)

I'm not especially fond of the macro, but given the variable field, I don't know how else 
to structure it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

