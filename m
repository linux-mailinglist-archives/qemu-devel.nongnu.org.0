Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5A531A8C2
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 01:26:20 +0100 (CET)
Received: from localhost ([::1]:48092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAilO-00009T-Vq
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 19:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAik0-0008Ad-TA
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 19:24:52 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAijz-0007W6-FE
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 19:24:52 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l12so1421001wry.2
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 16:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ikYmm3lm9yqaCT3KwXFQe7jNRYZH27jj33DLTBTpqNA=;
 b=LMlH+ec8OZHSab0OUSrdzrew8bJsyrxv6yrArUPd82tsbJBr9RCzAzAo2qLed2ADyU
 iyhPWflk5yfULYUIMYNiEgLHC1Dq3EaFwMCDi/w/6Ml3FV/QtGDF7qx3nP8xh5ILoeVB
 36mwSKhaI+3s7RYDaJIW4S/0OBDL8oEFYF1CO8ljeVj7nRTtMqW38wABVtob0Lrn7l4b
 rMBiEgmlXi8XE1DtUkzvSIeB3+CZcUoDD5xV7Xs0YwXR/YEUHLlcwrbeX7wIr+2moryV
 5QLFUtkVm9pVr97pz3TmXvyFxQDDQnkbEy7QKmjvMY/HZN/EW+tiqRqFviYmgs3oOp8y
 pXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ikYmm3lm9yqaCT3KwXFQe7jNRYZH27jj33DLTBTpqNA=;
 b=kZc1vf8b0tEGewV55TmXWd4DlGLrzMSN4ar36FyBWYlQECo1wxcagn7b0O9758QTd/
 35D9whoII00CQXSBdUGTC+G6MGXW4zEXlO1nMNg2QIKa1FCT+tEtNjwbyxPT+5dDUfHP
 5F4G858Szx3H2R0K8zz78ssR8j6/HyH/l1Ibh8ICDMVvN2C6SHC6cg+u7bXs2RPyfmUH
 yBWk+4OwAlKwSfbgFzeDVs/XBM8EU1U7hssnxIUT9G4fKzC0GWJeNpiid3hmcYk1f/So
 hfYB1nwGBcxqW6r3uSjz7ZyWpar/ZKqgQzmjBGiQ8GDm8QcXggT3Grvdc+s0FH9CetgK
 TgAg==
X-Gm-Message-State: AOAM531WRVNvudy6qjYr0XDesWzU2fcAk+viUwqGctSjwD23tJQULw3Q
 6VWAF0lZ31WTVxVRVjonktw=
X-Google-Smtp-Source: ABdhPJxQE5IW+vkQMdURH9RTlW0vcX6V4zndRu8ZXTTPItyhURkfvN4/tMCmvIajGM86B/vhvmL66w==
X-Received: by 2002:a05:6000:186f:: with SMTP id
 d15mr6200705wri.237.1613175889782; 
 Fri, 12 Feb 2021 16:24:49 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f8sm12343472wrp.65.2021.02.12.16.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 16:24:49 -0800 (PST)
Subject: Re: [PATCH] target/mips/translate: Simplify PCPYH using deposit_i64()
To: qemu-devel@nongnu.org
References: <20210213001901.75562-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <06698edb-1734-3732-07d0-1ae4b180f9af@amsat.org>
Date: Sat, 13 Feb 2021 01:24:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210213001901.75562-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fredrik Noring <noring@nocrew.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/13/21 1:19 AM, Philippe Mathieu-Daudé wrote:
> Simplify the PCPYH (Parallel Copy Halfword) instruction by using
> multiple calls to deposit_i64() which can be optimized by some
> TCG backends.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 36 ++++++------------------------------
>  1 file changed, 6 insertions(+), 30 deletions(-)
> 
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index a5cf1742a8b..5b31aa44f30 100644
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
> +                                cpu_gpr[rd], cpu_gpr[rd], 8 * i, 8);
> +            tcg_gen_deposit_i64(cpu_mmr[rd],
> +                                cpu_mmr[rd], cpu_mmr[rd], 8 * i, 8);

Oops sorry disregard this patch, wrong opcode.

