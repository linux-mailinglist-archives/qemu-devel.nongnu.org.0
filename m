Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAF95ECD18
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 21:44:39 +0200 (CEST)
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odGVS-0004G5-W3
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 15:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odGLy-0008Kx-MZ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 15:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odGLv-0004bH-4M
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 15:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664307286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbCkvAkTeFd8tHu6yBaFbfQrbyWAETYqPCPQNDoT9QE=;
 b=KWm2DlquJ5T6RND/63ttTAr81KmjR7FWJjgvldLx0ABsVMa04ouzMRklJgC43uFygeLaVi
 CmLyV1WYXmFMaZGG9+jQDhdN3veD/ir2Yz3IvHkEMN4kDN+DForE1GhmoiWdRlc11WkpCX
 S9gZ0xSN5EfnRCxXY+wBvet3bcNRtPA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-EZ2Q7ngvNnWY0y1BvzbPkg-1; Tue, 27 Sep 2022 15:34:43 -0400
X-MC-Unique: EZ2Q7ngvNnWY0y1BvzbPkg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BDDE185A78F;
 Tue, 27 Sep 2022 19:34:42 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C699449BB65;
 Tue, 27 Sep 2022 19:34:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 Xie Changlong <xiechanglong.d@gmail.com>, Eric Blake <eblake@redhat.com>,
 integration@gluster.org, David Hildenbrand <david@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, afaria@redhat.com,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, sgarzare@redhat.com
Subject: [PATCH v5 02/12] blkio: add libblkio block driver
Date: Tue, 27 Sep 2022 15:34:21 -0400
Message-Id: <20220927193431.22302-3-stefanha@redhat.com>
In-Reply-To: <20220927193431.22302-1-stefanha@redhat.com>
References: <20220927193431.22302-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
high-performance disk I/O. It currently supports io_uring,
virtio-blk-vhost-user, and virtio-blk-vhost-vdpa with additional drivers
under development.

One of the reasons for developing libblkio is that other applications
besides QEMU can use it. This will be particularly useful for
virtio-blk-vhost-user which applications may wish to use for connecting
to qemu-storage-daemon.

libblkio also gives us an opportunity to develop in Rust behind a C API
that is easy to consume from QEMU.

This commit adds io_uring, virtio-blk-vhost-user, and
virtio-blk-vhost-vdpa BlockDrivers to QEMU using libblkio. It will be
easy to add other libblkio drivers since they will share the majority of
code.

For now I/O buffers are copied through bounce buffers if the libblkio
driver requires it. Later commits add an optimization for
pre-registering guest RAM to avoid bounce buffers.

The syntax is:

  --blockdev io_uring,node-name=drive0,filename=test.img,readonly=on|off,cache.direct=on|off

and:

  --blockdev virtio-blk-vhost-vdpa,node-name=drive0,path=/dev/vdpa...,readonly=on|off

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS                   |   6 +
 meson_options.txt             |   2 +
 qapi/block-core.json          |  53 ++-
 meson.build                   |   9 +
 block/blkio.c                 | 849 ++++++++++++++++++++++++++++++++++
 tests/qtest/modules-test.c    |   3 +
 block/meson.build             |   1 +
 scripts/meson-buildoptions.sh |   3 +
 8 files changed, 924 insertions(+), 2 deletions(-)
 create mode 100644 block/blkio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 789172b2a8..878005f65b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3403,6 +3403,12 @@ L: qemu-block@nongnu.org
 S: Maintained
 F: block/vdi.c
 
+blkio
+M: Stefan Hajnoczi <stefanha@redhat.com>
+L: qemu-block@nongnu.org
+S: Maintained
+F: block/blkio.c
+
 iSCSI
 M: Ronnie Sahlberg <ronniesahlberg@gmail.com>
 M: Paolo Bonzini <pbonzini@redhat.com>
diff --git a/meson_options.txt b/meson_options.txt
index 79c6af18d5..66128178bf 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -117,6 +117,8 @@ option('bzip2', type : 'feature', value : 'auto',
        description: 'bzip2 support for DMG images')
 option('cap_ng', type : 'feature', value : 'auto',
        description: 'cap_ng support')
+option('blkio', type : 'feature', value : 'auto',
+       description: 'libblkio block device driver')
 option('bpf', type : 'feature', value : 'auto',
         description: 'eBPF support')
 option('cocoa', type : 'feature', value : 'auto',
diff --git a/qapi/block-core.json b/qapi/block-core.json
index f21fa235f2..5aed0dd436 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2951,11 +2951,16 @@
             'file', 'snapshot-access', 'ftp', 'ftps', 'gluster',
             {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
             {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
-            'http', 'https', 'iscsi',
+            'http', 'https',
+            { 'name': 'io_uring', 'if': 'CONFIG_BLKIO' },
+            'iscsi',
             'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
             'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
             { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
-            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
+            'ssh', 'throttle', 'vdi', 'vhdx',
+            { 'name': 'virtio-blk-vhost-user', 'if': 'CONFIG_BLKIO' },
+            { 'name': 'virtio-blk-vhost-vdpa', 'if': 'CONFIG_BLKIO' },
+            'vmdk', 'vpc', 'vvfat' ] }
 
 ##
 # @BlockdevOptionsFile:
@@ -3678,6 +3683,42 @@
             '*debug': 'int',
             '*logfile': 'str' } }
 
