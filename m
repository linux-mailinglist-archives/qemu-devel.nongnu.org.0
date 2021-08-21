Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006163F3898
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 06:25:12 +0200 (CEST)
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHIZD-0008NM-0S
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 00:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIUs-00089H-VA
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:20:42 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:56370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIUq-0002F5-HK
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:20:42 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 084693F857
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629519639;
 bh=dthN+34nqG8kxt4B0Hhg43/k+rY5cj7qP1Dzmv2S4no=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=nyXRiwIMdUN5aGGvDFdAg9/H+lGzPlP1PsXj9OQVjv4NtoMZtw/bcZKtUgm9KCt9+
 ashpu7DVdH9C5pAQA/XyAGZCI3SY4n9a7Qw1X8NO3PPBRW0Je/7t282Y3BvOBq852b
 1P3lkSU8p8JU82I2Tu73aEQaJJlOk5p5DzJHMlcXD86t3SYO1gZQUoYT9JkKGPXMrk
 zBEluJAJUaijj+Frq3fO49NBKdAuj/o3YicEM0No0w1ItmW09ihWPUBCUkEoVmxHWK
 UZlHiRTlKUPydAqqvjw8bwEZvL7w2T8jvh9PHH/ke/7i9kBTTcBU7M0Pg215yRYTmR
 YAPiTVqsha/Zw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ECB342E8167
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:20:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 04:12:15 -0000
From: Alexander Bulekov <1907938@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <20201213042844.x2uprphwahlpon5c@mozz.bu.edu>
Message-Id: <162951913547.19052.15093846544371854450.malone@wampee.canonical.com>
Subject: [Bug 1907938] Re: [OSS-Fuzz] Issue 28524 virtio-blk: ASSERT:
 !s->dataplane_started
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: e5a7080ff1c96c87d607a8dc3a97aa5c41c2d53c
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I moved this report over to QEMU's new bug tracker on gitlab.com.
Please continue with the discussion here:

https://gitlab.com/qemu-project/qemu/-/issues/543

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #543
   https://gitlab.com/qemu-project/qemu/-/issues/543

--=20
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


