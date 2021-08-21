Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7403F3903
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 08:32:34 +0200 (CEST)
Received: from localhost ([::1]:55504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHKYU-0007WO-0h
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 02:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHKWg-000650-KB
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:30:42 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:37324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHKWf-0002NW-2e
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 02:30:42 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 086913F84E
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629527440;
 bh=lYMQEH/itDPb8ZeAVD3jbgT531W+rRlS3FeTJCZ8wpc=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=CUPMubFvH+V4WzkuC5wWfjgVgOzlbrU22g8A0otUEJbcwe+4RIALIQCy3khyxot7p
 SQuy3dIIVuuGWmaoNr8v1MBuwva79Ic9gl7779MLrAxdPjMJitNsl20gIpXHJAYaRR
 drCfxI7ZKH87fX3nAES9CSxsCa5g92ivSf8P2YoUiv4E7idDEBa75GrWUdcQVuB/Cj
 gKK0L9V3WV8O5zHqciFICm8n3NHSwhImfmh+0AvorSuQoxZZgfydQz/0EacCnPmCf1
 9ViQyeoY+JcG4rdHN9dqFB9aI0UBkF3ANtmJPo0nSwOtQ2PEMlul1G2w3gNAbLUy6/
 IE43oTQzUtBzw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F3AA82E8139
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:30:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 06:22:06 -0000
From: Thomas Huth <1911216@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr hades0506 th-huth
X-Launchpad-Bug-Reporter: Gaoning Pan (hades0506)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161046678346.29947.74345360490259273.malonedeb@chaenomeles.canonical.com>
Message-Id: <162952692689.1794.2181332144265639870.malone@chaenomeles.canonical.com>
Subject: [Bug 1911216] Re: abort issue locates in
 hw/usb/hcd-ohci.c:1297:ohci_frame_boundary
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: 71ee8d6a0dc460848980d56ab31ce5a31c83aade
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
Reply-To: Bug 1911216 <1911216@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for moving it over! ... let's close this one here on Launchpad
now.


** Changed in: qemu
       Status: Confirmed =3D> Invalid

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1911216

Title:
  abort issue locates in hw/usb/hcd-ohci.c:1297:ohci_frame_boundary

Status in QEMU:
  Invalid

Bug description:
  Hello,

  I found an assertion failure in hw/usb/hcd-ohci.c:1297

  This was found in latest version 5.2.0.

  my reproduced environment is as follows:
      Host: ubuntu 18.04
      Guest: ubuntu 18.04

  QEMU boot command line:
  qemu-system-x86_64 -enable-kvm -boot c -m 4G -drive format=3Dqcow2,file=
=3D./ubuntu.img -nic user,hostfwd=3Dtcp:0.0.0.0:5555-:22 -display none -dev=
ice pci-ohci,id=3Dohci -device usb-tablet,bus=3Dohci.0,port=3D1,id=3Dusbdev1

 =20
  backtrace is as follows=20
  pwndbg> bt
  #0  0x00007fdf392aa438 in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/=
unix/sysv/linux/raise.c:54
  #1  0x00007fdf392ac03a in __GI_abort () at abort.c:89
  #2  0x000055c613721118 in ohci_frame_boundary (opaque=3D0x6270000191f0) a=
t hw/usb/hcd-ohci.c:1297
  #3  0x000055c6140bdf0e in timerlist_run_timers (timer_list=3D0x60b00005bc=
c0) at util/qemu-timer.c:572
  #4  0x000055c6140be15a in qemu_clock_run_timers (type=3DQEMU_CLOCK_VIRTUA=
L) at util/qemu-timer.c:586
  #5  0x000055c6140beac7 in qemu_clock_run_all_timers () at util/qemu-timer=
.c:672
  #6  0x000055c6140a1938 in main_loop_wait (nonblocking=3D0) at util/main-l=
oop.c:523
  #7  0x000055c6125d87e9 in qemu_main_loop () at /home/dell/qemu5-hyperviso=
r/vm/fuzz-seedpool/hcd-ohci/qemu-5.1.0/softmmu/vl.c:1676
  #8  0x000055c613f216ea in main (argc=3D7, argv=3D0x7fff174cdd28, envp=3D0=
x7fff174cdd68) at /home/dell/qemu5-hypervisor/vm/fuzz-seedpool/hcd-ohci/qem=
u-5.1.0/softmmu/main.c:49
  #9  0x00007fdf39295840 in __libc_start_main (main=3D0x55c613f21699 <main>=
, argc=3D7, argv=3D0x7fff174cdd28, init=3D<optimized out>, fini=3D<optimize=
d out>, rtld_fini=3D<optimized out>, stack_end=3D0x7fff174cdd18) at ../csu/=
libc-start.c:291
  #10 0x000055c6120a4349 in _start ()

  The poc is attached.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1911216/+subscriptions


