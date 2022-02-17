Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7004BA53E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:58:18 +0100 (CET)
Received: from localhost ([::1]:53876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKjAf-00006X-Ej
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:58:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nKiUO-0008Nw-Gd
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:14:36 -0500
Received: from [2607:f8b0:4864:20::102a] (port=51983
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nKiUM-0007cg-JA
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:14:36 -0500
Received: by mail-pj1-x102a.google.com with SMTP id y9so5877159pjf.1
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 07:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bHSDtq9nX65sHhUSEmWXPKE+bo44P0ZIROyPp3M0lPU=;
 b=nFpXzO3vP4ajhzV2ZleSfcF/EEOyxwRq6cA6zyfDQelXrPwHdmfwf4ubY9BCPhxtZz
 Ntkh5zD+3GhMpyWTSJdglPsCKH/wAM6SmbJXuHvICg8wJO7mZ9N1uDg5QysSwhYXytC1
 pOZHyuVikwu4DuAZCRqWBqeLcsE2lRpsGHO2NEnL4GyoAbNkQgbX0rvPH2hFRrTjDPPi
 l7rOCl62JWn61ibkzNTeiCuLEwWGYey5PXpcwpRZ2wNYBLe2/i4wmF5/PUtXzirewRm7
 cGXqlrm/eTPsWH2EYgF7JqQGDBIevAqoeteNnuCWbj4X3nEzBXbcc3LsRz5B3sD5+Nj4
 j7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bHSDtq9nX65sHhUSEmWXPKE+bo44P0ZIROyPp3M0lPU=;
 b=d0LqQaV1vf/Nmu7URBOUMF6pjJtGMecfaUkmxNp94+RioqijRto2WDEcUclJT0AHp6
 PUU/9qfIKHaF9tnT+SrJiPSojs/vpzxwq9SGmy+d0BYWA6/9jFCAqdUsm/l42Zh3SJiw
 OsqkJtzpUHSnHPHJfEm/eM3I6zJa3IpYEAXyWxE6ZWpIsyyNTmMD9vmZuBaggqgjK1Dn
 bbD06ZRiicg9tsj+yri4BCiHmb1qLcf3bkyO+aOIjB6gGxf/LzSYre2dN1ajz8vPZ3/A
 hetfNj53g/7m9wIeD6vSfcRd+XuRSXD5PMM1LG7RIi1MQYgezWV+9ciNxFUhpq1SmuKK
 BT0g==
X-Gm-Message-State: AOAM532AcQRcx+2Ua8n5vxjD+tAYtzW/CZ3oHQKLdjSmVJGErfrzZEt4
 G6Rb6AEkLsMq+Ys4vTXMhsSUOM2T5AFkTQ==
X-Google-Smtp-Source: ABdhPJxLoiamXGllwlJN/XDxNBkcTQiuihO+LKGwpXnIz1nzubTiz1tYfs5zCjDFYqtAbpYm8cFT6A==
X-Received: by 2002:a17:90b:368c:b0:1b8:57c5:3fde with SMTP id
 mj12-20020a17090b368c00b001b857c53fdemr3514554pjb.244.1645110872706; 
 Thu, 17 Feb 2022 07:14:32 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.242.253])
 by smtp.googlemail.com with ESMTPSA id z9sm8456884pgz.32.2022.02.17.07.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 07:14:32 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v4 1/3] hw/smbios: code cleanup - use macro definitions for
 table header handles
Date: Thu, 17 Feb 2022 20:44:08 +0530
Message-Id: <20220217151410.300210-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217151410.300210-1-ani@anisinha.ca>
References: <20220217151410.300210-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This is a minor cleanup. Using macro definitions makes the code more
readable. It is at once clear which tables use which handle numbers in their
header. It also makes it easy to calculate the gaps between the numbers and
update them if needed.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/smbios/smbios.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 6013df1698..56b412ce35 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -549,9 +549,23 @@ bool smbios_skip_table(uint8_t type, bool required_table)
     return true;
 }
 
