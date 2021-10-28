Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232D043E965
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 22:13:58 +0200 (CEST)
Received: from localhost ([::1]:44854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgBmf-0002BK-7O
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 16:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWl-0003oP-NE
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:33 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:64532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWh-0000P9-Is
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:31 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 40E597561FB;
 Thu, 28 Oct 2021 21:57:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 937487561B1; Thu, 28 Oct 2021 21:57:05 +0200 (CEST)
Message-Id: <215edc2834072b774b029945b1c5020973e14adc.1635449225.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635449225.git.balaton@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 17/23] hw/intc/sh_intc: Avoid using continue in loops
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

Instead of if !expr continue else do something it is more straight
forward to say if expr then do something, especially if the action is
just a few lines. Remove such uses of continue to make the code easier
to follow.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


