Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C613363581
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 15:26:28 +0200 (CEST)
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lY7RT-0005uR-6M
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 09:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lY7Qj-0005UR-Q9
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 09:25:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:37022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lY7Qh-00025z-3Z
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 09:25:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lY7Qe-0007m0-Vi
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:25:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EC11E2E806D
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:25:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Apr 2021 13:16:47 -0000
From: =?utf-8?q?kleines_Filmr=C3=B6llchen?= <1924912@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kleinesfilmroellchen
X-Launchpad-Bug-Reporter: =?utf-8?q?kleines_Filmr=C3=B6llchen_=28kleinesfil?=
 =?utf-8?q?mroellchen=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?kleines_Filmr=C3=B6llchen_=28kleinesfil?=
 =?utf-8?q?mroellchen=29?=
Message-Id: <161875180735.23175.14682430598239905387.malonedeb@wampee.canonical.com>
Subject: [Bug 1924912] [NEW] VirtIO drivers don't work on Windows: "GLib: Too
 many handles to wait for!" crash
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="26785e5a6adccabf68a42300ea7053912615013e"; Instance="production"
X-Launchpad-Hash: 4cf5fc879a301d46bee9041928580cf9b151186f
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
Reply-To: Bug 1924912 <1924912@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I ran SerenityOS <https://github.com/SerenityOS/serenity> out of WSL2
with native Windows QEMU. The system runs fine on the Linux QEMU (with
Windows X-Server). However, with Windows QEMU I get a hard crash after
the following output:

```
[#0 colonel(0:0)]: Scheduler[0]: idle loop running
[init_stage2(2:2)]: PCI [0000:00:00:00] PCI::ID [8086:1237]
[init_stage2(2:2)]: PCI [0000:00:01:00] PCI::ID [8086:7000]
[init_stage2(2:2)]: PCI [0000:00:01:01] PCI::ID [8086:7010]
[init_stage2(2:2)]: PCI [0000:00:01:02] PCI::ID [8086:7020]
[init_stage2(2:2)]: PCI [0000:00:01:03] PCI::ID [8086:7113]
[init_stage2(2:2)]: PCI [0000:00:02:00] PCI::ID [1234:1111]
[init_stage2(2:2)]: PCI [0000:00:03:00] PCI::ID [8086:2922]
[init_stage2(2:2)]: PCI [0000:00:04:00] PCI::ID [1af4:1003]
[init_stage2(2:2)]: PCI [0000:00:05:00] PCI::ID [1af4:1005]
[init_stage2(2:2)]: PCI [0000:00:06:00] PCI::ID [8086:100e]
[#0 init_stage2(2:2)]: BXVGA: framebuffer @ P0xf8000000
[#0 init_stage2(2:2)]: BXVGADevice resolution set to 1024x768 (pitch=3D4096)
[init_stage2(2:2)]: UHCI: Controller found PCI::ID [8086:7020] @ PCI [0000:=
00:01:02]
[init_stage2(2:2)]: UHCI: I/O base IO c080
[init_stage2(2:2)]: UHCI: Interrupt line: 11
[#0 init_stage2(2:2)]: UHCI: Allocated framelist at physical address P0x00e=
40000
[#0 init_stage2(2:2)]: UHCI: Framelist is at virtual address V0xc115d000
[#0 init_stage2(2:2)]: UHCI: QH(0xc115f000) @ 14946304: link_ptr=3D14946338=
, element_link_ptr=3D1
[#0 init_stage2(2:2)]: UHCI: QH(0xc115f020) @ 14946336: link_ptr=3D14946370=
, element_link_ptr=3D1
[#0 init_stage2(2:2)]: UHCI: QH(0xc115f040) @ 14946368: link_ptr=3D14946402=
, element_link_ptr=3D1
[#0 init_stage2(2:2)]: UHCI: QH(0xc115f060) @ 14946400: link_ptr=3D14946434=
, element_link_ptr=3D1
[#0 init_stage2(2:2)]: UHCI: QH(0xc115f080) @ 14946432: link_ptr=3D14958593=
, element_link_ptr=3D1
[#0 init_stage2(2:2)]: UHCI: Reset completed
[#0 init_stage2(2:2)]: UHCI: Started
[#0 init_stage2(2:2)]: DMIExpose: SMBIOS 32bit Entry point @ P0x000f5870
[#0 init_stage2(2:2)]: DMIExpose: Data table @ P0x000f5890
[#0 init_stage2(2:2)]: VirtIOConsole: Found @ PCI [0000:00:04:00]
[#0 init_stage2(2:2)]: Trying to unregister unused handler (?)
[#0 init_stage2(2:2)]: VirtIOConsole: Multi port is not yet supported!
[#0 init_stage2(2:2)]: VirtIOConsole: cols: 0, rows: 0, max nr ports 0
qemu-system-i386.exe: warning: GLib: Too many handles to wait for!
```

The lines starting with [ are SerenityOS output; QEMU warns "GLib: Too
many handles to wait for!" and crashes right after (can't even Ctrl-C in
the WSL command line, force-close in Windows necessary). A window is
still spawned but as the OS already switched out of text mode, just a
black screen is visible as QEMU crashes.

I first thought this to be an issue with SerenityOS and reported it over
there: <https://github.com/SerenityOS/serenity/issues/6422>. The kernel
devs pointed out that this seems to be a VirtIO driver/device issue on
the Windows build of QEMU, because the Serenity kernel tries to
initialize VirtIO devices which apparently crashes QEMU. There will be
mitigations from the SerenityOS side (by allowing to disable VirtIO on
boot) but it would of course be great if QEMU handled this properly.

