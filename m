Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB0169845A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:19:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNJL-0002dP-H4; Wed, 15 Feb 2023 14:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSNJJ-0002ca-T8
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:19:21 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSNJI-0004KO-7F
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:19:21 -0500
Received: by mail-qt1-x833.google.com with SMTP id b21so3455864qtr.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qJ7g6IX5euJOU/ICR2XV996fN091erFr+q3+Poo8Mxw=;
 b=KUVvllM4hUSFG8OLDkXUWh7z+u7q0L+3EDUWHyNO3Q7g/VcuLRi+4WwlJjEh/inOGH
 1wnQjkfMgycSu4RZsoS5KrcKzhY/D8kjVGgdw922ZZFm/iiKa/BMaPII8ZVO3xLPJ4L2
 hEWcX6vV5SAz8ETnD2quzxvNqBf8BzgdBMn24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qJ7g6IX5euJOU/ICR2XV996fN091erFr+q3+Poo8Mxw=;
 b=cPgs4gbJ9l/pBvuhvp44RVxSw+K4CG6KgcoiL/7ufGl+7FqT+fNCDpBwC+x6Am3T+D
 Rk1305lGY+t+qjFfSrrGm0bovuMSRAV/+lkfweB+mTNx1gJ0O1nm4i9LEcfXzAyLcUSx
 wSqgu6xy3LON2zjZYtPLKTnUN0SotIX8AbrJb7oMyXNRZBw3AjhpaSfcqSEriLljxMoE
 uFySWz4RW1h+o1FgFjE9JQNfL29dlZs7BnCB0dzMTOj9e+DLorEkVnpKdV6Ysqr5WzcE
 Q+LElRST5pTTo3K3btAHtH/K+gtQ/ejCe64S8EVEjM5BekKWNp7Uz5nQw04EL3nm6Z41
 HDcg==
X-Gm-Message-State: AO0yUKWaLS1OIUzMeDQi9WzCWSEb41ssWT9pEip9/dl5yjtXy3/rA9s3
 SzYf84SSvkVchm/n6YgqUI0RXsTllVdmt7yi+t4yWQ==
X-Google-Smtp-Source: AK7set/VqP3eUptRpwh8pnfxXWb0xV+DrT2D0gtaqmXZiUHnMA3QF9z+6dgMADD3xS3aBtLVqJbXdThy8Q72L9qpkB0=
X-Received: by 2002:ac8:78d:0:b0:3ba:1d6f:c4b5 with SMTP id
 l13-20020ac8078d000000b003ba1d6fc4b5mr178021qth.12.1676488759195; Wed, 15 Feb
 2023 11:19:19 -0800 (PST)
MIME-Version: 1.0
References: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
 <20230215084754.3816747-4-marcin.nowakowski@fungible.com>
 <05b8264f-c22c-2187-5980-672361fa579b@linaro.org>
