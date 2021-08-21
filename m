Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBB83F387E
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 06:17:11 +0200 (CEST)
Received: from localhost ([::1]:54778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHIRS-0003gM-Jj
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 00:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIQ1-0001k7-B3
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:15:41 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:42840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIPz-0006ZU-Lc
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:15:41 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 742E73F84B
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629519338;
 bh=GSyn5dcRK6lcaCUPP16l1QUD056pEG1n7ngbgChdIrA=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=nhvqGsOyiJlUanAfQTrcXym5lVY+GzbOFzgldTVkMiKialO8frIFY1TzwxqXYr1sS
 AXneQOBh3IMDT7a6lSxF6u8Q5r0nwh6kHpRwQLsC0aFP6k2XNGeRjsQPhQnK9Ahg5y
 BCaWQnwgokQ87TB14bk1Y0vCTPggdQWqtE9uEjMEtrE53Uj9XjekgRm9I5Tf+Qtcqc
 AyVJ066lOBZ6B7L+QkaHHf/aPMfSKpIA/Kc75Oqh9y9/uEHEWj43BPpw8SEts+wR9Z
 ZjPKn20nQUhHY9EmVe0s5sFnBChRspaZtxG1bZDDbdomFbFFggBK4fxdNl2lh/7Re1
 vGL8ohx7Au/ag==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4100D2E8189
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:15:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 04:08:20 -0000
From: Alexander Bulekov <1878645@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr ajbennee philmd pmaydell
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <158947246472.30762.752698283456022174.malonedeb@chaenomeles.canonical.com>
Message-Id: <162951890062.3663.8078026548478152009.malone@soybean.canonical.com>
Subject: [Bug 1878645] Re: null-ptr dereference in ich9_apm_ctrl_changed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: dba81f094b45547de9a1d5558b0942288cbb73e4
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
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
Reply-To: Bug 1878645 <1878645@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I moved this report over to QEMU's new bug tracker on gitlab.com.
Please continue with the discussion here:

https://gitlab.com/qemu-project/qemu/-/issues/536

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #536
   https://gitlab.com/qemu-project/qemu/-/issues/536

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878645

Title:
  null-ptr dereference in ich9_apm_ctrl_changed

Status in QEMU:
  Confirmed

Bug description:
  Hello,
  While fuzzing, I found an input which triggers a NULL pointer dereference=
 in
  tcg_handle_interrupt. It seems the culprint is a "cpu" pointer - maybe th=
is bug
  is specific to QTest?

  =3D=3D23862=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x00000=
00000b4 (pc 0x55b9dc7c9dce bp 0x7ffc346a0900 sp 0x7ffc346a0880 T0)
  =3D=3D23862=3D=3DThe signal is caused by a READ memory access.
  =3D=3D23862=3D=3DHint: address points to the zero page.
      #0 0x55b9dc7c9dce in tcg_handle_interrupt /home/alxndr/Development/qe=
mu/accel/tcg/tcg-all.c:57:21
      #1 0x55b9dc904799 in cpu_interrupt /home/alxndr/Development/qemu/incl=
ude/hw/core/cpu.h:872:5
      #2 0x55b9dc9085e8 in ich9_apm_ctrl_changed /home/alxndr/Development/q=
emu/hw/isa/lpc_ich9.c:442:13
      #3 0x55b9dd19cdc8 in apm_ioport_writeb /home/alxndr/Development/qemu/=
hw/isa/apm.c:50:13
      #4 0x55b9dc73f8b4 in memory_region_write_accessor /home/alxndr/Develo=
pment/qemu/memory.c:483:5
      #5 0x55b9dc73f289 in access_with_adjusted_size /home/alxndr/Developme=
nt/qemu/memory.c:544:18
      #6 0x55b9dc73ddf5 in memory_region_dispatch_write /home/alxndr/Develo=
pment/qemu/memory.c:1476:16
      #7 0x55b9dc577bf3 in flatview_write_continue /home/alxndr/Development=
/qemu/exec.c:3137:23
      #8 0x55b9dc567ad8 in flatview_write /home/alxndr/Development/qemu/exe=
c.c:3177:14
      #9 0x55b9dc567608 in address_space_write /home/alxndr/Development/qem=
u/exec.c:3268:18
      #10 0x55b9dc723fe7 in cpu_outb /home/alxndr/Development/qemu/ioport.c=
:60:5
      #11 0x55b9dc72d3c0 in qtest_process_command /home/alxndr/Development/=
qemu/qtest.c:392:13
      #12 0x55b9dc72b186 in qtest_process_inbuf /home/alxndr/Development/qe=
mu/qtest.c:710:9
      #13 0x55b9dc72a8b3 in qtest_read /home/alxndr/Development/qemu/qtest.=
c:722:5
      #14 0x55b9ddc6e60b in qemu_chr_be_write_impl /home/alxndr/Development=
/qemu/chardev/char.c:183:9
      #15 0x55b9ddc6e75a in qemu_chr_be_write /home/alxndr/Development/qemu=
/chardev/char.c:195:9
      #16 0x55b9ddc77979 in fd_chr_read /home/alxndr/Development/qemu/chard=
ev/char-fd.c:68:9
      #17 0x55b9ddcff0e9 in qio_channel_fd_source_dispatch /home/alxndr/Dev=
elopment/qemu/io/channel-watch.c:84:12
      #18 0x7f7161eac897 in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x4e897)
      #19 0x55b9ddebcb84 in glib_pollfds_poll /home/alxndr/Development/qemu=
/util/main-loop.c:219:9
      #20 0x55b9ddebb57d in os_host_main_loop_wait /home/alxndr/Development=
/qemu/util/main-loop.c:242:5
      #21 0x55b9ddebb176 in main_loop_wait /home/alxndr/Development/qemu/ut=
il/main-loop.c:518:11
      #22 0x55b9dcb4bd1d in qemu_main_loop /home/alxndr/Development/qemu/so=
ftmmu/vl.c:1664:9
      #23 0x55b9ddd1629c in main /home/alxndr/Development/qemu/softmmu/main=
.c:49:5
      #24 0x7f7160a5ce0a in __libc_start_main /build/glibc-GwnBeO/glibc-2.3=
0/csu/../csu/libc-start.c:308:16
      #25 0x55b9dc49c819 in _start (/home/alxndr/Development/qemu/build/i38=
6-softmmu/qemu-system-i386+0xc9c819)

 =20
  I can reproduce this in qemu 5.0 built with AddressSanitizer using these =
qtest commands:

  cat << EOF | ./qemu-system-i386 \
  -qtest stdio -nographic -monitor none -serial none \
  -M pc-q35-5.0
  outl 0xcf8 0x8400f841
  outl 0xcfc 0xaa215d6d
  outl 0x6d30 0x2ef8ffbe
  outb 0xb2 0x20
  EOF

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878645/+subscriptions


