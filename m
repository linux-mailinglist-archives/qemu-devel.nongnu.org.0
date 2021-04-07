Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED2D3573E3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 20:05:50 +0200 (CEST)
Received: from localhost ([::1]:44424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCYn-0005sT-J6
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 14:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUCMo-0000Ja-WB
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:53:27 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUCMm-000527-JU
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:53:26 -0400
Received: by mail-ed1-x536.google.com with SMTP id m3so12101129edv.5
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oWpLJfHMn2RAtJSkAT5BHTjoDVB9WH4yRIEO9hGAFkc=;
 b=XsAQRNuF2lEv9a+QlVnPxPAoFoxk3xIePfvVYdE1kqz8S8+s+mqTzSF48kBeUP1VUi
 NLYAkahUKTOuifazBkFiOp3NV/SZb1DRz1pP7Q7Al9sklhEOfKAk3LIyXSl6zKOB5/AG
 z/CjsWSqw2+iGlfi/AT+Wf9dj9GimlRpNc+cUB+XSbnoX/ZAczoUxWVdsML8DL3edKh6
 iBY2I6vfMui3q8RrYNzOzZtCkXNWlmTcNp8hGqI/K5y7EqmAYUGX2phZ95rlqxRaVcGQ
 h1HYeWhZ2JyuQ1TmbGTHsWJ3u/qfm4HUg1YproyP97QiHXCsZbgRwAZa/p3EcR5Ok7ME
 vO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oWpLJfHMn2RAtJSkAT5BHTjoDVB9WH4yRIEO9hGAFkc=;
 b=oHRLobvFBikaZNw8RLE2/PfSeYknRm0h/6LGrL1aM4+RrUt55dcC4sjpPlJsLm1Zyf
 xrsIv3svo/2kFnfZc+ebBCSDyFazxh4h2Go9BuoYmlC275btK0J7W9BetC7LukdJOaLB
 +YwgKv+/qGeVgyun72O5l1BJhHRtXGoFsx/W1aJbYAzndxvo9LCDCrWemy7AIIhj+0FB
 VdjZguK8x71Z69Zk1LXMXUuGbIS+x9y47+GUI272oM2BlDGMZz0ovNF09yqO2hUDdi9z
 D2332u3d6Et26lTBYWQkiuyEARG2rfceMg+Zssgq4f9/Ld4sJgRxgUfMmNhGQKVTsu6k
 twGA==
X-Gm-Message-State: AOAM532g3x/tNEqJBjOyPwAy4BtqYBH0UisoBDqAu1g5IjZUe2o9DEV6
 d0Dum3SYCk/Rg0LlPboF9UwJDBTCu2d1cQ==
X-Google-Smtp-Source: ABdhPJywUpd61LjoEuKCDbbK5OorXnJ+j+o48e0zCUE4odQ1ASqdweTTpR1rFufp073X819uBFiT4w==
X-Received: by 2002:a50:a699:: with SMTP id e25mr5887263edc.276.1617818002816; 
 Wed, 07 Apr 2021 10:53:22 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id um13sm6551324ejb.84.2021.04.07.10.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 10:53:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 3/3] hw/sparc/sun4m: Make sun4m_hwdefs a
 Sun4mMachineClass field
Date: Wed,  7 Apr 2021 19:53:05 +0200
Message-Id: <20210407175305.1771069-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407175305.1771069-1-f4bug@amsat.org>
References: <20210407175305.1771069-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

Add a reference to sun4m_hwdefs in Sun4mMachineClass.
Set this new field in sun4m_machine_class_common_init(),
our QOM class_init() handler.

Since sun4m_hwdefs is now accessible from the MachineState,
we can simplify sun4m_hw_init() which become our unique
machine class_init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/sun4m.c | 108 +++++++++++++++--------------------------------
 1 file changed, 34 insertions(+), 74 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index a0d0624e41b..fab56ab3e56 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -111,6 +111,7 @@ struct Sun4mMachineClass {
     /*< private >*/
     MachineClass parent_obj;
     /*< public >*/
+    const struct sun4m_hwdef *hwdef;
 };
 typedef struct Sun4mMachineClass Sun4mMachineClass;
 
@@ -847,9 +848,9 @@ static void dummy_fdc_tc(void *opaque, int irq, int level)
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
@@ -1373,77 +1374,28 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
     },
 };
 
-/* SPARCstation 5 hardware initialisation */
-static void ss5_init(MachineState *machine)
+static void sun4m_machine_class_common_init(MachineClass *mc,
+                                            const struct sun4m_hwdef *hwdef)
 {
-    sun4m_hw_init(&sun4m_hwdefs[0], machine);
-}
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
-/* SPARCstation 10 hardware initialisation */
-static void ss10_init(MachineState *machine)
-{
-    sun4m_hw_init(&sun4m_hwdefs[1], machine);
-}
-
-/* SPARCserver 600MP hardware initialisation */
-static void ss600mp_init(MachineState *machine)
-{
-    sun4m_hw_init(&sun4m_hwdefs[2], machine);
-}
-
-/* SPARCstation 20 hardware initialisation */
-static void ss20_init(MachineState *machine)
-{
-    sun4m_hw_init(&sun4m_hwdefs[3], machine);
-}
-
-/* SPARCstation Voyager hardware initialisation */
-static void vger_init(MachineState *machine)
-{
-    sun4m_hw_init(&sun4m_hwdefs[4], machine);
-}
-
-/* SPARCstation LX hardware initialisation */
-static void ss_lx_init(MachineState *machine)
-{
-    sun4m_hw_init(&sun4m_hwdefs[5], machine);
-}
-
-/* SPARCstation 4 hardware initialisation */
-static void ss4_init(MachineState *machine)
-{
-    sun4m_hw_init(&sun4m_hwdefs[6], machine);
-}
-
-/* SPARCClassic hardware initialisation */
-static void scls_init(MachineState *machine)
-{
-    sun4m_hw_init(&sun4m_hwdefs[7], machine);
-}
-
-/* SPARCbook hardware initialisation */
-static void sbook_init(MachineState *machine)
-{
-    sun4m_hw_init(&sun4m_hwdefs[8], machine);
-}
-
-static void sun4m_machine_class_common_init(MachineClass *mc)
-{
+    mc->init = sun4m_hw_init;
     mc->block_default_type = IF_SCSI;
     mc->default_boot_order = "c";
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = hwdef;
 }
 
