Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE1D3BB664
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 06:32:46 +0200 (CEST)
Received: from localhost ([::1]:52172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0GHl-0004XB-A6
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 00:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBk-0004Y0-7I
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:32 -0400
Received: from indium.canonical.com ([91.189.90.7]:49526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBi-0002zD-2t
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:31 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0GBU-0004Rq-Iz
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 04:26:17 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A0BD62E8291
 for <qemu-devel@nongnu.org>; Mon,  5 Jul 2021 04:26:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Jul 2021 04:17:34 -0000
From: Launchpad Bug Tracker <1809546@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dumanovskis janitor pmaydell th-huth
X-Launchpad-Bug-Reporter: Daniels Umanovskis (dumanovskis)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154549130563.19742.15114184471142076379.malonedeb@soybean.canonical.com>
Message-Id: <162545865436.12677.14330414052199558174.malone@loganberry.canonical.com>
Subject: [Bug 1809546] Re: Writing a byte to a pl011 SFR overwrites the whole
 SFR
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 3353c877014af61e17c866ef3398c4944de4310e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1809546 <1809546@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1809546

Title:
  Writing a byte to a pl011 SFR overwrites the whole SFR

Status in QEMU:
  Expired

Bug description:
  The bug is present in QEMU 2.8.1 and, if my analysis is correct, also
  on master.

  I first noticed that a PL011 UART driver, which is fine on real
  hardware, fails to enable the RX interrupt in the IMSC register when
  running in QEMU. However, the problem only comes up if the code is
  compiled without optimizations. I think I've narrowed it down to a
  minimal example that will exhibit the problem if run as a bare-metal
  application.

  Given:

  pl011_addr: .word 0x10009000

  The following snippet will be problematic:

       ldr r3, pl011_addr
       ldrb r2, [r3, #0x38]        // IMSC
       mov r2, #0
       orr r2, r2, #0x10           // R2 =3D=3D 0x10
       strb r2, [r3, #0x38]        // Whole word reads correctly after this
       ldrb r2, [r3, #0x39]
       mov r2, #0
       strb r2, [r3, #0x39]        // Problem here! Overwrites offset 0x38 =
as well

  After the first strb instruction, which writes to 0x10009038,
  everything is fine. It can be seen in the QEMU monitor:

  (qemu) xp 0x10009038
  0000000010009038: 0x00000010

  After the second strb instruction, the write to 0x10009039 clears the
  entire word:

  (qemu) xp 0x10009038
  0000000010009038: 0x00000000

  QEMU command-line, using the vexpress-a9 which has the PL011 at
  0x10009000:

  qemu-system-arm -S -M vexpress-a9 -m 32M -no-reboot -nographic
  -monitor telnet:127.0.0.1:1234,server,nowait -kernel pl011-sfr.bin
  -gdb tcp::2159 -serial mon:stdio

  Compiling the original C code with optimizations makes the driver
  work. It compiles down to assembly that only does a single write:

      ldr r3, pl011_addr
      mov r2, #0x10
      str r2, [r3, #0x38]

  Attached is the an assembly file, and linkscript, that shows the
  problem, and also includes the working code.

  I haven't debugged inside of QEMU itself but it seems to me that the
  problem is in pl011_write in pl011.c - the functions looks at which
  offset is being written, and then writes the entire SFR that offset
  falls under, which means that changing a single byte will change the
  whole SFR.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1809546/+subscriptions

