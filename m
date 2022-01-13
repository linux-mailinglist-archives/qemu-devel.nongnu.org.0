Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E3948DE2F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:41:57 +0100 (CET)
Received: from localhost ([::1]:44962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n85yu-0001UE-22
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:41:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nk-0006YG-6S; Thu, 13 Jan 2022 14:30:29 -0500
Received: from [2607:f8b0:4864:20::22a] (port=35404
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nh-0005BO-RN; Thu, 13 Jan 2022 14:30:23 -0500
Received: by mail-oi1-x22a.google.com with SMTP id s127so9182201oig.2;
 Thu, 13 Jan 2022 11:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k8DtV417FFoHCK0b7K49zL0sYhA3QLT1xvja21pN4eE=;
 b=b0xSqY48QD7Y3osuuHLZWAM9mF18tCM+8ewzOMNV6KR3GGbqdRsQ3IVZ+RyJNCtKCp
 vM7LmIeWYZppPJTMOdX4AhVFhmKg10uG3WTrjbXI8gvavcza4gVX0qSiT5QiCOVfx+17
 kVJwGll5UcIkRuoK3mbB0qVIvOhcVY568DT0QTUYs0pL5g695IXwOWZhVMBIQwm4SjpG
 fnKjoucronYqRj/pxmZSOp/+E8snnPvbh5S61dD6gFiDubdfjtt/CWgTHHNY1NC4nLNW
 20FtV/YSQBLVqWaW258ihoIw0ACZ94vLjUIPC+agAD68+HEaJ3ZCefCQmni2+53lj5NF
 XR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k8DtV417FFoHCK0b7K49zL0sYhA3QLT1xvja21pN4eE=;
 b=oZN1gaN8bSTBtw0XnE5EP3kpyzQAfOg0x3+tXZl8yBR4V+q5FYsZx+PkIAxv3gcEa9
 ixb4b1uaRELOVyTz903O0vfOe4pdrdRmRVwZrunLe7sJ7pChjfpOAdvH12UfdOyVaLk9
 Gu3gipbR/y4K6zSU/hPVgvFxzQvNEm+/KpCXiFrsIVLAuF0NiKhC8m+NtzPYdbhiFqNY
 eGKIdlVLXHKK2bW3sv5s5iFn9iMANF/SViGvNVLEXs1LgpSSqU3OTLucGd14TD58HB++
 IBpZ3/fQbo1BgAPeVlqPx/kp8/3h5+b25rdzFYIDGaO/euAEG4hleLzUHrcASK1f1qkx
 UnIw==
X-Gm-Message-State: AOAM533BMyDTTkflvimntENue9oY57ZDzmC/sJdGb1eNUEUa9WgW2cwM
 d8+rTaV4ovjPgyMmjbcO/e+/HAxjnmUTMS5J
X-Google-Smtp-Source: ABdhPJwdG9RxIncBqED17G5YZoZ8PzIxDxAlJUDarbirBxqmOIkLvVrm2fty9AMGj2rYHklYR/VMWQ==
X-Received: by 2002:a05:6808:238d:: with SMTP id
 bp13mr10294362oib.155.1642102219906; 
 Thu, 13 Jan 2022 11:30:19 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:19 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/17] ppc/pnv: move phb_regs_mr to PnvPHB4
Date: Thu, 13 Jan 2022 16:29:45 -0300
Message-Id: <20220113192952.911188-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After recent changes, this MemoryRegion can be migrated to PnvPHB4
without too much trouble.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 6 +++---
 include/hw/pci-host/pnv_phb4.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 37bab10fcb..b5045fca64 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1481,9 +1481,9 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
                           PHB4_PEC_PCI_STK_REGS_COUNT);
 
     /* PHB pass-through */
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
              pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(phb),
+    pnv_xscom_region_init(&phb->phb_regs_mr, OBJECT(phb),
                           &pnv_phb4_xscom_ops, phb, name, 0x40);
 
     pec_nest_base = pecc->xscom_nest_base(pec);
@@ -1499,7 +1499,7 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
     pnv_xscom_add_subregion(pec->chip,
                             pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
                             0x40 * stack->stack_no,
-                            &stack->phb_regs_mr);
+                            &phb->phb_regs_mr);
 }
 
 static void pnv_phb4_instance_init(Object *obj)
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 1d53dda0ed..6968efaba8 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -117,6 +117,9 @@ struct PnvPHB4 {
     uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
     MemoryRegion nest_regs_mr;
 
+    /* PHB pass-through XSCOM */
+    MemoryRegion phb_regs_mr;
+
     /* Memory windows from PowerBus to PHB */
     MemoryRegion phbbar;
     MemoryRegion intbar;
@@ -170,9 +173,6 @@ struct PnvPhb4PecStack {
     /* My own stack number */
     uint32_t stack_no;
 
-    /* PHB pass-through XSCOM */
-    MemoryRegion phb_regs_mr;
-
     /* The owner PEC */
     PnvPhb4PecState *pec;
 
-- 
2.33.1


