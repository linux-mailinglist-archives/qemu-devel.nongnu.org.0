Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A0669A48A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 04:45:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSreY-0005YT-GB; Thu, 16 Feb 2023 22:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pSreW-0005Xq-HT; Thu, 16 Feb 2023 22:43:16 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pSreV-0007At-1P; Thu, 16 Feb 2023 22:43:16 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 3DD5911F055;
 Fri, 17 Feb 2023 03:43:13 +0000 (UTC)
From: ~ssinprem <ssinprem@git.sr.ht>
Date: Fri, 17 Feb 2023 10:31:27 +0700
Subject: [PATCH qemu v3 1/2] hw/at24c : modify at24c to support 1 byte address
 mode
Message-ID: <167660539263.10409.9736070122710923479-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167660539263.10409.9736070122710923479-0@git.sr.ht>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: qemu-stable@nongnu.org, ssinprem@celestica.com, ssumet@celestica.com,
 srikanth@celestica.com, kgengan@celestica.com, clg@kaod.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-To: ~ssinprem <ssinprem@celestica.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Sittisak Sinprem <ssinprem@celestica.com>

Signed-off-by: Sittisak Sinprem <ssinprem@celestica.com>
---
 hw/nvram/eeprom_at24c.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 3328c32814..64259cde67 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -41,6 +41,12 @@ struct EEPROMState {
     uint16_t cur;
     /* total size in bytes */
     uint32_t rsize;
+    /* address byte number=20
+     *  for  24c01, 24c02 size <=3D 256 byte, use only 1 byte
+     *  otherwise size > 256, use 2 byte
+     */
+    uint8_t asize;
+
     bool writable;
     /* cells changed since last START? */
     bool changed;
@@ -91,7 +97,10 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
     EEPROMState *ee =3D AT24C_EE(s);
     uint8_t ret;
=20
-    if (ee->haveaddr =3D=3D 1) {
+    /* If got the byte address but not completely with address size
+     *  will return the invalid value
+     */
+    if (ee->haveaddr > 0 && ee->haveaddr < ee->asize) {
         return 0xff;
     }
=20
@@ -108,11 +117,11 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
 {
     EEPROMState *ee =3D AT24C_EE(s);
=20
-    if (ee->haveaddr < 2) {
+    if (ee->haveaddr < ee->asize) {
         ee->cur <<=3D 8;
         ee->cur |=3D data;
         ee->haveaddr++;
-        if (ee->haveaddr =3D=3D 2) {
+        if (ee->haveaddr =3D=3D ee->asize) {
             ee->cur %=3D ee->rsize;
             DPRINTK("Set pointer %04x\n", ee->cur);
         }
@@ -199,6 +208,18 @@ static void at24c_eeprom_realize(DeviceState *dev, Error=
 **errp)
         }
         DPRINTK("Reset read backing file\n");
     }
+
+    /*
+     * If address size didn't define with property set
+     *   value is 0 as default, setting it by Rom size detecting.
+     */
+    if (ee->asize =3D=3D 0) {
+        if (ee->rsize <=3D 256) {
+            ee->asize =3D 1;
+        } else {
+            ee->asize =3D 2;
+        }
+    }
 }
=20
 static
@@ -213,6 +234,7 @@ void at24c_eeprom_reset(DeviceState *state)
=20
 static Property at24c_eeprom_props[] =3D {
     DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
+    DEFINE_PROP_UINT8("address-size", EEPROMState, asize, 0),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
     DEFINE_PROP_DRIVE("drive", EEPROMState, blk),
     DEFINE_PROP_END_OF_LIST()
--=20
2.34.6


