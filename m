Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F6736FBDC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:03:14 +0200 (CEST)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTjd-0002Bo-NL
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcTXT-0006Vi-IG
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:50:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:35116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcTXR-00005b-B2
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:50:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcTXO-0005tI-V1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:50:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E85692E8144
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 13:40:59 -0000
From: Peter Maydell <1926759@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: muhui pmaydell
X-Launchpad-Bug-Reporter: JIANG Muhui (muhui)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <161978229375.10342.16262082750544447119.malonedeb@gac.canonical.com>
Message-Id: <161979005966.3730.2285025997447056905.malone@chaenomeles.canonical.com>
Subject: [Bug 1926759] Re: WFI instruction results in unhandled CPU exception
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 04726636e8030b07f8890a514519f398a454d6e7
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
Reply-To: Bug 1926759 <1926759@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Crash repros on current QEMU.

This is a bug, in that we shouldn't crash like this. However, it doesn't
really make any sense for a userspace program (which is what a binary
run by qemu-arm is) to execute the WFI instruction, which is largely
intended for OSes to use. If your guest binary needs to use WFI, you
should probably be running it on the system emulation QEMU, which does
handle WFI correctly.


** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926759

Title:
  WFI instruction results in unhandled CPU exception

Status in QEMU:
  Confirmed

Bug description:
  Hi

  I refer to the WFI instruction. The bytecode is 0xe320f003. After the
  execution, qemu exit with the following  crash log.

  qemu: unhandled CPU exception 0x10001 - aborting
  R00=3D00000001 R01=3D40800b34 R02=3D40800b3c R03=3D000102ec
  R04=3D00010a28 R05=3D00010158 R06=3D00087460 R07=3D00010158
  R08=3D00000000 R09=3D00000000 R10=3D00085b7c R11=3D408009f4
  R12=3D40800a08 R13=3D408009f0 R14=3D0001057c R15=3D000102f8
  PSR=3D60000010 -ZC- A usr32
  qemu:handle_cpu_signal received signal outside vCPU context @ pc=3D0x7f5c=
21d0fa12

  WFI aims to enter a low-power state and wait for interrupt. The raised
  exception seems not a right behavior. I can provide a testcase if you
  needed. Many thanks.

  Regards
  Muhui

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926759/+subscriptions

