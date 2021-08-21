Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2351A3F3929
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 08:44:35 +0200 (CEST)
Received: from localhost ([::1]:43108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHKk6-0001dX-7s
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 02:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHKgU-0004Yk-SZ
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:40:54 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:38068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHKgT-0002me-6a
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:40:50 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id CBAA33F83D
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629528047;
 bh=hV2iP1Bgt01hkQUSpus8+wuTG1qp01/Jr3gbsqe0HD8=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=QsVHB8joDPk39FrXOP/73Hbbr1/hK2ca1fzxtiD6LJeYd4w3nYqVNCc43VYMd9RgO
 ERxVNrVsfB5wQlPj9ge2t4lSU9Fc8wVcHWvCfPUj5LgxWip/QRajneCKw4DaDdMjdM
 xllhSSgLEosM5i43eKbmOIza9pNQXmXNNsvt/AY9mdGZqcJGhvM9H0iYhzrhkmlRN9
 +ZYjsorJRvwV+Bw9005BKSH/9Kn0rfMxRGyPTdYQ48SuXy2zQAYYgSkga6VnaWRArM
 X8Hjl2kWN+iELPijlmq0yqWp1je+Ysf4kis7TcoYe/f5fRoGEDL3AaNU6GFYPKZteo
 pHXVm0GTxsnIw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AB0812E816D
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:40:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 06:31:01 -0000
From: Thomas Huth <1913667@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161188757870.14645.13106473416766555293.malonedeb@wampee.canonical.com>
Message-Id: <162952746122.12370.13181345340439793210.malone@wampee.canonical.com>
Subject: [Bug 1913667] Re: FPE in npcm7xx_clk_update_pll
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: d89ca13c3ec76d9f7cac139ca90c24e8cbd286be
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
Reply-To: Bug 1913667 <1913667@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for moving it over! ... let's close this one here on Launchpad
now.


** Changed in: qemu
       Status: Confirmed =3D> Incomplete

** Changed in: qemu
       Status: Incomplete =3D> Invalid

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913667

Title:
  FPE in npcm7xx_clk_update_pll

Status in QEMU:
  Invalid

Bug description:
  I've been working on integrating the generic-fuzzer with ARM machines
  on OSS-Fuzz so we can fuzz devices on architectures beyond i386
  devices. Since I saw that there is some active development for the
  Nuvoton machines, I thought it might be useful to fuzz the NPCM750
  machine

  Reproducer:
  cat << EOF | ./qemu-system-aarch64 -M npcm750-evb \
  -accel qtest -qtest stdio
  write 0xf080100c 0x4 0x00
  write 0xf080100c 0x4 0x00
  EOF

  Trace:
  ../hw/misc/npcm7xx_clk.c:131:14: runtime error: division by zero
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/misc/npcm7x=
x_clk.c:131:14 in
  AddressSanitizer:DEADLYSIGNAL
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D717855=3D=3DERROR: AddressSanitizer: FPE on unknown address 0x56192=
01fcd8c (pc 0x5619201fcd8c bp 0x7ffc94214e50 sp 0x7ffc94214e30 T0)
  #0 0x5619201fcd8c in npcm7xx_clk_update_pll /hw/misc/npcm7xx_clk.c:131:14
  #1 0x5619201ff5dc in npcm7xx_clk_write /hw/misc/npcm7xx_clk.c:799:13
  #2 0x5619214781fe in memory_region_write_accessor /softmmu/memory.c:491:5
  #3 0x561921477bfb in access_with_adjusted_size /softmmu/memory.c:552:18
  #4 0x561921477467 in memory_region_dispatch_write /softmmu/memory.c
  #5 0x561921807ffb in flatview_write_continue /softmmu/physmem.c:2759:23
  #6 0x5619217fd71b in flatview_write /softmmu/physmem.c:2799:14
  #7 0x5619217fd71b in address_space_write /softmmu/physmem.c:2891:18
  #8 0x561921465eee in qtest_process_command /softmmu/qtest.c:539:13
  #9 0x561921462b97 in qtest_process_inbuf /softmmu/qtest.c:797:9
  #10 0x561921cb3286 in fd_chr_read /chardev/char-fd.c:68:9
  #11 0x7f4ad283baae in g_main_context_dispatch (/usr/lib/x86_64-linux-gnu/=
libglib-2.0.so.0+0x51aae)
  #12 0x56192230e363 in glib_pollfds_poll /util/main-loop.c:232:9
  #13 0x56192230e363 in os_host_main_loop_wait /util/main-loop.c:255:5
  #14 0x56192230e363 in main_loop_wait /util/main-loop.c:531:11
  #15 0x5619213c9599 in qemu_main_loop /softmmu/runstate.c:721:9
  #16 0x56191f6561fd in main /softmmu/main.c:50:5
  #17 0x7f4ad22e0cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
  #18 0x56191f5a9bc9 in _start (/home/alxndr/Development/qemu/build/qemu-sy=
stem-aarch64+0x3350bc9)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913667/+subscriptions


