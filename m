Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F9F6B7FB9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 18:50:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbmIL-0006I7-27; Mon, 13 Mar 2023 13:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pbmHq-0006Ez-QD
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pbmHp-0000jW-0U
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678729720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DX0E4mn4Sb2zZT47K9+1I+S4rAPR9KAy7RT8+k73qvY=;
 b=EC/7lyYmqDS6mazMbaZweD0GwLf1IABRIrZMxiNgJ9aw9/kf1aUx5h2O0BX0fXmAjl/8Jo
 cybwysxEmaTkvow7xlTQNFGX55v7ALRnYXlHKaxxFUz6ZNoY6zCy1iwuwRw3H9g826Xq8N
 kejkcrfNzAauomYhDZyKtGSvaOGUUoI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-3E1CVelRNDyNuhExoeIpYw-1; Mon, 13 Mar 2023 13:48:39 -0400
X-MC-Unique: 3E1CVelRNDyNuhExoeIpYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3351185A794
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 17:48:38 +0000 (UTC)
Received: from localhost (unknown [10.39.193.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 240F12027040;
 Mon, 13 Mar 2023 17:48:38 +0000 (UTC)
From: Hanna Czenczek <hreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Cc: Hanna Czenczek <hreitz@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC 2/2] vhost-user-fs: Implement stateful migration
Date: Mon, 13 Mar 2023 18:48:33 +0100
Message-Id: <20230313174833.28790-3-hreitz@redhat.com>
In-Reply-To: <20230313174833.28790-1-hreitz@redhat.com>
References: <20230313174833.28790-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

A virtio-fs device's VM state consists of:
- the virtio device (vring) state (VMSTATE_VIRTIO_DEVICE)
- the back-end's (virtiofsd's) internal state

We get/set the latter via the new vhost-user operations FS_SET_STATE_FD,
FS_GET_STATE, and FS_SET_STATE.

Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
---
 hw/virtio/vhost-user-fs.c | 171 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 170 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 83fc20e49e..df1fb02acc 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -20,8 +20,10 @@
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
 #include "qemu/error-report.h"
+#include "qemu/memfd.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user-fs.h"
+#include "migration/qemu-file-types.h"
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
 
@@ -298,9 +300,176 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
     return &fs->vhost_dev;
 }
 
