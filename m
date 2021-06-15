Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F27E3A8609
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:04:52 +0200 (CEST)
Received: from localhost ([::1]:41448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBYZ-0002T6-3E
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFD-0006OC-S0
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:51 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEh-0000y6-Vs
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id i94so18825167wri.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mBhVixobv9evawUK2zvyZAJjFLCIliw3J90zk8FNS6M=;
 b=Ytl6PqvZFuG4eCCcKPL7zweCPxKeDN54WUrgZrIAipFt/X2nmp/mXtLGGkL8nX6Ndg
 S2kP7//1GWevXRqjqc4/vQFYiwpoP5exNoJP79ACfb7qLhuAchGlfD4r2+NK1TFXGrAn
 L79Asnk9IYtV6pwUF1L3Mo6Tm+Ndy6czNENrHfhz2LKF1ggPQHrDU2acxscLs06OOA+2
 fh1Uk/6a8rcW3wtUJoBSI4UQ+Ki3/FdjQeEvLaitbtF0ZYnCaCvu7BVOEvj9RY/N+vRj
 cDozlvXX0gamG3s6dEVZKRliUdD6uzMFrKu/XZGgBthd7m0mqqz35cWGRwhvmWgtbRSH
 TGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mBhVixobv9evawUK2zvyZAJjFLCIliw3J90zk8FNS6M=;
 b=Nwfi47XwLL5WRyNuGmbm6noebSDUN+z3zyFY1moAMlO/sNIxzb/1jLq1Qur0AMGVZY
 WxC8STu71JDntUJIN3RTQGosw8mujlDoKmzAsal5iRijDQ6ngbVFvdCEudQvuK/HZ5AQ
 GUGVzI3RjvCEb4i2+d/tBJ5rJ2vD7NJfG9gyp6kBMazyW+G39jfNuoXQcD6mM6+avLn2
 FyEazlc/NTMVu4VERwVmY722aS9GMPq1/6RwZ6DEyYPBZe7cuZ7NPdiKwvPWusuPQ5xX
 kiNitTCPuhSZoNdbjUMScNrGuVaWYdty8ys06WbzCwXsWA9/5UOcMXKvHE69TuvO0z0z
 2yTw==
X-Gm-Message-State: AOAM530iNv5BuSPbcT07qEuLNJH+o9kDSDYBJ8DVlimIvKXjDSokLOl7
 DJSyL7U4Qh3wQKjuC87/MtBVwVYgrTON4Q==
X-Google-Smtp-Source: ABdhPJzNT8utgfpfDdfvxwZ8Nvpt85j7miECx9lNEh52pxj7KHxxutR+OzrPGCf46hQYIfHJdgdDVg==
X-Received: by 2002:adf:e0c7:: with SMTP id m7mr27092891wri.409.1623771855489; 
 Tue, 15 Jun 2021 08:44:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/28] hw/acpi: Provide function acpi_ghes_present()
Date: Tue, 15 Jun 2021 16:43:47 +0100
Message-Id: <20210615154405.21399-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow code elsewhere in the system to check whether the ACPI GHES
table is present, so it can determine whether it is OK to try to
record an error by calling acpi_ghes_record_errors().

(We don't need to migrate the new 'present' field in AcpiGhesState,
because it is set once at system initialization and doesn't change.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Message-id: 20210603171259.27962-3-peter.maydell@linaro.org
---
 include/hw/acpi/ghes.h |  9 +++++++++
 hw/acpi/ghes-stub.c    |  5 +++++
 hw/acpi/ghes.c         | 17 +++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 2ae8bc1ded3..674f6958e90 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -64,6 +64,7 @@ enum {
 
 typedef struct AcpiGhesState {
     uint64_t ghes_addr_le;
+    bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
 
 void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
@@ -72,4 +73,12 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
 int acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
+
+/**
+ * acpi_ghes_present: Report whether ACPI GHES table is present
+ *
+ * Returns: true if the system has an ACPI GHES table and it is
+ * safe to call acpi_ghes_record_errors() to record a memory error.
+ */
+bool acpi_ghes_present(void);
 #endif
diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
index 9faba043b85..c315de1802d 100644
--- a/hw/acpi/ghes-stub.c
+++ b/hw/acpi/ghes-stub.c
@@ -15,3 +15,8 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
 {
     return -1;
 }
+
+bool acpi_ghes_present(void)
+{
+    return false;
+}
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a4dac6bf15e..a749b84d624 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -386,6 +386,8 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     /* Create a read-write fw_cfg file for Address */
     fw_cfg_add_file_callback(s, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
+
+    ags->present = true;
 }
 
 int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
@@ -443,3 +445,18 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
 
     return ret;
 }
+
+bool acpi_ghes_present(void)
+{
+    AcpiGedState *acpi_ged_state;
+    AcpiGhesState *ags;
+
+    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
+                                                       NULL));
+
+    if (!acpi_ged_state) {
+        return false;
+    }
+    ags = &acpi_ged_state->ghes_state;
+    return ags->present;
+}
-- 
2.20.1


