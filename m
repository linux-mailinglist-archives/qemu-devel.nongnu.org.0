Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69B448DC4A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:57:59 +0100 (CET)
Received: from localhost ([::1]:57954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83QE-0002tY-2p
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:57:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n83OL-00018z-7Y
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:56:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n83OJ-0004ql-IF
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642092959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZJUlFJvRX6jpStWZ6PETkltlCjxA0ZDCMDyoCDMqqs=;
 b=VZy26rAkF2rigX/tmW//IK9ODLQH45wtc+356YsrRDaEqf3U14wbt0UJAf+TNyjE+yHCrU
 JVs+W7zNhgrOprRseyx1hyelf4CmecKYVLvPcillUYS4cTruSoZSADMvVVNwgr0Itu7dJC
 pesiiBqP43IAg7MyzP2OO04kzFIcdeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-JJMeTRw5OjCP2c2k2QYP4g-1; Thu, 13 Jan 2022 11:55:55 -0500
X-MC-Unique: JJMeTRw5OjCP2c2k2QYP4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 619901083F61;
 Thu, 13 Jan 2022 16:55:54 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.37.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CED6578AFE;
 Thu, 13 Jan 2022 16:55:32 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/i386: refactor logic for setting up SEV firmware
Date: Thu, 13 Jan 2022 16:55:10 +0000
Message-Id: <20220113165511.46098-2-berrange@redhat.com>
In-Reply-To: <20220113165511.46098-1-berrange@redhat.com>
References: <20220113165511.46098-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently this logic is only run in the pflash codepath
but we want to run it in other scenarios too.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/pc_sysfw.c            | 24 +++---------------------
 hw/i386/pc_sysfw_ovmf-stubs.c | 10 ++++++++++
 hw/i386/pc_sysfw_ovmf.c       | 27 +++++++++++++++++++++++++++
 include/hw/i386/pc.h          |  1 +
 4 files changed, 41 insertions(+), 21 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index c8b17af953..b056526077 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -146,9 +146,6 @@ static void pc_system_flash_map(PCMachineState *pcms,
     int64_t size;
     PFlashCFI01 *system_flash;
     MemoryRegion *flash_mem;
-    void *flash_ptr;
-    int flash_size;
-    int ret;
 
     assert(PC_MACHINE_GET_CLASS(pcms)->pci_enabled);
 
@@ -192,24 +189,9 @@ static void pc_system_flash_map(PCMachineState *pcms,
             flash_mem = pflash_cfi01_get_memory(system_flash);
             pc_isa_bios_init(rom_memory, flash_mem, size);
 
-            /* Encrypt the pflash boot ROM */
-            if (sev_enabled()) {
-                flash_ptr = memory_region_get_ram_ptr(flash_mem);
-                flash_size = memory_region_size(flash_mem);
-                /*
-                 * OVMF places a GUIDed structures in the flash, so
-                 * search for them
-                 */
-                pc_system_parse_ovmf_flash(flash_ptr, flash_size);
-
-                ret = sev_es_save_reset_vector(flash_ptr, flash_size);
-                if (ret) {
-                    error_report("failed to locate and/or save reset vector");
-                    exit(1);
-                }
-
-                sev_encrypt_flash(flash_ptr, flash_size, &error_fatal);
-            }
+            pc_system_ovmf_initialize_sev(
+                memory_region_get_ram_ptr(flash_mem),
+                memory_region_size(flash_mem));
         }
     }
 }
diff --git a/hw/i386/pc_sysfw_ovmf-stubs.c b/hw/i386/pc_sysfw_ovmf-stubs.c
index aabe78b271..d88970af88 100644
--- a/hw/i386/pc_sysfw_ovmf-stubs.c
+++ b/hw/i386/pc_sysfw_ovmf-stubs.c
@@ -14,6 +14,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/i386/pc.h"
+#include "sev.h"
 
 bool pc_system_ovmf_table_find(const char *entry, uint8_t **data, int *data_len)
 {
@@ -24,3 +25,12 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
 {
     g_assert_not_reached();
 }
+
+void pc_system_ovmf_initialize_sev(void *ptr, size_t size)
+{
+    if (!sev_enabled()) {
+        return;
+    }
+
+    g_assert_not_reached();
+}
diff --git a/hw/i386/pc_sysfw_ovmf.c b/hw/i386/pc_sysfw_ovmf.c
index f4dd92c588..180500a035 100644
--- a/hw/i386/pc_sysfw_ovmf.c
+++ b/hw/i386/pc_sysfw_ovmf.c
@@ -24,8 +24,10 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/i386/pc.h"
 #include "cpu.h"
+#include "sev.h"
 
 #define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
 
@@ -149,3 +151,28 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
     }
     return false;
 }
+
+
+void pc_system_ovmf_initialize_sev(void *ptr, size_t size)
+{
+    int ret;
+
+    /* Encrypt the boot ROM */
+    if (!sev_enabled()) {
+        return;
+    }
+
+    /*
+     * OVMF places a GUIDed structures in the flash, so
+     * search for them
+     */
+    pc_system_parse_ovmf_flash(ptr, size);
+
+    ret = sev_es_save_reset_vector(ptr, size);
+    if (ret) {
+        error_report("failed to locate and/or save reset vector");
+        exit(1);
+    }
+
+    sev_encrypt_flash(ptr, size, &error_fatal);
+}
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 9c9f4ac748..47f5bc82ba 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -191,6 +191,7 @@ void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
 bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
                                int *data_len);
 void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
+void pc_system_ovmf_initialize_sev(void *ptr, size_t size);
 
 /* hw/i386/acpi-common.c */
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
-- 
2.33.1


