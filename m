Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF2656CE9E
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jul 2022 12:51:37 +0200 (CEST)
Received: from localhost ([::1]:50844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAUXH-00010k-JW
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 06:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hal.martin@gmail.com>)
 id 1oAUTz-000746-4P
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 06:48:13 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:44732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hal.martin@gmail.com>)
 id 1oAUTx-0002Co-Bd
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 06:48:10 -0400
Received: by mail-qk1-x72d.google.com with SMTP id x17so2052054qkh.11
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 03:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/xIg08I3Z3acJeOtSskzddHcdVAk/RY1YStm/y63W/M=;
 b=g1fY/r1cQM5QTCFzyVU9wvTM9K8um9rusUrWiQ9hHb0SNvVwbRN5qDTdDuRCmKcMyg
 ohMlaodU4MW3JmLiar6qWKUbE14WJa6aUjXnPCw01e6q3VxVhyiREtDGdN/ASvGlx6L0
 578D1nCcHrNrcxgE5JT+nD8NjnDW+Fk7ExXlZo3+cukWNv8FuF9M4mLJA/xPkUJ64/v6
 dxU+Bn3fRer6TVRTePH5F8e7asoxz2rsLIK6xiVqsonC9nXI4gEA3b3335h5CQq7czLj
 Dbmwt0YY1p8d94qYAPVHqN/18bkf1EzSMMqoq9ZvXOkyZnWWaMisbARJ1n9hTEvKZ4QG
 SYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/xIg08I3Z3acJeOtSskzddHcdVAk/RY1YStm/y63W/M=;
 b=5c5e6j3QnAMk2Y8jB9tUiTHGdICy5ouKfs2htExdy40H+uyHQZKopemNfe4U8p6jRD
 p943DM1YOhRoEFGiV7bCqz3ewEzmeKsD/nZeGiJXRKq9Z4NHLv3fKsUOW0KXa5wTi/Vh
 XnlescTeLTt/c9OL98NOvDAqNd5bJIvefJy+Zxzm0tZKo11TCFX1NclwNweI5JrwniKB
 vAX2OoTijU7SaHYMBgtH5G+j40IyThE5YlRX58v5pwl3/wx6DJbzPCSUwP9by5YiBDCm
 wyPpggYP1GWzVZ8GcOBMyu7e3Yc6M8NzFR8H2cZoPbkYZ1WrtHKE7+oTA0gbAoF+3Seg
 s6nw==
X-Gm-Message-State: AJIora92hi0L6HoH2txTJwCNfYcmTyCcBZ7eEbMLeB00L6q4mDXQ3csr
 xD3IN/1wl/VnvK/rLdm6He6v36f9pKPAp6Pk
X-Google-Smtp-Source: AGRyM1uWz5eM+X3d6Zq51uGl2FWXXBLeLFK46lpp3iOuev7xWwXaUDeNeoySDorPZ3VT5sVQTVHBtQ==
X-Received: by 2002:a05:620a:4086:b0:6b1:e044:3f66 with SMTP id
 f6-20020a05620a408600b006b1e0443f66mr8143262qko.500.1657450086559; 
 Sun, 10 Jul 2022 03:48:06 -0700 (PDT)
Received: from cezanne.lan ([84.55.118.52]) by smtp.gmail.com with ESMTPSA id
 u5-20020a05620a0c4500b006a32bf19502sm3341966qki.60.2022.07.10.03.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 03:48:05 -0700 (PDT)
From: Hal Martin <hal.martin@gmail.com>
To: qemu-devel@nongnu.org
Cc: Hal Martin <hal.martin@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH] Add support for SMBIOS type 8 (Port Connector Information)
Date: Sun, 10 Jul 2022 12:48:04 +0200
Message-Id: <20220710104804.31694-1-hal.martin@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=hal.martin@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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


This patch adds support for SMBIOS type 8 to qemu.

internal_reference: internal reference designator
external_reference: external reference designator
connector_type: hex value for port connector type (see SMBIOS 7.9.2)
port_type: hex value for port type (see SMBIOS 7.9.3)

After studying various vendor implementationsi (Dell, Lenovo, MSI),
the value of internal connector type was hard-coded to 0x0 (None).

Example usage:
-smbios type=8,internal_reference=JUSB1,external_reference=USB1,connector_type=0x12,port_type=0x10 \
-smbios type=8,internal_reference=JAUD1,external_reference="Audio Jack",connector_type=0x1f,port_type=0x1d \
-smbios type=8,internal_reference=LAN,external_reference=Ethernet,connector_type=0x0b,port_type=0x1f \
-smbios type=8,internal_reference=PS2,external_reference=Mouse,connector_type=0x0f,port_type=0x0e \
-smbios type=8,internal_reference=PS2,external_reference=Keyboard,connector_type=0x0f,port_type=0x0d

