Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E893A2704
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:29:04 +0200 (CEST)
Received: from localhost ([::1]:33410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrG3j-0000Tt-D6
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrFvv-00075t-M5
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:20:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:36760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrFvr-0001rm-Hh
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:20:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lrFvk-0005TH-Vl
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 08:20:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EB83D2E81A8
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 08:20:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Jun 2021 08:15:00 -0000
From: Thomas Huth <1907938@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20201213042844.x2uprphwahlpon5c@mozz.bu.edu>
Message-Id: <162331290013.27831.10898738301501752320.malone@wampee.canonical.com>
Subject: [Bug 1907938] Re: [OSS-Fuzz] Issue 28524 virtio-blk: ASSERT:
 !s->dataplane_started
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: 1c844472d8cb0b113a1f778215cab0f1fb422d24
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1907938 <1907938@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This still reproduces with the current git version of QEMU.

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907938

Title:
  [OSS-Fuzz] Issue 28524 virtio-blk: ASSERT: !s->dataplane_started

Status in QEMU:
  Confirmed

Bug description:
   affects qemu

  =3D=3D=3D Reproducer =3D=3D=3D

  cat << EOF |./qemu-system-i386 -display none -m 512M -machine q35 \
  -device virtio-blk,drive=3Ddisk0 \
  -drive file=3Dnull-co://,id=3Ddisk0,if=3Dnone,format=3Draw -qtest stdio
  outl 0xcf8 0x8000181f
  outl 0xcfc 0xa044d79
  outl 0xcf8 0x80001802
  outl 0xcf8 0x80001804
  outl 0xcfc 0xb9045dff
  outl 0xcf8 0x8000180e
  outl 0xcfc 0xfb9465a
  outl 0xf85 0x9e1ea5c2
  write 0x9f002 0x1 0x04
  write 0x9f004 0x1 0x04
  write 0x9e040 0x1 0x04
  write 0x9e043 0x1 0x01
  write 0x9e048 0x1 0x10
  write 0x9e04c 0x1 0x01
  write 0x9e04e 0x1 0x6e
  write 0x1000004 0x1 0x01
  write 0x9e6e3 0x1 0x01
  write 0x9e6eb 0x1 0x04
  write 0x9e6ec 0x1 0x6e
  write 0x9f006 0x1 0x04
  write 0x9f008 0x1 0x04
  write 0x9f00a 0x1 0x04
  outl 0xf8f 0xc
  EOF

  =3D=3D=3D Stack Trace =3D=3D=3D

  qemu-fuzz-i386: ../hw/block/virtio-blk.c:917: void virtio_blk_reset(VirtI=
ODevice *): Assertion `!s->dataplane_started' failed.
  =3D=3D702068=3D=3D ERROR: libFuzzer: deadly signal
  #0 0x55bd6fc9f311 in __sanitizer_print_stack_trace (fuzz-i386+0x2b16311)
  #1 0x55bd6fbe83d8 in fuzzer::PrintStackTrace() (fuzz-i386+0x2a5f3d8)
  #2 0x55bd6fbce413 in fuzzer::Fuzzer::CrashCallback() (fuzz-i386+0x2a45413)
  #3 0x7ff5241b813f  (/lib/x86_64-linux-gnu/libpthread.so.0+0x1413f)
  #4 0x7ff523feddb0 in __libc_signal_restore_set signal/../sysdeps/unix/sys=
v/linux/internal-signals.h:86:3
  #5 0x7ff523feddb0 in raise signal/../sysdeps/unix/sysv/linux/raise.c:48:3
  #6 0x7ff523fd7536 in abort stdlib/abort.c:79:7
  #7 0x7ff523fd740e in __assert_fail_base assert/assert.c:92:3
  #8 0x7ff523fe65b1 in __assert_fail assert/assert.c:101:3
  #9 0x55bd7116c435 in virtio_blk_reset hw/block/virtio-blk.c:917:5
  #10 0x55bd710c94a2 in virtio_reset hw/virtio/virtio.c:2001:9
  #11 0x55bd6ff0e0a5 in virtio_pci_reset hw/virtio/virtio-pci.c:1886:5
  #12 0x55bd6ff10686 in virtio_ioport_write hw/virtio/virtio-pci.c:339:13
  #13 0x55bd6ff10686 in virtio_pci_config_write hw/virtio/virtio-pci.c:456:9
  #14 0x55bd713fd025 in memory_region_write_accessor softmmu/memory.c:491:5
  #15 0x55bd713fca93 in access_with_adjusted_size softmmu/memory.c:552:18
  #16 0x55bd713fc2f0 in memory_region_dispatch_write softmmu/memory.c
  #17 0x55bd70e4bf36 in flatview_write_continue softmmu/physmem.c:2759:23
  #18 0x55bd70e41bbb in flatview_write softmmu/physmem.c:2799:14
  #19 0x55bd70e41bbb in address_space_write softmmu/physmem.c:2891:18
  #20 0x55bd71153462 in cpu_outl softmmu/ioport.c:80:5
  #21 0x55bd712d586e in qtest_process_command softmmu/qtest.c:483:13
  #22 0x55bd712d35bf in qtest_process_inbuf softmmu/qtest.c:797:9
  #23 0x55bd712d3315 in qtest_server_inproc_recv softmmu/qtest.c:904:9
  #24 0x55bd71910df8 in qtest_sendf tests/qtest/libqtest.c:438:5
  #25 0x55bd71911fae in qtest_out tests/qtest/libqtest.c:952:5
  #26 0x55bd71911fae in qtest_outl tests/qtest/libqtest.c:968:5
  #27 0x55bd6fcd1aa2 in op_out tests/qtest/fuzz/generic_fuzz.c:395:13
  #28 0x55bd6fcd04e9 in generic_fuzz tests/qtest/fuzz/generic_fuzz.c:680:17
  #29 0x55bd6fcc9723 in LLVMFuzzerTestOneInput tests/qtest/fuzz/fuzz.c:151:5

  OSS-Fuzz Report:
  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D28524

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907938/+subscriptions

