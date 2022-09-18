Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7695BBFDA
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:35:20 +0200 (CEST)
Received: from localhost ([::1]:43424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa10a-0000Te-2S
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oa0qH-0004lu-8A; Sun, 18 Sep 2022 16:24:43 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:51194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oa0qF-0004By-S8; Sun, 18 Sep 2022 16:24:41 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5F0D975A161;
 Sun, 18 Sep 2022 22:24:38 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E284C75A167; Sun, 18 Sep 2022 22:24:37 +0200 (CEST)
Message-Id: <9e44f69044121c6970d2b2bb5ed34cbba43e5604.1663531117.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663531117.git.balaton@eik.bme.hu>
References: <cover.1663531117.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 17/21] ppc4xx_sdram: Use hwaddr for memory bank size
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Sep 2022 22:24:37 +0200 (CEST)
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This resolves the target_ulong dependency that's clearly wrong and was
also noted in a fixme comment.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/ppc4xx_sdram.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index fe91b0ca82..3ec2edeb17 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -34,7 +34,6 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h" /* get_system_memory() */
-#include "exec/cpu-defs.h" /* target_ulong */
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
@@ -127,11 +126,6 @@ enum {
 
 /*****************************************************************************/
 /* DDR SDRAM controller */
-/*
- * XXX: TOFIX: some patches have made this code become inconsistent:
- *      there are type inconsistencies, mixing hwaddr, target_ulong
- *      and uint32_t
- */
 static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
 {
     uint32_t bcr;
@@ -175,9 +169,9 @@ static inline hwaddr sdram_ddr_base(uint32_t bcr)
     return bcr & 0xFF800000;
 }
 
-static target_ulong sdram_ddr_size(uint32_t bcr)
+static hwaddr sdram_ddr_size(uint32_t bcr)
 {
-    target_ulong size;
+    hwaddr size;
     int sh;
 
     sh = (bcr >> 17) & 0x7;
@@ -524,9 +518,9 @@ static inline hwaddr sdram_ddr2_base(uint32_t bcr)
     return (bcr & 0xffe00000) << 2;
 }
 
-static uint64_t sdram_ddr2_size(uint32_t bcr)
+static hwaddr sdram_ddr2_size(uint32_t bcr)
 {
-    uint64_t size;
+    hwaddr size;
     int sh;
 
     sh = 1024 - ((bcr >> 6) & 0x3ff);
-- 
2.30.4


