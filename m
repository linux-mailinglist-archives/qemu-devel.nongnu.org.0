Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37A4361B01
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:02:39 +0200 (CEST)
Received: from localhost ([::1]:34070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJR1-0007vk-1H
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lXJPZ-0007Pd-UJ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 04:01:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:36048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lXJPS-0002qv-OB
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 04:01:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lXJPQ-0003Pr-Mg
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:01:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A9E1A2E806D
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:01:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Apr 2021 07:51:39 -0000
From: ml-0 <1923861@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ml-0 pmaydell
X-Launchpad-Bug-Reporter: ml-0 (ml-0)
X-Launchpad-Bug-Modifier: ml-0 (ml-0)
References: <161841503123.8560.18071871517113740352.malonedeb@gac.canonical.com>
Message-Id: <161855949960.8743.12022565294036654160.malone@gac.canonical.com>
Subject: [Bug 1923861] Re: Hardfault when accessing FPSCR register
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="929bdb49da44562d032228b8f93c5c598dae8678"; Instance="production"
X-Launchpad-Hash: 9a4ab5e90bddb95f725c86c97f304ca03de5e77d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1923861 <1923861@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for the fix. I applied it and
1. yes, the hard fault when reading FPSCR is gone.
2. yes, I also see the UNDEF. Note that on the Corstone-300 MPS3-AN547 FVP =
I can access mvfr0 via vmrs.

I changed the vmrs to ldr. Now I can read the registers. The values differ =
from what the FVP tells me:
fpscr =3D 0x00000000 (qemu-system-arm) - 0x00040000 (Corstone FVP)
mvfr0 =3D 0x10110021                   - 0x10110221
mvfr1 =3D 0x11000011                   - 0x12100211
mvfr2 =3D 0x00000040                   - 0x00000040

Using the FPU for some simple calculations

    volatile int nom_i, den_i;
    nom_i =3D 7;
    den_i =3D 3;
    volatile float nom_f, den_f, div_f;
    nom_f =3D (float)nom_i;
    den_f =3D (float)den_i;
    div_f =3D nom_f / den_f;
    printf("%e / %f =3D %f\r\n", nom_f, den_f, div_f);

I run into another UNDEF when executing =

    vcvt.f64.f32    d6, s12

Again, the FVP can execute the same elf. I attached it. Maybe you can
have another look.

** Attachment added: "test2.elf"
   https://bugs.launchpad.net/qemu/+bug/1923861/+attachment/5488742/+files/=
test2.elf

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923861

Title:
  Hardfault when accessing FPSCR register

Status in QEMU:
  New

Bug description:
  QEMU release version: v6.0.0-rc2

  command line:
  qemu-system-arm -machine mps3-an547 -nographic -kernel <my_project>.elf -=
semihosting -semihosting-config enable=3Don,target=3Dnative

  host operating system: Linux ISCNR90TMR1S 5.4.72-microsoft-standard-
  WSL2 #1 SMP Wed Oct 28 23:40:43 UTC 2020 x86_64 x86_64 x86_64
  GNU/Linux

  guest operating system: none (bare metal)

  Observation:
  I am simulating embedded firmware for a Cortex-M55 device, using MPS3-AN5=
47 machine. In the startup code I am accessing the FPSCR core register:

  =C2=A0=C2=A0=C2=A0=C2=A0unsigned int fpscr =3D__get_FPSCR();
  =C2=A0=C2=A0=C2=A0=C2=A0fpscr =3D fpscr & (~FPU_FPDSCR_AHP_Msk);
  =C2=A0=C2=A0=C2=A0=C2=A0__set_FPSCR(fpscr);

  where the register access functions __get_FPSCR() and
  __set_FPSCR(fpscr) are taken from CMSIS_5 at
  ./CMSIS/Core/include/cmsis_gcc.h

  I observe hardfaults upon __get_FPSCR() and __set_FPSCR(fpscr). The
  same startup code works fine on the Arm Corstone-300 FVP (MPS3-AN547).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923861/+subscriptions