Version info: Both QEMU 6.0.0-rc3 and 5.2.0 exhibit this issue. Windows
release is 20H2, WSL2 is running Debian 10.9. SerenityOS has no proper
version but it was reproduced on the most current commits as of
18/04/2021.

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: windows

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1924912

Title:
  VirtIO drivers don't work on Windows: "GLib: Too many handles to wait
  for!" crash

Status in QEMU:
  New

Bug description:
  I ran SerenityOS <https://github.com/SerenityOS/serenity> out of WSL2
  with native Windows QEMU. The system runs fine on the Linux QEMU (with
  Windows X-Server). However, with Windows QEMU I get a hard crash after
  the following output:

  ```
  [#0 colonel(0:0)]: Scheduler[0]: idle loop running
  [init_stage2(2:2)]: PCI [0000:00:00:00] PCI::ID [8086:1237]
  [init_stage2(2:2)]: PCI [0000:00:01:00] PCI::ID [8086:7000]
  [init_stage2(2:2)]: PCI [0000:00:01:01] PCI::ID [8086:7010]
  [init_stage2(2:2)]: PCI [0000:00:01:02] PCI::ID [8086:7020]
  [init_stage2(2:2)]: PCI [0000:00:01:03] PCI::ID [8086:7113]
  [init_stage2(2:2)]: PCI [0000:00:02:00] PCI::ID [1234:1111]
  [init_stage2(2:2)]: PCI [0000:00:03:00] PCI::ID [8086:2922]
  [init_stage2(2:2)]: PCI [0000:00:04:00] PCI::ID [1af4:1003]
  [init_stage2(2:2)]: PCI [0000:00:05:00] PCI::ID [1af4:1005]
  [init_stage2(2:2)]: PCI [0000:00:06:00] PCI::ID [8086:100e]
  [#0 init_stage2(2:2)]: BXVGA: framebuffer @ P0xf8000000
  [#0 init_stage2(2:2)]: BXVGADevice resolution set to 1024x768 (pitch=3D40=
96)
  [init_stage2(2:2)]: UHCI: Controller found PCI::ID [8086:7020] @ PCI [000=
0:00:01:02]
  [init_stage2(2:2)]: UHCI: I/O base IO c080
  [init_stage2(2:2)]: UHCI: Interrupt line: 11
  [#0 init_stage2(2:2)]: UHCI: Allocated framelist at physical address P0x0=
0e40000
  [#0 init_stage2(2:2)]: UHCI: Framelist is at virtual address V0xc115d000
  [#0 init_stage2(2:2)]: UHCI: QH(0xc115f000) @ 14946304: link_ptr=3D149463=
38, element_link_ptr=3D1
  [#0 init_stage2(2:2)]: UHCI: QH(0xc115f020) @ 14946336: link_ptr=3D149463=
70, element_link_ptr=3D1
  [#0 init_stage2(2:2)]: UHCI: QH(0xc115f040) @ 14946368: link_ptr=3D149464=
02, element_link_ptr=3D1
  [#0 init_stage2(2:2)]: UHCI: QH(0xc115f060) @ 14946400: link_ptr=3D149464=
34, element_link_ptr=3D1
  [#0 init_stage2(2:2)]: UHCI: QH(0xc115f080) @ 14946432: link_ptr=3D149585=
93, element_link_ptr=3D1
  [#0 init_stage2(2:2)]: UHCI: Reset completed
  [#0 init_stage2(2:2)]: UHCI: Started
  [#0 init_stage2(2:2)]: DMIExpose: SMBIOS 32bit Entry point @ P0x000f5870
  [#0 init_stage2(2:2)]: DMIExpose: Data table @ P0x000f5890
  [#0 init_stage2(2:2)]: VirtIOConsole: Found @ PCI [0000:00:04:00]
  [#0 init_stage2(2:2)]: Trying to unregister unused handler (?)
  [#0 init_stage2(2:2)]: VirtIOConsole: Multi port is not yet supported!
  [#0 init_stage2(2:2)]: VirtIOConsole: cols: 0, rows: 0, max nr ports 0
  qemu-system-i386.exe: warning: GLib: Too many handles to wait for!
  ```

  The lines starting with [ are SerenityOS output; QEMU warns "GLib: Too
  many handles to wait for!" and crashes right after (can't even Ctrl-C
  in the WSL command line, force-close in Windows necessary). A window
  is still spawned but as the OS already switched out of text mode, just
  a black screen is visible as QEMU crashes.

  I first thought this to be an issue with SerenityOS and reported it
  over there: <https://github.com/SerenityOS/serenity/issues/6422>. The
  kernel devs pointed out that this seems to be a VirtIO driver/device
  issue on the Windows build of QEMU, because the Serenity kernel tries
  to initialize VirtIO devices which apparently crashes QEMU. There will
  be mitigations from the SerenityOS side (by allowing to disable VirtIO
  on boot) but it would of course be great if QEMU handled this
  properly.

  Version info: Both QEMU 6.0.0-rc3 and 5.2.0 exhibit this issue.
  Windows release is 20H2, WSL2 is running Debian 10.9. SerenityOS has
  no proper version but it was reproduced on the most current commits as
  of 18/04/2021.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1924912/+subscriptions

