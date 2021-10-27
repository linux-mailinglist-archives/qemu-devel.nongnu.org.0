Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA85C43D6F2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 00:50:54 +0200 (CEST)
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfrl0-0003S1-0n
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 18:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMb-00082w-GV
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:46 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:39562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMY-0002qz-Bq
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:41 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2807475619C;
 Thu, 28 Oct 2021 00:25:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5F1F57561BC; Thu, 28 Oct 2021 00:25:16 +0200 (CEST)
Message-Id: <33958026ad6cf470c43bd3d38d4ecdde76c82670.1635371671.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635371671.git.balaton@eik.bme.hu>
References: <cover.1635371671.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 17/18] hw/intc/sh_intc: Avoid using continue in loops
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

Instead of if !expr continue else do something it is more straight
forward to say if expr then do something, especially if the action is
just a few lines. Remove such uses of continue to make the code easier
to follow.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/intc/sh_intc.c | 44 ++++++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 56a288e093..eb58707e83 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -140,15 +140,14 @@ static void sh_intc_locate(struct intc_desc *desc,
             struct intc_mask_reg *mr = &desc->mask_regs[i];
 
             mode = sh_intc_mode(address, mr->set_reg, mr->clr_reg);
-            if (mode == INTC_MODE_NONE) {
-                continue;
+            if (mode != INTC_MODE_NONE) {
+                *modep = mode;
+                *datap = &mr->value;
+                *enums = mr->enum_ids;
+                *first = mr->reg_width - 1;
+                *width = 1;
+                return;
             }
-            *modep = mode;
-            *datap = &mr->value;
-            *enums = mr->enum_ids;
-            *first = mr->reg_width - 1;
-            *width = 1;
-            return;
         }
     }
 
@@ -157,15 +156,14 @@ static void sh_intc_locate(struct intc_desc *desc,
             struct intc_prio_reg *pr = &desc->prio_regs[i];
 
             mode = sh_intc_mode(address, pr->set_reg, pr->clr_reg);
-            if (mode == INTC_MODE_NONE) {
-                continue;
+            if (mode != INTC_MODE_NONE) {
+                *modep = mode | INTC_MODE_IS_PRIO;
+                *datap = &pr->value;
+                *enums = pr->enum_ids;
+                *first = pr->reg_width / pr->field_width - 1;
+                *width = pr->field_width;
+                return;
             }
-            *modep = mode | INTC_MODE_IS_PRIO;
-            *datap = &pr->value;
-            *enums = pr->enum_ids;
-            *first = pr->reg_width / pr->field_width - 1;
-            *width = pr->field_width;
-            return;
         }
     }
     g_assert_not_reached();
@@ -246,10 +244,9 @@ static void sh_intc_write(void *opaque, hwaddr offset,
         mask = (1 << width) - 1;
         mask <<= (first - k) * width;
 
-        if ((*valuep & mask) == (value & mask)) {
-            continue;
+        if ((*valuep & mask) != (value & mask)) {
+            sh_intc_toggle_mask(desc, enum_ids[k], value & mask, 0);
         }
-        sh_intc_toggle_mask(desc, enum_ids[k], value & mask, 0);
     }
 
     *valuep = value;
@@ -342,12 +339,11 @@ void sh_intc_register_sources(struct intc_desc *desc,
             s->next_enum_id = gr->enum_ids[0];
 
             for (k = 1; k < ARRAY_SIZE(gr->enum_ids); k++) {
-                if (!gr->enum_ids[k]) {
-                    continue;
+                if (gr->enum_ids[k]) {
+                    id = gr->enum_ids[k - 1];
+                    s = &desc->sources[id];
+                    s->next_enum_id = gr->enum_ids[k];
                 }
-                id = gr->enum_ids[k - 1];
-                s = &desc->sources[id];
-                s->next_enum_id = gr->enum_ids[k];
             }
             trace_sh_intc_register("group", gr->enum_id, 0xffff,
                                    s->enable_count, s->enable_max);
-- 
2.21.4


