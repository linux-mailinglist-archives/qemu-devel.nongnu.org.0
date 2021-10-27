Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CC443D6C8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 00:39:17 +0200 (CEST)
Received: from localhost ([::1]:50716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfrZk-0005Zx-Sa
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 18:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMO-0007x9-O8
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:29 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:39549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMK-0002nf-TW
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:28 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CF8A17561DA;
 Thu, 28 Oct 2021 00:25:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4559E7561A5; Thu, 28 Oct 2021 00:25:16 +0200 (CEST)
Message-Id: <d2a83545a5da042e07f2a5bf9f80a12f7c0b9bc2.1635371671.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635371671.git.balaton@eik.bme.hu>
References: <cover.1635371671.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 11/18] hw/intc/sh_intc: Drop another useless macro
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

The INT_REG_PARAMS macro was only used a few times within one function
on adjacent lines and is actually more complex than writing out the
parameters so simplify it by expanding the macro at call sites and
dropping the #define.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index e386372b6f..763ebbfec2 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -433,16 +433,12 @@ int sh_intc_init(MemoryRegion *sysmem,
     memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc, "intc",
                           0x100000000ULL);
 
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
 
@@ -450,13 +446,10 @@ int sh_intc_init(MemoryRegion *sysmem,
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


