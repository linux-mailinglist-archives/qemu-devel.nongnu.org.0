Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496333F387B
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 06:13:44 +0200 (CEST)
Received: from localhost ([::1]:50706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHIO6-0000s4-Uu
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 00:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHILK-00075t-OS
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:10:50 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:42376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHILH-0002QW-LM
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:10:50 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 2B40B3F6F5
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629519046;
 bh=Q2Bw4clhjNGbiA7Jmr9C6cGk2RcYdCPofg2zlk5jvyA=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=JQoG3m0gs7e2JpEk+sSn8IzZ2qYAOeOyAWcRpBSejfelZZy961AwZatvWesidGctB
 jzEx5Xrdisnrg0K4/G7Bg5RgHrFX4yP5mClAQOQCFsZ9Is9g+R6SAL5y0bjqZcqqc7
 lml8TRRKXzskeezg94y8IJ7ZksVvn67SOad8LHYBIyQXaGHqqzjAJVzkRAJzSCZmqz
 jhle0+lU8PujvO1DXbocviZTOlSnC9a1X9kK1kUuj3U4Kh/cXqfHo+TmalFSh1kQKC
 uqq0qVbFX4OsN2YaFKbbo/MTsSLuRsR/39Y+lVAMDIc6lVX4tNOh5fRH2Ve2soZdm9
 Otr9rfDgz2zig==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1F2502E8167
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:10:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 04:00:38 -0000
From: Alexander Bulekov <1878057@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <158921834595.12757.16112597546001644574.malonedeb@wampee.canonical.com>
Message-Id: <162951843847.15015.6659499885524960291.malone@wampee.canonical.com>
Subject: [Bug 1878057] Re: null-ptr dereference in megasas_command_complete
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: 4c195f81201169b7d9df1b070798e45c60bc0363
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
Reply-To: Bug 1878057 <1878057@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I moved this report over to QEMU's new bug tracker on gitlab.com.
Please continue with the discussion here:

https://gitlab.com/qemu-project/qemu/-/issues/551

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #551
   https://gitlab.com/qemu-project/qemu/-/issues/551

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878057

Title:
  null-ptr dereference in megasas_command_complete

Status in QEMU:
  Incomplete

Bug description:
  Hello,
  While fuzzing, I found an input that triggers a null-pointer dereference =
in
  megasas_command_complete:

  =3D=3D14959=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x00000=
0000003 (pc 0x55b1d11b4df1 bp 0x7ffeb55ca450 sp 0x7ffeb55ca1e0 T0)
  =3D=3D14959=3D=3DThe signal is caused by a WRITE memory access.
  =3D=3D14959=3D=3DHint: address points to the zero page.
      #0 0x55b1d11b4df1 in megasas_command_complete /home/alxndr/Developmen=
t/qemu/hw/scsi/megasas.c:1877:40
      #1 0x55b1d11759ec in scsi_req_complete /home/alxndr/Development/qemu/=
hw/scsi/scsi-bus.c:1430:5
      #2 0x55b1d115c98f in scsi_aio_complete /home/alxndr/Development/qemu/=
hw/scsi/scsi-disk.c:216:5
      #3 0x55b1d151c638 in blk_aio_complete /home/alxndr/Development/qemu/b=
lock/block-backend.c:1375:9
      #4 0x55b1d151c638 in blk_aio_complete_bh /home/alxndr/Development/qem=
u/block/block-backend.c:1385:5
      #5 0x55b1d16f3a5b in aio_bh_call /home/alxndr/Development/qemu/util/a=
sync.c:136:5
      #6 0x55b1d16f3a5b in aio_bh_poll /home/alxndr/Development/qemu/util/a=
sync.c:164:13
      #7 0x55b1d16fe43e in aio_dispatch /home/alxndr/Development/qemu/util/=
aio-posix.c:380:5
      #8 0x55b1d16f54fa in aio_ctx_dispatch /home/alxndr/Development/qemu/u=
til/async.c:306:5
      #9 0x7f47937c89ed in g_main_context_dispatch (/usr/lib/x86_64-linux-g=
nu/libglib-2.0.so.0+0x4e9ed)
      #10 0x55b1d16fbef4 in glib_pollfds_poll /home/alxndr/Development/qemu=
/util/main-loop.c:219:9
      #11 0x55b1d16fbef4 in os_host_main_loop_wait /home/alxndr/Development=
/qemu/util/main-loop.c:242:5
      #12 0x55b1d16fbef4 in main_loop_wait /home/alxndr/Development/qemu/ut=
il/main-loop.c:518:11
      #13 0x55b1d0cd16a6 in qemu_main_loop /home/alxndr/Development/qemu/so=
ftmmu/vl.c:1664:9
      #14 0x55b1d1608dca in main /home/alxndr/Development/qemu/softmmu/main=
.c:49:5
      #15 0x7f4792378e0a in __libc_start_main /build/glibc-GwnBeO/glibc-2.3=
0/csu/../csu/libc-start.c:308:16
      #16 0x55b1d091d7b9 in _start (/home/alxndr/Development/qemu/build/i38=
6-softmmu/qemu-system-i386+0x8f47b9)

  I can reproduce it in qemu 5.0 built with using:
  cat << EOF | ~/Development/qemu/build/i386-softmmu/qemu-system-i386 -M pc=
-q35-5.0 -no-shutdown -M q35 -device megasas -device scsi-cd,drive=3Dnull0 =
-blockdev driver=3Dnull-co,read-zeroes=3Don,node-name=3Dnull0 -nographic -q=
test stdio -monitor none -serial none
  outl 0xcf8 0x80001814
  outl 0xcfc 0xc021
  outl 0xcf8 0x80001818
  outl 0xcf8 0x80001804
  outw 0xcfc 0x7
  outl 0xcf8 0x80001810
  outl 0xcfc 0xe10c0000
  outl 0xcf8 0x8000f810
  write 0x44b20 0x1 0x35
  write 0x44b00 0x1 0x03
  write 0xc021e10c0040 0x81 0x014b04000131000000014b04000138000000014b04000=
13f000000014b04000146000000014b0400014d000000014b04000154000000014b0400015b=
000000014b04000162000000014b04000169000000014b04000170000000014b04000177000=
000014b0400017e000000014b04000185000000014b0400018c000000014b04
  EOF

  I also attached the trace to this launchpad report, in case the
  formatting is broken:

  qemu-system-i386 -qtest stdio -monitor none -serial none -M pc-q35-5.0
  -no-shutdown -M q35 -device megasas -device scsi-cd,drive=3Dnull0
  -blockdev driver=3Dnull-co,read-zeroes=3Don,node-name=3Dnull0 -nographic <
  attachment

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878057/+subscriptions


