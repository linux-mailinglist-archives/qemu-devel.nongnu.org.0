Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1052B3F3884
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 06:23:15 +0200 (CEST)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHIXK-0002Gl-2h
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 00:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIUo-0007yk-KT
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:20:38 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:43222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mHIUm-0002Bq-SR
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:20:38 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 0922D3F6AB
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629519635;
 bh=Gmh1FjqKLbP1rNnXOGlv3WC9uvy8tIT/VEAWQf1GpC4=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=v5vfe1TxQUWPU0m24h6N+7wF2smD1LTRfIYMLo4fyGIOaPbf4HDXJbhIi0p5NI7Xl
 DKv58dVcHPIGYX3M84/Xl0xlGJ6HUMtGZ4RG3EvdBsR4u2ndcgURqtPHGPK1i5zXwS
 qkUc+KeicqgLyhvE4YehU1C847kctc63qLmTrq1qCZlaZNeyzJMziuzhD4S+Rhm4aL
 lkyhS7V/CUQ4jCjcOJkWq1RMY1vfdPxcTNN7tNIx1RvAIa/DG0Pg5u0nIGdD78lrSI
 Mw2qXwWn51q5tR2fqtlTFW4J1n08xgB+ZHUhUNM/XLZnhKFsbZjZ2TM+sE+pupTo5G
 ZCGCYWxyHmVeA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AA2462E8167
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 04:20:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Aug 2021 04:14:50 -0000
From: Alexander Bulekov <1918321@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: block fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <161531961935.11554.15835639895023157218.malonedeb@chaenomeles.canonical.com>
Message-Id: <162951929099.4708.5401683620285747978.malone@soybean.canonical.com>
Subject: [Bug 1918321] Re: [OSS-Fuzz] Issue 31875 megasas: Null-ptr
 dereference in megasas_finish_dcmd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="25edfd4b3e79d9ee9d9c3a750eb93e4d41d56c9e"; Instance="production"
X-Launchpad-Hash: cd385a289c3e1c8468a191d43f35874e52332ad9
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1918321 <1918321@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I moved this report over to QEMU's new bug tracker on gitlab.com.
Please continue with the discussion here:

https://gitlab.com/qemu-project/qemu/-/issues/548

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #548
   https://gitlab.com/qemu-project/qemu/-/issues/548

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1918321

Title:
  [OSS-Fuzz] Issue 31875 megasas: Null-ptr dereference in
  megasas_finish_dcmd

Status in QEMU:
  Confirmed