+#define T0_BASE 0x000
+#define T1_BASE 0x100
+#define T2_BASE 0x200
+#define T3_BASE 0x300
+#define T4_BASE 0x400
+#define T11_BASE 0xe00
+
+#define T16_BASE 0x1000
+#define T17_BASE 0x1100
+#define T19_BASE 0x1300
+#define T32_BASE 0x2000
+#define T41_BASE 0x2900
+#define T127_BASE 0x7F00
+
 static void smbios_build_type_0_table(void)
 {
-    SMBIOS_BUILD_TABLE_PRE(0, 0x000, false); /* optional, leave up to BIOS */
+    SMBIOS_BUILD_TABLE_PRE(0, T0_BASE, false); /* optional, leave up to BIOS */
 
     SMBIOS_TABLE_SET_STR(0, vendor_str, type0.vendor);
     SMBIOS_TABLE_SET_STR(0, bios_version_str, type0.version);
@@ -599,7 +613,7 @@ static void smbios_encode_uuid(struct smbios_uuid *uuid, QemuUUID *in)
 
 static void smbios_build_type_1_table(void)
 {
-    SMBIOS_BUILD_TABLE_PRE(1, 0x100, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(1, T1_BASE, true); /* required */
 
     SMBIOS_TABLE_SET_STR(1, manufacturer_str, type1.manufacturer);
     SMBIOS_TABLE_SET_STR(1, product_name_str, type1.product);
@@ -619,7 +633,7 @@ static void smbios_build_type_1_table(void)
 
 static void smbios_build_type_2_table(void)
 {
-    SMBIOS_BUILD_TABLE_PRE(2, 0x200, false); /* optional */
+    SMBIOS_BUILD_TABLE_PRE(2, T2_BASE, false); /* optional */
 
     SMBIOS_TABLE_SET_STR(2, manufacturer_str, type2.manufacturer);
     SMBIOS_TABLE_SET_STR(2, product_str, type2.product);
@@ -637,7 +651,7 @@ static void smbios_build_type_2_table(void)
 
 static void smbios_build_type_3_table(void)
 {
-    SMBIOS_BUILD_TABLE_PRE(3, 0x300, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(3, T3_BASE, true); /* required */
 
     SMBIOS_TABLE_SET_STR(3, manufacturer_str, type3.manufacturer);
     t->type = 0x01; /* Other */
@@ -662,7 +676,7 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
 {
     char sock_str[128];
 
-    SMBIOS_BUILD_TABLE_PRE(4, 0x400 + instance, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(4, T4_BASE + instance, true); /* required */
 
     snprintf(sock_str, sizeof(sock_str), "%s%2x", type4.sock_pfx, instance);
     SMBIOS_TABLE_SET_STR(4, socket_designation_str, sock_str);
@@ -702,7 +716,7 @@ static void smbios_build_type_11_table(void)
         return;
     }
 
-    SMBIOS_BUILD_TABLE_PRE(11, 0xe00, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(11, T11_BASE, true); /* required */
 
     snprintf(count_str, sizeof(count_str), "%zu", type11.nvalues);
     t->count = type11.nvalues;
@@ -722,7 +736,7 @@ static void smbios_build_type_16_table(unsigned dimm_cnt)
 {
     uint64_t size_kb;
 
-    SMBIOS_BUILD_TABLE_PRE(16, 0x1000, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(16, T16_BASE, true); /* required */
 
     t->location = 0x01; /* Other */
     t->use = 0x03; /* System memory */
@@ -749,7 +763,7 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
     char loc_str[128];
     uint64_t size_mb;
 
-    SMBIOS_BUILD_TABLE_PRE(17, 0x1100 + instance, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(17, T17_BASE + instance, true); /* required */
 
     t->physical_memory_array_handle = cpu_to_le16(0x1000); /* Type 16 above */
     t->memory_error_information_handle = cpu_to_le16(0xFFFE); /* Not provided */
@@ -790,7 +804,7 @@ static void smbios_build_type_19_table(unsigned instance,
 {
     uint64_t end, start_kb, end_kb;
 
-    SMBIOS_BUILD_TABLE_PRE(19, 0x1300 + instance, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(19, T19_BASE + instance, true); /* required */
 
     end = start + size - 1;
     assert(end > start);
@@ -814,7 +828,7 @@ static void smbios_build_type_19_table(unsigned instance,
 
 static void smbios_build_type_32_table(void)
 {
-    SMBIOS_BUILD_TABLE_PRE(32, 0x2000, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(32, T32_BASE, true); /* required */
 
     memset(t->reserved, 0, 6);
     t->boot_status = 0; /* No errors detected */
@@ -828,7 +842,7 @@ static void smbios_build_type_41_table(Error **errp)
     struct type41_instance *t41;
 
     QTAILQ_FOREACH(t41, &type41, next) {
-        SMBIOS_BUILD_TABLE_PRE(41, 0x2900 + instance, true);
+        SMBIOS_BUILD_TABLE_PRE(41, T41_BASE + instance, true);
 
         SMBIOS_TABLE_SET_STR(41, reference_designation_str, t41->designation);
         t->device_type = t41->kind;
@@ -871,7 +885,7 @@ static void smbios_build_type_41_table(Error **errp)
 
 static void smbios_build_type_127_table(void)
 {
-    SMBIOS_BUILD_TABLE_PRE(127, 0x7F00, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(127, T127_BASE, true); /* required */
     SMBIOS_BUILD_TABLE_POST;
 }
 
-- 
2.25.1


