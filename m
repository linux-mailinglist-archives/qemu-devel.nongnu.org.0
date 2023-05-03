Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6116F5305
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:21:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu7jX-0001Kb-Cq; Wed, 03 May 2023 04:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pu7jV-0001JD-JU
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:21:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pu7jR-0002v3-Nt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:21:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683102061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZj3VtPT5hXgNQYyQg4NVmxmzRbQdwHH3aBMc05e9TQ=;
 b=QYeuwe4uiYolBa7V8LiHnA9rpn9dn00tZ5faD/i+FNIcmnRO71QAcPZyjZBlkEh1Bxp6p7
 sVx7+OZ23HU85uIL5cw2ZfOQBxZNRdynsFBG6TSv1lARW7Nm+UI4pV5i51ZmxdDaFuYjrd
 Vk/d4vvqjPuXx0NZE//Fa4TrNMhR5TQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-alP6kc5mPX63vOUZEJ2Kcw-1; Wed, 03 May 2023 04:19:20 -0400
X-MC-Unique: alP6kc5mPX63vOUZEJ2Kcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EB3D102F231
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 08:19:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.45.225.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B162C15BAD;
 Wed,  3 May 2023 08:19:19 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Albert Esteve <aesteve@redhat.com>
Subject: [PATCH 1/4] virtio-dmabuf: introduce virtio-dmabuf
Date: Wed,  3 May 2023 10:19:08 +0200
Message-Id: <20230503081911.119168-2-aesteve@redhat.com>
In-Reply-To: <20230503081911.119168-1-aesteve@redhat.com>
References: <20230503081911.119168-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=aesteve@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This API manages objects (in this iteration,
dmabuf fds) that can be shared along different
virtio devices.

The API allows the different devices to add,
remove and/or retrieve the objects by simply
invoking the public functions that reside in the
virtio-dmabuf file.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 hw/display/meson.build            |   1 +
 hw/display/virtio-dmabuf.c        |  88 +++++++++++++++++++++++
 include/hw/virtio/virtio-dmabuf.h |  58 ++++++++++++++++
 tests/unit/meson.build            |   1 +
 tests/unit/test-virtio-dmabuf.c   | 112 ++++++++++++++++++++++++++++++
 5 files changed, 260 insertions(+)
 create mode 100644 hw/display/virtio-dmabuf.c
 create mode 100644 include/hw/virtio/virtio-dmabuf.h
 create mode 100644 tests/unit/test-virtio-dmabuf.c

diff --git a/hw/display/meson.build b/hw/display/meson.build
index 17165bd536..62a27395c0 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -37,6 +37,7 @@ softmmu_ss.add(when: 'CONFIG_MACFB', if_true: files('macfb.c'))
 softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
 
 softmmu_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-dmabuf.c'))
 
 if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
     config_all_devices.has_key('CONFIG_VGA_PCI') or