Bug description:
  Hello,

  =3D=3D QTest Reproducer =3D=3D
  /*=20
   * cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, =
-m \
   * 512M -machine q35 -nodefaults -device megasas -device \
   * scsi-cd,drive=3Dnull0 -blockdev \
   * driver=3Dnull-co,read-zeroes=3Don,node-name=3Dnull0 -qtest stdio
   * outl 0xcf8 0x80000801
   * outl 0xcfc 0x05000000
   * outl 0xcf8 0x80000816
   * outl 0xcfc 0x19000000
   * write 0x1e1ed300 0x1 0x01
   * write 0x1e1ed307 0x1 0x01
   * write 0x1e1ed316 0x1 0x01
   * write 0x1e1ed328 0x1 0x01
   * write 0x1e1ed32f 0x1 0x01
   * outl 0x1940 0x1e1ed300
   * outl 0x19c0 0x00
   * EOF
   */
  static void null_deref_megasas_finish_dcmd(void)
  {
      QTestState *s =3D qtest_init(
          "-display none , -m 512M -machine q35 -nodefaults -device megasas=
 -device "
          "scsi-cd,drive=3Dnull0 -blockdev driver=3Dnull-co,read-zeroes=3Do=
n,node-name=3Dnull0 ");
      qtest_outl(s, 0xcf8, 0x80000801);
      qtest_outl(s, 0xcfc, 0x05000000);
      qtest_outl(s, 0xcf8, 0x80000816);
      qtest_outl(s, 0xcfc, 0x19000000);
      qtest_bufwrite(s, 0x1e1ed300, "\x01", 0x1);
      qtest_bufwrite(s, 0x1e1ed307, "\x01", 0x1);
      qtest_bufwrite(s, 0x1e1ed316, "\x01", 0x1);
      qtest_bufwrite(s, 0x1e1ed328, "\x01", 0x1);
      qtest_bufwrite(s, 0x1e1ed32f, "\x01", 0x1);
      qtest_outl(s, 0x1940, 0x1e1ed300);
      qtest_outl(s, 0x19c0, 0x00);
      qtest_quit(s);
  }
  int main(int argc, char **argv)
  {
      const char *arch =3D qtest_get_arch();

      g_test_init(&argc, &argv, NULL);

      if (strcmp(arch, "i386") =3D=3D 0) {
          qtest_add_func("fuzz/null_deref_megasas_finish_dcmd",
                         null_deref_megasas_finish_dcmd);
      }

      return g_test_run();
  }

  =3D=3D Stack Trace =3D=3D
  ../hw/scsi/megasas.c:1884:21: runtime error: member access within null po=
inter of type 'union mfi_frame'
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/scsi/megasa=
s.c:1884:21 in
  ../hw/scsi/megasas.c:1884:21: runtime error: member access within null po=
inter of type 'struct mfi_frame_header'
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/scsi/megasa=
s.c:1884:21 in
  AddressSanitizer:DEADLYSIGNAL
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D314546=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x0000=
00000003 (pc 0x55b1b4f4de73 bp 0x7ffcfc5a8bb0 sp 0x7ffcfc5a8900 T0)
  =3D=3D314546=3D=3DThe signal is caused by a WRITE memory access.
  =3D=3D314546=3D=3DHint: address points to the zero page.
  #0 0x55b1b4f4de73 in megasas_command_complete build/../hw/scsi/megasas.c:=
1884:40
  #1 0x55b1b5613914 in scsi_req_complete build/../hw/scsi/scsi-bus.c:1515:5
  #2 0x55b1b5448aeb in scsi_dma_complete_noio build/../hw/scsi/scsi-disk.c:=
345:9
  #3 0x55b1b5446fc7 in scsi_dma_complete build/../hw/scsi/scsi-disk.c:366:5
  #4 0x55b1b4fffc56 in dma_complete build/../softmmu/dma-helpers.c:121:9
  #5 0x55b1b4fffc56 in dma_blk_cb build/../softmmu/dma-helpers.c:139:9
  #6 0x55b1b6856016 in blk_aio_complete build/../block/block-backend.c:1412=
:9
  #7 0x55b1b6f48b06 in aio_bh_poll build/../util/async.c:164:13
  #8 0x55b1b6f08cec in aio_dispatch build/../util/aio-posix.c:381:5
  #9 0x55b1b6f4d59c in aio_ctx_dispatch build/../util/async.c:306:5
  #10 0x7fd88c098baa in g_main_context_dispatch (/usr/lib/x86_64-linux-gnu/=
libglib-2.0.so.0+0x51baa)
  #11 0x55b1b6f59a3c in glib_pollfds_poll build/../util/main-loop.c:232:9
  #12 0x55b1b6f59a3c in os_host_main_loop_wait build/../util/main-loop.c:25=
5:5
  #13 0x55b1b6f59a3c in main_loop_wait build/../util/main-loop.c:531:11
  #14 0x55b1b61a78a9 in qemu_main_loop build/../softmmu/runstate.c:725:9
  #15 0x55b1b4c751e5 in main build/../softmmu/main.c:50:5
  #16 0x7fd88aec6d09 in __libc_start_main csu/../csu/libc-start.c:308:16
  #17 0x55b1b4bc8bb9 in _start (system-i386+0x2b5fbb9)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1918321/+subscriptions


