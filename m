Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D59467DDF5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 07:45:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLITT-0002xB-7R; Fri, 27 Jan 2023 01:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLITR-0002wx-Ll
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 01:44:33 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLITB-0004zh-0R
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 01:44:18 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 nn18-20020a17090b38d200b0022bfb584987so4020194pjb.2
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 22:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w+UoGoMHBSsuab00T7zmLMF6VLH1mskE/Unhm5oY3ao=;
 b=quMesPLr1VxLPYREw5MWzh0BgJbCMYQIwyk+/uRiLY6hgXOguM3FORRkTK0H36YZGK
 h461AasTflzPKr7x9jR2sX+amawBxSTuWIB1B/7IsrjPQyLwIiTSJqQA72vyf6a5+uAL
 jlpUT1qczCWP+BmDBU3XjBTRwttPLS579fiwymz0NZzZVC0btFCReAJcpwWf03+u/UNL
 +RoL0I/tOql7Yy3TI8l2RhZf4hIb+yp7O5S0X2QoB32tItjz4QzJvY95Wzoldz3Dgj9K
 4Xj7WBmjVAJq5h856Lm0zgKZqpSrOb5vMwhp5sZewxOBoJKYsGN5+yzJlWxYIAMV8Z9S
 ikEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w+UoGoMHBSsuab00T7zmLMF6VLH1mskE/Unhm5oY3ao=;
 b=iWlPPARHHkSlzYQaAHRr/s9uWjwv8cHeX6iLdmz85KhmgR6/OdMr4rv6BQmY4Apqqn
 5lDUT6zOA8ZNd83fhgPgc0NaleVTlTx+2Q05k1N+xqlvQqMoDrB6AhtUnye2Xjz2gxc6
 vbWY6zXftbTavrXY/HI805ae1Odm9jDDcUEDYetv9wrTzWgjvciZiRhZUkEd2Ll/aWWg
 0JUrVIzlSwAOue//EHKZdeG/gPfJJ1w2Za1yan/YnPsvuaHhm71KiIJEkEFD9VFZP9D9
 Jca702o+8F8GK50is3gJRdOIGTdFzrcHDDL83UZoGJxsYW6p/2843Ivn0ptU+I+6AuSW
 1bRA==
X-Gm-Message-State: AO0yUKWDAh3xy5GZK0xtps5STB/bG4gjAnfuz1EDeGLhfx7ePqVaVPtM
 2DA9nlRGzSgcEEB/uQeFQqmIyg==
X-Google-Smtp-Source: AK7set8hPzZuXl4KdS9SL5lSeqVd0c/9e12XP4wp+bW4SgAEchcz6MYi4GBKMb2K9WczfAUqx6f8Dg==
X-Received: by 2002:a17:90a:358:b0:229:f8e6:4bd2 with SMTP id
 24-20020a17090a035800b00229f8e64bd2mr5328667pjf.18.1674801855635; 
 Thu, 26 Jan 2023 22:44:15 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 i13-20020a170902cf0d00b0019607aeda8bsm2046241plg.73.2023.01.26.22.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 22:44:15 -0800 (PST)
Message-ID: <79c17cc8-f45d-391f-88db-8d74d32829ef@linaro.org>
Date: Thu, 26 Jan 2023 20:44:10 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 17/36] tcg: Split out tcg_gen_nonatomic_cmpxchg_i{32,64}
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-18-richard.henderson@linaro.org>
 <abb025a0-8588-81b3-ddd3-a93b4b66f6f5@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <abb025a0-8588-81b3-ddd3-a93b4b66f6f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
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

