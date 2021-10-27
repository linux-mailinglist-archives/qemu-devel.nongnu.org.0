Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D4D43D6E4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 00:45:50 +0200 (CEST)
Received: from localhost ([::1]:37480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfrg0-0007Cd-36
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 18:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMQ-0007yH-Rj
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:31 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:39559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMO-0002qs-6B
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:30 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 074607561A5;
 Thu, 28 Oct 2021 00:25:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 537D47561AE; Thu, 28 Oct 2021 00:25:16 +0200 (CEST)
Message-Id: <fde64967d4cdb4a3ff28a77ad2ea0554366376f8.1635371671.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635371671.git.balaton@eik.bme.hu>
References: <cover.1635371671.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 14/18] hw/intc/sh_intc: Use array index instead of pointer
 arithmetics
Date: Wed, 27 Oct 2021 23:54:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Address of element i is one word thus clearer than array + i.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/intc/sh_intc.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 537fc503d4..b1056f769e 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -89,7 +89,7 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
     }
 
     for (i = 0; i < desc->nr_sources; i++) {
-        struct intc_source *source = desc->sources + i;
+        struct intc_source *source = &desc->sources[i];
 
         if (source->pending) {
             trace_sh_intc_pending(desc->pending, source->vect);
@@ -138,7 +138,7 @@ static void sh_intc_locate(struct intc_desc *desc,
 
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
-            struct intc_mask_reg *mr = desc->mask_regs + i;
+            struct intc_mask_reg *mr = &desc->mask_regs[i];
 
             mode = sh_intc_mode(address, mr->set_reg, mr->clr_reg);
             if (mode == INTC_MODE_NONE) {
@@ -155,7 +155,7 @@ static void sh_intc_locate(struct intc_desc *desc,
 
     if (desc->prio_regs) {
         for (i = 0; i < desc->nr_prio_regs; i++) {
-            struct intc_prio_reg *pr = desc->prio_regs + i;
+            struct intc_prio_reg *pr = &desc->prio_regs[i];
 
             mode = sh_intc_mode(address, pr->set_reg, pr->clr_reg);
             if (mode == INTC_MODE_NONE) {
@@ -176,7 +176,7 @@ static void sh_intc_locate(struct intc_desc *desc,
 static void sh_intc_toggle_mask(struct intc_desc *desc, intc_enum id,
                                 int enable, int is_group)
 {
-    struct intc_source *source = desc->sources + id;
+    struct intc_source *source = &desc->sources[id];
 
     if (!id) {
         return;
@@ -266,7 +266,7 @@ static const MemoryRegionOps sh_intc_ops = {
 struct intc_source *sh_intc_source(struct intc_desc *desc, intc_enum id)
 {
     if (id) {
-        return desc->sources + id;
+        return &desc->sources[id];
     }
     return NULL;
 }
@@ -281,7 +281,7 @@ static void sh_intc_register_source(struct intc_desc *desc,
 
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
-            struct intc_mask_reg *mr = desc->mask_regs + i;
+            struct intc_mask_reg *mr = &desc->mask_regs[i];
 
             for (k = 0; k < ARRAY_SIZE(mr->enum_ids); k++) {
                 if (mr->enum_ids[k] != source) {
@@ -297,7 +297,7 @@ static void sh_intc_register_source(struct intc_desc *desc,
 
     if (desc->prio_regs) {
         for (i = 0; i < desc->nr_prio_regs; i++) {
-            struct intc_prio_reg *pr = desc->prio_regs + i;
+            struct intc_prio_reg *pr = &desc->prio_regs[i];
 
             for (k = 0; k < ARRAY_SIZE(pr->enum_ids); k++) {
                 if (pr->enum_ids[k] != source) {
@@ -313,7 +313,7 @@ static void sh_intc_register_source(struct intc_desc *desc,
 
     if (groups) {
         for (i = 0; i < nr_groups; i++) {
-            struct intc_group *gr = groups + i;
+            struct intc_group *gr = &groups[i];
 
             for (k = 0; k < ARRAY_SIZE(gr->enum_ids); k++) {
                 if (gr->enum_ids[k] != source) {
@@ -339,7 +339,7 @@ void sh_intc_register_sources(struct intc_desc *desc,
     struct intc_source *s;
 
     for (i = 0; i < nr_vectors; i++) {
-        struct intc_vect *vect = vectors + i;
+        struct intc_vect *vect = &vectors[i];
 
         sh_intc_register_source(desc, vect->enum_id, groups, nr_groups);
         s = sh_intc_source(desc, vect->enum_id);
@@ -352,7 +352,7 @@ void sh_intc_register_sources(struct intc_desc *desc,
 
     if (groups) {
         for (i = 0; i < nr_groups; i++) {
-            struct intc_group *gr = groups + i;
+            struct intc_group *gr = &groups[i];
 
             s = sh_intc_source(desc, gr->enum_id);
             s->next_enum_id = gr->enum_ids[0];
@@ -385,7 +385,7 @@ static unsigned int sh_intc_register(MemoryRegion *sysmem,
     }
 
     iomem = &desc->iomem;
-    iomem_p4 = desc->iomem_aliases + index;
+    iomem_p4 = &desc->iomem_aliases[index];
     iomem_a7 = iomem_p4 + 1;
 
     snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "p4");
@@ -425,7 +425,7 @@ int sh_intc_init(MemoryRegion *sysmem,
     desc->sources = g_malloc0(i);
 
     for (i = 0; i < desc->nr_sources; i++) {
-        struct intc_source *source = desc->sources + i;
+        struct intc_source *source = &desc->sources[i];
 
         source->parent = desc;
     }
@@ -436,7 +436,7 @@ int sh_intc_init(MemoryRegion *sysmem,
 
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
-            struct intc_mask_reg *mr = desc->mask_regs + i;
+            struct intc_mask_reg *mr = &desc->mask_regs[i];
 
             j += sh_intc_register(sysmem, desc, mr->set_reg, "mask", "set", j);
             j += sh_intc_register(sysmem, desc, mr->clr_reg, "mask", "clr", j);
@@ -445,7 +445,7 @@ int sh_intc_init(MemoryRegion *sysmem,
 
     if (desc->prio_regs) {
         for (i = 0; i < desc->nr_prio_regs; i++) {
-            struct intc_prio_reg *pr = desc->prio_regs + i;
+            struct intc_prio_reg *pr = &desc->prio_regs[i];
 
             j += sh_intc_register(sysmem, desc, pr->set_reg, "prio", "set", j);
             j += sh_intc_register(sysmem, desc, pr->clr_reg, "prio", "clr", j);
-- 
2.21.4


