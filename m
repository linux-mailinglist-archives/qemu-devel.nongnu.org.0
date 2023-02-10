Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39AE69667E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:21:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwA6-0004V8-A3; Tue, 14 Feb 2023 09:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pRs10-0007oA-Hn; Tue, 14 Feb 2023 04:54:22 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pRs0y-0001mk-4E; Tue, 14 Feb 2023 04:54:21 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 6CC7211F0CD;
 Tue, 14 Feb 2023 09:54:18 +0000 (UTC)
From: ~ssinprem <ssinprem@git.sr.ht>
Date: Fri, 10 Feb 2023 13:20:56 +0700
Subject: [PATCH qemu 1/2] hw/at24c : modify at24c to support 1 byte address
 mode
Message-ID: <167636845806.2107.2382940753543768501-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167636845806.2107.2382940753543768501-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, srikanth@celestica.com, kgengan@celestica.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

---
 hw/nvram/eeprom_at24c.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 2d4d8b952f..693212b661 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -87,7 +87,7 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
     EEPROMState *ee = AT24C_EE(s);
     uint8_t ret;
 
-    if (ee->haveaddr == 1) {
+    if (ee->rsize > 256 && ee->haveaddr == 1) {
         return 0xff;
     }
 
@@ -104,11 +104,13 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
 {
     EEPROMState *ee = AT24C_EE(s);
 
-    if (ee->haveaddr < 2) {
+    if ((ee->rsize > 256 && ee->haveaddr < 2) ||
+        (ee->rsize <= 256 && ee->haveaddr < 1)) {
         ee->cur <<= 8;
         ee->cur |= data;
         ee->haveaddr++;
-        if (ee->haveaddr == 2) {
+        if ((ee->rsize > 256 && ee->haveaddr == 2) ||
+            (ee->rsize <= 256 && ee->haveaddr == 1)) {
             ee->cur %= ee->rsize;
             DPRINTK("Set pointer %04x\n", ee->cur);
         }
-- 
2.34.6