In-Reply-To: <05b8264f-c22c-2187-5980-672361fa579b@linaro.org>
From: Marcin Nowakowski <marcin.nowakowski@fungible.com>
Date: Wed, 15 Feb 2023 20:19:03 +0100
Message-ID: <CAN8qkUbTYGJ4fx413HvtqYS6pn3RT62QPVaG6FTnK3E0eesA9A@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/mips: implement CP0.Config7.WII bit support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=marcin.nowakowski@fungible.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Feb 15, 2023 at 7:33 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Marcin,
>
> On 15/2/23 09:47, Marcin Nowakowski wrote:
> > Some older cores use CP0.Config7.WII bit to indicate that a disabled
> > interrupt should wake up a sleeping CPU.
> > Enable this bit by default for M14Kc, which supports that. There are
> > potentially other cores that support this feature, but I do not have a
> > complete list.
>
> Also the P5600 (MIPS-MD01025-2B-P5600-Software-TRM-01.60.pdf,
> "MIPS32=C2=AE P5600 Multiprocessing System Software UM, Revision 01.60).
>
> > Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
> > ---
> >   target/mips/cpu-defs.c.inc | 1 +
> >   target/mips/cpu.c          | 6 ++++--
> >   target/mips/cpu.h          | 1 +
> >   3 files changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
> > index 480e60aeec..57856e2e72 100644
> > --- a/target/mips/cpu-defs.c.inc
> > +++ b/target/mips/cpu-defs.c.inc
> > @@ -354,6 +354,7 @@ const mips_def_t mips_defs[] =3D
> >                          (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C=
1_DA),
> >           .CP0_Config2 =3D MIPS_CONFIG2,
> >           .CP0_Config3 =3D MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (0 << CP=
0C3_VInt),
>
> Per the P5600 doc on Config5.M:
>
>    Configuration continuation bit. Even though the Config6 and Config7
>    registers are used in the P5600 Multiprocessing System, they are both
>    defined as implementation-specific registers. As such, this bit is
>    zero and is not used to indicate the presence of Config6.
>
> Still I suppose we need to set at least Config4.M:
>
>    +        .CP0_Config4 =3D MIPS_CONFIG4,
>    +        .CP0_Config4_rw_bitmask =3D 0,

The definition of MIPS_CONFIG4 doesn't set M-bit, so I assume what you
really meant here is
.CP0_Config4 =3D MIPS_CONFIG4 | (1U << CP0C4_M)
Config3 also doesn't have M-bit set right now, I'll fix that in the
next patch revision.

>
> I'm not sure about:
>
>    +        .CP0_Config5 =3D MIPS_CONFIG5,
>    +        .CP0_Config5_rw_bitmask =3D 0,

M14Kc specification (MD00674-2B-M14Kc-SUM-02.04.pdf) notes the following:
"This bit is reserved. With the current architectural definition, this
bit should always read as a 0."
But I'll add
.CP0_Config5 =3D MIPS_CONFIG5 | (1U << CP0C5_NFExists)
for completeness of the definition.

> > +        .CP0_Config7 =3D 0x1 << CP0C7_WII,
> >           .CP0_LLAddr_rw_bitmask =3D 0,
> >           .CP0_LLAddr_shift =3D 4,
> >           .SYNCI_Step =3D 32,
>
> Could you also set CP0C7_WII to the P5600 definition?

OK, will add that.

Marcin

> > diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> > index 7a565466cb..7ba359696f 100644
> > --- a/target/mips/cpu.c
> > +++ b/target/mips/cpu.c
> > @@ -144,12 +144,14 @@ static bool mips_cpu_has_work(CPUState *cs)
> >       /*
> >        * Prior to MIPS Release 6 it is implementation dependent if non-=
enabled
> >        * interrupts wake-up the CPU, however most of the implementation=
s only
> > -     * check for interrupts that can be taken.
> > +     * check for interrupts that can be taken. For pre-release 6 CPUs,
> > +     * check for CP0 Config7 'Wait IE ignore' bit.
> >        */
> >       if ((cs->interrupt_request & CPU_INTERRUPT_HARD) &&
> >           cpu_mips_hw_interrupts_pending(env)) {
> >           if (cpu_mips_hw_interrupts_enabled(env) ||
> > -            (env->insn_flags & ISA_MIPS_R6)) {
> > +            (env->insn_flags & ISA_MIPS_R6) ||
> > +            (env->CP0_Config7 & (1 << CP0C7_WII))) {
> >               has_work =3D true;
> >           }
> >       }
> > diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> > index 0a085643a3..abee7a99d7 100644
> > --- a/target/mips/cpu.h
> > +++ b/target/mips/cpu.h
> > @@ -980,6 +980,7 @@ typedef struct CPUArchState {
> >   #define CP0C6_DATAPREF        0
> >       int32_t CP0_Config7;
> >       int64_t CP0_Config7_rw_bitmask;
> > +#define CP0C7_WII          31
> >   #define CP0C7_NAPCGEN       2
> >   #define CP0C7_UNIMUEN       1
> >   #define CP0C7_VFPUCGEN      0
>

