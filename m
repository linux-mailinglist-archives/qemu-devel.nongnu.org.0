Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9130744CABE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 21:42:10 +0100 (CET)
Received: from localhost ([::1]:37712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkuQ4-00054B-MS
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 15:42:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mkuP7-00049N-0U; Wed, 10 Nov 2021 15:41:09 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:34488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mkuP1-0006oU-Vk; Wed, 10 Nov 2021 15:41:08 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C5395746399;
 Wed, 10 Nov 2021 21:40:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 72033746353; Wed, 10 Nov 2021 21:40:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6FC167462D3;
 Wed, 10 Nov 2021 21:40:59 +0100 (CET)
Date: Wed, 10 Nov 2021 21:40:59 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH 1/2] target/ppc: Fixed call to deferred exception
In-Reply-To: <b87bb52d-166f-0c1c-efe6-0747e1f08453@eldorado.org.br>
Message-ID: <dfe12d85-7c76-f65f-fab0-3660e6d09a79@eik.bme.hu>
References: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
 <20211020125724.78028-2-lucas.araujo@eldorado.org.br>
 <c4d2f4e8-b001-519d-ab8c-47e80d1a78ec@ilande.co.uk>
 <b87bb52d-166f-0c1c-efe6-0747e1f08453@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-753019985-1636576859=:64557"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, danielhb413@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-753019985-1636576859=:64557
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 10 Nov 2021, Lucas Mateus Martins Araujo e Castro wrote:
> On 10/11/2021 05:19, Mark Cave-Ayland wrote:
>> On 20/10/2021 13:57, Lucas Mateus Castro (alqotel) wrote:
>>> From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>
>>>
>>> mtfsf, mtfsfi and mtfsb1 instructions call helper_float_check_status
>>> after updating the value of FPSCR, but helper_float_check_status
>>> checks fp_status and fp_status isn't updated based on FPSCR and
>>> since the value of fp_status is reset earlier in the instruction,
>>> it's always 0.
>>> 
>>> Because of this helper_float_check_status would change the FI bit to 0
>>> as this bit checks if the last operation was inexact and
>>> float_flag_inexact is always 0.
>>> 
>>> These instructions also don't throw exceptions correctly since
>>> helper_float_check_status throw exceptions based on fp_status.
>>> 
>>> This commit created a new helper, helper_fpscr_check_status that checks
>>> FPSCR value instead of fp_status and checks for a larger variety of
>>> exceptions than do_float_check_status.
>>> 
>>> The hardware used to compare QEMU's behavior to, was a Power9.
>>> 
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/266
>>> Signed-off-by: Lucas Mateus Castro (alqotel) 
>>> <lucas.castro@eldorado.org.br>
>>> ---
>>>   target/ppc/fpu_helper.c            | 41 ++++++++++++++++++++++++++++++
>>>   target/ppc/helper.h                |  1 +
>>>   target/ppc/translate/fp-impl.c.inc |  6 ++---
>>>   3 files changed, 45 insertions(+), 3 deletions(-)
>>> 
>>> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
>>> index c4896cecc8..f086cb503f 100644
>>> --- a/target/ppc/fpu_helper.c
>>> +++ b/target/ppc/fpu_helper.c
>>> @@ -414,6 +414,47 @@ void helper_store_fpscr(CPUPPCState *env, uint64_t 
>>> val, uint32_t nibbles)
>>>       ppc_store_fpscr(env, val);
>>>   }
>>> 
>>> +void helper_fpscr_check_status(CPUPPCState *env)
>>> +{
>>> +    CPUState *cs = env_cpu(env);
>>> +    target_ulong fpscr = env->fpscr;
>>> +    int error = 0;
>>> +
>>> +    if ((fpscr & FP_VXSOFT) && (fpscr_ve != 0)) {
>>> +        error = POWERPC_EXCP_FP_VXSOFT;
>>> +    } else if ((fpscr & FP_OX) && (fpscr & FP_OE)) {
>>> +        error = POWERPC_EXCP_FP_OX;
>>> +    } else if ((fpscr & FP_UX) && (fpscr & FP_UE)) {
>>> +        error = POWERPC_EXCP_FP_UX;
>>> +    } else if ((fpscr & FP_XX) && (fpscr & FP_XE)) {
>>> +        error = POWERPC_EXCP_FP_XX;
>>> +    } else if ((fpscr & FP_ZX) && (fpscr & FP_ZE)) {
>>> +        error = POWERPC_EXCP_FP_ZX;
>>> +    } else if ((fpscr & FP_VXSNAN) && (fpscr_ve != 0)) {
>>> +        error = POWERPC_EXCP_FP_VXSNAN;
>>> +    } else if ((fpscr & FP_VXISI) && (fpscr_ve != 0)) {
>>> +        error = POWERPC_EXCP_FP_VXISI;
>>> +    } else if ((fpscr & FP_VXIDI) && (fpscr_ve != 0)) {
>>> +        error = POWERPC_EXCP_FP_VXIDI;
>>> +    } else if ((fpscr & FP_VXZDZ) && (fpscr_ve != 0)) {
>>> +        error = POWERPC_EXCP_FP_VXZDZ;
>>> +    } else if ((fpscr & FP_VXIMZ) && (fpscr_ve != 0)) {
>>> +        error = POWERPC_EXCP_FP_VXIMZ;
>>> +    } else if ((fpscr & FP_VXVC) && (fpscr_ve != 0)) {
>>> +        error = POWERPC_EXCP_FP_VXVC;
>>> +    }
>>> +
>>> +    if (error) {
>>> +        cs->exception_index = POWERPC_EXCP_PROGRAM;
>>> +        env->error_code = error | POWERPC_EXCP_FP;
>>> +        /* Deferred floating-point exception after target FPSCR update */
>>> +        if (fp_exceptions_enabled(env)) {
>>> +            raise_exception_err_ra(env, cs->exception_index,
>>> +                                   env->error_code, GETPC());
>>> +        }
>>> +    }
>>> +}
>>> +
>>>   static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
>>>   {
>>>       CPUState *cs = env_cpu(env);
>>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>>> index 4076aa281e..baa3715e73 100644
>>> --- a/target/ppc/helper.h
>>> +++ b/target/ppc/helper.h
>>> @@ -61,6 +61,7 @@ DEF_HELPER_FLAGS_1(cntlzw32, TCG_CALL_NO_RWG_SE, i32, 
>>> i32)
>>>   DEF_HELPER_FLAGS_2(brinc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>>> 
>>>   DEF_HELPER_1(float_check_status, void, env)
>>> +DEF_HELPER_1(fpscr_check_status, void, env)
>>>   DEF_HELPER_1(reset_fpstatus, void, env)
>>>   DEF_HELPER_2(compute_fprf_float64, void, env, i64)
>>>   DEF_HELPER_3(store_fpscr, void, env, i64, i32)
>>> diff --git a/target/ppc/translate/fp-impl.c.inc 
>>> b/target/ppc/translate/fp-impl.c.inc
>>> index 9f7868ee28..0a9b1ecc60 100644
>>> --- a/target/ppc/translate/fp-impl.c.inc
>>> +++ b/target/ppc/translate/fp-impl.c.inc
>>> @@ -782,7 +782,7 @@ static void gen_mtfsb1(DisasContext *ctx)
>>>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>>>       }
>>>       /* We can raise a deferred exception */
>>> -    gen_helper_float_check_status(cpu_env);
>>> +    gen_helper_fpscr_check_status(cpu_env);
>>>   }
>>> 
>>>   /* mtfsf */
>>> @@ -818,7 +818,7 @@ static void gen_mtfsf(DisasContext *ctx)
>>>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>>>       }
>>>       /* We can raise a deferred exception */
>>> -    gen_helper_float_check_status(cpu_env);
>>> +    gen_helper_fpscr_check_status(cpu_env);
>>>       tcg_temp_free_i64(t1);
>>>   }
>>> 
>>> @@ -851,7 +851,7 @@ static void gen_mtfsfi(DisasContext *ctx)
>>>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>>>       }
>>>       /* We can raise a deferred exception */
>>> -    gen_helper_float_check_status(cpu_env);
>>> +    gen_helper_fpscr_check_status(cpu_env);
>>>   }
>>> 
>>>   /***                         Floating-point 
>>> load                           ***/
>> 
>> FWIW the real issue here is that gen_helper_reset_fpstatus() even exists at 
>> all: see
>> the comments around enabling hardfloat in the PPC target by Emilio and 
>> Richard at
>> https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg04974.html and
>> https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg00064.html.
>> 
>> I have tried a few informal experiments on my MacOS images by completely 
>> removing all
>> calls to gen_reset_fpstatus(), and whilst there were a few odd behaviours I 
>> was
>> surprised to find that the basic OS was usable. The main issue I had was 
>> trying to
>> come up with suitable test cases for the various instructions when my only 
>> available
>> hardware is a G4 Mac Mini.
>> 
>> So yes this patch fixes one particular use case, but the real issue is that 
>> the PPC
>> target floating point flags need a bit of work: however once this is done 
>> it should
>> be possible for hardfloat to be enabled via a CPU option on suitable hosts 
>> which will
>> bring a noticeable improvement in floating point performance.
>> 
> In this case I don't think gen_helper_reset_fpstatus() is the problem, 
> fp_status is not updated in the instruction but its value is used in 
> helper_float_check_status(), so if the values have not been reset since the 
> last instruction it'll contain last instruction's information and if it has 
> (either by calling gen_helper_reset_fpstatus(), by automatically doing it 
> every instruction or by having every instruction reset it in the end) it'll 
> have 0. So there are 3 alternatives to solve this that I can think of:
>
>     * Update FPSCR directly, then update fp_status based on FPSCR, for this 
> you would either have to call a new helper to do this or update 
> helper_store_fpscr to do this, and then expand do_float_check_status to throw 
> more exceptions (or create a new helper to do this if expanding 
> do_float_check_status could cause problems),
>
>     * Just don't use fp_status, update FPSCR directly and do the deferred 
> exception using only information from FPSCR (the one I used this patch),
>
>     * Update only fp_status directly and call either a modified 
> do_float_check_status or a new helper that would update FPSCR and throw the 
> correct exception based on fp_status, this one I don't see how it would 
> feasible in the current implementation as FPSCR has many bits without an 
> equivalent in fp_status.
>
> So with this I can see how to implement the 1st and 2nd option, I chose not 
> to use the 1st one as do_float_check_status updates the FPSCR then throw the 
> exception, which seemed unnecessary. Also looking back I should've removed 
> gen_reset_fpstatus() as in the way it ended implemented these instructions 
> don't interact with fp_status anywhere else, so I'll remove it in the next 
> version.
>
> And looking at the suggestions the current implementation could be changed to 
> take advantage of the optimization suggested in the discussion you linked, 
> specially the parts about checking when exception bits aren't set (but in 
> this case it would've to be the MSR exception bits) and the part about 
> skipping calculating a flag when marked to 1.

I haven't followed the discussion but here's another message with some 
links I've collected when FPU came up that may be relevant to the topic:

https://lists.nongnu.org/archive/html/qemu-ppc/2020-04/msg00387.html

among those is a long thread on patchwork that has some info on the 
current situation. As far as I remember the oddity in handling FPU 
exceptions is partly because of two bits FI and FR in FPSCR that should 
reflect the result of the previous FPU op so has to be updated after every 
op which makes it hard to emulate as other CPUs usually don't do this. (We 
could easily improve it if we did not emulate those bits, most guest code 
don't use them anyway, but QEMU prefers accuracy so that way was ruled 
out.) Other than that the current code maybe also can be simplified and 
maybe optimised via some other ways which were discussed in those threads 
but nobody implemented any of the ideas so far. May worth reading through 
what was said before as there might be sume useful ideas in there.

Regards,
BALATON Zoltan
--3866299591-753019985-1636576859=:64557--

