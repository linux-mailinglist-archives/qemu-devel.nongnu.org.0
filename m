Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D8853667E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:19:14 +0200 (CEST)
Received: from localhost ([::1]:44250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudcG-0003Fa-P9
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1nudH7-0006WO-Qi
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1nudH5-00071l-U8
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653670639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7onua6PzehfY7FGKwH5skED1dMOpn6M44VxgVUDqgRo=;
 b=NuxX+fZ/vCW3YYRZ0hc5jbVbtYtGKigKsGDB4A3vl4Th46EIko4LcjMZOhbfHa/wkkXQZy
 ammurfIN7OPCyCFONeda69vNsLOdRO/ZLswRLkhh+Kqr8NNlvEBKv6WMzjf+AVz5HS5LV/
 WDgeCaDvWmoC0npPtjk8nXT/V6aZvk0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-yy_hasfCOtKpQGFznQ0lMA-1; Fri, 27 May 2022 12:57:15 -0400
X-MC-Unique: yy_hasfCOtKpQGFznQ0lMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76A3D80B71A;
 Fri, 27 May 2022 16:57:15 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A6BE2026D64;
 Fri, 27 May 2022 16:57:14 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH 2/5] bios-tables-test: teach test to use smbios 3.0 tables
Date: Fri, 27 May 2022 18:56:48 +0200
Message-Id: <20220527165651.28092-3-jusual@redhat.com>
In-Reply-To: <20220527165651.28092-1-jusual@redhat.com>
References: <20220527165651.28092-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the 64-bit entry point. Since we no longer have a total
number of structures, stop checking for the new ones at the EOF
structure (type 127).

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 tests/qtest/bios-tables-test.c | 101 ++++++++++++++++++++++++---------
 1 file changed, 75 insertions(+), 26 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index a4a46e97f0..0ba9d749a5 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -75,6 +75,14 @@
 #define OEM_TEST_ARGS      "-machine x-oem-id=" OEM_ID ",x-oem-table-id=" \
                            OEM_TABLE_ID
 
