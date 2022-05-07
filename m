Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F7551E952
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:09:37 +0200 (CEST)
Received: from localhost ([::1]:60018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPo8-0007vW-6A
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlK-0004rk-Hy; Sat, 07 May 2022 15:06:42 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:46992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlJ-0001Xm-02; Sat, 07 May 2022 15:06:42 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-d39f741ba0so10527827fac.13; 
 Sat, 07 May 2022 12:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fsBpqRRPOl8gqifPS+3uTgHpV11smNfVhP3WnzCOwA=;
 b=gjR5Qy6QBo+ACTk3sznyDvUrrGkOIk9n9JxwbdMJZdl8UmSfgfLd62qgbmkKlioE2a
 l0sSX7VLrH+/cxsS+6PZZtzcacFgiWTOp6crSRLP2Q8AODZgyQ+Z0RebVhc+SHPc1rSO
 rYjDYBqDO/hOzyNVpVrg2vMA8bnswyHpHg6eqnu9IR3xK0WHe29ZUSuLmKHjdZ80Dhiz
 aRZfRBp8LS4Ql+JtEUChnW19Aho7+52876ge3SWGdtpk0wrHa8uqo557hXNgWXF/krbL
 0R0t0EJWutc4cf6FSFHeAGg4txx+QYoVpbBpiPs7l1HDiwEo/xY4lGe82XEoEqiFD88W
 PLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2fsBpqRRPOl8gqifPS+3uTgHpV11smNfVhP3WnzCOwA=;
 b=1Me4O6GJ74wSNDmtYKCdSj7Rkiv4vwkhQ8L3+8kfPEfCkPDut667GJ38wThK3MHw7g
 31iiKAivlbLmJizD88nMW0AiAwF6cAA/LctcMBfj1egicsSMIr5dxknPAHcbkvgXzajJ
 vIiEgAgqHq6lWpD1gVwxyV/suHLht/kuoombs58ZE06/iQ95Uw8gdOOvdvOkg3AIX8Tn
 fv5nloiMDVji4acQ9ZWdCOLV/aipVOlcHa7fEsFjga8g1wxs8CFBEro/GBSmDv9k2IrP
 ahgAzDv6u2msC6Lerj73LPAm+pwk8YydEMnOHHB6XiDqHfdbnHHpd5FLARph6P2Xm5MK
 41pw==
X-Gm-Message-State: AOAM531K+tP/b38aaxGHK7SDt2dLJBjrLeeTN5kM+TOXT0Hkl7Cm6INT
 qARS3QgzHqv4khZyCuMs2WKqBclkcxU=
X-Google-Smtp-Source: ABdhPJx2M5lG3LkUjb3sBu9mmVyqazbWnhPL4QtEtl1qtfPh7veVyIl3V6W8ejAeOJL1jJRroWU9Qw==
X-Received: by 2002:a05:6870:b490:b0:ed:9a21:3983 with SMTP id
 y16-20020a056870b49000b000ed9a213983mr7065233oap.116.1651950399393; 
 Sat, 07 May 2022 12:06:39 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:06:39 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 03/17] ppc/pnv: rename PnvPHB3.dma_spaces to
 PnvPHB3.v3_dma_spaces
Date: Sat,  7 May 2022 16:06:10 -0300
Message-Id: <20220507190624.507419-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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

The last common attribute that has a different meaning/semantic between
PnvPHB3 and PnvPHB4 devices is the 'dma_spaces' QLIST.

Rename the PHB3 version to 'v3_dma_spaces'. The reason why we chose that
instead of 'dma3_spaces' or similar is to avoid any misunderstanding
about this being related to DMA version 3.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c         | 10 +++++-----
 include/hw/pci-host/pnv_phb3.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 77ee2325be..70d92edd94 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -421,7 +421,7 @@ static void pnv_phb3_rtc_invalidate(PnvPHB3 *phb, uint64_t val)
     PnvPhb3DMASpace *ds;
 
     /* Always invalidate all for now ... */
-    QLIST_FOREACH(ds, &phb->dma_spaces, list) {
+    QLIST_FOREACH(ds, &phb->v3_dma_spaces, list) {
         ds->pe_num = PHB_INVALID_PE;
     }
 }
@@ -460,7 +460,7 @@ static void pnv_phb3_update_all_msi_regions(PnvPHB3 *phb)
 {
     PnvPhb3DMASpace *ds;
 
-    QLIST_FOREACH(ds, &phb->dma_spaces, list) {
+    QLIST_FOREACH(ds, &phb->v3_dma_spaces, list) {
         pnv_phb3_update_msi_regions(ds);
     }
 }
@@ -938,7 +938,7 @@ static AddressSpace *pnv_phb3_dma_iommu(PCIBus *bus, void *opaque, int devfn)
     PnvPHB3 *phb = opaque;
     PnvPhb3DMASpace *ds;
 
-    QLIST_FOREACH(ds, &phb->dma_spaces, list) {
+    QLIST_FOREACH(ds, &phb->v3_dma_spaces, list) {
         if (ds->bus == bus && ds->devfn == devfn) {
             break;
         }
@@ -961,7 +961,7 @@ static AddressSpace *pnv_phb3_dma_iommu(PCIBus *bus, void *opaque, int devfn)
                               ds, "msi64", 0x100000);
         pnv_phb3_update_msi_regions(ds);
 
-        QLIST_INSERT_HEAD(&phb->dma_spaces, ds, list);
+        QLIST_INSERT_HEAD(&phb->v3_dma_spaces, ds, list);
     }
     return &ds->dma_as;
 }
@@ -970,7 +970,7 @@ static void pnv_phb3_instance_init(Object *obj)
 {
     PnvPHB3 *phb = PNV_PHB3(obj);
 
-    QLIST_INIT(&phb->dma_spaces);
+    QLIST_INIT(&phb->v3_dma_spaces);
 
     /* LSI sources */
     object_initialize_child(obj, "lsi", &phb->lsis, TYPE_ICS);
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 486dbbefee..35483e59c3 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -155,7 +155,7 @@ struct PnvPHB3 {
 
     PnvPBCQState pbcq;
 
-    QLIST_HEAD(, PnvPhb3DMASpace) dma_spaces;
+    QLIST_HEAD(, PnvPhb3DMASpace) v3_dma_spaces;
 
     PnvChip *chip;
 };
-- 
2.32.0


