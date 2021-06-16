Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD593AA5CC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:58:34 +0200 (CEST)
Received: from localhost ([::1]:41880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltccL-0005IB-Ev
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPt-0003w6-OA
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPm-0001XB-T1
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GCjF8F/1VJOBX/ktZ6oKHcbI63O5csahyL1IvsamaYk=;
 b=J5VdQel7KN2vGwoahMVIL3hQhK/ZECihKNy+ZZqzB7xQZ9JGYv5jq5twJ5ZACLOPTef6U5
 e32CDnMcmnHXQedRpQBylfjcXacArm2Y/g+XGp5AWN8AttHBhHysm2pRRafif015Xa5aek
 F8mCG3bgLLuw8ysYn5PwUw7WIUc4gBo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-3IkJHwdKNeiyT1yU8JdCKA-1; Wed, 16 Jun 2021 16:45:33 -0400
X-MC-Unique: 3IkJHwdKNeiyT1yU8JdCKA-1
Received: by mail-wr1-f69.google.com with SMTP id
 s8-20020adff8080000b0290114e1eeb8c6so1845148wrp.23
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCjF8F/1VJOBX/ktZ6oKHcbI63O5csahyL1IvsamaYk=;
 b=nj1tkRjfkXDcgcqQGSiFGG9Q1GJYViIF/+Rr61tm750HMRnOkiZT3NoALar5uO3uFE
 KvDnzPQqOQptahyeF4KKQvSQ2Xj2VvPXyj+esdQcph1Y62RTQwQPZAPfulnTE8pOvGyj
 hzZCMo0greWcszDv91hBmCdxqVx9A4aRA/vEHpq6sC4jfYvd+msLtfov7EbIhjhEsGTm
 30RwoLCcku0aP1X8KT8fzPhX83gxWhXYWJe/RJJFTQIjrZ01P9Gt3GiphEzqRDZuCm/l
 7aUOPSUX5BJinXo5yObJp0alXm+TyCdVDc7bOoahb6ZWktuia09L92bpJljEabcdKh0a
 GHgA==
X-Gm-Message-State: AOAM532/YogzGpNMV4atmfvqzMuu6ndZk3O5abAVvacv9y1QQG9fryhu
 paVj7QMqKV/4tOEpV1xWStkYLB/OvMgtDoKAYwEu8VwjR/s6wpLP1WKADnc9FqWCrF/wra94oS3
 VSmDA1q/C6hxmcyH6g16OTH9pvNYk150Vife3ChosexKktBjovsGsGjtJyshPU47C
X-Received: by 2002:a5d:698a:: with SMTP id g10mr169073wru.129.1623876331795; 
 Wed, 16 Jun 2021 13:45:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6FEGynUJEPpQ9k1WO7HdqXA186x9NP+4wqCc1bZn9woeNRs7H5fWQJ6eXwmyiBKTex6yvsA==
X-Received: by 2002:a5d:698a:: with SMTP id g10mr169039wru.129.1623876331572; 
 Wed, 16 Jun 2021 13:45:31 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l16sm5624876wmq.28.2021.06.16.13.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:45:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/23] hw/i386: Introduce X86_FW_OVMF Kconfig symbol
Date: Wed, 16 Jun 2021 22:43:26 +0200
Message-Id: <20210616204328.2611406-22-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the X86_FW_OVMF Kconfig symbol for OVMF-specific code.
Move the OVMF-specific code from pc_sysfw.c to pc_sysfw_ovmf.c,
adding a pair of stubs.
Update MAINTAINERS to reach OVMF maintainers when these new
files are modified.

This fixes when building the microvm machine standalone:

  /usr/bin/ld: libqemu-i386-softmmu.fa.p/target_i386_monitor.c.o: in
  function `qmp_sev_inject_launch_secret':
  target/i386/monitor.c:749: undefined reference to `pc_system_ovmf_table_find'

Fixes: f522cef9b35 ("sev: update sev-inject-launch-secret to make gpa optional")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Note:

1/ Obviously the MAINTAINERS change is pending Laszlo Ack.

2/ Various declarations from "hw/i386/pc.h" actually belong
   to a local header in hw/i386/, such pc_system_parse_ovmf_flash().
