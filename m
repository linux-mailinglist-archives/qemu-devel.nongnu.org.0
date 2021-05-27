Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404C639310B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:38:14 +0200 (CEST)
Received: from localhost ([::1]:42962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmH9J-0000Bi-81
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGwM-0007dD-Oy
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGwI-0004gk-GU
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6nxgyNxfNzPr/r4T7tvV9VeYIkZfn7E4pWpfAp8nI0=;
 b=F7tm+YXeifvZnu82QnVXLWnW5nuKVQCoaooc7W8QgQ3rfeKGDhV78lFp9Oq/XIdshwd/ni
 AbTsxnsikNKhG7+gG8s40MzD6sYCqS+D5UWpHU9IT5xsY+pEYBcz2BbTHrawbCZWKtdYwb
 13FKa7OVqixqiw2K1cZlEnaOb4ikEqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-maupDLBaMBCYhhc6kAk8yQ-1; Thu, 27 May 2021 10:24:42 -0400
X-MC-Unique: maupDLBaMBCYhhc6kAk8yQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0A06100960E;
 Thu, 27 May 2021 14:24:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EA265D9D3;
 Thu, 27 May 2021 14:24:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 934BC1800849; Thu, 27 May 2021 16:23:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/23] virtio-gpu: Add udmabuf helpers
Date: Thu, 27 May 2021 16:23:29 +0200
Message-Id: <20210527142340.1352791-13-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

Add helper functions to create a dmabuf for a resource and mmap it.
Also, introduce the fields blob and blob_size so that these helpers
can start to use them but the full picture will emerge only after
adding create_blob API in patch 8 of this series.

To be able to create a dmabuf using the udmabuf driver, Qemu needs
to be lauched with the memfd memory backend like this:

qemu-system-x86_64 -m 8192m -object memory-backend-memfd,id=mem1,size=8192M
-machine memory-backend=mem1

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210526231429.1045476-4-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h  |  11 +++
 hw/display/virtio-gpu-udmabuf.c | 158 ++++++++++++++++++++++++++++++++
 hw/display/meson.build          |   1 +
 3 files changed, 170 insertions(+)
 create mode 100644 hw/display/virtio-gpu-udmabuf.c

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 8ca2c55d9abb..265b1c516cd1 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -50,6 +50,12 @@ struct virtio_gpu_simple_resource {
     uint32_t scanout_bitmask;
     pixman_image_t *image;
     uint64_t hostmem;
+
+    uint64_t blob_size;
+    void *blob;
+    int dmabuf_fd;
+    uint8_t *remapped;
+
     QTAILQ_ENTRY(virtio_gpu_simple_resource) next;
 };
 
@@ -238,6 +244,11 @@ void virtio_gpu_update_cursor_data(VirtIOGPU *g,
                                    struct virtio_gpu_scanout *s,
                                    uint32_t resource_id);
 
