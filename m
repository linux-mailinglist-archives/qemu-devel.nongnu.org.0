Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017EF533686
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 07:43:07 +0200 (CEST)
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntjnW-0002lJ-LT
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 01:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ntjgB-0000Xb-IM; Wed, 25 May 2022 01:35:31 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:14436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ntjg8-0003sg-FB; Wed, 25 May 2022 01:35:31 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24P5KhCZ022844;
 Wed, 25 May 2022 13:20:43 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.123) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 May
 2022 13:34:47 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <steven_lee@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <jamin_lin@aspeedtech.com>
Subject: [PATCH v2 1/4] hw/gpio Add GPIO read/write trace event.
Date: Wed, 25 May 2022 13:34:41 +0800
Message-ID: <20220525053444.27228-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220525053444.27228-1-jamin_lin@aspeedtech.com>
References: <20220525053444.27228-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.123]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24P5KhCZ022844
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add GPIO read/write trace event for aspeed model.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/gpio/aspeed_gpio.c | 54 +++++++++++++++++++++++++++++++------------
 hw/gpio/trace-events  |  5 ++++
 2 files changed, 44 insertions(+), 15 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 9b736e7a9f..4620ea8e8b 100644
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
index 1dab99c560..e9cd4a5662 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -27,3 +27,8 @@ sifive_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" P
 sifive_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " value 0x%" PRIx64
 sifive_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
 sifive_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
+
+# aspeed_gpio.c
+aspeed_gpio_read(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
+aspeed_gpio_write(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
+
-- 
2.17.1


