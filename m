Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4B4652625
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:23:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7gPK-0001N5-Sk; Tue, 20 Dec 2022 12:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7gPA-0001LC-DE; Tue, 20 Dec 2022 12:27:52 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7gP6-00057S-7P; Tue, 20 Dec 2022 12:27:52 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by mail.gandi.net (Postfix) with ESMTPSA id C8BD56000A;
 Tue, 20 Dec 2022 17:27:41 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org
Subject: [PATCH] i.MX7D: Compute clock frequency for the fixed frequency
 clocks.
Date: Tue, 20 Dec 2022 18:27:39 +0100
Message-Id: <b39c13bd71adaa91559d3436e724d90280e81c63.1671548388.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671548388.git.jcd@tribudubois.net>
References: <cover.1671548388.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.195; envelope-from=jcd@tribudubois.net;
 helo=relay3-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

CCM derived clocks will have to be added later.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/misc/imx7_ccm.c | 49 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/hw/misc/imx7_ccm.c b/hw/misc/imx7_ccm.c
index 075159e497..f135ec7b7e 100644
--- a/hw/misc/imx7_ccm.c
+++ b/hw/misc/imx7_ccm.c
@@ -16,6 +16,10 @@
 #include "hw/misc/imx7_ccm.h"
 #include "migration/vmstate.h"
 
+#include "trace.h"
+
+#define CKIH_FREQ 24000000 /* 24MHz crystal input */
+
 static void imx7_analog_reset(DeviceState *dev)
 {
     IMX7AnalogState *s = IMX7_ANALOG(dev);
@@ -219,16 +223,43 @@ static const VMStateDescription vmstate_imx7_ccm = {
 static uint32_t imx7_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
 {
     /*
-     * This function is "consumed" by GPT emulation code, however on
-     * i.MX7 each GPT block can have their own clock root. This means
-     * that this functions needs somehow to know requester's identity
-     * and the way to pass it: be it via additional IMXClk constants
-     * or by adding another argument to this method needs to be
-     * figured out
+     * This function is "consumed" by GPT emulation code. Some clocks
+     * have fixed frequencies and we can provide requested frequency
+     * easily. However for CCM provided clocks (like IPG) each GPT
+     * timer can have its own clock root.
+     * This means we need additionnal information when calling this
+     * function to know the requester's identity.
      */
-    qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Not implemented\n",
-                  TYPE_IMX7_CCM, __func__);
-    return 0;
+    uint32_t freq = 0;
+
+    switch (clock) {
+    case CLK_NONE:
+        break;
+    case CLK_32k:
+        freq = CKIL_FREQ;
+        break;
+    case CLK_HIGH:
+        freq = CKIH_FREQ;
+        break;
+    case CLK_IPG:
+    case CLK_IPG_HIGH:
+        /*
+         * For now we don't have a way to figure out the device this
+         * function is called for. Until then the IPG derived clocks
+         * are left unimplemented.
+         */
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Clock %d Not implemented\n",
+                      TYPE_IMX7_CCM, __func__, clock);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: unsupported clock %d\n",
+                      TYPE_IMX7_CCM, __func__, clock);
+        break;
+    }
+
+    trace_ccm_clock_freq(clock, freq);
+
+    return freq;
 }
 
 static void imx7_ccm_class_init(ObjectClass *klass, void *data)
-- 
2.34.1


