Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A5443D6DB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 00:42:45 +0200 (CEST)
Received: from localhost ([::1]:59074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfrd6-0002nj-N8
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 18:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMP-0007xA-BG
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:29 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:39550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMK-0002nd-T1
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:28 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D210C7561DF;
 Thu, 28 Oct 2021 00:25:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3B4D7756062; Thu, 28 Oct 2021 00:25:16 +0200 (CEST)
Message-Id: <64d45d4967eea84c5614769a86b05d0577a381a0.1635371671.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635371671.git.balaton@eik.bme.hu>
References: <cover.1635371671.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 09/18] hw/intc/sh_intc: Turn some defines into an enum
Date: Wed, 27 Oct 2021 23:54:31 +0200
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

Turn the INTC_MODE defines into an enum and clean up the function
returning these to make it clearer by removing nested ifs and
superfluous parenthesis. The one remaining #define is a flag which is
moved further apart by changing its value from 8 to 0x80 to leave some
spare bits as this is or-ed with the enum value at some places.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/intc/sh_intc.c | 43 +++++++++++++++++++------------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 0bd27aaf4f..18461ff554 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -100,33 +100,27 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
     abort();
 }
 
-#define INTC_MODE_NONE       0
-#define INTC_MODE_DUAL_SET   1
-#define INTC_MODE_DUAL_CLR   2
-#define INTC_MODE_ENABLE_REG 3
-#define INTC_MODE_MASK_REG   4
-#define INTC_MODE_IS_PRIO    8
-
-static unsigned int sh_intc_mode(unsigned long address,
-                                 unsigned long set_reg, unsigned long clr_reg)
+#define INTC_MODE_IS_PRIO 0x80
+typedef enum {
+    INTC_MODE_NONE,
+    INTC_MODE_DUAL_SET,
+    INTC_MODE_DUAL_CLR,
+    INTC_MODE_ENABLE_REG,
+    INTC_MODE_MASK_REG,
+} SHIntCMode;
+
+
+static SHIntCMode sh_intc_mode(unsigned long address, unsigned long set_reg,
+                               unsigned long clr_reg)
 {
-    if ((address != A7ADDR(set_reg)) &&
-        (address != A7ADDR(clr_reg)))
+    if (address != A7ADDR(set_reg) && address != A7ADDR(clr_reg)) {
         return INTC_MODE_NONE;
-
-    if (set_reg && clr_reg) {
-        if (address == A7ADDR(set_reg)) {
-            return INTC_MODE_DUAL_SET;
-        } else {
-            return INTC_MODE_DUAL_CLR;
-        }
     }
-
-    if (set_reg) {
-        return INTC_MODE_ENABLE_REG;
-    } else {
-        return INTC_MODE_MASK_REG;
+    if (set_reg && clr_reg) {
+        return address == A7ADDR(set_reg) ?
+               INTC_MODE_DUAL_SET : INTC_MODE_DUAL_CLR;
     }
+    return set_reg ? INTC_MODE_ENABLE_REG : INTC_MODE_MASK_REG;
 }
 
 static void sh_intc_locate(struct intc_desc *desc,
@@ -137,7 +131,8 @@ static void sh_intc_locate(struct intc_desc *desc,
                            unsigned int *width,
                            unsigned int *modep)
 {
-    unsigned int i, mode;
+    SHIntCMode mode;
+    unsigned int i;
 
     /* this is slow but works for now */
 
-- 
2.21.4