+##
+# @BlockdevOptionsIoUring:
+#
+# Driver specific block device options for the io_uring backend.
+#
+# @filename: path to the image file
+#
+# Since: 7.2
+##
+{ 'struct': 'BlockdevOptionsIoUring',
+  'data': { 'filename': 'str' } }
+
+##
+# @BlockdevOptionsVirtioBlkVhostUser:
+#
+# Driver specific block device options for the virtio-blk-vhost-user backend.
+#
+# @path: path to the vhost-user UNIX domain socket.
+#
+# Since: 7.2
+##
+{ 'struct': 'BlockdevOptionsVirtioBlkVhostUser',
+  'data': { 'path': 'str' } }
+
+##
+# @BlockdevOptionsVirtioBlkVhostVdpa:
+#
+# Driver specific block device options for the virtio-blk-vhost-vdpa backend.
+#
+# @path: path to the vhost-vdpa character device.
+#
+# Since: 7.2
+##
+{ 'struct': 'BlockdevOptionsVirtioBlkVhostVdpa',
+  'data': { 'path': 'str' } }
+
 ##
 # @IscsiTransport:
 #
@@ -4305,6 +4346,8 @@
                        'if': 'HAVE_HOST_BLOCK_DEVICE' },
       'http':       'BlockdevOptionsCurlHttp',
       'https':      'BlockdevOptionsCurlHttps',
+      'io_uring':   { 'type': 'BlockdevOptionsIoUring',
+                      'if': 'CONFIG_BLKIO' },
       'iscsi':      'BlockdevOptionsIscsi',
       'luks':       'BlockdevOptionsLUKS',
       'nbd':        'BlockdevOptionsNbd',
@@ -4327,6 +4370,12 @@
       'throttle':   'BlockdevOptionsThrottle',
       'vdi':        'BlockdevOptionsGenericFormat',
       'vhdx':       'BlockdevOptionsGenericFormat',
+      'virtio-blk-vhost-user':
+                    { 'type': 'BlockdevOptionsVirtioBlkVhostUser',
+                      'if': 'CONFIG_BLKIO' },
+      'virtio-blk-vhost-vdpa':
+                    { 'type': 'BlockdevOptionsVirtioBlkVhostVdpa',
+                      'if': 'CONFIG_BLKIO' },
       'vmdk':       'BlockdevOptionsGenericCOWFormat',
       'vpc':        'BlockdevOptionsGenericFormat',
       'vvfat':      'BlockdevOptionsVVFAT'
diff --git a/meson.build b/meson.build
index 8dc661363f..7c656e9c2f 100644
--- a/meson.build
+++ b/meson.build
@@ -738,6 +738,13 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
                      required: get_option('virglrenderer'),
                      kwargs: static_kwargs)
 endif
