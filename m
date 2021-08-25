Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F773F7043
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:19:55 +0200 (CEST)
Received: from localhost ([::1]:60278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInCU-0007ol-Br
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mIn8c-00084W-Bw
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:15:54 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:41918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mIn8X-00043u-AF
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:15:54 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 431953F816
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629875746;
 bh=onAJ59Ky8MtSRRp/csgtXUSXC2ukdBhvV5Lzm82TlR4=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=lu4ifVw+LHiU8hmmOJ5+wuMXnvi9I5orqI3zxFyk8P4C3gl6TUGrh+ptt7xeBN0e2
 XHzL5lgCWzM3f4rCsThYNgsr7CTJw3C3woumFCJ5Q2ccdjJlpOgRm6Ta8BW/RXYOVS
 x28DmGbhv4qx4rG8nkOG4TE7HCZ9BoD/DacMJYfxSznY+FTTJgOJGPjA9cAYihNUbx
 EyeR/GIukIkT+8XvtLh2SEIiWoxKmp+hdaFUyzz155pxkYwjwhX/3sdu57onNxpuAF
 2SZ7P+IlmUEUm5JeBW5IDX8gkZ4fCXOD4rDD4tnJfFDFY7wAEzTbNSpe96houdNZAE
 zd38+bbvPoA3A==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8BB3E2E81BC
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:15:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:06:56 -0000
From: Thomas Huth <1926111@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=th.huth@posteo.de; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161940714680.11021.12941917748278413607.malonedeb@soybean.canonical.com>
Message-Id: <162987521759.13086.16877448876318638637.launchpad@gac.canonical.com>
Subject: [Bug 1926111] Re: Assertion `tx_queue_idx <= s->txq_num' failed in
 vmxnet3_io_bar0_write
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 39069981ca56c56e9a25eb8b278cda7b8c99c7c8
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
Reply-To: Bug 1926111 <1926111@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926111

Title:
  Assertion `tx_queue_idx <=3D s->txq_num' failed in vmxnet3_io_bar0_write

Status in QEMU:
  Fix Released

Bug description:
  =3D=3D=3D Stacktrace =3D=3D=3D

  qemu-fuzz-i386: ../hw/net/vmxnet3.c:1096: void vmxnet3_io_bar0_write(void=
 *, hwaddr, uint64_t, unsigned int): Assertion `tx_queue_idx <=3D s->txq_nu=
m' failed.
  =3D=3D602353=3D=3D ERROR: libFuzzer: deadly signal
  #5 0x7fe4b93a7ce0 in raise signal/../sysdeps/unix/sysv/linux/raise.c:48:3
  #6 0x7fe4b9391536 in abort stdlib/abort.c:79:7
  #7 0x7fe4b939140e in __assert_fail_base assert/assert.c:92:3
  #8 0x7fe4b93a0661 in __assert_fail assert/assert.c:101:3
  #9 0x563e6cf5ebb5 in vmxnet3_io_bar0_write  hw/net/vmxnet3.c:1096:9
  #10 0x563e6eefdb00 in memory_region_write_accessor  softmmu/memory.c:491:5
  #11 0x563e6eefcfdd in access_with_adjusted_size  softmmu/memory.c:552:18
  #12 0x563e6eefac90 in memory_region_dispatch_write  softmmu/memory.c:1502=
:16
  #13 0x563e6e834e16 in flatview_write_continue  softmmu/physmem.c:2746:23
  #14 0x563e6e81cd38 in flatview_write  softmmu/physmem.c:2786:14
  #15 0x563e6e81c868 in address_space_write  softmmu/physmem.c:2878:18

  =3D=3D=3D Reproducer =3D=3D=3D
  cat << EOF | ./qemu-system-i386  -display none -machine accel=3Dqtest, -m=
 \
  512M -machine q35 -nodefaults -device vmxnet3,netdev=3Dnet0 -netdev \
  user,id=3Dnet0 -qtest stdio
  outl 0xcf8 0x80000810
  outl 0xcfc 0xe0000000
  outl 0xcf8 0x80000814
  outl 0xcf8 0x80000804
  outw 0xcfc 0x7
  outl 0xcf8 0x80000815
  outl 0xcfc 0xffff00b5
  write 0x0 0x1 0xe1
  write 0x1 0x1 0xfe
  write 0x2 0x1 0xbe
  write 0x3 0x1 0xba
  write 0xff00b020 0x4 0x0000feca
  write 0xe0000630 0x1 0x00
  EOF

 =20
  =3D=3D=3D Testcase =3D=3D=3D

  /*
   * Autogenerated Fuzzer Test Case
   *
   * This work is licensed under the terms of the GNU GPL, version 2 or lat=
er.
   * See the COPYING file in the top-level directory.
   */

  #include "qemu/osdep.h"

  #include "libqos/libqtest.h"

  static void test_fuzz(void) {
      QTestState *s =3D qtest_init(" -display none , -m 512M -machine q35 -=
nodefaults "
                                 "-device vmxnet3,netdev=3Dnet0 -netdev use=
r,id=3Dnet0");
      qtest_outl(s, 0xcf8, 0x80000810);
      qtest_outl(s, 0xcfc, 0xe0000000);
      qtest_outl(s, 0xcf8, 0x80000814);
      qtest_outl(s, 0xcf8, 0x80000804);
      qtest_outw(s, 0xcfc, 0x7);
      qtest_outl(s, 0xcf8, 0x80000815);
      qtest_outl(s, 0xcfc, 0xffff00b5);
      qtest_bufwrite(s, 0x0, "\xe1", 0x1);
      qtest_bufwrite(s, 0x1, "\xfe", 0x1);
      qtest_bufwrite(s, 0x2, "\xbe", 0x1);
      qtest_bufwrite(s, 0x3, "\xba", 0x1);
      qtest_bufwrite(s, 0xff00b020, "\x00\x00\xfe\xca", 0x4);
      qtest_bufwrite(s, 0xe0000630, "\x00", 0x1);
      qtest_quit(s);
  }
  int main(int argc, char **argv) {
      const char *arch =3D qtest_get_arch();

      g_test_init(&argc, &argv, NULL);

      if (strcmp(arch, "i386") =3D=3D 0) {
          qtest_add_func("fuzz/test_fuzz", test_fuzz);
      }

      return g_test_run();
  }

 =20
  =3D=3D=3D OSS-Fuzz Report =3D=3D=3D
  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D33603
  https://oss-fuzz.com/testcase?key=3D6071483232288768

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926111/+subscriptions


