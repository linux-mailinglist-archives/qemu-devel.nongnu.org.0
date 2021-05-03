Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AE1371E83
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:24:49 +0200 (CEST)
Received: from localhost ([::1]:44740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcJM-0004l6-2n
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc8I-0001qg-J5
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:22 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc8G-0003wc-K3
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id n205so2887299wmf.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VPdZzCfQsm6/ozIPjoRVe3c1QnbIfhcKwFX9/UMIFzg=;
 b=fut+/HAiqoODrUXgq/RoJrY1Xb/DiAF2MdM8xuG1aUNvDFNhoGBgylVZOp4IfNqAeN
 SczVnxT76GPHgQgT9Il9T9KLI0EjRinkOTnic/DdcjeoPnFqWZ2oEFPsxggSXJW1RW/w
 bW9BS03BQ7NXcAfMLqWN4YGqZwuaV7TaL4BH63CYWML7nqyIXR23nPzYO9HluWD95clm
 lW4mmoGSkU1+sZ94oAVUQB2ZFWdfqXhjNBDmOKrvsWk5vNGVXOnzemWUS5zJOiy48qV/
 qyIt3BQ0m1L+N3tXs27pTKh1k8h7zmOeY7e8YaeHHmZpmdxe+xukzrHLeCmNDjAM3OUC
 KcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VPdZzCfQsm6/ozIPjoRVe3c1QnbIfhcKwFX9/UMIFzg=;
 b=lfMikrTwzAaBcnqIleQTN4iQDX+uw570hnB4N37kbkWqSVOsmCFU+Skr8OzrUIqe6E
 tDQOF8ruAIJ1djsXjqQPDxzPtBTNtE4AGDZSLCmt7KvdqoLjMpg+sMBjOO66Hlrbw1dj
 A1qmQTBm1tCLJOI5F+O57Orxg0l7Xt6l12qsybYWkaJmkK4j4xov1QFEKxsfv4YhPusl
 O4hAkM0IqPgkxca3fiOyRBOucl/RLibFi6rUFRVAJjk2Lk0WOYpEXc6pFA6FY9njBVNV
 WzTmAQLJWNldjpv26qA4o/dXiYjj677aXnIhzQLYJSPIVorY/iNR/zkcItgYBmS9tOUH
 EnXg==
X-Gm-Message-State: AOAM530UgzJKS0xV14UZJ6WLB6cWQD44T5SsJ6zhcwl+1jpx/Izkhbat
 C3kPDK5C6beEHcGi24Fg4em24UbN9YqRtg==
X-Google-Smtp-Source: ABdhPJzjmwHxxPWrArEC8OelNYvWINKtYlAQWqhK8d4KMbanyXfjp4gjZvi10qyaHxA1PlhcOWr13Q==
X-Received: by 2002:a1c:f305:: with SMTP id q5mr33226011wmq.96.1620061996002; 
 Mon, 03 May 2021 10:13:16 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id h14sm16225580wrq.45.2021.05.03.10.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:13:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] hw/sparc/sun4m: Introduce Sun4mMachineClass
Date: Mon,  3 May 2021 19:12:59 +0200
Message-Id: <20210503171303.822501-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503171303.822501-1-f4bug@amsat.org>
References: <20210503171303.822501-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of passing the sun4m_hwdef structure via
machine_init(), store it into the MachineClass.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/sun4m.c | 50 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 9d07fa43d6a..c2bc8a9fa50 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -107,7 +107,16 @@ struct sun4m_hwdef {
     uint8_t nvram_machine_id;
 };
 
+struct Sun4mMachineClass {
+    /*< private >*/
+    MachineClass parent_obj;
+    /*< public >*/
+    const struct sun4m_hwdef *hwdef;
+};
+typedef struct Sun4mMachineClass Sun4mMachineClass;
+
 #define TYPE_SUN4M_MACHINE MACHINE_TYPE_NAME("sun4m-common")
