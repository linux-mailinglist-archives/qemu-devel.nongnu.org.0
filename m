Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAD92FF569
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:08:00 +0100 (CET)
Received: from localhost ([::1]:52042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gFL-00038V-Hr
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2gDm-0001XQ-Vi
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:06:22 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2gDk-0005yz-Tl
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:06:22 -0500
Received: by mail-pg1-x530.google.com with SMTP id p18so2056312pgm.11
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ed9OKZq5C/pqa4vrdaS739MdUVWu3HbGHQkwf+0LiLg=;
 b=DaeV3EAidaAZ5hJoLpmrJVYauWqtGNv6YNBnub85rrABXr0/x68rDbXoOvk3OGq+jY
 biaO1CcQ0+iUbYJSVjHszSs5PTh3L3obNcQHrOaulwSYvNqobTxd6lyEda6Yxd81rjk6
 pgH85zyL3P0SDf2k/CqO0V1kwoCqt2NRPmrXWP6ZbPTJN4UkFU5ILgEhsp7Cdj60rgGv
 M0E9LeVmZfzb3dnvuhNiBqc+T+UDM71c+ZkhY+hLv9odSE4N86hATcz2qANgOgD8fwwI
 8sfHFYCFNHMk78sxQewtsQja6I9bIiZvHnrV+68A015T+gRRA97aShzBkWK9uS4mg+kd
 r+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ed9OKZq5C/pqa4vrdaS739MdUVWu3HbGHQkwf+0LiLg=;
 b=qL92qTCPUDjM8Jo/kA3v96UKZSkxBtZC5miSJeptVp1zAae72mPIUzF4WrQS6Ty8ui
 1cyf+ZWZwmJRgmFB6BggMDxaa0cB9Bb5rXE0mSPVEcv7luCivX7hELqw2Tn4QQCTp3gj
 a1JrmPc+rO1EUP0wlDO+xiotFAyMGwtBPZe9qeMk/N4rDfOOZz2u/gNoBlakC/r0z8cq
 b77Gpfv0nUT1hRWffUChMmD2p5A6CH0gfJKpc9Ssg4IyUA9WiX651kWuoO1Xg4M7jk+Y
 EjX7cUF2ur7QJu5bs0AGTm4zEZtEiV6ig5qLn81dIkgrujfKra8cy7dRdhBNYdHCM16p
 nX1Q==
X-Gm-Message-State: AOAM533Ng7cOpJ7dsvP8U1mLGCmGFb0FGPV0oQxwl2VZSBA5dZgJDkRe
 o410cVWysxOzSnICLaMC0eZV2w==
X-Google-Smtp-Source: ABdhPJy0gj4tPF/f/ZigD+gUNScyvO7Cv5npj0ctvhMum5BLbJLUheaDQ/1X2Wm54B1uFaExHfwjlg==
X-Received: by 2002:a62:7c4e:0:b029:1b6:8641:1fb2 with SMTP id
 x75-20020a627c4e0000b02901b686411fb2mr1092476pfc.10.1611259579202; 
 Thu, 21 Jan 2021 12:06:19 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id z3sm6144948pgs.61.2021.01.21.12.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 12:06:17 -0800 (PST)
Subject: Re: [PATCH 6/6] target/mips: Convert Loongson [D]MULT[U].G opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <20210112215504.2093955-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa2c30c2-deaf-29d4-b166-81690d5443d6@linaro.org>
Date: Thu, 21 Jan 2021 10:06:14 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112215504.2093955-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 11:55 AM, Philippe Mathieu-Daudé wrote:
> Convert the following opcodes to decodetree:
> 
> - MULT.G - multiply 32-bit signed integers
> - MULTU.G - multiply 32-bit unsigned integers
> - DMULT.G - multiply 64-bit signed integers
> - DMULTU.G - multiply 64-bit unsigned integers
> 
> Now that all opcodes from the extension have been converted, we
> can remove completely gen_loongson_integer() and its 2 calls in
> decode_opc_special2_legacy() and decode_opc_special3_legacy().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/godson2.decode    |  5 ++
>  target/mips/loong-ext.decode  |  5 ++
>  target/mips/loong_translate.c | 58 ++++++++++++++++++++++
>  target/mips/translate.c       | 92 +----------------------------------
>  4 files changed, 70 insertions(+), 90 deletions(-)
> 
> diff --git a/target/mips/godson2.decode b/target/mips/godson2.decode
> index 805452fa975..cf12d9072ec 100644
> --- a/target/mips/godson2.decode
> +++ b/target/mips/godson2.decode
> @@ -13,6 +13,11 @@
>  
>  @rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &muldiv
>  
> +MULT.G          011111 ..... ..... ..... 00000 011000   @rs_rt_rd
> +MULTU.G         011111 ..... ..... ..... 00000 011001   @rs_rt_rd
> +DMULT.G         011111 ..... ..... ..... 00000 011100   @rs_rt_rd
> +DMULTU.G        011111 ..... ..... ..... 00000 011101   @rs_rt_rd
> +
>  DIV.G           011111 ..... ..... ..... 00000 011010   @rs_rt_rd
>  DIVU.G          011111 ..... ..... ..... 00000 011011   @rs_rt_rd
>  DDIV.G          011111 ..... ..... ..... 00000 011110   @rs_rt_rd
> diff --git a/target/mips/loong-ext.decode b/target/mips/loong-ext.decode
> index b0715894ee1..2281afaad95 100644
> --- a/target/mips/loong-ext.decode
> +++ b/target/mips/loong-ext.decode
> @@ -14,6 +14,11 @@
>  
>  @rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &muldiv
>  
> +MULT.G          011100 ..... ..... ..... 00000 010000   @rs_rt_rd
> +DMULT.G         011100 ..... ..... ..... 00000 010001   @rs_rt_rd
> +MULTU.G         011100 ..... ..... ..... 00000 010010   @rs_rt_rd
> +DMULTU.G        011100 ..... ..... ..... 00000 010011   @rs_rt_rd
> +
>  DIV.G           011100 ..... ..... ..... 00000 010100   @rs_rt_rd
>  DDIV.G          011100 ..... ..... ..... 00000 010101   @rs_rt_rd
>  DIVU.G          011100 ..... ..... ..... 00000 010110   @rs_rt_rd
> diff --git a/target/mips/loong_translate.c b/target/mips/loong_translate.c
> index 50609ce4178..2af94535921 100644
> --- a/target/mips/loong_translate.c
> +++ b/target/mips/loong_translate.c
> @@ -263,6 +263,64 @@ static bool trans_DMODU_G(DisasContext *s, arg_muldiv *a)
>      return gen_lext_MODU_G(s, a->rt, a->rs, a->rd, true);
>  }
>  
> +static bool gen_lext_MULT_G(DisasContext *s, int rd, int rs, int rt,
> +                            bool is_double, bool is_unsigned)
> +{
> +    TCGv t0, t1;
> +
> +    if (is_double) {
> +        if (TARGET_LONG_BITS != 64) {
> +            return false;
> +        }
> +        check_mips_64(s);
> +    }
> +
> +    if (rd == 0) {
> +        /* Treat as NOP. */
> +        return true;
> +    }
> +
> +    t0 = tcg_temp_new();
> +    t1 = tcg_temp_new();
> +
> +    gen_load_gpr(t0, rs);
> +    gen_load_gpr(t1, rt);
> +
> +    if (is_unsigned && !is_double) {
> +        tcg_gen_ext32u_tl(t0, t0);
> +        tcg_gen_ext32u_tl(t1, t1);
> +    }

While this is a faithful conversion of the existing code, these extensions make
no difference to the result.  They are redundant with

> +    tcg_gen_mul_tl(cpu_gpr[rd], t0, t1);
> +    if (!is_double) {
> +        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);

this one, which discards any bit that might have been set by the input bits
that are cleared.

There is no actual difference between MULT.G and MULTU.G, or DMULT.G and
DMULTU.G, because they don't record the most significant bits of the infinite
result in any way.

> +static bool trans_MULT_G(DisasContext *s, arg_muldiv *a)
> +{
> +    return gen_lext_MULT_G(s, a->rt, a->rs, a->rd, false, false);
> +}
> +
> +static bool trans_MULTU_G(DisasContext *s, arg_muldiv *a)
> +{
> +    return gen_lext_MULT_G(s, a->rt, a->rs, a->rd, false, true);
> +}
> +
> +static bool trans_DMULT_G(DisasContext *s, arg_muldiv *a)
> +{
> +    return gen_lext_MULT_G(s, a->rt, a->rs, a->rd, true, false);
> +}
> +
> +static bool trans_DMULTU_G(DisasContext *s, arg_muldiv *a)
> +{
> +    return gen_lext_MULT_G(s, a->rt, a->rs, a->rd, true, true);
> +}

So... if you want to clean this up afterward, or before is up to you.


r~

