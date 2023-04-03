Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016506D429F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 12:54:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjHoo-0007Wb-Ln; Mon, 03 Apr 2023 06:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=450a44d59=bchalios@amazon.es>)
 id 1pjHog-0007WK-96
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:53:38 -0400
Received: from smtp-fw-80006.amazon.com ([99.78.197.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=450a44d59=bchalios@amazon.es>)
 id 1pjHoc-0001Z3-NY
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.es; i=@amazon.es; q=dns/txt; s=amazon201209;
 t=1680519215; x=1712055215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H6J7aDRB3Je82P0lnl63mYn1EvY6cPMWqubRkOGPJE8=;
 b=bJLxMsZAkn0nbxYt6Ztq/WCpZvAn01y8ozYdeu9pt9t55bAV1DR4q/n8
 jQtfk/Vpx946Ua9UYEN6xEg51S5pI7TnjY5mQpFFZPJl3y+wGIdkNk/cN
 S0W8RjXdhLvfnIEfXSrLV6WcYgj44NX/WoY/pK+oLOAyJcsvF6wmkE/zL w=;
X-IronPort-AV: E=Sophos;i="5.98,314,1673913600"; d="scan'208";a="200251216"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1d-m6i4x-e651a362.us-east-1.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80006.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 10:53:30 +0000
Received: from EX19D003EUA003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1d-m6i4x-e651a362.us-east-1.amazon.com (Postfix)
 with ESMTPS id EA12580C28; Mon,  3 Apr 2023 10:53:27 +0000 (UTC)
Received: from EX19D037EUB003.ant.amazon.com (10.252.61.119) by
 EX19D003EUA003.ant.amazon.com (10.252.50.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 3 Apr 2023 10:53:26 +0000
Received: from f4d4887fdcfb.ant.amazon.com (10.1.213.24) by
 EX19D037EUB003.ant.amazon.com (10.252.61.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 3 Apr 2023 10:53:22 +0000
From: Babis Chalios <bchalios@amazon.es>
To: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, <qemu-devel@nongnu.org>
CC: <bchalios@amazon.es>, <sgarzare@redhat.com>, <graf@amazon.de>,
 <Jason@zx2c4.com>, <xmarcalx@amazon.co.uk>
Subject: [RFC PATCH 1/1] virtio-rng: implement entropy leak feature
Date: Mon, 3 Apr 2023 12:52:45 +0200
Message-ID: <20230403105245.29499-2-bchalios@amazon.es>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230403105245.29499-1-bchalios@amazon.es>
References: <20230403105245.29499-1-bchalios@amazon.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.1.213.24]
X-ClientProxiedBy: EX19D044UWB003.ant.amazon.com (10.13.139.168) To
 EX19D037EUB003.ant.amazon.com (10.252.61.119)
Precedence: Bulk
Received-SPF: pass client-ip=99.78.197.217;
 envelope-from=prvs=450a44d59=bchalios@amazon.es; helo=smtp-fw-80006.amazon.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Entropy leak reporting is a virtio-rng proposed feature [1], which
allows a virtio-rng device to report events during which entropy has
decreased, for example when a VM gets snapshotted or resumed from a
snapshot.

Guests can request from the virtio-rng device to perform two types of
events upon such events: 1. fill a buffer with random bytes or 2. copy
the contents of one buffer to another. A guest adds requests to "leak
queues" which the device will handle only when an "entropy leak" event
happens.

This patch extends the virtio-rng device with the pair of leak queues
defined in the specification proposal and implements the two types of
requests. At the moment, it triggers handling of requests during
post_save() and post_load() hooks.

In the current version, "fill-on-leak" request makes use of getrandom()
to get random bytes. However, a proper implementation should probably
consider extending the RngBackend API to include a synchronous call.

[1] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg09016.html

Signed-off-by: Babis Chalios <bchalios@amazon.es>
---
 hw/virtio/virtio-rng.c                      | 170 +++++++++++++++++++-
 include/hw/virtio/virtio-rng.h              |   9 +-
 include/standard-headers/linux/virtio_rng.h |   3 +
 3 files changed, 179 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
index 7e12fc03bf..def1b1d994 100644
--- a/hw/virtio/virtio-rng.c
+++ b/hw/virtio/virtio-rng.c
@@ -9,6 +9,7 @@
  * top-level directory.
  */
 
+#include <sys/random.h>
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/iov.h"
@@ -20,7 +21,11 @@
 #include "sysemu/rng.h"
 #include "sysemu/runstate.h"
 #include "qom/object_interfaces.h"
+#include "migration/misc.h"
 #include "trace.h"
+#include <stdint.h>
+
+#define VIRTIO_RNG_VM_VERSION  1
 
 static bool is_guest_ready(VirtIORNG *vrng)
 {
@@ -43,6 +48,112 @@ static size_t get_request_size(VirtQueue *vq, unsigned quota)
 
 static void virtio_rng_process(VirtIORNG *vrng);
 
+static VirtQueue *get_active_leak_queue(VirtIORNG *vrng)
+{
+    size_t queue = vrng->active_leak_queue;
+    return vrng->leakq[queue];
+}
+
+static size_t swap_active_leak_queue(VirtIORNG *vrng)
+{
+    size_t old_active = vrng->active_leak_queue;
+    vrng->active_leak_queue = (old_active + 1) % 2;
+    return old_active;
+}
+
+static VirtQueue *get_signaled_leak_queue(VirtIORNG *vrng)
+{
+    int32_t signaled_leak_queue = vrng->signaled_leak_queue;
+
+    if (signaled_leak_queue == -1) {
+        return NULL;
+    }
+
+    return vrng->leakq[signaled_leak_queue];
+}
+
+static size_t handle_fill_on_leak_command(VirtIORNG *vrng, VirtQueue *vq,
+                                          VirtQueueElement *elem)
+{
+    size_t bytes = iov_size(elem->in_sg, elem->in_num);
+    uint8_t *buffer = g_new0(uint8_t, bytes);
+
+    /*
+     * Probably, the correct thing to do is add a synchronous
+     * API call to RngBackend and use it here.
+     */
+    if (getrandom(buffer, bytes, 0) != bytes) {
+        fprintf(stderr, "qemu-virtio-rng: could not get random bytes");
+        return 0;
+    }
+
+    iov_from_buf(elem->in_sg, elem->in_num, 0, buffer, bytes);
+
+    return bytes;
+}
+
+static size_t handle_copy_on_leak_command(VirtIORNG *vrng, VirtQueue *vq,
+                                          VirtQueueElement *elem)
+{
+    size_t out_size, in_size, offset = 0;
+
+    out_size = iov_size(elem->out_sg, elem->out_num);
+    in_size = iov_size(elem->in_sg, elem->in_num);
+
+    if (out_size != in_size) {
+        return 0;
+    }
+
+    for (int i = 0; i < elem->out_num; ++i) {
+        struct iovec *iov = &elem->out_sg[i];
+        offset += iov_from_buf(elem->in_sg, elem->in_num, offset, iov->iov_base,
+                               iov->iov_len);
+    }
+
+    return offset;
+}
+
+static void virtio_rng_process_leak(VirtIORNG *vrng, VirtQueue *vq)
+{
+    VirtQueueElement *elem;
+    VirtIODevice *vdev = VIRTIO_DEVICE(vrng);
+    size_t len;
+
+    if (!runstate_check(RUN_STATE_RUNNING)) {
+        return;
+    }
+
+    while ((elem = virtqueue_pop(vq, sizeof(VirtQueueElement)))) {
+        /*
+         * If we have a write buffer this is a copy-on-leak command
+         * otherwise a fill-on-leak command
+         */
+        if (elem->out_num) {
+            len = handle_copy_on_leak_command(vrng, vq, elem);
+        } else {
+            len = handle_fill_on_leak_command(vrng, vq, elem);
+        }
+
+        virtqueue_push(vq, elem, len);
+        g_free(elem);
+    }
+    virtio_notify(vdev, vq);
+}
+
+static int signal_entropy_leak(VirtIORNG *vrng)
+{
+    VirtQueue *activeq = get_active_leak_queue(vrng);
+
+    /*
+     * Process all the buffers in the active leak queue
+     * and then swap active leak queues.
+     */
+    virtio_rng_process_leak(vrng, activeq);
+    vrng->signaled_leak_queue = swap_active_leak_queue(vrng);
+
+    return 0;
+}
+
 /* Send data from a char device over to the guest */
 static void chr_read(void *opaque, const void *buf, size_t size)
 {
@@ -128,9 +239,29 @@ static void handle_input(VirtIODevice *vdev, VirtQueue *vq)
     virtio_rng_process(vrng);
 }
 
+static void handle_leakq(VirtIODevice *vdev, VirtQueue *vq)
+{
+    VirtIORNG *vrng = VIRTIO_RNG(vdev);
+    VirtQueue *signaled_queue = get_signaled_leak_queue(vrng);
+
+    if (!is_guest_ready(vrng)) {
+        return;
+    }
+
+    /*
+     * If we received a request on an already signalled leak queue
+     * we need to handle it immediately, otherwise we leave the buffer(s)
+     * in the virtqueue and we will handle them once an entropy leak event
+     * occurs.
+     */
+    if (vq == signaled_queue) {
+        virtio_rng_process_leak(vrng, vq);
+    }
+}
+
 static uint64_t get_features(VirtIODevice *vdev, uint64_t f, Error **errp)
 {
-    return f;
+    return f | (1 << VIRTIO_RNG_F_LEAK);
 }
 
 static void virtio_rng_vm_state_change(void *opaque, bool running,
@@ -218,11 +349,14 @@ static void virtio_rng_device_realize(DeviceState *dev, Error **errp)
     virtio_init(vdev, VIRTIO_ID_RNG, 0);
 
     vrng->vq = virtio_add_queue(vdev, 8, handle_input);
+    vrng->leakq[0] = virtio_add_queue(vdev, 8, handle_leakq);
+    vrng->leakq[1] = virtio_add_queue(vdev, 8, handle_leakq);
+    vrng->active_leak_queue = 0;
+    vrng->signaled_leak_queue = -1;
     vrng->quota_remaining = vrng->conf.max_bytes;
     vrng->rate_limit_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
                                                check_rate_limit, vrng);
     vrng->activate_timer = true;
-
     vrng->vmstate = qemu_add_vm_change_state_handler(virtio_rng_vm_state_change,
                                                      vrng);
 }
@@ -235,9 +369,40 @@ static void virtio_rng_device_unrealize(DeviceState *dev)
     qemu_del_vm_change_state_handler(vrng->vmstate);
     timer_free(vrng->rate_limit_timer);
     virtio_del_queue(vdev, 0);
+    virtio_del_queue(vdev, 1);
+    virtio_del_queue(vdev, 2);
     virtio_cleanup(vdev);
 }
 
+/*
+ * After saving the VM state or loading a VM from a snapshot,
+ * we need to signal the guest for a leak event
+ */
+static int virtio_rng_post_save_device(void *opaque)
+{
+    VirtIORNG *vrng = opaque;
+    return signal_entropy_leak(vrng);
+}
+
+static int virtio_rng_post_load_device(void *opaque, int version_id)
+{
+    VirtIORNG *vrng = opaque;
+    return signal_entropy_leak(vrng);
+}
+
+static const VMStateDescription vmstate_virtio_rng_device = {
+    .name = "virtio-rng-device",
+    .version_id = VIRTIO_RNG_VM_VERSION,
+    .minimum_version_id = VIRTIO_RNG_VM_VERSION,
+    .post_save = virtio_rng_post_save_device,
+    .post_load = virtio_rng_post_load_device,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(active_leak_queue, VirtIORNG),
+        VMSTATE_INT32(signaled_leak_queue, VirtIORNG),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_virtio_rng = {
     .name = "virtio-rng",
     .minimum_version_id = 1,
@@ -272,6 +437,7 @@ static void virtio_rng_class_init(ObjectClass *klass, void *data)
     vdc->unrealize = virtio_rng_device_unrealize;
     vdc->get_features = get_features;
     vdc->set_status = virtio_rng_set_status;
+    vdc->vmsd = &vmstate_virtio_rng_device;
 }
 
 static const TypeInfo virtio_rng_info = {
diff --git a/include/hw/virtio/virtio-rng.h b/include/hw/virtio/virtio-rng.h
index 82734255d9..0d492c0ac7 100644
--- a/include/hw/virtio/virtio-rng.h
+++ b/include/hw/virtio/virtio-rng.h
@@ -31,8 +31,15 @@ struct VirtIORNGConf {
 struct VirtIORNG {
     VirtIODevice parent_obj;
 
-    /* Only one vq - guest puts buffer(s) on it when it needs entropy */
+    /*
+     * One vq for entropy requests and a pair of vqs for the reporting entropy
+     * leak events
+     */
     VirtQueue *vq;
+    VirtQueue *leakq[2];
+
+    uint32_t active_leak_queue;
+    int32_t signaled_leak_queue;
 
     VirtIORNGConf conf;
 
diff --git a/include/standard-headers/linux/virtio_rng.h b/include/standard-headers/linux/virtio_rng.h
index 60fc798bde..ffe0c6841d 100644
--- a/include/standard-headers/linux/virtio_rng.h
+++ b/include/standard-headers/linux/virtio_rng.h
@@ -5,4 +5,7 @@
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/virtio_config.h"
 
+/* Feature bits */
+#define VIRTIO_RNG_F_LEAK 0
+
 #endif /* _LINUX_VIRTIO_RNG_H */
-- 
2.39.2


