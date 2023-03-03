Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865E16AA12B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 22:29:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYCxd-0004fM-NU; Fri, 03 Mar 2023 16:29:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pYCxV-0004eT-5B; Fri, 03 Mar 2023 16:28:57 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pYCxT-0002Av-Fh; Fri, 03 Mar 2023 16:28:56 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 l16-20020a9d4c10000000b006944b17058cso1980282otf.2; 
 Fri, 03 Mar 2023 13:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e2hLuQycBG78tqQ6+RVrdZ+HQFQHpWW0i15WIct5k54=;
 b=CcNg5GKww3Gy6HemY08TCL9LXaldG45gZun61v87zL15S3wBKanMNsRW+KNbc5TvcG
 Qd42xoACYkt3ZwxiwQrB1MJR965tvV6zibGg4bKZqlWekOhJRzhxujG6n6gY2ZFjDPZY
 0ICzEnOYmPuM0rItE0HG7JX29BgOfv0V6YWB6qcAzZUDW2wNK/zlk0y24eWJmRcC2cRJ
 ZgbA9UWRzrEk5DNVQHxazcb/qUsR2bDT6YZOeNPQ+Y7aftdo19bGifmBm3n+pjT4ay/l
 1TPpsYqrDTzqD0mw19mac/MfRizqlHsljDi/QJLCAkYm3q0KlT1OPNWp2WM8/GZvOYdu
 u8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2hLuQycBG78tqQ6+RVrdZ+HQFQHpWW0i15WIct5k54=;
 b=xq0hW5ioTpu+1Yc7PIybWkiSLxixnoaeerrJQXlU/ADMMazrEI5tj/OGvHaWY3N2/e
 iCLVSSAbMQjs8Nz8mJ05TYSv2cUzL208wsLiLpVCIj8lx8XD9ohmZWQV51k7N2++6gk4
 I3F42a3MzfJezgNaLmEiA7uWJCfGmykTtvKZi8Mlbc50jsOOHcfi2OZBri79xoBKdBd0
 ODC0HrFd+htEGHLR6nedtgItBgzY8ucEvG2ZUKUQEWkSHfuiuA8GuryCzd/nUIpOCtV7
 bk0gr59MWASW15rHlUzlblp0Ifm1ua1nZ4w4WcNGTVC0Ig14yDdQ9BCAwZSYCMTv2N/J
 yG0w==
X-Gm-Message-State: AO0yUKXE+OHPjZcuUvAZmDDVtZyRGldY0UkKzU0IbRKV3Xg2h2KTjsZk
 mNmTsTb4BUuFm4C7rRAulzqxBEYJZ0U=
X-Google-Smtp-Source: AK7set+fcz7kCyDBDuslRF9ZW04oLCetoYCf7RVXUlNHMDWI6YtqiGvgv005tvCEOkCgbglP4zR6cg==
X-Received: by 2002:a9d:62d:0:b0:693:bfc4:3eaf with SMTP id
 42-20020a9d062d000000b00693bfc43eafmr1168874otn.26.1677878933864; 
 Fri, 03 Mar 2023 13:28:53 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 k4-20020a0568301be400b0068d4649bedasm1473635otb.67.2023.03.03.13.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 13:28:53 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 5/5] pnv_phb4_pec: Simplify/align code to parent user-created
 PHBs
Date: Fri,  3 Mar 2023 18:28:31 -0300
Message-Id: <20230303212831.830278-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303212831.830278-1-danielhb413@gmail.com>
References: <20230303212831.830278-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Frederic Barrat <fbarrat@linux.ibm.com>

When instantiating a user-created PHB on P9/P10, we don't really have
a reason any more to go through an indirection in pnv_chip_add_phb()
in pnv.c, we can go straight to the right function in
pnv_phb4_pec.c. That way, default PHBs and user-created PHBs are all
handled in the same file.  This patch also renames pnv_phb4_get_pec()
to pnv_pec_add_phb() to better reflect that it "hooks" a PHB to a PEC.

