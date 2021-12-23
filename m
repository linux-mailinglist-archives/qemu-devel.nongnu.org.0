Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CB047E8F3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:16:20 +0100 (CET)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0VRj-00060c-9m
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:16:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VPw-0005AP-Rx
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:14:28 -0500
Received: from [2607:f8b0:4864:20::102d] (port=35513
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VPv-0006vw-2b
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:14:28 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso9823424pji.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 13:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XuurbrG8X+WULNawSt6t0x8J7xhqiYmFRgR14KwCikk=;
 b=ThsF4HaBc5V6EJFe7YB1b8w0H981ILMQKDGSm61va/VigJKGRkFZui8I7zHrH3J6lw
 QQ3GICoVT0vEHLMyl3Bv2WlinVi6i8DaAae7miN/78Nyd+vLzuiwq7ABwU7DBcnKgs84
 BPvwSeOmYHFOKygy7BB36U5Q26AjBbT/2Y4kHDmNM5sjU44HjUtjSsRn6nGdVFVKe7m3
 7paoRAoZZ+PWM6XEj1Sic4KbVH5i1gukML9JypXk0QqPDt3oJM30T8bRtjkdVBGyxIyx
 Kb0Zekvvf+RSBphgQUlidtPvrF0mOY5cTpGJLJxKPqU9kGNh2FsWhmr2X2gdrPTblv4B
 O36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XuurbrG8X+WULNawSt6t0x8J7xhqiYmFRgR14KwCikk=;
 b=pk+2inwos6YHX9YDUmAFht5xZRR1ngDZ/Hzuc8o9qA7GCiH2cbefzqgtsdu/yfNIhd
 ZaZazVa5Kmbjri7cukwoVixP03SssHL+lyH+Oj31F0k0MOV9oEdQ9ENooQI20m4e/K7a
 +foGS1h8aDi7Y4GCdy9QlMz042H8NUWw3cYvoh2qshhDbTJiJnBAmLWKimPF1HeQrMI5
 y6WTbRATNjCax+FybRuM7jDol5WSSHmdtwcW3NB3u0RhhsJ3AWwQUiIxtf9m4UeFJjPC
 3SVbCCZRo0jyCiXQXJ7xa5nWGAQ750Q3CjEh3V6sFvciTkOHnXH3zcKPsGRqziwHoNqB
 kv+Q==
X-Gm-Message-State: AOAM533G97ZpdS+ue6uJbuytvY98NPMoiKBmsRzuwzkfLUxLz85+ipiF
 j5UL40V5wEM3D55H5pubeFtloA==
X-Google-Smtp-Source: ABdhPJwJwkKaocYEQZmrZWQYQE5jAI9HKAvhow6WUp85s8aNBknHaWTulVanStmECG8Shd+xXVXelQ==
X-Received: by 2002:a17:90b:33ce:: with SMTP id
 lk14mr4543603pjb.25.1640294065696; 
 Thu, 23 Dec 2021 13:14:25 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id on2sm9954514pjb.19.2021.12.23.13.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 13:14:25 -0800 (PST)
Subject: Re: [PATCH v2 2/5] target/ppc/power8-pmu-insn-cnt: introduce
 inc_spr_if_cond()
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20211223201812.846495-1-danielhb413@gmail.com>
 <20211223201812.846495-3-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fb968665-a73b-c024-4cfd-201168c04b21@linaro.org>
Date: Thu, 23 Dec 2021 13:14:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211223201812.846495-3-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 12:18 PM, Daniel Henrique Barboza wrote:
> The code that increments a PMC is repetitive: check if a given register
> has a bit/mask set or cleared and increment the counter.
> 
> inc_spr_if_cond() will help deal with this repetition. This patch also
> gives a sample of how the function works by incrementing PMC5, which is
> supposed to be incremented only if MMCR0_FC56 is not set.
> 
> We've also removing the call from the helper since that would cause
> PMC5 to be counted twice.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/power8-pmu-insn-cnt.c.inc | 43 ++++++++++++++++++++++------
>   1 file changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
> index 6cdf2d2d88..3cfb801c69 100644
> --- a/target/ppc/power8-pmu-insn-cnt.c.inc
> +++ b/target/ppc/power8-pmu-insn-cnt.c.inc
> @@ -10,6 +10,38 @@
>    * See the COPYING file in the top-level directory.
>    */
>   
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +/*
> + * This function increments a SPR 'spr' by 'inc_val' if a given
> + * register 'reg' has a bitmask 'mask' set (cond = TCG_COND_EQ) or
> + * not set (TCG_COND_NE).
> + */
> +static void inc_spr_if_cond(int reg, uint64_t mask, TCGCond cond,
> +                            int spr, int inc_val)
> +{
> +    TCGCond exit_cond = tcg_invert_cond(cond);
> +    TCGLabel *l_exit;
> +    TCGv t0, t1;
> +
> +    l_exit = gen_new_label();
> +
> +    t0 = tcg_temp_new();
> +    gen_load_spr(t0, reg);
> +    tcg_gen_andi_tl(t0, t0, mask);
> +    tcg_gen_brcondi_tl(exit_cond, t0, mask, l_exit);

When testing a single bit, compare against 0, not the bit.

> +    t1 = tcg_temp_new();
> +    gen_load_spr(t1, spr);
> +    tcg_gen_addi_tl(t1, t1, inc_val);
> +    gen_store_spr(spr, t1);

It will probably perform better to make this a true conditional add.
I.e.

     gen_load_spr(t0, spr);
     tcg_gen_addi_tl(t1, t0, inc);
     tcg_gen_movcond_tl(cond, t0, reg, zero, t1, t0);
     gen_store_spr(spr, t0);

> -    /*
> -     * The PMU insns_inc() helper stops the internal PMU timer if a
> -     * counter overflows happens. In that case, if the guest is
> -     * running with icount and we do not handle it beforehand,
> -     * the helper can trigger a 'bad icount read'.
> -     */
> -    gen_icount_io_start(ctx);

Removing this is incorrect.

> -    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
> +    inc_spr_if_cond(SPR_POWER_MMCR0, MMCR0_FC56, TCG_COND_NE,
> +                    SPR_POWER_PMC5, ctx->base.num_insns);

This is non-bisectable.  You're removing support for all registers and only adding back 
PMC5.  You add them all back before the end of the series, but the middle patches do not 
behave correctly.


r~

