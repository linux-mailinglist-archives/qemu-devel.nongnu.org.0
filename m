Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F307630E1B5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:01:27 +0100 (CET)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MSz-000445-3p
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:01:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7MPB-0002PS-9E
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:57:29 -0500
Received: from indium.canonical.com ([91.189.90.7]:51900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7MP8-00014O-6n
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:57:29 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l7MP5-0006K0-JJ
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:57:23 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 396E02E815A
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 17:57:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Feb 2021 16:41:49 -0000
From: Alexander Bulekov <1913917@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd pmaydell
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Duplicate: 1914353
References: <161205975552.32077.17135502611991851570.malonedeb@chaenomeles.canonical.com>
Message-Id: <161237051067.24466.12844625626687987422.launchpad@wampee.canonical.com>
Subject: [Bug 1913917] Re: aarch64-virt: heap-use-after-free in gic_dist_writeb
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 5f924af1759f18a1e55d564ce139cca37efadb45
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1913917 <1913917@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1914353 ***
    https://bugs.launchpad.net/bugs/1914353

** This bug has been marked a duplicate of bug 1914353
   QEMU: aarch64: :GIC: out-of-bounds access via interrupt ID

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913917

Title:
  aarch64-virt: heap-use-after-free in gic_dist_writeb

Status in QEMU:
  Fix Committed

Bug description:
  Reproducer:
  cat << EOF | ./qemu-system-aarch64 \
  -machine virt,accel=3Dqtest -qtest stdio
  writel 0x8000f00 0x5affaf
  write 0x8000eff 0x1 0x0
  EOF

  Stacktrace:
  ../hw/intc/arm_gic.c:1419:17: runtime error: index 3068 out of bounds for=
 type 'gic_irq_state [1020]'
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm_gi=
c.c:1419:17 in
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D641550=3D=3DERROR: AddressSanitizer: heap-use-after-free on address=
 0x629000023a85 at pc 0x55b5dfb0fbf8 bp 0x7fff95cb5870 sp 0x7fff95cb5868
  WRITE of size 1 at 0x629000023a85 thread T0
      #0 0x55b5dfb0fbf7 in gic_dist_writeb /home/alxndr/Development/qemu/bu=
ild/../hw/intc/arm_gic.c:1419:17
      #1 0x55b5dfb061e2 in gic_dist_write /home/alxndr/Development/qemu/bui=
ld/../hw/intc/arm_gic.c
      #2 0x55b5e0809ef4 in memory_region_write_with_attrs_accessor /home/al=
xndr/Development/qemu/build/../softmmu/memory.c:511:12
      #3 0x55b5e0808bfb in access_with_adjusted_size /home/alxndr/Developme=
nt/qemu/build/../softmmu/memory.c:552:18
      #4 0x55b5e0808467 in memory_region_dispatch_write /home/alxndr/Develo=
pment/qemu/build/../softmmu/memory.c
      #5 0x55b5e0b98ffb in flatview_write_continue /home/alxndr/Development=
/qemu/build/../softmmu/physmem.c:2759:23
      #6 0x55b5e0b8e71b in flatview_write /home/alxndr/Development/qemu/bui=
ld/../softmmu/physmem.c:2799:14
      #7 0x55b5e0b8e71b in address_space_write /home/alxndr/Development/qem=
u/build/../softmmu/physmem.c:2891:18
      #8 0x55b5e07fad35 in qtest_process_command /home/alxndr/Development/q=
emu/build/../softmmu/qtest.c:654:9
      #9 0x55b5e07f3b97 in qtest_process_inbuf /home/alxndr/Development/qem=
u/build/../softmmu/qtest.c:797:9
      #10 0x55b5e1044286 in fd_chr_read /home/alxndr/Development/qemu/build=
/../chardev/char-fd.c:68:9
      #11 0x7fa997b30aae in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x51aae)
      #12 0x55b5e169f363 in glib_pollfds_poll /home/alxndr/Development/qemu=
/build/../util/main-loop.c:232:9
      #13 0x55b5e169f363 in os_host_main_loop_wait /home/alxndr/Development=
/qemu/build/../util/main-loop.c:255:5
      #14 0x55b5e169f363 in main_loop_wait /home/alxndr/Development/qemu/bu=
ild/../util/main-loop.c:531:11
      #15 0x55b5e075a599 in qemu_main_loop /home/alxndr/Development/qemu/bu=
ild/../softmmu/runstate.c:721:9
      #16 0x55b5de9e71fd in main /home/alxndr/Development/qemu/build/../sof=
tmmu/main.c:50:5
      #17 0x7fa9975d5cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
      #18 0x55b5de93abc9 in _start (/home/alxndr/Development/qemu/build/qem=
u-system-aarch64+0x3350bc9)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913917/+subscriptions

