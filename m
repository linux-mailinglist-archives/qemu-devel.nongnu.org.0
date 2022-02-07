Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F674ABD18
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:56:18 +0100 (CET)
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2cy-0003uN-FE
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:56:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH2GO-00084O-8M
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:32:56 -0500
Received: from [2607:f8b0:4864:20::634] (port=33300
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH2GM-0001ig-A2
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:32:55 -0500
Received: by mail-pl1-x634.google.com with SMTP id k17so10933441plk.0
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 03:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HQH3eWFR7IKexMJlde1CSSYstj0sV5D8nhe7VhsYT0s=;
 b=zoULr9lVdivbCAu6PdlqeWuOHYzTlFJbR6SCCI+65agVnPHHak/RefZxp/CCE8+Zgn
 ut7f/SdzxBwslGXYmkjCigCXl0ZU79y5LgPdFOqJ2oZP5HIv8/TTm/OYqGIvKljLuB9b
 IG35LFLt0SZ97ou/Fh2sK9IigPoKJ+2X/TaIT/7wi48f249v9oyVHbp0nMfeYCm6rtOO
 +FF3xiSgGdb5HSB7TimsgxIaXXFgVn87kO0sFtcZbs8NzYdyU0HzuEYTpGUmzjcLpWv4
 GYL2JuJSyb+42nQRjBINYm3HxSnAo74mRoe9FLjHI7dB3Hg7M1oqChBQmefdM4UgDfLj
 6KYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HQH3eWFR7IKexMJlde1CSSYstj0sV5D8nhe7VhsYT0s=;
 b=KlTAp0JlPutG3IJu9F6qnZM+hu/ukRfft5a+FFOm2f+/54D7EpirChZR1SnEnYo7GK
 4GFCSuKHbnPV20M6XN266wC0tXKelq3xvlOUcExLeXWJuRxng678dmlYg+zS6hS7pjB5
 +X3ATf3BRPZ36i1e4zI3gqMdb6JIkUyBJ9+Ymes3S+RFLuYiUMj36g1OZ4bbe7cqIMUm
 Uc5lZO3tlRQQ/ojmNxSvfd7NEiVU+ax22fIykIpj+c5Z4kJw3Ubggg+h9//U4ZK7+xBu
 yf3D5Zi/sf5t+8iUllo/yB0cq1TOB0RPJ2oLlIpOT3BhUD1efVsq6Oc67kquJXc5zg1K
 V3Iw==
X-Gm-Message-State: AOAM531eP3Ciw3WBNEEyZSIzy5b1l1KPGCJ5mCEl0z7u1dBnx/S0zYTQ
 /xu48+DYh3VrDf3LXyWuc8xzhnjsAVm7upNvxtUC1w==
X-Google-Smtp-Source: ABdhPJybV91zKm69JFDVnsMexiJyi8ElKWF9a/YBlyk0n3KMAp5yuw3ae8HznisThaYd97glQZUXIw==
X-Received: by 2002:a17:90b:4d82:: with SMTP id
 oj2mr13579085pjb.77.1644233572579; 
 Mon, 07 Feb 2022 03:32:52 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.242.56])
 by smtp.googlemail.com with ESMTPSA id h14sm13016345pfh.95.2022.02.07.03.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 03:32:52 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2 1/3] hw/smbios: code cleanup - use macro definitions for
 table base addresses
Date: Mon,  7 Feb 2022 17:01:27 +0530
Message-Id: <20220207113129.2701722-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207113129.2701722-1-ani@anisinha.ca>
References: <20220207113129.2701722-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x634.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
readable. It is at once clear which tables use which starting base addresses.
It also makes it easy to calculate the gaps between the addresses and modify
them if needed.

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


