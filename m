Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C193F0AA7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 19:56:20 +0200 (CEST)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGPnW-0008QJ-Qt
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 13:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGPmM-0006y8-5P
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:55:06 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGPmK-0007wT-Ki
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:55:05 -0400
Received: by mail-pg1-x530.google.com with SMTP id k24so3037709pgh.8
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 10:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/prZZlXt2aDcasmszjiTrA2wYTmBvu4EkgwZ3zHxzUY=;
 b=qD5cubI0PoiUZu6CUPQep/tEcqRghSi4hI6g51KTvq+OfMOOgRAaAJzrPj5pKkIml6
 7r3jaV9w03uvgI2aKiCiaPDnwviu5AjtQU44lHg+QP4HERXOO3tpAPEYP2Lnr0L9yYF8
 QGxQqEfTU+JqA6x5S+50WNrvohqQxY9g1L0LoqFaOStXtpHD3IEBS+a1VEJPmzzgono/
 1vkjo6Frqz1F8TG8ZJ8y6RNNo/ORAn8XrPh4iw8pXDxyT1nyYQ0WvHel/mjM8TJXo8Mc
 rDh+rceKiFOkx1HOuE/7+yn5pJf5urMihWAlv5Std1havpAjPYGJ1gqqoakvV9bHmmkQ
 oaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/prZZlXt2aDcasmszjiTrA2wYTmBvu4EkgwZ3zHxzUY=;
 b=YEsdjG1i+7vJPwVsx8D48GLRj6wv5gBhYHwtUQ+spF2d6wYi/+gF0RYN7ZfbXFP3AW
 pEfI5N+ir0567DQtD10XLtUpQtsZ5bRIGuxxkS7eOtQDZgt+vgbKaiUQTNidC5xJOiOn
 MzbA3ZF1Tnmky9b5KFYEy5wWGnDmLeAZ3otzruvuO92qeVAFj9I7Nlsb2USASWeznSLV
 Qq8X5IGltJGW3QfySm9TZAuSR56U6I67z8AA+zP51GY3Zxtq/pR7NhH2NKFhUGeK/LcM
 2GLe7ybdwBj+TIDn+pzQ+xHfCZYivyngJSKj3itAC+24K+fVjbddvxPKLGELQlkJxOi+
 BVCQ==
X-Gm-Message-State: AOAM532Y0mvA10m9czBXTL2mJIu4i4h7Ap4kjfCISDN11QJ+vRC4rDAc
 mVkqzuhPqZ2xiiUjxaL41yLU56ZZXZwfMw==
X-Google-Smtp-Source: ABdhPJyFKoa9anALvWl26OkWhkJCXg3nAZ6HPmQaTXLwauv0flMnrUi9/D3vwBaHnFpy3xUThvWfjQ==
X-Received: by 2002:a62:3342:0:b029:3b7:6395:a93 with SMTP id
 z63-20020a6233420000b02903b763950a93mr10437369pfz.71.1629309303004; 
 Wed, 18 Aug 2021 10:55:03 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id i11sm431000pfo.29.2021.08.18.10.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 10:55:02 -0700 (PDT)
Subject: Re: [PATCH v2 37/55] target/mips: Use 8-byte memory ops for msa
 load/store
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-38-richard.henderson@linaro.org>
 <e346410a-3257-d9a4-b320-c3f4b1765a4e@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9585531e-9cc3-9779-2052-32ce633d5a32@linaro.org>
Date: Wed, 18 Aug 2021 07:55:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e346410a-3257-d9a4-b320-c3f4b1765a4e@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 11:21 PM, Philippe Mathieu-Daudé wrote:
>> +#ifdef TARGET_WORDS_BIGENDIAN
>> +static inline uint64_t bswap16x4(uint64_t x)
>> +{
>> +    uint64_t m = 0x00ff00ff00ff00ffull;
>> +    return ((x & m) << 8) | ((x >> 8) & m);
>> +}
>> +
>> +static inline uint64_t bswap32x2(uint64_t x)
>> +{
>> +    return ror64(bswap64(x), 32);
>> +}
>> +#endif
> 
> I'm trying to remove TARGET_WORDS_BIGENDIAN uses,
> so this would become:
> 
> static inline bool is_cpu_bigendian(CPUMIPSState *)
> {
>      return extract32(env->CP0_Config0, CP0C0_BE, 1);
> }
> 
> static inline uint64_t bswap16x4(CPUMIPSState *env, uint64_t x)
> {
>      if (is_cpu_bigendian(env)) {
>          uint64_t m = 0x00ff00ff00ff00ffull;
>          return ((x & m) << 8) | ((x >> 8) & m);
>      } else {
>          return x;
>      }
> }
> 
> static inline uint64_t bswap32x2(CPUMIPSState *env, uint64_t x)
> {
>      if (is_cpu_bigendian(env)) {
>          return ror64(bswap64(x), 32);
>      } else {
>          return x;
>      }
> }

I would not put the bigendian test in here...

> 
> And we can remove the other TARGET_WORDS_BIGENDIAN uses:
> 
>>   void helper_msa_ld_w(CPUMIPSState *env, uint32_t wd,
>> @@ -8293,18 +8271,20 @@ void helper_msa_ld_w(CPUMIPSState *env, uint32_t wd,
>>   {
>>       wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
>>       uintptr_t ra = GETPC();
>> +    uint64_t d0, d1;
>>   
>> -#if !defined(HOST_WORDS_BIGENDIAN)
>> -    pwd->w[0] = cpu_ldl_data_ra(env, addr + (0 << DF_WORD), ra);
>> -    pwd->w[1] = cpu_ldl_data_ra(env, addr + (1 << DF_WORD), ra);
>> -    pwd->w[2] = cpu_ldl_data_ra(env, addr + (2 << DF_WORD), ra);
>> -    pwd->w[3] = cpu_ldl_data_ra(env, addr + (3 << DF_WORD), ra);
>> -#else
>> -    pwd->w[0] = cpu_ldl_data_ra(env, addr + (1 << DF_WORD), ra);
>> -    pwd->w[1] = cpu_ldl_data_ra(env, addr + (0 << DF_WORD), ra);
>> -    pwd->w[2] = cpu_ldl_data_ra(env, addr + (3 << DF_WORD), ra);
>> -    pwd->w[3] = cpu_ldl_data_ra(env, addr + (2 << DF_WORD), ra);
>> +    /*
>> +     * Load 8 bytes at a time.  Use little-endian load, then for
>> +     * big-endian target, we must then bswap the two words.
>> +     */
>> +    d0 = cpu_ldq_le_data_ra(env, addr + 0, ra);
>> +    d1 = cpu_ldq_le_data_ra(env, addr + 8, ra);
>> +#ifdef TARGET_WORDS_BIGENDIAN
>> +    d0 = bswap32x2(d0);
>> +    d1 = bswap32x2(d1);
>>   #endif

... I would leave it here.


r~