+/* virtio-gpu-udmabuf.c */
+bool virtio_gpu_have_udmabuf(void);
+void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res);
+void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res);
+
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
                                   struct virtio_gpu_ctrl_command *cmd);
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
new file mode 100644
index 000000000000..71c4672e327a
--- /dev/null
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -0,0 +1,158 @@
+/*
+ * Virtio GPU Device
+ *
+ * Copyright Red Hat, Inc. 2013-2014
+ *
+ * Authors:
+ *     Dave Airlie <airlied@redhat.com>
+ *     Gerd Hoffmann <kraxel@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu-common.h"
+#include "qemu/iov.h"
+#include "ui/console.h"
+#include "hw/virtio/virtio-gpu.h"
+#include "hw/virtio/virtio-gpu-pixman.h"
+#include "trace.h"
+#include "exec/ramblock.h"
+#include "sysemu/hostmem.h"
+#include <sys/ioctl.h>
+#include <fcntl.h>
+#include <linux/memfd.h>
+#include "qemu/memfd.h"
+#include "standard-headers/linux/udmabuf.h"
+
+static void virtio_gpu_create_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    struct udmabuf_create_list *list;
+    RAMBlock *rb;
+    ram_addr_t offset;
+    int udmabuf, i;
+
+    udmabuf = udmabuf_fd();
+    if (udmabuf < 0) {
+        return;
+    }
+
+    list = g_malloc0(sizeof(struct udmabuf_create_list) +
+                     sizeof(struct udmabuf_create_item) * res->iov_cnt);
+
+    for (i = 0; i < res->iov_cnt; i++) {
+        rcu_read_lock();
+        rb = qemu_ram_block_from_host(res->iov[i].iov_base, false, &offset);
+        rcu_read_unlock();
+
+        if (!rb || rb->fd < 0) {
+            g_free(list);
+            return;
+        }
+
+        list->list[i].memfd  = rb->fd;
+        list->list[i].offset = offset;
+        list->list[i].size   = res->iov[i].iov_len;
+    }
+
+    list->count = res->iov_cnt;
+    list->flags = UDMABUF_FLAGS_CLOEXEC;
+
+    res->dmabuf_fd = ioctl(udmabuf, UDMABUF_CREATE_LIST, list);
+    if (res->dmabuf_fd < 0) {
+        warn_report("%s: UDMABUF_CREATE_LIST: %s", __func__,
+                    strerror(errno));
+    }
+    g_free(list);
+}
+
+static void virtio_gpu_remap_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    res->remapped = mmap(NULL, res->blob_size, PROT_READ,
+                         MAP_SHARED, res->dmabuf_fd, 0);
+    if (res->remapped == MAP_FAILED) {
+        warn_report("%s: dmabuf mmap failed: %s", __func__,
+                    strerror(errno));
+        res->remapped = NULL;
+    }
+}
+
+static void virtio_gpu_destroy_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    if (res->remapped) {
+        munmap(res->remapped, res->blob_size);
+        res->remapped = NULL;
+    }
+    if (res->dmabuf_fd >= 0) {
+        close(res->dmabuf_fd);
+        res->dmabuf_fd = -1;
+    }
+}
+
+static int find_memory_backend_type(Object *obj, void *opaque)
+{
+    bool *memfd_backend = opaque;
+    int ret;
+
+    if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND)) {
+        HostMemoryBackend *backend = MEMORY_BACKEND(obj);
+        RAMBlock *rb = backend->mr.ram_block;
+
+        if (rb && rb->fd > 0) {
+            ret = fcntl(rb->fd, F_GET_SEALS);
+            if (ret > 0) {
+                *memfd_backend = true;
+            }
+        }
+    }
+
+    return 0;
+}
+
+bool virtio_gpu_have_udmabuf(void)
+{
+    Object *memdev_root;
+    int udmabuf;
+    bool memfd_backend = false;
+
+    udmabuf = udmabuf_fd();
+    if (udmabuf < 0) {
+        return false;
+    }
+
+    memdev_root = object_resolve_path("/objects", NULL);
+    object_child_foreach(memdev_root, find_memory_backend_type, &memfd_backend);
+
+    return memfd_backend;
+}
+
+void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    void *pdata = NULL;
+
+    res->dmabuf_fd = -1;
+    if (res->iov_cnt == 1) {
+        pdata = res->iov[0].iov_base;
+    } else {
+        virtio_gpu_create_udmabuf(res);
+        if (res->dmabuf_fd < 0) {
+            return;
+        }
+        virtio_gpu_remap_udmabuf(res);
+        if (!res->remapped) {
+            return;
+        }
+        pdata = res->remapped;
+    }
+
+    res->blob = pdata;
+}
+
+void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    if (res->remapped) {
+        virtio_gpu_destroy_udmabuf(res);
+    }
+}
diff --git a/hw/display/meson.build b/hw/display/meson.build
index aaf797c5e9ee..e1f473c1dff5 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -56,6 +56,7 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss = ss.source_set()
   virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
                     if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman])
+  virtio_gpu_ss.add(when: 'CONFIG_LINUX', if_true: files('virtio-gpu-udmabuf.c'))
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
 
-- 
2.31.1


