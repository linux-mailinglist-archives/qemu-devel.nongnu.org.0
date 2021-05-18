Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7A2388125
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:14:00 +0200 (CEST)
Received: from localhost ([::1]:57986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj66J-0002pg-4u
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj643-0007lg-6Q
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:39 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:44712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj641-0005nl-E6
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:38 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so9746868otp.11
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i2TQn3oeB03o6w+0+AYofX63UxAaWekw7LEMDZ+xDUQ=;
 b=iMGTmFYwHW1NMUK/cby1CjF0iL97BsJHseC0nAZmRgWYJRK6WOAVwjCZ7oFshNXhac
 ux40kLJ+fee4wMa/yrohTBl5Q+IYm1ppcVA7QqnDl/HFt54khMozT4bbTicFwKNRwiQI
 hp+9EXsQL7qHuPKfo1d7OrFZWxdfT+TDu7ngFZmkXuY+ZI7zc1RQ8i/JEUwScwTvQDnp
 JwMiVHsaBoJkL21E6zWV6sUsB2cEKQLqpzCeOYAAUWhjwU1J5bwE5NW8tck2f8fwNmih
 ztKBAkd1RgGYfIsr6/MXr7KrQ90VWB0zAxbSnvvRbNbUneHJ4kLyRQp9rIzGj1e2Vf7t
 AgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i2TQn3oeB03o6w+0+AYofX63UxAaWekw7LEMDZ+xDUQ=;
 b=BzQIHAzmzDWi9gz0GlUInhixuIYD5YHRksAw3j9AA7iqXAO2xRxVUklXeV7cq5Ywj2
 CmOeFC3p7vnYYmN/4UV+0feV3pjL/WifBOnGaNuWLfSmL9nUzsjqbHZAPqbgGQDWDGCE
 bV6ximFd0Yp/t2t8wkk/J1DyTWJUZJdD1KmdeI7dbCBTc59i0Io1jnXawRflpBo9Mr2D
 GipfwmeQ/KXwGEhFcbbvozJRd/228dGs1cmhhRplro31WRYQtxgock+rh4bwz60l7dec
 jU4ZZwQFJZHIobnz+8JL8vqKa3U5kbwjrfWjwfXqueQp/1ljaO5GMR+u/iq4E63gUSM5
 MVvA==
X-Gm-Message-State: AOAM533IPEhIwwe0G80wRR5Uk2Fe4y9v4yR5xwsHwQJbmABada3VHI86
 oKPzl9pV8gGDIaccockjPH1uBQ==
X-Google-Smtp-Source: ABdhPJyWmDWWd1lTr79GUBNFfssbUl4NKONdNR6KlaBwJvm4b2Y8yRi26GbDG6tR2dSWzg5sStA9kQ==
X-Received: by 2002:a9d:3424:: with SMTP id v33mr5454430otb.137.1621368695649; 
 Tue, 18 May 2021 13:11:35 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id e11sm3978871ook.20.2021.05.18.13.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 13:11:35 -0700 (PDT)
Subject: Re: [PATCH v3] target/xtensa: clean up unaligned access
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20210517205259.13241-1-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <28fe6216-b6e7-36f8-cbd7-97a880ab0a44@linaro.org>
Date: Tue, 18 May 2021 15:11:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517205259.13241-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 3:52 PM, Max Filippov wrote:
> -static void gen_load_store_alignment(DisasContext *dc, int shift,
> -        TCGv_i32 addr, bool no_hw_alignment)
> +static MemOp gen_load_store_alignment(DisasContext *dc, int shift,
> +                                      TCGv_i32 addr, bool no_hw_alignment)
>   {
>       if (!option_enabled(dc, XTENSA_OPTION_UNALIGNED_EXCEPTION)) {
>           tcg_gen_andi_i32(addr, addr, ~0 << shift);
> -    } else if (option_enabled(dc, XTENSA_OPTION_HW_ALIGNMENT) &&
> -            no_hw_alignment) {
> -        TCGLabel *label = gen_new_label();
> -        TCGv_i32 tmp = tcg_temp_new_i32();
> -        tcg_gen_andi_i32(tmp, addr, ~(~0 << shift));
> -        tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, label);
> -        gen_exception_cause_vaddr(dc, LOAD_STORE_ALIGNMENT_CAUSE, addr);
> -        gen_set_label(label);
> -        tcg_temp_free(tmp);
> +    }
> +    if (!no_hw_alignment && option_enabled(dc, XTENSA_OPTION_HW_ALIGNMENT)) {
> +        return MO_UNALN;
> +    } else {
> +        return MO_ALIGN;
>       }
>   }
>   
> @@ -1784,10 +1770,11 @@ static void translate_l32e(DisasContext *dc, const OpcodeArg arg[],
>                              const uint32_t par[])
>   {
>       TCGv_i32 addr = tcg_temp_new_i32();
> +    MemOp al;
>   
>       tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
> -    gen_load_store_alignment(dc, 2, addr, false);
> -    tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->ring, MO_TEUL);
> +    al = gen_load_store_alignment(dc, 2, addr, false);
> +    tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->ring, MO_TEUL | al);

You're duplicating the information about the size of the alignment.

I think it would be better to pass the partial MemOp into 
get_load_store_alignment and return the complete MemOp.  E.g.:

MemOp gen_load_store_alignment(DisasContext *dc, MemOp mop,
                                TCGv addr)
{
     if ((mop & MO_SIZE) == MO_8) {
         return mop;
     }
     if ((mop & MO_AMASK) == 0 &&
         !option_enabled(dc, XTENSA_OPTION_HW_ALIGNMENT)) {
         mop |= MO_ALIGN;
     }

     if (!option_enabled(dc, XTENSA_OPTION_UNALIGNED_EXCEPTION)) {
         tcg_gen_andi_i32(addr, addr,
                          ~0 << get_alignment_bits(mop));
     }
     return mop;
}

Then used as

     mop = gen_load_store_alignment(dc, MO_TEUL, addr);
     tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->ring, mop);

     mop = gen_load_store_alignment(dc, MO_TEUL | MO_ALIGN, addr);
     gen_check_exclusive(dc, addr, false);
     tcg_gen_qemu_ld_i32(arg[0].out, addr, dc->ring, mop);

This organization does require that you remove TARGET_ALIGNED_ONLY=y from 
default-configs/targets/xtensa*.mak so that MO_ALIGN has the non-zero value.


r~

