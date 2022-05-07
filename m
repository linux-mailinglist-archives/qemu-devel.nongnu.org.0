Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7F351E951
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:09:31 +0200 (CEST)
Received: from localhost ([::1]:59456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPo2-0007XM-Nd
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlG-0004h2-53; Sat, 07 May 2022 15:06:38 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:41520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlE-0001XM-Gh; Sat, 07 May 2022 15:06:37 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-edf9ddb312so9612740fac.8; 
 Sat, 07 May 2022 12:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7IGWV3nomi2hRzL2w+japFtQez8lN0OWE2s3gRdwtpo=;
 b=VanFztx6S/5XXK5SX6vDwCI0EnH6nYRBB4qv9mJtWAW5lM2K1LLNP4ch7fHkeeB7wV
 085ulbHuFUB3VAF0bUyR1DiuuEQnrhsxkymazk8Gugo32tRebd9FaOMf88gWsJ4KhzvB
 azZWYP8YQOf6J916I8dO3i18W9a1fqQybrTtPZtUGEauNT33nNvMbIOEpLT+fjLXs7vc
 Ye1c+JsM6qN8i0lMS8vpQRcEh5G5NrqDJGbELsEU9E+dBcJ4fcVotVyOccaEfMxXKIC6
 Fi8Nh5gt1zRz2mdW00wZxlI7Mk68QUy3YWDDaIZm/WrX8hX1eSRrK5eNvzJQJTfr5/UL
 +I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7IGWV3nomi2hRzL2w+japFtQez8lN0OWE2s3gRdwtpo=;
 b=CNSQlFiTRdxoL3LF9hrcb+Ct4qIGPOrMkSe+j0KNJTyNSqU3jjXrL0oclQwmZ6zK4j
 MqrnK1sL2Y2mo+G4BjQSGAmGny5gzbci7SnTc9s1gB2BX+0l8ixEsq95fAhsML3InUSo
 0e7t3Nq+7oQl0ZUm+rRQHR75AYOApCb82RODyBuRir5z+awBTb3qdZENI2d4Qp0MRuNK
 226vgUlwLMsQ4hL4Nw+U3jrSyK/pt2PKzUBj4kDBqdEEIjBB4LURYByFO/4aMSV7tL1l
 qDST0klQXaxRVi6eAHptUBfyYKxsvKLQ/E+XKpvAZt2RaDAdhVQoMcCrs1P1AAnT1Eyz
 +O5Q==
X-Gm-Message-State: AOAM532uyG09EHlCG3W6CgQGwvq+FntaCcHqw/BwGewPDBY91JwOViwy
 IFnIRfhXAgmlNy5NOjTq57EIXlUppGU=
X-Google-Smtp-Source: ABdhPJwE3h2VYRoje/uIquzctSjzZEYCA5nr5N3QFceZKpSU0cFsP+vfRJu3zK+Z95Z3wj7Kd7iv1Q==
X-Received: by 2002:a05:6870:3b85:b0:ee:4232:a0c3 with SMTP id
 gi5-20020a0568703b8500b000ee4232a0c3mr2654719oab.29.1651950394775; 
 Sat, 07 May 2022 12:06:34 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:06:34 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 01/17] ppc/pnv: rename PnvPHB3.ioda* to PnvPHB3.ioda2*
Date: Sat,  7 May 2022 16:06:08 -0300
Message-Id: <20220507190624.507419-2-danielhb413@gmail.com>
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

We're going to merge all the existing pnv-phb models into a single
pnv-phb model. Users will be able to add phbs by using the same pnv-phb
device, regardless of which powernv machine is being used, and
internally we'll handle which PHB version the device needs to have.

The unified pnv-phb model needs to be usable by the existing pnv_phb3
and pnv_phb4 code base. One way of accomplishing that is to merge
PnvPHB3 and PnvPHB4 into a single PnvPHB struct. To do that we need to
handle the cases where the same attribute might have different
meaning/semantics depending on the version.