+#define SMBIOS_VER21 0
+#define SMBIOS_VER30 1
+
+typedef struct {
+    struct smbios_21_entry_point ep21;
+    struct smbios_30_entry_point ep30;
+} smbios_entry_point;
+
 typedef struct {
     bool tcg_only;
     const char *machine;
@@ -88,8 +96,8 @@ typedef struct {
     uint64_t rsdp_addr;
     uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
     GArray *tables;
-    uint32_t smbios_ep_addr;
-    struct smbios_21_entry_point smbios_ep_table;
+    uint64_t smbios_ep_addr[2];
+    smbios_entry_point smbios_ep_table;
     uint16_t smbios_cpu_max_speed;
     uint16_t smbios_cpu_curr_speed;
     uint8_t *required_struct_types;
@@ -533,10 +541,10 @@ static void test_acpi_asl(test_data *data)
     free_test_data(&exp_data);
 }
 
-static bool smbios_ep_table_ok(test_data *data)
+static bool smbios_ep2_table_ok(test_data *data)
 {
-    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table;
-    uint32_t addr = data->smbios_ep_addr;
+    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table.ep21;
+    uint32_t addr = data->smbios_ep_addr[SMBIOS_VER21];
 
     qtest_memread(data->qts, addr, ep_table, sizeof(*ep_table));
     if (memcmp(ep_table->anchor_string, "_SM_", 4)) {
@@ -559,29 +567,59 @@ static bool smbios_ep_table_ok(test_data *data)
     return true;
 }
 
-static void test_smbios_entry_point(test_data *data)
+static bool smbios_ep3_table_ok(test_data *data)
+{
+    struct smbios_30_entry_point *ep_table = &data->smbios_ep_table.ep30;
+    uint64_t addr = data->smbios_ep_addr[SMBIOS_VER30];
+
+    qtest_memread(data->qts, addr, ep_table, sizeof(*ep_table));
+    if (memcmp(ep_table->anchor_string, "_SM3_", 5)) {
+        return false;
+    }
+
+    if (acpi_calc_checksum((uint8_t *)ep_table, sizeof *ep_table)) {
+        return false;
+    }
+
+    return true;
+}
+
+static int test_smbios_entry_point(test_data *data)
 {
     uint32_t off;
+    bool found_ep2 = false, found_ep3 = false;
 
     /* find smbios entry point structure */
     for (off = 0xf0000; off < 0x100000; off += 0x10) {
-        uint8_t sig[] = "_SM_";
+        uint8_t sig[] = "_SM3_";
         int i;
 
         for (i = 0; i < sizeof sig - 1; ++i) {
             sig[i] = qtest_readb(data->qts, off + i);
         }
 
-        if (!memcmp(sig, "_SM_", sizeof sig)) {
+        if (!found_ep2 && !memcmp(sig, "_SM_", sizeof sig - 2)) {
             /* signature match, but is this a valid entry point? */
-            data->smbios_ep_addr = off;
-            if (smbios_ep_table_ok(data)) {
-                break;
+            data->smbios_ep_addr[SMBIOS_VER21] = off;
+            if (smbios_ep2_table_ok(data)) {
+                found_ep2 = true;
+            }
+        } else if (!found_ep3 && !memcmp(sig, "_SM3_", sizeof sig - 1)) {
+            data->smbios_ep_addr[SMBIOS_VER30] = off;
+            if (smbios_ep3_table_ok(data)) {
+                found_ep3 = true;
             }
         }
+
+        if (found_ep2 || found_ep3) {
+            break;
+        }
     }
 
-    g_assert_cmphex(off, <, 0x100000);
+    g_assert_cmphex(data->smbios_ep_addr[SMBIOS_VER21], <, 0x100000);
+    g_assert_cmphex(data->smbios_ep_addr[SMBIOS_VER30], <, 0x100000);
+
+    return found_ep3 ? SMBIOS_VER30 : SMBIOS_VER21;
 }
 
 static inline bool smbios_single_instance(uint8_t type)
@@ -625,16 +663,23 @@ static bool smbios_cpu_test(test_data *data, uint32_t addr)
     return true;
 }
 
-static void test_smbios_structs(test_data *data)
+static void test_smbios_structs(test_data *data, int ver)
 {
     DECLARE_BITMAP(struct_bitmap, SMBIOS_MAX_TYPE+1) = { 0 };
-    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table;
-    uint32_t addr = le32_to_cpu(ep_table->structure_table_address);
-    int i, len, max_len = 0;
+
+    smbios_entry_point *ep_table = &data->smbios_ep_table;
+    int i = 0, len, max_len = 0;
     uint8_t type, prv, crt;
+    uint64_t addr;
+
+    if (ver == SMBIOS_VER21) {
+        addr = le32_to_cpu(ep_table->ep21.structure_table_address);
+    } else {
+        addr = le64_to_cpu(ep_table->ep30.structure_table_address);
+    }
 
     /* walk the smbios tables */
-    for (i = 0; i < le16_to_cpu(ep_table->number_of_structures); i++) {
+    do {
 
         /* grab type and formatted area length from struct header */
         type = qtest_readb(data->qts, addr);
@@ -660,19 +705,23 @@ static void test_smbios_structs(test_data *data)
         }
 
         /* keep track of max. struct size */
-        if (max_len < len) {
+        if (ver == SMBIOS_VER21 && max_len < len) {
             max_len = len;
-            g_assert_cmpuint(max_len, <=, ep_table->max_structure_size);
+            g_assert_cmpuint(max_len, <=, ep_table->ep21.max_structure_size);
         }
 
         /* start of next structure */
         addr += len;
-    }
 
-    /* total table length and max struct size must match entry point values */
-    g_assert_cmpuint(le16_to_cpu(ep_table->structure_table_length), ==,
-                     addr - le32_to_cpu(ep_table->structure_table_address));
-    g_assert_cmpuint(le16_to_cpu(ep_table->max_structure_size), ==, max_len);
+    } while (ver == SMBIOS_VER21 ?
+                (++i < le16_to_cpu(ep_table->ep21.number_of_structures)) : (type != 127));
+
+    if (ver == SMBIOS_VER21) {
+        /* total table length and max struct size must match entry point values */
+        g_assert_cmpuint(le16_to_cpu(ep_table->ep21.structure_table_length), ==,
+                         addr - le32_to_cpu(ep_table->ep21.structure_table_address));
+        g_assert_cmpuint(le16_to_cpu(ep_table->ep21.max_structure_size), ==, max_len);
+    }
 
     /* required struct types must all be present */
     for (i = 0; i < data->required_struct_types_len; i++) {
@@ -756,8 +805,8 @@ static void test_acpi_one(const char *params, test_data *data)
      * https://bugs.launchpad.net/qemu/+bug/1821884
      */
     if (!use_uefi) {
-        test_smbios_entry_point(data);
-        test_smbios_structs(data);
+        int ver = test_smbios_entry_point(data);
+        test_smbios_structs(data, ver);
     }
 
     qtest_quit(data->qts);
-- 
2.35.1