+/* SPARCstation 5 hardware initialisation */
 static void ss5_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Sun4m platform, SPARCstation 5";
-    mc->init = ss5_init;
     mc->is_default = true;
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    sun4m_machine_class_common_init(mc);
+    sun4m_machine_class_common_init(mc, &sun4m_hwdefs[0]);
 }
 
 static const TypeInfo ss5_type = {
@@ -1452,15 +1404,16 @@ static const TypeInfo ss5_type = {
     .class_init = ss5_class_init,
 };
 
+/* SPARCstation 10 hardware initialisation */
+
 static void ss10_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Sun4m platform, SPARCstation 10";
-    mc->init = ss10_init;
     mc->max_cpus = 4;
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    sun4m_machine_class_common_init(mc);
+    sun4m_machine_class_common_init(mc, &sun4m_hwdefs[1]);
 }
 
 static const TypeInfo ss10_type = {
@@ -1469,15 +1422,16 @@ static const TypeInfo ss10_type = {
     .class_init = ss10_class_init,
 };
 
+/* SPARCserver 600MP hardware initialisation */
+
 static void ss600mp_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Sun4m platform, SPARCserver 600MP";
-    mc->init = ss600mp_init;
     mc->max_cpus = 4;
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    sun4m_machine_class_common_init(mc);
+    sun4m_machine_class_common_init(mc, &sun4m_hwdefs[2]);
 }
 
 static const TypeInfo ss600mp_type = {
@@ -1486,15 +1440,16 @@ static const TypeInfo ss600mp_type = {
     .class_init = ss600mp_class_init,
 };
 
+/* SPARCstation 20 hardware initialisation */
+
 static void ss20_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Sun4m platform, SPARCstation 20";
-    mc->init = ss20_init;
     mc->max_cpus = 4;
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    sun4m_machine_class_common_init(mc);
+    sun4m_machine_class_common_init(mc, &sun4m_hwdefs[3]);
 }
 
 static const TypeInfo ss20_type = {
@@ -1503,14 +1458,15 @@ static const TypeInfo ss20_type = {
     .class_init = ss20_class_init,
 };
 
+/* SPARCstation Voyager hardware initialisation */
+
 static void voyager_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Sun4m platform, SPARCstation Voyager";
-    mc->init = vger_init;
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    sun4m_machine_class_common_init(mc);
+    sun4m_machine_class_common_init(mc, &sun4m_hwdefs[4]);
 }
 
 static const TypeInfo voyager_type = {
@@ -1519,14 +1475,15 @@ static const TypeInfo voyager_type = {
     .class_init = voyager_class_init,
 };
 
+/* SPARCstation LX hardware initialisation */
+
 static void ss_lx_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Sun4m platform, SPARCstation LX";
-    mc->init = ss_lx_init;
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    sun4m_machine_class_common_init(mc);
+    sun4m_machine_class_common_init(mc, &sun4m_hwdefs[5]);
 }
 
 static const TypeInfo ss_lx_type = {
@@ -1535,14 +1492,15 @@ static const TypeInfo ss_lx_type = {
     .class_init = ss_lx_class_init,
 };
 
+/* SPARCstation 4 hardware initialisation */
+
 static void ss4_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Sun4m platform, SPARCstation 4";
-    mc->init = ss4_init;
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    sun4m_machine_class_common_init(mc);
+    sun4m_machine_class_common_init(mc, &sun4m_hwdefs[6]);
 }
 
 static const TypeInfo ss4_type = {
@@ -1551,14 +1509,15 @@ static const TypeInfo ss4_type = {
     .class_init = ss4_class_init,
 };
 
+/* SPARCClassic hardware initialisation */
+
 static void scls_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Sun4m platform, SPARCClassic";
-    mc->init = scls_init;
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    sun4m_machine_class_common_init(mc);
+    sun4m_machine_class_common_init(mc, &sun4m_hwdefs[7]);
 }
 
 static const TypeInfo scls_type = {
@@ -1567,14 +1526,15 @@ static const TypeInfo scls_type = {
     .class_init = scls_class_init,
 };
 
+/* SPARCbook hardware initialisation */
+
 static void sbook_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Sun4m platform, SPARCbook";
-    mc->init = sbook_init;
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    sun4m_machine_class_common_init(mc);
+    sun4m_machine_class_common_init(mc, &sun4m_hwdefs[8]);
 }
 
 static const TypeInfo sbook_type = {
-- 
2.26.3


