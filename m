Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0D948EFB5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:14:38 +0100 (CET)
Received: from localhost ([::1]:45050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8R5x-0005gH-89
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:14:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8Qz8-0005SO-3U; Fri, 14 Jan 2022 13:07:34 -0500
Received: from [2607:f8b0:4864:20::c31] (port=45745
 helo=mail-oo1-xc31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8Qz6-0000Mr-CZ; Fri, 14 Jan 2022 13:07:33 -0500
Received: by mail-oo1-xc31.google.com with SMTP id
 l10-20020a4a840a000000b002dc09752694so2770661oog.12; 
 Fri, 14 Jan 2022 10:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UeZQhN7i74gPGlvXNoYGRr9eqyhQ4j7/HSM2uxOXsKI=;
 b=qBJEUaytMzeSaWKhRleUqWsQkSQWiRVU+riJ1+gfK8QeuSb44wB0lfM0+sMxnf0HgO
 DuKwlwNXsgBeyMXCTnBbPWkPHR/moMz2rjHJqclskXh5eWIpp5BZHr+B8DZxkuTocDSf
 tGUMsdVDuRIO4B45Mp3/s0Fqq/3Icl92O3YSzdacup1F+W5OLYrVy8DkwEAxo6NEPNE1
 Bgijgh1gd0DCckeMlBypqu8zuB1uGKdfmaDHOe7Kbrn4lx6vgCEoOCXPBNuHyBt7ISFW
 Ua1Xg3G9L3PU70xfZD2ksFcb8u/TM27+D4BCDZctNycYDzf5mswxYKioh5+Ew2zkQpRe
 DDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UeZQhN7i74gPGlvXNoYGRr9eqyhQ4j7/HSM2uxOXsKI=;
 b=jMqhB4BM2ZaE5rfH6eFoPqWJSnqB9cJ+zMrautDYqc9rCY9/HgPb1QshSkfTiLC6fd
 PvgU6sREs2gZYcgRVoYFP4+b5aSGNnttLu/AU+cjgZKFU01xk3RdpEGgpk1kxvZohD15
 LXR5gXwN4ec4vcRl4W3UNx0Cj284QHRkqAjennujMrDsyYGcnQ+g8/fOsrhy7ZD4f27g
 BHE98Zcq6ZisSUpssb5kLLk9dGvxfC2Fki3+vVGt00mpUu7G6KTMbdu/gnFRi/wRIZFA
 TdXDOPSrBH5JKo/LiWf75K179Bj7RpVq2XBDJWAtY0rK2/96pgjyNcqJjcckefQnxiag
 d35Q==
X-Gm-Message-State: AOAM530XyUz18qGcQfkx20VvOWmR/pEpcV9VFxafT2C8xlsFOIJkUEt+
 CdQZCSbizQcjn6SPoIfG0vYOyd6u8yz2Edi2
X-Google-Smtp-Source: ABdhPJxxU5+qGZxCfiDi1zy6FNlOot43X+9aJtb1Neb0fmcr6vpO2ctzf6YDOnmB75fCG0mbu4KnzQ==
X-Received: by 2002:a4a:e50e:: with SMTP id r14mr7483493oot.27.1642183650796; 
 Fri, 14 Jan 2022 10:07:30 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id e17sm1353584otr.13.2022.01.14.10.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:07:30 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] ppc/pnv: introduce PnvPHB4 'pec' property
Date: Fri, 14 Jan 2022 15:07:12 -0300
Message-Id: <20220114180719.52117-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220114180719.52117-1-danielhb413@gmail.com>
References: <20220114180719.52117-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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

This property will track the owner PEC of this PHB. For now it's
redundant since we can retrieve the PEC via phb->stack->pec but it
will not be redundant when we get rid of the stack device.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 19 +++++++++++++------
 hw/pci-host/pnv_phb4_pec.c     |  2 ++
 include/hw/pci-host/pnv_phb4.h |  3 +++
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index b5045fca64..2658ef2d84 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -895,7 +895,7 @@ static void pnv_phb4_update_regions(PnvPHB4 *phb)
 static void pnv_pec_stk_update_map(PnvPHB4 *phb)
 {
     PnvPhb4PecStack *stack = phb->stack;
-    PnvPhb4PecState *pec = stack->pec;
+    PnvPhb4PecState *pec = phb->pec;
     MemoryRegion *sysmem = get_system_memory();
     uint64_t bar_en = phb->nest_regs[PEC_NEST_STK_BAR_EN];
     uint64_t bar, mask, size;
@@ -969,7 +969,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         bar = phb->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
         size = PNV_PHB4_MAX_INTs << 16;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
-                 stack->pec->chip_id, stack->pec->index, stack->stack_no);
+                 phb->pec->chip_id, phb->pec->index, stack->stack_no);
         memory_region_init(&phb->intbar, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->intbar);
     }
@@ -982,7 +982,7 @@ static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
                                          uint64_t val, unsigned size)
 {
     PnvPHB4 *phb = PNV_PHB4(opaque);
-    PnvPhb4PecState *pec = phb->stack->pec;
+    PnvPhb4PecState *pec = phb->pec;
     uint32_t reg = addr >> 3;
 
     switch (reg) {
@@ -1459,7 +1459,7 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
 static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
 {
     PnvPhb4PecStack *stack = phb->stack;
-    PnvPhb4PecState *pec = stack->pec;
+    PnvPhb4PecState *pec = phb->pec;
     PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
     uint32_t pec_nest_base;
     uint32_t pec_pci_base;
@@ -1568,8 +1568,13 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        /* All other phb properties but 'version' are already set */
-        pecc = PNV_PHB4_PEC_GET_CLASS(phb->stack->pec);
+        /*
+         * All other phb properties but 'pec' ad 'version' are
+         * already set.
+         */
+        object_property_set_link(OBJECT(phb), "pec", OBJECT(phb->stack->pec),
+                                 &error_abort);
+        pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
         object_property_set_int(OBJECT(phb), "version", pecc->version,
                                 &error_fatal);
 
@@ -1682,6 +1687,8 @@ static Property pnv_phb4_properties[] = {
         DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
         DEFINE_PROP_LINK("stack", PnvPHB4, stack, TYPE_PNV_PHB4_PEC_STACK,
                          PnvPhb4PecStack *),
+        DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
+                         PnvPhb4PecState *),
         DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 7fe7f1f007..22194b8de2 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -285,6 +285,8 @@ static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
 
     stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
 
+    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
+                             &error_abort);
     object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
                             &error_fatal);
     object_property_set_int(OBJECT(stack->phb), "index", phb_id,
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 6968efaba8..1d27e4c0cb 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -84,6 +84,9 @@ struct PnvPHB4 {
 
     uint64_t version;
 
+    /* The owner PEC */
+    PnvPhb4PecState *pec;
+
     char bus_path[8];
 
     /* Main register images */
-- 
2.33.1


