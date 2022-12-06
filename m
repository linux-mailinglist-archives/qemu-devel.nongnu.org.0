Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1870644E85
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 23:24:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2gKy-0002tb-UC; Tue, 06 Dec 2022 17:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2gKt-0002tJ-J9
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 17:22:47 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2gKr-0005Qh-PT
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 17:22:47 -0500
Received: by mail-oi1-x22e.google.com with SMTP id n205so18628873oib.1
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 14:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LUdfORanw5TFk+L/KrShnvjIsmaNrSl2TrweXBUkb1Q=;
 b=Jn40SOJj7/kxg7+lJD39ezqAtb9R6SSMvTAOlzRl7shEO+jrdUrO5FQ4YAWKx2FPnK
 WPsKz2FCt4QoQhO6NFu1XvqNPgf88ZWy4Zdd6G+7sIIMGn9iOwLMJW4aLdU9zNJFUGJ0
 JF3LPAD82YpHn1rSEq4LC1Vb6F+lwT3azYKeKm66WofXNELQY0EuQKHx87aQ0lg6/WI5
 QWTyojkLRDj4MAOmgciWKdRM8N2XGNFHKTjE4tIcoinYnFjGdw/q4vPcd0yp+5M+90w3
 ZDOn7w1gRLJyRoW55U60lGS0Varb49ZOl2FFMinPxP4oArNeGdguObjoNo2vUVcHA6Kl
 W56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LUdfORanw5TFk+L/KrShnvjIsmaNrSl2TrweXBUkb1Q=;
 b=tAf3e4nIXDdE9Qo4wxJ55KeK4svbU0KaVMN0y3ZlS4fmZhDdSXaR392aNDC3RA7DpH
 EC2MMDDPy0QB2w/pSLqJfbq//yaJ5pkzV/KhMYMZubANDdESyumd4MJnMMHOsxsQ0Zvj
 /GrFAdB3Dot3DJPm613t2cqZ2UcEam+d7W9fvbaZH2Noj41ubgrPSUJs/Uz2cnyRb5Ri
 cKTabPTusznei0tCzCqYGYpwfsCQ7FB/iTokXxDH7fqcPuzVHhUnFQodb01E1DXwQujq
 X+PMexbVSXmSH2xlZCpHWbylf5Rzc3JabAip61yoGURJRbUgfEoE1IBNg0mw/a5cqb02
 imww==
X-Gm-Message-State: ANoB5plDPYGCWMHbv8cyIOK4Bx+twyLFV+e8be4P6PngAbhlmNsq5mJ8
 t1BYZbL7/PySSY+CGaNJXx6Vaw==
X-Google-Smtp-Source: AA0mqf44M8gioXoe1TBgmc8XcGJXc18ypFLq8oPGebQJazSOrT8CiJ4R1vEQ9xVG0UWoP6r0Z9do6w==
X-Received: by 2002:aca:4545:0:b0:359:f445:e03e with SMTP id
 s66-20020aca4545000000b00359f445e03emr33757684oia.180.1670365363961; 
 Tue, 06 Dec 2022 14:22:43 -0800 (PST)
Received: from ?IPV6:2806:102e:18:70b5:dea6:2a1e:8d56:439b?
 ([2806:102e:18:70b5:dea6:2a1e:8d56:439b])
 by smtp.gmail.com with ESMTPSA id
 bx19-20020a056830601300b00661b019accbsm7504487otb.3.2022.12.06.14.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 14:22:42 -0800 (PST)
Message-ID: <8a3965f7-f830-6343-be15-4e16b20655fd@linaro.org>
Date: Tue, 6 Dec 2022 16:22:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 02/13] tcg/s390x: Remove TCG_REG_TB
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-3-richard.henderson@linaro.org>
 <20221206192947.fi6c3ftrueuiqmch@heavy>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221206192947.fi6c3ftrueuiqmch@heavy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 12/6/22 13:29, Ilya Leoshkevich wrote:
