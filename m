Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A729B43CC75
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:39:57 +0200 (CEST)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfk5s-0002Tv-O3
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfjS9-0003vK-2W
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:58:57 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:28156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfjS6-0004Vd-9J
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:58:52 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 533F07561C4;
 Wed, 27 Oct 2021 15:58:42 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C22A7756062; Wed, 27 Oct 2021 15:58:41 +0200 (CEST)
Message-Id: <2cac149cc6eaa157efa1704229b107e17ab8df3e.1635342377.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635342377.git.balaton@eik.bme.hu>
References: <cover.1635342377.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 11/11] hw/intc/sh_intc: Drop another useless macro
Date: Wed, 27 Oct 2021 15:46:17 +0200
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

The INT_REG_PARAMS macro was only used a few times within one function
on adjacent lines and is actually more complex than writing out the
parameters so simplify it by expanding the macro at call sites and
dropping the #define.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/intc/sh_intc.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index fc1905f299..d3616b0078 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -432,16 +432,12 @@ int sh_intc_init(MemoryRegion *sysmem,
     desc->irqs = qemu_allocate_irqs(sh_intc_set_irq, desc, nr_sources);
     memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc, "intc", 4);
 
-#define INT_REG_PARAMS(reg_struct, type, action, j) \
-        reg_struct->action##_reg, #type, #action, j
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
             struct intc_mask_reg *mr = desc->mask_regs + i;
 
-            j += sh_intc_register(sysmem, desc,
-                                  INT_REG_PARAMS(mr, mask, set, j));
-            j += sh_intc_register(sysmem, desc,
-                                  INT_REG_PARAMS(mr, mask, clr, j));
+            j += sh_intc_register(sysmem, desc, mr->set_reg, "mask", "set", j);
+            j += sh_intc_register(sysmem, desc, mr->clr_reg, "mask", "clr", j);
         }
     }
 
@@ -449,13 +445,10 @@ int sh_intc_init(MemoryRegion *sysmem,
         for (i = 0; i < desc->nr_prio_regs; i++) {
             struct intc_prio_reg *pr = desc->prio_regs + i;
 
-            j += sh_intc_register(sysmem, desc,
-                                  INT_REG_PARAMS(pr, prio, set, j));
-            j += sh_intc_register(sysmem, desc,
-                                  INT_REG_PARAMS(pr, prio, clr, j));
+            j += sh_intc_register(sysmem, desc, pr->set_reg, "prio", "set", j);
+            j += sh_intc_register(sysmem, desc, pr->clr_reg, "prio", "clr", j);
         }
     }
-#undef INT_REG_PARAMS
 
     return 0;
 }
-- 
2.21.4


