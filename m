Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBD76D9DFA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 18:53:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkSqc-0002T0-Mi; Thu, 06 Apr 2023 12:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkSqa-0002Sg-AU
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 12:52:28 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkSqY-0006g1-LE
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 12:52:28 -0400
Received: by mail-pl1-x629.google.com with SMTP id ja10so38048129plb.5
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680799945;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ECLNFNiUOrehBbQyuYRnMNzI4RuVIwGr4QcULm0zS2k=;
 b=XDbA8QiUQUPp0qahs6UpyhfQUw/fm85bavOTDHu+amvfOQJZbcD0CITqWYgrItnK4U
 dwK7HhmXweP5OwMfN7iQK82nZ5EM4PWwcF3tukqoIlTWVQOYrSVggJeYaGX30SukqAoV
 FGLMIFoWRG2F2pdngzfkWqNPwn105HnmU6XJklCwY+AnFfzCEtssZENC1Xou8JDmRtgQ
 5egV1MfYk4BSounnRRlnNY/R/Fw9aWB5IUHurwtcWpQnyqNheyVVdvIdSQBOrTcTlfyb
 TPfTY/LNIte2KIkRkXV8FagCX7f4U4QqHEGzsolnji/uj/vxFtdq63qmUBQ1VqLrq1pk
 oTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680799945;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ECLNFNiUOrehBbQyuYRnMNzI4RuVIwGr4QcULm0zS2k=;
 b=Yfp3IRBP0vjgDeXM2hot+aZJXktYoKX9XWCPpOhf0+f3u9kCots4EGk4zMUB/5Yh4F
 oNT3d/bMTtI8PVO8aKKDee6g7QJPf9sKinBcxI6dxTaai3VhA9gX24FpP5pxbI6dwKlo
 EliCPjzYmz48rZlCG/EJfcn3vLncUwGU8ZSi+VFEzW7B7lSSnQrk7skCOt0Y/0HGNZag
 uUsMdcEg93FN+ek5vHtBzxifDGK3ZUboMBhnr2/5QG9HnejDmpQhw4qcSU+WlH4o9kFV
 GcxKEZwLD45gll8jeK9dhT8L29kqw2YLEmQQ5szA6ZJH/n4RBJLyxz/i9XNy6ym2aH/L
 CE0g==
X-Gm-Message-State: AAQBX9ehQsRpZRczvS48SXhANMf5p376pY9cv+TEXtauWc1U8ldNCKA1
 lBp6HDpVmyogEMBdhUMz+B88lQ==
X-Google-Smtp-Source: AKy350bSWbUTNfL9mtSeohExgNC6SUH2CXhskKxp1xo/IFtOqp7NfnlrgJFNap7zOtCGqwnK7Tr3mg==
X-Received: by 2002:a17:903:244b:b0:1a0:7425:4b73 with SMTP id
 l11-20020a170903244b00b001a074254b73mr7110084pls.4.1680799944914; 
 Thu, 06 Apr 2023 09:52:24 -0700 (PDT)
Received: from [192.168.0.4] (174-21-65-249.tukw.qwest.net. [174.21.65.249])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a170902b18300b0019f3da8c2a4sm1608630plr.69.2023.04.06.09.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 09:52:24 -0700 (PDT)
Message-ID: <53ff24da-4f68-818c-1116-007351412a13@linaro.org>
Date: Thu, 6 Apr 2023 09:52:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 15/44] target/loongarch: Implement
 vmul/vmuh/vmulw{ev/od}
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-16-gaosong@loongson.cn>
 <732518bf-6832-aac8-cd8a-367ef68831f1@linaro.org>
 <283522f9-3cff-30a1-b8ba-20fc6dbf7d72@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <283522f9-3cff-30a1-b8ba-20fc6dbf7d72@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
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

On 4/6/23 05:09, gaosong wrote:
> HI, Richard
> 
> 在 2023/3/29 上午4:46, Richard Henderson 写道:
>>> +static void do_vmuh_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
>>> +                      uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
>>> +{
>>> +    static const GVecGen3 op[4] = {
>>> +        {
>>> +            .fno = gen_helper_vmuh_b,
>>> +            .vece = MO_8
>>> +        },
>>> +        {
>>> +            .fno = gen_helper_vmuh_h,
>>> +            .vece = MO_16
>>> +        },
>>> +        {
>>> +            .fno = gen_helper_vmuh_w,
>>> +            .vece = MO_32
>>> +        },
>>> +        {
>>> +            .fno = gen_helper_vmuh_d,
>>> +            .vece = MO_64
>>> +        },
>>> +    };
>>
>> Could be worth integer expansion, especially for MO_32/MO_64?
>> Should be trivial...
> For integer expansion.  How about the following code?

I meant just "w" and "d" -- drop the "b" and "h" inline expansion.

> static void gen_vmuh_w(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
> {
>      TCGv_i64 t1, t2;
> 
>      t1 = tcg_temp_new_i64();
>      t2 = tcg_temp_new_i64();
>      tcg_gen_ext_i32_i64(t1, a);
>      tcg_gen_ext_i32_i64(t2, b);
>      tcg_gen_mul_i64(t2, t1, t2);
>      tcg_gen_extrh_i64_i32(t, t2);
> }

TCGv_i32 discard = tcg_temp_new_i32();
tcg_gen_muls2_i32(discard, t, a, b);

> 
> static void gen_vmuh_d(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
> {
>      TCGv_i64 t1;
> 
>      t1 = tcg_temp_new_i64();
>      tcg_gen_muls2_i64(t1, t, a, b);
> }

Yes.

> static void gen_vmuh_wu(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
> {
>      TCGv_i64 t1, t2;
> 
>      t1 = tcg_temp_new_i64();
>      t2 = tcg_temp_new_i64();
>      tcg_gen_extu_i32_i64(t1, a);
>      tcg_gen_extu_i32_i64(t2, b);
>      tcg_gen_mul_i64(t2, t1, t2);
>      tcg_gen_extrh_i64_i32(t, t2);
> }

tcg_gen_mulu2_i32.

> static void gen_vmuh_du(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
> {
>      TCGv_i64 t1;
> 
>      t1 = tcg_temp_new_i64();
>      tcg_gen_mulu2_i64(t1, t, a, b);
> }

Yes.


r~


