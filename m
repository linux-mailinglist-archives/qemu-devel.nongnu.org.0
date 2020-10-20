Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8797A293D43
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 15:24:28 +0200 (CEST)
Received: from localhost ([::1]:44450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUrcp-00035O-JU
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 09:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU7-0000JO-JK; Tue, 20 Oct 2020 09:15:27 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5270 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU0-00077V-Mi; Tue, 20 Oct 2020 09:15:27 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6172187ABAA52492808B;
 Tue, 20 Oct 2020 21:15:13 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 21:15:05 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 12/13] hw/acpi/aml-build: build ACPI CPU cache
 hierarchy information
Date: Tue, 20 Oct 2020 21:14:39 +0800
Message-ID: <20201020131440.1090-13-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201020131440.1090-1-fangying1@huawei.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 09:15:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To build cache information, An AcpiCacheInfo structure is defined to
hold the Type 1 cache structure according to ACPI spec v6.3 5.2.29.2.
A helper function build_cache_hierarchy is introduced to encode the
cache information.

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/acpi/aml-build.c         | 26 ++++++++++++++++++++++++++
 include/hw/acpi/acpi-defs.h |  8 ++++++++
 include/hw/acpi/aml-build.h |  3 +++
 3 files changed, 37 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index da3b41b514..6f0e8df49b 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1770,6 +1770,32 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms)
                  table_data->len - slit_start, 1, NULL, NULL);
 }
 
+/* ACPI 6.3: 5.29.2 Cache type structure (Type 1) */
+static void build_cache_head(GArray *tbl, uint32_t next_level)
+{
+    build_append_byte(tbl, 1);
+    build_append_byte(tbl, 24);
+    build_append_int_noprefix(tbl, 0, 2);
+    build_append_int_noprefix(tbl, 0x7f, 4);
+    build_append_int_noprefix(tbl, next_level, 4);
+}
+
+static void build_cache_tail(GArray *tbl, AcpiCacheInfo *cache_info)
+{
+    build_append_int_noprefix(tbl, cache_info->size, 4);
+    build_append_int_noprefix(tbl, cache_info->sets, 4);
+    build_append_byte(tbl, cache_info->associativity);
+    build_append_byte(tbl, cache_info->attributes);
+    build_append_int_noprefix(tbl, cache_info->line_size, 2);
+}
+
+void build_cache_hierarchy(GArray *tbl,
+              uint32_t next_level, AcpiCacheInfo *cache_info)
+{
+    build_cache_head(tbl, next_level);
+    build_cache_tail(tbl, cache_info);
+}
+
 /*
  * ACPI 6.3: 5.2.29.1 Processor hierarchy node structure (Type 0)
  */
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 38a42f409a..3df38ab449 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -618,4 +618,12 @@ struct AcpiIortRC {
 } QEMU_PACKED;
 typedef struct AcpiIortRC AcpiIortRC;
 
+typedef struct AcpiCacheInfo {
+    uint32_t size;
+    uint32_t sets;
+    uint8_t  associativity;
+    uint8_t  attributes;
+    uint16_t line_size;
+} AcpiCacheInfo;
+
 #endif
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 56474835a7..01078753a8 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -437,6 +437,9 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
 
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms);
 
+void build_cache_hierarchy(GArray *tbl,
+              uint32_t next_level, AcpiCacheInfo *cache_info);
+
 void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
 
 void build_processor_hierarchy(GArray *tbl, uint32_t flags,
-- 
2.23.0


