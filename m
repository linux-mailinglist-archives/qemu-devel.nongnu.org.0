Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D6343870B
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 07:16:36 +0200 (CEST)
Received: from localhost ([::1]:58308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meVs3-0000OI-Qy
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 01:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meVq2-00081W-7L
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 01:14:30 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meVq0-0006An-JY
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 01:14:29 -0400
Received: by mail-pg1-x52b.google.com with SMTP id l186so1046486pge.7
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 22:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kW5GMqJ0yGKQTChEK2ArBcODoTUoLTpOiylCnOFFwz0=;
 b=tCv/HRq/iBhXJdW5BwOWcBN+Aut8cKbKegj2eSigxgijtSMtPbVG6tne9d0+6cHx2s
 G5aB8RIMghiikX3sijpLqpcbUWu6rthbHDmtf7fEdyD/dE6zcyeBPIYydG6ZmgQOWvDT
 BR/j/f/5QgBpmdueeXWdnQXdiGBrW/liJuO82lTn/G1hTMeIXJKap1SvF630izK7mCA1
 q7bXzEzXreQQXGQteLzE6aUlRuUjHzrzP/6R5sPqqSVby8JvQa5rjp5Cz8Wq+36zEtMT
 Y61snTcXp9lWpDli3HyCfooAayqtLWNOGUXEprG73AmUi3YpXH8bxWyv2uwBAJa2HFfl
 h9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kW5GMqJ0yGKQTChEK2ArBcODoTUoLTpOiylCnOFFwz0=;
 b=CsjT0H0NBwJmzSCQdrv9PjvKabLQlDhzgWAe3zHb+VHhLEvc9LrYcLvvm0EIYvLnjz
 R9vGn3GaPbuwkxLLibEDMleYUrfH04l7lvRxw+MWUE25HCgEqY6J1xwEOp6nQVcGUgiU
 0m3SgdnZ+xbwlX5Ijx0s7kqaVIGy92DPQt5vEaUWpZsVSdbn1ZBVez5azDVR1V0nI/uu
 hXBZaWl/MQi6F579gsM7IHJ62y3hLnz57c9Wjqenbsk2QJDSX4iwsgDb8QDX4YcI0prW
 tdcoBAa80uOEy88L30maBZVGH9v2sAqqmx2UcRaImHJVaxbvpVG+LzOyFwBU2k7tgvKm
 TQZQ==
X-Gm-Message-State: AOAM533uAlhZtvhzJRk0iTRATZTGZb4VP5Yejy8Km5+JZg3WO/fdDuHd
 a7rSKnODHgX+73TOC+EIYnH0aQ==
X-Google-Smtp-Source: ABdhPJyoiLDGLBpjdMkKkXenXsaSy7wKI68Mp/0F2ezFXcfIcPo2R3d4sVxsSUZbuhEK+19J2cGMtw==
X-Received: by 2002:a63:c101:: with SMTP id w1mr7539792pgf.53.1635052466767;
 Sat, 23 Oct 2021 22:14:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v11sm12141307pgf.69.2021.10.23.22.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 22:14:26 -0700 (PDT)
Subject: Re: [PATCH 18/33] target/mips: Convert MSA 2R instruction format to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-19-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf40705b-9172-a5fd-afaa-5ae44eba1164@linaro.org>
Date: Sat, 23 Oct 2021 22:14:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> +static bool trans_msa_2r(DisasContext *ctx, arg_msa_r *a,
> +                         void (*gen_msa_2r_b)(TCGv_ptr, TCGv_i32, TCGv_i32),
> +                         void (*gen_msa_2r_h)(TCGv_ptr, TCGv_i32, TCGv_i32),
> +                         void (*gen_msa_2r_w)(TCGv_ptr, TCGv_i32, TCGv_i32),
> +                         void (*gen_msa_2r_d)(TCGv_ptr, TCGv_i32, TCGv_i32))
>   {
> -#define MASK_MSA_2R(op)     (MASK_MSA_MINOR(op) | (op & (0x1f << 21)) | \
> -                            (op & (0x7 << 18)))
> -    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
> -    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
> -    uint8_t df = (ctx->opcode >> 16) & 0x3;
> -    TCGv_i32 twd = tcg_const_i32(wd);
> -    TCGv_i32 tws = tcg_const_i32(ws);
> +    TCGv_i32 twd = tcg_const_i32(a->wd);
> +    TCGv_i32 tws = tcg_const_i32(a->ws);

tcg_constant_i32.

Missing check_msa_access.

> +    switch (a->df) {
> +    case DF_BYTE:
> +        if (gen_msa_2r_b == NULL) {
> +            gen_reserved_instruction(ctx);
> +        } else {
> +            gen_msa_2r_b(cpu_env, twd, tws);

Why the null check?


r~

