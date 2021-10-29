Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D14440502
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:42:53 +0200 (CEST)
Received: from localhost ([::1]:53498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZeE-00055L-Bc
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZJH-0007hM-Cu
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:21:12 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:19946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgZJE-0005bt-E2
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 17:21:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CED57756192;
 Fri, 29 Oct 2021 23:20:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EB5587561D1; Fri, 29 Oct 2021 23:20:43 +0200 (CEST)
Message-Id: <72efc4f2c4ff8b96848d03dca08e4541ee4076f6.1635541329.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635541329.git.balaton@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 25/30] hw/intc/sh_intc: Simplify allocating sources array
Date: Fri, 29 Oct 2021 23:02:09 +0200
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

Use g_new0 instead of g_malloc0 and avoid some unneeded temporary
variable assignments.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/intc/sh_intc.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index d7cc61b42b..3603b448c2 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -400,21 +400,14 @@ int sh_intc_init(MemoryRegion *sysmem,
     /* Allocate 4 MemoryRegions per register (2 actions * 2 aliases) */
     desc->iomem_aliases = g_new0(MemoryRegion,
                                  (nr_mask_regs + nr_prio_regs) * 4);
-
-    j = 0;
-    i = sizeof(struct intc_source) * nr_sources;
-    desc->sources = g_malloc0(i);
-
-    for (i = 0; i < desc->nr_sources; i++) {
-        struct intc_source *source = &desc->sources[i];
-
-        source->parent = desc;
+    desc->sources = g_new0(struct intc_source, nr_sources);
+    for (i = 0; i < nr_sources; i++) {
+        desc->sources[i].parent = desc;
     }
-
     desc->irqs = qemu_allocate_irqs(sh_intc_set_irq, desc, nr_sources);
     memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc, "intc",
                           0x100000000ULL);
-
+    j = 0;
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
             struct intc_mask_reg *mr = &desc->mask_regs[i];
-- 
2.21.4


