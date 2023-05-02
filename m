Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A816F4794
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 17:49:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsF8-0002Kk-Gl; Tue, 02 May 2023 11:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsF5-0002BA-Qi
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:48:39 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsF2-0001bs-Ii
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:48:39 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3023a56048bso3720787f8f.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683042513; x=1685634513;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6Qo/LUDelhn0QdgxJF8+QM9YLGde9ISP7muHPzw9Pqc=;
 b=LdJbaj9pXDQJi4rNMZihIK6qNfhBAPEfe+nK46HkxosEBgi95pP8alym79AoImxHDi
 Oh664HmCoJD1Bm92hO7nGRNYFjlcl+HyuT8EEKYq3n6GpuDthNDsXKayGkxbw8AgvdFO
 +Oed72lx0TbIi8Npw4bg7kGbOA7g3O+KP0juGuzsYqIDr7L51una6VVAplqXr4YXLk0P
 EoDRI/mvGRhBnf8Jl8MGnJv8vQ+KP+LNLhxrNA8rSzTDm1vaz8GlRYOyr8AzLFvh24km
 xGmaTTaGgHa/RvkROOxRAGOABM+fuYxEWM+y9fgT6i93Ek85vjvNqmT4vri5FEnBHmvo
 i5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683042513; x=1685634513;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Qo/LUDelhn0QdgxJF8+QM9YLGde9ISP7muHPzw9Pqc=;
 b=g6rHiSHDo9Nx8jyRl2vdTs97m0ApQIvCt5fLacQn18mfqyh9J1e3MpvDGAqml3X+fg
 Fr2R0s7wpFI3u+yKwS6IAVRJFnKNsvNBr5cbbWAaqMfCQ9luP5+BTc3QXUqhDKv/Ffl0
 +lfDN9uQG1il5uoX57MhFtkdDPGEoyV7faEUN/qMMMsUNwvNYyyolIaT7K/y7sKnHtoI
 hEfnFADE9N3mwvYZTPFdif8s4r8Ok5jVBQECSAbaNnP3sfnRq6o5ufFJx+y3ktnL2GHq
 7ol/A++A+jztUeLb8RPGCY/0LsFQ2Kv1Xjj+d127ZopJbb+3gIoasyzCtBtnSm1jP0RZ
 8bhg==
X-Gm-Message-State: AC+VfDzbxvqc0/IQPsFxQFS/LV2xqLG0L8auz77lsbNDU2AqRR4FYcu8
 EhPIQ/bECtQK1RzfidBkG23Eww==
X-Google-Smtp-Source: ACHHUZ40NEH+VeRLKYlWLdUudNE0hpEozvQpu88i8CN1XUt3v7LaS849MmiprHodEAHPqLlIh62BSA==
X-Received: by 2002:a5d:4d46:0:b0:306:2f91:302e with SMTP id
 a6-20020a5d4d46000000b003062f91302emr4285139wru.21.1683042512797; 
 Tue, 02 May 2023 08:48:32 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a056000054500b002e5ff05765esm31654837wrf.73.2023.05.02.08.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 08:48:32 -0700 (PDT)
Message-ID: <31b4d915-b8ab-ec6e-45c4-36089b34fc40@linaro.org>
Date: Tue, 2 May 2023 16:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/9] target/Hexagon: Finish conversion to
 tcg_gen_qemu_{ld,st}_*
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
 <20230502135741.1158035-4-richard.henderson@linaro.org>
 <SN4PR0201MB8808A13255BC8104B407C816DE6F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB8808A13255BC8104B407C816DE6F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/2/23 16:27, Taylor Simpson wrote:
> 
> 
>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Tuesday, May 2, 2023 8:58 AM
>> To: qemu-devel@nongnu.org
>> Cc: mrolnik@gmail.com; edgar.iglesias@gmail.com; Taylor Simpson
>> <tsimpson@quicinc.com>; ale@rev.ng; anjo@rev.ng; laurent@vivier.eu;
>> philmd@linaro.org; jiaxun.yang@flygoat.com; david@redhat.com;
>> iii@linux.ibm.com; thuth@redhat.com; mark.cave-ayland@ilande.co.uk;
>> atar4qemu@gmail.com; jcmvbkbc@gmail.com
>> Subject: [PATCH 3/9] target/Hexagon: Finish conversion to
>> tcg_gen_qemu_{ld,st}_*
>>
>> Convert away from the old interface with the implicit MemOp argument.
>> Importantly, this removes some incorrect casts generated by idef-parser's
>> gen_load().
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/hexagon/macros.h                     | 14 ++++-----
>>   target/hexagon/genptr.c                     |  8 +++---
>>   target/hexagon/idef-parser/parser-helpers.c | 28 +++++++++---------
>>   target/hexagon/translate.c                  | 32 ++++++++++-----------
>>   4 files changed, 40 insertions(+), 42 deletions(-)
>>
>> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c index
>> 502c85ae35..244063b1d2 100644
>> --- a/target/hexagon/genptr.c
>> +++ b/target/hexagon/genptr.c
>> @@ -320,14 +320,14 @@ void gen_set_byte_i64(int N, TCGv_i64 result, TCGv
>> src)
>>
>>   static void gen_return(DisasContext *ctx, TCGv_i64 dst, TCGv src) @@ -
>> 1019,7 +1019,7 @@ static void gen_vreg_load(DisasContext *ctx, intptr_t
>> dstoff, TCGv src,
>>           tcg_gen_andi_tl(src, src, ~((int32_t)sizeof(MMVector) - 1));
>>       }
>>       for (int i = 0; i < sizeof(MMVector) / 8; i++) {
>> -        tcg_gen_qemu_ld64(tmp, src, ctx->mem_idx);
>> +        tcg_gen_qemu_ld_i64(tmp, src, ctx->mem_idx, MO_TEUQ);
>>           tcg_gen_addi_tl(src, src, 8);
>>           tcg_gen_st_i64(tmp, cpu_env, dstoff + i * 8);
> 
> Did you intend to leave the tcg_gen_st_i64 alone or should that be converted to tcg_gen_qemu_st64.
> 
> There's a tcg_gen_st8_i64 in vec_to_qvec.  Does that need to be converted?

No, those are host stores to env, not guest stores to guest memory.
Notice the lack of "qemu" in the function names.

> I'm curious if there's a better way to do a vector load (e.g., with tcg_gen_gvec_<something>) than a loop that does 8 bytes at a time.

The best you can do at the moment is tcg_gen_qemu_ld_i128.
But there's no gvec variant to load arbitrary vector lengths.


r~


