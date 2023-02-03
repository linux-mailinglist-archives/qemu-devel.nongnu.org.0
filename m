Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE9268A485
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:18:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3Qi-0000Rd-0w; Fri, 03 Feb 2023 16:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO3Qf-0000R6-J6
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:17:05 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO3Qc-0006DH-CZ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:17:05 -0500
Received: by mail-ej1-x636.google.com with SMTP id bk15so18821308ejb.9
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 13:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a2uXg8XoMZ8aMM9jJ01oWwU/ZFn0K1xYTZ/1sFSnM6U=;
 b=VzOjLJ2JapFjARD3m5kQQyJ+ElhfxrVdZJOTZXRQ3pvW77yGJZvkBjDtN+/Nlbczh5
 hwa5tUHemDz0nVLkhsUel00N0Kz5oF7/qoOoRqA15Atl8FVUE+8G2EjMGwfXe8iWBI+v
 0DTxAZiYJUkWVS3qedraNS/oqviqH/Ii0Q85Tw8kjf6ThqkFLPj2YukJHytkpEB+Od+1
 dT6tmIlnaCIkbn7a/5tCl2/SKdfHlyufpHx0BErca6dbcOsxq/1Y7XlDfrHG4aC4eILm
 WoB1dtDbWg+gqHgg9N0AS+7vQCTDlTSuy0bSf2XbMp12w671Zbz6o8JBTTsMJb6D1Etg
 AgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a2uXg8XoMZ8aMM9jJ01oWwU/ZFn0K1xYTZ/1sFSnM6U=;
 b=bJfrte8GodJiLG5r9Abryd8IYdd/Q918vCVLMKP0KWK3DwVCOPDj+4R/NELloiRNL0
 tbDJqzFKSdfRJXXn9CGSuodoP+75TRb+emCVhK8yVIl3gZTxVXjPZrOZ0Kz9xBwd+Nal
 f4qC4K94kmjxzDrSb6oAfWyU1ShtvKhlHMfJPIf3OH4IzrB+nbEUgchbtCw+qsdfOWMg
 ARuccaYNRTihZP9lfQRTKGlBYyRSUuOsEZtvOSNWd9EV+YXnGbCnwIEMv9vgMPB4NHXd
 V7vOxHzaKbIxdAzH5Mi/CnsIRNH8O1/QAcUuiuvUMubUm3/MHcelvBOqgV1QESOBudv0
 UD2A==
X-Gm-Message-State: AO0yUKW5QxWKgPflj5iBByvnM0Aq4Btx9EFY34Dymi/pxtNUi0JivpFY
 DJPqM1jFIuChSma9tehGFYeTD+pmvM97nkR+
X-Google-Smtp-Source: AK7set+9g32MUT/Rd+S0BPEWKtaz8L1/S6QXAv+r5DMGQvKPJOrzBpKzm72kyTThMslbaL0cpDaLrQ==
X-Received: by 2002:a17:906:5ace:b0:879:ab3:2864 with SMTP id
 x14-20020a1709065ace00b008790ab32864mr11298528ejs.24.1675459021314; 
 Fri, 03 Feb 2023 13:17:01 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 lx21-20020a170906af1500b0084f7d38713esm1878839ejb.108.2023.02.03.13.16.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 13:17:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/5] hw/ppc/pnv: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 22:16:23 +0100
Message-Id: <20230203211623.50930-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203211623.50930-1-philmd@linaro.org>
References: <20230203211623.50930-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

One call in pnv_psi_power8_realize() propagate the
Error* argument:

  if (!object_property_set_int(OBJECT(ics), "nr-irqs",
                               PSI_NUM_INTERRUPTS, errp)) {
      return;
  }

TYPE_ICS "nr-irqs" is declared in ics_properties[],
itself always registered in ics_class_init(); so converting
this errp to &error_abort is safe.

All other calls use either errp=&error_abort or &error_fatal,
so converting to the QDev API is almost a no-op (QDev API
always uses &error_abort).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/pnv_xive.c         | 11 ++++------
 hw/intc/pnv_xive2.c        | 15 +++++---------
 hw/pci-host/pnv_phb3.c     |  9 +++------
 hw/pci-host/pnv_phb4.c     |  4 ++--
 hw/pci-host/pnv_phb4_pec.c | 10 +++-------
 hw/ppc/pnv.c               | 41 ++++++++++++++++----------------------
 hw/ppc/pnv_psi.c           | 10 +++-------
 7 files changed, 37 insertions(+), 63 deletions(-)

diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 622f9d28b7..ccc1ea5380 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -1857,17 +1857,14 @@ static void pnv_xive_realize(DeviceState *dev, Error **errp)
      * resized dynamically when the controller is configured by the FW
      * to limit accesses to resources not provisioned.
      */
-    object_property_set_int(OBJECT(xsrc), "nr-irqs", PNV_XIVE_NR_IRQS,
-                            &error_fatal);
-    object_property_set_link(OBJECT(xsrc), "xive", OBJECT(xive), &error_abort);
+    qdev_prop_set_uint32(DEVICE(xsrc), "nr-irqs", PNV_XIVE_NR_IRQS);
+    qdev_prop_set_link(DEVICE(xsrc), "xive", OBJECT(xive));
     if (!qdev_realize(DEVICE(xsrc), NULL, errp)) {
         return;
     }
 
-    object_property_set_int(OBJECT(end_xsrc), "nr-ends", PNV_XIVE_NR_ENDS,
-                            &error_fatal);
-    object_property_set_link(OBJECT(end_xsrc), "xive", OBJECT(xive),
-                             &error_abort);
+    qdev_prop_set_uint32(DEVICE(end_xsrc), "nr-ends", PNV_XIVE_NR_ENDS);
+    qdev_prop_set_link(DEVICE(end_xsrc), "xive", OBJECT(xive));
     if (!qdev_realize(DEVICE(end_xsrc), NULL, errp)) {
         return;
     }
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index 7176d70234..d7695f65e7 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -1821,22 +1821,17 @@ static void pnv_xive2_realize(DeviceState *dev, Error **errp)
      * resized dynamically when the controller is configured by the FW
      * to limit accesses to resources not provisioned.
      */
-    object_property_set_int(OBJECT(xsrc), "flags", XIVE_SRC_STORE_EOI,
-                            &error_fatal);
-    object_property_set_int(OBJECT(xsrc), "nr-irqs", PNV_XIVE2_NR_IRQS,
-                            &error_fatal);
-    object_property_set_link(OBJECT(xsrc), "xive", OBJECT(xive),
-                             &error_fatal);
+    qdev_prop_set_uint64(DEVICE(xsrc), "flags", XIVE_SRC_STORE_EOI);
+    qdev_prop_set_uint32(DEVICE(xsrc), "nr-irqs", PNV_XIVE2_NR_IRQS);
+    qdev_prop_set_link(DEVICE(xsrc), "xive", OBJECT(xive));
     qdev_realize(DEVICE(xsrc), NULL, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
     }
 
-    object_property_set_int(OBJECT(end_xsrc), "nr-ends", PNV_XIVE2_NR_ENDS,
-                            &error_fatal);
-    object_property_set_link(OBJECT(end_xsrc), "xive", OBJECT(xive),
-                             &error_abort);
+    qdev_prop_set_uint32(DEVICE(end_xsrc), "nr-ends", PNV_XIVE2_NR_ENDS);
+    qdev_prop_set_link(DEVICE(end_xsrc), "xive", OBJECT(xive));
     qdev_realize(DEVICE(end_xsrc), NULL, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 7a21497cf8..6da9053ffa 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1029,8 +1029,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
     /* LSI sources */
     object_property_set_link(OBJECT(&phb->lsis), "xics", OBJECT(pnv),
                              &error_abort);
-    object_property_set_int(OBJECT(&phb->lsis), "nr-irqs", PNV_PHB3_NUM_LSI,
-                            &error_abort);
+    qdev_prop_set_uint32(DEVICE(&phb->lsis), "nr-irqs", PNV_PHB3_NUM_LSI);
     if (!qdev_realize(DEVICE(&phb->lsis), NULL, errp)) {
         return;
     }
@@ -1046,15 +1045,13 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
                              &error_abort);
     object_property_set_link(OBJECT(&phb->msis), "xics", OBJECT(pnv),
                              &error_abort);
