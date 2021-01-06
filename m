Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB3D2EC06F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 16:34:26 +0100 (CET)
Received: from localhost ([::1]:54316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxApN-00088F-Oc
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 10:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxAkQ-0003uR-Ht; Wed, 06 Jan 2021 10:29:18 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:13310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxAkM-00032l-25; Wed, 06 Jan 2021 10:29:17 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 878387470EB;
 Wed,  6 Jan 2021 16:29:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 00C5F7470DF; Wed,  6 Jan 2021 16:29:10 +0100 (CET)
Message-Id: <4d0a7d911f44689cd814823baf092a034972a259.1609946641.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609946641.git.balaton@eik.bme.hu>
References: <cover.1609946641.git.balaton@eik.bme.hu>
Subject: [PATCH 2/3] Revert "ppc4xx: Move common dependency on serial to
 common option"
Date: Wed, 06 Jan 2021 16:24:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

This reverts commit e6d5106786 which was added mistakenly. While this
change works it was suggested during review that keeping dependencies
explicit for each board may be better than listing them in a common
option so keep the previous version and revert this change.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index d2329edbab..d11dc30509 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -36,6 +36,7 @@ config PPC405
     select M48T59
     select PFLASH_CFI02
     select PPC4XX
+    select SERIAL
 
 config PPC440
     bool
@@ -44,6 +45,7 @@ config PPC440
     imply E1000_PCI
     select PCI_EXPRESS
     select PPC4XX
+    select SERIAL
     select FDT_PPC
 
 config PPC4XX
@@ -51,7 +53,6 @@ config PPC4XX
     select BITBANG_I2C
     select PCI
     select PPC_UIC
-    select SERIAL
 
 config SAM460EX
     bool
@@ -60,6 +61,7 @@ config SAM460EX
     select IDE_SII3112
     select M41T80
     select PPC440
+    select SERIAL
     select SM501
     select SMBUS_EEPROM
     select USB_EHCI_SYSBUS
@@ -121,6 +123,7 @@ config VIRTEX
     bool
     select PPC4XX
     select PFLASH_CFI01
+    select SERIAL
     select XILINX
     select XILINX_ETHLITE
     select FDT_PPC
-- 
2.21.3


