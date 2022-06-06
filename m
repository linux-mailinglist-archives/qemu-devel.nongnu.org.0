Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B84C53E586
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:45:52 +0200 (CEST)
Received: from localhost ([::1]:58728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEvP-0004SR-9R
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEKs-0004u8-5z; Mon, 06 Jun 2022 11:08:06 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:35447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEKp-0005x2-Of; Mon, 06 Jun 2022 11:08:05 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxgj2nFYz4xXJ;
 Tue,  7 Jun 2022 01:08:01 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxgc0SLJz4xD5;
 Tue,  7 Jun 2022 01:07:55 +1000 (AEST)
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
Subject: [PATCH 02/21] aspeed: i2c: Add ctrl_global_rsvd property
Date: Mon,  6 Jun 2022 17:07:13 +0200
Message-Id: <20220606150732.2282041-3-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606150732.2282041-1-clg@kaod.org>
References: <20220606150732.2282041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
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

From: Joe Komlodi <komlodi@google.com>

The Aspeed I2C controller is used across other SKUs that have different
reserved bits for the ctrl_global_rsvd register.

Signed-off-by: Joe Komlodi <komlodi@google.com>
Change-Id: I606c5933c527274a9d2b0afe559b2e895767636c
Message-Id: <20220331043248.2237838-3-komlodi@google.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h | 2 ++
 hw/arm/aspeed_ast2600.c     | 2 ++
 hw/i2c/aspeed_i2c.c         | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 4b9be09274c7..3912fcc3ff53 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -71,6 +71,8 @@ struct AspeedI2CState {
     MemoryRegion pool_iomem;
     uint8_t pool[ASPEED_I2C_MAX_POOL_SIZE];
 
+    uint32_t ctrl_global_rsvd;
+
     AspeedI2CBus busses[ASPEED_I2C_NR_BUSSES];
     MemoryRegion *dram_mr;
     AddressSpace dram_as;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index b0a4199b6960..cc57c8b437d8 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -375,6 +375,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     aspeed_soc_uart_init(s);
 
     /* I2C */
+    object_property_set_int(OBJECT(&s->i2c), "ctrl-global-rsvd", 0xfffc3e00,
+                            &error_abort);
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
                              &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 03a4f5a91010..97eb9d57929c 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -648,6 +648,7 @@ static void aspeed_i2c_ctrl_write(void *opaque, hwaddr offset,
 
     switch (offset) {
     case I2C_CTRL_GLOBAL:
+        value &= ~s->ctrl_global_rsvd;
         s->ctrl_global = value;
         break;
     case I2C_CTRL_STATUS:
@@ -730,6 +731,7 @@ static const VMStateDescription aspeed_i2c_vmstate = {
     .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(intr_status, AspeedI2CState),
+        VMSTATE_UINT32(ctrl_global_rsvd, AspeedI2CState),
         VMSTATE_STRUCT_ARRAY(busses, AspeedI2CState,
                              ASPEED_I2C_NR_BUSSES, 1, aspeed_i2c_bus_vmstate,
                              AspeedI2CBus),
@@ -828,6 +830,8 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
 static Property aspeed_i2c_properties[] = {
     DEFINE_PROP_LINK("dram", AspeedI2CState, dram_mr,
                      TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_UINT32("ctrl-global-rsvd", AspeedI2CState, ctrl_global_rsvd,
+                       0xfffffffe),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.35.3


