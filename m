Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21493C9F32
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 15:14:17 +0200 (CEST)
Received: from localhost ([::1]:32836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m41Bw-0002uO-O2
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 09:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m41AH-0001jd-Ml; Thu, 15 Jul 2021 09:12:33 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:43080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m41AE-00065F-AO; Thu, 15 Jul 2021 09:12:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D588D746353;
 Thu, 15 Jul 2021 15:12:24 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A871674632F; Thu, 15 Jul 2021 15:12:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A71E87462FD;
 Thu, 15 Jul 2021 15:12:24 +0200 (CEST)
Date: Thu, 15 Jul 2021 15:12:24 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH] target/ppc: Ease L=0 requirement on cmp/cmpi/cmpl/cmpli
 for ppc32
In-Reply-To: <20210715122950.2366428-1-matheus.ferst@eldorado.org.br>
Message-ID: <947f1dda-46fe-c736-5038-3fcb2df34fa8@eik.bme.hu>
References: <20210715122950.2366428-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Jul 2021, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>
> In commit 8f0a4b6a9, we started to require L=0 for ppc32 to match what
> The Programming Environments Manual say:
>
> "For 32-bit implementations, the L field must be cleared, otherwise
> the instruction form is invalid."
>
> Further digging, however, shown that older CPUs have different behavior
> concerning invalid forms. E.g.: 440 and 405 manuals say that:
>
> "Unless otherwise noted, the PPC440 will execute all invalid instruction
> forms without causing an Illegal Instruction exception".
>
> While the PowerISA has an arguably more restrictive:
>
> "In general, any attempt to execute an invalid form of an instruction
> will either cause the system illegal instruction error handler to be
> invoked or yield boundedly undefined results."
>
> Finally, BALATON Zoltan (CC'ed) reported that the stricter behavior
> broke AROS boot on sam460ex. This patch address this regression by only
> logging a guest error, except for CPUs known to raise an exception for
> this case (e500 and e500mc).
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Tested-by: BALATON Zoltan <balaton@eik.bme.hu>

This fixed AROS on sam460ex and also found a similar problem with pegasos2 
firmware version 1.2 (using G4 CPU) that this patch fixes as well 
(assuming that firmware runs on real hardware the G4 also seems to behave 
like this, ignoring invalid bits). Thank you.

Regards,
BALATON Zoltan

> ---
> target/ppc/translate/fixedpoint-impl.c.inc | 58 +++++++++++++++++++++-
> 1 file changed, 56 insertions(+), 2 deletions(-)
>
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
> index f4fcfadbfc..1c35b60eb4 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -145,8 +145,35 @@ TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
>
> static bool do_cmp_X(DisasContext *ctx, arg_X_bfl *a, bool s)
> {
> +    if ((ctx->insns_flags & PPC_64B) == 0) {
> +        /*
> +         * For 32-bit implementations, The Programming Environments Manual says
> +         * that "the L field must be cleared, otherwise the instruction form is
> +         * invalid." It seems, however, that most 32-bit CPUs ignore invalid
> +         * forms (e.g., section "Instruction Formats" of the 405 and 440
> +         * manuals, "Integer Compare Instructions" of the 601 manual), with the
> +         * notable exception of the e500 and e500mc, where L=1 was reported to
> +         * cause an exception.
> +         */
> +        if (a->l) {
> +            if ((ctx->insns_flags2 & PPC2_BOOKE206)) {
> +                /*
> +                 * For 32-bit Book E v2.06 implementations (i.e. e500/e500mc),
> +                 * generate an illegal instruction exception.
> +                 */
> +                return false;
> +            } else {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                        "Invalid form of CMP%s at 0x" TARGET_FMT_lx ", L = 1\n",
> +                        s ? "" : "L", ctx->cia);
> +            }
> +        }
> +        gen_op_cmp32(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
> +        return true;
> +    }
> +
> +    /* For 64-bit implementations, deal with bit L accordingly. */
>     if (a->l) {
> -        REQUIRE_64BIT(ctx);
>         gen_op_cmp(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
>     } else {
>         gen_op_cmp32(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
> @@ -156,8 +183,35 @@ static bool do_cmp_X(DisasContext *ctx, arg_X_bfl *a, bool s)
>
> static bool do_cmp_D(DisasContext *ctx, arg_D_bf *a, bool s)
> {
> +    if ((ctx->insns_flags & PPC_64B) == 0) {
> +        /*
> +         * For 32-bit implementations, The Programming Environments Manual says
> +         * that "the L field must be cleared, otherwise the instruction form is
> +         * invalid." It seems, however, that most 32-bit CPUs ignore invalid
> +         * forms (e.g., section "Instruction Formats" of the 405 and 440
> +         * manuals, "Integer Compare Instructions" of the 601 manual), with the
> +         * notable exception of the e500 and e500mc, where L=1 was reported to
> +         * cause an exception.
> +         */
> +        if (a->l) {
> +            if ((ctx->insns_flags2 & PPC2_BOOKE206)) {
> +                /*
> +                 * For 32-bit Book E v2.06 implementations (i.e. e500/e500mc),
> +                 * generate an illegal instruction exception.
> +                 */
> +                return false;
> +            } else {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                        "Invalid form of CMP%s at 0x" TARGET_FMT_lx ", L = 1\n",
> +                        s ? "I" : "LI", ctx->cia);
> +            }
> +        }
> +        gen_op_cmp32(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
> +        return true;
> +    }
> +
> +    /* For 64-bit implementations, deal with bit L accordingly. */
>     if (a->l) {
> -        REQUIRE_64BIT(ctx);
>         gen_op_cmp(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
>     } else {
>         gen_op_cmp32(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
>

