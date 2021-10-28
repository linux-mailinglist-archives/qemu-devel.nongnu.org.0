Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CCC43E96B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 22:17:00 +0200 (CEST)
Received: from localhost ([::1]:51302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgBpb-0006b2-JB
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 16:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWZ-0003eG-OS
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:20 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:64530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWW-0000Oo-Ss
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:19 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3EF567561F8;
 Thu, 28 Oct 2021 21:57:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 89C3B7561A5; Thu, 28 Oct 2021 21:57:05 +0200 (CEST)
Message-Id: <54bccef4be622530ef93ea6d3a6829e2d48dab3e.1635449225.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635449225.git.balaton@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 15/23] hw/intc/sh_intc: Inline and drop sh_intc_source()
 function
Date: Thu, 28 Oct 2021 21:27:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This function is very simple and provides no advantage. Call sites
become simpler without it so just write it in line and drop the
separate function.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/intc/sh_intc.c | 54 +++++++++++++++++++----------------------------
 hw/sh4/sh7750.c   |  4 ++--
 2 files changed, 24 insertions(+), 34 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index b1056f769e..57c341c030 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -263,33 +263,22 @@ static const MemoryRegionOps sh_intc_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-struct intc_source *sh_intc_source(struct intc_desc *desc, intc_enum id)
-{
-    if (id) {
-        return &desc->sources[id];
-    }
-    return NULL;
-}
-
 static void sh_intc_register_source(struct intc_desc *desc,
                                     intc_enum source,
                                     struct intc_group *groups,
                                     int nr_groups)
 {
     unsigned int i, k;
-    struct intc_source *s;
+    intc_enum id;
 
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
             struct intc_mask_reg *mr = &desc->mask_regs[i];
 
             for (k = 0; k < ARRAY_SIZE(mr->enum_ids); k++) {
-                if (mr->enum_ids[k] != source) {
-                    continue;
-                }
-                s = sh_intc_source(desc, mr->enum_ids[k]);
-                if (s) {
-                    s->enable_max++;
+                id = mr->enum_ids[k];
+                if (id && id == source) {
+                    desc->sources[id].enable_max++;
                 }
             }
         }
@@ -300,12 +289,9 @@ static void sh_intc_register_source(struct intc_desc *desc,
             struct intc_prio_reg *pr = &desc->prio_regs[i];
 
             for (k = 0; k < ARRAY_SIZE(pr->enum_ids); k++) {
-                if (pr->enum_ids[k] != source) {
-                    continue;
-                }
-                s = sh_intc_source(desc, pr->enum_ids[k]);
-                if (s) {
-                    s->enable_max++;
+                id = pr->enum_ids[k];
+                if (id && id == source) {
+                    desc->sources[id].enable_max++;
                 }
             }
         }
@@ -316,12 +302,9 @@ static void sh_intc_register_source(struct intc_desc *desc,
             struct intc_group *gr = &groups[i];
 
             for (k = 0; k < ARRAY_SIZE(gr->enum_ids); k++) {
-                if (gr->enum_ids[k] != source) {
-                    continue;
-                }
-                s = sh_intc_source(desc, gr->enum_ids[k]);
-                if (s) {
-                    s->enable_max++;
+                id = gr->enum_ids[k];
+                if (id && id == source) {
+                    desc->sources[id].enable_max++;
                 }
             }
         }
@@ -336,14 +319,16 @@ void sh_intc_register_sources(struct intc_desc *desc,
                               int nr_groups)
 {
     unsigned int i, k;
+    intc_enum id;
     struct intc_source *s;
 
     for (i = 0; i < nr_vectors; i++) {
         struct intc_vect *vect = &vectors[i];
 
         sh_intc_register_source(desc, vect->enum_id, groups, nr_groups);
-        s = sh_intc_source(desc, vect->enum_id);
-        if (s) {
+        id = vect->enum_id;
+        if (id) {
+            s = &desc->sources[id];
             s->vect = vect->vect;
             trace_sh_intc_register("source", vect->enum_id, s->vect,
                                    s->enable_count, s->enable_max);
@@ -354,14 +339,16 @@ void sh_intc_register_sources(struct intc_desc *desc,
         for (i = 0; i < nr_groups; i++) {
             struct intc_group *gr = &groups[i];
 
-            s = sh_intc_source(desc, gr->enum_id);
+            id = gr->enum_id;
+            s = &desc->sources[id];
             s->next_enum_id = gr->enum_ids[0];
 
             for (k = 1; k < ARRAY_SIZE(gr->enum_ids); k++) {
                 if (!gr->enum_ids[k]) {
                     continue;
                 }
-                s = sh_intc_source(desc, gr->enum_ids[k - 1]);
+                id = gr->enum_ids[k - 1];
+                s = &desc->sources[id];
                 s->next_enum_id = gr->enum_ids[k];
             }
             trace_sh_intc_register("group", gr->enum_id, 0xffff,
@@ -463,7 +450,10 @@ void sh_intc_set_irl(void *opaque, int n, int level)
 {
     struct intc_source *s = opaque;
     int i, irl = level ^ 15;
-    for (i = 0; (s = sh_intc_source(s->parent, s->next_enum_id)); i++) {
+    intc_enum id = s->next_enum_id;
+
+    for (i = 0; id; id = s->next_enum_id, i++) {
+        s = &s->parent->sources[id];
         if (i == irl) {
             sh_intc_toggle_source(s, s->enable_count ? 0 : 1,
                                   s->asserted ? 0 : 1);
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index 22016de664..3c10fc863d 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -905,6 +905,6 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 
 qemu_irq sh7750_irl(SH7750State *s)
 {
-    sh_intc_toggle_source(sh_intc_source(&s->intc, IRL), 1, 0); /* enable */
-    return qemu_allocate_irq(sh_intc_set_irl, sh_intc_source(&s->intc, IRL), 0);
+    sh_intc_toggle_source(&s->intc.sources[IRL], 1, 0); /* enable */
+    return qemu_allocate_irq(sh_intc_set_irl, &s->intc.sources[IRL], 0);
 }
-- 
2.21.4