Signed-off-by: Hal Martin <hal.martin@gmail.com>

---
 hw/smbios/smbios.c           | 65 ++++++++++++++++++++++++++++++++++++
 include/hw/firmware/smbios.h | 10 ++++++
 2 files changed, 75 insertions(+)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 60349ee402..11fe75ece0 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -111,6 +111,13 @@ static struct {
     .processor_id = 0,
 };
 
+struct type8_instance {
+    const char *internal_reference, *external_reference;
+    uint8_t connector_type, port_type;
+    QTAILQ_ENTRY(type8_instance) next;
+};
+static QTAILQ_HEAD(, type8_instance) type8 = QTAILQ_HEAD_INITIALIZER(type8);
+
 static struct {
     size_t nvalues;
     char **values;
@@ -136,6 +143,7 @@ static QEnumLookup type41_kind_lookup = {
     },
     .size = 10
 };
+
 struct type41_instance {
     const char *designation, *pcidev;
     uint8_t instance, kind;
@@ -337,6 +345,29 @@ static const QemuOptDesc qemu_smbios_type4_opts[] = {
     { /* end of list */ }
 };
 
+static const QemuOptDesc qemu_smbios_type8_opts[] = {
+    {
+        .name = "internal_reference",
+        .type = QEMU_OPT_STRING,
+        .help = "internal reference designator",
+    },
+    {
+        .name = "external_reference",
+        .type = QEMU_OPT_STRING,
+        .help = "external reference designator",
+    },
+    {
+        .name = "connector_type",
+        .type = QEMU_OPT_NUMBER,
+        .help = "connector type",
+    },
+    {
+        .name = "port_type",
+        .type = QEMU_OPT_NUMBER,
+        .help = "port type",
+    },
+};
+
 static const QemuOptDesc qemu_smbios_type11_opts[] = {
     {
         .name = "value",
@@ -718,6 +749,27 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     smbios_type4_count++;
 }
 
+static void smbios_build_type_8_table(void)
+{
+    unsigned instance = 0;
+    struct type8_instance *t8;
+
+    QTAILQ_FOREACH(t8, &type8, next) {
+
+        SMBIOS_BUILD_TABLE_PRE(8, T0_BASE + instance, true);
+
+        SMBIOS_TABLE_SET_STR(8, internal_reference_str, t8->internal_reference);
+        SMBIOS_TABLE_SET_STR(8, external_reference_str, t8->external_reference);
+        // most vendors seem to set this to None
+        t->internal_connector_type = 0x0;
+        t->external_connector_type = t8->connector_type;
+        t->port_type = t8->port_type;
+
+        SMBIOS_BUILD_TABLE_POST;
+        instance++;
+    }
+}
+
 static void smbios_build_type_11_table(void)
 {
     char count_str[128];
@@ -1030,6 +1082,7 @@ void smbios_get_tables(MachineState *ms,
             smbios_build_type_4_table(ms, i);
         }
 
+        smbios_build_type_8_table();
         smbios_build_type_11_table();
 
 #define MAX_DIMM_SZ (16 * GiB)
@@ -1346,6 +1399,18 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
                            UINT16_MAX);
             }
             return;
+        case 8:
+            if (!qemu_opts_validate(opts, qemu_smbios_type8_opts, errp)) {
+                return;
+            }
+            struct type8_instance *t;
+            t = g_new0(struct type8_instance, 1);
+            save_opt(&t->internal_reference, opts, "internal_reference");
+            save_opt(&t->external_reference, opts, "external_reference");
+            t->connector_type = qemu_opt_get_number(opts, "connector_type", 0);
+            t->port_type = qemu_opt_get_number(opts, "port_type", 0);
+            QTAILQ_INSERT_TAIL(&type8, t, next);
+            return;
         case 11:
             if (!qemu_opts_validate(opts, qemu_smbios_type11_opts, errp)) {
                 return;
diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 4b7ad77a44..e7d386f7c8 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -189,6 +189,16 @@ struct smbios_type_4 {
     uint16_t processor_family2;
 } QEMU_PACKED;
 
+/* SMBIOS type 8 - Port Connector Information */
+struct smbios_type_8 {
+    struct smbios_structure_header header;
+    uint8_t internal_reference_str;
+    uint8_t internal_connector_type;
+    uint8_t external_reference_str;
+    uint8_t external_connector_type;
+    uint8_t port_type;
+} QEMU_PACKED;
+
 /* SMBIOS type 11 - OEM strings */
 struct smbios_type_11 {
     struct smbios_structure_header header;
-- 
2.36.1