For P8, the PHBs are parented to the chip directly, so it makes sense
to keep calling pnv_chip_add_phb() in pnv.c, to also be consistent
with where default PHBs are handled. The only change here is that,
since that function is now only used for P8, we can refine the return
type.

So overall, the PnvPHB front-end now has a pnv_phb_user_get_parent()
function which handles the parenting of the user-created PHBs by
calling the right function in the right file based on the processor
version. It's also easily extensible if we ever need to support a
different parent object.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20230302163715.129635-5-fbarrat@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c          | 11 ++++++++++-
 hw/pci-host/pnv_phb4_pec.c     |  3 ++-
 hw/ppc/pnv.c                   | 29 ++++++++---------------------
 include/hw/pci-host/pnv_phb4.h |  2 +-
 include/hw/ppc/pnv.h           |  2 +-
 5 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index c62b08538a..82332d7a05 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -62,6 +62,15 @@ static bool pnv_parent_fixup(Object *parent, BusState *parent_bus,
     return true;
 }
 
+static Object *pnv_phb_user_get_parent(PnvChip *chip, PnvPHB *phb, Error **errp)
+{
+    if (phb->version == 3) {
+        return OBJECT(pnv_chip_add_phb(chip, phb));
+    } else {
+        return OBJECT(pnv_pec_add_phb(chip, phb, errp));
+    }
+}
+
 /*
  * User created devices won't have the initial setup that default
  * devices have. This setup consists of assigning a parent device
@@ -79,7 +88,7 @@ static bool pnv_phb_user_device_init(PnvPHB *phb, Error **errp)
         return false;
     }
 
-    parent = pnv_chip_add_phb(chip, phb, errp);
+    parent = pnv_phb_user_get_parent(chip, phb, errp);
     if (!parent) {
         return false;
     }
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 6e2e5ae186..3b2850f7a3 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -112,7 +112,7 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb, Error **errp)
+PnvPhb4PecState *pnv_pec_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
 {
     PnvPhb4PecState *pecs = NULL;
     int chip_id = phb->chip_id;
@@ -141,6 +141,7 @@ PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb, Error **errp)
         for (j = 0; j < pec->num_phbs; j++) {
             if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
                 pec->phbs[j] = phb;
+                phb->pec = pec;
                 return pec;
             }
         }
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 46010b30ad..11cb48af2f 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -285,31 +285,18 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
 }
 
 /*
- * Adds a PnvPHB to the chip. Returns the parent obj of the
- * PHB which varies with each version (phb version 3 is parented
- * by the chip, version 4 and 5 are parented by the PEC
- * device).
- *
- * TODO: for version 3 we're still parenting the PHB with the
- * chip. We should parent with a (so far not implemented)
- * PHB3 PEC device.
+ * Adds a PnvPHB to the chip on P8.
+ * Implemented here, like for defaults PHBs
  */
-Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
+PnvChip *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb)
 {
-    if (phb->version == 3) {
-        Pnv8Chip *chip8 = PNV8_CHIP(chip);
-
-        phb->chip = chip;
-
-        chip8->phbs[chip8->num_phbs] = phb;
-        chip8->num_phbs++;
-
-        return OBJECT(chip);
-    }
+    Pnv8Chip *chip8 = PNV8_CHIP(chip);
 
-    phb->pec = pnv_phb4_get_pec(chip, phb, errp);
+    phb->chip = chip;
 
-    return OBJECT(phb->pec);
+    chip8->phbs[chip8->num_phbs] = phb;
+    chip8->num_phbs++;
+    return chip;
 }
 
 static void pnv_chip_power8_dt_populate(PnvChip *chip, void *fdt)
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 5c5edb2941..2d026db9a3 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -157,7 +157,7 @@ struct PnvPHB4 {
 
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
 int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
-PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb, Error **errp);
+PnvPhb4PecState *pnv_pec_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp);
 void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
 
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 96fb850419..409f3bf763 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -100,7 +100,7 @@ struct PnvMachineState {
 };
 
 PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id);
-Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp);
+PnvChip *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb);
 
 #define PNV_FDT_ADDR          0x01000000
 #define PNV_TIMEBASE_FREQ     512000000ULL
-- 
2.39.2


