Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A94F14E66B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 01:14:30 +0100 (CET)
Received: from localhost ([::1]:41380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixJx7-0000oG-9L
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 19:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ixJnp-0007rY-Gd
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:04:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ixJno-00035B-1h
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:04:53 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:51351 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ixJnn-0002wB-LT
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:04:51 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 465CD1A20A9;
 Fri, 31 Jan 2020 01:03:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 14DCD1A2105;
 Fri, 31 Jan 2020 01:03:38 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH rc4 23/29] hw/avr: Add helper to load raw/ELF firmware binaries
Date: Fri, 31 Jan 2020 01:03:07 +0100
Message-Id: <1580428993-4767-24-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580428993-4767-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1580428993-4767-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Add avr_load_firmware() function to load firmware in ELF or
raw binary format.

[AM: Corrected the type of the variable containing e_flags]

Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 hw/avr/Makefile.objs |  1 +
 hw/avr/boot.c        | 74 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++
 hw/avr/boot.h        | 33 +++++++++++++++++++++++
 include/elf.h        |  2 ++
 4 files changed, 110 insertions(+)
 create mode 100644 hw/avr/Makefile.objs
 create mode 100644 hw/avr/boot.c
 create mode 100644 hw/avr/boot.h

diff --git a/hw/avr/Makefile.objs b/hw/avr/Makefile.objs
new file mode 100644
index 0000000..123f174
--- /dev/null
+++ b/hw/avr/Makefile.objs
@@ -0,0 +1 @@
+obj-y +=3D boot.o
diff --git a/hw/avr/boot.c b/hw/avr/boot.c
new file mode 100644
index 0000000..9ac2c88
--- /dev/null
+++ b/hw/avr/boot.c
@@ -0,0 +1,74 @@
+/*
+ * AVR loader helpers
+ *
+ * Copyright (c) 2019 Philippe Mathieu-Daud=C3=A9
+ *
+ * This work is licensed under the terms of the GNU GPLv2 or later.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "hw/loader.h"
+#include "elf.h"
+#include "boot.h"
+#include "qemu/error-report.h"
+
+bool avr_load_firmware(AVRCPU *cpu, MachineState *ms,
+                       MemoryRegion *mr, const char *firmware)
+{
+    const char *filename;
+    int bytes_loaded;
+    uint64_t entry;
+    uint32_t e_flags;
+
+    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware);
+    if (filename =3D=3D NULL) {
+        error_report("Unable to find %s", firmware);
+        return false;
+    }
+
+    bytes_loaded =3D load_elf_ram_sym(filename,
+                                    NULL, NULL, NULL,
+                                    &entry, NULL, NULL,
+                                    &e_flags, 0, EM_AVR, 0, 0,
+                                    NULL, true, NULL);
+    if (bytes_loaded >=3D 0) {
+        /* If ELF file is provided, determine CPU type reading ELF e_fla=
gs. */
+        const char *elf_cpu =3D avr_flags_to_cpu_type(e_flags, NULL);
+        const char *mcu_cpu_type =3D object_get_typename(OBJECT(cpu));
+        int cpu_len =3D strlen(mcu_cpu_type) - strlen(AVR_CPU_TYPE_SUFFI=
X);
+
+        if (entry) {
+            error_report("BIOS entry_point must be 0x0000 "
+                         "(ELF image '%s' has entry_point 0x%04" PRIx64 =
")",
+                         firmware, entry);
+            return false;
+        }
+        if (!elf_cpu) {
+            warn_report("Could not determine CPU type for ELF image '%s'=
, "
+                        "assuming '%.*s' CPU",
+                         firmware, cpu_len, mcu_cpu_type);
+            return true;
+        }
+        if (strcmp(elf_cpu, mcu_cpu_type)) {
+            error_report("Current machine: %s with '%.*s' CPU",
+                         MACHINE_GET_CLASS(ms)->desc, cpu_len, mcu_cpu_t=
ype);
+            error_report("ELF image '%s' is for '%.*s' CPU",
+                         firmware,
+                         (int)(strlen(elf_cpu) - strlen(AVR_CPU_TYPE_SUF=
FIX)),
+                         elf_cpu);
+            return false;
+        }
+    } else {
+        bytes_loaded =3D load_image_targphys(filename, OFFSET_CODE,
+                                           memory_region_size(mr));
+    }
+    if (bytes_loaded < 0) {
+        error_report("Unable to load firmware image %s as ELF or raw bin=
ary",
+                     firmware);
+        return false;
+    }
+    return true;
+}
diff --git a/hw/avr/boot.h b/hw/avr/boot.h
new file mode 100644
index 0000000..62bc10c
--- /dev/null
+++ b/hw/avr/boot.h
@@ -0,0 +1,33 @@
+/*
+ * AVR loader helpers
+ *
+ * Copyright (c) 2019 Philippe Mathieu-Daud=C3=A9
+ *
+ * This work is licensed under the terms of the GNU GPLv2 or later.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_AVR_BOOT_H
+#define HW_AVR_BOOT_H
+
+#include "hw/boards.h"
+#include "cpu.h"
+
+/**
+ * avr_load_firmware:   load an image into a memory region
+ *
+ * @cpu:        Handle a AVR CPU object
+ * @ms:         A MachineState
+ * @mr:         Memory Region to load into
+ * @firmware:   Path to the firmware file (raw binary or ELF format)
+ *
+ * Load a firmware supplied by the machine or by the user  with the
+ * '-bios' command line option, and put it in target memory.
+ *
+ * Returns: true on success, false on error.
+ */
+bool avr_load_firmware(AVRCPU *cpu, MachineState *ms,
+                       MemoryRegion *mr, const char *firmware);
+
+#endif
diff --git a/include/elf.h b/include/elf.h
index 8fbfe60..3f08f68 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -202,6 +202,8 @@ typedef struct mips_elf_abiflags_v0 {
 #define EM_MOXIE           223     /* Moxie processor family */
 #define EM_MOXIE_OLD       0xFEED
=20
+#define EM_AVR 83 /* AVR 8-bit microcontroller */
+
 /* This is the info that is needed to parse the dynamic section of the f=
ile */
 #define DT_NULL		0
 #define DT_NEEDED	1
--=20
2.7.4


