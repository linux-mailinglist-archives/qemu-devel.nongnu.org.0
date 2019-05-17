Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8A021782
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 13:13:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRanW-0003LH-85
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 07:13:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hRagH-0004mH-UY
	for qemu-devel@nongnu.org; Fri, 17 May 2019 07:05:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hRaRg-0000Ue-Pl
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:50:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:46036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hRaRg-0000Lg-Jr
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:50:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hRaRe-00027g-IQ
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 10:50:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 863BD2E804E
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 10:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 May 2019 10:38:39 -0000
From: arseniy <1829498@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ffhguy
X-Launchpad-Bug-Reporter: arseniy (ffhguy)
X-Launchpad-Bug-Modifier: arseniy (ffhguy)
Message-Id: <155808951981.15307.7632909900341712173.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18962";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: c12e7329f99b459dd0727205bef9317846fc103e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1829498] [NEW] window 8 stuck during boot on Qemu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1829498 <1829498@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Description of problem:
I've got windows 8 image(64 bit), installed on Qemu(x86-64_softmmu) and the=
n i'm trying to boot/shutdown it in the same Qemu configuration. Windows 8 =
has feature - when you click "Shutdown" in UI, windows 8 doesn't actually p=
ower off, it goes to "Suspend to disc" ACPI state. After shutdown, i'm tryi=
ng to boot it again, but it stucks during boot.

I've discovered, that it hangs when windows 8 writes to AHCI's command regi=
ster, AHCI triggers irq, but windows 8 sends EOI, don't accessing AHCI regi=
ster,so irq line stills in high state, and irq will be injected again and a=
gain, while windows will send EOI on each AHCI interrupt. Strange thing is =
that it happens only on TCG mode or =

with option "kernel-irqchip=3Doff/split", with "kernel-irqchip=3Don" everyt=
hing works ok(windows 8 accesses AHCI register and line goes to low state).

Version-Release number of selected component (if applicable):
Qemu revision: d8276573da58e8ce78dab8c46dd660efd664bcb7


Steps to Reproduce:
1. Install Windows 8 on QEMU(qemu command line: "-enable-kvm -m 1G -hda <im=
age>  -serial stdio  -cpu core2duo -machine q35,kernel-irqchip=3Doff"
2. Click shutdown in UI.
3. Try to boot again(it will stuck)
4. Kill Qemu and boot again, it will boot, now go to 2) :)

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1829498

Title:
  window 8 stuck during boot on Qemu

Status in QEMU:
  New

Bug description:
  Description of problem:
  I've got windows 8 image(64 bit), installed on Qemu(x86-64_softmmu) and t=
hen i'm trying to boot/shutdown it in the same Qemu configuration. Windows =
8 has feature - when you click "Shutdown" in UI, windows 8 doesn't actually=
 power off, it goes to "Suspend to disc" ACPI state. After shutdown, i'm tr=
ying to boot it again, but it stucks during boot.

  I've discovered, that it hangs when windows 8 writes to AHCI's command re=
gister, AHCI triggers irq, but windows 8 sends EOI, don't accessing AHCI re=
gister,so irq line stills in high state, and irq will be injected again and=
 again, while windows will send EOI on each AHCI interrupt. Strange thing i=
s that it happens only on TCG mode or =

  with option "kernel-irqchip=3Doff/split", with "kernel-irqchip=3Don" ever=
ything works ok(windows 8 accesses AHCI register and line goes to low state=
).

  Version-Release number of selected component (if applicable):
  Qemu revision: d8276573da58e8ce78dab8c46dd660efd664bcb7

  =

  Steps to Reproduce:
  1. Install Windows 8 on QEMU(qemu command line: "-enable-kvm -m 1G -hda <=
image>  -serial stdio  -cpu core2duo -machine q35,kernel-irqchip=3Doff"
  2. Click shutdown in UI.
  3. Try to boot again(it will stuck)
  4. Kill Qemu and boot again, it will boot, now go to 2) :)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1829498/+subscriptions