---
 include/hw/i386/pc.h          |   1 +
 hw/i386/pc_sysfw.c            | 107 ---------------------------
 hw/i386/pc_sysfw_ovmf-stubs.c |  26 +++++++
 hw/i386/pc_sysfw_ovmf.c       | 135 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   1 +
 hw/i386/Kconfig               |   4 +
 hw/i386/meson.build           |   2 +
 7 files changed, 169 insertions(+), 107 deletions(-)
 create mode 100644 hw/i386/pc_sysfw_ovmf-stubs.c
 create mode 100644 hw/i386/pc_sysfw_ovmf.c

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 1522a3359a9..6d5699f1ee8 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -191,6 +191,7 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms);
 void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
 bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
                                int *data_len);
+void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
 
 
 /* acpi-build.c */
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 6ce37a2b052..68d6b1f783e 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -124,113 +124,6 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
     }
 }
 
-#define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
-
-static uint8_t *ovmf_table;
-static int ovmf_table_len;
-
-static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
-{
-    uint8_t *ptr;
-    QemuUUID guid;
-    int tot_len;
-
-    /* should only be called once */
-    if (ovmf_table) {
-        return;
-    }
-
-    if (flash_size < TARGET_PAGE_SIZE) {
-        return;
-    }
-
-    /*
-     * if this is OVMF there will be a table footer
-     * guid 48 bytes before the end of the flash file.  If it's
-     * not found, silently abort the flash parsing.
-     */
-    qemu_uuid_parse(OVMF_TABLE_FOOTER_GUID, &guid);
-    guid = qemu_uuid_bswap(guid); /* guids are LE */
-    ptr = flash_ptr + flash_size - 48;
-    if (!qemu_uuid_is_equal((QemuUUID *)ptr, &guid)) {
-        return;
-    }
-
-    /* if found, just before is two byte table length */
-    ptr -= sizeof(uint16_t);
-    tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) - sizeof(uint16_t);
-
-    if (tot_len <= 0) {
-        return;
-    }
-
-    ovmf_table = g_malloc(tot_len);
-    ovmf_table_len = tot_len;
-
-    /*
-     * ptr is the foot of the table, so copy it all to the newly
-     * allocated ovmf_table and then set the ovmf_table pointer
-     * to the table foot
-     */
-    memcpy(ovmf_table, ptr - tot_len, tot_len);
-    ovmf_table += tot_len;
-}
-
-bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
-                               int *data_len)
-{
-    uint8_t *ptr = ovmf_table;
-    int tot_len = ovmf_table_len;
-    QemuUUID entry_guid;
-
-    if (qemu_uuid_parse(entry, &entry_guid) < 0) {
-        return false;
-    }
-
-    if (!ptr) {
-        return false;
-    }
-
-    entry_guid = qemu_uuid_bswap(entry_guid); /* guids are LE */
-    while (tot_len >= sizeof(QemuUUID) + sizeof(uint16_t)) {
-        int len;
-        QemuUUID *guid;
-
-        /*
-         * The data structure is
-         *   arbitrary length data
-         *   2 byte length of entire entry
-         *   16 byte guid
-         */
-        guid = (QemuUUID *)(ptr - sizeof(QemuUUID));
-        len = le16_to_cpu(*(uint16_t *)(ptr - sizeof(QemuUUID) -
-                                        sizeof(uint16_t)));
-
-        /*
-         * just in case the table is corrupt, wouldn't want to spin in
-         * the zero case
-         */
-        if (len < sizeof(QemuUUID) + sizeof(uint16_t)) {
-            return false;
-        } else if (len > tot_len) {
-            return false;
-        }
-
-        ptr -= len;
-        tot_len -= len;
-        if (qemu_uuid_is_equal(guid, &entry_guid)) {
-            if (data) {
-                *data = ptr;
-            }
-            if (data_len) {
-                *data_len = len - sizeof(QemuUUID) - sizeof(uint16_t);
-            }
-            return true;
-        }
-    }
-    return false;
-}
-
 /*
  * Map the pcms->flash[] from 4GiB downward, and realize.
  * Map them in descending order, i.e. pcms->flash[0] at the top,
diff --git a/hw/i386/pc_sysfw_ovmf-stubs.c b/hw/i386/pc_sysfw_ovmf-stubs.c
new file mode 100644
index 00000000000..aabe78b2710
--- /dev/null
+++ b/hw/i386/pc_sysfw_ovmf-stubs.c
@@ -0,0 +1,26 @@
+/*
+ * QEMU PC System Firmware (OVMF stubs)
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/i386/pc.h"
+
+bool pc_system_ovmf_table_find(const char *entry, uint8_t **data, int *data_len)
+{
+    g_assert_not_reached();
+}
+
+void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
+{
+    g_assert_not_reached();
+}
diff --git a/hw/i386/pc_sysfw_ovmf.c b/hw/i386/pc_sysfw_ovmf.c
new file mode 100644
index 00000000000..85b3044c59a
--- /dev/null
+++ b/hw/i386/pc_sysfw_ovmf.c
@@ -0,0 +1,135 @@
+/*
+ * QEMU PC System Firmware (OVMF specific)
+ *
+ * Copyright (c) 2003-2004 Fabrice Bellard
+ * Copyright (c) 2011-2012 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/i386/pc.h"
+#include "cpu.h"
+
+#define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
+
+static uint8_t *ovmf_table;
+static int ovmf_table_len;
+
+void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
+{
+    uint8_t *ptr;
+    QemuUUID guid;
+    int tot_len;
+
+    /* should only be called once */
+    if (ovmf_table) {
+        return;
+    }
+
+    if (flash_size < TARGET_PAGE_SIZE) {
+        return;
+    }
+
+    /*
+     * if this is OVMF there will be a table footer
+     * guid 48 bytes before the end of the flash file.  If it's
+     * not found, silently abort the flash parsing.
+     */
+    qemu_uuid_parse(OVMF_TABLE_FOOTER_GUID, &guid);
+    guid = qemu_uuid_bswap(guid); /* guids are LE */
+    ptr = flash_ptr + flash_size - 48;
+    if (!qemu_uuid_is_equal((QemuUUID *)ptr, &guid)) {
+        return;
+    }
+
+    /* if found, just before is two byte table length */
+    ptr -= sizeof(uint16_t);
+    tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) - sizeof(uint16_t);
+
+    if (tot_len <= 0) {
+        return;
+    }
+
+    ovmf_table = g_malloc(tot_len);
+    ovmf_table_len = tot_len;
+
+    /*
+     * ptr is the foot of the table, so copy it all to the newly
+     * allocated ovmf_table and then set the ovmf_table pointer
+     * to the table foot
+     */
+    memcpy(ovmf_table, ptr - tot_len, tot_len);
+    ovmf_table += tot_len;
+}
+
+bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
+                               int *data_len)
+{
+    uint8_t *ptr = ovmf_table;
+    int tot_len = ovmf_table_len;
+    QemuUUID entry_guid;
+
+    if (qemu_uuid_parse(entry, &entry_guid) < 0) {
+        return false;
+    }
+
+    if (!ptr) {
+        return false;
+    }
+
+    entry_guid = qemu_uuid_bswap(entry_guid); /* guids are LE */
+    while (tot_len >= sizeof(QemuUUID) + sizeof(uint16_t)) {
+        int len;
+        QemuUUID *guid;
+
+        /*
+         * The data structure is
+         *   arbitrary length data
+         *   2 byte length of entire entry
+         *   16 byte guid
+         */
+        guid = (QemuUUID *)(ptr - sizeof(QemuUUID));
+        len = le16_to_cpu(*(uint16_t *)(ptr - sizeof(QemuUUID) -
+                                        sizeof(uint16_t)));
+
+        /*
+         * just in case the table is corrupt, wouldn't want to spin in
+         * the zero case
+         */
+        if (len < sizeof(QemuUUID) + sizeof(uint16_t)) {
+            return false;
+        } else if (len > tot_len) {
+            return false;
+        }
+
+        ptr -= len;
+        tot_len -= len;
+        if (qemu_uuid_is_equal(guid, &entry_guid)) {
+            if (data) {
+                *data = ptr;
+            }
+            if (data_len) {
+                *data_len = len - sizeof(QemuUUID) - sizeof(uint16_t);
+            }
+            return true;
+        }
+    }
+    return false;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index fbfaaa54721..0856a10e83a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2900,6 +2900,7 @@ EDK2 Firmware
 M: Laszlo Ersek <lersek@redhat.com>
 M: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Supported
+F: hw/i386/*ovmf*
 F: pc-bios/descriptors/??-edk2-*.json
 F: pc-bios/edk2-*
 F: roms/Makefile.edk2
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 66838fa397b..722f70eaeb8 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -1,5 +1,9 @@
+config X86_FW_OVMF
+    bool
+
 config SEV
     bool
+    select X86_FW_OVMF
     depends on KVM
 
 config PC
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index f95ed7d4efe..ca81875aa3d 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -24,6 +24,8 @@
   'pc_sysfw.c',
   'acpi-pc.c',
   'port92.c'))
+i386_ss.add(when: 'CONFIG_X86_FW_OVMF', if_true: files('pc_sysfw_ovmf.c'),
+                                        if_false: files('pc_sysfw_ovmf-stubs.c'))
 
 subdir('kvm')
 subdir('xen')
-- 
2.31.1


