Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D7916B0BE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 21:02:07 +0100 (CET)
Received: from localhost ([::1]:41606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6JvZ-0004AC-QA
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 15:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j6JuT-0003h1-Rs
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:00:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j6JuS-00072D-Ey
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:00:57 -0500
Received: from indium.canonical.com ([91.189.90.7]:42744)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j6JuS-00071L-83
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:00:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j6JuQ-0002Cx-DK
 for <qemu-devel@nongnu.org>; Mon, 24 Feb 2020 20:00:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 634BD2E80AD
 for <qemu-devel@nongnu.org>; Mon, 24 Feb 2020 20:00:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Feb 2020 19:45:39 -0000
From: =?utf-8?q?Alexandre_B=C3=A9choley?= <alexandre.becholey@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alexandre-becholey
X-Launchpad-Bug-Reporter: =?utf-8?q?Alexandre_B=C3=A9choley_=28alexandre-be?=
 =?utf-8?q?choley=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Alexandre_B=C3=A9choley_=28alexandre-be?=
 =?utf-8?q?choley=29?=
Message-Id: <158257353920.30257.1886439598745813406.malonedeb@wampee.canonical.com>
Subject: [Bug 1864536] [NEW] Support for XSAVES intel instructions in QEMU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="19413b719a8df7423ab1390528edadce9e0e4aca";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: f30c0b3317b744d5519fa95d25ad1681fd0ed25c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1864536 <1864536@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Dear QEMU developers,

I am running Hyper-V on qemu+kvm. During it initialization, it checks
for XSAVES support: first it executes CPUID with EAX =3D 0xd and ECX =3D 1
and looks at bit 3 in the returned value of EAX (Supports XSAVES/XRSTORS
and IA32_XSS [1]), and then it reads the MSR IA32_VMX_PROCBASED_CTLS2
(index 0x48B) and looks at bit 20 (Enable XSAVES/XSTORS [2]). If CPUID
shows that XSAVES is supported and the bit is not enabled in the MSR,
Hyper-V decides to fail and stops its initialization. It used to work
until last spring/summer where something might have changed in either
KVM or QEMU.

It seems that KVM sets the correct flags (in CPUID and the MSR) when the ho=
st CPU supports XSAVES. In QEMU, based on comments in target/i386/cpu.c it =
seems that XSAVES is not added in
builtin_x86_defs[].features[FEAT_VMX_SECONDARY_CTLS] because it might break=
 live migration. Therefore, when setting the MSR for the vcpu, QEMU is mask=
ing off the feature.

I have tested two possible solutions:
- adding the flag in .features[FEAT_VMX_SECONDARY_CTLS]
- removing the support of the instruction in feature_word_info[FEAT_XSAVE].=
feat_names

Both solutions work and Hyper-v is happily running. I can provide a
patch for the solution you might consider applying. Otherwise, is there
a better way to fix the issue?

Qemu version: 4.2.0
Kernel version: 5.5.4
Qemu command: https://gist.github.com/0xabe-io/b4d797538e2160252addc1d1d647=
38e2


Many thanks,
Alexandre

Ref:
[1] Intel SDM Volume 2A, chapter 3, page 196
[2] Intel SDM Volume 3C, chapter 24, page 11

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1864536

Title:
  Support for XSAVES intel instructions in QEMU

Status in QEMU:
  New

Bug description:
  Dear QEMU developers,

  I am running Hyper-V on qemu+kvm. During it initialization, it checks
  for XSAVES support: first it executes CPUID with EAX =3D 0xd and ECX =3D 1
  and looks at bit 3 in the returned value of EAX (Supports
  XSAVES/XRSTORS and IA32_XSS [1]), and then it reads the MSR
  IA32_VMX_PROCBASED_CTLS2 (index 0x48B) and looks at bit 20 (Enable
  XSAVES/XSTORS [2]). If CPUID shows that XSAVES is supported and the
  bit is not enabled in the MSR, Hyper-V decides to fail and stops its
  initialization. It used to work until last spring/summer where
  something might have changed in either KVM or QEMU.

  It seems that KVM sets the correct flags (in CPUID and the MSR) when the =
host CPU supports XSAVES. In QEMU, based on comments in target/i386/cpu.c i=
t seems that XSAVES is not added in
  builtin_x86_defs[].features[FEAT_VMX_SECONDARY_CTLS] because it might bre=
ak live migration. Therefore, when setting the MSR for the vcpu, QEMU is ma=
sking off the feature.

  I have tested two possible solutions:
  - adding the flag in .features[FEAT_VMX_SECONDARY_CTLS]
  - removing the support of the instruction in feature_word_info[FEAT_XSAVE=
].feat_names

  Both solutions work and Hyper-v is happily running. I can provide a
  patch for the solution you might consider applying. Otherwise, is
  there a better way to fix the issue?

  Qemu version: 4.2.0
  Kernel version: 5.5.4
  Qemu command: https://gist.github.com/0xabe-io/b4d797538e2160252addc1d1d6=
4738e2

  =

  Many thanks,
  Alexandre

  Ref:
  [1] Intel SDM Volume 2A, chapter 3, page 196
  [2] Intel SDM Volume 3C, chapter 24, page 11

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1864536/+subscriptions

