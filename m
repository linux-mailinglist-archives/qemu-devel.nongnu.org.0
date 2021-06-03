Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C9139A810
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:15:00 +0200 (CEST)
Received: from localhost ([::1]:42616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqvq-00058x-VE
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqu2-0002Ch-EL
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:13:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqu0-0005R6-Sz
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:13:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id h8so6582306wrz.8
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HOYJkr4GhaglKvXMUgqS2H3+raKjJM8WQVTi0Xzd4rQ=;
 b=LToVOLFrdHQZznBHEf4jArdvlaVTud5D7fUeyUiAArgUPkPwMu2aPC0GWvzL92cviu
 2FAftuB5vgctSfnJ2VdRM/f2U4nWR54+Vghy8CKbW4PH2gjbIk9QOT7WJeGxewICWu3J
 EN6wac2U1UT2IK85VkCHpnBsY1nRw+ytxNMBCjWKshJwvOXcd8MC3RWU2aV0jmlPqnmu
 Mjk45tfsmtWrlB5gatgjZ7Ek7AQp7Kn+9FRz1WwldERSDIN6zrfntYD/fZhFMCP6TbGQ
 gnCmYFQrDhpWNZh9cdoCgkpDjUr/O5JQpMc9W6GUlRfYHLBeXt2G+pLnM7qUNDMjGW1X
 f1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOYJkr4GhaglKvXMUgqS2H3+raKjJM8WQVTi0Xzd4rQ=;
 b=S1mLnRrnTNAFiTUm43jl5KlovD8vBeO2ofOuEuYipZYLuw2doyuSl+MDWyCbuQd0yw
 P+TfJ6a79nKp+MA+3ZJGz+MaNJMlt3kGd2LGFeTSu9VX+v6yrNryAmt1iz5q48It1J3j
 f4vBH40AoyTMkp7zlrvANyEAzxc/J5786iBGypHAof6EnCbg2EU4WVzNdaUYGrOudaJp
 3XbMW86h9tHREc+oKbCZ5ORTAsGEO9wUNwNN/srze2zHDRaZOtKOcOnVnG0X91MA61TQ
 I2IHeJbhm7FVD1ZUd0UAAmv9BksgvTRLIAUjEuMOlKwYog5DJ+1hdcFTjqpsAeU7opq5
 c8sg==
X-Gm-Message-State: AOAM531YFkqgs0VBBzpEXGg16Rm4GEWhRzX49+BhVDACfweKfPzJJw0P
 HJk2X+MsNehCIj2KS4gjoWCen0vFjxo/mARn
X-Google-Smtp-Source: ABdhPJzTIDwMYN0X4ZJNpE9nx9tB15/DeCB1JADqBVt8FXO7pd8kHjLAh+LB46nR2lgDqDINZWm/Rg==
X-Received: by 2002:a5d:5251:: with SMTP id k17mr24285wrc.153.1622740383129;
 Thu, 03 Jun 2021 10:13:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m5sm6190319wmq.6.2021.06.03.10.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 10:13:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/acpi: Provide function acpi_ghes_present()
Date: Thu,  3 Jun 2021 18:12:58 +0100
Message-Id: <20210603171259.27962-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603171259.27962-1-peter.maydell@linaro.org>
References: <20210603171259.27962-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow code elsewhere in the system to check whether the ACPI GHES
table is present, so it can determine whether it is OK to try to
record an error by calling acpi_ghes_record_errors().

(We don't need to migrate the new 'present' field in AcpiGhesState,
because it is set once at system initialization and doesn't change.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


