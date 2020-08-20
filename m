Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F2924C23A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 17:31:04 +0200 (CEST)
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8mWt-0001WT-Go
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 11:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8mNG-0000yH-A2
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:21:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:53464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8mNC-0008BM-CN
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:21:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k8mN9-0001mX-K3
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:20:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8CEA22E80ED
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:20:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2020 15:10:09 -0000
From: Thomas Huth <1878259@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd pjps
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158930827727.28996.11410630721148857402.malonedeb@soybean.canonical.com>
Message-Id: <159793621033.2034.512501351960348905.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1878259] Re: Null-pointer dereference in megasas_handle_frame
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: d42c5de85690a529986112027e8433f93c7f1cd5
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 10:50:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1878259 <1878259@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878259

Title:
  Null-pointer dereference in megasas_handle_frame

Status in QEMU:
  Fix Released

Bug description:
  Hello,
  While fuzzing, I found an input that triggers a null-pointer dereference =
in megasas_handle_frame:

  =3D=3D1595=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x000000=
000000 (pc 0x55e3e83e6e08 bp 0x7ffdb04c63b0 sp 0x7ffd
  =3D=3D1595=3D=3DThe signal is caused by a READ memory access.
  =3D=3D1595=3D=3DHint: address points to the zero page.
      #0 0x55e3e83e6e08 in megasas_handle_frame /home/alxndr/Development/qe=
mu/hw/scsi/megasas.c:1952:36
      #1 0x55e3e83e6e08 in megasas_mmio_write /home/alxndr/Development/qemu=
/hw/scsi/megasas.c:2122:9
      #2 0x55e3e7d088d6 in memory_region_write_accessor /home/alxndr/Develo=
pment/qemu/memory.c:483:5
      #3 0x55e3e7d0827f in access_with_adjusted_size /home/alxndr/Developme=
nt/qemu/memory.c:544:18
      #4 0x55e3e7d0827f in memory_region_dispatch_write /home/alxndr/Develo=
pment/qemu/memory.c:1476:16
      #5 0x55e3e7c1d1d3 in flatview_write_continue /home/alxndr/Development=
/qemu/exec.c:3137:23
      #6 0x55e3e7c15b97 in flatview_write /home/alxndr/Development/qemu/exe=
c.c:3177:14
      #7 0x55e3e7c15b97 in address_space_write /home/alxndr/Development/qem=
u/exec.c:3268:18
      #8 0x55e3e7d03bc4 in qtest_process_command /home/alxndr/Development/q=
emu/qtest.c:567:9
      #9 0x55e3e7cfe74d in qtest_process_inbuf /home/alxndr/Development/qem=
u/qtest.c:710:9
      #10 0x55e3e8804cad in fd_chr_read /home/alxndr/Development/qemu/chard=
ev/char-fd.c:68:9
      #11 0x7f602ef2a897 in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x4e897)
      #12 0x55e3e8948384 in glib_pollfds_poll /home/alxndr/Development/qemu=
/util/main-loop.c:219:9
      #13 0x55e3e8948384 in os_host_main_loop_wait /home/alxndr/Development=
/qemu/util/main-loop.c:242:5
      #14 0x55e3e8948384 in main_loop_wait /home/alxndr/Development/qemu/ut=
il/main-loop.c:518:11
      #15 0x55e3e7f27676 in qemu_main_loop /home/alxndr/Development/qemu/so=
ftmmu/vl.c:1664:9
      #16 0x55e3e8851c6a in main /home/alxndr/Development/qemu/softmmu/main=
.c:49:5
      #17 0x7f602dadae0a in __libc_start_main /build/glibc-GwnBeO/glibc-2.3=
0/csu/../csu/libc-start.c:308:16
      #18 0x55e3e7b5c7b9 in _start (/home/alxndr/Development/qemu/build/i38=
6-softmmu/qemu-system-i386+0x9027b9)

  I can reproduce it in qemu 5.0 using:

  cat << EOF | ~/Development/qemu/build/i386-softmmu/qemu-system-i386 -qtes=
t stdio -nographic -monitor none -serial none -M q35 -device megasas
  outl 0xcf8 0x80001814
  outl 0xcfc 0xc021
  outl 0xcf8 0x80001818
  outl 0xcf8 0x80001804
  outw 0xcfc 0x7
  outl 0xcf8 0x80001810
  outl 0xcfc 0xe10c0000
  outl 0xcf8 0x8000f810
  outl 0xcf8 0x8000fa24
  outl 0xcfc 0xe10c4000
  outl 0xcf8 0x8000fa04
  outw 0xcfc 0x7
  outl 0xcf8 0x8000fb20
  write 0xe10c4384 0x15 0x838383838383838383838383838383838383838383
  write 0xc021e10c00c0 0x4 0x082c04dd
  EOF

  I also attached the commands to this launchpad report, in case the
  formatting is broken:

  qemu-system-i386 -qtest stdio -nographic -monitor none -serial none -M
  q35 -device megasas < attachment

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878259/+subscriptions

