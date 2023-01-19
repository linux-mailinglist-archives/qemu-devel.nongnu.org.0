Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1A6738B2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:36:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU8z-0006z4-1v; Thu, 19 Jan 2023 07:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8v-0006oY-JU; Thu, 19 Jan 2023 07:35:45 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8t-0007dU-VZ; Thu, 19 Jan 2023 07:35:45 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMYB6lm5z4xyK;
 Thu, 19 Jan 2023 23:35:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMY84gxGz4xHV;
 Thu, 19 Jan 2023 23:35:40 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 14/25] hw/nvram/eeprom_at24c: Make reset behavior more like
 hardware
Date: Thu, 19 Jan 2023 13:34:38 +0100
Message-Id: <20230119123449.531826-15-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Delevoryas <peter@pjd.dev>

EEPROM's are a form of non-volatile memory. After power-cycling an EEPROM,
I would expect the I2C state machine to be reset to default values, but I
wouldn't really expect the memory to change at all.

The current implementation of the at24c EEPROM resets its internal memory on
reset. This matches the specification in docs/devel/reset.rst:

  Cold reset is supported by every resettable object. In QEMU, it means we reset
  to the initial state corresponding to the start of QEMU; this might differ
  from what is a real hardware cold reset. It differs from other resets (like
  warm or bus resets) which may keep certain parts untouched.

But differs from my intuition. For example, if someone writes some information
to an EEPROM, then AC power cycles their board, they would expect the EEPROM to
retain that information. It's very useful to be able to test things like this
in QEMU as well, to verify software instrumentation like determining the cause
of a reboot.

Fixes: 5d8424dbd3e8 ("nvram: add AT24Cx i2c eeprom")
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/nvram/eeprom_at24c.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index f8d751fa27..5074776bff 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -185,18 +185,6 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
     }
 
     ee->mem = g_malloc0(ee->rsize);
-
-}
-
-static
-void at24c_eeprom_reset(DeviceState *state)
-{
-    EEPROMState *ee = AT24C_EE(state);
-
-    ee->changed = false;
-    ee->cur = 0;
-    ee->haveaddr = 0;
-
     memset(ee->mem, 0, ee->rsize);
 
     if (ee->init_rom) {
@@ -214,6 +202,16 @@ void at24c_eeprom_reset(DeviceState *state)
     }
 }
 
+static
+void at24c_eeprom_reset(DeviceState *state)
+{
+    EEPROMState *ee = AT24C_EE(state);
+
+    ee->changed = false;
+    ee->cur = 0;
+    ee->haveaddr = 0;
+}
+
 static Property at24c_eeprom_props[] = {
     DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
-- 
2.39.0


