Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894C52E870F
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 12:29:39 +0100 (CET)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvf6I-0003jk-L5
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 06:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqt-0000qG-D7
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:43 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:56510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqr-00078n-GI
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:43 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B5616747605;
 Sat,  2 Jan 2021 12:13:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 25836747611; Sat,  2 Jan 2021 12:13:30 +0100 (CET)
Message-Id: <a9312553c9bf4e9992fd6aa8f21a33c68d5e406c.1609584216.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609584215.git.balaton@eik.bme.hu>
References: <cover.1609584215.git.balaton@eik.bme.hu>
Subject: [PATCH 18/24] vt82c686: Simplify vt82c686b_realize()
Date: Sat, 02 Jan 2021 11:43:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Remove unneeded variables and setting value to 0 on zero initialised
data and replace check for error with error_fatal. Rationalise loop
that sets PCI config header fields read only.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index a989e29fe5..ead60310fe 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -363,24 +363,16 @@ static void vt82c686b_isa_reset(DeviceState *dev)
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
     VT82C686BISAState *s = VT82C686B_ISA(d);
-    uint8_t *pci_conf;
+    DeviceState *dev = DEVICE(d);
     ISABus *isa_bus;
-    uint8_t *wmask;
     int i;
 
-    isa_bus = isa_bus_new(DEVICE(d), get_system_memory(),
-                          pci_address_space_io(d), errp);
-    if (!isa_bus) {
-        return;
-    }
-
-    pci_conf = d->config;
-    pci_config_set_prog_interface(pci_conf, 0x0);
+    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+                          &error_fatal);
 
-    wmask = d->wmask;
-    for (i = 0x00; i < 0xff; i++) {
-        if (i <= 0x03 || (i >= 0x08 && i <= 0x3f)) {
-            wmask[i] = 0x00;
+    for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
+        if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
+            d->wmask[i] = 0;
         }
     }
 
-- 
2.21.3


