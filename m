Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A0F670EB4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 01:36:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHwPx-0005wP-96; Tue, 17 Jan 2023 19:35:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pHwPq-0005tp-4f; Tue, 17 Jan 2023 19:35:01 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pHwPn-00055J-Tn; Tue, 17 Jan 2023 19:34:57 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3F316746369;
 Wed, 18 Jan 2023 01:32:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1A3C174635C; Wed, 18 Jan 2023 01:32:32 +0100 (CET)
Message-Id: <67b2d4700879c3b4cd574f1faa1a0d1950b3d0ee.1674001242.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1674001241.git.balaton@eik.bme.hu>
References: <cover.1674001241.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 1/4] hw/misc/macio: Avoid some QOM casts
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Wed, 18 Jan 2023 01:32:32 +0100 (CET)
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

At several places we already have the object pointer with the right
type so we don't need to cast it back and forth. Avoiding these casts
improves readability.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/misc/macio/macio.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 08dbdd7fc0..0dfe372965 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -220,11 +220,11 @@ static void macio_oldworld_init(Object *obj)
     DeviceState *dev;
     int i;
 
-    object_initialize_child(OBJECT(s), "pic", &os->pic, TYPE_HEATHROW);
+    object_initialize_child(obj, "pic", &os->pic, TYPE_HEATHROW);
 
-    object_initialize_child(OBJECT(s), "cuda", &s->cuda, TYPE_CUDA);
+    object_initialize_child(obj, "cuda", &s->cuda, TYPE_CUDA);
 
-    object_initialize_child(OBJECT(s), "nvram", &os->nvram, TYPE_MACIO_NVRAM);
+    object_initialize_child(obj, "nvram", &os->nvram, TYPE_MACIO_NVRAM);
     dev = DEVICE(&os->nvram);
     qdev_prop_set_uint32(dev, "size", MACIO_NVRAM_SIZE);
     qdev_prop_set_uint32(dev, "it_shift", 4);
@@ -372,9 +372,9 @@ static void macio_newworld_init(Object *obj)
     NewWorldMacIOState *ns = NEWWORLD_MACIO(obj);
     int i;
 
-    object_initialize_child(OBJECT(s), "pic", &ns->pic, TYPE_OPENPIC);
+    object_initialize_child(obj, "pic", &ns->pic, TYPE_OPENPIC);
 
-    object_initialize_child(OBJECT(s), "gpio", &ns->gpio, TYPE_MACIO_GPIO);
+    object_initialize_child(obj, "gpio", &ns->gpio, TYPE_MACIO_GPIO);
 
     for (i = 0; i < 2; i++) {
         macio_init_ide(s, &ns->ide[i], i);
@@ -390,9 +390,9 @@ static void macio_instance_init(Object *obj)
     qbus_init(&s->macio_bus, sizeof(s->macio_bus), TYPE_MACIO_BUS,
               DEVICE(obj), "macio.0");
 
-    object_initialize_child(OBJECT(s), "dbdma", &s->dbdma, TYPE_MAC_DBDMA);
+    object_initialize_child(obj, "dbdma", &s->dbdma, TYPE_MAC_DBDMA);
 
-    object_initialize_child(OBJECT(s), "escc", &s->escc, TYPE_ESCC);
+    object_initialize_child(obj, "escc", &s->escc, TYPE_ESCC);
 }
 
 static const VMStateDescription vmstate_macio_oldworld = {
-- 
2.30.6


