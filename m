Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E047344D487
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:58:52 +0100 (CET)
Received: from localhost ([::1]:47976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6r6-0005EM-2W
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:58:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml6nQ-0007EO-Fy
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:55:05 -0500
Received: from [2a00:1450:4864:20::433] (port=41960
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml6nO-0008NQ-Em
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:55:04 -0500
Received: by mail-wr1-x433.google.com with SMTP id d3so8798511wrh.8
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 01:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yAEFA9cjRCnoSrjb0t+S70SJZGtyL6ZMEMcONoc8zKA=;
 b=wllVAGlk8H06uB9NzTcP5h4P859GgTmxPMPoltqvp+/nL8DLapA/8xY02p/cGHDySL
 n7teenUpLGkuuPbTI8cRa3U4TBR/OJl269PWHRXbPT+KnQHUp/FAaDRTeyy9nL0BcRxQ
 s5/kIwM79wya4zQPyz9fKdnkDDcD0vyiSwem5umAXWw90Fvfm4q4xUTzrH2M8N0NQK0m
 lXm3LtjV6Y2OQ752WPzYhMX1h6sXV7jcx/va2PGsfYDnvzarx1owe9Jp3W98cdHddqAj
 la2iphq1YomZ7CyiTqW7s9vvmE2A3lBYtUVB5IbX8f04MvU1owzwpSIiVbe8dwU9rw2s
 a03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yAEFA9cjRCnoSrjb0t+S70SJZGtyL6ZMEMcONoc8zKA=;
 b=x1tPWuofLKTTWS0/v+12nOgHJk8jWJZQs5lLy5HH/08w9M7FKC4xcQPQ8c92hCL7iY
 lRS1oLYeJv6aURZenDmRJBYqwPwDM3T+yX1BBGYzN409noDdZGBgrM8zf3RBXxd7fDpF
 NYsFuiLoLveYAQ9jJeDChyEGB+Bcc/ISxLUJHqkxXI72yIoAbdr2doJXB21hkP8Z5d2h
 dA5MyptmAXMtYJonpPvzI2idJq6oSQAMZpqw+n07sD2jd9jqW9/ManYpZdv+Hrirhxnn
 7uNfwTk70RLBWVIct+91s5T1Qe1jLc5QLCyYkqqCLkRY/mj+5kNFsmtWvhIDyUjLxLyG
 E3Kw==
X-Gm-Message-State: AOAM532MSTtliw0jVb+1mn6f7NsRcK/BMoiWx+n4vCVSbrXCsVtA42sD
 QN/e7wO8DY4YeafuJKDbJqHzqw==
X-Google-Smtp-Source: ABdhPJw3F1Xb8gmGrKQFF98Zo+/cEfZOId0UWrwcK9ammHYHb/Q1OuHixR6e8LdN3WYFNcs8SSLnCA==
X-Received: by 2002:a5d:584e:: with SMTP id i14mr7565082wrf.386.1636624500896; 
 Thu, 11 Nov 2021 01:55:00 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id z11sm2425128wrt.58.2021.11.11.01.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 01:55:00 -0800 (PST)
Subject: Re: [PATCH 2/3] target/ppc: Implement Vector Extract Mask
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211110185613.550946-1-matheus.ferst@eldorado.org.br>
 <20211110185613.550946-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a6cdc57c-5a63-f567-a587-6b95f3ae2b65@linaro.org>
Date: Thu, 11 Nov 2021 10:54:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110185613.550946-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 7:56 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vextractbm: Vector Extract Byte Mask
> vextracthm: Vector Extract Halfword Mask
> vextractwm: Vector Extract Word Mask
> vextractdm: Vector Extract Doubleword Mask
> vextractqm: Vector Extract Quadword Mask
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  6 ++
>   target/ppc/translate/vmx-impl.c.inc | 85 +++++++++++++++++++++++++++++
>   2 files changed, 91 insertions(+)
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 9a28f1d266..639ac22bf0 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -419,6 +419,12 @@ VEXPANDWM       000100 ..... 00010 ..... 11001000010    @VX_tb
>   VEXPANDDM       000100 ..... 00011 ..... 11001000010    @VX_tb
>   VEXPANDQM       000100 ..... 00100 ..... 11001000010    @VX_tb
>   
> +VEXTRACTBM      000100 ..... 01000 ..... 11001000010    @VX_tb
> +VEXTRACTHM      000100 ..... 01001 ..... 11001000010    @VX_tb
> +VEXTRACTWM      000100 ..... 01010 ..... 11001000010    @VX_tb
> +VEXTRACTDM      000100 ..... 01011 ..... 11001000010    @VX_tb
> +VEXTRACTQM      000100 ..... 01100 ..... 11001000010    @VX_tb
> +
>   # VSX Load/Store Instructions
>   
>   LXV             111101 ..... ..... ............ . 001   @DQ_TSX
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index 58aca58f0f..c6a30614fb 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -1539,6 +1539,91 @@ static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
>       return true;
>   }
>   
> +static bool do_vextractm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
> +{
> +    const uint64_t elem_length = 8 << vece, elem_num = 15 >> vece;
> +    int i = elem_num;
> +    uint64_t bit;
> +    TCGv_i64 t, b, tmp, zero;
> +
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +    REQUIRE_VECTOR(ctx);
> +
> +    t = tcg_const_i64(0);
> +    b = tcg_temp_new_i64();
> +    tmp = tcg_temp_new_i64();
> +    zero = tcg_constant_i64(0);
> +
> +    get_avr64(b, a->vrb, true);
> +    for (bit = 1ULL << 63; i > elem_num / 2; i--, bit >>= elem_length) {
> +        tcg_gen_shli_i64(t, t, 1);
> +        tcg_gen_andi_i64(tmp, b, bit);
> +        tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, zero);
> +        tcg_gen_or_i64(t, t, tmp);
> +    }

This is over-complicated.  Shift b into the correct position, isolate the correct bit, or 
it into the result.

     int ele_width = 8 << vece;
     int ele_count_half = 8 >> vece;

     tcg_gen_movi_i64(r, 0);
     for (int w = 0; w < 2; w++) {
         get_avr64(v, a->vrb, w);

         for (int i = 0; i < ele_count_half; ++i) {
             int b_in = i * ele_width - 1;
             int b_out = w * ele_count_half + i;

             tcg_gen_shri_i64(t, v, b_in - b_out);
             tcg_gen_andi_i64(t, t, 1 << b_out);
             tcg_gen_or_i64(r, r, t);
         }
     }
     tcg_gen_trunc_i64_tl(gpr, r);


> +TRANS(VEXTRACTBM, do_vextractm, MO_8)
> +TRANS(VEXTRACTHM, do_vextractm, MO_16)
> +TRANS(VEXTRACTWM, do_vextractm, MO_32)
> +
> +static bool trans_VEXTRACTDM(DisasContext *ctx, arg_VX_tb *a)

Should be able to use the common routine above as well.


r~

