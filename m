Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5DA6AA132
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 22:30:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYCxW-0004eV-MV; Fri, 03 Mar 2023 16:28:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pYCxT-0004dz-1t; Fri, 03 Mar 2023 16:28:55 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pYCxQ-00028n-Bs; Fri, 03 Mar 2023 16:28:54 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 f19-20020a9d5f13000000b00693ce5a2f3eso2184927oti.8; 
 Fri, 03 Mar 2023 13:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKiIMFr9+ws6YEP2gd2oIPoymNkyJlWdH9Wu6UVIdlE=;
 b=BCaEfcH5LlXteKEXWvFd/UcIogrqYh2+BlaIWyuwGSxNJROANwPgMJQoOnpGHnLdla
 mpfshrmPicgrPc65VMgDFsZA252QMxOlVZQppi95bYi59AG2mEyVyQBWKwyBXeQbHxLV
 aAk+Cr87kEXcBHv7kwS4KMP1jBeKDsU793oUfwXcUdGAhIf9EzJqsOzxE+Y7xhGL00rZ
 8oFwkbAzTAEJnMCTpvAMr3i7CXFQUVAdPFiZSCg9jWNBl8YF6CjKwfMyWk9uuTpWqTm1
 wyoIv6YULrD8puv8Utk/Gdh49rdhkDrKzH6oNqssByXSuMtRGDLYq0EuCU0XxOZ+OilL
 bDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KKiIMFr9+ws6YEP2gd2oIPoymNkyJlWdH9Wu6UVIdlE=;
 b=qjqwqh+TcANyRqRBYXOtpgUhKq5djS1XCPKYYCbYesIvMPNbryJbXVQYYVBWcxxJju
 yNLKFIzPVK1ROrpE0k/KJP6CDAPAiTNrt6ueiu/jglqAdAPru0oIwyIym0UMIbjMSfBe
 A8RnXIr5kXzOo4zwMGW3LFqa2vb5zQvS2zc96uaClB8rYHrQMo/gAj5UXjlbetsRbB1I
 AEIx65ZmwJXJb4HC1s9Io81kVcxULQJxE/FrI+rgPjreni+g9EXUu7d69tdTWJczbH1h
 mPxbSds6IqUgpEBCGF8+e9tifWJ8mpZifJxEQA5P7KEfAfohfG22PToID4S7eTbFpVmc
 CEIQ==
X-Gm-Message-State: AO0yUKXfptIUaz/EVSDO1CNlLfKEG29q8olnM4SyM4IoJcEEqy7fOW09
 OgH3d8WxO7Dk1loTfNKYpygthvg0fD8=
X-Google-Smtp-Source: AK7set9XlR5QcLiNUZwPwq4ddPEFup1DX9pTFh+o0ZO+a8TPb3LjmdiNOttlQ8NjebUcW0s1zJak3g==
X-Received: by 2002:a9d:6119:0:b0:68b:d344:97cb with SMTP id
 i25-20020a9d6119000000b0068bd34497cbmr1438461otj.13.1677878931207; 
 Fri, 03 Mar 2023 13:28:51 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 k4-20020a0568301be400b0068d4649bedasm1473635otb.67.2023.03.03.13.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 13:28:50 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 4/5] pnv_phb4_pec: Move pnv_phb4_get_pec() to rightful file
Date: Fri,  3 Mar 2023 18:28:30 -0300
Message-Id: <20230303212831.830278-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303212831.830278-1-danielhb413@gmail.com>
References: <20230303212831.830278-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
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

The function pnv_phb4_get_pec() exposes some internals of the PEC and
PHB logic, yet it was in the higher level hw/ppc/pnv.c file for
historical reasons: P8 implements the PHBs from pnv.c directly, but on
P9/P10, it's done through the CEC model, which has its own file. So
move pnv_phb4_get_pec() to hw/pci-host/pnv_phb4_pec.c, where it fits
naturally.

While at it, replace the PnvPHB4 parameter by the PnvPHB front-end,
since it has all the information needed and simplify it a bit.

No functional changes.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20230302163715.129635-4-fbarrat@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c     | 40 +++++++++++++++++++++++++++++++
 hw/ppc/pnv.c                   | 44 +---------------------------------
 include/hw/pci-host/pnv_phb4.h |  1 +
 3 files changed, 42 insertions(+), 43 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 6c9b386069..6e2e5ae186 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -112,6 +112,46 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
+PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb, Error **errp)
+{
+    PnvPhb4PecState *pecs = NULL;
+    int chip_id = phb->chip_id;
+    int index = phb->phb_id;
+    int i, j;
+
+    if (phb->version == 4) {
+        Pnv9Chip *chip9 = PNV9_CHIP(chip);
+
+        pecs = chip9->pecs;
+    } else if (phb->version == 5) {
+        Pnv10Chip *chip10 = PNV10_CHIP(chip);
+
+        pecs = chip10->pecs;
+    } else {
+        g_assert_not_reached();
+    }
+
+    for (i = 0; i < chip->num_pecs; i++) {
+        /*
+         * For each PEC, check the amount of phbs it supports
+         * and see if the given phb4 index matches an index.
+         */
+        PnvPhb4PecState *pec = &pecs[i];
+
+        for (j = 0; j < pec->num_phbs; j++) {
+            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
+                pec->phbs[j] = phb;
+                return pec;
+            }
+        }
+    }
+    error_setg(errp,
+               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
+               chip_id, index);
+
+    return NULL;
+}
+
 static PnvPHB *pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
                                            int stack_no,
                                            Error **errp)
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 24bf8461d6..46010b30ad 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -284,48 +284,6 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
     g_free(reg);
 }
 
-static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
-                                         Error **errp)
-{
-    PnvPHB *phb_base = phb->phb_base;
-    PnvPhb4PecState *pecs = NULL;
-    int chip_id = phb->chip_id;
-    int index = phb->phb_id;
-    int i, j;
-
-    if (phb_base->version == 4) {
-        Pnv9Chip *chip9 = PNV9_CHIP(chip);
-
-        pecs = chip9->pecs;
-    } else if (phb_base->version == 5) {
-        Pnv10Chip *chip10 = PNV10_CHIP(chip);
-
-        pecs = chip10->pecs;
-    } else {
-        g_assert_not_reached();
-    }
-
-    for (i = 0; i < chip->num_pecs; i++) {
-        /*
-         * For each PEC, check the amount of phbs it supports
-         * and see if the given phb4 index matches an index.
-         */
-        PnvPhb4PecState *pec = &pecs[i];
-
-        for (j = 0; j < pec->num_phbs; j++) {
-            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
-                pec->phbs[j] = phb->phb_base;
-                return pec;
-            }
-        }
-    }
-    error_setg(errp,
-               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
-               chip_id, index);
-
-    return NULL;
-}
-
 /*
  * Adds a PnvPHB to the chip. Returns the parent obj of the
  * PHB which varies with each version (phb version 3 is parented
@@ -349,7 +307,7 @@ Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
         return OBJECT(chip);
     }
 
-    phb->pec = pnv_phb4_get_pec(chip, PNV_PHB4(phb->backend), errp);
+    phb->pec = pnv_phb4_get_pec(chip, phb, errp);
 
     return OBJECT(phb->pec);
 }
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 0b72ef1471..5c5edb2941 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -157,6 +157,7 @@ struct PnvPHB4 {
 
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
 int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
+PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb, Error **errp);
 void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
 
-- 
2.39.2


