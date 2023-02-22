Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED45269FF89
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:31:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyZM-0002np-Qt; Wed, 22 Feb 2023 18:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyZ9-0002XN-HM
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:30:27 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyZ7-00063v-9Z
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:30:27 -0500
Received: by mail-pf1-x443.google.com with SMTP id d7so5445388pfu.4
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=auvlidSZGu/jMRALybFEaikwa9ZO2MWpt1hcLdH4dAA=;
 b=M4R57Wfsn+jUVM107bdHBwaeFqwsfQ2MJLyGD50vdyCV6DohbcJo2jemrkftQ2NbiH
 bXUlIT18BexonNz4bbdhhAw+R40J4YDNeHhOVmkmxyQtSIJDwJTpbsIFcqKwK68PgJjc
 NAJlGCNRHYf4IQVlQF9CwkpwJ9AxtoXvNP7X4kh75EJIh8KV2W9CcirUnEhHTKVJeOE4
 LnQmwmnjwtWmTQtZXLSjJQ4KhunK4uPKV6AwuKXsGjvS72dP0atwCS5k1zsoyx4c+w4A
 KOCllI91dX7vSEEuhLqgn8jx7UNhJVs0mviuGB+WVW+hHwUTrnTHWdub6O0qkVL/PRz7
 GOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=auvlidSZGu/jMRALybFEaikwa9ZO2MWpt1hcLdH4dAA=;
 b=Bg4mfJYqmuItl1GWDKTSxuq6gd+ahdpgCjPBlZVMWiIyha7KWTYMeu6BwbKqVq1TvL
 JVb5u5L14eazMMHDYxDnTJBsuaS5sYy0/d/E0DsnET01ByDVqkROOwvo15ixaXoSM4aU
 JTgV3G90sNzOXPIIHEuOvxOC5DUr7ETsV13ITrv9fpT0kRQv/54x+uqULqdGCbwGNVzd
 jfnEgk7mSjgeQAD5IlX1B9O1JdwFojU/+5c8nUNMTc4dqAerKke6uE7FLh5SsJV6pmYv
 KY12Ns7s1sXhrwpJk9GFbymSGApCILR03x8r7ZVMnc74cIckXdIyxjA6OE8TKu3r2R7s
 hJJw==
X-Gm-Message-State: AO0yUKUXcvnmERBnnyXvWpJL2yC5M+p+mwbUshQQKi3em/FuKUFlX0Kv
 6x6y5dQir7Q5sqm865wCZJf3ItEqI5Gnovw7XpPzqA==
X-Google-Smtp-Source: AK7set8b7Be+j/xGi0GMBrOoEBa1lQBaKmHjHnzkIY9AGFL7vKsplM+YFwNYKcbPVziuvDme5p2LHw==
X-Received: by 2002:a05:6a00:21d2:b0:5a8:a751:d22 with SMTP id
 t18-20020a056a0021d200b005a8a7510d22mr10313777pfj.12.1677108623168; 
 Wed, 22 Feb 2023 15:30:23 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 d7-20020aa78147000000b00571cdbd0771sm6458387pfn.102.2023.02.22.15.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 15:30:22 -0800 (PST)
Message-ID: <46906c2f-258f-802e-dd5c-16f3b38b1044@linaro.org>
Date: Wed, 22 Feb 2023 13:30:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] target/i386: Fix BZHI instruction
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20230114233206.3118472-1-richard.henderson@linaro.org>
 <028cae76-5b52-76e0-9294-6477cbb89a28@linaro.org>
In-Reply-To: <028cae76-5b52-76e0-9294-6477cbb89a28@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

Ping 2.

r~

On 2/15/23 20:50, Richard Henderson wrote:
> Ping.
> 
> r~
> 
> On 1/14/23 13:32, Richard Henderson wrote:
>> We did not correctly handle N >= operand size.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1374
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tests/tcg/i386/test-i386-bmi2.c |  3 +++
>>   target/i386/tcg/emit.c.inc      | 14 +++++++-------
>>   2 files changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/tcg/i386/test-i386-bmi2.c b/tests/tcg/i386/test-i386-bmi2.c
>> index 982d4abda4..0244df7987 100644
>> --- a/tests/tcg/i386/test-i386-bmi2.c
>> +++ b/tests/tcg/i386/test-i386-bmi2.c
>> @@ -123,6 +123,9 @@ int main(int argc, char *argv[]) {
>>       result = bzhiq(mask, 0x1f);
>>       assert(result == (mask & ~(-1 << 30)));
>> +    result = bzhiq(mask, 0x40);
>> +    assert(result == mask);
>> +
>>       result = rorxq(0x2132435465768798, 8);
>>       assert(result == 0x9821324354657687);
>> diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
>> index 4d7702c106..1eace1231a 100644
>> --- a/target/i386/tcg/emit.c.inc
>> +++ b/target/i386/tcg/emit.c.inc
>> @@ -1143,20 +1143,20 @@ static void gen_BLSR(DisasContext *s, CPUX86State *env, 
>> X86DecodedInsn *decode)
>>   static void gen_BZHI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
>>   {
>>       MemOp ot = decode->op[0].ot;
>> -    TCGv bound;
>> +    TCGv bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
>> +    TCGv zero = tcg_constant_tl(0);
>> +    TCGv mone = tcg_constant_tl(-1);
>> -    tcg_gen_ext8u_tl(s->T1, cpu_regs[s->vex_v]);
>> -    bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
>> +    tcg_gen_ext8u_tl(s->T1, s->T1);
>>       /*
>>        * Note that since we're using BMILG (in order to get O
>>        * cleared) we need to store the inverse into C.
>>        */
>> -    tcg_gen_setcond_tl(TCG_COND_LT, cpu_cc_src, s->T1, bound);
>> -    tcg_gen_movcond_tl(TCG_COND_GT, s->T1, s->T1, bound, bound, s->T1);
>> +    tcg_gen_setcond_tl(TCG_COND_LEU, cpu_cc_src, s->T1, bound);
>> -    tcg_gen_movi_tl(s->A0, -1);
>> -    tcg_gen_shl_tl(s->A0, s->A0, s->T1);
>> +    tcg_gen_shl_tl(s->A0, mone, s->T1);
>> +    tcg_gen_movcond_tl(TCG_COND_LEU, s->A0, s->T1, bound, s->A0, zero);
>>       tcg_gen_andc_tl(s->T0, s->T0, s->A0);
>>       gen_op_update1_cc(s);
> 


