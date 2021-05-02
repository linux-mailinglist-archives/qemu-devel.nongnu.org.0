Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F14E370EB2
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 21:01:26 +0200 (CEST)
Received: from localhost ([::1]:34422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldHLJ-0004fY-C5
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 15:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHF8-0008EI-MW
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:55:02 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHF6-0008GZ-9h
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:55:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x5so3306844wrv.13
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yF+3uGpjysT1HviFnkbcw6nMCr/LSI0PjwhjHOnIHGg=;
 b=BEBaAdFThGNA9MEJYcFmjrOPmoS9KQ56T5Ahml3uLfXK1nxHxLoWp5Y+Sz4Jl7WMxz
 bmaYKc2SsPphsxL/LuVqVZU01D4sC4pwN4c0cOREx7EN+cxQyiQCOWF97ZYv2A4R2ruy
 w8lXxNDqEGLQVTc61ht+JA9o1yKmx7iD+27GumfIznTODbTbM1n6jEJc72HWIXxMxTJ8
 u6y35IM9BNVkZfmtnxNsK9xHWXsCzXikgJZ8zemgAB8J4845yQ6ZEV2zTOyMERxahRi8
 9jXbyqI/XJhpnWbpXGCKc2XxWWyqd72am0++DEHzD9Wx4USiz0U6xubQP/Z6gA20+TW1
 s3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yF+3uGpjysT1HviFnkbcw6nMCr/LSI0PjwhjHOnIHGg=;
 b=awqrsZt+RPO3p0O30Idj07DDALwbfA1uikKq0q9uTR0DhoyPGJW+iLhB/CCAGlgfav
 HMlFQ/8gZNCm2Gedko4dKaL0RcTo6ltK1CawuhtvT6DLm7VbIt1HT6anLk0goK6POmRw
 dtO2zkuSw+9nttmnOt/hDaeeHReMkOJrmD6HPzlvyCOmIGnRFuWdYMrSKLYuc+EcTejB
 ILPUvYYv4mpjwPgLUVBrhDgwtBcM0o5A8i1obzwsZUdTJ39+D4fXgEJIga7SddtJdPWE
 Q1BrkxJH/4iqJR1NOe1/gLr0Y1Y4QdA6SHs53UAbdTbHQ3+0oF0muxWWExbp/KmLFTq0
 pspA==
X-Gm-Message-State: AOAM532IDhv+5pkSQNt8aea7u0kZQ/9RZS7c2mA7//7XkpkZ24ZJymaA
 gxZkm+/C0kX+NsSG6f7ANcDEfPfU6wmUPisk
X-Google-Smtp-Source: ABdhPJxIi3KEnCh+g7UFdHRLU2EUsVjHLJ+SWJZKJoSInUhVZgxCirehdHHbewos5OJRGI2mc4xRNQ==
X-Received: by 2002:a5d:544d:: with SMTP id w13mr2820223wrv.273.1619981698893; 
 Sun, 02 May 2021 11:54:58 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id a15sm9592312wrr.53.2021.05.02.11.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 11:54:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] hw/sparc/sun4m: Factor out sun4m_machine_class_init()
Date: Sun,  2 May 2021 20:54:38 +0200
Message-Id: <20210502185441.599980-4-f4bug@amsat.org>
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

Factor out the class_init code common to all machines
to sun4m_machine_class_init().

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


