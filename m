Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4C31094F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:41:01 +0100 (CET)
Received: from localhost ([::1]:47608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yXs-0005E0-Jh
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7ySt-0000OO-38
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:35:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:45576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7ySo-0000Lp-L9
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:35:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l7ySl-0002yI-Q7
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 10:35:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 968522E8145
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 10:35:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Feb 2021 10:21:25 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1914748@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm ui
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
Message-Id: <161252048562.1830.10693944288608245237.malonedeb@gac.canonical.com>
Subject: [Bug 1914748] [NEW] Confuse error message when KVM can not start
 requested CPU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: ba492fe3bacc077c1d0eaad915dddfccca34e384
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1914748 <1914748@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

As of commit 1ba089f2255, on Cavium CN8890 (ThunderX cores):

$ qemu-system-aarch64 -display none -accel kvm -M virt,gic-version=3D3 -acc=
el kvm -cpu cortex-a57 --trace \*kvm_vcpu\* =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
kvm_vcpu_ioctl cpu_index 0, type 0x4020aeae, arg 0xffff9b7f9b18 =

qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid =
argument

(same using "-cpu cortex-a53" or cortex-a72).

Explanation from Peter Maydell on IRC:
> using a specific cpu type will only work with KVM if the host CPU really =
is that
> exact CPU type, otherwise, use "-cpu host" or "-cpu max"

Having a better error description would help to understand the reason.

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: arm ui

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914748

Title:
  Confuse error message when KVM can not start requested CPU

Status in QEMU:
  New

Bug description:
  As of commit 1ba089f2255, on Cavium CN8890 (ThunderX cores):

  $ qemu-system-aarch64 -display none -accel kvm -M virt,gic-version=3D3 -a=
ccel kvm -cpu cortex-a57 --trace \*kvm_vcpu\* =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
  kvm_vcpu_ioctl cpu_index 0, type 0x4020aeae, arg 0xffff9b7f9b18 =

  qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invali=
d argument

  (same using "-cpu cortex-a53" or cortex-a72).

  Explanation from Peter Maydell on IRC:
  > using a specific cpu type will only work with KVM if the host CPU reall=
y is that
  > exact CPU type, otherwise, use "-cpu host" or "-cpu max"

  Having a better error description would help to understand the reason.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914748/+subscriptions

