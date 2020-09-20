Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980512712E0
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Sep 2020 10:25:15 +0200 (CEST)
Received: from localhost ([::1]:42128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJueo-00017e-NT
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 04:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kJuag-0003ch-2d; Sun, 20 Sep 2020 04:20:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56566
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kJuae-0003uy-5x; Sun, 20 Sep 2020 04:20:57 -0400
Received: from host81-154-161-117.range81-154.btcentralplus.com
 ([81.154.161.117] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kJubA-0006Dn-Kp; Sun, 20 Sep 2020 09:21:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: armbru@redhat.com, david@gibson.dropbear.id.au, atar4qemu@gmail.com,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Date: Sun, 20 Sep 2020 09:20:17 +0100
Message-Id: <20200920082018.16135-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200920082018.16135-1-mark.cave-ayland@ilande.co.uk>
References: <20200920082018.16135-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.161.117
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 5/6] macio: don't reference serial_hd() directly within the
 device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead use qdev_prop_set_chr() to configure the ESCC serial chardevs at the
Mac Old World and New World machine level.

Also remove the now obsolete comment referring to the use of serial_hd() and
change user_createable to true accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/macio.c | 5 +----
 hw/ppc/mac_newworld.c | 6 ++++++
 hw/ppc/mac_oldworld.c | 6 ++++++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 679722628e..ce641d41fd 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -109,8 +109,6 @@ static void macio_common_realize(PCIDevice *d, Error **errp)
     qdev_prop_set_uint32(DEVICE(&s->escc), "disabled", 0);
     qdev_prop_set_uint32(DEVICE(&s->escc), "frequency", ESCC_CLOCK);
     qdev_prop_set_uint32(DEVICE(&s->escc), "it_shift", 4);
-    qdev_prop_set_chr(DEVICE(&s->escc), "chrA", serial_hd(0));
-    qdev_prop_set_chr(DEVICE(&s->escc), "chrB", serial_hd(1));
     qdev_prop_set_uint32(DEVICE(&s->escc), "chnBtype", escc_serial);
     qdev_prop_set_uint32(DEVICE(&s->escc), "chnAtype", escc_serial);
     if (!qdev_realize(DEVICE(&s->escc), BUS(&s->macio_bus), errp)) {
@@ -458,8 +456,7 @@ static void macio_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_OTHERS << 8;
     device_class_set_props(dc, macio_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    /* Reason: Uses serial_hds in macio_instance_init */
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 }
 
 static const TypeInfo macio_bus_info = {
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index e42bd7a626..e59b30e0a7 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -123,6 +123,7 @@ static void ppc_core99_init(MachineState *machine)
     UNINHostState *uninorth_pci;
     PCIBus *pci_bus;
     PCIDevice *macio;
+    ESCCState *escc;
     bool has_pmu, has_adb;
     MACIOIDEState *macio_ide;
     BusState *adb_bus;
@@ -382,6 +383,11 @@ static void ppc_core99_init(MachineState *machine)
     qdev_prop_set_bit(dev, "has-adb", has_adb);
     object_property_set_link(OBJECT(macio), "pic", OBJECT(pic_dev),
                              &error_abort);
+
+    escc = ESCC(object_resolve_path_component(OBJECT(macio), "escc"));
+    qdev_prop_set_chr(DEVICE(escc), "chrA", serial_hd(0));
+    qdev_prop_set_chr(DEVICE(escc), "chrB", serial_hd(1));
+
     pci_realize_and_unref(macio, pci_bus, &error_fatal);
 
     /* We only emulate 2 out of 3 IDE controllers for now */
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 7aba040f1b..25ade63ba3 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -96,6 +96,7 @@ static void ppc_heathrow_init(MachineState *machine)
     PCIBus *pci_bus;
     PCIDevice *macio;
     MACIOIDEState *macio_ide;
+    ESCCState *escc;
     SysBusDevice *s;
     DeviceState *dev, *pic_dev;
     BusState *adb_bus;
@@ -283,6 +284,11 @@ static void ppc_heathrow_init(MachineState *machine)
     qdev_prop_set_uint64(dev, "frequency", tbfreq);
     object_property_set_link(OBJECT(macio), "pic", OBJECT(pic_dev),
                              &error_abort);
+
+    escc = ESCC(object_resolve_path_component(OBJECT(macio), "escc"));
+    qdev_prop_set_chr(DEVICE(escc), "chrA", serial_hd(0));
+    qdev_prop_set_chr(DEVICE(escc), "chrB", serial_hd(1));
+
     pci_realize_and_unref(macio, pci_bus, &error_fatal);
 
     macio_ide = MACIO_IDE(object_resolve_path_component(OBJECT(macio),
-- 
2.20.1


