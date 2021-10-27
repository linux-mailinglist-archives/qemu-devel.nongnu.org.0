Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434F043D6F0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 00:50:43 +0200 (CEST)
Received: from localhost ([::1]:43870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfrko-0003MA-Cz
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 18:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMc-000830-Hn
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:46 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:39564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMY-0002r3-EG
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:42 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3D9A67561AE;
 Thu, 28 Oct 2021 00:25:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 62E127561B9; Thu, 28 Oct 2021 00:25:16 +0200 (CEST)
Message-Id: <09bae4fbe771f45c70bf586942ed9324ffb20183.1635371671.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635371671.git.balaton@eik.bme.hu>
References: <cover.1635371671.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 18/18] hw/intc/sh_intc: Simplify allocating sources array
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

Use g_new0 instead of g_malloc0 and avoid some unneeded temporary
variable assignments.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/intc/sh_intc.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index eb58707e83..ed0a5f87cc 100644
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
+    desc->sources = g_new0(struct intc_source, nr_sources);
     for (i = 0; i < desc->nr_sources; i++) {
-        struct intc_source *source = &desc->sources[i];
-
-        source->parent = desc;
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


