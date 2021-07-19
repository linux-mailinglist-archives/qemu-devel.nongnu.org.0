Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1B53CD1CC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:22:24 +0200 (CEST)
Received: from localhost ([::1]:33312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5QPm-0003j4-T7
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m5QOm-0001w7-Cg; Mon, 19 Jul 2021 06:21:20 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:48919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m5QOi-00039g-Ui; Mon, 19 Jul 2021 06:21:19 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B151474632F;
 Mon, 19 Jul 2021 12:21:11 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 55AF57462BD; Mon, 19 Jul 2021 12:21:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 53E647457E5;
 Mon, 19 Jul 2021 12:21:11 +0200 (CEST)
Date: Mon, 19 Jul 2021 12:21:11 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] target/ppc: Ease L=0 requirement on cmp/cmpi/cmpl/cmpli
 for ppc32
In-Reply-To: <YPTmoCh2z2VXzc7O@yekko>
Message-ID: <4b66ae32-375-1be1-f485-e4d86f2c5a2f@eik.bme.hu>
References: <20210715122950.2366428-1-matheus.ferst@eldorado.org.br>
 <YPTmoCh2z2VXzc7O@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, richard.henderson@linaro.org,
 matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021, David Gibson wrote:
> On Thu, Jul 15, 2021 at 09:29:50AM -0300, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> In commit 8f0a4b6a9, we started to require L=0 for ppc32 to match what
>> The Programming Environments Manual say:
>>
>> "For 32-bit implementations, the L field must be cleared, otherwise
>> the instruction form is invalid."
>>
>> Further digging, however, shown that older CPUs have different behavior
>> concerning invalid forms. E.g.: 440 and 405 manuals say that:
>>
>> "Unless otherwise noted, the PPC440 will execute all invalid instruction
>> forms without causing an Illegal Instruction exception".
>>
>> While the PowerISA has an arguably more restrictive:
>>
>> "In general, any attempt to execute an invalid form of an instruction
>> will either cause the system illegal instruction error handler to be
>> invoked or yield boundedly undefined results."
>
> That's actually less restrictive.  "boundedly undefined" lets the
> implementation do nearly anything that won't mess up a hypervisor.
> Both ignoring the illegal bits and issuing an invalid instruction
> exception are definitely permissible within the meaning of "boundedly
> undefined".
>
>> Finally, BALATON Zoltan (CC'ed) reported that the stricter behavior
>> broke AROS boot on sam460ex. This patch address this regression by only
>> logging a guest error, except for CPUs known to raise an exception for
>> this case (e500 and e500mc).
>
> So.. as a rule of thumb, I'd prefer to have qemu give explicit
> failures (e.g. program check traps) where there's implementation
> specific or architecture undefined behaviour.  On the other hand,
> having a real guest that relies on the specific behaviour of real
> implementations is a compelling reason to break that rule of thumb.

One still should get log messages about it with -d guest_errors so that 
can be used for identifying problems with guest code that otherwise runs 
fine on real CPU.

> Given it's a behavioural change, I'm disinclined to squeeze this in
> for qemu-6.1, but I'll consider it for 6.2.  Richard, any thoughts?

Well, it's a regression from 6.0 and delaying it to 6.2 means we would 
have a release with a known issue that prevents a guest from running which 
could be fixed by this patch so I argue this is a bug fix that should be 
in 6.1. The behaviour change was the patch this one fixes (8f0a4b6a9, 
mentioned in commit message but could also be a Fixes: tag).

Regards,
BALATON Zoltan

>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>  target/ppc/translate/fixedpoint-impl.c.inc | 58 +++++++++++++++++++++-
>>  1 file changed, 56 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
>> index f4fcfadbfc..1c35b60eb4 100644
>> --- a/target/ppc/translate/fixedpoint-impl.c.inc
>> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
>> @@ -145,8 +145,35 @@ TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
>>
>>  static bool do_cmp_X(DisasContext *ctx, arg_X_bfl *a, bool s)
>>  {
>> +    if ((ctx->insns_flags & PPC_64B) == 0) {
>> +        /*
>> +         * For 32-bit implementations, The Programming Environments Manual says
>> +         * that "the L field must be cleared, otherwise the instruction form is
>> +         * invalid." It seems, however, that most 32-bit CPUs ignore invalid
>> +         * forms (e.g., section "Instruction Formats" of the 405 and 440
>> +         * manuals, "Integer Compare Instructions" of the 601 manual), with the
>> +         * notable exception of the e500 and e500mc, where L=1 was reported to
>> +         * cause an exception.
>> +         */
>> +        if (a->l) {
>> +            if ((ctx->insns_flags2 & PPC2_BOOKE206)) {
>> +                /*
>> +                 * For 32-bit Book E v2.06 implementations (i.e. e500/e500mc),
>> +                 * generate an illegal instruction exception.
>> +                 */
>> +                return false;
>> +            } else {
>> +                qemu_log_mask(LOG_GUEST_ERROR,
>> +                        "Invalid form of CMP%s at 0x" TARGET_FMT_lx ", L = 1\n",
>> +                        s ? "" : "L", ctx->cia);
>> +            }
>> +        }
>> +        gen_op_cmp32(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
>> +        return true;
>> +    }
>> +
>> +    /* For 64-bit implementations, deal with bit L accordingly. */
>>      if (a->l) {
>> -        REQUIRE_64BIT(ctx);
>>          gen_op_cmp(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
>>      } else {
>>          gen_op_cmp32(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
>> @@ -156,8 +183,35 @@ static bool do_cmp_X(DisasContext *ctx, arg_X_bfl *a, bool s)
>>
>>  static bool do_cmp_D(DisasContext *ctx, arg_D_bf *a, bool s)
>>  {
>> +    if ((ctx->insns_flags & PPC_64B) == 0) {
>> +        /*
>> +         * For 32-bit implementations, The Programming Environments Manual says
>> +         * that "the L field must be cleared, otherwise the instruction form is
>> +         * invalid." It seems, however, that most 32-bit CPUs ignore invalid
>> +         * forms (e.g., section "Instruction Formats" of the 405 and 440
>> +         * manuals, "Integer Compare Instructions" of the 601 manual), with the
>> +         * notable exception of the e500 and e500mc, where L=1 was reported to
>> +         * cause an exception.
>> +         */
>> +        if (a->l) {
>> +            if ((ctx->insns_flags2 & PPC2_BOOKE206)) {
>> +                /*
>> +                 * For 32-bit Book E v2.06 implementations (i.e. e500/e500mc),
>> +                 * generate an illegal instruction exception.
>> +                 */
>> +                return false;
>> +            } else {
>> +                qemu_log_mask(LOG_GUEST_ERROR,
>> +                        "Invalid form of CMP%s at 0x" TARGET_FMT_lx ", L = 1\n",
>> +                        s ? "I" : "LI", ctx->cia);
>> +            }
>> +        }
>> +        gen_op_cmp32(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
>> +        return true;
>> +    }
>> +
>> +    /* For 64-bit implementations, deal with bit L accordingly. */
>>      if (a->l) {
>> -        REQUIRE_64BIT(ctx);
>>          gen_op_cmp(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
>>      } else {
>>          gen_op_cmp32(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
>
>

