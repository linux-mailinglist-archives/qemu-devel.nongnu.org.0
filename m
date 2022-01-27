Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F5C49ED04
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:03:34 +0100 (CET)
Received: from localhost ([::1]:44740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDBvZ-0000vR-W0
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:03:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmt-0007wU-UM
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:35 -0500
Received: from [2001:41c9:1:41f::167] (port=36834
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBms-0004w9-AD
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:35 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmR-000BHM-3s; Thu, 27 Jan 2022 20:54:07 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Thu, 27 Jan 2022 20:54:00 +0000
Message-Id: <20220127205405.23499-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 06/11] mos6522: use device_class_set_parent_reset() to
 propagate reset to parent
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch from using a legacy approach to the more formal approach for propagating
device reset to the parent.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c    | 7 +++++--
 hw/misc/macio/cuda.c | 3 ++-
 hw/misc/macio/pmu.c  | 3 ++-
 hw/misc/mos6522.c    | 1 -
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 0756374f1b..95cf2e03d9 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1076,9 +1076,11 @@ static Property mos6522_q800_via1_properties[] = {
 static void mos6522_q800_via1_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    MOS6522DeviceClass *mdc = MOS6522_CLASS(oc);
 
     dc->realize = mos6522_q800_via1_realize;
-    dc->reset = mos6522_q800_via1_reset;
+    device_class_set_parent_reset(dc, mos6522_q800_via1_reset,
+                                  &mdc->parent_reset);
     dc->vmsd = &vmstate_q800_via1;
     device_class_set_props(dc, mos6522_q800_via1_properties);
 }
@@ -1161,7 +1163,8 @@ static void mos6522_q800_via2_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     MOS6522DeviceClass *mdc = MOS6522_CLASS(oc);
 
-    dc->reset = mos6522_q800_via2_reset;
+    device_class_set_parent_reset(dc, mos6522_q800_via2_reset,
+                                  &mdc->parent_reset);
     dc->vmsd = &vmstate_q800_via2;
     mdc->portB_write = mos6522_q800_via2_portB_write;
 }
diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index f76d9227d3..4ced31c2c5 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -606,7 +606,8 @@ static void mos6522_cuda_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     MOS6522DeviceClass *mdc = MOS6522_CLASS(oc);
 
-    dc->reset = mos6522_cuda_reset;
+    device_class_set_parent_reset(dc, mos6522_cuda_reset,
+                                  &mdc->parent_reset);
     mdc->portB_write = mos6522_cuda_portB_write;
     mdc->get_timer1_counter_value = cuda_get_counter_value;
     mdc->get_timer2_counter_value = cuda_get_counter_value;
diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
index 6e80fe1cfa..a5dd0a4734 100644
--- a/hw/misc/macio/pmu.c
+++ b/hw/misc/macio/pmu.c
@@ -850,7 +850,8 @@ static void mos6522_pmu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     MOS6522DeviceClass *mdc = MOS6522_CLASS(oc);
 
-    dc->reset = mos6522_pmu_reset;
+    device_class_set_parent_reset(dc, mos6522_pmu_reset,
+                                  &mdc->parent_reset);
     mdc->portB_write = mos6522_pmu_portB_write;
     mdc->portA_write = mos6522_pmu_portA_write;
 }
diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 4c3147a7d1..093cc83dcf 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -519,7 +519,6 @@ static void mos6522_class_init(ObjectClass *oc, void *data)
     dc->reset = mos6522_reset;
     dc->vmsd = &vmstate_mos6522;
     device_class_set_props(dc, mos6522_properties);
-    mdc->parent_reset = dc->reset;
     mdc->portB_write = mos6522_portB_write;
     mdc->portA_write = mos6522_portA_write;
     mdc->get_timer1_counter_value = mos6522_get_counter_value;
-- 
2.20.1


