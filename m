Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190883F706E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:33:14 +0200 (CEST)
Received: from localhost ([::1]:46194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInPN-0003IN-4t
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInIC-0006dy-Kw
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:25:48 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:44390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInI8-0004B2-BT
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:25:48 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id D2E003F788
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876342;
 bh=ks4SUehSIvwFrYJPCRtr/A666XX/3ICYbGYjcCDMvR4=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=bbTr5i/x3qylpWQCdGFl/YHWylxR+LgfIuBWyvlkuGoDQThjNdMRhS60lpQADhvaA
 uxJfrtF6pjyi6ij8mVLW8ZIY8wlEe6+tpM4a+EoBMQ0GkUve1rbtJ7MYAPkL1g8S52
 5jmYBAF/RAJSVJ1g2blm9zmbvQ3fLgzCeE4t4YSC4RP07KZ0n9XCNhYpTizASQ3OlZ
 brAk4ofNFd9KI4sA7whgtZ18iw/2J9HsvVkAPH+EckUsRKUkQhhqR4vkZmnPjLD1X8
 FR8V/v3nNXm2SzhEc/Nzu906aK1jndbKZz2MMMs/Ryx219TbzWVTJuG5O5PBXDW6BQ
 M0yWfRnOhESow==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C9C282E813E
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:25:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:17:56 -0000
From: Thomas Huth <1905444@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20201124171810.akchle2mwg6xdlol@mozz.bu.edu>
Message-Id: <162987587835.18837.7464860329713646785.launchpad@gac.canonical.com>
Subject: [Bug 1905444] Re: [OSS-Fuzz] Issue 27796 in oss-fuzz:
 qemu:qemu-fuzz-i386-target-generic-fuzz-xhci: Stack-overflow in
 address_space_stl_internal
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: e73064c4cc15f09368ce65a13763647ac802da1b
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1905444 <1905444@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905444

Title:
  [OSS-Fuzz] Issue 27796 in oss-fuzz: qemu:qemu-fuzz-i386-target-
  generic-fuzz-xhci: Stack-overflow in address_space_stl_internal

Status in QEMU:
  Fix Released

Bug description:
   affects qemu

  OSS-Fuzz Report: https://bugs.chromium.org/p/oss-
  fuzz/issues/detail?id=3D27796

  =3D=3D=3D Reproducer (build with --enable-sanitizers) =3D=3D=3D
  cat << EOF | ./qemu-system-i386 -display none  -machine accel=3Dqtest, \
  -m 512M -machine q35 -nodefaults \
  -drive file=3Dnull-co://,if=3Dnone,format=3Draw,id=3Ddisk0 \
  -device qemu-xhci,id=3Dxhci -device usb-tablet,bus=3Dxhci.0 \
  -qtest-log none -qtest stdio
  outl 0xcf8 0x80000803
  outw 0xcfc 0x5e46
  outl 0xcf8 0x80000810
  outl 0xcfc 0xff5a5e46
  write 0xff5a5020 0x6 0xffffffff0b70
  outl 0xcf8 0x80000893
  outb 0xcfc 0x93
  writel 0xff5a7000 0xff5a5020
  write 0xff5a700c 0x4 0x0c0c2e58
  write 0xff5a4040 0x4 0x00d26001
  write 0xff5a4044 0x4 0x0000030
  EOF

  =3D=3D=3D Stack Trace =3D=3D=3D
  =3D=3D50473=3D=3DERROR: AddressSanitizer: stack-overflow on address 0x7ff=
e3ec97e28 (pc 0x55e292eac159 bp 0x7ffe3ec98670 sp 0x7ffe3ec97e30 T0)
  #0 0x55e292eac159 in __asan_memcpy (u-system-i386+0x2a0e159)
  #1 0x55e2944bc04e in flatview_do_translate softmmu/physmem.c:513:12
  #2 0x55e2944dbe90 in flatview_translate softmmu/physmem.c:563:15
  #3 0x55e2944dbe90 in address_space_translate include/exec/memory.h:2362:12
  #4 0x55e2944dbe90 in address_space_stl_internal memory_ldst.c.inc:316:10
  #5 0x55e29393d2a0 in xhci_intr_update hw/usb/hcd-xhci.c:554:13
  #6 0x55e29393efb9 in xhci_runtime_write hw/usb/hcd-xhci.c:3032:9
  #7 0x55e294230428 in memory_region_write_accessor softmmu/memory.c:484:5
  #8 0x55e29422fe63 in access_with_adjusted_size softmmu/memory.c:545:18
  #9 0x55e29422f6fc in memory_region_dispatch_write softmmu/memory.c
  #10 0x55e2944dc03c in address_space_stl_internal memory_ldst.c.inc:319:13
  #11 0x55e29393d2a0 in xhci_intr_update hw/usb/hcd-xhci.c:554:13
  #12 0x55e29393efb9 in xhci_runtime_write hw/usb/hcd-xhci.c:3032:9
  #13 0x55e294230428 in memory_region_write_accessor softmmu/memory.c:484:5
  #14 0x55e29422fe63 in access_with_adjusted_size softmmu/memory.c:545:18
  #15 0x55e29422f6fc in memory_region_dispatch_write softmmu/memory.c
  #16 0x55e2944dc03c in address_space_stl_internal memory_ldst.c.inc:319:13
  #17 0x55e29393d2a0 in xhci_intr_update hw/usb/hcd-xhci.c:554:13
  #18 0x55e29393efb9 in xhci_runtime_write hw/usb/hcd-xhci.c:3032:9

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905444/+subscriptions


