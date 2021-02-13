Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D169031A91A
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 01:58:26 +0100 (CET)
Received: from localhost ([::1]:41228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAjGT-0003EJ-Bb
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 19:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAjEb-0002pA-3s
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 19:56:29 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:33926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAjEZ-0004TB-G2
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 19:56:28 -0500
Received: by mail-pg1-x52a.google.com with SMTP id o7so754271pgl.1
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 16:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v/Eq/FY+YvYKZliaV9GBXYLdkYcxAEwYGSXHYvCCWHY=;
 b=wnXsQYceH3igVsIS5jDxEq+wN7kZGEbbLKVvplmofOPeiuJ+uB+FBvvrxPwV8jOY6q
 MV4wvnEOQP2s6r4JIyz7RewRhxo4euBvForOw8IFx9XYY5SM5x4ERJzzis4YBowR1Wpp
 q3wyJ91yspYqT660CWkbroDjQET6+d+tt5SsOsxQQB26PJfj6agegBa77MjXndyOgg0I
 4GzzgnP1tHEkpG6H0319oQUfu6WXg4Hq/B97QWwXi3eA+E8sEY80WPu0a++KuTlXOfuN
 qJHeypCdKYIGythe5upMTmpxMUfs8qfdFTJqN8b8DEgqpxy0FUS2iPLSeX/ZD5GVvkt7
 QCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v/Eq/FY+YvYKZliaV9GBXYLdkYcxAEwYGSXHYvCCWHY=;
 b=KYeYT4gBne2Y6cI3er1yCc3TIb2AK9wvNZP7yOxMAywyo8FG69aghsptaUCSODwadP
 ZKOxNPdUF8hPt4E/8VxCW/D+Gei3qNfBIGueCKncqS0nXA5FK6yjdrtCOt8oT1mC8ILt
 4/ImdnNiTu0iWmtwJXPo7+7iPfoWTkyezGGz8502zRdfMQBPLdjzQ6QjCAH2FVAT1AAR
 5d4Hz1GKpgNW04E4hHsknH2Uuup+KGJMdNtaejdASrwj2x0fWs/XIS2/MAJuizsYwRuR
 nttoKwQXkDeo9DQdxqhpekaObKy4EvYSsYW/iDBfTEMCinovbrzzvwBxHnW7vxEqeiYM
 DByg==
X-Gm-Message-State: AOAM531dkA/HPj2cnZTF6K4RrdjUeee7C3IKq6aD7eK4EZphTDmeTgoJ
 fyFbZ0PZVXrKWwXdGs6sziU8aQ==
X-Google-Smtp-Source: ABdhPJyKsDsLFBW628aBzq0h7tT+OR5NtBO2YaFRbpFhIHJQnOmYNf/I/RjWUHRmHS9p87kg9GLbKw==
X-Received: by 2002:a62:868f:0:b029:1ea:306c:84a2 with SMTP id
 x137-20020a62868f0000b02901ea306c84a2mr2531941pfd.16.1613177783447; 
 Fri, 12 Feb 2021 16:56:23 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 y7sm9320068pfl.127.2021.02.12.16.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 16:56:22 -0800 (PST)
Subject: Re: [PATCH v2] target/mips/translate: Simplify PCPYH using
 deposit_i64()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210213002639.77681-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d4ce629d-7e1d-b852-0dca-1707a471a03a@linaro.org>
Date: Fri, 12 Feb 2021 16:56:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210213002639.77681-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.119,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fredrik Noring <noring@nocrew.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 4:26 PM, Philippe Mathieu-Daudé wrote:
> Simplify the PCPYH (Parallel Copy Halfword) instruction by using
> multiple calls to deposit_i64() which can be optimized by some
> TCG backends.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Send the Halfword version :)
> ---
>  target/mips/translate.c | 36 ++++++------------------------------
>  1 file changed, 6 insertions(+), 30 deletions(-)
> 
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index a5cf1742a8b..ddae26009dd 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -24786,36 +24786,12 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
>          tcg_gen_movi_i64(cpu_gpr[rd], 0);
>          tcg_gen_movi_i64(cpu_mmr[rd], 0);
>      } else {
> -        TCGv_i64 t0 = tcg_temp_new();
> -        TCGv_i64 t1 = tcg_temp_new();
> -        uint64_t mask = (1ULL << 16) - 1;
> -
> -        tcg_gen_andi_i64(t0, cpu_gpr[rt], mask);
> -        tcg_gen_movi_i64(t1, 0);
> -        tcg_gen_or_i64(t1, t0, t1);
> -        tcg_gen_shli_i64(t0, t0, 16);
> -        tcg_gen_or_i64(t1, t0, t1);
> -        tcg_gen_shli_i64(t0, t0, 16);
> -        tcg_gen_or_i64(t1, t0, t1);
> -        tcg_gen_shli_i64(t0, t0, 16);
> -        tcg_gen_or_i64(t1, t0, t1);
> -
> -        tcg_gen_mov_i64(cpu_gpr[rd], t1);
> -
> -        tcg_gen_andi_i64(t0, cpu_mmr[rt], mask);
> -        tcg_gen_movi_i64(t1, 0);
> -        tcg_gen_or_i64(t1, t0, t1);
> -        tcg_gen_shli_i64(t0, t0, 16);
> -        tcg_gen_or_i64(t1, t0, t1);
> -        tcg_gen_shli_i64(t0, t0, 16);
> -        tcg_gen_or_i64(t1, t0, t1);
> -        tcg_gen_shli_i64(t0, t0, 16);
> -        tcg_gen_or_i64(t1, t0, t1);
> -
> -        tcg_gen_mov_i64(cpu_mmr[rd], t1);
> -
> -        tcg_temp_free(t0);
> -        tcg_temp_free(t1);
> +        for (int i = 0; i < 4; i++) {
> +            tcg_gen_deposit_i64(cpu_gpr[rd],
> +                                cpu_gpr[rd], cpu_gpr[rd], 16 * i, 16);
> +            tcg_gen_deposit_i64(cpu_mmr[rd],
> +                                cpu_mmr[rd], cpu_mmr[rd], 16 * i, 16);

Missing rt in the replacement.

To make 4 identical copies, make use of previous inserts:

  tcg_gen_deposit_i64(rd, rt, rt, 16, 48);
  tcg_gen_deposit_i64(rd, rd, rd, 32, 32);


r~