+blkio = not_found
+if not get_option('blkio').auto() or have_block
+  blkio = dependency('blkio',
+                     method: 'pkg-config',
+                     required: get_option('blkio'),
+                     kwargs: static_kwargs)
+endif
 curl = not_found
 if not get_option('curl').auto() or have_block
   curl = dependency('libcurl', version: '>=7.29.0',
@@ -1789,6 +1796,7 @@ config_host_data.set('CONFIG_LIBUDEV', libudev.found())
 config_host_data.set('CONFIG_LZO', lzo.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
+config_host_data.set('CONFIG_BLKIO', blkio.found())
 config_host_data.set('CONFIG_CURL', curl.found())
 config_host_data.set('CONFIG_CURSES', curses.found())
 config_host_data.set('CONFIG_GBM', gbm.found())
@@ -3841,6 +3849,7 @@ summary_info += {'PAM':               pam}
 summary_info += {'iconv support':     iconv}
 summary_info += {'curses support':    curses}
 summary_info += {'virgl support':     virgl}
+summary_info += {'blkio support':     blkio}
 summary_info += {'curl support':      curl}
 summary_info += {'Multipath support': mpathpersist}
 summary_info += {'PNG support':       png}
diff --git a/block/blkio.c b/block/blkio.c
new file mode 100644
index 0000000000..9244a653ef
--- /dev/null
+++ b/block/blkio.c
@@ -0,0 +1,849 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/*
+ * libblkio BlockDriver
+ *
+ * Copyright Red Hat, Inc.
+ *
+ * Author:
+ *   Stefan Hajnoczi <stefanha@redhat.com>
+ */
+
+#include "qemu/osdep.h"
+#include <blkio.h>
+#include "block/block_int.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
+#include "qemu/module.h"
+
+/*
+ * Keep the QEMU BlockDriver names identical to the libblkio driver names.
+ * Using macros instead of typing out the string literals avoids typos.
+ */
+#define DRIVER_IO_URING "io_uring"
+#define DRIVER_VIRTIO_BLK_VHOST_USER "virtio-blk-vhost-user"
+#define DRIVER_VIRTIO_BLK_VHOST_VDPA "virtio-blk-vhost-vdpa"
+
+/*
+ * Allocated bounce buffers are kept in a list sorted by buffer address.
+ */
+typedef struct BlkioBounceBuf {
+    QLIST_ENTRY(BlkioBounceBuf) next;
+
+    /* The bounce buffer */
+    struct iovec buf;
+} BlkioBounceBuf;
+
+typedef struct {
+    /*
+     * libblkio is not thread-safe so this lock protects ->blkio and
+     * ->blkioq.
+     */
+    QemuMutex blkio_lock;
+    struct blkio *blkio;
+    struct blkioq *blkioq; /* make this multi-queue in the future... */
+    int completion_fd;
+
+    /*
+     * Polling fetches the next completion into this field.
+     *
+     * No lock is necessary since only one thread calls aio_poll() and invokes
+     * fd and poll handlers.
+     */
+    struct blkio_completion poll_completion;
+
+    /*
+     * Protects ->bounce_pool, ->bounce_bufs, ->bounce_available.
+     *
+     * Lock ordering: ->bounce_lock before ->blkio_lock.
+     */
+    CoMutex bounce_lock;
+
+    /* Bounce buffer pool */
+    struct blkio_mem_region bounce_pool;
+
+    /* Sorted list of allocated bounce buffers */
+    QLIST_HEAD(, BlkioBounceBuf) bounce_bufs;
+
+    /* Queue for coroutines waiting for bounce buffer space */
+    CoQueue bounce_available;
+
+    /* The value of the "mem-region-alignment" property */
+    size_t mem_region_alignment;
+
+    /* Can we skip adding/deleting blkio_mem_regions? */
+    bool needs_mem_regions;
+} BDRVBlkioState;
+
+/* Called with s->bounce_lock held */
+static int blkio_resize_bounce_pool(BDRVBlkioState *s, int64_t bytes)
+{
+    /* There can be no allocated bounce buffers during resize */
+    assert(QLIST_EMPTY(&s->bounce_bufs));
+
+    /* Pad size to reduce frequency of resize calls */
+    bytes += 128 * 1024;
+
+    WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
+        int ret;
+
+        if (s->bounce_pool.addr) {
+            blkio_unmap_mem_region(s->blkio, &s->bounce_pool);
+            blkio_free_mem_region(s->blkio, &s->bounce_pool);
+            memset(&s->bounce_pool, 0, sizeof(s->bounce_pool));
+        }
+
+        /* Automatically freed when s->blkio is destroyed */
+        ret = blkio_alloc_mem_region(s->blkio, &s->bounce_pool, bytes);
+        if (ret < 0) {
+            return ret;
+        }
+
+        ret = blkio_map_mem_region(s->blkio, &s->bounce_pool);
+        if (ret < 0) {
+            blkio_free_mem_region(s->blkio, &s->bounce_pool);
+            memset(&s->bounce_pool, 0, sizeof(s->bounce_pool));
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
+/* Called with s->bounce_lock held */
+static bool
+blkio_do_alloc_bounce_buffer(BDRVBlkioState *s, BlkioBounceBuf *bounce,
+                             int64_t bytes)
+{
+    void *addr = s->bounce_pool.addr;
+    BlkioBounceBuf *cur = NULL;
+    BlkioBounceBuf *prev = NULL;
+    ptrdiff_t space;
+
+    /*
+     * This is just a linear search over the holes between requests. An
+     * efficient allocator would be nice.
+     */
+    QLIST_FOREACH(cur, &s->bounce_bufs, next) {
+        space = cur->buf.iov_base - addr;
+        if (bytes <= space) {
+            QLIST_INSERT_BEFORE(cur, bounce, next);
+            bounce->buf.iov_base = addr;
+            bounce->buf.iov_len = bytes;
+            return true;
+        }
+
+        addr = cur->buf.iov_base + cur->buf.iov_len;
+        prev = cur;
+    }
+
+    /* Is there space after the last request? */
+    space = s->bounce_pool.addr + s->bounce_pool.len - addr;
+    if (bytes > space) {
+        return false;
+    }
+    if (prev) {
+        QLIST_INSERT_AFTER(prev, bounce, next);
+    } else {
+        QLIST_INSERT_HEAD(&s->bounce_bufs, bounce, next);
+    }
+    bounce->buf.iov_base = addr;
+    bounce->buf.iov_len = bytes;
+    return true;
+}
+
+static int coroutine_fn
+blkio_alloc_bounce_buffer(BDRVBlkioState *s, BlkioBounceBuf *bounce,
+                          int64_t bytes)
+{
+    /*
+     * Ensure fairness: first time around we join the back of the queue,
+     * subsequently we join the front so we don't lose our place.
+     */
+    CoQueueWaitFlags wait_flags = 0;
+
+    QEMU_LOCK_GUARD(&s->bounce_lock);
+
+    /* Ensure fairness: don't even try if other requests are already waiting */
+    if (!qemu_co_queue_empty(&s->bounce_available)) {
+        qemu_co_queue_wait_flags(&s->bounce_available, &s->bounce_lock,
+                                 wait_flags);
+        wait_flags = CO_QUEUE_WAIT_FRONT;
+    }
+
+    while (true) {
+        if (blkio_do_alloc_bounce_buffer(s, bounce, bytes)) {
+            /* Kick the next queued request since there may be space */
+            qemu_co_queue_next(&s->bounce_available);
+            return 0;
+        }
+
+        /*
+         * If there are no in-flight requests then the pool was simply too
+         * small.
+         */
+        if (QLIST_EMPTY(&s->bounce_bufs)) {
+            bool ok;
+            int ret;
+
+            ret = blkio_resize_bounce_pool(s, bytes);
+            if (ret < 0) {
+                /* Kick the next queued request since that may fail too */
+                qemu_co_queue_next(&s->bounce_available);
+                return ret;
+            }
+
+            ok = blkio_do_alloc_bounce_buffer(s, bounce, bytes);
+            assert(ok); /* must have space this time */
+            return 0;
+        }
+
+        qemu_co_queue_wait_flags(&s->bounce_available, &s->bounce_lock,
+                                 wait_flags);
+        wait_flags = CO_QUEUE_WAIT_FRONT;
+    }
+}
+
+static void coroutine_fn blkio_free_bounce_buffer(BDRVBlkioState *s,
+                                                  BlkioBounceBuf *bounce)
+{
+    QEMU_LOCK_GUARD(&s->bounce_lock);
+
+    QLIST_REMOVE(bounce, next);
+
+    /* Wake up waiting coroutines since space may now be available */
+    qemu_co_queue_next(&s->bounce_available);
+}
+
+/* For async to .bdrv_co_*() conversion */
+typedef struct {
+    Coroutine *coroutine;
+    int ret;
+} BlkioCoData;
+
+static void blkio_completion_fd_read(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+    BDRVBlkioState *s = bs->opaque;
+    uint64_t val;
+    int ret;
+
+    /* Polling may have already fetched a completion */
+    if (s->poll_completion.user_data != NULL) {
+        BlkioCoData *cod = s->poll_completion.user_data;
+        cod->ret = s->poll_completion.ret;
+
+        /* Clear it in case aio_co_wake() enters a nested event loop */
+        s->poll_completion.user_data = NULL;
+
+        aio_co_wake(cod->coroutine);
+    }
+
+    /* Reset completion fd status */
+    ret = read(s->completion_fd, &val, sizeof(val));
+
+    /* Ignore errors, there's nothing we can do */
+    (void)ret;
+
+    /*
+     * Reading one completion at a time makes nested event loop re-entrancy
+     * simple. Change this loop to get multiple completions in one go if it
+     * becomes a performance bottleneck.
+     */
+    while (true) {
+        struct blkio_completion completion;
+
+        WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
+            ret = blkioq_do_io(s->blkioq, &completion, 0, 1, NULL);
+        }
+        if (ret != 1) {
+            break;
+        }
+
+        BlkioCoData *cod = completion.user_data;
+        cod->ret = completion.ret;
+        aio_co_wake(cod->coroutine);
+    }
+}
+
+static bool blkio_completion_fd_poll(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+    BDRVBlkioState *s = bs->opaque;
+    int ret;
+
+    /* Just in case we already fetched a completion */
+    if (s->poll_completion.user_data != NULL) {
+        return true;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
+        ret = blkioq_do_io(s->blkioq, &s->poll_completion, 0, 1, NULL);
+    }
+    return ret == 1;
+}
+
+static void blkio_completion_fd_poll_ready(void *opaque)
+{
+    blkio_completion_fd_read(opaque);
+}
+
+static void blkio_attach_aio_context(BlockDriverState *bs,
+                                     AioContext *new_context)
+{
+    BDRVBlkioState *s = bs->opaque;
+
+    aio_set_fd_handler(new_context,
+                       s->completion_fd,
+                       false,
+                       blkio_completion_fd_read,
+                       NULL,
+                       blkio_completion_fd_poll,
+                       blkio_completion_fd_poll_ready,
+                       bs);
+}
+
+static void blkio_detach_aio_context(BlockDriverState *bs)
+{
+    BDRVBlkioState *s = bs->opaque;
+
+    aio_set_fd_handler(bdrv_get_aio_context(bs),
+                       s->completion_fd,
+                       false, NULL, NULL, NULL, NULL, NULL);
+}
+
+/* Call with s->blkio_lock held to submit I/O after enqueuing a new request */
+static void blkio_submit_io(BlockDriverState *bs)
+{
+    if (qatomic_read(&bs->io_plugged) == 0) {
+        BDRVBlkioState *s = bs->opaque;
+
+        blkioq_do_io(s->blkioq, NULL, 0, 0, NULL);
+    }
+}
+
+static int coroutine_fn
+blkio_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
+{
+    BDRVBlkioState *s = bs->opaque;
+    BlkioCoData cod = {
+        .coroutine = qemu_coroutine_self(),
+    };
+
+    WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
+        blkioq_discard(s->blkioq, offset, bytes, &cod, 0);
+        blkio_submit_io(bs);
+    }
+
+    qemu_coroutine_yield();
+    return cod.ret;
+}
+
+static int coroutine_fn
+blkio_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                QEMUIOVector *qiov, BdrvRequestFlags flags)
+{
+    BlkioCoData cod = {
+        .coroutine = qemu_coroutine_self(),
+    };
+    BDRVBlkioState *s = bs->opaque;
+    bool use_bounce_buffer = s->needs_mem_regions;
+    BlkioBounceBuf bounce;
+    struct iovec *iov = qiov->iov;
+    int iovcnt = qiov->niov;
+
+    if (use_bounce_buffer) {
+        int ret = blkio_alloc_bounce_buffer(s, &bounce, bytes);
+        if (ret < 0) {
+            return ret;
+        }
+
+        iov = &bounce.buf;
+        iovcnt = 1;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
+        blkioq_readv(s->blkioq, offset, iov, iovcnt, &cod, 0);
+        blkio_submit_io(bs);
+    }
+
+    qemu_coroutine_yield();
+
+    if (use_bounce_buffer) {
+        if (cod.ret == 0) {
+            qemu_iovec_from_buf(qiov, 0,
+                                bounce.buf.iov_base,
+                                bounce.buf.iov_len);
+        }
+
+        blkio_free_bounce_buffer(s, &bounce);
+    }
+
+    return cod.ret;
+}
+
+static int coroutine_fn blkio_co_pwritev(BlockDriverState *bs, int64_t offset,
+        int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
+{
+    uint32_t blkio_flags = (flags & BDRV_REQ_FUA) ? BLKIO_REQ_FUA : 0;
+    BlkioCoData cod = {
+        .coroutine = qemu_coroutine_self(),
+    };
+    BDRVBlkioState *s = bs->opaque;
+    bool use_bounce_buffer = s->needs_mem_regions;
+    BlkioBounceBuf bounce;
+    struct iovec *iov = qiov->iov;
+    int iovcnt = qiov->niov;
+
+    if (use_bounce_buffer) {
+        int ret = blkio_alloc_bounce_buffer(s, &bounce, bytes);
+        if (ret < 0) {
+            return ret;
+        }
+
+        qemu_iovec_to_buf(qiov, 0, bounce.buf.iov_base, bytes);
+        iov = &bounce.buf;
+        iovcnt = 1;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
+        blkioq_writev(s->blkioq, offset, iov, iovcnt, &cod, blkio_flags);
+        blkio_submit_io(bs);
+    }
+
+    qemu_coroutine_yield();
+
+    if (use_bounce_buffer) {
+        blkio_free_bounce_buffer(s, &bounce);
+    }
+
+    return cod.ret;
+}
+
+static int coroutine_fn blkio_co_flush(BlockDriverState *bs)
+{
+    BDRVBlkioState *s = bs->opaque;
+    BlkioCoData cod = {
+        .coroutine = qemu_coroutine_self(),
+    };
+
+    WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
+        blkioq_flush(s->blkioq, &cod, 0);
+        blkio_submit_io(bs);
+    }
+
+    qemu_coroutine_yield();
+    return cod.ret;
+}
+
+static int coroutine_fn blkio_co_pwrite_zeroes(BlockDriverState *bs,
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
+{
+    BDRVBlkioState *s = bs->opaque;
+    BlkioCoData cod = {
+        .coroutine = qemu_coroutine_self(),
+    };
+    uint32_t blkio_flags = 0;
+
+    if (flags & BDRV_REQ_FUA) {
+        blkio_flags |= BLKIO_REQ_FUA;
+    }
+    if (!(flags & BDRV_REQ_MAY_UNMAP)) {
+        blkio_flags |= BLKIO_REQ_NO_UNMAP;
+    }
+    if (flags & BDRV_REQ_NO_FALLBACK) {
+        blkio_flags |= BLKIO_REQ_NO_FALLBACK;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
+        blkioq_write_zeroes(s->blkioq, offset, bytes, &cod, blkio_flags);
+        blkio_submit_io(bs);
+    }
+
+    qemu_coroutine_yield();
+    return cod.ret;
+}
+
+static void blkio_io_unplug(BlockDriverState *bs)
+{
+    BDRVBlkioState *s = bs->opaque;
+
+    WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
+        blkio_submit_io(bs);
+    }
+}
+
+static int blkio_io_uring_open(BlockDriverState *bs, QDict *options, int flags,
+                               Error **errp)
+{
+    const char *filename = qdict_get_str(options, "filename");
+    BDRVBlkioState *s = bs->opaque;
+    int ret;
+
+    ret = blkio_set_str(s->blkio, "path", filename);
+    qdict_del(options, "filename");
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to set path: %s",
+                         blkio_get_error_msg());
+        return ret;
+    }
+
+    if (flags & BDRV_O_NOCACHE) {
+        ret = blkio_set_bool(s->blkio, "direct", true);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "failed to set direct: %s",
+                             blkio_get_error_msg());
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
+static int blkio_virtio_blk_vhost_user_open(BlockDriverState *bs,
+        QDict *options, int flags, Error **errp)
+{
+    const char *path = qdict_get_try_str(options, "path");
+    BDRVBlkioState *s = bs->opaque;
+    int ret;
+
+    if (!path) {
+        error_setg(errp, "missing 'path' option");
+        return -EINVAL;
+    }
+
+    ret = blkio_set_str(s->blkio, "path", path);
+    qdict_del(options, "path");
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to set path: %s",
+                         blkio_get_error_msg());
+        return ret;
+    }
+
+    if (!(flags & BDRV_O_NOCACHE)) {
+        error_setg(errp, "cache.direct=off is not supported");
+        return -EINVAL;
+    }
+    return 0;
+}
+
+static int blkio_virtio_blk_vhost_vdpa_open(BlockDriverState *bs,
+        QDict *options, int flags, Error **errp)
+{
+    const char *path = qdict_get_try_str(options, "path");
+    BDRVBlkioState *s = bs->opaque;
+    int ret;
+
+    if (!path) {
+        error_setg(errp, "missing 'path' option");
+        return -EINVAL;
+    }
+
+    ret = blkio_set_str(s->blkio, "path", path);
+    qdict_del(options, "path");
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to set path: %s",
+                         blkio_get_error_msg());
+        return ret;
+    }
+
+    if (!(flags & BDRV_O_NOCACHE)) {
+        error_setg(errp, "cache.direct=off is not supported");
+        return -EINVAL;
+    }
+    return 0;
+}
+
+static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
+                           Error **errp)
+{
+    const char *blkio_driver = bs->drv->protocol_name;
+    BDRVBlkioState *s = bs->opaque;
+    int ret;
+
+    ret = blkio_create(blkio_driver, &s->blkio);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "blkio_create failed: %s",
+                         blkio_get_error_msg());
+        return ret;
+    }
+
+    if (strcmp(blkio_driver, DRIVER_IO_URING) == 0) {
+        ret = blkio_io_uring_open(bs, options, flags, errp);
+    } else if (strcmp(blkio_driver, DRIVER_VIRTIO_BLK_VHOST_USER) == 0) {
+        ret = blkio_virtio_blk_vhost_user_open(bs, options, flags, errp);
+    } else if (strcmp(blkio_driver, DRIVER_VIRTIO_BLK_VHOST_VDPA) == 0) {
+        ret = blkio_virtio_blk_vhost_vdpa_open(bs, options, flags, errp);
+    } else {
+        g_assert_not_reached();
+    }
+    if (ret < 0) {
+        blkio_destroy(&s->blkio);
+        return ret;
+    }
+
+    if (!(flags & BDRV_O_RDWR)) {
+        ret = blkio_set_bool(s->blkio, "read-only", true);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "failed to set read-only: %s",
+                             blkio_get_error_msg());
+            blkio_destroy(&s->blkio);
+            return ret;
+        }
+    }
+
+    ret = blkio_connect(s->blkio);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "blkio_connect failed: %s",
+                         blkio_get_error_msg());
+        blkio_destroy(&s->blkio);
+        return ret;
+    }
+
+    ret = blkio_get_bool(s->blkio,
+                         "needs-mem-regions",
+                         &s->needs_mem_regions);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret,
+                         "failed to get needs-mem-regions: %s",
+                         blkio_get_error_msg());
+        blkio_destroy(&s->blkio);
+        return ret;
+    }
+
+    ret = blkio_get_uint64(s->blkio,
+                           "mem-region-alignment",
+                           &s->mem_region_alignment);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret,
+                         "failed to get mem-region-alignment: %s",
+                         blkio_get_error_msg());
+        blkio_destroy(&s->blkio);
+        return ret;
+    }
+
+    ret = blkio_start(s->blkio);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "blkio_start failed: %s",
+                         blkio_get_error_msg());
+        blkio_destroy(&s->blkio);
+        return ret;
+    }
+
+    bs->supported_write_flags = BDRV_REQ_FUA;
+    bs->supported_zero_flags = BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP |
+                               BDRV_REQ_NO_FALLBACK;
+
+    qemu_mutex_init(&s->blkio_lock);
+    qemu_co_mutex_init(&s->bounce_lock);
+    qemu_co_queue_init(&s->bounce_available);
+    QLIST_INIT(&s->bounce_bufs);
+    s->blkioq = blkio_get_queue(s->blkio, 0);
+    s->completion_fd = blkioq_get_completion_fd(s->blkioq);
+
+    blkio_attach_aio_context(bs, bdrv_get_aio_context(bs));
+    return 0;
+}
+
+static void blkio_close(BlockDriverState *bs)
+{
+    BDRVBlkioState *s = bs->opaque;
+
+    /* There is no destroy() API for s->bounce_lock */
+
+    qemu_mutex_destroy(&s->blkio_lock);
+    blkio_detach_aio_context(bs);
+    blkio_destroy(&s->blkio);
+}
+
+static int64_t blkio_getlength(BlockDriverState *bs)
+{
+    BDRVBlkioState *s = bs->opaque;
+    uint64_t capacity;
+    int ret;
+
+    WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
+        ret = blkio_get_uint64(s->blkio, "capacity", &capacity);
+    }
+    if (ret < 0) {
+        return -ret;
+    }
+
+    return capacity;
+}
+
+static int blkio_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+{
+    return 0;
+}
+
+static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
+{
+    BDRVBlkioState *s = bs->opaque;
+    QEMU_LOCK_GUARD(&s->blkio_lock);
+    int value;
+    int ret;
+
+    ret = blkio_get_int(s->blkio, "request-alignment", &value);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to get \"request-alignment\": %s",
+                         blkio_get_error_msg());
+        return;
+    }
+    bs->bl.request_alignment = value;
+    if (bs->bl.request_alignment < 1 ||
+        bs->bl.request_alignment >= INT_MAX ||
+        !is_power_of_2(bs->bl.request_alignment)) {
+        error_setg(errp, "invalid \"request-alignment\" value %" PRIu32 ", "
+                   "must be a power of 2 less than INT_MAX",
+                   bs->bl.request_alignment);
+        return;
+    }
+
+    ret = blkio_get_int(s->blkio, "optimal-io-size", &value);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to get \"optimal-io-size\": %s",
+                         blkio_get_error_msg());
+        return;
+    }
+    bs->bl.opt_transfer = value;
+    if (bs->bl.opt_transfer > INT_MAX ||
+        (bs->bl.opt_transfer % bs->bl.request_alignment)) {
+        error_setg(errp, "invalid \"optimal-io-size\" value %" PRIu32 ", must "
+                   "be a multiple of %" PRIu32, bs->bl.opt_transfer,
+                   bs->bl.request_alignment);
+        return;
+    }
+
+    ret = blkio_get_int(s->blkio, "max-transfer", &value);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to get \"max-transfer\": %s",
+                         blkio_get_error_msg());
+        return;
+    }
+    bs->bl.max_transfer = value;
+    if ((bs->bl.max_transfer % bs->bl.request_alignment) ||
+        (bs->bl.opt_transfer && (bs->bl.max_transfer % bs->bl.opt_transfer))) {
+        error_setg(errp, "invalid \"max-transfer\" value %" PRIu32 ", must be "
+                   "a multiple of %" PRIu32 " and %" PRIu32 " (if non-zero)",
+                   bs->bl.max_transfer, bs->bl.request_alignment,
+                   bs->bl.opt_transfer);
+        return;
+    }
+
+    ret = blkio_get_int(s->blkio, "buf-alignment", &value);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to get \"buf-alignment\": %s",
+                         blkio_get_error_msg());
+        return;
+    }
+    if (value < 1) {
+        error_setg(errp, "invalid \"buf-alignment\" value %d, must be "
+                   "positive", value);
+        return;
+    }
+    bs->bl.min_mem_alignment = value;
+
+    ret = blkio_get_int(s->blkio, "optimal-buf-alignment", &value);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret,
+                         "failed to get \"optimal-buf-alignment\": %s",
+                         blkio_get_error_msg());
+        return;
+    }
+    if (value < 1) {
+        error_setg(errp, "invalid \"optimal-buf-alignment\" value %d, "
+                   "must be positive", value);
+        return;
+    }
+    bs->bl.opt_mem_alignment = value;
+
+    ret = blkio_get_int(s->blkio, "max-segments", &bs->bl.max_iov);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to get \"max-segments\": %s",
+                         blkio_get_error_msg());
+        return;
+    }
+    if (value < 1) {
+        error_setg(errp, "invalid \"max-segments\" value %d, must be positive",
+                   bs->bl.max_iov);
+        return;
+    }
+}
+
+/*
+ * TODO
+ * Missing libblkio APIs:
+ * - block_status
+ * - co_invalidate_cache
+ *
+ * Out of scope?
+ * - create
+ * - truncate
+ */
+
+static BlockDriver bdrv_io_uring = {
+    .format_name                = DRIVER_IO_URING,
+    .protocol_name              = DRIVER_IO_URING,
+    .instance_size              = sizeof(BDRVBlkioState),
+    .bdrv_needs_filename        = true,
+    .bdrv_file_open             = blkio_file_open,
+    .bdrv_close                 = blkio_close,
+    .bdrv_getlength             = blkio_getlength,
+    .bdrv_get_info              = blkio_get_info,
+    .bdrv_attach_aio_context    = blkio_attach_aio_context,
+    .bdrv_detach_aio_context    = blkio_detach_aio_context,
+    .bdrv_co_pdiscard           = blkio_co_pdiscard,
+    .bdrv_co_preadv             = blkio_co_preadv,
+    .bdrv_co_pwritev            = blkio_co_pwritev,
+    .bdrv_co_flush_to_disk      = blkio_co_flush,
+    .bdrv_co_pwrite_zeroes      = blkio_co_pwrite_zeroes,
+    .bdrv_io_unplug             = blkio_io_unplug,
+    .bdrv_refresh_limits        = blkio_refresh_limits,
+};
+
+static BlockDriver bdrv_virtio_blk_vhost_user = {
+    .format_name                = DRIVER_VIRTIO_BLK_VHOST_USER,
+    .protocol_name              = DRIVER_VIRTIO_BLK_VHOST_USER,
+    .instance_size              = sizeof(BDRVBlkioState),
+    .bdrv_file_open             = blkio_file_open,
+    .bdrv_close                 = blkio_close,
+    .bdrv_getlength             = blkio_getlength,
+    .bdrv_get_info              = blkio_get_info,
+    .bdrv_attach_aio_context    = blkio_attach_aio_context,
+    .bdrv_detach_aio_context    = blkio_detach_aio_context,
+    .bdrv_co_pdiscard           = blkio_co_pdiscard,
+    .bdrv_co_preadv             = blkio_co_preadv,
+    .bdrv_co_pwritev            = blkio_co_pwritev,
+    .bdrv_co_flush_to_disk      = blkio_co_flush,
+    .bdrv_co_pwrite_zeroes      = blkio_co_pwrite_zeroes,
+    .bdrv_io_unplug             = blkio_io_unplug,
+    .bdrv_refresh_limits        = blkio_refresh_limits,
+};
+
+static BlockDriver bdrv_virtio_blk_vhost_vdpa = {
+    .format_name                = DRIVER_VIRTIO_BLK_VHOST_VDPA,
+    .protocol_name              = DRIVER_VIRTIO_BLK_VHOST_VDPA,
+    .instance_size              = sizeof(BDRVBlkioState),
+    .bdrv_file_open             = blkio_file_open,
+    .bdrv_close                 = blkio_close,
+    .bdrv_getlength             = blkio_getlength,
+    .bdrv_get_info              = blkio_get_info,
+    .bdrv_attach_aio_context    = blkio_attach_aio_context,
+    .bdrv_detach_aio_context    = blkio_detach_aio_context,
+    .bdrv_co_pdiscard           = blkio_co_pdiscard,
+    .bdrv_co_preadv             = blkio_co_preadv,
+    .bdrv_co_pwritev            = blkio_co_pwritev,
+    .bdrv_co_flush_to_disk      = blkio_co_flush,
+    .bdrv_co_pwrite_zeroes      = blkio_co_pwrite_zeroes,
+    .bdrv_io_unplug             = blkio_io_unplug,
+    .bdrv_refresh_limits        = blkio_refresh_limits,
+};
+
+static void bdrv_blkio_init(void)
+{
+    bdrv_register(&bdrv_io_uring);
+    bdrv_register(&bdrv_virtio_blk_vhost_user);
+    bdrv_register(&bdrv_virtio_blk_vhost_vdpa);
+}
+
+block_init(bdrv_blkio_init);
diff --git a/tests/qtest/modules-test.c b/tests/qtest/modules-test.c
index 88217686e1..be2575ae6d 100644
--- a/tests/qtest/modules-test.c
+++ b/tests/qtest/modules-test.c
@@ -16,6 +16,9 @@ static void test_modules_load(const void *data)
 int main(int argc, char *argv[])
 {
     const char *modules[] = {
+#ifdef CONFIG_BLKIO
+        "block-", "blkio",
+#endif
 #ifdef CONFIG_CURL
         "block-", "curl",
 #endif
diff --git a/block/meson.build b/block/meson.build
index 60bc305597..500878f082 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -92,6 +92,7 @@ block_modules = {}
 
 modsrc = []
 foreach m : [
+  [blkio, 'blkio', files('blkio.c')],
   [curl, 'curl', files('curl.c')],
   [glusterfs, 'gluster', files('gluster.c')],
   [libiscsi, 'iscsi', [files('iscsi.c'), libm]],
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index eb3267bef5..2cb0de5601 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -67,6 +67,7 @@ meson_options_help() {
   printf "%s\n" '  auth-pam        PAM access control'
   printf "%s\n" '  avx2            AVX2 optimizations'
   printf "%s\n" '  avx512f         AVX512F optimizations'
+  printf "%s\n" '  blkio           libblkio block device driver'
   printf "%s\n" '  bochs           bochs image format support'
   printf "%s\n" '  bpf             eBPF support'
   printf "%s\n" '  brlapi          brlapi character device driver'
@@ -198,6 +199,8 @@ _meson_option_parse() {
     --disable-gcov) printf "%s" -Db_coverage=false ;;
     --enable-lto) printf "%s" -Db_lto=true ;;
     --disable-lto) printf "%s" -Db_lto=false ;;
+    --enable-blkio) printf "%s" -Dblkio=enabled ;;
+    --disable-blkio) printf "%s" -Dblkio=disabled ;;
     --block-drv-ro-whitelist=*) quote_sh "-Dblock_drv_ro_whitelist=$2" ;;
     --block-drv-rw-whitelist=*) quote_sh "-Dblock_drv_rw_whitelist=$2" ;;
     --enable-block-drv-whitelist-in-tools) printf "%s" -Dblock_drv_whitelist_in_tools=true ;;
-- 
2.37.3


