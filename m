Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B954523C7E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 20:32:16 +0200 (CEST)
Received: from localhost ([::1]:51498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nor8A-0006iS-Tx
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 14:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nor5G-0004Yq-5k; Wed, 11 May 2022 14:29:14 -0400
Received: from [187.72.171.209] (port=14747 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nor5D-00016y-M8; Wed, 11 May 2022 14:29:13 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 11 May 2022 15:29:03 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 09ABC8001F1;
 Wed, 11 May 2022 15:29:03 -0300 (-03)
Message-ID: <276e357e-a757-7d03-3a70-c23dd52dbe53@eldorado.org.br>
Date: Wed, 11 May 2022 15:29:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] target/ppc: Fix FPSCR.FI bit being cleared when it
 shouldn't
Content-Language: en-US
To: Rashmica Gupta <rashmica.g@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>
References: <20220510204610.100867-1-victor.colombo@eldorado.org.br>
 <20220510204610.100867-2-victor.colombo@eldorado.org.br>
 <244b0614581cbec66f6cf87dd13f806af036b769.camel@gmail.com>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <244b0614581cbec66f6cf87dd13f806af036b769.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 11 May 2022 18:29:03.0557 (UTC)
 FILETIME=[FDBCBF50:01D86564]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello!

Thanks everyone for your kind reviews

On 11/05/2022 07:12, Rashmica Gupta wrote:
> Hello,
> 
> cc'ing Paul and Nick for clarification on the behaviour of xsrsp (see below)
> 
> 
> On Tue, 2022-05-10 at 17:46 -0300, Víctor Colombo wrote:
>> The FI bit in FPSCR is said to be a non-sticky bit on Power ISA.
>> One could think this means that, if an instruction is said to modify
>> the FPSCR register, the bit FI should be cleared. This is what QEMU
>> does today.
>>
>> However, the following inconsistency was found when comparing results
>> from the hardware (tested on both a Power 9 processor and in
>> Power 10 Mambo):
>>
>> (FI bit is set before the execution of the instruction)
>> Hardware: xscmpeqdp(0xff..ff, 0xff..ff) = FI: SET -> SET
>> QEMU: xscmpeqdp(0xff..ff, 0xff..ff) = FI: SET -> CLEARED
>>
>> This is happening to multiple instructions in the vsx
>> implementations. As the FI bit is non-sticky, one could think that
>> xscmpeqdp, a instruction the ISA states doesn't change FI bit, should
>> result in a cleared FI. However, this is not happening on hardware.
> I would think that if an instruction doesn't change a bit
> then that instruction wouldn't clear or set that bit, regardless of if
> that bit is sticky or not.

I think I might have over-generalized this commit message.
I, as well as other developers of the Power ISA instructions in
QEMU, didn't notice this behavior before, so it's at least confusing
> 
>> An investigation resulted in the following conclusion:
>> If the ISA does not list the FI bit as altered for a particular
>> instruction, then it should be kept as it was before the instruction.
>>
>> QEMU is not following this behavior. Affected instructions include:
>> - xv* (all vsx-vector instructions);
>> - xscmp*, xsmax*, xsmin*;
>> - xstdivdp and similars;
>> (to identify the affected instructions, just search in the ISA for
>>   the instructions that does not list FI in "Special Registers
>> Altered")
> The ISA does state
> "Floating-Point Fraction Inexact (FI)
> This bit is set to 0 or 1 by VSX Scalar
> Floating-Point Arithmetic, VSX Scalar Integer
> Conversion, and VSX Scalar Round to
> Floating-Point Integer class instructions to
> indicate whether or not the rounded result is
> inexact or the instruction caused a disabled
> Overflow exception. See Section 7.3.2.6 on
> page 524. This bit is not sticky."
> 
> So it seems that instruction classes like VSX Vector Round and VSX Vector
> convert don't touch the FI bit.
> 
>> Most instructions use the function do_float_check_status() to commit
>> changes in the inexact flag. So the fix is to add a parameter to it
>> that will control if the bit FI should be changed or not.
>> All users of do_float_check_status() are then modified to provide
>> this
>> argument, controlling if that specific instruction changes bit FI or
>> not.
>> Some macro helpers are responsible for both instructions that change
>> and instructions that aren't suposed to change FI. This seems to
>> always
>> overlap with the sfprf flag. So, reuse this flag for this purpose
>> when
>> applicable.
>>
>> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
>>
>> ---
>>
>> v2:
>> - move the FI change from float_inexact_excp to do_float_check_status
>> - sfprf will be renamed to sfifprf in another patch, as suggested by
>>    Richard
>> ---
>>   target/ppc/cpu.h        |   2 +
>>   target/ppc/fpu_helper.c | 122 +++++++++++++++++++++-----------------
>> --
>>   2 files changed, 66 insertions(+), 58 deletions(-)
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 48596cfb25..901ded79e9 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -735,6 +735,8 @@ enum {
>>                         (1 << FPSCR_VXSOFT) | (1 << FPSCR_VXSQRT) | \
>>                         (1 << FPSCR_VXCVI))
>>   
>> +FIELD(FPSCR, FI, FPSCR_FI, 1)
>> +
>>   #define FP_DRN2         (1ull << FPSCR_DRN2)
>>   #define FP_DRN1         (1ull << FPSCR_DRN1)
>>   #define FP_DRN0         (1ull << FPSCR_DRN0)
>> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
>> index f6c8318a71..f1ea4aa10e 100644
>> --- a/target/ppc/fpu_helper.c
>> +++ b/target/ppc/fpu_helper.c
>> @@ -370,7 +370,6 @@ static inline void float_inexact_excp(CPUPPCState
>> *env)
>>   {
>>       CPUState *cs = env_cpu(env);
>>   
>> -    env->fpscr |= FP_FI;
>>       env->fpscr |= FP_XX;
>>       /* Update the floating-point exception summary */
>>       env->fpscr |= FP_FX;
>> @@ -462,7 +461,8 @@ void helper_fpscr_check_status(CPUPPCState *env)
>>       }
>>   }
>>   
>> -static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
>> +static void do_float_check_status(CPUPPCState *env, bool change_fi,
>> +                                  uintptr_t raddr)
>>   {
>>       CPUState *cs = env_cpu(env);
>>       int status = get_float_exception_flags(&env->fp_status);
>> @@ -474,8 +474,10 @@ static void do_float_check_status(CPUPPCState
>> *env, uintptr_t raddr)
>>       }
>>       if (status & float_flag_inexact) {
>>           float_inexact_excp(env);
>> -    } else {
>> -        env->fpscr &= ~FP_FI; /* clear the FPSCR[FI] bit */
>> +    }
>> +    if (change_fi) {
>> +        env->fpscr = FIELD_DP64(env->fpscr, FPSCR, FI,
>> +                                !!(status & float_flag_inexact));
>>       }
> 
> According to the ISA not all instructions that affect FI, set FI on an
> inexact exception (xsrqpi apparently clears FI on an inexact exception
> -- I have no idea if this actually happens on hardware).

good point,

xsrqpi is handled as it was before already: the inexact flag is being
cleared for fp_status in helper_xsrqpi, causing do_float_check_status to
clear it for fpscr.

I think we should keep it like this. The change I made to
do_float_check_status allow for its callers to request if the FI field
in FPSCR should be updated. What value should be updated to is then
responsibility of these callers, provided as an argument to
do_float_check_status, like xsrqpi is doing.

> 
> 
>>   
>>       if (cs->exception_index == POWERPC_EXCP_PROGRAM &&
>> @@ -490,7 +492,7 @@ static void do_float_check_status(CPUPPCState
>> *env, uintptr_t raddr)
>>   
>>   void helper_float_check_status(CPUPPCState *env)
>>   {
>> -    do_float_check_status(env, GETPC());
>> +    do_float_check_status(env, true, GETPC());
>>   }
>>   
>      
> ... snip ...
> 
>> @@ -3195,7 +3201,7 @@ uint64_t helper_xsrsp(CPUPPCState *env,
>> uint64_t xb)
>>       uint64_t xt = do_frsp(env, xb, GETPC());
>>   
>>       helper_compute_fprf_float64(env, xt);
>> -    do_float_check_status(env, GETPC());
>> +    do_float_check_status(env, true, GETPC());
>>       return xt;
>>   }
> I'm not clear what the behaviour of xsrsp should be.
> 
> Section 7.4.5 Floating-Point Inexact Exception leads me to think it
> shouldn't affect FI but the instruction definition indicates the
> opposite. Maybe Paul or Nick can weigh in on this?
> 

I tested on a Power9 hardware and FI is altered by xsrsp when XE=0.
But indeed, the ISA seems a bit contradictory on this one, section
7.4.5 only states about changing XX in this situation.

> 
>>   
>> @@ -3355,7 +3361,7 @@ void helper_xsrqpi(CPUPPCState *env, uint32_t
>> opcode,
>>       }
>>   
>>       helper_compute_fprf_float128(env, t.f128);
>> -    do_float_check_status(env, GETPC());
>> +    do_float_check_status(env, true, GETPC());
>>       *xt = t;
>>   }
>>   
>> @@ -3408,7 +3414,7 @@ void helper_xsrqpxp(CPUPPCState *env, uint32_t
>> opcode,
>>   
>>       helper_compute_fprf_float128(env, t.f128);
>>       *xt = t;
>> -    do_float_check_status(env, GETPC());
>> +    do_float_check_status(env, true, GETPC());
>>   }
>>   
>>   void helper_xssqrtqp(CPUPPCState *env, uint32_t opcode,
>> @@ -3434,7 +3440,7 @@ void helper_xssqrtqp(CPUPPCState *env, uint32_t
>> opcode,
>>   
>>       helper_compute_fprf_float128(env, t.f128);
>>       *xt = t;
>> -    do_float_check_status(env, GETPC());
>> +    do_float_check_status(env, true, GETPC());
>>   }
>>   
>>   void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
>> @@ -3460,5 +3466,5 @@ void helper_xssubqp(CPUPPCState *env, uint32_t
>> opcode,
>>   
>>       helper_compute_fprf_float128(env, t.f128);
>>       *xt = t;
>> -    do_float_check_status(env, GETPC());
>> +    do_float_check_status(env, true, GETPC());
>>   }
> 
> All the other instruction helpers and definitions look correct to me.

Thank you very much!

--
Víctor Cora Colombo
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

