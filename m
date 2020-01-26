Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40BD149D7F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 00:04:04 +0100 (CET)
Received: from localhost ([::1]:38026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ivqwl-0000qA-Uz
	for lists+qemu-devel@lfdr.de; Sun, 26 Jan 2020 18:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ivqpq-0005cc-Vg
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 17:56:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ivqpo-0000T8-T5
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 17:56:54 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:37695 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ivqpo-00083F-HC
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 17:56:52 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 9E1261A1CDE;
 Sun, 26 Jan 2020 23:55:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 816F01A1CD3;
 Sun, 26 Jan 2020 23:55:49 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH rc3 03/30] target/avr: Add migration support
Date: Sun, 26 Jan 2020 23:54:44 +0100
Message-Id: <1580079311-20447-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580079311-20447-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1580079311-20447-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Rolnik <mrolnik@gmail.com>

Add migration functions for AVR cores.

Co-developed-by: Michael Rolnik <mrolnik@gmail.com>
Co-developed-by: Sarah Harris <S.E.Harris@kent.ac.uk>
Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 target/avr/cpu.c     |   1 +
 target/avr/cpu.h     |   4 ++
 target/avr/machine.c | 121 +++++++++++++++++++++++++++++++++++++++++++++=
++++++
 3 files changed, 126 insertions(+)
 create mode 100644 target/avr/machine.c

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 3f3d840..8a9b106 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -212,6 +212,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void =
*data)
     cc->handle_mmu_fault =3D avr_cpu_handle_mmu_fault;
 #else
     cc->get_phys_page_debug =3D avr_cpu_get_phys_page_debug;
+    cc->vmsd =3D &vms_avr_cpu;
 #endif
     cc->disas_set_info =3D avr_cpu_disas_set_info;
     cc->tlb_fill =3D avr_cpu_tlb_fill;
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index f7a403a..9d08bff 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -115,6 +115,10 @@ typedef struct AVRCPU {
     CPUAVRState env;
 } AVRCPU;
=20
+#ifndef CONFIG_USER_ONLY
+extern const struct VMStateDescription vms_avr_cpu;
+#endif
+
 void avr_cpu_do_interrupt(CPUState *cpu);
 bool avr_cpu_exec_interrupt(CPUState *cpu, int int_req);
 hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
diff --git a/target/avr/machine.c b/target/avr/machine.c
new file mode 100644
index 0000000..ba44bd0
--- /dev/null
+++ b/target/avr/machine.c
@@ -0,0 +1,121 @@
+/*
+ * QEMU AVR CPU
+ *
+ * Copyright (c) 2019 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "migration/cpu.h"
+
+static int get_sreg(QEMUFile *f, void *opaque, size_t size,
+    const VMStateField *field)
+{
+    CPUAVRState *env =3D opaque;
+    uint8_t sreg;
+
+    sreg =3D qemu_get_byte(f);
+    cpu_set_sreg(env, sreg);
+    return 0;
+}
+
+static int put_sreg(
+    QEMUFile *f, void *opaque, size_t size,
+    const VMStateField *field, QJSON *vmdesc)
+{
+    CPUAVRState *env =3D opaque;
+    uint8_t sreg =3D cpu_get_sreg(env);
+
+    qemu_put_byte(f, sreg);
+    return 0;
+}
+
+static const VMStateInfo vms_sreg =3D {
+    .name =3D "sreg",
+    .get =3D get_sreg,
+    .put =3D put_sreg,
+};
+
+static int get_segment(
+    QEMUFile *f, void *opaque, size_t size, const VMStateField *field)
+{
+    uint32_t *ramp =3D opaque;
+    uint8_t temp;
+
+    temp =3D qemu_get_byte(f);
+    *ramp =3D ((uint32_t)temp) << 16;
+    return 0;
+}
+
+static int put_segment(
+    QEMUFile *f, void *opaque, size_t size,
+    const VMStateField *field, QJSON *vmdesc)
+{
+    uint32_t *ramp =3D opaque;
+    uint8_t temp =3D *ramp >> 16;
+
+    qemu_put_byte(f, temp);
+    return 0;
+}
+
+static const VMStateInfo vms_rampD =3D {
+    .name =3D "rampD",
+    .get =3D get_segment,
+    .put =3D put_segment,
+};
+static const VMStateInfo vms_rampX =3D {
+    .name =3D "rampX",
+    .get =3D get_segment,
+    .put =3D put_segment,
+};
+static const VMStateInfo vms_rampY =3D {
+    .name =3D "rampY",
+    .get =3D get_segment,
+    .put =3D put_segment,
+};
+static const VMStateInfo vms_rampZ =3D {
+    .name =3D "rampZ",
+    .get =3D get_segment,
+    .put =3D put_segment,
+};
+static const VMStateInfo vms_eind =3D {
+    .name =3D "eind",
+    .get =3D get_segment,
+    .put =3D put_segment,
+};
+
+const VMStateDescription vms_avr_cpu =3D {
+    .name =3D "cpu",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(env.pc_w, AVRCPU),
+        VMSTATE_UINT32(env.sp, AVRCPU),
+        VMSTATE_UINT32(env.skip, AVRCPU),
+
+        VMSTATE_UINT32_ARRAY(env.r, AVRCPU, NUMBER_OF_CPU_REGISTERS),
+
+        VMSTATE_SINGLE(env, AVRCPU, 0, vms_sreg, CPUAVRState),
+        VMSTATE_SINGLE(env.rampD, AVRCPU, 0, vms_rampD, uint32_t),
+        VMSTATE_SINGLE(env.rampX, AVRCPU, 0, vms_rampX, uint32_t),
+        VMSTATE_SINGLE(env.rampY, AVRCPU, 0, vms_rampY, uint32_t),
+        VMSTATE_SINGLE(env.rampZ, AVRCPU, 0, vms_rampZ, uint32_t),
+        VMSTATE_SINGLE(env.eind, AVRCPU, 0, vms_eind, uint32_t),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
--=20
2.7.4


