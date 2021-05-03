Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A828371E8C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:27:00 +0200 (CEST)
Received: from localhost ([::1]:53190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcLT-0008LF-FG
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc8K-0001vu-Os
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:24 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc8I-0003yd-Oo
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:24 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m9so6383744wrx.3
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NSAUfhvZ8S+K3xT3LS2vCoaFcUxzcXCC2t65XqyqTdw=;
 b=H6GDBC4X4wjmY7GFvVGJz3aUZyrDxDM5gPJsZGDtai3t99ZY/t3EOGMUkQHL0RUdwU
 OSkdOuYuyBu400Bt1xnSGHu4zXd0kZq8pbp7gYVVTMyMiveLKXZFMrMmGuYzQBxLxaWr
 L9w24t7pXrpwkesc7Wwu2iTiA7BQ5CE3TCSj3sIVZ470h92mQngEW8mGv7CqK7wIKLcK
 N+9vRzAiW7raMQQB85pJB8etCfySSwT+XE7nYI9H5iOaTqxKyH0epBK8QpSlgrywx5mr
 FrUAhicBgZJ32rpanM/LQzuoo495yGkeTOBmAte3WaroXSVz3SU6zZezD8hwCtLHMW/F
 jc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NSAUfhvZ8S+K3xT3LS2vCoaFcUxzcXCC2t65XqyqTdw=;
 b=OsPkbTSDQFUZNDU73uibB9wMVO1VZUDDlpSPPi1QQN8p8Rnop32qrk2lhwPAWlOAp/
 ccWuBH6yKLUIweGEBgpjOqCQjevJgrD+dBGd883DQ42ooOGbQAKKwajT3OGygdDTJ57D
 eO4ytgKwMywObcPSmY6WeG0z0aN9h/+jGXoVIAQDtSChth4wnk6VKHXG2zJgDf72796j
 03+qdrtruTJVEji0AONdX1UnTgurUdbvh7dbvbmCq6QjaA0B7sE6r49nb5Epg91qlJBk
 orCSMr/VybjDY65deX3joaKH5/traNuwxU6uDESYwKJdcKp/EjWDN34MbGeY9ULcNAkU
 yJdw==
X-Gm-Message-State: AOAM531/szZbc36UV7aSr8EtdNkb0BjZxKWv1YeFT4g+RW4+3n0dJCr/
 qIBfKuON4rLcK118P6e5feFOiBuUYzph3Q==
X-Google-Smtp-Source: ABdhPJyhh7/gh/l1o0W5UuyE1IpMxhYcpiW0TiB4z1XD9ISiIiZTWbduLU6STLDiTywXTKrklCo1/w==
X-Received: by 2002:adf:f190:: with SMTP id h16mr23352942wro.221.1620062001062; 
 Mon, 03 May 2021 10:13:21 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id a2sm9699733wrn.13.2021.05.03.10.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:13:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] hw/sparc/sun4m: Factor out sun4m_machine_class_init()
Date: Mon,  3 May 2021 19:13:00 +0200
Message-Id: <20210503171303.822501-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503171303.822501-1-f4bug@amsat.org>
References: <20210503171303.822501-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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

Factor out the class_init code common to all machines
to sun4m_machine_class_init().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/sun4m.c | 103 ++++-------------------------------------------
 1 file changed, 8 insertions(+), 95 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index c2bc8a9fa50..56f927e66ca 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1374,58 +1374,15 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
     },
 };
 
-/* SPARCstation 5 hardware initialisation */
-static void ss5_init(MachineState *machine)
+static void sun4m_machine_class_init(ObjectClass *oc, void *data)
 {
-    sun4m_hw_init(machine);
-}
+    MachineClass *mc = MACHINE_CLASS(oc);
 
-/* SPARCstation 10 hardware initialisation */
-static void ss10_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
-
-/* SPARCserver 600MP hardware initialisation */
-static void ss600mp_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
-
-/* SPARCstation 20 hardware initialisation */
-static void ss20_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
-
-/* SPARCstation Voyager hardware initialisation */
-static void vger_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
-
-/* SPARCstation LX hardware initialisation */
-static void ss_lx_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
-
-/* SPARCstation 4 hardware initialisation */
-static void ss4_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
-
-/* SPARCClassic hardware initialisation */
-static void scls_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
-
-/* SPARCbook hardware initialisation */
-static void sbook_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
+    mc->init = sun4m_hw_init;
+    mc->block_default_type = IF_SCSI;
+    mc->default_boot_order = "c";
+    mc->default_display = "tcx";
+    mc->default_ram_id = "sun4m.ram";
 }
 
 static void ss5_class_init(ObjectClass *oc, void *data)
@@ -1434,13 +1391,8 @@ static void ss5_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 5";
-    mc->init = ss5_init;
-    mc->block_default_type = IF_SCSI;
     mc->is_default = true;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[0];
 }
 
@@ -1456,13 +1408,8 @@ static void ss10_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 10";
-    mc->init = ss10_init;
-    mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[1];
 }
 
@@ -1478,13 +1425,8 @@ static void ss600mp_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCserver 600MP";
-    mc->init = ss600mp_init;
-    mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[2];
 }
 
@@ -1500,13 +1442,8 @@ static void ss20_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 20";
-    mc->init = ss20_init;
-    mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[3];
 }
 
@@ -1522,12 +1459,7 @@ static void voyager_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation Voyager";
-    mc->init = vger_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[4];
 }
 
@@ -1543,12 +1475,7 @@ static void ss_lx_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation LX";
-    mc->init = ss_lx_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[5];
 }
 
@@ -1564,12 +1491,7 @@ static void ss4_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 4";
-    mc->init = ss4_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[6];
 }
 
@@ -1585,12 +1507,7 @@ static void scls_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCClassic";
-    mc->init = scls_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[7];
 }
 
@@ -1606,12 +1523,7 @@ static void sbook_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCbook";
-    mc->init = sbook_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[8];
 }
 
@@ -1626,6 +1538,7 @@ static const TypeInfo sun4m_machine_types[] = {
         .name           = TYPE_SUN4M_MACHINE,
         .parent         = TYPE_MACHINE,
         .class_size     = sizeof(Sun4mMachineClass),
+        .class_init     = sun4m_machine_class_init,
         .abstract       = true,
     }
 };
-- 
2.26.3


