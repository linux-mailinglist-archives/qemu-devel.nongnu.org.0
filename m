Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498F41C7CE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 13:29:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQVcx-0003OU-C6
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 07:29:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1hQVVZ-00061J-69
	for qemu-devel@nongnu.org; Tue, 14 May 2019 07:22:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1hQVVY-0002EB-5n
	for qemu-devel@nongnu.org; Tue, 14 May 2019 07:22:09 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2215 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1hQVVU-00024X-Eh; Tue, 14 May 2019 07:22:04 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 6B7BAB2814CF99DB80C7;
	Tue, 14 May 2019 19:22:00 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.439.0; Tue, 14 May 2019 19:21:53 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
	<shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
	<lersek@redhat.com>, 
	<james.morse@arm.com>, <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, 
	<rth@twiddle.net>, <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
	<jonathan.cameron@huawei.com>, <xuwei5@huawei.com>, <kvm@vger.kernel.org>, 
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Date: Tue, 14 May 2019 04:18:18 -0700
Message-ID: <1557832703-42620-6-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [PATCH v17 05/10] acpi: add
 build_append_ghes_generic_status() helper for Generic Error Status Block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It will help to add Generic Error Status Block to ACPI tables
without using packed C structures and avoid endianness
issues as API doesn't need explicit conversion.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 hw/acpi/aml-build.c         | 14 ++++++++++++++
 include/hw/acpi/aml-build.h |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 102a288..ce90970 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -296,6 +296,20 @@ void build_append_ghes_notify(GArray *table, const uint8_t type,
         build_append_int_noprefix(table, error_threshold_window, 4);
 }
 
+/* Generic Error Status Block
+ * ACPI 4.0: 17.3.2.6.1 Generic Error Data
+ */
+void build_append_ghes_generic_status(GArray *table, uint32_t block_status,
+                      uint32_t raw_data_offset, uint32_t raw_data_length,
+                      uint32_t data_length, uint32_t error_severity)
+{
+    build_append_int_noprefix(table, block_status, 4);
+    build_append_int_noprefix(table, raw_data_offset, 4);
+    build_append_int_noprefix(table, raw_data_length, 4);
+    build_append_int_noprefix(table, data_length, 4);
+    build_append_int_noprefix(table, error_severity, 4);
+}
+
 /* Generic Error Data Entry
  * ACPI 4.0: 17.3.2.6.1 Generic Error Data
  */
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index a71db2f..1ec7e1b 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -425,6 +425,12 @@ void build_append_ghes_generic_data(GArray *table, const char *section_type,
                                     uint32_t error_data_length, uint8_t *fru_id,
                                     uint8_t *fru_text, uint64_t time_stamp);
 
+void
+build_append_ghes_generic_status(GArray *table, uint32_t block_status,
+                                 uint32_t raw_data_offset,
+                                 uint32_t raw_data_length,
+                                 uint32_t data_length, uint32_t error_severity);
+
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
-- 
1.8.3.1


