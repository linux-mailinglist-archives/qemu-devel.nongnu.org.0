Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52F6155526
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 10:57:26 +0100 (CET)
Received: from localhost ([::1]:53108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j00O5-0006uq-S4
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 04:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40350)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rka@sysgo.com>) id 1j00MK-0004w5-7J
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 04:55:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rka@sysgo.com>) id 1j00MJ-0000CU-Ay
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 04:55:36 -0500
Received: from mail.sysgo.com ([176.9.12.79]:52482)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <rka@sysgo.com>)
 id 1j00MG-00008K-GF; Fri, 07 Feb 2020 04:55:32 -0500
From: Roman Kapl <rka@sysgo.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] i.MX: Fix inverted register bits in wdt code.
Date: Fri,  7 Feb 2020 10:54:09 +0100
Message-Id: <20200207095409.11227-1-rka@sysgo.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 176.9.12.79
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Roman Kapl <rka@sysgo.com>,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Documentation says for WDA '0: Assert WDOG output.' and for SRS
'0: Assert system reset signal.'.

Signed-off-by: Roman Kapl <rka@sysgo.com>
---
 hw/misc/imx2_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx2_wdt.c b/hw/misc/imx2_wdt.c
index e47e442592..c8944729c4 100644
--- a/hw/misc/imx2_wdt.c
+++ b/hw/misc/imx2_wdt.c
@@ -28,7 +28,7 @@ static void imx2_wdt_write(void *opaque, hwaddr addr,
                            uint64_t value, unsigned int size)
 {
     if (addr =3D=3D IMX2_WDT_WCR &&
-        (value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS))) {
+        (~value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS))) {
         watchdog_perform_action();
     }
 }
--=20
2.22.0


