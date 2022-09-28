Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31BA5EE12E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:03:39 +0200 (CEST)
Received: from localhost ([::1]:52290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZX9-00081e-03
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>) id 1odZND-0004Hv-N6
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:53:23 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:35458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>) id 1odZN7-00066f-FV
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:53:22 -0400
Received: from [192.168.16.115] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <den@openvz.org>) id 1odZK4-006fCW-3e;
 Wed, 28 Sep 2022 17:52:32 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-devel@nongnu.org
Cc: "Denis V . Lunev" <den@openvz.org>,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 Yan Vugenfirer <yvugenfi@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/1] qxl: add subsystem_vendor_id property
Date: Wed, 28 Sep 2022 17:52:44 +0200
Message-Id: <20220928155244.1837455-1-den@openvz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111; envelope-from=den@openvz.org;
 helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This property is needed for WHQL/inboxing of Windows drivers. We do need
to get drivers to be separated by the hypervisor vendors and that should
be done as PCI subvendor ID.

This patch adds PCI subsystem vendor ID to QXL device to match that
convention.

The original version of this code has been written by Denis Plotnikov
while he has been working in Virtuozzo.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Denis Plotnikov <den-plotnikov@yandex-team.ru>
CC: Yan Vugenfirer <yvugenfi@redhat.com>
CC: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/qxl.c | 4 ++++
 hw/display/qxl.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 5b10f697f1..ec117aa90f 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2204,6 +2204,8 @@ static void qxl_realize_common(PCIQXLDevice *qxl, Error **errp)
 
     qxl->update_area_bh = qemu_bh_new(qxl_render_update_area_bh, qxl);
     qxl->ssd.cursor_bh = qemu_bh_new(qemu_spice_cursor_refresh_bh, &qxl->ssd);
+
+    pci_set_word(&config[PCI_SUBSYSTEM_VENDOR_ID], qxl->subsystem_vendor_id);
 }
 
 static void qxl_realize_primary(PCIDevice *dev, Error **errp)
@@ -2469,6 +2471,8 @@ static Property qxl_properties[] = {
         DEFINE_PROP_UINT32("xres", PCIQXLDevice, xres, 0),
         DEFINE_PROP_UINT32("yres", PCIQXLDevice, yres, 0),
         DEFINE_PROP_BOOL("global-vmstate", PCIQXLDevice, vga.global_vmstate, false),
+        DEFINE_PROP_UINT16("subsystem-vendor-id", PCIQXLDevice,
+                            subsystem_vendor_id, PCI_VENDOR_ID_REDHAT_QUMRANET),
         DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index e74de9579d..111edbf0dc 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -126,6 +126,7 @@ struct PCIQXLDevice {
     int                num_dirty_rects;
     QXLRect            dirty[QXL_NUM_DIRTY_RECTS];
     QEMUBH            *update_area_bh;
+    uint16_t           subsystem_vendor_id;
 };
 
 #define TYPE_PCI_QXL "pci-qxl"
-- 
2.34.1