+/**
+ * Fetch the internal state from the back-end (virtiofsd) and save it
+ * to `f`.
+ */
+static int vuf_save_state(QEMUFile *f, void *pv, size_t size,
+                          const VMStateField *field, JSONWriter *vmdesc)
+{
+    VirtIODevice *vdev = pv;
+    VHostUserFS *fs = VHOST_USER_FS(vdev);
+    int memfd = -1;
+    /* Size of the shared memory through which to transfer the state */
+    const size_t chunk_size = 4 * 1024 * 1024;
+    size_t state_offset;
+    ssize_t remaining;
+    void *shm_buf;
+    Error *local_err = NULL;
+    int ret, ret2;
+
+    /* Set up shared memory through which to receive the state from virtiofsd */
+    shm_buf = qemu_memfd_alloc("vhost-fs-state", chunk_size,
+                               F_SEAL_SEAL | F_SEAL_SHRINK | F_SEAL_GROW,
+                               &memfd, &local_err);
+    if (!shm_buf) {
+        error_report_err(local_err);
+        ret = -ENOMEM;
+        goto early_fail;
+    }
+
+    /* Share the SHM area with virtiofsd */
+    ret = vhost_fs_set_state_fd(&fs->vhost_dev, memfd, chunk_size);
+    if (ret < 0) {
+        goto early_fail;
+    }
+
+    /* Receive the virtiofsd state in chunks, and write them to `f` */
+    state_offset = 0;
+    do {
+        size_t this_chunk_size;
+
+        remaining = vhost_fs_get_state(&fs->vhost_dev, state_offset,
+                                       chunk_size);
+        if (remaining < 0) {
+            ret = remaining;
+            goto fail;
+        }
+
+        /* Prefix the whole state by its total length */
+        if (state_offset == 0) {
+            qemu_put_be64(f, remaining);
+        }
+
+        this_chunk_size = MIN(remaining, chunk_size);
+        qemu_put_buffer(f, shm_buf, this_chunk_size);
+        state_offset += this_chunk_size;
+    } while (remaining >= chunk_size);
+
+    ret = 0;
+fail:
+    /* Have virtiofsd close the shared memory */
+    ret2 = vhost_fs_set_state_fd(&fs->vhost_dev, -1, 0);
+    if (ret2 < 0) {
+        error_report("Failed to remove state FD from the vhost-user-fs back "
+                     "end: %s", strerror(-ret));
+        if (ret == 0) {
+            ret = ret2;
+        }
+    }
+
+early_fail:
+    if (shm_buf) {
+        qemu_memfd_free(shm_buf, chunk_size, memfd);
+    }
+
+    return ret;
+}
+
+/**
+ * Load the back-end's (virtiofsd's) internal state from `f` and send
+ * it over to that back-end.
+ */
+static int vuf_load_state(QEMUFile *f, void *pv, size_t size,
+                          const VMStateField *field)
+{
+    VirtIODevice *vdev = pv;
+    VHostUserFS *fs = VHOST_USER_FS(vdev);
+    int memfd = -1;
+    /* Size of the shared memory through which to transfer the state */
+    const size_t chunk_size = 4 * 1024 * 1024;
+    size_t state_offset;
+    uint64_t remaining;
+    void *shm_buf;
+    Error *local_err = NULL;
+    int ret, ret2;
+
+    /* The state is prefixed by its total length, read that first */
+    remaining = qemu_get_be64(f);
+
+    /* Set up shared memory through which to send the state to virtiofsd */
+    shm_buf = qemu_memfd_alloc("vhost-fs-state", chunk_size,
+                               F_SEAL_SEAL | F_SEAL_SHRINK | F_SEAL_GROW,
+                               &memfd, &local_err);
+    if (!shm_buf) {
+        error_report_err(local_err);
+        ret = -ENOMEM;
+        goto early_fail;
+    }
+
+    /* Share the SHM area with virtiofsd */
+    ret = vhost_fs_set_state_fd(&fs->vhost_dev, memfd, chunk_size);
+    if (ret < 0) {
+        goto early_fail;
+    }
+
+    /*
+     * Read the virtiofsd state in chunks from `f`, and send them over
+     * to virtiofsd
+     */
+    state_offset = 0;
+    do {
+        size_t this_chunk_size = MIN(remaining, chunk_size);
+
+        if (qemu_get_buffer(f, shm_buf, this_chunk_size) < this_chunk_size) {
+            ret = -EINVAL;
+            goto fail;
+        }
+
+        ret = vhost_fs_set_state(&fs->vhost_dev, state_offset, this_chunk_size);
+        if (ret < 0) {
+            goto fail;
+        }
+
+        state_offset += this_chunk_size;
+        remaining -= this_chunk_size;
+    } while (remaining > 0);
+
+    ret = 0;
+fail:
+    ret2 = vhost_fs_set_state_fd(&fs->vhost_dev, -1, 0);
+    if (ret2 < 0) {
+        error_report("Failed to remove state FD from the vhost-user-fs back "
+                     "end -- perhaps it failed to deserialize/apply the state: "
+                     "%s", strerror(-ret2));
+        if (ret == 0) {
+            ret = ret2;
+        }
+    }
+
+early_fail:
+    if (shm_buf) {
+        qemu_memfd_free(shm_buf, chunk_size, memfd);
+    }
+
+    return ret;
+}
+
 static const VMStateDescription vuf_vmstate = {
     .name = "vhost-user-fs",
-    .unmigratable = 1,
+    .version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_VIRTIO_DEVICE,
+        {
+            .name = "back-end",
+            .info = &(const VMStateInfo) {
+                .name = "virtio-fs back-end state",
+                .get = vuf_load_state,
+                .put = vuf_save_state,
+            },
+        },
+        VMSTATE_END_OF_LIST()
+    },
 };
 
 static Property vuf_properties[] = {
-- 
2.39.1


