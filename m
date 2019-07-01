Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79004A5B5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 17:45:26 +0200 (CEST)
Received: from localhost ([::1]:59116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdGIX-0008It-PK
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 11:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39684)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hdFGv-0002uc-Ph
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:39:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hdFGt-0000mE-27
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:39:41 -0400
Received: from mail01.asahi-net.or.jp ([202.224.55.13]:33711)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hdFGs-0000iL-Nh
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:39:38 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail01.asahi-net.or.jp (Postfix) with ESMTPA id 15CD2126CCC;
 Tue, 18 Jun 2019 23:39:36 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id C1475240085;
 Tue, 18 Jun 2019 23:39:35 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Tue, 18 Jun 2019 23:39:21 +0900
Message-Id: <20190618143923.53838-20-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190618143923.53838-1-ysato@users.sourceforge.jp>
References: <20190618143923.53838-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.13
Subject: [Qemu-devel] [PATCH RESEND v21 19/21] hw/rx: Restrict the RX62N
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


