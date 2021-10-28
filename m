Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CA443E942
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 22:04:43 +0200 (CEST)
Received: from localhost ([::1]:50672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgBdi-0003uY-RH
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 16:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWW-0003bg-Ly
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:17 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:64509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWT-0000NZ-KU
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:16 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EAADB7561DA;
 Thu, 28 Oct 2021 21:57:05 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6ED01756066; Thu, 28 Oct 2021 21:57:05 +0200 (CEST)
Message-Id: <f4056e411c9e382794c6253af34efdd715ae04a9.1635449225.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635449225.git.balaton@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 08/23] hw/intc/sh_intc: Use existing macro instead of local
 one
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

The INTC_A7 local macro does the same as the A7ADDR from
include/sh/sh.h so use the latter and drop the local macro definition.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/sh_intc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index c1058d97c0..0bd27aaf4f 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -16,8 +16,6 @@
 #include "hw/sh4/sh.h"
 #include "trace.h"
 
-#define INTC_A7(x) ((x) & 0x1fffffff)
-
 void sh_intc_toggle_source(struct intc_source *source,
                            int enable_adj, int assert_adj)
 {
@@ -112,12 +110,12 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
 static unsigned int sh_intc_mode(unsigned long address,
                                  unsigned long set_reg, unsigned long clr_reg)
 {
-    if ((address != INTC_A7(set_reg)) &&
-        (address != INTC_A7(clr_reg)))
+    if ((address != A7ADDR(set_reg)) &&
+        (address != A7ADDR(clr_reg)))
         return INTC_MODE_NONE;
 
     if (set_reg && clr_reg) {
-        if (address == INTC_A7(set_reg)) {
+        if (address == A7ADDR(set_reg)) {
             return INTC_MODE_DUAL_SET;
         } else {
             return INTC_MODE_DUAL_CLR;
@@ -297,11 +295,11 @@ static unsigned int sh_intc_register(MemoryRegion *sysmem,
 
 #define SH_INTC_IOMEM_FORMAT "interrupt-controller-%s-%s-%s"
     snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, "p4");
-    memory_region_init_alias(iomem_p4, NULL, name, iomem, INTC_A7(address), 4);
+    memory_region_init_alias(iomem_p4, NULL, name, iomem, A7ADDR(address), 4);
     memory_region_add_subregion(sysmem, P4ADDR(address), iomem_p4);
 
     snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, "a7");
-    memory_region_init_alias(iomem_a7, NULL, name, iomem, INTC_A7(address), 4);
+    memory_region_init_alias(iomem_a7, NULL, name, iomem, A7ADDR(address), 4);
     memory_region_add_subregion(sysmem, A7ADDR(address), iomem_a7);
 #undef SH_INTC_IOMEM_FORMAT
 
-- 
2.21.4


