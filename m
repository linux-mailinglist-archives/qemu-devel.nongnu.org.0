Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1216E3087E4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 11:43:16 +0100 (CET)
Received: from localhost ([::1]:49466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RFD-0008KY-40
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 05:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5RDU-0007Rk-58
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:41:28 -0500
Received: from indium.canonical.com ([91.189.90.7]:38348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5RDR-0006xs-SP
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:41:27 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l5RDO-0007cO-FR
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 10:41:22 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1E98F2E8145
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 10:41:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 Jan 2021 10:31:49 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1913668@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161188766555.32217.2070289263520375872.malonedeb@chaenomeles.canonical.com>
Message-Id: <161191630960.6828.10586202362643992963.launchpad@gac.canonical.com>
Subject: [Bug 1913668] Re: FPE in npcm7xx_pwm_calculate_freq
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: 65bf872d12f1b891ad2102cd57b275f16f48dbc7
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
Reply-To: Bug 1913668 <1913668@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: arm

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913668

Title:
  FPE in npcm7xx_pwm_calculate_freq

Status in QEMU:
  Confirmed

Bug description:
  Reproducer:
  cat << EOF | ./qemu-system-aarch64 -M npcm750-evb \
  -accel qtest -qtest stdio
  write 0xf0103008 0x4 0x09000000
  write 0xf010300c 0x4 0xffffffff
  EOF

  Trace:
  ../hw/misc/npcm7xx_pwm.c:94:17: runtime error: division by zero
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/misc/npcm7x=
x_pwm.c:94:17 in
  AddressSanitizer:DEADLYSIGNAL
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D717868=3D=3DERROR: AddressSanitizer: FPE on unknown address 0x5597c=
7190150 (pc 0x5597c7190150 bp 0x7fffcb17c5d0 sp 0x7fffcb17c4e0 T0)
  #0 0x5597c7190150 in npcm7xx_pwm_calculate_freq /hw/misc/npcm7xx_pwm.c:94=
:17
  #1 0x5597c7190150 in npcm7xx_pwm_update_freq /hw/misc/npcm7xx_pwm.c:122:21
  #2 0x5597c718f06d in npcm7xx_pwm_write /hw/misc/npcm7xx_pwm.c
  #3 0x5597c8d241fe in memory_region_write_accessor /softmmu/memory.c:491:5
  #4 0x5597c8d23bfb in access_with_adjusted_size /softmmu/memory.c:552:18
  #5 0x5597c8d23467 in memory_region_dispatch_write /softmmu/memory.c
  #6 0x5597c90b3ffb in flatview_write_continue /softmmu/physmem.c:2759:23
  #7 0x5597c90a971b in flatview_write /softmmu/physmem.c:2799:14
  #8 0x5597c90a971b in address_space_write /softmmu/physmem.c:2891:18
  #9 0x5597c8d11eee in qtest_process_command /softmmu/qtest.c:539:13
  #10 0x5597c8d0eb97 in qtest_process_inbuf /softmmu/qtest.c:797:9
  #11 0x5597c955f286 in fd_chr_read /chardev/char-fd.c:68:9
  #12 0x7f994c124aae in g_main_context_dispatch (/usr/lib/x86_64-linux-gnu/=
libglib-2.0.so.0+0x51aae)
  #13 0x5597c9bba363 in glib_pollfds_poll /util/main-loop.c:232:9
  #14 0x5597c9bba363 in os_host_main_loop_wait /util/main-loop.c:255:5
  #15 0x5597c9bba363 in main_loop_wait /util/main-loop.c:531:11
  #16 0x5597c8c75599 in qemu_main_loop /softmmu/runstate.c:721:9
  #17 0x5597c6f021fd in main /softmmu/main.c:50:5
  #18 0x7f994bbc9cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
  #19 0x5597c6e55bc9 in _start (/home/alxndr/Development/qemu/build/qemu-sy=
stem-aarch64+0x3350bc9)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913668/+subscriptions

