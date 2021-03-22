Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AA93452E1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:14:41 +0100 (CET)
Received: from localhost ([::1]:60086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTku-0004B8-Lj
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTXQ-0007HW-BQ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTXL-0001Lb-CI
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616454038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=943xaER/uZ2yx+0NU3LkWfKz9OTuumEUfbOODT+zbzU=;
 b=PchqOeZ81qNJnmuQA/726IBhdmqqGrD3peFXesUkidRKXlXcCX0jfQR7uIGAGAU+60N+Vq
 BYr/BXmgKhTIS8kN6LfgN/xcCsO0hUc2/SMQhDm0VyecSZcmuTThaUPt0QH26qo5c/BeV4
 NkU/vDER82Ai5KG9tcYXI1yxrsVILEA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-lDYxRaddMhir6D15nKebDQ-1; Mon, 22 Mar 2021 19:00:36 -0400
X-MC-Unique: lDYxRaddMhir6D15nKebDQ-1
Received: by mail-wr1-f71.google.com with SMTP id s10so161884wre.0
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 16:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=943xaER/uZ2yx+0NU3LkWfKz9OTuumEUfbOODT+zbzU=;
 b=T4ZOXmCoyrMOYn8oS75jH6Ffmi0Cw+/j0kCSb+AMMcr6XpyWTtGgRm1p58nnnS4fn2
 5Pexhwgj9Sa3gFnzkpC9ZsikFn/D6jX27iJMRgjY1H/h9M9esp59DNf/x9h40QVlKhZV
 Fj9mRCdIFgb4xTnKilREYszp7JIeZutWdXCpLJyLeLziPg3C2dQIXzzzH1AR/7yaRVB5
 W83oFzq7dCe+LzBMp3JSrruGLfm0BEaanEG4EQMTcmrUHSWhgXFaV0vb+UqQKhpzfupv
 /HtUkiAlQMD0cxH6K2EUHU8zACo9IKZS3VXjlmNly1ekfidm+3ZhwJqnQ0klcKmdvh92
 nkug==
X-Gm-Message-State: AOAM530USCjr2bNuXnOrgESGVOrOoKWKsz/IcDBFGpa+527CLkTE4G2L
 6Egtc6vbqkmufpsy2dosnoHdgkjJlY7swpm/LWy5I7R1aUBwgOVOXESvYt3Ug7AtrpGFigcH2CK
 K/94BD/QlVOlplsCJ7wBpQu23F/90V/RG4iP3i8tsTMe9GYDj9hIXM/0RemCv
X-Received: by 2002:adf:fa4e:: with SMTP id y14mr849634wrr.170.1616454035228; 
 Mon, 22 Mar 2021 16:00:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRz5qnsKBRjkXP9y9tK5HyLWXJWUPnqUWG5JqSGmi/yjTQZQjwqX3tp7/dzyR2KbRgIUqSwA==
X-Received: by 2002:adf:fa4e:: with SMTP id y14mr849612wrr.170.1616454034999; 
 Mon, 22 Mar 2021 16:00:34 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id w6sm20891865wrl.49.2021.03.22.16.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 16:00:34 -0700 (PDT)
Date: Mon, 22 Mar 2021 19:00:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 17/19] acpi: Move maximum size logic into acpi_add_rom_blob()
Message-ID: <20210322225907.541943-18-mst@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322225907.541943-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Message-Id: <20210304105554.121674-4-david@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/aml-build.h |  4 ----
 include/hw/acpi/utils.h     |  3 +--
 hw/acpi/utils.c             | 12 ++++++++++--
 hw/arm/virt-acpi-build.c    | 13 ++++++-------
 hw/i386/acpi-build.c        |  8 +++-----
 hw/i386/acpi-microvm.c      | 16 ++++++----------
 6 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index ca781f3531..471266d739 100644
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
index dc56006353..3aeae15e57 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2628,14 +2628,12 @@ void acpi_setup(void)
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
@@ -2674,7 +2672,7 @@ void acpi_setup(void)
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
-- 
MST


