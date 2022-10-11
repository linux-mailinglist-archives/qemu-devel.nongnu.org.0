Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0695FB2B9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:57:06 +0200 (CEST)
Received: from localhost ([::1]:52016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEoj-0007oy-MD
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oiDIp-0002ya-Q1
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oiDIn-0008I2-FC
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665487200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kOFIepoN57ajGLw/aDvZkVpHU/g6p1R+x63SVMEiKGw=;
 b=CBm6rqSDIM0yyn4SH9vjNgts5iNmC0s57D6kZMCTjV/MmUW/q/hkdO9HGDBWBPei+78XR6
 WHjsk4viv4ofYufv3PTsxI8TC3zdhOxVFrv0HgHxatlZAksdiXzpjM77/IVrjIm/uSYuop
 rwy7JOkTxqZ6J/qIXEOaQlGMFzCRLbo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-LNR8sM8OOI6MgetRwIzJyg-1; Tue, 11 Oct 2022 07:18:19 -0400
X-MC-Unique: LNR8sM8OOI6MgetRwIzJyg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3418485A59D;
 Tue, 11 Oct 2022 11:18:19 +0000 (UTC)
Received: from ovpn-194-244.brq.redhat.com (ovpn-194-244.brq.redhat.com
 [10.40.194.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3A044B400F;
 Tue, 11 Oct 2022 11:18:17 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH v3 2/5] bios-tables-test: teach test to use smbios 3.0 tables
Date: Tue, 11 Oct 2022 13:17:28 +0200
Message-Id: <20221011111731.101412-3-jusual@redhat.com>
In-Reply-To: <20221011111731.101412-1-jusual@redhat.com>
References: <20221011111731.101412-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220731162141.178443-3-jusual@redhat.com>
---
 tests/qtest/bios-tables-test.c | 100 +++++++++++++++++++++++++--------
 1 file changed, 76 insertions(+), 24 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 2ebeb530b2..f5fffdc348 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -88,8 +88,8 @@ typedef struct {
     uint64_t rsdp_addr;
     uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
     GArray *tables;
-    uint32_t smbios_ep_addr;
-    struct smbios_21_entry_point smbios_ep_table;
+    uint64_t smbios_ep_addr[SMBIOS_ENTRY_POINT_TYPE__MAX];
+    SmbiosEntryPoint smbios_ep_table;
     uint16_t smbios_cpu_max_speed;
     uint16_t smbios_cpu_curr_speed;
     uint8_t *required_struct_types;
@@ -533,10 +533,9 @@ static void test_acpi_asl(test_data *data)
     free_test_data(&exp_data);
 }
 
-static bool smbios_ep_table_ok(test_data *data)
+static bool smbios_ep2_table_ok(test_data *data, uint32_t addr)
 {
-    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table;
-    uint32_t addr = data->smbios_ep_addr;
+    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table.ep21;
 
     qtest_memread(data->qts, addr, ep_table, sizeof(*ep_table));
     if (memcmp(ep_table->anchor_string, "_SM_", 4)) {
@@ -559,13 +558,29 @@ static bool smbios_ep_table_ok(test_data *data)
     return true;
 }
 
-static void test_smbios_entry_point(test_data *data)
+static bool smbios_ep3_table_ok(test_data *data, uint64_t addr)
+{
+    struct smbios_30_entry_point *ep_table = &data->smbios_ep_table.ep30;
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
+static SmbiosEntryPointType test_smbios_entry_point(test_data *data)
 {
     uint32_t off;
 
     /* find smbios entry point structure */
     for (off = 0xf0000; off < 0x100000; off += 0x10) {
-        uint8_t sig[] = "_SM_";
+        uint8_t sig[] = "_SM_", sig3[] = "_SM3_";
         int i;
 
         for (i = 0; i < sizeof sig - 1; ++i) {
@@ -574,14 +589,30 @@ static void test_smbios_entry_point(test_data *data)
 
         if (!memcmp(sig, "_SM_", sizeof sig)) {
             /* signature match, but is this a valid entry point? */
-            data->smbios_ep_addr = off;
-            if (smbios_ep_table_ok(data)) {
+            if (smbios_ep2_table_ok(data, off)) {
+                data->smbios_ep_addr[SMBIOS_ENTRY_POINT_TYPE_32] = off;
+            }
+        }
+
+        for (i = 0; i < sizeof sig3 - 1; ++i) {
+            sig3[i] = qtest_readb(data->qts, off + i);
+        }
+
+        if (!memcmp(sig3, "_SM3_", sizeof sig3)) {
+            if (smbios_ep3_table_ok(data, off)) {
+                data->smbios_ep_addr[SMBIOS_ENTRY_POINT_TYPE_64] = off;
+                /* found 64-bit entry point, no need to look for 32-bit one */
                 break;
             }
         }
     }
 
-    g_assert_cmphex(off, <, 0x100000);
+    /* found at least one entry point */
+    g_assert_true(data->smbios_ep_addr[SMBIOS_ENTRY_POINT_TYPE_32] ||
+                  data->smbios_ep_addr[SMBIOS_ENTRY_POINT_TYPE_64]);
+
+    return data->smbios_ep_addr[SMBIOS_ENTRY_POINT_TYPE_64] ?
+           SMBIOS_ENTRY_POINT_TYPE_64 : SMBIOS_ENTRY_POINT_TYPE_32;
 }
 
 static inline bool smbios_single_instance(uint8_t type)
@@ -625,16 +656,23 @@ static bool smbios_cpu_test(test_data *data, uint32_t addr)
     return true;
 }
 
-static void test_smbios_structs(test_data *data)
+static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
 {
     DECLARE_BITMAP(struct_bitmap, SMBIOS_MAX_TYPE+1) = { 0 };
-    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table;
-    uint32_t addr = le32_to_cpu(ep_table->structure_table_address);
-    int i, len, max_len = 0;
+
+    SmbiosEntryPoint *ep_table = &data->smbios_ep_table;
+    int i = 0, len, max_len = 0;
     uint8_t type, prv, crt;
+    uint64_t addr;
+
+    if (ep_type == SMBIOS_ENTRY_POINT_TYPE_32) {
+        addr = le32_to_cpu(ep_table->ep21.structure_table_address);
+    } else {
+        addr = le64_to_cpu(ep_table->ep30.structure_table_address);
+    }
 
     /* walk the smbios tables */
-    for (i = 0; i < le16_to_cpu(ep_table->number_of_structures); i++) {
+    do {
 
         /* grab type and formatted area length from struct header */
         type = qtest_readb(data->qts, addr);
@@ -660,19 +698,33 @@ static void test_smbios_structs(test_data *data)
         }
 
         /* keep track of max. struct size */
-        if (max_len < len) {
+        if (ep_type == SMBIOS_ENTRY_POINT_TYPE_32 && max_len < len) {
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
+    /*
+     * Until all structures have been scanned (ep21)
+     * or an EOF structure is found (ep30)
+     */
+    } while (ep_type == SMBIOS_ENTRY_POINT_TYPE_32 ?
+                ++i < le16_to_cpu(ep_table->ep21.number_of_structures) :
+                type != 127);
+
+    if (ep_type == SMBIOS_ENTRY_POINT_TYPE_32) {
+        /*
+         * Total table length and max struct size
+         * must match entry point values
+         */
+        g_assert_cmpuint(le16_to_cpu(ep_table->ep21.structure_table_length), ==,
+            addr - le32_to_cpu(ep_table->ep21.structure_table_address));
+
+        g_assert_cmpuint(le16_to_cpu(ep_table->ep21.max_structure_size), ==,
+            max_len);
+    }
 
     /* required struct types must all be present */
     for (i = 0; i < data->required_struct_types_len; i++) {
@@ -756,8 +808,8 @@ static void test_acpi_one(const char *params, test_data *data)
      * https://bugs.launchpad.net/qemu/+bug/1821884
      */
     if (!use_uefi) {
-        test_smbios_entry_point(data);
-        test_smbios_structs(data);
+        SmbiosEntryPointType ep_type = test_smbios_entry_point(data);
+        test_smbios_structs(data, ep_type);
     }
 
     qtest_quit(data->qts);
-- 
2.37.3


