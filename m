Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0BB6A71A9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:58:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXPlG-0000kS-6S; Wed, 01 Mar 2023 11:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPlC-0000j3-50; Wed, 01 Mar 2023 11:56:58 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPlA-0007hd-As; Wed, 01 Mar 2023 11:56:57 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PRgPc4Q31z4xDh;
 Thu,  2 Mar 2023 03:56:52 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PRgPY2YZ3z4x5Y;
 Thu,  2 Mar 2023 03:56:49 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Sittisak Sinprem <ssinprem@celestica.com>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 07/11] hw/at24c : modify at24c to support 1 byte address
 mode
Date: Wed,  1 Mar 2023 17:56:15 +0100
Message-Id: <20230301165619.2171090-8-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301165619.2171090-1-clg@kaod.org>
References: <20230301165619.2171090-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=znpK=6Z=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Sittisak Sinprem <ssinprem@celestica.com>

Signed-off-by: Sittisak Sinprem <ssinprem@celestica.com>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
[ clg: checkpatch issues ]
Message-Id: <167660539263.10409.9736070122710923479-1@git.sr.ht>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/nvram/eeprom_at24c.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 3328c32814..613c4929e3 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -41,6 +41,13 @@ struct EEPROMState {
     uint16_t cur;
     /* total size in bytes */
     uint32_t rsize;
+    /*
+     * address byte number
+     *  for  24c01, 24c02 size <= 256 byte, use only 1 byte
+     *  otherwise size > 256, use 2 byte
+     */
+    uint8_t asize;
+
     bool writable;
     /* cells changed since last START? */
     bool changed;
@@ -91,7 +98,11 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
     EEPROMState *ee = AT24C_EE(s);
     uint8_t ret;
 
-    if (ee->haveaddr == 1) {
+    /*
+     * If got the byte address but not completely with address size
+     * will return the invalid value
+     */
+    if (ee->haveaddr > 0 && ee->haveaddr < ee->asize) {
         return 0xff;
     }
 
@@ -108,11 +119,11 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
 {
     EEPROMState *ee = AT24C_EE(s);
 
-    if (ee->haveaddr < 2) {
+    if (ee->haveaddr < ee->asize) {
         ee->cur <<= 8;
         ee->cur |= data;
         ee->haveaddr++;
-        if (ee->haveaddr == 2) {
+        if (ee->haveaddr == ee->asize) {
             ee->cur %= ee->rsize;
             DPRINTK("Set pointer %04x\n", ee->cur);
         }
@@ -199,6 +210,18 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
         }
         DPRINTK("Reset read backing file\n");
     }
+
+    /*
+     * If address size didn't define with property set
+     *   value is 0 as default, setting it by Rom size detecting.
+     */
+    if (ee->asize == 0) {
+        if (ee->rsize <= 256) {
+            ee->asize = 1;
+        } else {
+            ee->asize = 2;
+        }
+    }
 }
 
 static
@@ -213,6 +236,7 @@ void at24c_eeprom_reset(DeviceState *state)
 
 static Property at24c_eeprom_props[] = {
     DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
+    DEFINE_PROP_UINT8("address-size", EEPROMState, asize, 0),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
     DEFINE_PROP_DRIVE("drive", EEPROMState, blk),
     DEFINE_PROP_END_OF_LIST()
-- 
2.39.2


