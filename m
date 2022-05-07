Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719E51E96A
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:21:45 +0200 (CEST)
Received: from localhost ([::1]:39582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPzs-0006ye-Aw
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPli-0005wN-EX; Sat, 07 May 2022 15:07:06 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:33919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlg-0001aN-N5; Sat, 07 May 2022 15:07:06 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-ed9ac77cbbso10560925fac.1; 
 Sat, 07 May 2022 12:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gei2OB85I43clXzsP6k10NUHL8FGav4LFxdv8uOXcWs=;
 b=Vfx/wrL/Wanx3y7kG+9M6kwl/56MAHYcdJ5/flAzFKsIpS8XK5e0soGWfesCoBnY+9
 o/3EM/gurfKTSXR5HNS3WyLbRZsPUTQ1wNonw/H9TITRZr73HXEyA+Ri41pOtLgZgWbV
 UB/OGzU6HgmcJwaxBJMECLjqC5u6TajrkOm8hnV7igjM/F15OPWw6/wGe+J5sTXA/4nX
 /o0hmKKF9lUDET9uTdoWim9Zi8CvtArDX7h4uumicoqN7fJJFtQXdSTWVbMs/6CAQUBa
 y2vVNkTzdcmZsH2eYKJq91k6eqsfEhoxMfNz1JV+n3NpDr0SaAV1Mg89Js3Cjqz1AKl7
 lVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gei2OB85I43clXzsP6k10NUHL8FGav4LFxdv8uOXcWs=;
 b=0VNhibxBQuFgpF/toK0fHZDW7jTH2i/aWiCC6U2uMRN+W/V77C6AWd+KNnjLVjXgmc
 4byxllZ71QajNqMysMvBylwHyoEWh40PNvqz2WN8N96nsbSwQ6fdAxWpKFoiQXg+9EV2
 cXiEG2vt9PcypthhXVDQisjhG9U5hvZUc0MYIBwCZ/iLUc//zSf5XCKod6yOT56GYx1C
 /udikTz+jSEhUMYN1N24mZOEMT0w5moDPnxq1EkcpqxVoeUR4CSBkYPYMDowpztOud82
 j+Ddsl+zLmctMs4yr0Aruy5l5HLpGjvfP/bHW5I0wNUhvXoLiC5Wzg1j/pZjaM4QN6PX
 BPHw==
X-Gm-Message-State: AOAM531LSkzBcSh41V/fSzVY0rooOoQgjyS8Za1oYQe2+FDm90iXk3rR
 S4lEFGB/BahNEh7Dqr6RvGrEHcBZTks=
X-Google-Smtp-Source: ABdhPJwMDQjTQiOnPgrJLrLdFNepIGM4+07jWWUISprj2ixseNhvbLFPWS/cSS3mY98ZKlMeezJ8Hw==
X-Received: by 2002:a05:6870:c348:b0:ed:f231:2b41 with SMTP id
 e8-20020a056870c34800b000edf2312b41mr6863186oak.23.1651950423404; 
 Sat, 07 May 2022 12:07:03 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:07:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 13/17] ppc/pnv: add pnv_phb_get_current_machine()
Date: Sat,  7 May 2022 16:06:20 -0300
Message-Id: <20220507190624.507419-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Add a simple helper to avoid hardcoding strcmp() comparisons all around
pnv_phb.c.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index cef6a57d50..e03062a494 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -20,6 +20,10 @@
 #include "sysemu/sysemu.h"
 
 
+#define PNV_MACHINE_POWER8    1
+#define PNV_MACHINE_POWER9    2
+#define PNV_MACHINE_POWER10   3
+
 static char *pnv_phb_get_chip_typename(void)
 {
     Object *qdev_machine = qdev_get_machine();
@@ -39,7 +43,7 @@ static char *pnv_phb_get_chip_typename(void)
     return g_steal_pointer(&chip_typename);
 }
 
-static void pnv_phb_instance_init(Object *obj)
+static int pnv_phb_get_current_machine(void)
 {
     g_autofree char *chip_typename = pnv_phb_get_chip_typename();
 
@@ -48,12 +52,31 @@ static void pnv_phb_instance_init(Object *obj)
      * a valid machine->cpu_type value.
      */
     if (!chip_typename) {
-        return;
+        return 0;
     }
 
     if (!strcmp(chip_typename, TYPE_PNV_CHIP_POWER8) ||
         !strcmp(chip_typename, TYPE_PNV_CHIP_POWER8E) ||
         !strcmp(chip_typename, TYPE_PNV_CHIP_POWER8NVL)) {
+        return PNV_MACHINE_POWER8;
+    } else if (!strcmp(chip_typename, TYPE_PNV_CHIP_POWER9)) {
+        return PNV_MACHINE_POWER9;
+    } else if (!strcmp(chip_typename, TYPE_PNV_CHIP_POWER10)) {
+        return PNV_MACHINE_POWER10;
+    }
+
+    return 0;
+}
+
+static void pnv_phb_instance_init(Object *obj)
+{
+    int pnv_current_machine = pnv_phb_get_current_machine();
+
+    if (pnv_current_machine == 0) {
+        return;
+    }
+
+    if (pnv_current_machine == PNV_MACHINE_POWER8) {
         pnv_phb3_instance_init(obj);
         return;
     }
@@ -63,25 +86,24 @@ static void pnv_phb_instance_init(Object *obj)
 
 static void pnv_phb_realize(DeviceState *dev, Error **errp)
 {
+    int pnv_current_machine = pnv_phb_get_current_machine();
     PnvPHB *phb = PNV_PHB(dev);
-    g_autofree char *chip_typename = pnv_phb_get_chip_typename();
 
-    g_assert(chip_typename != NULL);
+    g_assert(pnv_current_machine != 0);
 
-    if (!strcmp(chip_typename, TYPE_PNV_CHIP_POWER8) ||
-        !strcmp(chip_typename, TYPE_PNV_CHIP_POWER8E) ||
-        !strcmp(chip_typename, TYPE_PNV_CHIP_POWER8NVL)) {
+    if (pnv_current_machine == PNV_MACHINE_POWER8) {
         /* PnvPHB3 */
         phb->version = PHB_VERSION_3;
         pnv_phb3_realize(dev, errp);
         return;
     }
 
-    if (!strcmp(chip_typename, TYPE_PNV_CHIP_POWER9)) {
+    if (pnv_current_machine == PNV_MACHINE_POWER9) {
         phb->version = PHB_VERSION_4;
-    } else if (!strcmp(chip_typename, TYPE_PNV_CHIP_POWER10)) {
+    } else if (pnv_current_machine == PNV_MACHINE_POWER10) {
         phb->version = PHB_VERSION_5;
     } else {
+        g_autofree char *chip_typename = pnv_phb_get_chip_typename();
         error_setg(errp, "unknown PNV chip: %s", chip_typename);
         return;
     }
-- 
2.32.0


