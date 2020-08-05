Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CBD23C4A6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 06:37:23 +0200 (CEST)
Received: from localhost ([::1]:59324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3BB4-0003Xs-EM
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 00:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k3B9J-0002BP-7e
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 00:35:33 -0400
Received: from indium.canonical.com ([91.189.90.7]:34290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k3B9G-0003In-2X
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 00:35:32 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k3B9E-00053m-A6
 for <qemu-devel@nongnu.org>; Wed, 05 Aug 2020 04:35:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4B3142E80D2
 for <qemu-devel@nongnu.org>; Wed,  5 Aug 2020 04:35:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2020 04:28:46 -0000
From: Alexander Bulekov <1890370@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <159660104285.4629.16787901721110187136.malonedeb@soybean.canonical.com>
Message-Id: <159660172720.10348.275070148049480166.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1890370] Re: Segfault in artist vram_bit_write
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a24057fea7e4c6a98c0220d5f878da0f3c783699";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 75c171e129c054fa96c12fe2c774ff621795f418
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 00:25:36
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
Reply-To: Bug 1890370 <1890370@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890370

Title:
  Segfault in artist vram_bit_write

Status in QEMU:
  Invalid

Bug description:
  Hello,
  Reproducer:

  cat << EOF | ./hppa-softmmu/qemu-system-hppa -m 64 -display none \
  -qtest stdio -accel qtest
  writeq 0xf810049f 0xffffffffffffffff
  writew 0xf8118001 0xff7c
  writew 0xf8118000 0x8300
  writeq 0xf81005fb 0x5c18006400189e
  EOF

  =

  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior /hw/display/artis=
t.c:402:17 in
  AddressSanitizer:DEADLYSIGNAL
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D23157=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x7f175=
63fffff (pc 0x560ce3ad742c bp 0x7ffe310c62e0 sp 0x7ffe310c5a60 T0)
  =3D=3D23157=3D=3DThe signal is caused by a WRITE memory access.
      #0 0x560ce3ad742c in vram_bit_write /hw/display/artist.c:402:43
      #1 0x560ce3acf2ab in artist_reg_write /hw/display/artist.c:892:9
      #2 0x560ce31c37a3 in memory_region_write_accessor /softmmu/memory.c:4=
83:5
      #3 0x560ce31c2adc in access_with_adjusted_size /softmmu/memory.c:539:=
18
      #4 0x560ce31c0873 in memory_region_dispatch_write /softmmu/memory.c:1=
466:16
      #5 0x560ce286e056 in flatview_write_continue /exec.c:3176:23
      #6 0x560ce2856866 in flatview_write /exec.c:3216:14
      #7 0x560ce2856387 in address_space_write /exec.c:3308:18
      #8 0x560ce326a604 in qtest_process_command /softmmu/qtest.c:452:13
      #9 0x560ce3261c08 in qtest_process_inbuf /softmmu/qtest.c:710:9
      #10 0x560ce3260895 in qtest_read /softmmu/qtest.c:722:5
      #11 0x560ce571d343 in qemu_chr_be_write_impl /chardev/char.c:188:9
      #12 0x560ce571d4c7 in qemu_chr_be_write /chardev/char.c:200:9
      #13 0x560ce57317b3 in fd_chr_read /chardev/char-fd.c:68:9
      #14 0x560ce5885b74 in qio_channel_fd_source_dispatch /io/channel-watc=
h.c:84:12
      #15 0x7f1665259897 in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x4e897)
      #16 0x560ce5c7da7b in glib_pollfds_poll /util/main-loop.c:217:9
      #17 0x560ce5c7b1ab in os_host_main_loop_wait /util/main-loop.c:240:5
      #18 0x560ce5c7ab44 in main_loop_wait /util/main-loop.c:516:11
      #19 0x560ce3282d00 in qemu_main_loop /softmmu/vl.c:1676:9
      #20 0x560ce58bd961 in main /softmmu/main.c:49:5
      #21 0x7f1663ddfe0a in __libc_start_main /build/glibc-GwnBeO/glibc-2.3=
0/csu/../csu/libc-start.c:308:16
      #22 0x560ce2761729 in _start (/home/alxndr/Development/qemu/general-f=
uzz/build/hppa-softmmu/qemu-system-hppa+0x22d4729)

  =

  With -trace artist\*

  [I 1596601002.853158] OPENED
  [R +0.047035] writeq 0xf810049f 0xffffffffffffffff
  24590@1596601002.900238:artist_reg_write 1 0x10049f <- 0xff
  24590@1596601002.900258:artist_reg_write 4 0x1004a0 VRAM_IDX <- 0xffffffff
  24590@1596601002.900269:artist_reg_write 2 0x1004a4 <- 0xffff
  24590@1596601002.900280:artist_reg_write 1 0x1004a6 <- 0xff
  OK
  [S +0.047130] OK
  [R +0.047159] writew 0xf8118001 0xff7c
  24590@1596601002.900331:artist_reg_write 1 0x118001 CMAP_BM_ACCESS <- 0xff
  24590@1596601002.900344:artist_reg_write 1 0x118002 CMAP_BM_ACCESS <- 0x7c
  OK
  [S +0.047194] OK
  [R +0.047213] writew 0xf8118000 0x8300
  24590@1596601002.900383:artist_reg_write 2 0x118000 CMAP_BM_ACCESS <- 0x8=
300
  OK
  [S +0.047231] OK
  [R +0.047243] writeq 0xf81005fb 0x5c18006400189e
  24590@1596601002.900410:artist_reg_write 1 0x1005fb <- 0x0
  24590@1596601002.900418:artist_reg_write 4 0x1005fc <- 0x5c180064
  24590@1596601002.900424:artist_reg_write 2 0x100600 VRAM_WRITE_INCR_X <- =
0x18
  /home/alxndr/Development/qemu/general-fuzz/hw/display/artist.c:402:17: ru=
ntime error: store to misaligned address 0x7fd01d3fffff for type 'uint32_t'=
 (aka 'unsigned int'), which requires 4 byte alignment
  0x7fd01d3fffff: note: pointer points here
  <memory cannot be printed>
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior /home/alxndr/Deve=
lopment/qemu/general-fuzz/hw/display/artist.c:402:17 in
  AddressSanitizer:DEADLYSIGNAL

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890370/+subscriptions

