Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A3836F74C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:47:08 +0200 (CEST)
Received: from localhost ([::1]:40238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcOnj-0006BG-F5
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOjn-0004ii-0r
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:43:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:55862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOjk-0003pC-Jn
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:43:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcOjj-000648-EH
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:42:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6B12A2E8023
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:42:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:26:16 -0000
From: Thomas Huth <1904331@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jdbelanger philmd th-huth
X-Launchpad-Bug-Reporter: Jonathan D. Belanger (jdbelanger)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160545531881.20391.7176019896401260559.malonedeb@soybean.canonical.com>
Message-Id: <161977117695.4685.8622086556370500757.malone@chaenomeles.canonical.com>
Subject: [Bug 1904331] Re: Coding bug in the function serial_ioport_write in
 serial.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 6350579e405c6fb662a4ae1d24e3d2c77a821a8e
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
Reply-To: Bug 1904331 <1904331@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://gitlab.com/qemu-project/qemu/-/commit/29daa894b6c31eae074d

** Changed in: qemu
       Status: Confirmed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904331

Title:
  Coding bug in the function serial_ioport_write in serial.c

Status in QEMU:
  Fix Released

Bug description:
  Branch hash: b50ea0d  (pulled from github).

  I was reviewing the code and noticed the following in the function
  serial_ioport_write:

      assert(size =3D=3D 1 && addr < 8);
          .
          .
          .
      switch(addr) {
      default:
      case 0:
          if (s->lcf & UART_LCR_DLAB) {
              if (size =3D=3D 1) {
                  s->divider =3D (s->divider & 0xff00) | val;
              } else {
                  s->divider =3D val;
              }
          }

  The assert will trigger if the size is > 1, so the else of the if
  (size =3D=3D 1) will never be executed and an attempt to specify a size >
  1 will trigger an assert.

  The documentation for the UART indicates that the 16-bit divisor is
  broken up amongst 2 8-bit registers (DLL and DLM).  There already is
  code to handle the DLL and DLM portions of the divider register (as
  coded).

  This is not exactly going to cause a bug, as there is no code that
  calls this function with a value for size other than 1.  It is just
  unnecessary code.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904331/+subscriptions

