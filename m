Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D749631EC22
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:17:38 +0100 (CET)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lClzl-0008O1-TW
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lClww-0007AM-9k
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:14:42 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lClwu-000127-9T
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:14:41 -0500
Received: by mail-pj1-x1035.google.com with SMTP id l18so1770801pji.3
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 08:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Slr0gelwZw4Oh/4gWPELyOhNHNARtPxmQ7R/a3ryU4Y=;
 b=uEbsRei2VioZWi4PSjLZL91I2Exd6C+ScYU2Ebna7MsScM9GVOBzwVqCNy51CsDl2k
 m9nJQNcw8fxpUvEwVF695eTTxwivfk2o4gnLCMvkq8DjbZyuFcTt3k19vq1awgvFfRpm
 Fyg1Y2ahKfq6qviJKUkD53lCuHk1k3zKVpR/Pwsji1uOLzyjVJZWglMeqQv0osl1YZHc
 Md/9/H4YgprYDx75zAzik5qDEZ6otQO7m0aFEoYMiQ1H3XzUHPrUN1fRUn8Yg3NRHaVZ
 0IIZMDK+jpCPKs3u/EzUI2DPJsThbJdN+n4MYgYzjVkMTCXVw49sAl+h+rtIwwGiUxs+
 0LyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Slr0gelwZw4Oh/4gWPELyOhNHNARtPxmQ7R/a3ryU4Y=;
 b=YHFuONqQiJJlW/kvbzDOHW+i9fCXpicV1upIQEV3mlLvsRpd3r7ioATkemdYho8aSN
 0AyGB9dWXq1zDLctJvs0xdecjY1ozjUu/A7NTEvSVhxYBk9k4D/PqG04R8HsWiyqkYcR
 NYIELi5A3Su9wVbT+C0kBzLdzGvWIV3VjpXDWaXISavHPjiL3OZHHvLL75wKQ//q6XsS
 d5C/iFcmFHCYGq3sP6BdPxkbhHCVVLlCsBRTOjLlDriSOXKK7QkQbaS0NQ76dJO5Zwmz
 nr0UCbXczxe+RLnCHb1l9T0t1zhpw00AW59WrpwEGjF5EMx3SRh4j7jFtyAC/We5y95P
 ElLg==
X-Gm-Message-State: AOAM530snkLgTn6GJf8q03if6RNAj3I1gZM3VCQfxJTk/RnPkK1I7QCn
 l10pBE4oqFvwtoHymxAX5KTNdQ==
X-Google-Smtp-Source: ABdhPJwsWI8SoVETCwIonGggGecOnyp490EvWrp+UftmkY7oTrGlCLUE5Xf6jiT0DG7/HUzSJHVvqg==
X-Received: by 2002:a17:90b:14cf:: with SMTP id
 jz15mr4617761pjb.180.1613664876288; 
 Thu, 18 Feb 2021 08:14:36 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id y13sm6714024pfc.28.2021.02.18.08.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 08:14:35 -0800 (PST)
Subject: Re: [PATCH] Correct CRIS TCG register lifetime management
To: =?UTF-8?Q?Stefan_Sandstr=c3=b6m?= <Stefan.Sandstrom@axis.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <A13A6E43-EEAF-4781-87E1-3295F698A85C@axis.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8b458c5d-9f96-b693-d203-a0d60bbc0603@linaro.org>
Date: Thu, 18 Feb 2021 08:14:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <A13A6E43-EEAF-4781-87E1-3295F698A85C@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 12:56 AM, Stefan Sandström wrote:
> From: Stefan Sandstrom <stefans@axis.com>
> 
> Add and fix deallocation of temporary TCG registers in CRIS code
> generation.
> 
> Change-Id: I17fce5d95bdc4418337ba885d53ba97afb1bafcc
> Signed-off-by: Stefan Sandstrom <stefans@axis.com>
> ---
> target/cris/translate.c         | 146 ++++++++++++++++++++++++++++++----------
> target/cris/translate_v10.c.inc |  70 ++++++++++++-------
> 2 files changed, 156 insertions(+), 60 deletions(-)
> 
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index c893f87..ae903a5 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -177,9 +177,13 @@ static inline void t_gen_mov_TN_preg(TCGv tn, int r)
> {
>     assert(r >= 0 && r <= 15);
>     if (r == PR_BZ || r == PR_WZ || r == PR_DZ) {
> -        tcg_gen_mov_tl(tn, tcg_const_tl(0));
> +        TCGv c0 = tcg_const_tl(0);
> +        tcg_gen_mov_tl(tn, c0);
> +        tcg_temp_free(c0);

In cases like this, you should just use tcg_gen_movi_tl(tn, 0).

>     } else if (r == PR_VR) {
> -        tcg_gen_mov_tl(tn, tcg_const_tl(32));
> +        TCGv c32 = tcg_const_tl(32);
> +        tcg_gen_mov_tl(tn, c32);
> +        tcg_temp_free(c32);

movi

> static void cris_lock_irq(DisasContext *dc)
> {
> +    TCGv c1 = tcg_const_tl(1);
>     dc->clear_locked_irq = 0;
> -    t_gen_mov_env_TN(locked_irq, tcg_const_tl(1));
> +    t_gen_mov_env_TN(locked_irq, c1);
> +    tcg_temp_free(c1);
> }

good.

> @@ -885,8 +891,10 @@ static void gen_tst_cc (DisasContext *dc, TCGv cc, int cond)
>     case CC_EQ:
>         if ((arith_opt || move_opt)
>                 && dc->cc_x_uptodate != (2 | X_FLAG)) {
> +            TCGv c0 = tcg_const_tl(0);
>             tcg_gen_setcond_tl(TCG_COND_EQ, cc,
> -                    cc_result, tcg_const_tl(0));
> +                    cc_result, c0);
> +            tcg_temp_free(c0);

setcondi

> -    tcg_gen_shl_tl(t0, cpu_R[dc->op2], tcg_const_tl(dc->zzsize));
> +    c = tcg_const_tl(dc->zzsize);
> +    tcg_gen_shl_tl(t0, cpu_R[dc->op2], c);

shli

> @@ -3023,14 +3083,16 @@ static unsigned int crisv32_decoder(CPUCRISState *env, DisasContext *dc)
>     /* Single-stepping ?  */
>     if (dc->tb_flags & S_FLAG) {
>         TCGLabel *l1 = gen_new_label();
> +        TCGv c = tcg_const_tl(3);
>         tcg_gen_brcondi_tl(TCG_COND_NE, cpu_PR[PR_SPC], dc->pc, l1);
>         /* We treat SPC as a break with an odd trap vector.  */
>         cris_evaluate_flags(dc);
> -        t_gen_mov_env_TN(trap_vector, tcg_const_tl(3));
> +        t_gen_mov_env_TN(trap_vector, c);

Here, you cannot lift the const allocation above the branch.
There are enough uses of t_gen_mov_env_TN with a constant that it would be
worthwhile creating a new function that takes the constant.


r~

