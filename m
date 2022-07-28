Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77080583827
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 07:36:09 +0200 (CEST)
Received: from localhost ([::1]:33940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGwBs-0002m7-8L
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 01:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1oGw5g-00085P-O6; Thu, 28 Jul 2022 01:29:44 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1oGw5d-0001iW-Ir; Thu, 28 Jul 2022 01:29:44 -0400
Received: by mail-wr1-x432.google.com with SMTP id v17so749449wrr.10;
 Wed, 27 Jul 2022 22:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/JkBbpIWZXcAxve5KK0nrCKA6K831YyKe1c0Yb4Z+OE=;
 b=T1u8//tSiOBcrQeFkWvA/u3dviIw3WzfeVs/04+m95Be5w1TsUWsT4SeOWpcpEaLRo
 SYu9ZQnMtyzWxnWsDOVPeJbnFgHk9c5XvbUB8nqddLAxCX3xxjnJ1uOFX7peQPpiW552
 D6SCMCc02tRRVyCo8arWWEsVNEeWUGeqZxbcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/JkBbpIWZXcAxve5KK0nrCKA6K831YyKe1c0Yb4Z+OE=;
 b=UtSLSnOvkdEyjClQnDkDB9zWFSU8Xb58jQV4CYAvbtqO2Kq9/4mBdZYudELTiqz4Nx
 ju5yPhZVwfImAfn68bPRXh68Xo3uyotwf8oJOCc/HvC4i+fnf8yyO729sO9JUOacjvEn
 mKSSGocVsEhpBp4iDmmnQjFQPVVEkyQ9qaVHquf8pXTqU97FOfYWxh4Af84RuKoqBMgT
 lKu0hvrjtSoqeWZDtOurIXZq5frIqPa1cabc5uA7fVE6gMbBn+AsJWFTYcWLrlgQsZXm
 cFMZYCudBaGk3Iz/+QKyuy9cMAJb5xwvv9Y7/VB2BS9Prb2+u3fLiNBPJolWs9KNeGpw
 6rRg==
X-Gm-Message-State: AJIora8GRxOm9tebkFGq3dFG9iG+yrY4LlXXDfd431+Na1kXC6AN6+vU
 OhqtmjUP/xvDXhH7g/9nrjbkl9yqfWtLh85pdH8=
X-Google-Smtp-Source: AGRyM1vqEMpxyavMUsVtDfv6yjQZLxFuEKIqHJ95jqZIKrd2ycVeYa5Q37c4CecbCGizifZS9XDyRZe0KHGcnFxsQVA=
X-Received: by 2002:a5d:64c7:0:b0:21d:a743:394 with SMTP id
 f7-20020a5d64c7000000b0021da7430394mr15579249wri.628.1658986179174; Wed, 27
 Jul 2022 22:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220720133352.904263-1-npiggin@gmail.com>
 <5df2f253-7b74-1553-348c-370b78876c33@gmail.com>
In-Reply-To: <5df2f253-7b74-1553-348c-370b78876c33@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jul 2022 05:29:26 +0000
Message-ID: <CACPK8XeZm2_Thk7cJEWCEvVFGdpqr+VpMcrQ8DykGMRRnbozdw@mail.gmail.com>
Subject: Re: [PATCH v3] target/ppc: Implement new wait variants
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org, 
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?V=C3=ADctor_Colombo?= <victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Wed, 27 Jul 2022 at 13:49, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
>
>
> On 7/20/22 10:33, Nicholas Piggin wrote:
> > ISA v2.06 adds new variations of wait, specified by the WC field. These
> > are not all compatible with the prior wait implementation, because they
> > add additional conditions that cause the processor to resume, which can
> > cause software to hang or run very slowly.
>
> So I suppose this is not a new feature, but a bug fix to remediate these hangs
> cause by the incompatibility of the WC field  with other ISA versions. Is
> that right?

That's the case. Nick has some kernel patches that make Linux use the
new opcode:

 https://lore.kernel.org/all/20220720132132.903462-1-npiggin@gmail.com/

With these applied the kernel hangs during boot if more than one CPU
is present. I was able to reproduce with ppc64le_defconfig and this
command line:

 qemu-system-ppc64 -M pseries,x-vof=on -cpu POWER10 -smp 2 -nographic
-kernel zImage.pseries -no-reboot

Qemu will exit (as there's no filesystem) if the test "passes", or
hang during boot if it hits the bug.

There's a kernel here with the patches applied in case someone else
wants to test:

https://ozlabs.org/~joel/zImage.pseries-v5.19-rc8-wait-v3

Tested-by: Joel Stanley <joel@jms.id.au>

Because of the hang it would be best if we merged the patch as a fix
sooner rather than later.

Cheers,

Joel

> I'm explicitly asking for it because if it's a bug fix it's ok to pick it
> during the freeze. Especially here, given that what you're doing is mostly
> adding no-ops for conditions that we're not covering.
>
> >
> > ISA v3.0 changed the wait opcode and removed the new variants (retaining
> > the WC field but making non-zero values reserved).
> >
> > ISA v3.1 added new WC values to the new wait opcode, and added a PL
> > field.
> >
> > This implements the new wait encoding and supports WC variants with
> > no-op implementations, which provides basic correctness as explained in
> > comments.
> >
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> > v3:
> > - Add EXTRACT_HELPERs
> > - Reserved fields should be ignored, not trap.
> > - v3.1 defines special case of reserved PL values being treated as
> >    a no-op when WC=2.
> > - Change code organization to (hopefully) be easier to follow each
> >    ISA / variation.
> > - Tested old wait variant with Linux e6500 boot and verify that
> >    gen_wait is called and takes the expected path.
> >
> > Thanks,
> > Nick
> >
> >   target/ppc/internal.h  |  3 ++
> >   target/ppc/translate.c | 96 ++++++++++++++++++++++++++++++++++++++----
> >   2 files changed, 91 insertions(+), 8 deletions(-)
> >
> > diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> > index 2add128cd1..57c0a42a6b 100644
> > --- a/target/ppc/internal.h
> > +++ b/target/ppc/internal.h
> > @@ -168,6 +168,9 @@ EXTRACT_HELPER_SPLIT_3(DX, 10, 6, 6, 5, 16, 1, 1, 0, 0)
> >   /* darn */
> >   EXTRACT_HELPER(L, 16, 2);
> >   #endif
> > +/* wait */
> > +EXTRACT_HELPER(WC, 21, 2);
> > +EXTRACT_HELPER(PL, 16, 2);
> >
> >   /***                            Jump target decoding                       ***/
> >   /* Immediate address */
> > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > index 1d6daa4608..e0a835ac90 100644
> > --- a/target/ppc/translate.c
> > +++ b/target/ppc/translate.c
> > @@ -4066,12 +4066,91 @@ static void gen_sync(DisasContext *ctx)
> >   /* wait */
> >   static void gen_wait(DisasContext *ctx)
> >   {
> > -    TCGv_i32 t0 = tcg_const_i32(1);
> > -    tcg_gen_st_i32(t0, cpu_env,
> > -                   -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
> > -    tcg_temp_free_i32(t0);
> > -    /* Stop translation, as the CPU is supposed to sleep from now */
> > -    gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
> > +    uint32_t wc;
> > +
> > +    if (ctx->insns_flags & PPC_WAIT) {
> > +        /* v2.03-v2.07 define an older incompatible 'wait' encoding. */
> > +
> > +        if (ctx->insns_flags2 & PPC2_PM_ISA206) {
> > +            /* v2.06 introduced the WC field. WC > 0 may be treated as no-op. */
> > +            wc = WC(ctx->opcode);
> > +        } else {
> > +            wc = 0;
> > +        }
> > +
> > +    } else if (ctx->insns_flags2 & PPC2_ISA300) {
> > +        /* v3.0 defines a new 'wait' encoding. */
> > +        wc = WC(ctx->opcode);
>
>
> The ISA seems to indicate that WC=3 is always reserved in both ISA300 and
> ISA310. I believe you can check for WC=3 and gen_invalid() return right
> off the bat at this point.
>
>
> Thanks,
>
>
> Daniel
>
>
>
> > +        if (ctx->insns_flags2 & PPC2_ISA310) {
> > +            uint32_t pl = PL(ctx->opcode);
> > +
> > +            /* WC 1,2 may be treated as no-op. WC 3 is reserved. */
> > +            if (wc == 3) {
> > +                gen_invalid(ctx);
> > +                return;
> > +            }
> > +
> > +            /* PL 1-3 are reserved. If WC=2 then the insn is treated as noop. */
> > +            if (pl > 0 && wc != 2) {
> > +                gen_invalid(ctx);
> > +                return;
> > +            }
> > +
> > +        } else { /* ISA300 */
> > +            /* WC 1-3 are reserved */
> > +            if (wc > 0) {
> > +                gen_invalid(ctx);
> > +                return;
> > +            }
> > +        }
> > +
> > +    } else {
> > +        warn_report("wait instruction decoded with wrong ISA flags.");
> > +        gen_invalid(ctx);
> > +        return;
> > +    }
> > +
> > +    /*
> > +     * wait without WC field or with WC=0 waits for an exception / interrupt
> > +     * to occur.
> > +     */
> > +    if (wc == 0) {
> > +        TCGv_i32 t0 = tcg_const_i32(1);
> > +        tcg_gen_st_i32(t0, cpu_env,
> > +                       -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
> > +        tcg_temp_free_i32(t0);
> > +        /* Stop translation, as the CPU is supposed to sleep from now */
> > +        gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
> > +    }
> > +
> > +    /*
> > +     * Other wait types must not just wait until an exception occurs because
> > +     * ignoring their other wake-up conditions could cause a hang.
> > +     *
> > +     * For v2.06 and 2.07, wc=1,2,3 are architected but may be implemented as
> > +     * no-ops.
> > +     *
> > +     * wc=1 and wc=3 explicitly allow the instruction to be treated as a no-op.
> > +     *
> > +     * wc=2 waits for an implementation-specific condition, such could be
> > +     * always true, so it can be implemented as a no-op.
> > +     *
> > +     * For v3.1, wc=1,2 are architected but may be implemented as no-ops.
> > +     *
> > +     * wc=1 (waitrsv) waits for an exception or a reservation to be lost.
> > +     * Reservation-loss may have implementation-specific conditions, so it
> > +     * can be implemented as a no-op.
> > +     *
> > +     * wc=2 waits for an exception or an amount of time to pass. This
> > +     * amount is implementation-specific so it can be implemented as a
> > +     * no-op.
> > +     *
> > +     * ISA v3.1 allows for execution to resume "in the rare case of
> > +     * an implementation-dependent event", so in any case software must
> > +     * not depend on the architected resumption condition to become
> > +     * true, so no-op implementations should be architecturally correct
> > +     * (if suboptimal).
> > +     */
> >   }
> >
> >   #if defined(TARGET_PPC64)
> > @@ -6852,8 +6931,9 @@ GEN_HANDLER2(stdcx_, "stdcx.", 0x1F, 0x16, 0x06, 0x00000000, PPC_64B),
> >   GEN_HANDLER_E(stqcx_, 0x1F, 0x16, 0x05, 0, PPC_NONE, PPC2_LSQ_ISA207),
> >   #endif
> >   GEN_HANDLER(sync, 0x1F, 0x16, 0x12, 0x039FF801, PPC_MEM_SYNC),
> > -GEN_HANDLER(wait, 0x1F, 0x1E, 0x01, 0x03FFF801, PPC_WAIT),
> > -GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039FF801, PPC_NONE, PPC2_ISA300),
> > +/* ISA v3.0 changed the extended opcode from 62 to 30 */
> > +GEN_HANDLER(wait, 0x1F, 0x1E, 0x01, 0x039FF801, PPC_WAIT),
> > +GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039CF801, PPC_NONE, PPC2_ISA300),
> >   GEN_HANDLER(b, 0x12, 0xFF, 0xFF, 0x00000000, PPC_FLOW),
> >   GEN_HANDLER(bc, 0x10, 0xFF, 0xFF, 0x00000000, PPC_FLOW),
> >   GEN_HANDLER(bcctr, 0x13, 0x10, 0x10, 0x00000000, PPC_FLOW),
>

