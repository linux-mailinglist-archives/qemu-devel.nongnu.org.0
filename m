Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BAC377B9A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 07:42:45 +0200 (CEST)
Received: from localhost ([::1]:48886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfygm-00028t-4d
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 01:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfyey-0001N0-Sy
 for qemu-devel@nongnu.org; Mon, 10 May 2021 01:40:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:60010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfyet-00028j-NY
 for qemu-devel@nongnu.org; Mon, 10 May 2021 01:40:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfyer-0000Dx-Kj
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:40:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7C9012E8135
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:40:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 05:34:58 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1920602@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aaro-koskinen philmd
X-Launchpad-Bug-Reporter: Aaro Koskinen (aaro-koskinen)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161624570188.19824.1091833072893020317.malonedeb@wampee.canonical.com>
Message-Id: <162062489848.10201.1434216440641956846.malone@chaenomeles.canonical.com>
Subject: [Bug 1920602] Re: QEMU crash after a QuickBASIC program integer
 overflow
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 9bcf228ff5d622bca46f611b594f67f1a993716d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1920602 <1920602@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FErr# IRQ raise since bf13bfab084 ("i386: implement IGNNE"):

  Change the handling of port F0h writes and FPU exceptions to implement IG=
NNE.
  =

  The implementation mixes a bit what the chipset and processor do in real
  hardware, but the effect is the same as what happens with actual FERR#
  and IGNNE# pins: writing to port F0h asserts IGNNE# in addition to loweri=
ng
  FP_IRQ; while clearing the SE bit in the FPU status word deasserts IGNNE#.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920602

Title:
  QEMU crash after a QuickBASIC program integer overflow

Status in QEMU:
  Confirmed

Bug description:
  A trivial program compiled with QuickBASIC 4.5 with integer overflow
  will crash QEMU when ran under MS-DOS 5.0 or FreeDOS 1.2:

  C:\KILLER>type killer.bas
  A% =3D VAL("99999"):PRINT A%

  C:\KILLER>killer.exe
  **
  =C2=A0=C2=A0ERROR:../qemu-5.2.0/accel/tcg/tcg-cpus.c:541:tcg_handle_inter=
rupt: assertion failed: (qemu_mutex_iothread_locked())
  Aborted

  QEMU version v5.2, compiler for ARM, and started with command line:

  qemu-system-i386 -curses -cpu 486 -m 1 -drive dos.img

  The same test under Ubuntu QEMU and KVM/x86_64 (QEMU emulator version
  4.2.1 (Debian 1:4.2-3ubuntu6.14)) will just silently hang the QEMU. On
  DOSBOX, the machine does not die and program outputs the value -31073.

  The EXE to reproduce the issue is attached.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920602/+subscriptions

