Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E7E6196B4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 13:58:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqwG9-0001hc-Gy; Fri, 04 Nov 2022 08:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqwG2-0001bQ-7A
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:57:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqwG0-0004LT-88
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667566631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U3MTINOv8swD+GxcCT4C/zeD7r2SDABiXF+ucJxL6Qs=;
 b=ZUEkFrDvpwAl5bpyPWObX6d+dmU8M2Y2T5fM0PLDlN4qyxH385OsPjwsmQ+JPKG8jPvR9X
 QlMgytCjwE9qa4ok13PtJidQPfLJjaa+WP1UkBfqnt9Wi0Th/WAVfPyWv8AaRMbrOu/2wm
 oKZMZC3IvXcQZRwbVsjCE8r5y5tdgsI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-ssnCdeZNMYWe00O4MyI90w-1; Fri, 04 Nov 2022 08:57:09 -0400
X-MC-Unique: ssnCdeZNMYWe00O4MyI90w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71E062999B25
 for <qemu-devel@nongnu.org>; Fri,  4 Nov 2022 12:57:09 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F21C4A9254;
 Fri,  4 Nov 2022 12:57:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	pbonzini@redhat.com
Subject: [PATCH 1/3] net: Move the code to collect available NIC models to a
 separate function
Date: Fri,  4 Nov 2022 13:57:03 +0100
Message-Id: <20221104125705.415923-2-thuth@redhat.com>
In-Reply-To: <20221104125705.415923-1-thuth@redhat.com>
References: <20221104125705.415923-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The code that collects the available NIC models is not really specific
to PCI anymore and will be required in the next patch, too, so let's
move this into a new separate function in net.c instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/net/net.h |  1 +
 hw/pci/pci.c      | 29 +----------------------------
 net/net.c         | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 3db75ff841..c96cefb89a 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -189,6 +189,7 @@ void qemu_set_vnet_hdr_len(NetClientState *nc, int len);
 int qemu_set_vnet_le(NetClientState *nc, bool is_le);
 int qemu_set_vnet_be(NetClientState *nc, bool is_be);
 void qemu_macaddr_default_if_unset(MACAddr *macaddr);
+GPtrArray *qemu_get_nic_models(const char *device_type);
 int qemu_show_nic_models(const char *arg, const char *const *models);
 void qemu_check_nic_model(NICInfo *nd, const char *model);
 int qemu_find_nic_model(NICInfo *nd, const char * const *models,
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2f450f6a72..2b7b343e82 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1964,7 +1964,6 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
                                const char *default_devaddr)
 {
     const char *devaddr = nd->devaddr ? nd->devaddr : default_devaddr;
-    GSList *list;
     GPtrArray *pci_nic_models;
     PCIBus *bus;
     PCIDevice *pci_dev;
@@ -1979,33 +1978,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
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
diff --git a/net/net.c b/net/net.c
index 840ad9dca5..c0516a8067 100644
--- a/net/net.c
+++ b/net/net.c
@@ -899,6 +899,42 @@ static int nic_get_free_idx(void)
     return -1;
 }
 
+GPtrArray *qemu_get_nic_models(const char *device_type)
+{
+    GPtrArray *nic_models;
+    GSList *list;
+
+    list = object_class_get_list_sorted(device_type, false);
+    nic_models = g_ptr_array_new();
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
2.31.1