-    object_property_set_int(OBJECT(&phb->msis), "nr-irqs", PHB3_MAX_MSI,
-                            &error_abort);
+    qdev_prop_set_uint32(DEVICE(&phb->msis), "nr-irqs", PHB3_MAX_MSI);
     if (!qdev_realize(DEVICE(&phb->msis), NULL, errp)) {
         return;
     }
 
     /* Power Bus Common Queue */
-    object_property_set_link(OBJECT(&phb->pbcq), "phb", OBJECT(phb),
-                             &error_abort);
+    qdev_prop_set_link(DEVICE(&phb->pbcq), "phb", OBJECT(phb));
     if (!qdev_realize(DEVICE(&phb->pbcq), NULL, errp)) {
         return;
     }
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index ccbde841fc..c4e7cb0efe 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1583,8 +1583,8 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     } else {
         nr_irqs = PNV_PHB4_MAX_INTs >> 1;
     }
-    object_property_set_int(OBJECT(xsrc), "nr-irqs", nr_irqs, &error_fatal);
-    object_property_set_link(OBJECT(xsrc), "xive", OBJECT(phb), &error_fatal);
+    qdev_prop_set_uint32(DEVICE(xsrc), "nr-irqs", nr_irqs);
+    qdev_prop_set_link(DEVICE(xsrc), "xive", OBJECT(phb));
     if (!qdev_realize(DEVICE(xsrc), NULL, errp)) {
         return;
     }
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 43267a428f..9c21382330 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -120,13 +120,9 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
     int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
 
     object_property_add_child(OBJECT(pec), "phb[*]", OBJECT(phb));
-    object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
-                             &error_abort);
-    object_property_set_int(OBJECT(phb), "chip-id", pec->chip_id,
-                            &error_fatal);
-    object_property_set_int(OBJECT(phb), "index", phb_id,
-                            &error_fatal);
-
+    qdev_prop_set_link(DEVICE(phb), "pec", OBJECT(pec));
+    qdev_prop_set_uint32(DEVICE(phb), "chip-id", pec->chip_id);
+    qdev_prop_set_uint32(DEVICE(phb), "index", phb_id);
     if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
         return;
     }
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 44b1fbbc93..7c6d5e4320 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -954,35 +954,31 @@ static void pnv_init(MachineState *machine)
     pnv->chips = g_new0(PnvChip *, pnv->num_chips);
     for (i = 0; i < pnv->num_chips; i++) {
         char chip_name[32];
-        Object *chip = OBJECT(qdev_new(chip_typename));
+        DeviceState *chip = qdev_new(chip_typename);
         uint64_t chip_ram_size =  pnv_chip_get_ram_size(pnv, i);
 
         pnv->chips[i] = PNV_CHIP(chip);
 
+        snprintf(chip_name, sizeof(chip_name), "chip[%d]", i);
+        object_property_add_child(OBJECT(pnv), chip_name, OBJECT(chip));
+
         /* Distribute RAM among the chips  */
-        object_property_set_int(chip, "ram-start", chip_ram_start,
-                                &error_fatal);
-        object_property_set_int(chip, "ram-size", chip_ram_size,
-                                &error_fatal);
+        qdev_prop_set_uint64(chip, "ram-start", chip_ram_start);
+        qdev_prop_set_uint64(chip, "ram-size", chip_ram_size);
         chip_ram_start += chip_ram_size;
 
-        snprintf(chip_name, sizeof(chip_name), "chip[%d]", i);
-        object_property_add_child(OBJECT(pnv), chip_name, chip);
-        object_property_set_int(chip, "chip-id", i, &error_fatal);
-        object_property_set_int(chip, "nr-cores", machine->smp.cores,
-                                &error_fatal);
-        object_property_set_int(chip, "nr-threads", machine->smp.threads,
-                                &error_fatal);
+        qdev_prop_set_uint32(chip, "chip-id", i);
+        qdev_prop_set_uint32(chip, "nr-cores", machine->smp.cores);
+        qdev_prop_set_uint32(chip, "nr-threads", machine->smp.threads);
         /*
          * The POWER8 machine use the XICS interrupt interface.
          * Propagate the XICS fabric to the chip and its controllers.
          */
         if (object_dynamic_cast(OBJECT(pnv), TYPE_XICS_FABRIC)) {
-            object_property_set_link(chip, "xics", OBJECT(pnv), &error_abort);
+            qdev_prop_set_link(chip, "xics", OBJECT(pnv));
         }
         if (object_dynamic_cast(OBJECT(pnv), TYPE_XIVE_FABRIC)) {
-            object_property_set_link(chip, "xive-fabric", OBJECT(pnv),
-                                     &error_abort);
+            qdev_prop_set_link(chip, "xive-fabric", OBJECT(pnv));
         }
         sysbus_realize_and_unref(SYS_BUS_DEVICE(chip), &error_fatal);
     }
