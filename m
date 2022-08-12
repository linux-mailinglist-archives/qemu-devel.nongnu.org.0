Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF1E5911BB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 15:53:27 +0200 (CEST)
Received: from localhost ([::1]:38108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMV6M-0002wd-Bw
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 09:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hal.martin@gmail.com>)
 id 1oMV4u-0001Yw-QM
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 09:51:56 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:37767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hal.martin@gmail.com>)
 id 1oMV4t-0000aw-2J
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 09:51:56 -0400
Received: by mail-qk1-x729.google.com with SMTP id a15so368809qko.4
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 06:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Vlymm73aKTQzomsrrEGpSEc1BKDyXSY8xM3WZa1ArBE=;
 b=FKtoG0Ckmn+eObhTQYVcVicMZtjhTN+fqV+odhusil6xA4gG6c1Cc2009ZTEXdsu0O
 tB48pC0sZQz2HxYXnd3RIY8es+Z7efoqs9sGZjY5ax6yhM+jCNGkR6ZVWggWkUMVs5og
 CrcG9/7TOJeWcIY2ulecwTGoBVqFa2S+B5n4H0lrNrzkRIh4urTVqIbGctl9rVsUY2vy
 hprOo01l1pB45EtU0LdpswyJJhT70mJ1awtF1K3/F8FtcQW0C65F0shDuVRI1HO+Wcwy
 dr7g0BJclxRsCUNIJMa903SslYOQwvIsVRinn6pJckXDqrQJYQ+I/3Bd52ysF0asfS9g
 BftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Vlymm73aKTQzomsrrEGpSEc1BKDyXSY8xM3WZa1ArBE=;
 b=T+0yXNbDKJBt+BUeTqir9S45m/Ywaibj/NPwJwfh1Grpr34LBNl2xtnVg2ho+J4rvP
 X+PwpQGpzT9BcoSp503hdjN0l6xg6wUOAqlJrOgwzx0Se+kYo3LizReVXlkRra282zTi
 7/ei0ygFEpzs+UstS06izaTSZE38GrdH9qqH9kTeKq+uvALIaOEgXGkd/uOf+N1PpGNj
 WiOONpXh601H3YiEWhR/uMjOvAKiPCOYBLPeK22mtEHeuAUp9XEfo0xQG0w4VfxMvx8n
 R+kP+0TDLp5+leNo9IU92ismc6vXP9BvlYuTlc0evRbqkK+v1jDeS2+fvOqcZDOOn+3v
 dx/w==
X-Gm-Message-State: ACgBeo3Bd7CJliBqSzYJrqyhpXYHE2zDCVdQSU61plW26aA6ry6YX5LE
 tdVQT77uG5GWaCa9xFGlPz+ceWHczRA=
X-Google-Smtp-Source: AA6agR4xEhahzpz5rb1z50Swgl+YbWgMsz1J1zfGvxcnd/r8i+wX4EpeTiFokBLQvBgy+QcjIhVywA==
X-Received: by 2002:a05:620a:2699:b0:6b8:c299:23c2 with SMTP id
 c25-20020a05620a269900b006b8c29923c2mr2789251qkp.768.1660312313629; 
 Fri, 12 Aug 2022 06:51:53 -0700 (PDT)
Received: from cezanne.lan ([84.55.118.52]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a454c00b006b8c575ce27sm1996324qkp.109.2022.08.12.06.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 06:51:53 -0700 (PDT)
From: Hal Martin <hal.martin@gmail.com>
To: qemu-devel@nongnu.org
Cc: Hal Martin <hal.martin@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2] hw/smbios: support for type 8 (port connector)
Date: Fri, 12 Aug 2022 15:51:53 +0200
Message-Id: <20220812135153.17859-1-hal.martin@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=hal.martin@gmail.com; helo=mail-qk1-x729.google.com
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

PATCH v1: add support for SMBIOS type 8 to qemu
PATCH v2: incorporate patch v1 feedback and add smbios type=8 to qemu-options

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
 hw/smbios/smbios.c           | 63 ++++++++++++++++++++++++++++++++++++
 include/hw/firmware/smbios.h | 10 ++++++
 qemu-options.hx              |  2 ++
 3 files changed, 75 insertions(+)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 60349ee402..578cae0f0a 100644
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
@@ -337,6 +344,29 @@ static const QemuOptDesc qemu_smbios_type4_opts[] = {
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
@@ -718,6 +748,26 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     smbios_type4_count++;
 }
 
+static void smbios_build_type_8_table(void)
+{
+    unsigned instance = 0;
+    struct type8_instance *t8;
+
+    QTAILQ_FOREACH(t8, &type8, next) {
+        SMBIOS_BUILD_TABLE_PRE(8, T0_BASE + instance, true);
+
+        SMBIOS_TABLE_SET_STR(8, internal_reference_str, t8->internal_reference);
+        SMBIOS_TABLE_SET_STR(8, external_reference_str, t8->external_reference);
+        /* most vendors seem to set this to None */
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
@@ -1030,6 +1080,7 @@ void smbios_get_tables(MachineState *ms,
             smbios_build_type_4_table(ms, i);
         }
 
+        smbios_build_type_8_table();
         smbios_build_type_11_table();
 
 #define MAX_DIMM_SZ (16 * GiB)
@@ -1346,6 +1397,18 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
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
diff --git a/qemu-options.hx b/qemu-options.hx
index 377d22fbd8..a27ab6afee 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2538,6 +2538,8 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
     "              [,processor-id=%d]\n"
     "                specify SMBIOS type 4 fields\n"
+    "-smbios type=8[,external_reference=str][,internal_reference=str][,connector_type=%d][,port_type=%d]\n"
+    "                specify SMBIOS type 8 fields\n"
     "-smbios type=11[,value=str][,path=filename]\n"
     "                specify SMBIOS type 11 fields\n"
     "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
-- 
2.36.1


