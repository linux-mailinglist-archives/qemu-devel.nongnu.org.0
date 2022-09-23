Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DF85E7694
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 11:15:14 +0200 (CEST)
Received: from localhost ([::1]:49486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obem8-0002uq-VI
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 05:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>)
 id 1obeMS-0005Aj-4C; Fri, 23 Sep 2022 04:48:41 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>)
 id 1obeMO-0005Pq-9G; Fri, 23 Sep 2022 04:48:39 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MYm5V0lfpz4xGk;
 Fri, 23 Sep 2022 18:48:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYm5R41mMz4x3w;
 Fri, 23 Sep 2022 18:48:27 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 6/6] aspeed/smc: Cache AspeedSMCClass
Date: Fri, 23 Sep 2022 10:48:03 +0200
Message-Id: <20220923084803.498337-7-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923084803.498337-1-clg@kaod.org>
References: <20220923084803.498337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Store a reference on the AspeedSMC class under the flash object and
use it when accessing the flash contents. Avoiding the class cast
checkers in these hot paths improves performance by 10% when running
the aspeed avocado tests.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 2 ++
 hw/ssi/aspeed_smc.c         | 9 ++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 2d5f8f3d8f68..8e1dda556b91 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -30,6 +30,7 @@
 #include "qom/object.h"
 
 struct AspeedSMCState;
+struct AspeedSMCClass;
 
 #define TYPE_ASPEED_SMC_FLASH "aspeed.smc.flash"
 OBJECT_DECLARE_SIMPLE_TYPE(AspeedSMCFlash, ASPEED_SMC_FLASH)
@@ -37,6 +38,7 @@ struct AspeedSMCFlash {
     SysBusDevice parent_obj;
 
     struct AspeedSMCState *controller;
+    struct AspeedSMCClass *asc;
     uint8_t cs;
 
     MemoryRegion mmio;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index faed7e0cbe17..22df4be528a7 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -388,7 +388,7 @@ static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
 static inline int aspeed_smc_flash_addr_width(const AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s = fl->controller;
-    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
+    AspeedSMCClass *asc = fl->asc;
 
     if (asc->addr_width) {
         return asc->addr_width(s);
@@ -420,7 +420,7 @@ static uint32_t aspeed_smc_check_segment_addr(const AspeedSMCFlash *fl,
                                               uint32_t addr)
 {
     const AspeedSMCState *s = fl->controller;
-    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
+    AspeedSMCClass *asc = fl->asc;
     AspeedSegments seg;
 
     asc->reg_to_segment(s, s->regs[R_SEG_ADDR0 + fl->cs], &seg);
@@ -1234,7 +1234,6 @@ static const TypeInfo aspeed_smc_info = {
 static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
 {
     AspeedSMCFlash *s = ASPEED_SMC_FLASH(dev);
-    AspeedSMCClass *asc;
     g_autofree char *name = g_strdup_printf(TYPE_ASPEED_SMC_FLASH ".%d", s->cs);
 
     if (!s->controller) {
@@ -1242,14 +1241,14 @@ static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    asc = ASPEED_SMC_GET_CLASS(s->controller);
+    s->asc = ASPEED_SMC_GET_CLASS(s->controller);
 
     /*
      * Use the default segment value to size the memory region. This
      * can be changed by FW at runtime.
      */
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_flash_ops,
-                          s, name, asc->segments[s->cs].size);
+                          s, name, s->asc->segments[s->cs].size);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
 }
 
-- 
2.37.3