@@ -1492,7 +1488,7 @@ static void pnv_chip_quad_realize_one(PnvChip *chip, PnvQuad *eq,
                                        sizeof(*eq), TYPE_PNV_QUAD,
                                        &error_fatal, NULL);
 
-    object_property_set_int(OBJECT(eq), "quad-id", core_id, &error_fatal);
+    qdev_prop_set_uint32(DEVICE(eq), "quad-id", core_id);
     qdev_realize(DEVICE(eq), NULL, &error_fatal);
 }
 
@@ -1969,16 +1965,13 @@ static void pnv_chip_core_realize(PnvChip *chip, Error **errp)
         snprintf(core_name, sizeof(core_name), "core[%d]", core_hwid);
         object_property_add_child(OBJECT(chip), core_name, OBJECT(pnv_core));
         chip->cores[i] = pnv_core;
-        object_property_set_int(OBJECT(pnv_core), "nr-threads",
-                                chip->nr_threads, &error_fatal);
+        qdev_prop_set_uint32(DEVICE(pnv_core), "nr-threads", chip->nr_threads);
         object_property_set_int(OBJECT(pnv_core), CPU_CORE_PROP_CORE_ID,
                                 core_hwid, &error_fatal);
-        object_property_set_int(OBJECT(pnv_core), "pir",
-                                pcc->core_pir(chip, core_hwid), &error_fatal);
-        object_property_set_int(OBJECT(pnv_core), "hrmor", pnv->fw_load_addr,
-                                &error_fatal);
-        object_property_set_link(OBJECT(pnv_core), "chip", OBJECT(chip),
-                                 &error_abort);
+        qdev_prop_set_uint32(DEVICE(pnv_core), "pir",
+                             pcc->core_pir(chip, core_hwid));
+        qdev_prop_set_uint64(DEVICE(pnv_core), "hrmor", pnv->fw_load_addr);
+        qdev_prop_set_link(DEVICE(pnv_core), "chip", OBJECT(chip));
         qdev_realize(DEVICE(pnv_core), NULL, &error_fatal);
 
         /* Each core has an XSCOM MMIO region */
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 8aa09ab26b..fb90d47138 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -492,10 +492,7 @@ static void pnv_psi_power8_realize(DeviceState *dev, Error **errp)
     unsigned int i;
 
     /* Create PSI interrupt control source */
-    if (!object_property_set_int(OBJECT(ics), "nr-irqs", PSI_NUM_INTERRUPTS,
-                                 errp)) {
-        return;
-    }
+    qdev_prop_set_uint32(DEVICE(ics), "nr-irqs", PSI_NUM_INTERRUPTS);
     if (!qdev_realize(DEVICE(ics), NULL, errp)) {
         return;
     }
@@ -849,9 +846,8 @@ static void pnv_psi_power9_realize(DeviceState *dev, Error **errp)
     XiveSource *xsrc = &PNV9_PSI(psi)->source;
     int i;
 
-    object_property_set_int(OBJECT(xsrc), "nr-irqs", PSIHB9_NUM_IRQS,
-                            &error_fatal);
-    object_property_set_link(OBJECT(xsrc), "xive", OBJECT(psi), &error_abort);
+    qdev_prop_set_uint32(DEVICE(xsrc), "nr-irqs", PSIHB9_NUM_IRQS);
+    qdev_prop_set_link(DEVICE(xsrc), "xive", OBJECT(psi));
     if (!qdev_realize(DEVICE(xsrc), NULL, errp)) {
         return;
     }
-- 
2.38.1


