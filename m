Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E782FB178
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 07:34:01 +0100 (CET)
Received: from localhost ([::1]:55950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1kaW-0003uN-HA
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 01:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQs-0001U9-GP; Tue, 19 Jan 2021 01:24:02 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47877 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQq-0000aN-Pi; Tue, 19 Jan 2021 01:24:02 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DKdrZ4XPzz9srY; Tue, 19 Jan 2021 17:23:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611037406;
 bh=QsJzCm5/tGou+LocHcbDDZVTxVgpms8hkwzIpO8gcpM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=brHtw/p3ogsdbU9c7BK6ngAAXKIjum0RUTTYbQYPH3nvNj4X5MZ0qGgUZthXYjxZo
 pkO5Yk0B03YaMvmBmGjIvFksVRBXSEWWh0k/3pCrfeBMjBlMLd2a8PH4ics5qFClOL
 l3JezzPgiDvvSBNXF//qNJ+11LRmkSlUK5D4p1nY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 07/13] Revert "ppc4xx: Move common dependency on serial to
 common option"
Date: Tue, 19 Jan 2021 17:23:12 +1100
Message-Id: <20210119062318.13857-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119062318.13857-1-david@gibson.dropbear.id.au>
References: <20210119062318.13857-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

This reverts commit e6d5106786 which was added mistakenly. While this
change works it was suggested during review that keeping dependencies
explicit for each board may be better than listing them in a common
option so keep the previous version and revert this change.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <8c65807fc7dc1c4c4f6320f2fd6409a3091c88ff.1610143658.git.balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.29.2


