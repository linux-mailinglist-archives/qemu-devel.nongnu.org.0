Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1609A3AD94F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 12:04:11 +0200 (CEST)
Received: from localhost ([::1]:40346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXpi-0001iM-26
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 06:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1luXk4-00066V-5i; Sat, 19 Jun 2021 05:58:20 -0400
Received: from zamok.crans.org ([185.230.79.1]:49662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1luXk0-0002DD-7B; Sat, 19 Jun 2021 05:58:18 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 89E80E0172; Sat, 19 Jun 2021 11:58:03 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] docs/system: arm: Add nRF boards description
Date: Sat, 19 Jun 2021 11:57:50 +0200
Message-Id: <20210619095750.3216150-1-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.230.79.1; envelope-from=erdnaxe@crans.org;
 helo=zamok.crans.org
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
 "open list:NRF51" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds the target guide for BBC Micro:bit.

Information is taken from https://wiki.qemu.org/Features/MicroBit
and from hw/arm/nrf51_soc.c.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
---
 MAINTAINERS                |  1 +
 docs/system/arm/nrf.rst    | 49 ++++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 3 files changed, 51 insertions(+)
 create mode 100644 docs/system/arm/nrf.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 636bf2f536..7c54611cc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1031,6 +1031,7 @@ F: hw/*/microbit*.c
 F: include/hw/*/nrf51*.h
 F: include/hw/*/microbit*.h
 F: tests/qtest/microbit-test.c
+F: docs/system/arm/nrf.rst
 
 AVR Machines
 -------------
diff --git a/docs/system/arm/nrf.rst b/docs/system/arm/nrf.rst
new file mode 100644
index 0000000000..e30aba8b06
--- /dev/null
+++ b/docs/system/arm/nrf.rst
@@ -0,0 +1,49 @@
+Nordic nRF boards (``microbit``)
+================================
+
+The `Nordic nRF`_ chips are a family of ARM-based System-on-Chip that
+are designed to be used for low-power and short-range wireless solutions.
+
+.. _Nordic nRF: https://www.nordicsemi.com/Products
+
+The nRF51 series is the first series for short range wireless applications.
+It is superseded by the nRF51 series.
+The following machines are based on this chip :
+
+- ``microbit``       BBC micro:bit board with nRF51822 SoC
+
+There are other series such as nRF52, nRF53 and nRF91 which are currently not
+supported by QEMU.
+
+Supported devices
+-----------------
+
+ * ARM Cortex-M0 (ARMv6-M)
+ * Serial ports (UART)
+ * Clock controller
+ * Timers
+ * Random Number Generator (RNG)
+ * GPIO controller
+ * NVMC
+ * SWI
+
+Missing devices
+---------------
+
+ * Watchdog
+ * Real-Time Clock (RTC) controller
+ * TWI (i2c)
+ * SPI controller
+ * Analog to Digital Converter (ADC)
+ * Quadrature decoder
+ * Radio
+
+Boot options
+------------
+
+The Micro:bit machine can be started using the ``-device`` option to load a
+firmware in hexadecimal format. Example:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M microbit -device loader,file=test.hex
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index edd013c7bb..5277ac0242 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -87,6 +87,7 @@ undocumented; you can get a complete list by running
    arm/digic
    arm/musicpal
    arm/gumstix
+   arm/nrf
    arm/nseries
    arm/nuvoton
    arm/orangepi
-- 
2.25.1


