Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C4E6CDA26
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:09:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVXE-0000sT-D6; Wed, 29 Mar 2023 09:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mikey@neuling.org>)
 id 1phOiZ-00036y-4d; Wed, 29 Mar 2023 01:51:31 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mikey@neuling.org>)
 id 1phOiW-0004r4-5J; Wed, 29 Mar 2023 01:51:30 -0400
Received: from neuling.org (localhost [127.0.0.1])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PmbJd56KRz4x4r;
 Wed, 29 Mar 2023 16:51:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuling.org;
 s=201811; t=1680069074;
 bh=jvGe9SooaXNUeOUC5tfJOPafgDeK/Seo39hyNbqv1z4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=bbds3PagIoutk1M/YAqz/3V25Ruz0veEC8O+NnsOywZ2N3g08hbmIfXwUREPmV8Nf
 6bORpsCYLt70fAR4BRXMaGHdmwrflqqs2dt6MeFt8uICjEKY0d9QHtrw+ADdvCZsYD
 5Zsne6Ta6nqLdw8pR994eDybaZ8szeQtPu79mOLMMEELBB/MGkFzNkhRo89OT/pIii
 yxUG74/cHgW7aFyx7bREBaba8wRunBhipybON1AgqSNAU3m2PPdX4jaEZtdsXSI9su
 QSabjv810R3YNwyXx26OrGzbZ0m6GU/y6fWz6d1zPtzA2TGxODRQQyYVfX4MVJsFas
 9D/XyCJBwbU9A==
Received: by neuling.org (Postfix, from userid 1000)
 id A33C32C0D5D; Wed, 29 Mar 2023 16:51:13 +1100 (AEDT)
Message-ID: <56482fa613790ede02b1fe086639ae33678d1481.camel@neuling.org>
Subject: Re: [PATCH v2 6/6] target/ppc: Implement HEIR SPR
From: Michael Neuling <mikey@neuling.org>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, Daniel Henrique
 Barboza <danielhb413@gmail.com>
Date: Wed, 29 Mar 2023 16:51:13 +1100
In-Reply-To: <20230327131218.2721044-6-npiggin@gmail.com>
References: <20230327131218.2721044-1-npiggin@gmail.com>
 <20230327131218.2721044-6-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=mikey@neuling.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 29 Mar 2023 09:08:07 -0400
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

Nick,

> +    case POWERPC_EXCP_HV_EMU:
> +        env->spr[SPR_HEIR] =3D insn;
> +        if (is_prefix_excp(env, insn)) {
> +            uint32_t insn2 =3D ppc_ldl_code(env, env->nip + 4);
> +            env->spr[SPR_HEIR] |=3D (uint64_t)insn2 << 32;

Are inst and inst2 in the right locations here? I think you might need
insn in the top half and insn2 in the bottom.

I wrote the little test case below. I'd expect GPR0 and GPR1 to end up
with the same value, but they don't with this code

qemu correctly sees the bad prefix instruction as HSRR1[34] is set.

Mikey

% cat heir.S
#define SPR_HEIR        (0x153)
#define SPR_HSRR0	(0x13a)

start:
        . =3D 0x10
        .long (1<<26) | 0
        .long 0x0

	. =3D 0xe40
illegal:
        mfspr 0, SPR_HEIR
        mfspr 2, SPR_HSRR0
        ld    1, 0(2)
	b .

% powerpc64-linux-gnu-gcc -o heir.o -c heir.S
% powerpc64-linux-gnu-objcopy -O binary heir.o
heir.stripped
% qemu-system-ppc64 -nographic-machine powernv10 -cpu POWER10 -display none=
 -vga none -m 1g -accel tcg  -serial mon:stdio -bios /home/mikey/devel/test=
/heir.stripped
QEMU 7.2.91 monitor - type 'help' for more information
(qemu) info registers

CPU#0
NIP 0000000000000e4c   LR 0000000000000000 CTR 0000000000000000 XER
0000000000000000 CPU#0
MSR 9000000000000000 HID0 0000000000000000  HF fc000006 iidx 7 didx 7
TB 00000000 2494783394 DECR 1800184060
GPR00 0000000004000000 0400000000000000 0000000000000010 0000000001000000
GPR04 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR08 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR12 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR28 0000000000000000 0000000000000000 0000000000000000 0000000000000000
CR 00000000  [ -  -  -  -  -  -  -  -  ]             RES ffffffffffffffff
FPR00 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR04 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR08 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR12 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR28 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPSCR 0000000000000000
 SRR0 0000000000000000  SRR1 0000000000000000    PVR 0000000000800200 VRSAV=
E 0000000000000000
SPRG0 0000000000000000 SPRG1 0000000000000000  SPRG2 0000000000000000  SPRG=
3 0000000000000000
SPRG4 0000000000000000 SPRG5 0000000000000000  SPRG6 0000000000000000  SPRG=
7 0000000000000000
HSRR0 0000000000000010 HSRR1 9000000020000000
 CFAR 0000000000000e4c
 LPCR 000000000000000c
 PTCR 0000000000000000   DAR 0000000000000000  DSISR 0000000000000000
(qemu)=20