One of these attributes is the 'ioda' arrays. This patch renames
PnvPHB3.ioda* arrays to PnvPHB3.ioda2*. The reason why we're calling
'ioda2' is because PnvPHB3 uses IODA version 2.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c         | 18 +++++++++---------
 include/hw/pci-host/pnv_phb3.h | 12 ++++++------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 3f03467dde..860f8846df 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -165,7 +165,7 @@ static void pnv_phb3_check_m64(PnvPHB3 *phb, uint32_t index)
     }
 
     /* Get table entry */
-    m64 = phb->ioda_M64BT[index];
+    m64 = phb->ioda2_M64BT[index];
 
     if (!(m64 & IODA2_M64BT_ENABLE)) {
         return;
@@ -215,7 +215,7 @@ static void pnv_phb3_lxivt_write(PnvPHB3 *phb, unsigned idx, uint64_t val)
 {
     uint8_t server, prio;
 
-    phb->ioda_LXIVT[idx] = val & (IODA2_LXIVT_SERVER |
+    phb->ioda2_LXIVT[idx] = val & (IODA2_LXIVT_SERVER |
                                   IODA2_LXIVT_PRIORITY |
                                   IODA2_LXIVT_NODE_ID);
     server = GETFIELD(IODA2_LXIVT_SERVER, val);
@@ -241,11 +241,11 @@ static uint64_t *pnv_phb3_ioda_access(PnvPHB3 *phb,
 
     switch (table) {
     case IODA2_TBL_LIST:
-        tptr = phb->ioda_LIST;
+        tptr = phb->ioda2_LIST;
         mask = 7;
         break;
     case IODA2_TBL_LXIVT:
-        tptr = phb->ioda_LXIVT;
+        tptr = phb->ioda2_LXIVT;
         mask = 7;
         break;
     case IODA2_TBL_IVC_CAM:
@@ -263,7 +263,7 @@ static uint64_t *pnv_phb3_ioda_access(PnvPHB3 *phb,
         mask = 255;
         break;
     case IODA2_TBL_TVT:
-        tptr = phb->ioda_TVT;
+        tptr = phb->ioda2_TVT;
         mask = 511;
         break;
     case IODA2_TBL_TCAM:
@@ -271,15 +271,15 @@ static uint64_t *pnv_phb3_ioda_access(PnvPHB3 *phb,
         mask = 63;
         break;
     case IODA2_TBL_M64BT:
-        tptr = phb->ioda_M64BT;
+        tptr = phb->ioda2_M64BT;
         mask = 15;
         break;
     case IODA2_TBL_M32DT:
-        tptr = phb->ioda_MDT;
+        tptr = phb->ioda2_MDT;
         mask = 255;
         break;
     case IODA2_TBL_PEEV:
-        tptr = phb->ioda_PEEV;
+        tptr = phb->ioda2_PEEV;
         mask = 3;
         break;
     default:
@@ -869,7 +869,7 @@ static IOMMUTLBEntry pnv_phb3_translate_iommu(IOMMUMemoryRegion *iommu,
         }
         /* Choose TVE XXX Use PHB3 Control Register */
         tve_sel = (addr >> 59) & 1;
-        tve = ds->phb->ioda_TVT[ds->pe_num * 2 + tve_sel];
+        tve = ds->phb->ioda2_TVT[ds->pe_num * 2 + tve_sel];
         pnv_phb3_translate_tve(ds, addr, flag & IOMMU_WO, tve, &ret);
         break;
     case 01:
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index af6ec83cf6..73da31fbd2 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -141,12 +141,12 @@ struct PnvPHB3 {
     MemoryRegion pci_mmio;
     MemoryRegion pci_io;
 
-    uint64_t ioda_LIST[8];
-    uint64_t ioda_LXIVT[8];
-    uint64_t ioda_TVT[512];
-    uint64_t ioda_M64BT[16];
-    uint64_t ioda_MDT[256];
-    uint64_t ioda_PEEV[4];
+    uint64_t ioda2_LIST[8];
+    uint64_t ioda2_LXIVT[8];
+    uint64_t ioda2_TVT[512];
+    uint64_t ioda2_M64BT[16];
+    uint64_t ioda2_MDT[256];
+    uint64_t ioda2_PEEV[4];
 
     uint32_t total_irq;
     ICSState lsis;
-- 
2.32.0


