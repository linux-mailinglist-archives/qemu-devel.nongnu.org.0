Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4124400EC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:06:12 +0200 (CEST)
Received: from localhost ([::1]:46798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVKV-0006cN-Qf
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUvt-0007Cs-Be
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:48 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:51112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUvn-00064F-S1
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:45 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 411F07561E6;
 Fri, 29 Oct 2021 18:40:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 995DC756072; Fri, 29 Oct 2021 18:40:26 +0200 (CEST)
Message-Id: <e6300f22ca46587dbadfcc59f49e3ddd813fc4f2.1635524617.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635524616.git.balaton@eik.bme.hu>
References: <cover.1635524616.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 12/25] hw/intc/sh_intc: Rename iomem region
Date: Fri, 29 Oct 2021 18:23:36 +0200
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

Rename the iomem region to "intc" from "interrupt-controller" which
makes the info mtree output less wide as it is already too wide
because of all the aliases. Also drop the format macro which was only
used twice in close proximity so we can just use the literal string
instead without a macro definition.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 18461ff554..e386372b6f 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -288,15 +288,13 @@ static unsigned int sh_intc_register(MemoryRegion *sysmem,
     iomem_p4 = desc->iomem_aliases + index;
     iomem_a7 = iomem_p4 + 1;
 
-#define SH_INTC_IOMEM_FORMAT "interrupt-controller-%s-%s-%s"
-    snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, "p4");
+    snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "p4");
     memory_region_init_alias(iomem_p4, NULL, name, iomem, A7ADDR(address), 4);
     memory_region_add_subregion(sysmem, P4ADDR(address), iomem_p4);
 
-    snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, "a7");
+    snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "a7");
     memory_region_init_alias(iomem_a7, NULL, name, iomem, A7ADDR(address), 4);
     memory_region_add_subregion(sysmem, A7ADDR(address), iomem_a7);
-#undef SH_INTC_IOMEM_FORMAT
 
     /* used to increment aliases index */
     return 2;
@@ -432,9 +430,8 @@ int sh_intc_init(MemoryRegion *sysmem,
     }
 
     desc->irqs = qemu_allocate_irqs(sh_intc_set_irq, desc, nr_sources);
-
-    memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc,
-                          "interrupt-controller", 0x100000000ULL);
+    memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc, "intc",
+                          0x100000000ULL);
 
 #define INT_REG_PARAMS(reg_struct, type, action, j) \
         reg_struct->action##_reg, #type, #action, j
-- 
2.21.4