On 1/26/23 14:53, Philippe Mathieu-Daudé wrote:
> On 26/1/23 05:38, Richard Henderson wrote:
>> Normally this is automatically handled by the CF_PARALLEL checks
>> with in tcg_gen_atomic_cmpxchg_i{32,64}, but x86 has a special
>> case of !PREFIX_LOCK where it always wants the non-atomic version.
>>
>> Split these out so that x86 does not have to roll its own.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/tcg/tcg-op.h |   4 ++
>>   tcg/tcg-op.c         | 154 +++++++++++++++++++++++++++----------------
>>   2 files changed, 101 insertions(+), 57 deletions(-)
> 
> 
>> +void tcg_gen_nonatomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
>> +                                   TCGv_i64 newv, TCGArg idx, MemOp memop)
>> +{
>> +    TCGv_i64 t1, t2;
>> +
> 
> This block from here ...
> 
>> +    if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
>> +        tcg_gen_nonatomic_cmpxchg_i32(TCGV_LOW(retv), addr, TCGV_LOW(cmpv),
>> +                                      TCGV_LOW(newv), idx, memop);
>> +        if (memop & MO_SIGN) {
>> +            tcg_gen_sari_i32(TCGV_HIGH(retv), TCGV_LOW(retv), 31);
>> +        } else {
>> +            tcg_gen_movi_i32(TCGV_HIGH(retv), 0);
>> +        }
>> +        return;
>> +    }
> 
> ... to here,
> 
>> +    t1 = tcg_temp_new_i64();
>> +    t2 = tcg_temp_new_i64();
>> +
>> +    tcg_gen_ext_i64(t2, cmpv, memop & MO_SIZE);
>> +
>> +    tcg_gen_qemu_ld_i64(t1, addr, idx, memop & ~MO_SIGN);
>> +    tcg_gen_movcond_i64(TCG_COND_EQ, t2, t1, t2, newv, t1);
>> +    tcg_gen_qemu_st_i64(t2, addr, idx, memop);
>> +    tcg_temp_free_i64(t2);
>> +
>> +    if (memop & MO_SIGN) {
>> +        tcg_gen_ext_i64(retv, t1, memop);
>> +    } else {
>> +        tcg_gen_mov_i64(retv, t1);
>> +    }
>> +    tcg_temp_free_i64(t1);
>>   }
>>   void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
>>                                   TCGv_i64 newv, TCGArg idx, MemOp memop)
>>   {
>> -    memop = tcg_canonicalize_memop(memop, 1, 0);
>> -
>>       if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
>> -        TCGv_i64 t1 = tcg_temp_new_i64();
>> -        TCGv_i64 t2 = tcg_temp_new_i64();
>> +        tcg_gen_nonatomic_cmpxchg_i64(retv, addr, cmpv, newv, idx, memop);
>> +        return;
>> +    }
>> -        tcg_gen_ext_i64(t2, cmpv, memop & MO_SIZE);
>> -
>> -        tcg_gen_qemu_ld_i64(t1, addr, idx, memop & ~MO_SIGN);
>> -        tcg_gen_movcond_i64(TCG_COND_EQ, t2, t1, t2, newv, t1);
>> -        tcg_gen_qemu_st_i64(t2, addr, idx, memop);
>> -        tcg_temp_free_i64(t2);
>> -
>> -        if (memop & MO_SIGN) {
>> -            tcg_gen_ext_i64(retv, t1, memop);
>> -        } else {
>> -            tcg_gen_mov_i64(retv, t1);
>> -        }
>> -        tcg_temp_free_i64(t1);
>> -    } else if ((memop & MO_SIZE) == MO_64) {
>> -#ifdef CONFIG_ATOMIC64
>> +    if ((memop & MO_SIZE) == MO_64) {
>>           gen_atomic_cx_i64 gen;
>> -        MemOpIdx oi;
>> +        memop = tcg_canonicalize_memop(memop, 1, 0);
>>           gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
>> -        tcg_debug_assert(gen != NULL);
>> +        if (gen) {
>> +            MemOpIdx oi = make_memop_idx(memop, idx);
>> +            gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
>> +            return;
>> +        }
>> -        oi = make_memop_idx(memop, idx);
>> -        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
>> -#else
>>           gen_helper_exit_atomic(cpu_env);
>> -        /* Produce a result, so that we have a well-formed opcode stream
>> -           with respect to uses of the result in the (dead) code following.  */
>> +
>> +        /*
>> +         * Produce a result for a well-formed opcode stream.  This satisfies
>> +         * liveness for set before used, which happens before this dead code
>> +         * is removed.
>> +         */
>>           tcg_gen_movi_i64(retv, 0);
>> -#endif /* CONFIG_ATOMIC64 */
>> +        return;
>> +    }
> 
> and this one here:
>> +    if (TCG_TARGET_REG_BITS == 32) {
>> +        tcg_gen_atomic_cmpxchg_i32(TCGV_LOW(retv), addr, TCGV_LOW(cmpv),
>> +                                   TCGV_LOW(newv), idx, memop);
>> +        if (memop & MO_SIGN) {
>> +            tcg_gen_sari_i32(TCGV_HIGH(retv), TCGV_LOW(retv), 31);
>> +        } else {
>> +            tcg_gen_movi_i32(TCGV_HIGH(retv), 0);
>> +        }
> 
> belong to a subsequent patch IMO.

No.  That code is in there now, and needs to be there for correctness.

It gets duplicated in the exposure of the non-atomic code path.


r~


  Otherwise LGTM.
> 
>>       } else {
>>           TCGv_i32 c32 = tcg_temp_new_i32();
>>           TCGv_i32 n32 = tcg_temp_new_i32();
> 


