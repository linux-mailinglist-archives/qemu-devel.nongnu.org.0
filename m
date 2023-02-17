Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD4169A542
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 06:45:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pStXQ-0000aZ-M0; Fri, 17 Feb 2023 00:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pStXH-0000Xw-14
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:43:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pStXF-0001Mv-Fg
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676612632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xz/5bAkleicl62MdzztWocE2YfMrKDcRo4PcgO3ivss=;
 b=F0q41SSOe5O3f+pKtAS70AKdCXd+Us1BhvdU3Xo6fPttIGaQM2iquhZWWPC9MOeBE3DmSG
 9ueVP9uFOdNBFp6j6Vk98zIgaLoxQQ6FZd1Fmh+Zsbg5m8a/K6JjRxe00Q5u1PgpGn/F1U
 dTGorbSuLFwMO3DVVet0oBp0AInH1YM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-id2zVPdlNqakwu8sM773BQ-1; Fri, 17 Feb 2023 00:43:43 -0500
X-MC-Unique: id2zVPdlNqakwu8sM773BQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8BCA1C04B77;
 Fri, 17 Feb 2023 05:43:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-47.pek2.redhat.com [10.72.12.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE218492B15;
 Fri, 17 Feb 2023 05:43:40 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL V3 1/9] net: Move the code to collect available NIC models to a
 separate function
Date: Fri, 17 Feb 2023 13:43:27 +0800
Message-Id: <20230217054335.57595-2-jasowang@redhat.com>
In-Reply-To: <20230217054335.57595-1-jasowang@redhat.com>
References: <20230217054335.57595-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Thomas Huth <thuth@redhat.com>

The code that collects the available NIC models is not really specific
to PCI anymore and will be required in the next patch, too, so let's
move this into a new separate function in net.c instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/pci/pci.c      | 29 +----------------------------
 include/net/net.h | 14 ++++++++++++++
 net/net.c         | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 28 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 208c16f..cc51f98 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1789,7 +1789,6 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
                                const char *default_devaddr)
 {
     const char *devaddr = nd->devaddr ? nd->devaddr : default_devaddr;
-    GSList *list;
     GPtrArray *pci_nic_models;
     PCIBus *bus;
     PCIDevice *pci_dev;
@@ -1804,33 +1803,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
         nd->model = g_strdup("virtio-net-pci");
     }
 
-    list = object_class_get_list_sorted(TYPE_PCI_DEVICE, false);
-    pci_nic_models = g_ptr_array_new();
-    while (list) {
-        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, list->data,
-                                             TYPE_DEVICE);
-        GSList *next;
-        if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
-            dc->user_creatable) {
-            const char *name = object_class_get_name(list->data);
-            /*
-             * A network device might also be something else than a NIC, see
-             * e.g. the "rocker" device. Thus we have to look for the "netdev"
-             * property, too. Unfortunately, some devices like virtio-net only
-             * create this property during instance_init, so we have to create
-             * a temporary instance here to be able to check it.
-             */
-            Object *obj = object_new_with_class(OBJECT_CLASS(dc));
-            if (object_property_find(obj, "netdev")) {
-                g_ptr_array_add(pci_nic_models, (gpointer)name);
-            }
-            object_unref(obj);
-        }
-        next = list->next;
-        g_slist_free_1(list);
-        list = next;
-    }
-    g_ptr_array_add(pci_nic_models, NULL);
+    pci_nic_models = qemu_get_nic_models(TYPE_PCI_DEVICE);
 
     if (qemu_show_nic_models(nd->model, (const char **)pci_nic_models->pdata)) {
         exit(0);
diff --git a/include/net/net.h b/include/net/net.h
index fad589c..1d88621 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -203,6 +203,20 @@ void net_socket_rs_init(SocketReadState *rs,
                         bool vnet_hdr);
 NetClientState *qemu_get_peer(NetClientState *nc, int queue_index);
 
+/**
+ * qemu_get_nic_models:
+ * @device_type: Defines which devices should be taken into consideration
+ *               (e.g. TYPE_DEVICE for all devices, or TYPE_PCI_DEVICE for PCI)
+ *
+ * Get an array of pointers to names of NIC devices that are available in
+ * the QEMU binary. The array is terminated with a NULL pointer entry.
+ * The caller is responsible for freeing the memory when it is not required
+ * anymore, e.g. with g_ptr_array_free(..., true).
+ *
+ * Returns: Pointer to the array that contains the pointers to the names.
+ */
+GPtrArray *qemu_get_nic_models(const char *device_type);
+
 /* NIC info */
 
 #define MAX_NICS 8
diff --git a/net/net.c b/net/net.c
index 251fc5a..476a4b7 100644
--- a/net/net.c
+++ b/net/net.c
@@ -899,6 +899,40 @@ static int nic_get_free_idx(void)
     return -1;
 }
 
+GPtrArray *qemu_get_nic_models(const char *device_type)
+{
+    GPtrArray *nic_models = g_ptr_array_new();
+    GSList *list = object_class_get_list_sorted(device_type, false);
+
+    while (list) {
+        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, list->data,
+                                             TYPE_DEVICE);
+        GSList *next;
+        if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
+            dc->user_creatable) {
+            const char *name = object_class_get_name(list->data);
+            /*
+             * A network device might also be something else than a NIC, see
+             * e.g. the "rocker" device. Thus we have to look for the "netdev"
+             * property, too. Unfortunately, some devices like virtio-net only
+             * create this property during instance_init, so we have to create
+             * a temporary instance here to be able to check it.
+             */
+            Object *obj = object_new_with_class(OBJECT_CLASS(dc));
+            if (object_property_find(obj, "netdev")) {
+                g_ptr_array_add(nic_models, (gpointer)name);
+            }
+            object_unref(obj);
+        }
+        next = list->next;
+        g_slist_free_1(list);
+        list = next;
+    }
+    g_ptr_array_add(nic_models, NULL);
+
+    return nic_models;
+}
+
 int qemu_show_nic_models(const char *arg, const char *const *models)
 {
     int i;
-- 
2.7.4


