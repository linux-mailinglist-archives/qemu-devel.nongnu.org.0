Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D2C6203A9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:20:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osB0R-0005zu-EO; Mon, 07 Nov 2022 17:54:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0O-0005uh-Pz
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0M-0005JO-VT
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OTLkYkaIRtWmq07C9dZXSuFvY/fwYfp3BLVQipSbdM8=;
 b=bC7BZPVQNqGEU+wtW/GUdO+lng6Anibl/i06AS9iuD8tMEG+g7T5Df18Sqes9T4c1bI2TM
 gscwAhfoB7NMZE7BeTLfl37AJXRJ3TPYGyN/VX9TuxL98w0o+yEXfjJ6xel/8BDT9Sr9oM
 4MhmgLnxX4KD1Q6bwFjuIC8rUMPLriE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-O6qXJOXLM8eo0XFRW-O2Jw-1; Mon, 07 Nov 2022 17:54:09 -0500
X-MC-Unique: O6qXJOXLM8eo0XFRW-O2Jw-1
Received: by mail-qt1-f197.google.com with SMTP id
 b20-20020ac844d4000000b003a542f9de3dso9026930qto.7
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:54:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OTLkYkaIRtWmq07C9dZXSuFvY/fwYfp3BLVQipSbdM8=;
 b=nUlyWiK/vwNP6IWsp85Itvi5CZ7BKb8jAXF18pcJwGxMt3c0jvkM2qixW7/Dq1qSTV
 rMzzEjOnHA65AzBzfSnTubXYF6mBP9pMFcN3Psf0qUHrgHe0GRKWHYVU14qX1zrMOaHU
 TIJ23xdhJSqVCZu6NuEUSObGLWnnKC0d8QsDkHd1foABCLo0Ah8YdLW/isY+BRomBERJ
 w8jHmz75FeCQb2kPjcfv/8v0srr/uQWHtWbiivQhRSTvSchmyrsp4yNN/hB1qb1YDfRi
 Q+xBLn7HaC95Omtgl/W84FtAJ1FXZw3mQ+y3fbkFBMg88Mcr2NFM/mJb3Eq15YN2p47X
 MQTg==
X-Gm-Message-State: ACrzQf2nMipioOpCsa1nU0AQKWdYhWem9THOWSYPZk3mc4dyOYGk0bKQ
 kwvA6VvzSsDWkcv8IEoQuIyxT3SPMxHO3HT5DcgClmklrKt17BLUMTPsAZlEa6kn/MEzemFUeQp
 z06tIxFoofP871Sf98aP4tjbk9+CTG+JsduSeQOd4xRURZdRG88p378bb33/X
X-Received: by 2002:a05:620a:1997:b0:6fa:4da:5a6e with SMTP id
 bm23-20020a05620a199700b006fa04da5a6emr37105228qkb.112.1667861648856; 
 Mon, 07 Nov 2022 14:54:08 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7PMBF73M2gdAKGAhQuoG0o0b6LyIBFQjNHH5EhXz/9CpKlT+1huacI8bqoEXWTUs402m42jg==
X-Received: by 2002:a05:620a:1997:b0:6fa:4da:5a6e with SMTP id
 bm23-20020a05620a199700b006fa04da5a6emr37105209qkb.112.1667861648496; 
 Mon, 07 Nov 2022 14:54:08 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 fv19-20020a05622a4a1300b0039c37a7914csm6909849qtb.23.2022.11.07.14.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:54:08 -0800 (PST)
Date: Mon, 7 Nov 2022 17:54:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 78/83] bios-tables-test: teach test to use smbios 3.0 tables
Message-ID: <20221107224600.934080-79-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index e805b3efec..aa91b0fca5 100644
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


