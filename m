Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA44370EA9
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:58:07 +0200 (CEST)
Received: from localhost ([::1]:55028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldHI6-0001Ya-IO
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHF4-0008DQ-Q3
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:55:00 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHF2-0008Ei-Ge
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:54:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a4so3348397wrr.2
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 11:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ORJ6PHqBOe/8VvmzXQTX/7ZRHvZdsh6KqK7WDIrVMjo=;
 b=tXcYsUZup3iiuheqcts6Ut2kSlCjX08TYc9V6BD/CjS6zacJLtar/eovag8kP6l9hU
 /DXGn4XomtoQSJMvKZqR0lwXw96YiXMr/sv72SkBL2FxabrIJr6H29d8ik+Kr47xmFRS
 nDMu7E6HMHsF6oM0s3B0RqRAzqjvPaWkvtOyubcc4F2dBTGWe1b3fDPenS8Jx2e0auon
 YNvtYi9ToQkCkvxLPb34GYC3ACx1JdOLZd1Sk4YRAjbC89UWKidwyIK4wap0CMTITxcq
 qqg1iJSwpDmqJEHP/KBASjig5vaNeX2KSl60Q8pJDynPbuekmYIlSaGVLFDynBCStw2I
 fwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ORJ6PHqBOe/8VvmzXQTX/7ZRHvZdsh6KqK7WDIrVMjo=;
 b=HZQyU0g0bIseb9/XBMfNsKkLJigftbuuGm3Kk/Pfu+rlDuUkF7PjoeYov6TB/GPq2+
 eC6aLcP9KysVuEcEaZQYRN3RTORrIu7l4dYItu2UD03xcArsxUBg240kjTwFROWNBT0w
 G8OR2h7phP2nTjc3qwDQSIQYqGYJzQIgI2bVdvAOFjKWKowxaWUVrTVisz3oO00AKkqT
 tfXa58ttJyG0Y6ucmF1NYuMJEOxHtJBls6gz53RzgveS0B9MBz6lvZ7+i4adzfaLCx4m
 miXlounZgj/qgXCIYgFG4n6KGH+MeKAQLjxf6Ujn+1H13u/thr/yOkQyvbwwvqXfBHcP
 JqsA==
X-Gm-Message-State: AOAM533issek1arTOqOJkYYlBf1DVC8X1QwMjzxSOxMz7Z/NC6Po5qqp
 FBE1rEFdyTiqSVt0tktZkwEVOa8g6tr/gf0v
X-Google-Smtp-Source: ABdhPJzseWUTBUcjXNyd02rlEXfkSdIaDCNJ2CG9O79mkO294GlQv3I2H2E/oXofmerMt2AsW+K+cA==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr16919117wri.27.1619981693887; 
 Sun, 02 May 2021 11:54:53 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id a126sm6571126wmh.37.2021.05.02.11.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 11:54:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] hw/sparc/sun4m: Introduce Sun4mMachineClass
Date: Sun,  2 May 2021 20:54:37 +0200
Message-Id: <20210502185441.599980-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502185441.599980-1-f4bug@amsat.org>
References: <20210502185441.599980-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of passing the sun4m_hwdef structure via
machine_init(), store it into the MachineClass.

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


