Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D01400660
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:12:34 +0200 (CEST)
Received: from localhost ([::1]:56094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFY9-0000Hq-IZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF4A-0004LT-Kz
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:41:34 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:53871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF40-0002GS-Cs
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:41:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2C2F02024C;
 Fri,  3 Sep 2021 19:41:12 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 3 Sep
 2021 21:41:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0056a1187b9-10f0-4c2e-893f-a9635461dba8,
 15E2C03324B5D6AD2543493448FEC157D625CB40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/14] watchdog: aspeed: Sanitize control register values
Date: Fri, 3 Sep 2021 21:40:57 +0200
Message-ID: <20210903194108.131403-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903194108.131403-1-clg@kaod.org>
References: <20210903194108.131403-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e25ce91e-0ff2-47a8-8c63-429c3eb3a9ba
X-Ovh-Tracer-Id: 8815796272745843494
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgudefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jeffery <andrew@aj.id.au>

While some of the critical fields remain the same, there is variation in
the definition of the control register across the SoC generations.
Reserved regions are adjusted, while in other cases the mutability or
behaviour of fields change.

Introduce a callback to sanitize the value on writes to ensure model
behaviour reflects the hardware.

Fixes: 854123bf8d4b ("wdt: Add Aspeed watchdog device model")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210709053107.1829304-2-andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/watchdog/wdt_aspeed.h |  1 +
 hw/watchdog/wdt_aspeed.c         | 24 ++++++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index 80b03661e303..f945cd6c5833 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -44,6 +44,7 @@ struct AspeedWDTClass {
     uint32_t reset_ctrl_reg;
     void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
     void (*wdt_reload)(AspeedWDTState *s);
+    uint64_t (*sanitize_ctrl)(uint64_t data);
 };
 
 #endif /* WDT_ASPEED_H */
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 6352ba1b0e5b..faa3d35fdf21 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -118,13 +118,27 @@ static void aspeed_wdt_reload_1mhz(AspeedWDTState *s)
     }
 }
 
+static uint64_t aspeed_2400_sanitize_ctrl(uint64_t data)
+{
+    return data & 0xffff;
+}
+
+static uint64_t aspeed_2500_sanitize_ctrl(uint64_t data)
+{
+    return (data & ~(0xfUL << 8)) | WDT_CTRL_1MHZ_CLK;
+}
+
+static uint64_t aspeed_2600_sanitize_ctrl(uint64_t data)
+{
+    return data & ~(0x7UL << 7);
+}
 
 static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
                              unsigned size)
 {
     AspeedWDTState *s = ASPEED_WDT(opaque);
     AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(s);
-    bool enable = data & WDT_CTRL_ENABLE;
+    bool enable;
 
     offset >>= 2;
 
@@ -144,6 +158,8 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
         }
         break;
     case WDT_CTRL:
+        data = awc->sanitize_ctrl(data);
+        enable = data & WDT_CTRL_ENABLE;
         if (enable && !aspeed_wdt_is_enabled(s)) {
             s->regs[WDT_CTRL] = data;
             awc->wdt_reload(s);
@@ -207,11 +223,12 @@ static const MemoryRegionOps aspeed_wdt_ops = {
 static void aspeed_wdt_reset(DeviceState *dev)
 {
     AspeedWDTState *s = ASPEED_WDT(dev);
+    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(s);
 
     s->regs[WDT_STATUS] = 0x3EF1480;
     s->regs[WDT_RELOAD_VALUE] = 0x03EF1480;
     s->regs[WDT_RESTART] = 0;
-    s->regs[WDT_CTRL] = 0;
+    s->regs[WDT_CTRL] = awc->sanitize_ctrl(0);
     s->regs[WDT_RESET_WIDTH] = 0xFF;
 
     timer_del(s->timer);
@@ -293,6 +310,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
     awc->ext_pulse_width_mask = 0xff;
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->wdt_reload = aspeed_wdt_reload;
+    awc->sanitize_ctrl = aspeed_2400_sanitize_ctrl;
 }
 
 static const TypeInfo aspeed_2400_wdt_info = {
@@ -328,6 +346,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
     awc->wdt_reload = aspeed_wdt_reload_1mhz;
+    awc->sanitize_ctrl = aspeed_2500_sanitize_ctrl;
 }
 
 static const TypeInfo aspeed_2500_wdt_info = {
@@ -348,6 +367,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
     awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
     awc->wdt_reload = aspeed_wdt_reload_1mhz;
+    awc->sanitize_ctrl = aspeed_2600_sanitize_ctrl;
 }
 
 static const TypeInfo aspeed_2600_wdt_info = {
-- 
2.31.1


