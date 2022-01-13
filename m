Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD13B48DE24
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:36:09 +0100 (CET)
Received: from localhost ([::1]:33556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n85tH-0001DB-MQ
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:36:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nb-0006Sr-AE; Thu, 13 Jan 2022 14:30:15 -0500
Received: from [2607:f8b0:4864:20::334] (port=36857
 helo=mail-ot1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nZ-00057O-EP; Thu, 13 Jan 2022 14:30:14 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 s21-20020a05683004d500b0058f585672efso7506371otd.3; 
 Thu, 13 Jan 2022 11:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=otRlOjlUfqQOxcNs1wEtkQLFCCL1TOTQZ2XB5HT4A24=;
 b=lyrPLbA0vC2njSAy5Ftsh5bmIgNqnFQIPIOn2zcIeOI79I5CTJHBKWI1aWH2b7kvJY
 qYb2JA/K6f+tDHBHkjxjM4T9Ijy4x0RCRkDjJO+k+V9PfkQnyFZDxLaLo/qf3kJaMdm4
 Xmrr+QaeMCu+1cxeXs6WbAZSmXr66TKwsYlepQkgUPBGBqMuBLgUk3uFiJLK71x4HP9A
 PG//Ws/FbJ5xexli/36UjkeRgVgLBql78ZO/SeVeJCgTgT8eI2frXfMnz/IqA1L2ajob
 6iG9I3Oq/BC9hf9U5AKgzeZteqACTI58v5ap4o6/hZIaLD9E5JmHZDGteL9zB6nII9MT
 r7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=otRlOjlUfqQOxcNs1wEtkQLFCCL1TOTQZ2XB5HT4A24=;
 b=Ow9dB0QamElKpFN0kHb9QAkVkTApLiXuzP5v6vm5Z95rayl+GUHTxx80ycF7gsMJgu
 6DsRjOoTCIkOk/1w/tZOf3r8cdQQER82MWxG2nFr1mks5IgHNN9tFFPMkf5TibUCLL0j
 MgzhoG5GyyCvdJcXKlqG26Ej1TSGSLxspJ9w7o0FtgmU+ve4vc5fg+hqkwubrW0RiQf8
 G/YAqv+c68FeMEbAF//plpunZTIMK+E+g60TvL0Gt0hcBAb5nLEpqDI0R4R7Rc4pXu+O
 8A4cd3hYc4m/sbDEaA6rdIxxrlf2KYTgv6X49ZHJAwLAVA6QAJFJuGUWc1tDo2vtRWKL
 W2CQ==
X-Gm-Message-State: AOAM530WBHlJlkvp5UBFXyqyiz6HAlG9/TAT/GvWhHWhosMOfUmhIZFg
 GFa6bI6bBvJBLanZsDHKS8ajiPPFlP7wacm3
X-Google-Smtp-Source: ABdhPJxjdUXm6yQY/Xqh18yR5S+b96jPeGXUL+3H7P7cnBxc8sjKgfEpSojnakUNcwSantytiy5zaw==
X-Received: by 2002:a9d:2206:: with SMTP id o6mr4306352ota.148.1642102209283; 
 Thu, 13 Jan 2022 11:30:09 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:08 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/17] ppc/pnv: move intbar to PnvPHB4
Date: Thu, 13 Jan 2022 16:29:39 -0300
Message-Id: <20220113192952.911188-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::334
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
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

This MemoryRegion can also be moved in a single step.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 18 +++++++++---------
 include/hw/pci-host/pnv_phb4.h |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 00eaf91fca..fbc475f27a 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -877,7 +877,7 @@ static void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
         memory_region_del_subregion(&phb->phbbar, &phb->mr_regs);
     }
     if (memory_region_is_mapped(&phb->xsrc.esb_mmio)) {
-        memory_region_del_subregion(&stack->intbar, &phb->xsrc.esb_mmio);
+        memory_region_del_subregion(&phb->intbar, &phb->xsrc.esb_mmio);
     }
 
     /* Map registers if enabled */
@@ -886,8 +886,8 @@ static void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
     }
 
     /* Map ESB if enabled */
-    if (memory_region_is_mapped(&stack->intbar)) {
-        memory_region_add_subregion(&stack->intbar, 0, &phb->xsrc.esb_mmio);
+    if (memory_region_is_mapped(&phb->intbar)) {
+        memory_region_add_subregion(&phb->intbar, 0, &phb->xsrc.esb_mmio);
     }
 
     /* Check/update m32 */
@@ -924,9 +924,9 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
         !(bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
         memory_region_del_subregion(sysmem, &phb->phbbar);
     }
-    if (memory_region_is_mapped(&stack->intbar) &&
+    if (memory_region_is_mapped(&phb->intbar) &&
         !(bar_en & PEC_NEST_STK_BAR_EN_INT)) {
-        memory_region_del_subregion(sysmem, &stack->intbar);
+        memory_region_del_subregion(sysmem, &phb->intbar);
     }
 
     /* Update PHB */
@@ -966,14 +966,14 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
         memory_region_init(&phb->phbbar, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->phbbar);
     }
-    if (!memory_region_is_mapped(&stack->intbar) &&
+    if (!memory_region_is_mapped(&phb->intbar) &&
         (bar_en & PEC_NEST_STK_BAR_EN_INT)) {
         bar = stack->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
         size = PNV_PHB4_MAX_INTs << 16;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-int",
+        snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
                  stack->pec->chip_id, stack->pec->index, stack->stack_no);
-        memory_region_init(&stack->intbar, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->intbar);
+        memory_region_init(&phb->intbar, OBJECT(phb), name, size);
+        memory_region_add_subregion(sysmem, bar, &phb->intbar);
     }
 
     /* Update PHB */
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index b11fa80e81..cf5dd4009c 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -114,6 +114,7 @@ struct PnvPHB4 {
 
     /* Memory windows from PowerBus to PHB */
     MemoryRegion phbbar;
+    MemoryRegion intbar;
 
     /* On-chip IODA tables */
     uint64_t ioda_LIST[PNV_PHB4_MAX_LSIs];
@@ -169,7 +170,6 @@ struct PnvPhb4PecStack {
     /* Memory windows from PowerBus to PHB */
     MemoryRegion mmbar0;
     MemoryRegion mmbar1;
-    MemoryRegion intbar;
     uint64_t mmio0_base;
     uint64_t mmio0_size;
     uint64_t mmio1_base;
-- 
2.33.1