diff --git a/hw/display/virtio-dmabuf.c b/hw/display/virtio-dmabuf.c
new file mode 100644
index 0000000000..3db939a2e3
--- /dev/null
+++ b/hw/display/virtio-dmabuf.c
@@ -0,0 +1,88 @@
+/*
+ * Virtio Shared dma-buf
+ *
+ * Copyright Red Hat, Inc. 2023
+ *
+ * Authors:
+ *     Albert Esteve <aesteve@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "hw/virtio/virtio-dmabuf.h"
+
+
+#define UUID_TO_POINTER(i) \
+    ((gpointer) (g_intern_static_string(qemu_uuid_unparse_strdup((&i)))))
+
+
+static GMutex lock;
+static GHashTable *resource_uuids;
+
+
+static bool virtio_add_resource(QemuUUID uuid, gpointer value)
+{
+    gpointer struuid = UUID_TO_POINTER(uuid);
+    if (resource_uuids == NULL) {
+        resource_uuids = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+    } else if (g_hash_table_lookup(resource_uuids, struuid) != NULL) {
+        return false;
+    }
+
+    return g_hash_table_insert(resource_uuids, struuid, value);
+}
+
+static gpointer virtio_lookup_resource(QemuUUID uuid)
+{
+    if (resource_uuids == NULL) {
+        return NULL;
+    }
+
+    return g_hash_table_lookup(resource_uuids, UUID_TO_POINTER(uuid));
+}
+
+bool virtio_add_dmabuf(QemuUUID uuid, int udmabuf_fd)
+{
+    bool result;
+    if (udmabuf_fd < 0) {
+        return false;
+    }
+    g_mutex_lock(&lock);
+    if (resource_uuids == NULL) {
+        resource_uuids = g_hash_table_new(NULL, NULL);
+    }
+    result = virtio_add_resource(uuid, GINT_TO_POINTER(udmabuf_fd));
+    g_mutex_unlock(&lock);
+
+    return result;
+}
+
+bool virtio_remove_resource(QemuUUID uuid)
+{
+    bool result;
+    g_mutex_lock(&lock);
+    result = g_hash_table_remove(resource_uuids, UUID_TO_POINTER(uuid));
+    g_mutex_unlock(&lock);
+
+    return result;
+}
+
+int virtio_lookup_dmabuf(QemuUUID uuid)
+{
+    g_mutex_lock(&lock);
+    gpointer lookup_res = virtio_lookup_resource(uuid);
+    g_mutex_unlock(&lock);
+    if (lookup_res == NULL) {
+        return -1;
+    }
+
+    return GPOINTER_TO_INT(lookup_res);
+}
+
+void virtio_free_resources(void)
+{
+    g_hash_table_destroy(resource_uuids);
+    /* Reference count shall be 0 after the implicit unref on destroy */
+    resource_uuids = NULL;
+}
diff --git a/include/hw/virtio/virtio-dmabuf.h b/include/hw/virtio/virtio-dmabuf.h
new file mode 100644
index 0000000000..1c1c713128
--- /dev/null
+++ b/include/hw/virtio/virtio-dmabuf.h
@@ -0,0 +1,58 @@
+/*
+ * Virtio Shared dma-buf
+ *
+ * Copyright Red Hat, Inc. 2023
+ *
+ * Authors:
+ *     Albert Esteve <aesteve@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef VIRTIO_DMABUF_H
+#define VIRTIO_DMABUF_H
+
+#include "qemu/osdep.h"
+
+#include <glib.h>
+#include "qemu/uuid.h"
+
+/**
+ * virtio_add_dmabuf() - Add a new dma-buf resource to the lookup table
+ * @uuid: new resource's UUID
+ * @dmabuf_fd: the dma-buf descriptor that will be stored and shared with
+ *             other virtio devices
+ *
+ * Note: @dmabuf_fd must be a valid (non-negative) file descriptor.
+ *
+ * Return: true if the UUID did not exist and the resource has been added,
+ * false if another resource with the same UUID already existed.
+ * Note that if it finds a repeated UUID, the resource is not inserted in
+ * the lookup table.
+ */
+bool virtio_add_dmabuf(QemuUUID uuid, int dmabuf_fd);
+
+/**
+ * virtio_remove_resource() - Removes a resource from the lookup table
+ * @uuid: resource's UUID
+ *
+ * Return: true if the UUID has been found and removed from the lookup table.
+ */
+bool virtio_remove_resource(QemuUUID uuid);
+
+/**
+ * virtio_lookup_dmabuf() - Looks for a dma-buf resource in the lookup table
+ * @uuid: resource's UUID
+ *
+ * Return: the dma-buf file descriptor integer, or -1 if the key is not found.
+ */
+int virtio_lookup_dmabuf(QemuUUID uuid);
+
+/**
+ * virtio_free_resources() - Destroys all keys and values of the shared
+ * resources lookup table, and frees them
+ */
+void virtio_free_resources(void);
+
+#endif /* VIRTIO_DMABUF_H */
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 3bc78d8660..eb2a1a8872 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -50,6 +50,7 @@ tests = {
   'test-qapi-util': [],
   'test-interval-tree': [],
   'test-xs-node': [qom],
+  'test-virtio-dmabuf': [meson.project_source_root() / 'hw/display/virtio-dmabuf.c'],
 }
 
 if have_system or have_tools
