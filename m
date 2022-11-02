Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E52B616896
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:23:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGIr-0003Ps-6S; Wed, 02 Nov 2022 12:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIp-0003N8-KN
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIn-0002Q8-Px
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j2y6/3qSr5xR2kCZshn+jqDXmBLU6euh0+HMlyvqt68=;
 b=MhvEeZWkr+lXoFQeoARGsKVa9bEdkst5Xy2znP2rbYaV3KCWMNWpUHXy+ci5fUxD8HfdRi
 mkBVs6TT8FH7CVehhstfo8d587qEe94itt9U/NiB1VDRatToIqkP/SmWZib/rBrVi8UkKH
 UEw9lEQl070Iv0LtT2VJd2KWhQQ7+90=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-KNUqa9taOOSm3x9JIUaoTA-1; Wed, 02 Nov 2022 12:09:14 -0400
X-MC-Unique: KNUqa9taOOSm3x9JIUaoTA-1
Received: by mail-wr1-f72.google.com with SMTP id
 i14-20020adfa50e000000b0023652707418so5040366wrb.20
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2y6/3qSr5xR2kCZshn+jqDXmBLU6euh0+HMlyvqt68=;
 b=XJtgJI5zw1gXWjbtxP9mIo729quos2VzPkJf7cPVp4fDlCGp1TXhi84Jl6Nqc89cdG
 3Y3bbbnv8mY7yYON26PJJYBaBrazE32/50bGbcBwoSZQjVqdG1ZvIzYpjDTR94RVWJnb
 JvGP7eYnJEs9SyJBfEWp/U+uwwGftD0Pdc/z2oNZRyrDiFyqUmdOt++C2JoleUp7xUOH
 X7ddjvjab9tx2/DxwkP/LeRuYPeZ0SeKz8m05O+HXM1AY5zm++FWI2YzhROEHl5hMV0y
 0VrOx7QwGyFNzPHohe8ayZ8Rgzrl5Vf4lv/+sLXnBZGnnQgMR0sCT3VbXZlvo7d5DHDo
 9FJQ==
X-Gm-Message-State: ACrzQf0XPOwWb5Clh8mRFYRyUe5sAmTKl+/dfkC5WX+V5GpR4n0xU6hB
 WRui3TElY6v8CLfebrIYcZxTf/9XgvM/uAJDNzXZtQYqfexCPHXuEcyEoVgGhLwbRrNs2qJzlVy
 Dkydqkrz6kRX0lV2peopw0OowUQFDHPC6V/WQcmAKtypHpAck6/9CXFmYocp7
X-Received: by 2002:a05:6000:1201:b0:236:61f4:b384 with SMTP id
 e1-20020a056000120100b0023661f4b384mr15197253wrx.505.1667405352760; 
 Wed, 02 Nov 2022 09:09:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xskSxJ6oSgyAzxTvuHCslbJGmNwLTEuqN9o4AOXbmgWo2NW+vCJ4HAZerDiD0RWF6lpj0bg==
X-Received: by 2002:a05:6000:1201:b0:236:61f4:b384 with SMTP id
 e1-20020a056000120100b0023661f4b384mr15197216wrx.505.1667405352422; 
 Wed, 02 Nov 2022 09:09:12 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 l20-20020a5d5274000000b0022cbf4cda62sm16394553wrc.27.2022.11.02.09.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:12 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 18/82] bios-tables-test: teach test to use smbios 3.0 tables
Message-ID: <20221102160336.616599-19-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Julia Suvorova <jusual@redhat.com>

Introduce the 64-bit entry point. Since we no longer have a total
number of structures, stop checking for the new ones at the EOF
structure (type 127).

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220731162141.178443-3-jusual@redhat.com>
Message-Id: <20221011111731.101412-3-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 100 +++++++++++++++++++++++++--------
 1 file changed, 76 insertions(+), 24 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e6096e7f73..0db6630772 100644
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
MST


