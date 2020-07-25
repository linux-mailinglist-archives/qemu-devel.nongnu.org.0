Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C005F22D95A
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jul 2020 20:42:44 +0200 (CEST)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzP87-0001M3-F4
	for lists+qemu-devel@lfdr.de; Sat, 25 Jul 2020 14:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jzP6M-0000uk-Do
 for qemu-devel@nongnu.org; Sat, 25 Jul 2020 14:40:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:46644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jzP6I-0005fJ-6v
 for qemu-devel@nongnu.org; Sat, 25 Jul 2020 14:40:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jzP6G-00006D-1t
 for <qemu-devel@nongnu.org>; Sat, 25 Jul 2020 18:40:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C70022E80ED
 for <qemu-devel@nongnu.org>; Sat, 25 Jul 2020 18:40:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2020 18:33:38 -0000
From: Matthieu Bucchianeri <1888918@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided;
 assignee=matthieu.bucchianeri@leostella.com; 
X-Launchpad-Bug-Tags: floating ppc spe
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: matthieu-bucchianeri
X-Launchpad-Bug-Reporter: Matthieu Bucchianeri (matthieu-bucchianeri)
X-Launchpad-Bug-Modifier: Matthieu Bucchianeri (matthieu-bucchianeri)
References: <159564442748.29789.2028598939567190639.malonedeb@chaenomeles.canonical.com>
Message-Id: <159570201816.30472.6019236341967070843.malone@gac.canonical.com>
Subject: [Bug 1888918] Re: qemu-system-ppc: Floating point instructions do not
 properly generate the SPE/Embedded Floating-Point Unavailable
 interrupt
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e85d0ab92e2924d39b8285aeae075a01d25eff06";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 6f16e4b5482afa75839840bcec0c5049b169abfd
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/25 14:40:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1888918 <1888918@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Note that on the MPC8548, it is observed that the "brinc"
> instruction does generate the interrupt, which contradicts
> section 4.2.3 SPE/Embedded Floating-Point Unavailable Interrupt
> of the Signal Processing Engine (SPE) Programming Environments
> Manual, Rev. 0 (see the quote in the description). The test
> program was modified to pass 100% on real hardware, hence
> claiming that "brinc" shall generate the interrupt.

I have actually dug up some more on this and changed my mind. There are
more references in the PowerPC documentation indicating that "brinc"
shall NOT generate the interrupt.

In the EREF: A Programmer=E2=80=99s Reference Manual for Freescale Power
Architecture Processors, Rev. 1 (EIS 2.1), Table 4-22. MSR Field
Descriptions clearly states that when SPV=3D=3D0:

> The processor cannot execute any category SPE, SP.FD, or SP.FV
> instructions except for the brinc instruction.

The patch that I am submitting to fix this bug will leave the behavior
of "brinc" unchanged (ie: to not generate the interrupt).

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888918

Title:
  qemu-system-ppc: Floating point instructions do not properly generate
  the SPE/Embedded Floating-Point Unavailable interrupt

Status in QEMU:
  New

Bug description:
  When emulating certain floating point instructions or vector
  instructions on PowerPC machines, QEMU does not properly generate the
  SPE/Embedded Floating-Point Unavailable interrupt.

  As described in the Signal Processing Engine (SPE) Programming
  Environments Manual, Rev. 0, available at https://www.nxp.com/docs/en
  /reference-manual/SPEPEM.pdf:

  > An SPE/embedded floating-point unavailable exception occurs on an attem=
pt to execute any of the
  > following instructions and MSR[SPV] is not set:
  > * SPE instruction (except brinc)
  > * An embedded scalar double-precision instruction
  > * A vector single-precision floating-point instructions
  > It is not used by embedded scalar single-precision floating-point instr=
uctions

  This behavior was partially reported in Bug #1611394, however the
  issue is larger than what is described in that bug. As mentioned in
  that bug, some single-precision instructions generate the exception
  (while they should not), which is incorrect but does not typically
  produce an incorrect output. What is more of an issue is that several
  double-precision and vector instructions do not generate the exception
  (while they should), and this breaks support for lazy FPU/vector
  context switching in Linux (for example).

  The upper 32-bit of the double-precision/vector registers (which are
  in fact hidden in the general purpose registers) is not properly
  saved/restored, and this causes arithmetic errors. This was observed
  very frequently on a commercial project that does a lot of double-
  precision computations. The application works perfectly fine on an
  MPC8548 CPU, but fails often with QEMU.

  This is only an issue with full platform emulation - the SPE/Embedded
  Floating-Point Unavailable interrupt is not relevant for application
  emulation.

  The issue can be reproduced using the attached Linux program "spe-
  bug.c". This program properly prints the number 42 (as the result of
  some very simple double-precision computation) on real PowerPC
  hardware, but prints an incorrect result (typically 0) on QEMU.

  This issue was first discovered in an older version of QEMU, but is
  also reproduced in the latest:

  # git rev-parse HEAD
  7adfbea8fd1efce36019a0c2f198ca73be9d3f18
  # ppc-softmmu/qemu-system-ppc --version
  QEMU emulator version 5.0.91 (v5.1.0-rc1-28-g7adfbea8fd-dirty)
  Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

  Upon further analysis a total of 39 instructions are misbehaving:

  efsabs: raised: 1, expected: 0
  efsnabs: raised: 1, expected: 0
  efsneg: raised: 1, expected: 0
  efdcfs: raised: 0, expected: 1
  efdcfsf: raised: 0, expected: 1
  efdcfsi: raised: 0, expected: 1
  efdcfuf: raised: 0, expected: 1
  efdcfui: raised: 0, expected: 1
  efdctsf: raised: 0, expected: 1
  efdctsi: raised: 0, expected: 1
  efdctsiz: raised: 0, expected: 1
  efdctuf: raised: 0, expected: 1
  efdctui: raised: 0, expected: 1
  efdctuiz: raised: 0, expected: 1
  efscfd: raised: 0, expected: 1
  evfscfsf: raised: 0, expected: 1
  evfscfsi: raised: 0, expected: 1
  evfscfuf: raised: 0, expected: 1
  evfscfui: raised: 0, expected: 1
  evfsctsf: raised: 0, expected: 1
  evfsctsi: raised: 0, expected: 1
  evfsctsiz: raised: 0, expected: 1
  evfsctuf: raised: 0, expected: 1
  evfsctui: raised: 0, expected: 1
  evfsctuiz: raised: 0, expected: 1
  brinc: raised: 0, expected: 1
  efsadd: raised: 1, expected: 0
  efsdiv: raised: 1, expected: 0
  efsmul: raised: 1, expected: 0
  efssub: raised: 1, expected: 0
  evsplatfi: raised: 0, expected: 1
  evsplati: raised: 0, expected: 1
  efscmpeq: raised: 1, expected: 0
  efscmpgt: raised: 1, expected: 0
  efscmplt: raised: 1, expected: 0
  efststeq: raised: 1, expected: 0
  efststgt: raised: 1, expected: 0
  efststlt: raised: 1, expected: 0
  evsel: raised: 0, expected: 1

  When "raised" is 0 and "expected" is 1, this means that the SPE/Embedded =
Floating-Point Unavailable interrupt was not generated while it should have.
  When "raised" is 1 and "expected" is 0, this means that the SPE/Embedded =
Floating-Point Unavailable interrupt was generated while it should not have=
 (Bug #1611394).

  A comprehensive program testing all the instructions listed in the
  Signal Processing Engine (SPE) Programming Environments Manual, Rev. 0
  is posted in the comments of this ticket, and can be used to reproduce
  the issue, and validate the future fix.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1888918/+subscriptions

