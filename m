Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B236AA12A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 22:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYCxR-0004cu-7t; Fri, 03 Mar 2023 16:28:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pYCxO-0004cD-Ci; Fri, 03 Mar 2023 16:28:50 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pYCxL-00029C-Ft; Fri, 03 Mar 2023 16:28:49 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 o4-20020a9d6d04000000b00694127788f4so2189961otp.6; 
 Fri, 03 Mar 2023 13:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lcuAXUMTUzs0tseZ/7zL5SXiIQ4vFGrA1FYrIaP1diI=;
 b=OeL5v/tNZp4AcrUxXL6DBDijKBmimOsfnd7ZU/yEZHwPiDaRD0sKwl0M3xg42wcxI8
 2qaFwX5yq4eUUB8uyChT3LUpXIZqvX8U0JDrD5Wo5t+WsMUrMpOKT/rj76PWpzFtpjsA
 nxzYeoOzbW4PnaPVTk50YBodrNAhC9GN5BGrFPmJy36gOz4C00SrzI7gA4vPxKFIdTBS
 jYdzG2HlDtOcRYdCDy11hBGL+jjQITAaYY8gQw7D0JYsWXfCwKO2FPGBG+bKx5iOxLIL
 2+NhWdj0DHQZGr89XaiFbmp3KVQy7CxqWqcQ7H77jNng3z8Jw5Kpg1bFe/aQjNdoBHUc
 qrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lcuAXUMTUzs0tseZ/7zL5SXiIQ4vFGrA1FYrIaP1diI=;
 b=tmEO7DdSgSrFbp14SMmpMszlzUC1b8uYhzBB+/HgdWh/x9D2rx6r9Uv4hLKlozvC2z
 UQnZ4IhOqCJVVOL0tUsNEm6FZEO2quIaI8uZ4RI1PpuJDkZzOfBok/VJUpaI1wjPqBur
 kM8oL+E9lqYWxS5rZZ6Ib+KKyO9S1ftHEV2IVGdYSal+QgEHHPNroEVHov+03Isb/Ibu
 BjZ67JXL83HDttMA1D3aoh/RyMtxYcm/AF5CU39Rd4R8plkR0QyncpngxFGfiYYfbLOx
 LMF4g1hzOaDzxv1stj9vSi+1tHCw2z5Wh0A1L3bg91XR0VplC0gtPU66oY2Jtb74TA4M
 nTgg==
X-Gm-Message-State: AO0yUKVN5TBErLS2UF6RtNX3CsuNiE4sYOrB9IN1ZEdJxrusWr/GvBzD
 uuDIDgebUCYaqs8jmfQeeGZWjDx9fyU=
X-Google-Smtp-Source: AK7set99XiXpERN6YnaaDuIh5nMdEldCKi6HB6wI9sJ0CYhHeaCIWIuWxoSJrf6EI/cGbPz97m8KzQ==
X-Received: by 2002:a05:6830:349f:b0:694:4f92:e7d9 with SMTP id
 c31-20020a056830349f00b006944f92e7d9mr1448037otu.28.1677878925734; 
 Fri, 03 Mar 2023 13:28:45 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 k4-20020a0568301be400b0068d4649bedasm1473635otb.67.2023.03.03.13.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 13:28:45 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 2/5] pnv_phb4_pec: Keep track of instantiated PHBs
Date: Fri,  3 Mar 2023 18:28:28 -0300
Message-Id: <20230303212831.830278-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303212831.830278-1-danielhb413@gmail.com>
References: <20230303212831.830278-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
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

Add an array on the PEC object to keep track of the PHBs which are
instantiated. The array can be sparsely populated when using
user-created PHBs. It will be useful for the next patch to only export
instantiated PHBs in the device tree.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20230302163715.129635-2-fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c     | 12 +++++++-----
 hw/ppc/pnv.c                   |  1 +
 include/hw/pci-host/pnv_phb4.h |  2 ++
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 43267a428f..97c06bb0a0 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -112,9 +112,9 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
-                                        int stack_no,
-                                        Error **errp)
+static PnvPHB *pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
+                                           int stack_no,
+                                           Error **errp)
 {
     PnvPHB *phb = PNV_PHB(qdev_new(TYPE_PNV_PHB));
     int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
@@ -128,8 +128,9 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
                             &error_fatal);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
-        return;
+        return NULL;
     }
+    return phb;
 }
 
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
@@ -148,8 +149,9 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
 
     /* Create PHBs if running with defaults */
     if (defaults_enabled()) {
+        g_assert(pec->num_phbs <= MAX_PHBS_PER_PEC);
         for (i = 0; i < pec->num_phbs; i++) {
-            pnv_pec_default_phb_realize(pec, i, errp);
+            pec->phbs[i] = pnv_pec_default_phb_realize(pec, i, errp);
         }
     }
 
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 44b1fbbc93..24bf8461d6 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -314,6 +314,7 @@ static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
 
         for (j = 0; j < pec->num_phbs; j++) {
             if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
+                pec->phbs[j] = phb->phb_base;
                 return pec;
             }
         }
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 28d61b96c7..0b72ef1471 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -185,6 +185,8 @@ struct PnvPhb4PecState {
 
     /* PHBs */
     uint32_t num_phbs;
+#define MAX_PHBS_PER_PEC        3
+    PnvPHB *phbs[MAX_PHBS_PER_PEC];
 
     PnvChip *chip;
 };
-- 
2.39.2


