Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E62E2E2F9F
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 02:38:09 +0100 (CET)
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktL0a-0003bh-HE
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 20:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkY-0008TZ-NV
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:35 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:61530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkS-0001Dp-R7
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:34 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A40DB7470F7;
 Sun, 27 Dec 2020 02:21:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F41667470F5; Sun, 27 Dec 2020 02:21:17 +0100 (CET)
Message-Id: <0de0e2415076e095479000882df6ff42619eafc8.1609031406.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609031406.git.balaton@eik.bme.hu>
References: <cover.1609031406.git.balaton@eik.bme.hu>
Subject: [PATCH 12/12] vt82c686: Do not add floppy
Date: Sun, 27 Dec 2020 02:10:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

The floppy is inaccessible because its ports are shadowed by the
config registers of the superio part (switchable on the real chip but
we don't model that) so disable adding the floppy matching the
existing comment in vt82c686b_isa_realize() as it's not usable.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 698627d1b5..2b7a3bdba1 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -348,14 +348,19 @@ static const TypeInfo via_isa_info = {
     },
 };
 
+static bool vt82c686b_superio_floppy_is_enabled(ISASuperIODevice *sio, uint8_t index)
+{
+        return false; /* Disabled due to clash with SuperIO Config reg ports */
+}
+
 static void vt82c686b_superio_class_init(ObjectClass *klass, void *data)
 {
     ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
 
     sc->serial.count = 2;
     sc->parallel.count = 1;
-    sc->ide.count = 0;
-    sc->floppy.count = 1;
+    sc->ide.count = 0; /* Emulated by via-ide */
+    sc->floppy.is_enabled = vt82c686b_superio_floppy_is_enabled;
 }
 
 static const TypeInfo via_superio_info = {
-- 
2.21.3


