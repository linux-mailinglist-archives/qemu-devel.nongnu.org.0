Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDAF696672
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:20:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwAA-0004X4-NH; Tue, 14 Feb 2023 09:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pRs10-0007oB-K0; Tue, 14 Feb 2023 04:54:23 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pRs0y-0001ml-4F; Tue, 14 Feb 2023 04:54:21 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 8D5D811F0F4;
 Tue, 14 Feb 2023 09:54:18 +0000 (UTC)
From: ~ssinprem <ssinprem@git.sr.ht>
Date: Tue, 14 Feb 2023 16:06:49 +0700
Subject: [PATCH qemu 2/2] aspeed/fuji : correct the eeprom size
Message-ID: <167636845806.2107.2382940753543768501-2@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167636845806.2107.2382940753543768501-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, srikanth@celestica.com, kgengan@celestica.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 14 Feb 2023 09:19:57 -0500
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
Reply-To: ~ssinprem <ssinprem@celestica.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Sittisak Sinprem <ssinprem@celestca.com>

Device 24C64 the size is 64 kilobits
Device 24C02 the size is 2 kilobits
---
 hw/arm/aspeed.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 55f114ef72..8e6a1579e4 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -846,42 +846,42 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
 
-    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB);
-    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB);
+    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB / 8);
+    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB / 8);
+    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB / 8);
 
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
     i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
 
-    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB);
+    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB / 8);
     i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
 
     i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
-    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB);
+    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB / 8);
     i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
 
     i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
 
-    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);
+    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB / 8);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
-    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB);
+    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB / 8);
+    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB / 8);
+    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB / 8);
+    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB / 8);
 
-    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB);
+    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB / 8);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
-    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB);
+    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB / 8);
+    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB / 8);
+    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB / 8);
+    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB / 8);
+    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB / 8);
 
     for (int i = 0; i < 8; i++) {
         aspeed_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
-- 
2.34.6

