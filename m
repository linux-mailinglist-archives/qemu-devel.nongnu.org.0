Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D2327C1BE
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 11:53:57 +0200 (CEST)
Received: from localhost ([::1]:47526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNCKa-0000Qw-5P
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 05:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kNCHb-0006A4-K5
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 05:50:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:57154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kNCHT-0008Af-WE
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 05:50:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kNCHR-0001U1-RO
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 09:50:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CD2692E80DB
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 09:50:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2020 09:42:19 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1897680@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd pmaydell zpzigi
X-Launchpad-Bug-Reporter: Changho Choi (zpzigi)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <160136265426.22784.9778102281742505477.malonedeb@gac.canonical.com>
Message-Id: <dccffac2-4cf4-c8b1-a253-baa257e6ced7@amsat.org>
Subject: Re: [Bug 1897680] [NEW] memory address over 0x2000_7ffc is not
 accessible in mps2-an505
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d685c0a40836eb9844ed835c9700f20633c1d7af"; Instance="production"
X-Launchpad-Hash: a9b22c1e913410e913a071fb9e64440add4b2061
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 03:05:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.199, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1897680 <1897680@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/20 8:57 AM, Changho Choi wrote:
> Public bug reported:
> =

> I currently run qemu with the following options
> `qemu-system-aarch64 -machine mps2-an505 -cpu cortex-m33 -m 16`
> =

> For some reason, memory address over 0x2000_7ffc is not accessible.
> It can be tested in gdb as follow.
> =

> (gdb) x/x 0x20007ffc
> 0x20007ffc:	0x00000000
> (gdb) x/x 0x20007ffd
> 0x20007ffd:	Cannot access memory at address 0x20007ffd

Works for me:

(gdb) x/xg 0x20007ff8
0x20007ff8:	0x0000000000000000

(gdb) x/xw 0x20007ffc
0x20007ffc:	0x00000000

(gdb) x/xh 0x20007ffe
0x20007ffe:	0x0000

(gdb) x/xb 0x20007fff
0x20007fff:	0x00

I suppose GDB uses 32-bit access size by default,
so requesting 32-bit at 0x20007ffd would access
out of bound memory.

> (gdb) x/x 0x20008000
> 0x20008000:	Cannot access memory at address 0x20008000

For TYPE_IOTKIT there is only 1 SRAM bank (see armsse_variants[])
initialized to SRAM_ADDR_WIDTH bits, which is 15 by default:

    DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),

So this MPC downstream region is a 32KB SRAM. The size looks correct.

> =

> ** Affects: qemu
>      Importance: Undecided
>          Status: New
>

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1897680

Title:
  memory address over 0x2000_7ffc is not accessible in mps2-an505

Status in QEMU:
  New

Bug description:
  I currently run qemu with the following options
  `qemu-system-aarch64 -machine mps2-an505 -cpu cortex-m33 -m 16`

  For some reason, memory address over 0x2000_7ffc is not accessible.
  It can be tested in gdb as follow.

  (gdb) x/x 0x20007ffc
  0x20007ffc:	0x00000000
  (gdb) x/x 0x20007ffd
  0x20007ffd:	Cannot access memory at address 0x20007ffd
  (gdb) x/x 0x20008000
  0x20008000:	Cannot access memory at address 0x20008000

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1897680/+subscriptions

