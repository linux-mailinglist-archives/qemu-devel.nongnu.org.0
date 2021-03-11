Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1029B33770A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:23:40 +0100 (CET)
Received: from localhost ([::1]:41312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNA3-0005W0-2k
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcA-00054D-NQ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMc6-0002q4-94
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/vboMepvXCSr+CJObpxnLUf3DTg5UTQZvCZD2IGg0I=;
 b=UyKQXGsOORoqn08HvZjvDUX/2qlBBSvib69TpMoWIDFa8NBK8x6D/os66IscipagWdkBLY
 wzDvCrIKGJ+BLMK4icSbQbgwzg9ZN0ZS6AHc46Q60mAn/cCNewGF9LinHInYo+nwTR00Nv
 WLyBFlLFbbdVdjHRYsU46dEHN0pAqW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-1mM9AtWqNo6UnxmnhRPzkA-1; Thu, 11 Mar 2021 09:48:31 -0500
X-MC-Unique: 1mM9AtWqNo6UnxmnhRPzkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FE8F100C620;
 Thu, 11 Mar 2021 14:48:30 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70D955D9F2;
 Thu, 11 Mar 2021 14:48:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/38] tests/qtest: add multi-queue test case to
 vhost-user-blk-test
Date: Thu, 11 Mar 2021 15:47:41 +0100
Message-Id: <20210311144811.313451-9-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
References: <20210311144811.313451-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210309094106.196911-4-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 81 +++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index f0fb09893e..61beee52d3 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -563,6 +563,67 @@ static void pci_hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     qpci_unplug_acpi_device_test(qts, "drv1", PCI_SLOT_HP);
 }
 
+static void multiqueue(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVirtioPCIDevice *pdev1 = obj;
+    QVirtioDevice *dev1 = &pdev1->vdev;
+    QVirtioPCIDevice *pdev8;
+    QVirtioDevice *dev8;
+    QTestState *qts = pdev1->pdev->bus->qts;
+    uint64_t features;
+    uint16_t num_queues;
+
+    /*
+     * The primary device has 1 queue and VIRTIO_BLK_F_MQ is not enabled. The
+     * VIRTIO specification allows VIRTIO_BLK_F_MQ to be enabled when there is
+     * only 1 virtqueue, but --device vhost-user-blk-pci doesn't do this (which
+     * is also spec-compliant).
+     */
+    features = qvirtio_get_features(dev1);
+    g_assert_cmpint(features & (1u << VIRTIO_BLK_F_MQ), ==, 0);
+    features = features & ~(QVIRTIO_F_BAD_FEATURE |
+                            (1u << VIRTIO_RING_F_INDIRECT_DESC) |
+                            (1u << VIRTIO_F_NOTIFY_ON_EMPTY) |
+                            (1u << VIRTIO_BLK_F_SCSI));
+    qvirtio_set_features(dev1, features);
+
+    /* Hotplug a secondary device with 8 queues */
+    qtest_qmp_device_add(qts, "vhost-user-blk-pci", "drv1",
+                         "{'addr': %s, 'chardev': 'char2', 'num-queues': 8}",
+                         stringify(PCI_SLOT_HP) ".0");
+
+    pdev8 = virtio_pci_new(pdev1->pdev->bus,
+                           &(QPCIAddress) {
+                               .devfn = QPCI_DEVFN(PCI_SLOT_HP, 0)
+                           });
+    g_assert_nonnull(pdev8);
+    g_assert_cmpint(pdev8->vdev.device_type, ==, VIRTIO_ID_BLOCK);
+
+    qos_object_start_hw(&pdev8->obj);
+
+    dev8 = &pdev8->vdev;
+    features = qvirtio_get_features(dev8);
+    g_assert_cmpint(features & (1u << VIRTIO_BLK_F_MQ),
+                    ==,
+                    (1u << VIRTIO_BLK_F_MQ));
+    features = features & ~(QVIRTIO_F_BAD_FEATURE |
+                            (1u << VIRTIO_RING_F_INDIRECT_DESC) |
+                            (1u << VIRTIO_F_NOTIFY_ON_EMPTY) |
+                            (1u << VIRTIO_BLK_F_SCSI) |
+                            (1u << VIRTIO_BLK_F_MQ));
+    qvirtio_set_features(dev8, features);
+
+    num_queues = qvirtio_config_readw(dev8,
+            offsetof(struct virtio_blk_config, num_queues));
+    g_assert_cmpint(num_queues, ==, 8);
+
+    qvirtio_pci_device_disable(pdev8);
+    qos_object_destroy(&pdev8->obj);
+
+    /* unplug secondary disk */
+    qpci_unplug_acpi_device_test(qts, "drv1", PCI_SLOT_HP);
+}
+
 /*
  * Check that setting the vring addr on a non-existent virtqueue does
  * not crash.
@@ -682,7 +743,8 @@ static void quit_storage_daemon(void *data)
     g_free(data);
 }
 
-static void start_vhost_user_blk(GString *cmd_line, int vus_instances)
+static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
+                                 int num_queues)
 {
     const char *vhost_user_blk_bin = qtest_qemu_storage_daemon_binary();
     int i;
@@ -707,8 +769,8 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances)
         g_string_append_printf(storage_daemon_command,
             "--blockdev driver=file,node-name=disk%d,filename=%s "
             "--export type=vhost-user-blk,id=disk%d,addr.type=unix,addr.path=%s,"
-            "node-name=disk%i,writable=on ",
-            i, img_path, i, sock_path, i);
+            "node-name=disk%i,writable=on,num-queues=%d ",
+            i, img_path, i, sock_path, i, num_queues);
 
         g_string_append_printf(cmd_line, "-chardev socket,id=char%d,path=%s ",
                                i + 1, sock_path);
@@ -742,7 +804,7 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances)
 
 static void *vhost_user_blk_test_setup(GString *cmd_line, void *arg)
 {
-    start_vhost_user_blk(cmd_line, 1);
+    start_vhost_user_blk(cmd_line, 1, 1);
     return arg;
 }
 
@@ -756,7 +818,13 @@ static void *vhost_user_blk_test_setup(GString *cmd_line, void *arg)
 static void *vhost_user_blk_hotplug_test_setup(GString *cmd_line, void *arg)
 {
     /* "-chardev socket,id=char2" is used for pci_hotplug*/
-    start_vhost_user_blk(cmd_line, 2);
+    start_vhost_user_blk(cmd_line, 2, 1);
+    return arg;
+}
+
+static void *vhost_user_blk_multiqueue_test_setup(GString *cmd_line, void *arg)
+{
+    start_vhost_user_blk(cmd_line, 2, 8);
     return arg;
 }
 
@@ -783,6 +851,9 @@ static void register_vhost_user_blk_test(void)
 
     opts.before = vhost_user_blk_hotplug_test_setup;
     qos_add_test("hotplug", "vhost-user-blk-pci", pci_hotplug, &opts);
+
+    opts.before = vhost_user_blk_multiqueue_test_setup;
+    qos_add_test("multiqueue", "vhost-user-blk-pci", multiqueue, &opts);
 }
 
 libqos_init(register_vhost_user_blk_test);
-- 
2.29.2


