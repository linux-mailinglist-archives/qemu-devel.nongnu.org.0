Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955DA2B57B8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 04:16:35 +0100 (CET)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kerTu-0005H6-7k
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 22:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kerT8-0004hb-TQ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 22:15:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:33536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kerT6-0006as-Hm
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 22:15:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kerT4-0005Ag-J8
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 03:15:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 80CE62E811E
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 03:15:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2020 03:05:43 -0000
From: Jacob <1904490@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: intel-hda
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jacob11
X-Launchpad-Bug-Reporter: Jacob (jacob11)
X-Launchpad-Bug-Modifier: Jacob (jacob11)
Message-Id: <160558234310.29971.12864468607339587807.malonedeb@gac.canonical.com>
Subject: [Bug 1904490] [NEW] intel-hda: valid registers are unknown
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: 7e10a513fae6f7a405c67d20b91840ad84ba09d4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 21:20:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1904490 <1904490@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

According to HDA specification, "3.1.2 General Register Behaviors and
Access Requirements":

"All controller registers must be addressable as byte, Word, and Dword
quantities."

But e.g. if you try the following to reset and enable the CORB, assuming
es:esi contains the base MMIO address of the controller,

 es or [esi+4bh], byte 80h   ; reset CORB
corbresetloop:
 es test [esi+4bh], byte 80h ; is HW done resetting yet?
 jnz corbreset1ok            ; yes, bit is now 1
 hlt                         ; wait a little bit
 jmp corbresetloop           ; and check again
corbreset1ok:
 es and [esi+4bh], byte 7fh  ; clear the bit

It will hang indefinitely because the bit never gets set, and if you
enable debug output of the controller with "-device intel-hda,debug=3D1",
you will see infinitely the line "unknown register, addr 0x4b" output.
The same code on a real hardware (I tried with ICH7M) works fine, as it
should according to the spec.

Host/guest/version does not matter (I am writing own drivers) --- as of
right now, latest version still has this code:

https://github.com/qemu/qemu/blob/master/hw/audio/intel-hda.c

which seems to emit "unknown register" message in intel_hda_reg_find(),
and this function does not take into account range of addresses that
each register occupies.

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: intel-hda

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904490

Title:
  intel-hda: valid registers are unknown

Status in QEMU:
  New

Bug description:
  According to HDA specification, "3.1.2 General Register Behaviors and
  Access Requirements":

  "All controller registers must be addressable as byte, Word, and Dword
  quantities."

  But e.g. if you try the following to reset and enable the CORB,
  assuming es:esi contains the base MMIO address of the controller,

   es or [esi+4bh], byte 80h   ; reset CORB
  corbresetloop:
   es test [esi+4bh], byte 80h ; is HW done resetting yet?
   jnz corbreset1ok            ; yes, bit is now 1
   hlt                         ; wait a little bit
   jmp corbresetloop           ; and check again
  corbreset1ok:
   es and [esi+4bh], byte 7fh  ; clear the bit

  It will hang indefinitely because the bit never gets set, and if you
  enable debug output of the controller with "-device intel-
  hda,debug=3D1", you will see infinitely the line "unknown register, addr
  0x4b" output. The same code on a real hardware (I tried with ICH7M)
  works fine, as it should according to the spec.

  Host/guest/version does not matter (I am writing own drivers) --- as
  of right now, latest version still has this code:

  https://github.com/qemu/qemu/blob/master/hw/audio/intel-hda.c

  which seems to emit "unknown register" message in
  intel_hda_reg_find(), and this function does not take into account
  range of addresses that each register occupies.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904490/+subscriptions

