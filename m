Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1F910A030
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 15:23:32 +0100 (CET)
Received: from localhost ([::1]:55808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZbkZ-0006FE-P3
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 09:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48745)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iZbi9-0004zm-T0
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 09:21:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iZbi8-0001iG-63
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 09:21:01 -0500
Received: from indium.canonical.com ([91.189.90.7]:49366)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iZbi8-0001hf-0O
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 09:21:00 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iZbi6-00086H-1J
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2019 14:20:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 089CF2E80C9
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2019 14:20:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 Nov 2019 14:14:35 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm virtualization
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell udo-hypervisor
X-Launchpad-Bug-Reporter: Udo Steinberg (udo-hypervisor)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156802847195.6589.6854466446567964580.malonedeb@soybean.canonical.com>
Message-Id: <157477767510.21540.8245202846250360528.malone@soybean.canonical.com>
Subject: [Bug 1843254] Re: arm emulation of HCR.TID3 traps are not implemented
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: e186fe55cf7f4938f9dc3453f610699a1a3368cd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1843254 <1843254@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TID3 trapping should be mostly fixed for 4.2 -- we will trap accesses to
all the coprocessor/sysreg ID registers that TID3 covers. Trapping of
aarch32 MVFR* (which are accessed via vmrs) will not make it into this
release, but should be in 5.0.


** Changed in: qemu
       Status: Confirmed =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843254

Title:
  arm emulation of HCR.TID3 traps are not implemented

Status in QEMU:
  In Progress

Bug description:
  On ARM (aarch64), HCR_EL2.TID3 [bit18] is supposed to trap ID group 3,
  which includes the ID_AA64{PFR,DFR,ISAR,MMFR,AFR}*_EL1 registers.
  However, setting that HCR bit has no effect and accesses to those ID
  registers are not trapped to EL2 with an EC syndrome value of 0x18.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843254/+subscriptions

