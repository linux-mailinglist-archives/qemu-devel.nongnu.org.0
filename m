Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A622E2942
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 00:37:33 +0100 (CET)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksaAl-0007gJ-JE
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 18:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksa7Q-0005JD-Qk
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 18:34:04 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:33896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksa7N-0007MT-Va
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 18:34:04 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1CACE7470E1;
 Fri, 25 Dec 2020 00:33:57 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 883FB746557; Fri, 25 Dec 2020 00:33:56 +0100 (CET)
Message-Id: <47c59c404e979f6ad2eaf2be776f1a56cabe7671.1608852217.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1608852217.git.balaton@eik.bme.hu>
References: <cover.1608852217.git.balaton@eik.bme.hu>
Subject: [PATCH 1/2] ide: Make room for flags in PCIIDEState and add one for
 legacy mode
Date: Fri, 25 Dec 2020 00:23:37 +0100
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
Cc: philmd@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, John Snow <jsnow@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

We'll need a flag for implementing some device specific behaviour in
via-ide but we already have a currently CMD646 specific field that can
be repurposed for this and leave room for furhter flags if needed in
the future. This patch changes the "secondary" field to "flags" and
change CMD646 and its users accordingly and define a new flag for
forcing legacy mode that will be used by via-ide for now.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ide/cmd646.c      | 4 ++--
 hw/sparc64/sun4u.c   | 2 +-
 include/hw/ide/pci.h | 7 ++++++-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index c254631485..7a96016116 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -256,7 +256,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
     pci_conf[PCI_CLASS_PROG] = 0x8f;
 
     pci_conf[CNTRL] = CNTRL_EN_CH0; // enable IDE0
-    if (d->secondary) {
+    if (d->flags & BIT(PCI_IDE_SECONDARY)) {
         /* XXX: if not enabled, really disable the seconday IDE controller */
         pci_conf[CNTRL] |= CNTRL_EN_CH1; /* enable IDE1 */
     }
@@ -314,7 +314,7 @@ static void pci_cmd646_ide_exitfn(PCIDevice *dev)
 }
 
 static Property cmd646_ide_properties[] = {
-    DEFINE_PROP_UINT32("secondary", PCIIDEState, secondary, 0),
+    DEFINE_PROP_BIT("secondary", PCIIDEState, flags, PCI_IDE_SECONDARY, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 0fa13a7330..c46baa9f48 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -674,7 +674,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     }
 
     pci_dev = pci_new(PCI_DEVFN(3, 0), "cmd646-ide");
-    qdev_prop_set_uint32(&pci_dev->qdev, "secondary", 1);
+    qdev_prop_set_bit(&pci_dev->qdev, "secondary", true);
     pci_realize_and_unref(pci_dev, pci_busA, &error_fatal);
     pci_ide_create_devs(pci_dev);
 
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index d8384e1c42..75d1a32f6d 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -42,6 +42,11 @@ typedef struct BMDMAState {
 #define TYPE_PCI_IDE "pci-ide"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIIDEState, PCI_IDE)
 
+enum {
+    PCI_IDE_SECONDARY, /* used only for cmd646 */
+    PCI_IDE_LEGACY_MODE
+};
+
 struct PCIIDEState {
     /*< private >*/
     PCIDevice parent_obj;
@@ -49,7 +54,7 @@ struct PCIIDEState {
 
     IDEBus bus[2];
     BMDMAState bmdma[2];
-    uint32_t secondary; /* used only for cmd646 */
+    uint32_t flags;
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
     MemoryRegion data_bar[2];
-- 
2.21.3


