Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CC7416EB0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:14:58 +0200 (CEST)
Received: from localhost ([::1]:51458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThIH-0001Al-KA
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mTh9j-00048U-Nu
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:06:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mTh9d-0003Iy-Ss
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632474361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KzPpKcm05vMxAm5x56Ljr93Ez4xNOIelk3Z0Gs8Yf1w=;
 b=UmI+EQUErEl1ekhRlfdGNQMXjfkHsGdrZY0jdsT3GJI0hB9BlHUdlKX2Kpbt/XFbFcRwEQ
 wAnkykJwLgEtn9+V3m+Ys5lRQunHDHqJhhoT3mTxUKY5vROK8G6U6ZLxKV8pBYvxbGlKJ3
 KI6wug08MJCp/hVmMOVqA3VORRKTGrM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-QIQyJ_7YOV2WtsgiC54fnQ-1; Fri, 24 Sep 2021 05:05:59 -0400
X-MC-Unique: QIQyJ_7YOV2WtsgiC54fnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAC381007920;
 Fri, 24 Sep 2021 09:05:58 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAF895D9DC;
 Fri, 24 Sep 2021 09:05:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] qdev: Make DeviceState.id independent of QemuOpts
Date: Fri, 24 Sep 2021 11:04:21 +0200
Message-Id: <20210924090427.9218-6-kwolf@redhat.com>
In-Reply-To: <20210924090427.9218-1-kwolf@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DeviceState.id is a pointer to a string that is stored in the QemuOpts
object DeviceState.opts and freed together with it. We want to create
devices without going through QemuOpts in the future, so make this a
separately allocated string.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/hw/qdev-core.h              | 2 +-
 include/monitor/qdev.h              | 2 +-
 hw/arm/virt.c                       | 2 +-
 hw/core/qdev.c                      | 1 +
 hw/pci-bridge/pci_expander_bridge.c | 2 +-
 hw/ppc/e500.c                       | 2 +-
 softmmu/qdev-monitor.c              | 5 +++--
 7 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 34c8a7506a..1857d9698e 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -176,7 +176,7 @@ struct DeviceState {
     Object parent_obj;
     /*< public >*/
 
-    const char *id;
+    char *id;
     char *canonical_path;
     bool realized;
     bool pending_deleted_event;
diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index eaa947d73a..389287eb44 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -9,6 +9,6 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
 
 int qdev_device_help(QemuOpts *opts);
 DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
-void qdev_set_id(DeviceState *dev, const char *id);
+void qdev_set_id(DeviceState *dev, char *id);
 
 #endif
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1d59f0e59f..f933d48d3b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1459,7 +1459,7 @@ static void create_platform_bus(VirtMachineState *vms)
     MemoryRegion *sysmem = get_system_memory();
 
     dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
-    dev->id = TYPE_PLATFORM_BUS_DEVICE;
+    dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
     qdev_prop_set_uint32(dev, "num_irqs", PLATFORM_BUS_NUM_IRQS);
     qdev_prop_set_uint32(dev, "mmio_size", vms->memmap[VIRT_PLATFORM_BUS].size);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cefc5eaa0a..d918b50a1d 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -956,6 +956,7 @@ static void device_finalize(Object *obj)
     }
 
     qemu_opts_del(dev->opts);
+    g_free(dev->id);
 }
 
 static void device_class_base_init(ObjectClass *class, void *data)
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 7112dc3062..10e6e7c2ab 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -245,7 +245,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
     } else {
         bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
         bds = qdev_new("pci-bridge");
-        bds->id = dev_name;
+        bds->id = g_strdup(dev_name);
         qdev_prop_set_uint8(bds, PCI_BRIDGE_DEV_PROP_CHASSIS_NR, pxb->bus_nr);
         qdev_prop_set_bit(bds, PCI_BRIDGE_DEV_PROP_SHPC, false);
     }
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 95451414dd..960e7efcd3 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1006,7 +1006,7 @@ void ppce500_init(MachineState *machine)
     /* Platform Bus Device */
     if (pmc->has_platform_bus) {
         dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
-        dev->id = TYPE_PLATFORM_BUS_DEVICE;
+        dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
         qdev_prop_set_uint32(dev, "num_irqs", pmc->platform_bus_num_irqs);
         qdev_prop_set_uint32(dev, "mmio_size", pmc->platform_bus_size);
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 034b999401..1207e57a46 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -592,7 +592,8 @@ static BusState *qbus_find(const char *path, Error **errp)
     return bus;
 }
 
-void qdev_set_id(DeviceState *dev, const char *id)
+/* Takes ownership of @id, will be freed when deleting the device */
+void qdev_set_id(DeviceState *dev, char *id)
 {
     if (id) {
         dev->id = id;
@@ -690,7 +691,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         }
     }
 
-    qdev_set_id(dev, qemu_opts_id(opts));
+    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)));
 
     /* set properties */
     if (qemu_opt_foreach(opts, set_property, dev, errp)) {
-- 
2.31.1