> On Thu, Dec 01, 2022 at 10:51:49PM -0800, Richard Henderson wrote:
>> This reverts 829e1376d940 ("tcg/s390: Introduce TCG_REG_TB"), and
>> several follow-up patches.  The primary motivation is to reduce the
>> less-tested code paths, pre-z10.  Secondarily, this allows the
>> unconditional use of TCG_TARGET_HAS_direct_jump, which might be more
>> important for performance than any slight increase in code size.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/s390x/tcg-target.h     |   2 +-
>>   tcg/s390x/tcg-target.c.inc | 176 +++++--------------------------------
>>   2 files changed, 23 insertions(+), 155 deletions(-)
> 
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> 
> I have a few questions/ideas for the future below.
>   
>> diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
>> index 22d70d431b..645f522058 100644
>> --- a/tcg/s390x/tcg-target.h
>> +++ b/tcg/s390x/tcg-target.h
>> @@ -103,7 +103,7 @@ extern uint64_t s390_facilities[3];
>>   #define TCG_TARGET_HAS_mulsh_i32      0
>>   #define TCG_TARGET_HAS_extrl_i64_i32  0
>>   #define TCG_TARGET_HAS_extrh_i64_i32  0
>> -#define TCG_TARGET_HAS_direct_jump    HAVE_FACILITY(GEN_INST_EXT)
>> +#define TCG_TARGET_HAS_direct_jump    1
> 
> This change doesn't seem to affect that, but what is the minimum
> supported s390x qemu host? z900?

Possibly z990, if I'm reading the gcc processor_flags_table[] correctly; 
long-displacement-facility is definitely a minimum.

We probably should revisit what the minimum for TCG should be, assert those features at 
startup, and drop the corresponding runtime tests.

> I did some benchmarking of various ways to load constants in context of
> GCC in the past, and it turned out that LLIHF+OILF is more efficient
> than literal pool [1].

Interesting.  If we include extended-immediate-facility (base_GEN9_GA1, z9-109?) in the 
bare minimum that would definitely simplify a few things.

>> -    /* Use the constant pool if USE_REG_TB, but not for small constants.  */
>> -    if (maybe_out_small_movi(s, type, TCG_TMP0, val)) {
>> -        if (type == TCG_TYPE_I32) {
>> -            tcg_out_insn(s, RR, XR, dest, TCG_TMP0);
>> -        } else {
>> -            tcg_out_insn(s, RRE, XGR, dest, TCG_TMP0);
>> -        }
>> -    } else if (USE_REG_TB) {
>> -        tcg_out_insn(s, RXY, XG, dest, TCG_REG_TB, TCG_REG_NONE, 0);
>> -        new_pool_label(s, val, R_390_20, s->code_ptr - 2,
>> -                       tcg_tbrel_diff(s, NULL));
>> +    tcg_out_movi(s, type, TCG_TMP0, val);
>> +    if (type == TCG_TYPE_I32) {
>> +        tcg_out_insn(s, RR, XR, dest, TCG_TMP0);
>>       } else {
>> -        /* Perform the xor by parts.  */
>> -        tcg_debug_assert(HAVE_FACILITY(EXT_IMM));
>> -        if (val & 0xffffffff) {
>> -            tcg_out_insn(s, RIL, XILF, dest, val);
>> -        }
>> -        if (val > 0xffffffff) {
>> -            tcg_out_insn(s, RIL, XIHF, dest, val >> 32);
>> -        }
>> +        tcg_out_insn(s, RRE, XGR, dest, TCG_TMP0);
>>       }
>>   }
> 
> Wouldn't it be worth keeping XILF/XIFH here?

I don't know.  It's difficult for me to guess whether a dependency chain like

     val -> xor -> xor

(3 insns with serial dependencies) is better than

     val   --> xor
     load  -/

(3 insns, but only one serial dependency) is better.  But there may also be instruction 
fusion going on at the micro-architectural level, so that there's really only one xor.

If you have suggestions, I'm all ears.

> I don't have any numbers right now, but it looks more compact/efficient
> than a load + XGR.

If we assume general-instruction-extension-facility (z10?), LGRL + XGR is smaller than 
XILF + XIFH, ignoring the constant pool entry which might be shared, and modulo the µarch 
questions above.


> Same for OGR above; I even wonder if both implementations could be
> unified.

Sadly not, because of OILL et al.  There are no 16-bit xor immediate insns.

>> +        /*
>> +         * branch displacement must be aligned for atomic patching;
>> +         * see if we need to add extra nop before branch
>> +         */
>> +        if (!QEMU_PTR_IS_ALIGNED(s->code_ptr + 1, 4)) {
>> +            tcg_out16(s, NOP);
>>           }
>> +        tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
>> +        s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
>> +        tcg_out32(s, 0);
>>           set_jmp_reset_offset(s, a0);
> 
> This seems to work in practice, but I don't think patching branch
> offsets is allowed by PoP (in a multi-threaded environment). For
> example, I had to do [2] in order to work around this limitation in
> ftrace.

Really?  How does the processor distinguish between overwriting opcode/condition vs 
overwriting immediate operand when invalidating cached instructions?

If overwriting operand truly isn't correct, then I think we have to use indirect branch 
always for goto_tb.

> A third benefit seems to be that we now have one more register to
> allocate.

Yes.  It's call clobbered, so it isn't live so often, but sometimes.


r~

