Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2211953E593
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:50:01 +0200 (CEST)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEzP-0003yt-Ef
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEM0-0006m4-GO; Mon, 06 Jun 2022 11:09:16 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:42737
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyELy-0006Av-FW; Mon, 06 Jun 2022 11:09:16 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxj40hsbz4xZf;
 Tue,  7 Jun 2022 01:09:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxhy5Tt0z4xZY;
 Tue,  7 Jun 2022 01:09:06 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 14/21] hw/i2c/aspeed: rework raise interrupt trace event
Date: Mon,  6 Jun 2022 17:07:25 +0200
Message-Id: <20220606150732.2282041-15-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606150732.2282041-1-clg@kaod.org>
References: <20220606150732.2282041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

From: Klaus Jensen <k.jensen@samsung.com>

Build a single string instead of having several parameters on the trace
event.

Suggested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
[ clg: simplified trace buffer creation ]
Message-Id: <20220601210831.67259-2-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 34 ++++++++++++++++++++++------------
 hw/i2c/trace-events |  2 +-
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 5fce516517a5..b70276a87360 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
@@ -38,23 +39,32 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
     uint32_t intr_ctrl_reg = aspeed_i2c_bus_intr_ctrl_offset(bus);
     bool raise_irq;
 
-    trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts],
-        aspeed_i2c_bus_pkt_mode_en(bus) &&
-        ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE) ?
-                                                               "pktdone|" : "",
-        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK) ? "nak|" : "",
-        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK) ? "ack|" : "",
-        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE) ? "done|"
-                                                                  : "",
-        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP) ?
-                                                                "normal|" : "",
-        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ? "abnormal"
-                                                                   : "");
+    if (trace_event_get_state_backends(TRACE_ASPEED_I2C_BUS_RAISE_INTERRUPT)) {
+        g_autofree char *buf = g_strdup_printf("%s%s%s%s%s%s",
+               aspeed_i2c_bus_pkt_mode_en(bus) &&
+               ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE) ?
+                                               "pktdone|" : "",
+               SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK) ?
+                                               "nak|" : "",
+               SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK) ?
+                                               "ack|" : "",
+               SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE) ?
+                                               "done|" : "",
+               SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP) ?
+                                               "normal|" : "",
+               SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ?
+                                               "abnormal"  : "");
+
+           trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts], buf);
+    }
+
     raise_irq = bus->regs[reg_intr_sts] & bus->regs[intr_ctrl_reg];
+
     /* In packet mode we don't mask off INTR_STS */
     if (!aspeed_i2c_bus_pkt_mode_en(bus)) {
         bus->regs[reg_intr_sts] &= bus->regs[intr_ctrl_reg];
     }
+
     if (raise_irq) {
         bus->controller->intr_status |= 1 << bus->id;
         qemu_irq_raise(aic->bus_get_irq(bus));
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 85e4bddff936..209275ed2dc8 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -9,7 +9,7 @@ i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
 # aspeed_i2c.c
 
 aspeed_i2c_bus_cmd(uint32_t cmd, const char *cmd_flags, uint32_t count, uint32_t intr_status) "handling cmd=0x%x %s count=%d intr=0x%x"
-aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1, const char *str2, const char *str3, const char *str4, const char *str5, const char *str6) "handled intr=0x%x %s%s%s%s%s%s"
+aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *s) "handled intr=0x%x %s"
 aspeed_i2c_bus_read(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
 aspeed_i2c_bus_write(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
 aspeed_i2c_bus_send(const char *mode, int i, int count, uint8_t byte) "%s send %d/%d 0x%02x"
-- 
2.35.3


