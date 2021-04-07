Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D65A3573B6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:56:05 +0200 (CEST)
Received: from localhost ([::1]:45984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCPM-00036m-EP
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUCMj-0000Be-RX
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:53:22 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUCMh-0004zn-O9
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:53:21 -0400
Received: by mail-ed1-x532.google.com with SMTP id r22so9415324edq.9
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 10:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EyWTFFAUlShQplxLUre4Wbxf2t/EIZLRggDuT70Acx8=;
 b=lyHGb6/UuQi4hGlzeeHz7pzT9VcLaijPTSnx6yQ/03L+5LAoDJiW9z0b2gI4CurBKt
 VkfrX35KB7TAXa1OXepL/qSr19x7lHxQApPEJ2gLlx1kYA3b7+PU4lFYtf4zf4Hf0vqv
 jOTx+AwjHgBE11NYUBfm1tBiL589a8GA3JgGxXq3D2ilnO/TKB0RdJgNX31jYMita66O
 BolB9X5EiP1OIkl3KedSaKGarz8zkaU8Oat9IoSYboycqj0QXsAiZupN6i0UlSQlNfLD
 ij4dpYGPnW2NWQrefjP1zUxXx7q9foJ39zgnCz5dfy8wy91YXey1SVaogS805xakFm3N
 p2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EyWTFFAUlShQplxLUre4Wbxf2t/EIZLRggDuT70Acx8=;
 b=JujDX+b6VGIIMoJKaJ806AHhWUwsqpihRujlLPyv+wKHzUsBfF6qQ0A9vl0yMzOVVE
 9/Ocm6O/+6lKG5ophbuy0ZdN4Ta5b6r5gczT44etBAwgJDW/prNbyT2GwDsc+zM3kQRh
 Bggr/Je2WhvXBqjfGoEa47w79EQDFM9eZsoXIgMoThnrGwxWPdSfnVs2vUuNn5gLquJD
 xMKLy+wsKU6jsIuu1BTp6iVBOsjRn2XoZVPWj5dq8p/wUOPYNyPTEovBWAVzQNMmp5Qv
 aF+9aI0IP5/kANW0OBhGMVGySFbtl7UufMAe40Vc72yPMKEUSjgPvPs1s6TkLnAJnXs6
 OSVg==
X-Gm-Message-State: AOAM530rzpNJzlsrCt0KIeFyargU5g+jwkhdppyA29Eoj0/wrdDgaSD3
 VCxl8PBVYToemqI8opnrJcG1km40T0jUOA==
X-Google-Smtp-Source: ABdhPJzLmfF8+SCYnSaxcZ/rVN/L78sDPm7fpTi/X9rkVvyK7kO/vaDvWfryYAqNg2YCBEX+/xTIBw==
X-Received: by 2002:a05:6402:5113:: with SMTP id
 m19mr6053058edd.78.1617817997660; 
 Wed, 07 Apr 2021 10:53:17 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r19sm12921180ejr.55.2021.04.07.10.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 10:53:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 2/3] hw/sparc/sun4m: Factor out
 sun4m_machine_class_common_init()
Date: Wed,  7 Apr 2021 19:53:04 +0200
Message-Id: <20210407175305.1771069-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407175305.1771069-1-f4bug@amsat.org>
References: <20210407175305.1771069-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
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

Some MachineClass fields are common to all sun4m machines.
Factor setting these fields out in a common helper:
sun4m_machine_class_common_init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/sun4m.c | 53 ++++++++++++++++--------------------------------
 1 file changed, 17 insertions(+), 36 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 543a52a8fc8..a0d0624e41b 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1427,18 +1427,23 @@ static void sbook_init(MachineState *machine)
     sun4m_hw_init(&sun4m_hwdefs[8], machine);
 }
 
+static void sun4m_machine_class_common_init(MachineClass *mc)
+{
+    mc->block_default_type = IF_SCSI;
+    mc->default_boot_order = "c";
+    mc->default_display = "tcx";
+    mc->default_ram_id = "sun4m.ram";
+}
+
 static void ss5_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Sun4m platform, SPARCstation 5";
     mc->init = ss5_init;
-    mc->block_default_type = IF_SCSI;
     mc->is_default = true;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
+    sun4m_machine_class_common_init(mc);
 }
 
 static const TypeInfo ss5_type = {
@@ -1453,12 +1458,9 @@ static void ss10_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Sun4m platform, SPARCstation 10";
     mc->init = ss10_init;
-    mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
+    sun4m_machine_class_common_init(mc);
 }
 
 static const TypeInfo ss10_type = {
@@ -1473,12 +1475,9 @@ static void ss600mp_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Sun4m platform, SPARCserver 600MP";
     mc->init = ss600mp_init;
-    mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
+    sun4m_machine_class_common_init(mc);
 }
 
 static const TypeInfo ss600mp_type = {
@@ -1493,12 +1492,9 @@ static void ss20_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Sun4m platform, SPARCstation 20";
     mc->init = ss20_init;
-    mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
+    sun4m_machine_class_common_init(mc);
 }
 
 static const TypeInfo ss20_type = {
@@ -1513,11 +1509,8 @@ static void voyager_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Sun4m platform, SPARCstation Voyager";
     mc->init = vger_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
+    sun4m_machine_class_common_init(mc);
 }
 
 static const TypeInfo voyager_type = {
@@ -1532,11 +1525,8 @@ static void ss_lx_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Sun4m platform, SPARCstation LX";
     mc->init = ss_lx_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
+    sun4m_machine_class_common_init(mc);
 }
 
 static const TypeInfo ss_lx_type = {
@@ -1551,11 +1541,8 @@ static void ss4_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Sun4m platform, SPARCstation 4";
     mc->init = ss4_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
+    sun4m_machine_class_common_init(mc);
 }
 
 static const TypeInfo ss4_type = {
@@ -1570,11 +1557,8 @@ static void scls_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Sun4m platform, SPARCClassic";
     mc->init = scls_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
+    sun4m_machine_class_common_init(mc);
 }
 
 static const TypeInfo scls_type = {
@@ -1589,11 +1573,8 @@ static void sbook_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Sun4m platform, SPARCbook";
     mc->init = sbook_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
+    sun4m_machine_class_common_init(mc);
 }
 
 static const TypeInfo sbook_type = {
-- 
2.26.3


