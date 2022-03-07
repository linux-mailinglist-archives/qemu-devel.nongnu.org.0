Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC2C4CF9A6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:10:41 +0100 (CET)
Received: from localhost ([::1]:41436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAK8-0005d3-U3
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:10:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABY-0008To-KN
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABW-0002aN-Qc
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UdCEFmroOMq8HjIXyQ0uo/r5UiIIhp1W/Xv1KnE50ho=;
 b=O0UgigmGhEsBddo60BvpxfwgzxtAI6STKp4z+Lnimh8AL9NL2V9/jb38wAK+KB5z/A/o0G
 KjyrPKe7az+bqX6PvH7RZcVW/saOjpjwszTrHXN7TIOQmVLkepspV7TRhW+ihWO3oL9T17
 HhKr7xwyjB/rJZEGyhPFzk/ASXrL/Hk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-CCu9b-YvMlWpsjQ3hE_8tQ-1; Mon, 07 Mar 2022 05:01:45 -0500
X-MC-Unique: CCu9b-YvMlWpsjQ3hE_8tQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y10-20020a056402358a00b00410deddea4cso8318593edc.16
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UdCEFmroOMq8HjIXyQ0uo/r5UiIIhp1W/Xv1KnE50ho=;
 b=jmU4sajnmGYBHeNq8NEcPEXTAKSuKhqowQM5SNfMcDImqmORrMXleq0IZHLhYnn4Ls
 4ZD0bAKmYAtjfxDuzUtFMpYw4gpLzbzyROQVxKKTB8iPUXo8hDw30isKpaJ6Gdo6zapk
 vh78uphfG6LJQLWZfN5tfZXsSicyZHHW6DperRIPR6SdaTGXANeSHIJUba4llVETnCCn
 VoDZqCvL2T+7Pnwik6GxnFiIeMFUSONLz99nIpE1PzCJ31V8OmRu0XjS0y1NlbwyMI9u
 0fPGYFpUSGF9yguONNVad3O4wYDWhoeQuOHB3hBz2FHylAkaHRgJ3smsEzV04UWxtEWl
 Najw==
X-Gm-Message-State: AOAM531zd0x+6Gw1MQaBCDPHgeJx+VtvoWjP70s4E0kosLU3nX83Huob
 mlrkh7b6z/uN/PTSRdNcIgQSscPXrmhXNEK0h7jjpu0Zt9VVD/i+++069/SdEO7vtXn1BAV6Ked
 xRyYVQE8u0bWZGHZTijxkUObaeP2gZYMoG8MmiieYd16zRYG7H3d+eCHeKBHR
X-Received: by 2002:a17:907:869f:b0:6da:888b:4258 with SMTP id
 qa31-20020a170907869f00b006da888b4258mr8532288ejc.720.1646647303688; 
 Mon, 07 Mar 2022 02:01:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8awBFT0Z82KlBrdEuQpS/5Sg/b49oMe07sfdx9EmTDivU4tElFzNSZOUWHUPGx1SdpnvdnA==
X-Received: by 2002:a17:907:869f:b0:6da:888b:4258 with SMTP id
 qa31-20020a170907869f00b006da888b4258mr8532263ejc.720.1646647303321; 
 Mon, 07 Mar 2022 02:01:43 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 b6-20020a50e386000000b00410d64cb3e4sm6132975edm.75.2022.03.07.02.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:01:42 -0800 (PST)
Date: Mon, 7 Mar 2022 05:01:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/47] hw/smbios: code cleanup - use macro definitions for
 table header handles
Message-ID: <20220307100058.449628-7-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

This is a minor cleanup. Using macro definitions makes the code more
readable. It is at once clear which tables use which handle numbers in their
header. It also makes it easy to calculate the gaps between the numbers and
update them if needed.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220223143322.927136-6-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
MST