+DECLARE_CLASS_CHECKERS(Sun4mMachineClass, SUN4M_MACHINE, TYPE_SUN4M_MACHINE)
 
 const char *fw_cfg_arch_key_name(uint16_t key)
 {
@@ -839,9 +848,9 @@ static void dummy_fdc_tc(void *opaque, int irq, int level)
 {
 }
 
-static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
-                          MachineState *machine)
+static void sun4m_hw_init(MachineState *machine)
 {
+    const struct sun4m_hwdef *hwdef = SUN4M_MACHINE_GET_CLASS(machine)->hwdef;
     DeviceState *slavio_intctl;
     unsigned int i;
     Nvram *nvram;
@@ -1368,60 +1377,61 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
 /* SPARCstation 5 hardware initialisation */
 static void ss5_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[0], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCstation 10 hardware initialisation */
 static void ss10_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[1], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCserver 600MP hardware initialisation */
 static void ss600mp_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[2], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCstation 20 hardware initialisation */
 static void ss20_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[3], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCstation Voyager hardware initialisation */
 static void vger_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[4], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCstation LX hardware initialisation */
 static void ss_lx_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[5], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCstation 4 hardware initialisation */
 static void ss4_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[6], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCClassic hardware initialisation */
 static void scls_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[7], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCbook hardware initialisation */
 static void sbook_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[8], machine);
+    sun4m_hw_init(machine);
 }
 
 static void ss5_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 5";
     mc->init = ss5_init;
@@ -1431,6 +1441,7 @@ static void ss5_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[0];
 }
 
 static const TypeInfo ss5_type = {
@@ -1442,6 +1453,7 @@ static const TypeInfo ss5_type = {
 static void ss10_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 10";
     mc->init = ss10_init;
@@ -1451,6 +1463,7 @@ static void ss10_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[1];
 }
 
 static const TypeInfo ss10_type = {
@@ -1462,6 +1475,7 @@ static const TypeInfo ss10_type = {
 static void ss600mp_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCserver 600MP";
     mc->init = ss600mp_init;
@@ -1471,6 +1485,7 @@ static void ss600mp_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[2];
 }
 
 static const TypeInfo ss600mp_type = {
@@ -1482,6 +1497,7 @@ static const TypeInfo ss600mp_type = {
 static void ss20_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 20";
     mc->init = ss20_init;
@@ -1491,6 +1507,7 @@ static void ss20_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[3];
 }
 
 static const TypeInfo ss20_type = {
@@ -1502,6 +1519,7 @@ static const TypeInfo ss20_type = {
 static void voyager_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation Voyager";
     mc->init = vger_init;
@@ -1510,6 +1528,7 @@ static void voyager_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[4];
 }
 
 static const TypeInfo voyager_type = {
@@ -1521,6 +1540,7 @@ static const TypeInfo voyager_type = {
 static void ss_lx_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation LX";
     mc->init = ss_lx_init;
@@ -1529,6 +1549,7 @@ static void ss_lx_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[5];
 }
 
 static const TypeInfo ss_lx_type = {
@@ -1540,6 +1561,7 @@ static const TypeInfo ss_lx_type = {
 static void ss4_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 4";
     mc->init = ss4_init;
@@ -1548,6 +1570,7 @@ static void ss4_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[6];
 }
 
 static const TypeInfo ss4_type = {
@@ -1559,6 +1582,7 @@ static const TypeInfo ss4_type = {
 static void scls_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCClassic";
     mc->init = scls_init;
@@ -1567,6 +1591,7 @@ static void scls_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[7];
 }
 
 static const TypeInfo scls_type = {
@@ -1578,6 +1603,7 @@ static const TypeInfo scls_type = {
 static void sbook_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCbook";
     mc->init = sbook_init;
@@ -1586,6 +1612,7 @@ static void sbook_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[8];
 }
 
 static const TypeInfo sbook_type = {
@@ -1598,6 +1625,7 @@ static const TypeInfo sun4m_machine_types[] = {
     {
         .name           = TYPE_SUN4M_MACHINE,
         .parent         = TYPE_MACHINE,
+        .class_size     = sizeof(Sun4mMachineClass),
         .abstract       = true,
     }
 };
-- 
2.26.3


