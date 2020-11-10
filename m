Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505132AD4DC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:26:56 +0100 (CET)
Received: from localhost ([::1]:39920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRnb-0001Xf-7B
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZT-0007UL-12
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZQ-0004g0-JZ
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=U6PUBRT3IYzInNagK3BqCdBFdnF1uPjHrJiamLiKAA4=;
 b=IwGRpB0yxMabSe9oRtlHEwL/DFkXsqIv9ffHm4kdLqz6zlBlNqCls3UPDax9Oml4tAUobJ
 oTbWC1EPKPptYm+/Um9aFMz3oM6fNkadMsIEh9wjcmI/5UWHt7oVQ4zI0k5Xg+lQkJPzpf
 iZk6NFmmniPy0F49lsyNR54LnCrjAtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-hhsWtga7ODSXdoCqjCEz4Q-1; Tue, 10 Nov 2020 06:12:12 -0500
X-MC-Unique: hhsWtga7ODSXdoCqjCEz4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92425879521;
 Tue, 10 Nov 2020 11:12:11 +0000 (UTC)
Received: from thuth.com (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C171E10013D9;
 Tue, 10 Nov 2020 11:12:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 16/19] fuzz: add virtio-blk fuzz target
Date: Tue, 10 Nov 2020 12:11:29 +0100
Message-Id: <20201110111132.559399-17-thuth@redhat.com>
In-Reply-To: <20201110111132.559399-1-thuth@redhat.com>
References: <20201110111132.559399-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dima Stepanov <dimastep@yandex-team.ru>

The virtio-blk fuzz target sets up and fuzzes the available virtio-blk
queues. The implementation is based on two files:
  - tests/qtest/fuzz/virtio_scsi_fuzz.c
  - tests/qtest/virtio_blk_test.c

Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <e2405c459302ecaee2555405604975353bfa3837.1604920905.git.dimastep@yandex-team.ru>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/meson.build       |   1 +
 tests/qtest/fuzz/virtio_blk_fuzz.c | 234 +++++++++++++++++++++++++++++
 2 files changed, 235 insertions(+)
 create mode 100644 tests/qtest/fuzz/virtio_blk_fuzz.c

diff --git a/tests/qtest/fuzz/meson.build b/tests/qtest/fuzz/meson.build
index 5162321f30..8af6848cd5 100644
--- a/tests/qtest/fuzz/meson.build
+++ b/tests/qtest/fuzz/meson.build
@@ -5,6 +5,7 @@ specific_fuzz_ss.add(files('fuzz.c', 'fork_fuzz.c', 'qos_fuzz.c',
 specific_fuzz_ss.add(when: 'CONFIG_I440FX', if_true: files('i440fx_fuzz.c'))
 specific_fuzz_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio_net_fuzz.c'))
 specific_fuzz_ss.add(when: 'CONFIG_VIRTIO_SCSI', if_true: files('virtio_scsi_fuzz.c'))
+specific_fuzz_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio_blk_fuzz.c'))
 specific_fuzz_ss.add(files('generic_fuzz.c'))
 
 fork_fuzz = declare_dependency(
diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c b/tests/qtest/fuzz/virtio_blk_fuzz.c
new file mode 100644
index 0000000000..623a756fd4
--- /dev/null
+++ b/tests/qtest/fuzz/virtio_blk_fuzz.c
@@ -0,0 +1,234 @@
+/*
+ * virtio-blk Fuzzing Target
+ *
+ * Copyright Red Hat Inc., 2020
+ *
+ * Based on virtio-scsi-fuzz target.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "tests/qtest/libqos/libqtest.h"
+#include "tests/qtest/libqos/virtio-blk.h"
+#include "tests/qtest/libqos/virtio.h"
+#include "tests/qtest/libqos/virtio-pci.h"
+#include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/virtio_pci.h"
+#include "standard-headers/linux/virtio_blk.h"
+#include "fuzz.h"
+#include "fork_fuzz.h"
+#include "qos_fuzz.h"
+
+#define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
+#define PCI_SLOT                0x02
+#define PCI_FN                  0x00
+
+#define MAX_NUM_QUEUES 64
+
+/* Based on tests/qtest/virtio-blk-test.c. */
+typedef struct {
+    int num_queues;
+    QVirtQueue *vq[MAX_NUM_QUEUES + 2];
+} QVirtioBlkQueues;
+
+static QVirtioBlkQueues *qvirtio_blk_init(QVirtioDevice *dev, uint64_t mask)
+{
+    QVirtioBlkQueues *vs;
+    uint64_t features;
+
+    vs = g_new0(QVirtioBlkQueues, 1);
+
+    features = qvirtio_get_features(dev);
+    if (!mask) {
+        mask = ~((1u << VIRTIO_RING_F_INDIRECT_DESC) |
+                (1u << VIRTIO_RING_F_EVENT_IDX) |
+                (1u << VIRTIO_BLK_F_SCSI));
+    }
+    mask |= ~QVIRTIO_F_BAD_FEATURE;
+    features &= mask;
+    qvirtio_set_features(dev, features);
+
+    vs->num_queues = 1;
+    vs->vq[0] = qvirtqueue_setup(dev, fuzz_qos_alloc, 0);
+
+    qvirtio_set_driver_ok(dev);
+
+    return vs;
+}
+
+static void virtio_blk_fuzz(QTestState *s, QVirtioBlkQueues* queues,
+        const unsigned char *Data, size_t Size)
+{
+    /*
+     * Data is a sequence of random bytes. We split them up into "actions",
+     * followed by data:
+     * [vqa][dddddddd][vqa][dddd][vqa][dddddddddddd] ...
+     * The length of the data is specified by the preceding vqa.length
+     */
+    typedef struct vq_action {
+        uint8_t queue;
+        uint8_t length;
+        uint8_t write;
+        uint8_t next;
+        uint8_t kick;
+    } vq_action;
+
+    /* Keep track of the free head for each queue we interact with */
+    bool vq_touched[MAX_NUM_QUEUES + 2] = {0};
+    uint32_t free_head[MAX_NUM_QUEUES + 2];
+
+    QGuestAllocator *t_alloc = fuzz_qos_alloc;
+
+    QVirtioBlk *blk = fuzz_qos_obj;
+    QVirtioDevice *dev = blk->vdev;
+    QVirtQueue *q;
+    vq_action vqa;
+    while (Size >= sizeof(vqa)) {
+        /* Copy the action, so we can normalize length, queue and flags */
+        memcpy(&vqa, Data, sizeof(vqa));
+
+        Data += sizeof(vqa);
+        Size -= sizeof(vqa);
+
+        vqa.queue = vqa.queue % queues->num_queues;
+        /* Cap length at the number of remaining bytes in data */
+        vqa.length = vqa.length >= Size ? Size : vqa.length;
+        vqa.write = vqa.write & 1;
+        vqa.next = vqa.next & 1;
+        vqa.kick = vqa.kick & 1;
+
+        q = queues->vq[vqa.queue];
+
+        /* Copy the data into ram, and place it on the virtqueue */
+        uint64_t req_addr = guest_alloc(t_alloc, vqa.length);
+        qtest_memwrite(s, req_addr, Data, vqa.length);
+        if (vq_touched[vqa.queue] == 0) {
+            vq_touched[vqa.queue] = 1;
+            free_head[vqa.queue] = qvirtqueue_add(s, q, req_addr, vqa.length,
+                    vqa.write, vqa.next);
+        } else {
+            qvirtqueue_add(s, q, req_addr, vqa.length, vqa.write , vqa.next);
+        }
+
+        if (vqa.kick) {
+            qvirtqueue_kick(s, dev, q, free_head[vqa.queue]);
+            free_head[vqa.queue] = 0;
+        }
+        Data += vqa.length;
+        Size -= vqa.length;
+    }
+    /* In the end, kick each queue we interacted with */
+    for (int i = 0; i < MAX_NUM_QUEUES + 2; i++) {
+        if (vq_touched[i]) {
+            qvirtqueue_kick(s, dev, queues->vq[i], free_head[i]);
+        }
+    }
+}
+
+static void virtio_blk_fork_fuzz(QTestState *s,
+        const unsigned char *Data, size_t Size)
+{
+    QVirtioBlk *blk = fuzz_qos_obj;
+    static QVirtioBlkQueues *queues;
+    if (!queues) {
+        queues = qvirtio_blk_init(blk->vdev, 0);
+    }
+    if (fork() == 0) {
+        virtio_blk_fuzz(s, queues, Data, Size);
+        flush_events(s);
+        _Exit(0);
+    } else {
+        flush_events(s);
+        wait(NULL);
+    }
+}
+
+static void virtio_blk_with_flag_fuzz(QTestState *s,
+        const unsigned char *Data, size_t Size)
+{
+    QVirtioBlk *blk = fuzz_qos_obj;
+    static QVirtioBlkQueues *queues;
+
+    if (fork() == 0) {
+        if (Size >= sizeof(uint64_t)) {
+            queues = qvirtio_blk_init(blk->vdev, *(uint64_t *)Data);
+            virtio_blk_fuzz(s, queues,
+                             Data + sizeof(uint64_t), Size - sizeof(uint64_t));
+            flush_events(s);
+        }
+        _Exit(0);
+    } else {
+        flush_events(s);
+        wait(NULL);
+    }
+}
+
+static void virtio_blk_pre_fuzz(QTestState *s)
+{
+    qos_init_path(s);
+    counter_shm_init();
+}
+
+static void drive_destroy(void *path)
+{
+    unlink(path);
+    g_free(path);
+}
+
+static char *drive_create(void)
+{
+    int fd, ret;
+    char *t_path = g_strdup("/tmp/qtest.XXXXXX");
+
+    /* Create a temporary raw image */
+    fd = mkstemp(t_path);
+    g_assert_cmpint(fd, >=, 0);
+    ret = ftruncate(fd, TEST_IMAGE_SIZE);
+    g_assert_cmpint(ret, ==, 0);
+    close(fd);
+
+    g_test_queue_destroy(drive_destroy, t_path);
+    return t_path;
+}
+
+static void *virtio_blk_test_setup(GString *cmd_line, void *arg)
+{
+    char *tmp_path = drive_create();
+
+    g_string_append_printf(cmd_line,
+                           " -drive if=none,id=drive0,file=%s,"
+                           "format=raw,auto-read-only=off ",
+                           tmp_path);
+
+    return arg;
+}
+
+static void register_virtio_blk_fuzz_targets(void)
+{
+    fuzz_add_qos_target(&(FuzzTarget){
+                .name = "virtio-blk-fuzz",
+                .description = "Fuzz the virtio-blk virtual queues, forking "
+                                "for each fuzz run",
+                .pre_vm_init = &counter_shm_init,
+                .pre_fuzz = &virtio_blk_pre_fuzz,
+                .fuzz = virtio_blk_fork_fuzz,},
+                "virtio-blk",
+                &(QOSGraphTestOptions){.before = virtio_blk_test_setup}
+                );
+
+    fuzz_add_qos_target(&(FuzzTarget){
+                .name = "virtio-blk-flags-fuzz",
+                .description = "Fuzz the virtio-blk virtual queues, forking "
+                "for each fuzz run (also fuzzes the virtio flags)",
+                .pre_vm_init = &counter_shm_init,
+                .pre_fuzz = &virtio_blk_pre_fuzz,
+                .fuzz = virtio_blk_with_flag_fuzz,},
+                "virtio-blk",
+                &(QOSGraphTestOptions){.before = virtio_blk_test_setup}
+                );
+}
+
+fuzz_target_init(register_virtio_blk_fuzz_targets);
-- 
2.18.4


