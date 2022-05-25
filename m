Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA5D534190
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:33:05 +0200 (CEST)
Received: from localhost ([::1]:60046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nttwW-0006KF-Hp
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSh-0007Fj-MM; Wed, 25 May 2022 12:02:15 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:48649
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSd-00049O-9L; Wed, 25 May 2022 12:02:15 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRj2kGfz4xXj;
 Thu, 26 May 2022 02:02:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRg4J7kz4xDK;
 Thu, 26 May 2022 02:02:07 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 11/15] hw/gpio Add GPIO read/write trace event.
Date: Wed, 25 May 2022 18:01:32 +0200
Message-Id: <20220525160136.556277-12-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
References: <20220525160136.556277-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Lufh=WB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Jamin Lin <jamin_lin@aspeedtech.com>

Add GPIO read/write trace event for aspeed model.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220525053444.27228-2-jamin_lin@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/gpio/aspeed_gpio.c | 54 +++++++++++++++++++++++++++++++------------
 hw/gpio/trace-events  |  4 ++++
 2 files changed, 43 insertions(+), 15 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 9b736e7a9f26..4620ea8e8b83 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -15,6 +15,7 @@
 #include "qapi/visitor.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
+#include "trace.h"
 
 #define GPIOS_PER_GROUP 8
 
@@ -523,11 +524,15 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
     uint64_t idx = -1;
     const AspeedGPIOReg *reg;
     GPIOSets *set;
+    uint32_t value = 0;
+    uint64_t debounce_value;
 
     idx = offset >> 2;
     if (idx >= GPIO_DEBOUNCE_TIME_1 && idx <= GPIO_DEBOUNCE_TIME_3) {
         idx -= GPIO_DEBOUNCE_TIME_1;
-        return (uint64_t) s->debounce_regs[idx];
+        debounce_value = (uint64_t) s->debounce_regs[idx];
+        trace_aspeed_gpio_read(offset, debounce_value);
+        return debounce_value;
     }
 
     reg = &agc->reg_table[idx];
@@ -540,38 +545,55 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
     set = &s->sets[reg->set_idx];
     switch (reg->type) {
     case gpio_reg_data_value:
-        return set->data_value;
+        value = set->data_value;
+        break;
     case gpio_reg_direction:
-        return set->direction;
+        value = set->direction;
+        break;
     case gpio_reg_int_enable:
-        return set->int_enable;
+        value = set->int_enable;
+        break;
     case gpio_reg_int_sens_0:
-        return set->int_sens_0;
+        value = set->int_sens_0;
+        break;
     case gpio_reg_int_sens_1:
-        return set->int_sens_1;
+        value = set->int_sens_1;
+        break;
     case gpio_reg_int_sens_2:
-        return set->int_sens_2;
+        value = set->int_sens_2;
+        break;
     case gpio_reg_int_status:
-        return set->int_status;
+        value = set->int_status;
+        break;
     case gpio_reg_reset_tolerant:
-        return set->reset_tol;
+        value = set->reset_tol;
+        break;
     case gpio_reg_debounce_1:
-        return set->debounce_1;
+        value = set->debounce_1;
+        break;
     case gpio_reg_debounce_2:
-        return set->debounce_2;
+        value = set->debounce_2;
+        break;
     case gpio_reg_cmd_source_0:
-        return set->cmd_source_0;
+        value = set->cmd_source_0;
+        break;
     case gpio_reg_cmd_source_1:
-        return set->cmd_source_1;
+        value = set->cmd_source_1;
+        break;
     case gpio_reg_data_read:
-        return set->data_read;
+        value = set->data_read;
+        break;
     case gpio_reg_input_mask:
-        return set->input_mask;
+        value = set->input_mask;
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
                       HWADDR_PRIx"\n", __func__, offset);
         return 0;
     }
+
+    trace_aspeed_gpio_read(offset, value);
+    return value;
 }
 
 static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
@@ -585,6 +607,8 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
     GPIOSets *set;
     uint32_t cleared;
 
+    trace_aspeed_gpio_write(offset, data);
+
     idx = offset >> 2;
     if (idx >= GPIO_DEBOUNCE_TIME_1 && idx <= GPIO_DEBOUNCE_TIME_3) {
         idx -= GPIO_DEBOUNCE_TIME_1;
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index 1dab99c5604d..9736b362ac18 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -27,3 +27,7 @@ sifive_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" P
 sifive_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " value 0x%" PRIx64
 sifive_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
 sifive_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
+
+# aspeed_gpio.c
+aspeed_gpio_read(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
+aspeed_gpio_write(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
-- 
2.35.3


