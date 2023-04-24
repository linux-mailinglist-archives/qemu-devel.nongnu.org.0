Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3826ED634
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:37:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2vx-0005iw-5o; Mon, 24 Apr 2023 16:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pr2vv-0005gP-35
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:37:11 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pr2vq-0008Sf-33
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:37:10 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 3DE8D5F3B8;
 Mon, 24 Apr 2023 23:36:59 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:6523::1:a])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id oaMVKO1OoCg0-t1ASXrEB; Mon, 24 Apr 2023 23:36:58 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682368618; bh=RbjdnH8M16Vfq6Hi7pqef94xRMhfwvbA5tfy+HMf10I=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=v+DKg97++F4a7+dIrrmuiprk62ZULPFSRsonz3hxpokuE95VVWbYXqHhn6J+DnVqe
 z2+K3ZrmDeVkK3Herlf72jjx5QZkZfdVQ9sLNb7545eEu+gTkcB3gKpT6ao0rbHo7R
 GQRgyYReE6D43cIhaC185e+piYz1GEuM82QbwXgY=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, david@redhat.com, peterx@redhat.com,
 pbonzini@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 vsementsov@yandex-team.ru, den-plotnikov@yandex-team.ru
Subject: [PATCH] pci: make ROM memory resizable
Date: Mon, 24 Apr 2023 23:36:47 +0300
Message-Id: <20230424203647.94614-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On migration, on target we load local ROM file. But actual ROM content
migrates through migration channel. Original ROM content from local
file doesn't matter. But when size mismatch - we have an error like

 Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument

Let's just allow resizing of ROM memory. This way migration is not
relate on local ROM file on target node which is loaded by default but
is not actually needed.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/pci.c          |  7 +++++--
 include/exec/memory.h | 26 ++++++++++++++++++++++++++
 softmmu/memory.c      | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index def5000e7b..72ee8f6aea 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -59,6 +59,8 @@
 # define PCI_DPRINTF(format, ...)       do { } while (0)
 #endif
 
+#define MAX_ROM_SIZE (2 * GiB)
+
 bool pci_available = true;
 
 static char *pcibus_get_dev_path(DeviceState *dev);
@@ -2341,7 +2343,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
         g_free(path);
         return;
-    } else if (size > 2 * GiB) {
+    } else if (size > MAX_ROM_SIZE) {
         error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
                    pdev->romfile);
         g_free(path);
@@ -2366,7 +2368,8 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
     }
     pdev->has_rom = true;
-    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
+    memory_region_init_rom_resizable(&pdev->rom, OBJECT(pdev), name,
+                                     pdev->romsize, MAX_ROM_SIZE, &error_fatal);
     ptr = memory_region_get_ram_ptr(&pdev->rom);
     if (load_image_size(path, ptr, size) < 0) {
         error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 15ade918ba..ed1e5d9126 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1453,6 +1453,19 @@ void memory_region_init_rom_nomigrate(MemoryRegion *mr,
                                       uint64_t size,
                                       Error **errp);
 
+/*
+ * memory_region_init_rom_nomigrate_resizable: same as
+ * memory_region_init_rom_nomigrate(), but initialize resizable memory region.
+ *
+ * @max_size maximum allowed size.
+ */
+void memory_region_init_rom_nomigrate_resizable(MemoryRegion *mr,
+                                                struct Object *owner,
+                                                const char *name,
+                                                uint64_t size,
+                                                uint64_t max_size,
+                                                Error **errp);
+
 /**
  * memory_region_init_rom_device_nomigrate:  Initialize a ROM memory region.
  *                                 Writes are handled via callbacks.
@@ -1562,6 +1575,19 @@ void memory_region_init_rom(MemoryRegion *mr,
                             uint64_t size,
                             Error **errp);
 
+/*
+ * memory_region_init_rom_resizable: same as memory_region_init_rom(),
+ * but initialize resizable memory region.
+ *
+ * @max_size maximum allowed size.
+ */
+void memory_region_init_rom_resizable(MemoryRegion *mr,
+                                      struct Object *owner,
+                                      const char *name,
+                                      uint64_t size,
+                                      uint64_t max_size,
+                                      Error **errp);
+
 /**
  * memory_region_init_rom_device:  Initialize a ROM memory region.
  *                                 Writes are handled via callbacks.
diff --git a/softmmu/memory.c b/softmmu/memory.c
index b1a6cae6f5..744d03bc02 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1701,6 +1701,18 @@ void memory_region_init_rom_nomigrate(MemoryRegion *mr,
     mr->readonly = true;
 }
 
+void memory_region_init_rom_nomigrate_resizable(MemoryRegion *mr,
+                                                struct Object *owner,
+                                                const char *name,
+                                                uint64_t size,
+                                                uint64_t max_size,
+                                                Error **errp)
+{
+    memory_region_init_resizeable_ram(mr, owner, name, size, max_size, NULL,
+                                      errp);
+    mr->readonly = true;
+}
+
 void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
                                              Object *owner,
                                              const MemoryRegionOps *ops,
@@ -3580,6 +3592,33 @@ void memory_region_init_rom(MemoryRegion *mr,
     vmstate_register_ram(mr, owner_dev);
 }
 
+void memory_region_init_rom_resizable(MemoryRegion *mr,
+                                      struct Object *owner,
+                                      const char *name,
+                                      uint64_t size,
+                                      uint64_t max_size,
+                                      Error **errp)
+{
+    DeviceState *owner_dev;
+    Error *err = NULL;
+
+    memory_region_init_rom_nomigrate_resizable(mr, owner, name, size, max_size,
+                                               &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    /*
+     * This will assert if owner is neither NULL nor a DeviceState.
+     * We only want the owner here for the purposes of defining a
+     * unique name for migration. TODO: Ideally we should implement
+     * a naming scheme for Objects which are not DeviceStates, in
+     * which case we can relax this restriction.
+     */
+    owner_dev = DEVICE(owner);
+    vmstate_register_ram(mr, owner_dev);
+}
+
 void memory_region_init_rom_device(MemoryRegion *mr,
                                    Object *owner,
                                    const MemoryRegionOps *ops,
-- 
2.34.1


