Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB6E297E9A
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Oct 2020 23:03:39 +0200 (CEST)
Received: from localhost ([::1]:39108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWQhO-0007qU-Dc
	for lists+qemu-devel@lfdr.de; Sat, 24 Oct 2020 17:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kWQek-0006aa-7v
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 17:00:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:42010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kWQeh-0007Rv-NV
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 17:00:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kWQee-0004Lk-B6
 for <qemu-devel@nongnu.org>; Sat, 24 Oct 2020 21:00:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 52FEF2E8133
 for <qemu-devel@nongnu.org>; Sat, 24 Oct 2020 21:00:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2020 20:51:00 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1892540@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: sparc testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gson laurent-vivier mark-cave-ayland mst-0 philmd
X-Launchpad-Bug-Reporter: Andreas Gustafsson (gson)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <159803735569.2614.10182276398047269277.malonedeb@chaenomeles.canonical.com>
Message-Id: <20201024205100.3623006-1-f4bug@amsat.org>
Subject: [Bug 1892540] [PATCH v3] hw/display/tcx: Allow 64-bit accesses to
 framebuffer stippler and blitter
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bc5a16cfdc4ba776ecdf84a052201ef8fb1f3321"; Instance="production"
X-Launchpad-Hash: b0b9b0b52e7b4a847ae6bbafd3cdb3cb963d8d02
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/24 17:00:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1892540 <1892540@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The S24/TCX datasheet is listed as "Unable to locate" on [1].

However the NetBSD revision 1.32 of the driver introduced
64-bit accesses to the stippler and blitter [2]. It is safe
to assume these memory regions are 64-bit accessible.
QEMU implementation is 32-bit, so fill the 'impl' fields.

Michael Lorenz (author of the NetBSD code [2]) provided us with more
information in [3]:

> IIRC the real hardware *requires* 64bit accesses for stipple and
> blitter operations to work. For stipples you write a 64bit word into
> STIP space, the address defines where in the framebuffer you want to
> draw, the data contain a 32bit bitmask, foreground colour and a ROP.
> BLIT space works similarly, the 64bit word contains an offset were to
> read pixels from, and how many you want to copy.
>
> One more thing since there seems to be some confusion - 64bit accesses
> on the framebuffer are fine as well. TCX/S24 is *not* an SBus device,
> even though its node says it is.
> S24 is a card that plugs into a special slot on the SS5 mainboard,
> which is shared with an SBus slot and looks a lot like a horizontal
> UPA slot. Both S24 and TCX are accessed through the Micro/TurboSPARC's
> AFX bus which is 64bit wide and intended for graphics.
> Early FFB docs even mentioned connecting to both AFX and UPA,
> no idea if that was ever realized in hardware though.

[1] http://web.archive.org/web/20111209011516/http://wikis.sun.com/display/=
FOSSdocs/Home
[2] http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/sbus/tcx.c.diff?r1=3D1.=
31&r2=3D1.32
[3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg734928.html

Reported-by: Andreas Gustafsson <gson@gson.org>
Buglink: https://bugs.launchpad.net/bugs/1892540
Fixes: 55d7bfe2293 ("tcx: Implement hardware acceleration")
Tested-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Andreas Gustafsson <gson@gson.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
Since v2:
- added Michael's memories
- added R-b/T-b tags

Since v1:
- added missing uncommitted staged changes... (tcx_blit_ops)
---
 hw/display/tcx.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index c9d5e45cd1f..878ecc8c506 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -549,20 +549,28 @@ static const MemoryRegionOps tcx_stip_ops =3D {
     .read =3D tcx_stip_readl,
     .write =3D tcx_stip_writel,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
-    .valid =3D {
+    .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
+    .valid =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 8,
+    },
 };
 =

 static const MemoryRegionOps tcx_rstip_ops =3D {
     .read =3D tcx_stip_readl,
     .write =3D tcx_rstip_writel,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
-    .valid =3D {
+    .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
+    .valid =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 8,
+    },
 };
 =

 static uint64_t tcx_blit_readl(void *opaque, hwaddr addr,
@@ -651,10 +659,14 @@ static const MemoryRegionOps tcx_rblit_ops =3D {
     .read =3D tcx_blit_readl,
     .write =3D tcx_rblit_writel,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
-    .valid =3D {
+    .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
+    .valid =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 8,
+    },
 };
 =

 static void tcx_invalidate_cursor_position(TCXState *s)
-- =

2.26.2

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892540

Title:
  qemu can no longer boot NetBSD/sparc

Status in QEMU:
  New

Bug description:
  Booting NetBSD/sparc in qemu no longer works.  It broke between qemu
  version 5.0.0 and 5.1.0, and a bisection identified the following as
  the offending commit:

    [5d971f9e672507210e77d020d89e0e89165c8fc9] memory: Revert "memory:
  accept mismatching sizes in memory_region_access_valid"

  It's still broken as of 7fd51e68c34fcefdb4d6fd646ed3346f780f89f4.

  To reproduce, run

    wget http://ftp.netbsd.org/pub/NetBSD/NetBSD-9.0/images/NetBSD-9.0-spar=
c.iso
    qemu-system-sparc -nographic -cdrom NetBSD-9.0-sparc.iso -boot d

  The expected behavior is that the guest boots to the prompt

    Installation medium to load the additional utilities from:

  The observed behavior is a panic:

    [   1.0000050] system[0]: trap 0x29: pc=3D0xf0046b14 sfsr=3D0xb6 sfva=
=3D0x54000000
    [   1.0000050] cpu0: data fault: pc=3D0xf0046b14 addr=3D0x54000000 sfsr=
=3D0xb6<PERR=3D0x0,LVL=3D0x0,AT=3D0x5,FT=3D0x5,FAV,OW>
    [   1.0000050] panic: kernel fault
    [   1.0000050] halted

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892540/+subscriptions

