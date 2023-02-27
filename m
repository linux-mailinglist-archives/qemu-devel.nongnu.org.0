Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DD56A3E2E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 10:21:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWZgX-0002h1-N4; Mon, 27 Feb 2023 04:20:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWZgJ-0002bn-IX
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:20:32 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWZgH-0004mM-Ld
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:20:26 -0500
Received: by mail-pj1-x1036.google.com with SMTP id x34so5469574pjj.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 01:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uwSuFKJnAnL7OPyfUA15m3jwukwHz8iMscS2BHfI2EE=;
 b=N7lfDI+ql40hE3RbnbV23mwLy1xLQtIWy9WVK289T4RdQ9ghAEzQ6Sz2q2Bo+fumDR
 5mBfbnFqTZq6O+SnRHUDVuI0uOuArw7bf7mj9pNdqBikozy5B98zXhDKzbBBUrNiHg/A
 BUM4owTN3o7TdJA+z8LW3gr61Puqx7GlmPLFZR4Qcn9vYgapz+skvdGjHA8smgcZuKSo
 CATut4UkQfK7Halh7XYj4qmO06JYNlF/n3PFvZiz+FzAA9nLa/askNTpRv/zMRGbBc6s
 si/yeParMzs/G3v4ird0k2+EFTpIV3zC+xwFcRnQhkmVp2t6yd4sj/l1aLIaxux64oRL
 HKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uwSuFKJnAnL7OPyfUA15m3jwukwHz8iMscS2BHfI2EE=;
 b=rRvI1hJzr9LR9FpIQwrXLnvR6BeChvUDEGXaFoFK/uqQIffpK8KytwxfL2MVZR5sKG
 Z5oo/Fpr1HJV3uMoPzDVUY2pFgMaTNBcA6y1KAky53zW9Fvi3pZo/LHf9zIBTV8obxJq
 wgHZ/GaqWtwPEA2QR0cLdmZtLmfBmUzANoK4DgHffgmpR/z0JCbF5wlzV8iEohAxhK2P
 K82z+LyUvumWatoZ8QH6QnTSnJBPHmZEn1hWWe1+5J7j/RigKrRvoL7Y7f4hf671qUu1
 Ufei+iYJqYet0lfzMSCmmKc0lf7lQPMT/i45jOnHFnZi2d0kf2bAEYKN+Ir/jBMKvg+o
 QLLQ==
X-Gm-Message-State: AO0yUKVj1AOVS4ZQdcPxrX5X2IDO3a6JHudkeg5z4GElmGj4COS76ltW
 Rion3h4UYn2FoxcYo7dbo22Apw==
X-Google-Smtp-Source: AK7set9LtMcv6Dobf6nbcmHoquKZnozt8QJkqP0blLRreY+jur0dCK34FRB9fJ04ZCBT+DgTTC8sYQ==
X-Received: by 2002:a05:6a20:3956:b0:bc:5a6:1b2a with SMTP id
 r22-20020a056a20395600b000bc05a61b2amr28425844pzg.49.1677489623819; 
 Mon, 27 Feb 2023 01:20:23 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 d7-20020aa78147000000b005ac419804d3sm3767243pfn.186.2023.02.27.01.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 01:20:23 -0800 (PST)
Message-ID: <5ac3c25f-8d4b-6aa3-5bc2-2b3abc22dce8@linaro.org>
Date: Sun, 26 Feb 2023 23:20:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 10/43] target/loongarch: Implement vaddw/vsubw
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-11-gaosong@loongson.cn>
 <268ef762-fce5-ca47-d5f7-bd60955a3a0f@linaro.org>
 <f5c0796d-62c9-691a-c2ba-e4dd9e654831@loongson.cn>
 <e75fd2b7-9955-ad2b-62d2-30d7b85d7e7b@linaro.org>
 <f484b933-8f9f-6f0b-0d81-7202bed31d83@loongson.cn>
 <1ad204fc-8f7e-0f1c-e8f6-163d11f3880b@linaro.org>
 <c795a157-21a8-a8d7-bbc1-ed33e7f32747@loongson.cn>
 <c5913a52-e5de-4fb5-688c-6d3fb3215353@linaro.org>
 <d052497f-fc2c-17ab-d455-f0a1727b422d@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d052497f-fc2c-17ab-d455-f0a1727b422d@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/26/23 23:14, gaosong wrote:
> like this:
> the vece is MO_32.
> static void gen_vaddwev_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
> {
>      TCGv_vec t1 = tcg_temp_new_vec_matching(a);
>      TCGv_vec t2 = tcg_temp_new_vec_matching(b);
>      int halfbits = 4 << vece;
>      tcg_gen_shli_vec(vece, t1, a, halfbits);
>      tcg_gen_shri_vec(vece, t1, t1, halfbits);
> 
>      tcg_gen_shli_vec(vece, t2, b,  halfbits);
>      tcg_gen_shri_vec(vece, t2, t2, halfbits);
> 
>      tcg_gen_add_vec(vece, t, t1, t2);
> 
>      tcg_temp_free_vec(t1);
>      tcg_temp_free_vec(t2);
> }
> ...
>         op[MO_16];
>          {
>              .fniv = gen_vaddwev_s,
>              .fno = gen_helper_vaddwev_w_h,
>              .opt_opc = vecop_list,
>              .vece = MO_32
>          },
> ...
> TRANS(vaddwev_w_h, gvec_vvv, MO_16, gvec_vaddwev_s)
> 
> input :     0x ffff fffe ffff fffe  ffff fffe ffff fffe  + 0
> output :    0x 0000 fffe 0000 fffe  0000 fffe 0000 fffe
> correct is  0xffffffffefffffffefffffffe       ffff fffe.

sari above, not shri, for sign-extension.


r~