diff --git a/tests/unit/test-virtio-dmabuf.c b/tests/unit/test-virtio-dmabuf.c
new file mode 100644
index 0000000000..063830c91c
--- /dev/null
+++ b/tests/unit/test-virtio-dmabuf.c
@@ -0,0 +1,112 @@
+/*
+ * QEMU tests for shared dma-buf API
+ *
+ * Copyright (c) 2023 Red Hat, Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/virtio/virtio-dmabuf.h"
+
+
+static void test_add_remove_resources(void)
+{
+    QemuUUID uuid;
+    int i, dmabuf_fd;
+
+    for (i = 0; i < 100; ++i) {
+        qemu_uuid_generate(&uuid);
+        dmabuf_fd = g_random_int_range(3, 500);
+        /* Add a new resource */
+        g_assert(virtio_add_dmabuf(uuid, dmabuf_fd));
+        g_assert_cmpint(virtio_lookup_dmabuf(uuid), ==, dmabuf_fd);
+        /* Remove the resource */
+        g_assert(virtio_remove_resource(uuid));
+        /* Resource is not found anymore */
+        g_assert_cmpint(virtio_lookup_dmabuf(uuid), ==, -1);
+    }
+}
+
+static void test_remove_invalid_resource(void)
+{
+    QemuUUID uuid;
+    int i;
+
+    for (i = 0; i < 20; ++i) {
+        qemu_uuid_generate(&uuid);
+        g_assert_cmpint(virtio_lookup_dmabuf(uuid), ==, -1);
+        /* Removing a resource that does not exist returns false */
+        g_assert_false(virtio_remove_resource(uuid));
+    }
+}
+
+static void test_add_invalid_resource(void)
+{
+    QemuUUID uuid;
+    int i, dmabuf_fd = -2, alt_dmabuf = 2;
+
+    for (i = 0; i < 20; ++i) {
+        qemu_uuid_generate(&uuid);
+        /* Add a new resource with invalid (negative) resource fd */
+        g_assert_false(virtio_add_dmabuf(uuid, dmabuf_fd));
+        /* Resource is not found */
+        g_assert_cmpint(virtio_lookup_dmabuf(uuid), ==, -1);
+    }
+
+    for (i = 0; i < 20; ++i) {
+        /* Add a valid resource */
+        qemu_uuid_generate(&uuid);
+        dmabuf_fd = g_random_int_range(3, 500);
+        g_assert(virtio_add_dmabuf(uuid, dmabuf_fd));
+        g_assert_cmpint(virtio_lookup_dmabuf(uuid), ==, dmabuf_fd);
+        /* Add a new resource with repeated uuid returns false */
+        g_assert_false(virtio_add_dmabuf(uuid, alt_dmabuf));
+        /* The value for the uuid key is not replaced */
+        g_assert_cmpint(virtio_lookup_dmabuf(uuid), ==, dmabuf_fd);
+    }
+}
+
+static void test_free_resources(void)
+{
+    QemuUUID uuids[20];
+    int i, dmabuf_fd;
+
+    for (i = 0; i < ARRAY_SIZE(uuids); ++i) {
+        qemu_uuid_generate(&uuids[i]);
+        dmabuf_fd = g_random_int_range(3, 500);
+        g_assert(virtio_add_dmabuf(uuids[i], dmabuf_fd));
+        g_assert_cmpint(virtio_lookup_dmabuf(uuids[i]), ==, dmabuf_fd);
+    }
+    virtio_free_resources();
+    for (i = 0; i < ARRAY_SIZE(uuids); ++i) {
+        /* None of the resources is found after free'd */
+        g_assert_cmpint(virtio_lookup_dmabuf(uuids[i]), ==, -1);
+    }
+
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    g_test_add_func("/virtio-dmabuf/add_rm_res", test_add_remove_resources);
+    g_test_add_func("/virtio-dmabuf/rm_invalid_res",
+                    test_remove_invalid_resource);
+    g_test_add_func("/virtio-dmabuf/add_invalid_res",
+                    test_add_invalid_resource);
+    g_test_add_func("/virtio-dmabuf/free_res", test_free_resources);
+
+    return g_test_run();
+}
-- 
2.40.0


