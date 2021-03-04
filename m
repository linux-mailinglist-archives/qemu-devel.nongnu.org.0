Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E2132D143
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:58:32 +0100 (CET)
Received: from localhost ([::1]:43146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlgd-0002rs-UH
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleU-00011u-8B
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:56:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleR-000327-7f
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614855374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UFzWH8GPof9g+UzUl8SxeZWKO9+fPaRYFQwEpobjxsQ=;
 b=JTyyf7Yd+3TGsD75T8v726nsGL6nwB4QDlh8a2kGGPvxxSrhU5y7c/a/Q292RJLOxaoI+6
 BXMnxeodrjGo2Xjtme5+pdTW33NGxjjI3vxKQyp/afFyikgem37QuPUoLoG21ZGku7KmaO
 jQ0kAtesa3MrtB/4Ae/SiP89Rx+eWl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-AqZLPXDvNhe979X73FM2FA-1; Thu, 04 Mar 2021 05:56:12 -0500
X-MC-Unique: AqZLPXDvNhe979X73FM2FA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 573A91932480;
 Thu,  4 Mar 2021 10:56:11 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05C536268E;
 Thu,  4 Mar 2021 10:56:08 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] acpi: Move maximum size logic into acpi_add_rom_blob()
Date: Thu,  4 Mar 2021 11:55:53 +0100
Message-Id: <20210304105554.121674-4-david@redhat.com>
In-Reply-To: <20210304105554.121674-1-david@redhat.com>
References: <20210304105554.121674-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to have safety margins for all tables based on the table type.
Let's move the maximum size logic into acpi_add_rom_blob() and make it
dependent on the table name, so we don't have to replicate for each and
every instance that creates such tables.

Suggested-by: Laszlo Ersek <lersek@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/acpi/utils.c             | 12 ++++++++++--
 hw/arm/virt-acpi-build.c    | 13 ++++++-------
 hw/i386/acpi-build.c        |  8 +++-----
 hw/i386/acpi-microvm.c      | 16 ++++++----------
 include/hw/acpi/aml-build.h |  4 ----
 include/hw/acpi/utils.h     |  3 +--
 6 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
index a134a4d554..f2d69a6d92 100644
--- a/hw/acpi/utils.c
+++ b/hw/acpi/utils.c
@@ -27,9 +27,17 @@
 #include "hw/loader.h"
 
 MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
-                                GArray *blob, const char *name,
-                                uint64_t max_size)
+                                GArray *blob, const char *name)
 {
+    uint64_t max_size = 0;
+
+    /* Reserve RAM space for tables: add another order of magnitude. */
+    if (!strcmp(name, ACPI_BUILD_TABLE_FILE)) {
+        max_size = 0x200000;
+    } else if (!strcmp(name, ACPI_BUILD_LOADER_FILE)) {
+        max_size = 0x10000;
+    }
+
     return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
                         name, update, opaque, NULL, true);
 }
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index a91550de6f..f5a2b2d4cb 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -859,14 +859,13 @@ void virt_acpi_setup(VirtMachineState *vms)
     /* Now expose it all to Guest */
     build_state->table_mr = acpi_add_rom_blob(virt_acpi_build_update,
                                               build_state, tables.table_data,
-                                              ACPI_BUILD_TABLE_FILE,
-                                              ACPI_BUILD_TABLE_MAX_SIZE);
+                                              ACPI_BUILD_TABLE_FILE);
     assert(build_state->table_mr != NULL);
 
-    build_state->linker_mr =
-        acpi_add_rom_blob(virt_acpi_build_update, build_state,
-                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,
-                          ACPI_BUILD_LOADER_MAX_SIZE);
+    build_state->linker_mr = acpi_add_rom_blob(virt_acpi_build_update,
+                                               build_state,
+                                               tables.linker->cmd_blob,
+                                               ACPI_BUILD_LOADER_FILE);
 
     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
                     acpi_data_len(tables.tcpalog));
@@ -880,7 +879,7 @@ void virt_acpi_setup(VirtMachineState *vms)
 
     build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
                                              build_state, tables.rsdp,
-                                             ACPI_BUILD_RSDP_FILE, 0);
+                                             ACPI_BUILD_RSDP_FILE);
 
     qemu_register_reset(virt_acpi_build_reset, build_state);
     virt_acpi_build_reset(build_state);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a75138ea5a..8de7722cfd 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2518,14 +2518,12 @@ void acpi_setup(void)
     /* Now expose it all to Guest */
     build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
                                               build_state, tables.table_data,
-                                              ACPI_BUILD_TABLE_FILE,
-                                              ACPI_BUILD_TABLE_MAX_SIZE);
+                                              ACPI_BUILD_TABLE_FILE);
     assert(build_state->table_mr != NULL);
 
     build_state->linker_mr =
         acpi_add_rom_blob(acpi_build_update, build_state,
-                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,
-                          ACPI_BUILD_LOADER_MAX_SIZE);
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE);
 
     fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
@@ -2564,7 +2562,7 @@ void acpi_setup(void)
         build_state->rsdp = NULL;
         build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
                                                  build_state, tables.rsdp,
-                                                 ACPI_BUILD_RSDP_FILE, 0);
+                                                 ACPI_BUILD_RSDP_FILE);
     }
 
     qemu_register_reset(acpi_build_reset, build_state);
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 502aac0ba2..271710eb92 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -249,16 +249,12 @@ void acpi_setup_microvm(MicrovmMachineState *mms)
     acpi_build_microvm(&tables, mms);
 
     /* Now expose it all to Guest */
-    acpi_add_rom_blob(acpi_build_no_update, NULL,
-                      tables.table_data,
-                      ACPI_BUILD_TABLE_FILE,
-                      ACPI_BUILD_TABLE_MAX_SIZE);
-    acpi_add_rom_blob(acpi_build_no_update, NULL,
-                      tables.linker->cmd_blob,
-                      ACPI_BUILD_LOADER_FILE, ACPI_BUILD_LOADER_MAX_SIZE);
-    acpi_add_rom_blob(acpi_build_no_update, NULL,
-                      tables.rsdp,
-                      ACPI_BUILD_RSDP_FILE, 0);
+    acpi_add_rom_blob(acpi_build_no_update, NULL, tables.table_data,
+                      ACPI_BUILD_TABLE_FILE);
+    acpi_add_rom_blob(acpi_build_no_update, NULL, tables.linker->cmd_blob,
+                      ACPI_BUILD_LOADER_FILE);
+    acpi_add_rom_blob(acpi_build_no_update, NULL, tables.rsdp,
+                      ACPI_BUILD_RSDP_FILE);
 
     acpi_build_tables_cleanup(&tables, false);
 }
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index a22c6a4c86..15b069186d 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -4,10 +4,6 @@
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/bios-linker-loader.h"
 
-/* Reserve RAM space for tables: add another order of magnitude. */
-#define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
-#define ACPI_BUILD_LOADER_MAX_SIZE        0x10000
-
 #define ACPI_BUILD_APPNAME6 "BOCHS "
 #define ACPI_BUILD_APPNAME8 "BXPC    "
 
diff --git a/include/hw/acpi/utils.h b/include/hw/acpi/utils.h
index 140b4de603..0022df027d 100644
--- a/include/hw/acpi/utils.h
+++ b/include/hw/acpi/utils.h
@@ -4,6 +4,5 @@
 #include "hw/nvram/fw_cfg.h"
 
 MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
-                                GArray *blob, const char *name,
-                                uint64_t max_size);
+                                GArray *blob, const char *name);
 #endif
-- 
2.29.2


