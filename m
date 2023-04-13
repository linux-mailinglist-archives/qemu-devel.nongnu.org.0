Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF996E0EFA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 15:39:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmxAK-00025h-2C; Thu, 13 Apr 2023 09:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmx9r-00021J-UN
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:38:40 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmx9p-0008Jt-5p
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:38:39 -0400
Received: by mail-wr1-x432.google.com with SMTP id s2so11023275wra.7
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 06:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681393113; x=1683985113;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o+WcdOAWFnJG4XF0mLS/lKLBh2fPhXqI6PpJavkjSw4=;
 b=zD7JANKC5oEr3vtjZeUVl1/LsnzlOBw1h6ACohDFvtrLUY2GW3DK6F6t6B4UYS2faK
 FlLCdNwUnGtUHKaIrRUWbl4jgyh+bFWTfU5oLH1SnpDIs9uyZGGbEemeLApfWFq5l6ok
 LfxDDjTa9gxNlTT68plKtMFgZT6MwH3IhtoHp3Nf8O6t0Yj7oXY+sJsL59i+j//sVRre
 tKMV5airRRAYOm4IoiUBqitH4aTggJOQw7sGqvBb1dAkqEsgPb35c3dYO3FjBr6sOkKg
 v9qFZrtMuP1jnO7YblstZM8l7tkNqP0qkKYMTIp4JmXltASXtA98Eq2DOjpa+I5CCtJ7
 Wzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681393113; x=1683985113;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o+WcdOAWFnJG4XF0mLS/lKLBh2fPhXqI6PpJavkjSw4=;
 b=bTRwkNFTSE7GB3rdSU4G5ifW6+bPZjJshKvzLo0sJrAUKHhfLfN56c2lY8Ry7sKt7A
 V6hZ5l5rMvl+fkLuWWTEWWVDi6EsLTsLnr75QPg7/cP1Iy/LLwvidOEtQWAVHlJ7sEZh
 3g1x2Lom9RAjENcqXV9DVNRr9ygvEn2+cfHY4dWYzgxUGos/7P9f32MQqCV7e4AB6p78
 coV+l4GDhA2nfl+JycGQgCxkE0c3D9RLBmYG+mghL3vXvtZB14ZrWEk12DnvKQxGAABB
 aCvRBMWsZTl53d3OXXEPco9ylI/gp26NC5z0fag+qvfe3QHU01hJSgBW0Fpk9spbdE/J
 PlhQ==
X-Gm-Message-State: AAQBX9eS2xFxVa8LOTKwFoU7LHsiplOfanYYy1PEAGPvqQY6a8o8P9Au
 MuhRboMFqDlx9+GynGHxtgdiEElsjqMahZ9Yqfg1scXD
X-Google-Smtp-Source: AKy350ZGTtIg3f/yplfSIYVt+B40hy1jlFhfF2O1t2nmPml40otr1DgVmoyfSoVXIBTJ6Sw/+9lpgQ==
X-Received: by 2002:a5d:6291:0:b0:2f4:215a:98c5 with SMTP id
 k17-20020a5d6291000000b002f4215a98c5mr1434729wru.70.1681393113022; 
 Thu, 13 Apr 2023 06:38:33 -0700 (PDT)
Received: from [10.1.0.53] ([62.72.67.132]) by smtp.gmail.com with ESMTPSA id
 f17-20020adff8d1000000b002ef222822d5sm1318958wrq.74.2023.04.13.06.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 06:38:32 -0700 (PDT)
Message-ID: <a3c6560e-1d7e-1703-b71f-9fbf55871966@linaro.org>
Date: Thu, 13 Apr 2023 12:06:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 38/44] target/loongarch: Implement vbitsel vset
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-39-gaosong@loongson.cn>
 <dc51342e-952c-c014-3b60-4dd751646468@linaro.org>
 <ac4562c5-ea37-d57a-b1dd-02b21af72985@loongson.cn>
 <f785b8f3-d7f3-a481-81c3-3603542a0111@linaro.org>
 <58a22259-8bf0-e3fc-720a-0d8d3872e8d3@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <58a22259-8bf0-e3fc-720a-0d8d3872e8d3@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 4/13/23 04:53, gaosong wrote:
> 
> 在 2023/4/12 下午2:53, Richard Henderson 写道:
>>
>>>>> +#define SETANYEQZ(NAME, BIT, E) \
>>>>> +void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
>>>>> +{                                                                   \
>>>>> +    int i; \
>>>>> +    bool ret = false;                                               \
>>>>> +    VReg *Vj = &(env->fpr[vj].vreg); \
>>>>> +                                                                    \
>>>>> +    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
>>>>> +        ret |= (Vj->E(i) == 0);                                     \
>>>>> + } \
>>>>> +    env->cf[cd & 0x7] = ret;                                        \
>>>>> +}
>>>>> +SETANYEQZ(vsetanyeqz_b, 8, B)
>>>>> +SETANYEQZ(vsetanyeqz_h, 16, H)
>>>>> +SETANYEQZ(vsetanyeqz_w, 32, W)
>>>>> +SETANYEQZ(vsetanyeqz_d, 64, D)
>>>>
>>>> These could be inlined, though slightly harder.
>>>> C.f. target/arm/sve_helper.c, do_match2 (your n == 0).
>>>>
>>> Do you mean an inline like trans_vseteqz_v or just an inline helper function?
>>
>> I meant inline tcg code generation, instead of a call to a helper.
>> But even if we keep this in a helper, see do_match2 for avoiding the loop over bytes. 
> Ok,
> e.g
> #define SETANYEQZ(NAME, MO)                                  \
> void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
> {                                                                 \
>      int i;                                                                \
>      bool ret = false; \
>      VReg *Vj = &(env->fpr[vj].vreg); \
> \
>      ret = do_match2(0, (uint64_t)Vj->D(0), (uint64_t)Vj->D(1), MO);              \
>      env->cf[cd & 0x7] = ret;      \
> }
> SETANYEQZ(vsetanyeqz_b, MO_8)
> SETANYEQZ(vsetanyeqz_h, MO_16)
> SETANYEQZ(vsetanyeqz_w, MO_32)
> SETANYEQZ(vsetanyeqz_d, MO_64)
> 
> and
> vsetanyeqz.b    $fcc5  $vr11
>    v11    : {edc0004d576eef5b, ec03ec0fec03ea47}
> ------------------
> do_match2
> bits is 8
> m1 is ec03ec0fec03ea47
> m0 is edc0004d576eef5b
> ones is 1010101
> sings is 80808080
> cmp1 is 0
> cmp0 is edc0004d576eef5b
> cmp1 is ec03ec0fec03ea47
> cmp0 is 10000
> cmp1 is 3000100
> ret is 0
> 
> but,  the results is not correct  for vsetanyeqz.b. :-)

Well, 'ones' as printed above is only 4 bytes instead of 8, similarly 'sings'.  That would 
certainly explain why it did not detect a zero in byte 5 of 'm0'.

Some problem with your conversion of that function?


r~

