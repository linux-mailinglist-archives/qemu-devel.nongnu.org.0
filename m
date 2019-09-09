Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC8FAD86C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 14:02:41 +0200 (CEST)
Received: from localhost ([::1]:55798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7INU-0000lx-M3
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 08:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44101)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i7ILr-0000Fl-KO
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 08:01:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i7ILq-00045N-Fb
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 08:00:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:43318)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i7ILq-00044P-AC
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 08:00:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i7ILo-00075h-Gf
 for <qemu-devel@nongnu.org>; Mon, 09 Sep 2019 12:00:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7C7002E80C7
 for <qemu-devel@nongnu.org>; Mon,  9 Sep 2019 12:00:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Sep 2019 11:48:23 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm virtualization
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell udo-hypervisor
X-Launchpad-Bug-Reporter: Udo Steinberg (udo-hypervisor)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156802847195.6589.6854466446567964580.malonedeb@soybean.canonical.com>
Message-Id: <156802970358.786.8459777486614113118.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19044";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: af20bcf449af7cd4cfcf437dc924d3a94b500f26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1843254] Re: HCR.TID3 traps are not implemented
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

Yes, we don't currently implement most of the 'trap system register
access' bits in HCR_EL2. Last time I checked we were missing TID0 TID1
TID2 TID3 TIDCP TAC TSW TPC TPU TTLB TVM TRVM TDZ, but it's possible
we've implemented one or two of those since then.


** Changed in: qemu
       Status: New =3D> Confirmed

** Summary changed:

- HCR.TID3 traps are not implemented
+ arm emulation of HCR.TID3 traps are not implemented

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843254

Title:
  arm emulation of HCR.TID3 traps are not implemented

Status in QEMU:
  Confirmed

Bug description:
  On ARM (aarch64), HCR_EL2.TID3 [bit18] is supposed to trap ID group 3,
  which includes the ID_AA64{PFR,DFR,ISAR,MMFR,AFR}*_EL1 registers.
  However, setting that HCR bit has no effect and accesses to those ID
  registers are not trapped to EL2 with an EC syndrome value of 0x18.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843254/+subscriptions

