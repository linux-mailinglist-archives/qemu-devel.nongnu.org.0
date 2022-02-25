Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBEB4C51CE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:57:45 +0100 (CET)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjWx-0005Pk-St
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:57:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNid3-0007A9-EZ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:59:59 -0500
Received: from [2607:f8b0:4864:20::1031] (port=47100
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNid1-0007o7-AC
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:59:56 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so6010704pjw.5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 13:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WbZR7w8c2/1lV3w0UuerPHOpD72BimlftG8OCXGdpq4=;
 b=ZOmbYVt4uPryv7fL7mh8OwdjUy3Tp0sV8jXRN8K9B230m/0/1K5JBabr88Aa3f0w/k
 yrawgCcfZGadXl2u3+HbzZIrINbUcv7Y/YtSzQ6ks4wSBfZV37TGgBpYEXPAKPjfyAQV
 i5T3XFKvOPFlDA1e+qFEkCx6gzpMuQEphZ6zqJ03uExRQ4mpmeF0nwIkmbphBmaghGET
 JeidNXvFc6xsCKoypryQvO9HZL9ANhrm/ZETrmTWB/34l99jWDbgAhHRnp34HpLipgvN
 LK2Yw5paFT9TCwtOfCD8YQP1kg+/eUmUFkIm5nx1Fe0QADDJjs5AAicSYq0qoeUY2Xmy
 KY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WbZR7w8c2/1lV3w0UuerPHOpD72BimlftG8OCXGdpq4=;
 b=oEUfFimdkIBfCZ7H7nE+7E9tJbRod7++IuPd6hSpIZJmB2xcrH9wS6M57gJK3Bz09r
 Ord4/F2s80uoaBlxuAr9S/kziVdaOtNjHtyPCcMBSZ8DRa9GrHrOTD/Gs6yuMi7rPZsB
 AaGJt5ff4a1WoGsJeUTB9RyopxHikHafph0qBQATF2MMwJypw7G8eft7opHpQjjiHY7T
 jU/dheT934tMV4BSG8RLZIB1wkw53yOH0u3cxonZGz8q/N07LMqPNG6lehuJM0UJBELV
 gS8pHq49KJ9G++PNxRrvSKHceyS+l7d6/auyXwjS1Z9/2LOHkCWJzovhmafqOr1K2Zly
 0oAw==
X-Gm-Message-State: AOAM532AT2cyiGYentJ97QCXlIl1JKpUEGnZEkPHLLMMzs/gxR7lWtGY
 oOHObWgNtZBpWFckxkCMSB0eBw==
X-Google-Smtp-Source: ABdhPJzmpw18rIZffrotryZ0amsNJjJASsvIJ4nBTboosHt+Vd+e87oU/5ijMykMyzMyck20BCmqmQ==
X-Received: by 2002:a17:90a:7107:b0:1bc:89df:f6ce with SMTP id
 h7-20020a17090a710700b001bc89dff6cemr5136765pjk.69.1645826393206; 
 Fri, 25 Feb 2022 13:59:53 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 h7-20020a056a00218700b004e0314bc83csm4333937pfi.139.2022.02.25.13.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:59:52 -0800 (PST)
Message-ID: <65fc5273-6cf0-5f22-a11a-6a7c080b5931@linaro.org>
Date: Fri, 25 Feb 2022 11:59:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 35/49] target/ppc: Implement xxgenpcv[bhwd]m instruction
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <20220225210936.1749575-36-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225210936.1749575-36-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 2/25/22 11:09, matheus.ferst@eldorado.org.br wrote:
>   
> +#define XXGENPCV(NAME) \
> +static bool trans_##NAME(DisasContext *ctx, arg_X_imm5 *a)  \
> +{                                                           \
> +    TCGv_ptr xt, vrb;                                       \
> +                                                            \
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);                      \
> +    REQUIRE_VSX(ctx);                                       \
> +                                                            \
> +    if (a->imm & ~0x3) {                                    \
> +        gen_invalid(ctx);                                   \
> +        return true;                                        \
> +    }                                                       \
> +                                                            \
> +    xt = gen_vsr_ptr(a->xt);                                \
> +    vrb = gen_avr_ptr(a->vrb);                              \
> +                                                            \
> +    switch (a->imm) {                                       \
> +    case 0b00000: /* Big-Endian expansion */                \
> +        glue(gen_helper_, glue(NAME, _be_exp))(xt, vrb);    \
> +        break;                                              \
> +    case 0b00001: /* Big-Endian compression */              \
> +        glue(gen_helper_, glue(NAME, _be_comp))(xt, vrb);   \
> +        break;                                              \
> +    case 0b00010: /* Little-Endian expansion */             \
> +        glue(gen_helper_, glue(NAME, _le_exp))(xt, vrb);    \
> +        break;                                              \
> +    case 0b00011: /* Little-Endian compression */           \
> +        glue(gen_helper_, glue(NAME, _le_comp))(xt, vrb);   \
> +        break;                                              \
> +    }                                                       \
> +                                                            \
> +    tcg_temp_free_ptr(xt);                                  \
> +    tcg_temp_free_ptr(vrb);                                 \
> +                                                            \
> +    return true;                                            \
> +}
> +
> +XXGENPCV(XXGENPCVBM)
> +XXGENPCV(XXGENPCVHM)
> +XXGENPCV(XXGENPCVWM)
> +XXGENPCV(XXGENPCVDM)
> +#undef XXGENPCV

Suggestion:

typedef void (*xxgenpcv_genfn)(TCGv_ptr, TCGv_ptr);

static bool do_xxgenpcv(DisasContext *ctx, arg_X_imm5 *a,
                         xxgenpcv_genfn fn[4])
{
    ...
    fn[a->imm](xt, vrb);
    ...
}

#define XXGENPCV(NAME) \
     static bool trans_##NAME(...)
     {
         static const xxgenpcv_genfn fn[4] = {
             gen_helper_##NAME##_be_exp,
             gen_helper_##NAME##_be_comp,
             gen_helper_##NAME##_le_exp,
             gen_helper_##NAME##_le_comp,
         };
         return do_xxgenpcv(ctx, a, fn);
     }

For debugging purposes, prefer to put as little within giant macro expansion as possible.


r~

