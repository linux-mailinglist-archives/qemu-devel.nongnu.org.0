Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5329017BC38
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 12:56:59 +0100 (CET)
Received: from localhost ([::1]:35628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jABb8-0002XH-1R
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 06:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jABa4-0001v8-0b
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:55:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jABa2-0002dJ-K8
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:55:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:36330)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jABa2-0002bQ-Dy
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:55:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jABZz-0004hB-RF
 for <qemu-devel@nongnu.org>; Fri, 06 Mar 2020 11:55:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C981B2E80D0
 for <qemu-devel@nongnu.org>; Fri,  6 Mar 2020 11:55:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Mar 2020 11:49:28 -0000
From: Paolo Bonzini <bonzini@gnu.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alexandre-becholey bonzini
X-Launchpad-Bug-Reporter: =?utf-8?q?Alexandre_B=C3=A9choley_=28alexandre-be?=
 =?utf-8?q?choley=29?=
X-Launchpad-Bug-Modifier: Paolo Bonzini (bonzini)
References: <158257353920.30257.1886439598745813406.malonedeb@wampee.canonical.com>
Message-Id: <158349536811.25994.11144359433290328732.malone@gac.canonical.com>
Subject: [Bug 1864536] Re: Support for XSAVES intel instructions in QEMU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e0878392dc799b267dea80578fa65500a5d74155";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: b286c2237a572779e984053e435414d820cbc868
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

Are you using Libvirt?  If so, you can just remove xsaves in the Libvirt
XML ("<feature policy=3D'disable' name=3D'xsaves'/>">).

It seems to me that this is a Hyper-V bug, but I understand that this is
not a configuration that happens on real hardware.

Adding the flag to all Skylake and newer systems (including Denverton
and Snowridge) is the best choice, but we cannot just add it; if you
want to send a patch, see the "Intel Atom Processor (SnowRidge)" model
for an example of how to do it.

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

