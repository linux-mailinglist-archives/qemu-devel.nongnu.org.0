Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A08560237
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 10:35:24 +0200 (CEST)
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjJgh-00053J-Dn
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 04:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56893)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hjJdf-0003FK-BM
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 04:32:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hjJda-0005uZ-CI
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 04:32:15 -0400
Received: from mail01.asahi-net.or.jp ([202.224.55.13]:44263)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hjJdY-0005p3-VY
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 04:32:09 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail01.asahi-net.or.jp (Postfix) with ESMTPA id EE79212B1AA;
 Fri,  5 Jul 2019 17:32:06 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id A27D9240085;
 Fri,  5 Jul 2019 17:32:06 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 17:31:38 +0900
Message-Id: <20190705083141.106254-20-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190705083141.106254-1-ysato@users.sourceforge.jp>
References: <20190705083141.106254-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.13
Subject: [Qemu-devel] [PATCH v22 19/22] hw/rx: Restrict the RX62N
 microcontroller to the RX62N CPU core
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

While the VIRT machine can use different microcontrollers,
the RX62N microcontroller is tied to the RX62N CPU core.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 hw/rx/rx-virt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/rx/rx-virt.c b/hw/rx/rx-virt.c
index 4cfe2e3123..9676a5e7bf 100644
--- a/hw/rx/rx-virt.c
+++ b/hw/rx/rx-virt.c
@@ -17,6 +17,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -56,6 +57,7 @@ static void rx_load_image(RXCPU *cpu, const char *filen=
ame,
=20
 static void rxvirt_init(MachineState *machine)
 {
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     RX62NState *s =3D g_new(RX62NState, 1);
     MemoryRegion *sysmem =3D get_system_memory();
     MemoryRegion *sdram =3D g_new(MemoryRegion, 1);
@@ -64,6 +66,12 @@ static void rxvirt_init(MachineState *machine)
     void *dtb =3D NULL;
     int dtb_size;
=20
+    if (strcmp(machine->cpu_type, mc->default_cpu_type) !=3D 0) {
+        error_report("This board can only be used with CPU %s",
+                     mc->default_cpu_type);
+        exit(1);
+    }
+
     /* Allocate memory space */
     memory_region_init_ram(sdram, NULL, "sdram", 16 * MiB,
                            &error_fatal);
--=20
2.11.0


