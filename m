Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177AF4F3C59
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 17:35:55 +0200 (CEST)
Received: from localhost ([::1]:45766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nblDm-0002e2-5t
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 11:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nblBW-0008FH-Ch
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:33:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nblBT-0003v4-Hz
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649172810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcHV342QJs4RVOnHADxhG7Bn5RrMMjKHp5dHZ6URPI4=;
 b=KGCIX3fiApp+DO9gWJHrA+KQzYERGy2r9W32N3341VegfM3Uq9dHY4K7PM4n4j4bE+cGNN
 Vv6tqSb96fT2zrGOWLshyKn8/FHFaBEozJGTbyjzJ8lRlzA4bFsFIPap996DVjbRC2fjLp
 zTIzxee42Ua3GngLr44yD+LbcUwZJQs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-5lms0pYWNPGtvXWv0u7Kxg-1; Tue, 05 Apr 2022 11:33:28 -0400
X-MC-Unique: 5lms0pYWNPGtvXWv0u7Kxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 657DA3C11A16;
 Tue,  5 Apr 2022 15:33:27 +0000 (UTC)
Received: from localhost (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0DA740CF8E5;
 Tue,  5 Apr 2022 15:33:26 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 1/8] blkio: add io_uring block driver using libblkio
Date: Tue,  5 Apr 2022 16:33:16 +0100
Message-Id: <20220405153323.2082242-2-stefanha@redhat.com>
In-Reply-To: <20220405153323.2082242-1-stefanha@redhat.com>
References: <20220405153323.2082242-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alberto Faria <afaria@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
high-performance disk I/O. It currently supports io_uring with
additional drivers planned.

One of the reasons for developing libblkio is that other applications
besides QEMU can use it. This will be particularly useful for
vhost-user-blk which applications may wish to use for connecting to
qemu-storage-daemon.

libblkio also gives us an opportunity to develop in Rust behind a C API
that is easy to consume from QEMU.

This commit adds an io_uring BlockDriver to QEMU using libblkio. For now
I/O buffers are copied through bounce buffers if the libblkio driver
requires it. Later commits add an optimization for pre-registering guest
RAM to avoid bounce buffers. It will be easy to add other libblkio
drivers since they will share the majority of code.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS                   |   6 +
 meson_options.txt             |   2 +
 qapi/block-core.json          |  18 +-
 meson.build                   |   9 +
 block/blkio.c                 | 537 ++++++++++++++++++++++++++++++++++
 tests/qtest/modules-test.c    |   3 +
 block/meson.build             |   1 +
 scripts/meson-buildoptions.sh |   3 +
 8 files changed, 578 insertions(+), 1 deletion(-)
 create mode 100644 block/blkio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ad2451e03..d839301f68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3349,6 +3349,12 @@ L: qemu-block@nongnu.org
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
index 52b11cead4..1e82e770e7 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -101,6 +101,8 @@ option('bzip2', type : 'feature', value : 'auto',
        description: 'bzip2 support for DMG images')
 option('cap_ng', type : 'feature', value : 'auto',
        description: 'cap_ng support')
+option('blkio', type : 'feature', value : 'auto',
+       description: 'libblkio block device driver')
 option('bpf', type : 'feature', value : 'auto',
         description: 'eBPF support')
 option('cocoa', type : 'feature', value : 'auto',
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 4a7a6940a3..c04e1e325b 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2924,7 +2924,9 @@
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
@@ -3656,6 +3658,18 @@
             '*debug': 'int',
             '*logfile': 'str' } }
 
+##
+# @BlockdevOptionsIoUring:
+#
+# Driver specific block device options for the io_uring backend.
+#
+# @filename: path to the image file
+#
+# Since: 6.3
+##
+{ 'struct': 'BlockdevOptionsIoUring',
+  'data': { 'filename': 'str' } }
+
 ##
 # @IscsiTransport:
 #
@@ -4254,6 +4268,8 @@
                        'if': 'HAVE_HOST_BLOCK_DEVICE' },
       'http':       'BlockdevOptionsCurlHttp',
       'https':      'BlockdevOptionsCurlHttps',
+      'io_uring':   { 'type': 'BlockdevOptionsIoUring',
+                      'if': 'CONFIG_BLKIO' },
       'iscsi':      'BlockdevOptionsIscsi',
       'luks':       'BlockdevOptionsLUKS',
       'nbd':        'BlockdevOptionsNbd',
diff --git a/meson.build b/meson.build
index 861de93c4f..0ab17c8767 100644
--- a/meson.build
+++ b/meson.build
@@ -636,6 +636,13 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
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
@@ -1519,6 +1526,7 @@ config_host_data.set('CONFIG_LIBUDEV', libudev.found())
 config_host_data.set('CONFIG_LZO', lzo.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
+config_host_data.set('CONFIG_BLKIO', blkio.found())
 config_host_data.set('CONFIG_CURL', curl.found())
 config_host_data.set('CONFIG_CURSES', curses.found())
 config_host_data.set('CONFIG_GBM', gbm.found())
@@ -3672,6 +3680,7 @@ summary_info += {'PAM':               pam}
 summary_info += {'iconv support':     iconv}
 summary_info += {'curses support':    curses}
 summary_info += {'virgl support':     virgl}
+summary_info += {'blkio support':     blkio}
 summary_info += {'curl support':      curl}
 summary_info += {'Multipath support': mpathpersist}
 summary_info += {'VNC support':       vnc}
diff --git a/block/blkio.c b/block/blkio.c
new file mode 100644
index 0000000000..562e972003
--- /dev/null
+++ b/block/blkio.c
@@ -0,0 +1,537 @@
+#include "qemu/osdep.h"
+#include <blkio.h>
+#include "block/block_int.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
+#include "qemu/module.h"
+
+typedef struct BlkAIOCB {
+    BlockAIOCB common;
+    struct blkio_mem_region mem_region;
+    QEMUIOVector qiov;
+    struct iovec bounce_iov;
+} BlkioAIOCB;
+
+typedef struct {
+    /* Protects ->blkio and request submission on ->blkioq */
+    QemuMutex lock;
+
+    struct blkio *blkio;
+    struct blkioq *blkioq; /* this could be multi-queue in the future */
+    int completion_fd;
+
+    /* The value of the "mem-region-alignment" property */
+    size_t mem_region_alignment;
+
+    /* Can we skip adding/deleting blkio_mem_regions? */
+    bool needs_mem_regions;
+} BDRVBlkioState;
+
+static void blkio_aiocb_complete(BlkioAIOCB *acb, int ret)
+{
+    /* Copy bounce buffer back to qiov */
+    if (acb->qiov.niov > 0) {
+        qemu_iovec_from_buf(&acb->qiov, 0,
+                acb->bounce_iov.iov_base,
+                acb->bounce_iov.iov_len);
+        qemu_iovec_destroy(&acb->qiov);
+    }
+
+    acb->common.cb(acb->common.opaque, ret);
+
+    if (acb->mem_region.len > 0) {
+        BDRVBlkioState *s = acb->common.bs->opaque;
+
+        WITH_QEMU_LOCK_GUARD(&s->lock) {
+            blkio_free_mem_region(s->blkio, &acb->mem_region);
+        }
+    }
+
+    qemu_aio_unref(&acb->common);
+}
+
+/*
+ * Only the thread that calls aio_poll() invokes fd and poll handlers.
+ * Therefore locks are not necessary except when accessing s->blkio.
+ *
+ * No locking is performed around blkioq_get_completions() although other
+ * threads may submit I/O requests on s->blkioq. We're assuming there is no
+ * inteference between blkioq_get_completions() and other s->blkioq APIs.
+ */
+
+static void blkio_completion_fd_read(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+    BDRVBlkioState *s = bs->opaque;
+    struct blkio_completion completion;
+    uint64_t val;
+    ssize_t ret __attribute__((unused));
+
+    /* Reset completion fd status */
+    ret = read(s->completion_fd, &val, sizeof(val));
+
+    /*
+     * Reading one completion at a time makes nested event loop re-entrancy
+     * simple. Change this loop to get multiple completions in one go if it
+     * becomes a performance bottleneck.
+     */
+    while (blkioq_get_completions(s->blkioq, &completion, 1) == 1) {
+        blkio_aiocb_complete(completion.user_data, completion.ret);
+    }
+}
+
+static bool blkio_completion_fd_poll(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+    BDRVBlkioState *s = bs->opaque;
+
+    return blkioq_get_num_completions(s->blkioq) > 0;
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
+static const AIOCBInfo blkio_aiocb_info = {
+    .aiocb_size = sizeof(BlkioAIOCB),
+};
+
+/* Create a BlkioAIOCB */
+static BlkioAIOCB *blkio_aiocb_get(BlockDriverState *bs,
+                                   BlockCompletionFunc *cb,
+                                   void *opaque)
+{
+    BlkioAIOCB *acb = qemu_aio_get(&blkio_aiocb_info, bs, cb, opaque);
+
+    /* A few fields need to be initialized, leave the rest... */
+    acb->qiov.niov = 0;
+    acb->mem_region.len = 0;
+    return acb;
+}
+
+/* s->lock must be held */
+static int blkio_aiocb_init_mem_region_locked(BlkioAIOCB *acb, size_t len)
+{
+    BDRVBlkioState *s = acb->common.bs->opaque;
+    size_t mem_region_len = QEMU_ALIGN_UP(len, s->mem_region_alignment);
+    int ret;
+
+    ret = blkio_alloc_mem_region(s->blkio, &acb->mem_region,
+                                 mem_region_len, 0);
+    if (ret < 0) {
+        return ret;
+    }
+
+    acb->bounce_iov.iov_base = acb->mem_region.addr;
+    acb->bounce_iov.iov_len = len;
+    return 0;
+}
+
+static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offset,
+        int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags,
+        BlockCompletionFunc *cb, void *opaque)
+{
+    BDRVBlkioState *s = bs->opaque;
+    struct iovec *iov = qiov->iov;
+    int iovcnt = qiov->niov;
+    BlkioAIOCB *acb;
+    int ret;
+
+    QEMU_LOCK_GUARD(&s->lock);
+
+    acb = blkio_aiocb_get(bs, cb, opaque);
+
+    if (s->needs_mem_regions) {
+        if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
+            qemu_aio_unref(&acb->common);
+            return NULL;
+        }
+
+        /* Copy qiov because we'll call qemu_iovec_from_buf() on completion */
+        qemu_iovec_init_slice(&acb->qiov, qiov, 0, qiov->size);
+
+        iov = &acb->bounce_iov;
+        iovcnt = 1;
+    }
+
+    ret = blkioq_readv(s->blkioq, offset, iov, iovcnt, acb, 0);
+    if (ret < 0) {
+        if (s->needs_mem_regions) {
+            blkio_free_mem_region(s->blkio, &acb->mem_region);
+            qemu_iovec_destroy(&acb->qiov);
+        }
+        qemu_aio_unref(&acb->common);
+        return NULL;
+    }
+
+    if (qatomic_read(&bs->io_plugged) == 0) {
+        blkioq_submit_and_wait(s->blkioq, 0, NULL, NULL);
+    }
+
+    return &acb->common;
+}
+
+static BlockAIOCB *blkio_aio_pwritev(BlockDriverState *bs, int64_t offset,
+        int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags,
+        BlockCompletionFunc *cb, void *opaque)
+{
+    uint32_t blkio_flags = (flags & BDRV_REQ_FUA) ? BLKIO_REQ_FUA : 0;
+    BDRVBlkioState *s = bs->opaque;
+    struct iovec *iov = qiov->iov;
+    int iovcnt = qiov->niov;
+    BlkioAIOCB *acb;
+    int ret;
+
+    QEMU_LOCK_GUARD(&s->lock);
+
+    acb = blkio_aiocb_get(bs, cb, opaque);
+
+    if (s->needs_mem_regions) {
+        if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
+            qemu_aio_unref(&acb->common);
+            return NULL;
+        }
+
+        qemu_iovec_to_buf(qiov, 0, acb->bounce_iov.iov_base, bytes);
+
+        iov = &acb->bounce_iov;
+        iovcnt = 1;
+    }
+
+    ret = blkioq_writev(s->blkioq, offset, iov, iovcnt, acb, blkio_flags);
+    if (ret < 0) {
+        if (s->needs_mem_regions) {
+            blkio_free_mem_region(s->blkio, &acb->mem_region);
+        }
+        qemu_aio_unref(&acb->common);
+        return NULL;
+    }
+
+    if (qatomic_read(&bs->io_plugged) == 0) {
+        blkioq_submit_and_wait(s->blkioq, 0, NULL, NULL);
+    }
+
+    return &acb->common;
+}
+
+static BlockAIOCB *blkio_aio_flush(BlockDriverState *bs,
+                                   BlockCompletionFunc *cb,
+                                   void *opaque)
+{
+    BDRVBlkioState *s = bs->opaque;
+    BlkioAIOCB *acb;
+    int ret;
+
+    QEMU_LOCK_GUARD(&s->lock);
+
+    acb = blkio_aiocb_get(bs, cb, opaque);
+
+    ret = blkioq_flush(s->blkioq, acb, 0);
+    if (ret < 0) {
+        qemu_aio_unref(&acb->common);
+        return NULL;
+    }
+
+    if (qatomic_read(&bs->io_plugged) == 0) {
+        blkioq_submit_and_wait(s->blkioq, 0, NULL, NULL);
+    }
+
+    return &acb->common;
+}
+
+static void blkio_io_unplug(BlockDriverState *bs)
+{
+    BDRVBlkioState *s = bs->opaque;
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        blkioq_submit_and_wait(s->blkioq, 0, NULL, NULL);
+    }
+}
+
+static void blkio_parse_filename_io_uring(const char *filename, QDict *options,
+                                          Error **errp)
+{
+    bdrv_parse_filename_strip_prefix(filename, "io_uring:", options);
+}
+
+static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
+                           Error **errp)
+{
+    const char *filename = qdict_get_try_str(options, "filename");
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
+    ret = blkio_set_str(s->blkio, "path", filename);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to set path: %s",
+                         blkio_get_error_msg());
+        blkio_destroy(&s->blkio);
+        return ret;
+    }
+
+    if (flags & BDRV_O_NOCACHE) {
+        ret = blkio_set_bool(s->blkio, "direct", true);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "failed to set direct: %s",
+                             blkio_get_error_msg());
+            blkio_destroy(&s->blkio);
+            return ret;
+        }
+    }
+
+    if (!(flags & BDRV_O_RDWR)) {
+        ret = blkio_set_bool(s->blkio, "readonly", true);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "failed to set readonly: %s",
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
+
+    qemu_mutex_init(&s->lock);
+    s->blkioq = blkio_get_queue(s->blkio, 0);
+    s->completion_fd = blkioq_get_completion_fd(s->blkioq);
+
+    blkio_attach_aio_context(bs, bdrv_get_aio_context(bs));
+
+    qdict_del(options, "filename");
+    return 0;
+}
+
+static void blkio_close(BlockDriverState *bs)
+{
+    BDRVBlkioState *s = bs->opaque;
+
+    qemu_mutex_destroy(&s->lock);
+    blkio_destroy(&s->blkio);
+}
+
+static int64_t blkio_getlength(BlockDriverState *bs)
+{
+    BDRVBlkioState *s = bs->opaque;
+    uint64_t capacity;
+    int ret;
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
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
+    int value;
+    int ret;
+
+    ret = blkio_get_int(s->blkio,
+                        "buf-alignment",
+                        (int *)&bs->bl.request_alignment);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to get \"buf-alignment\": %s",
+                         blkio_get_error_msg());
+        return;
+    }
+    if (bs->bl.request_alignment < 1 ||
+        bs->bl.request_alignment >= INT_MAX ||
+        !is_power_of_2(bs->bl.request_alignment)) {
+        error_setg(errp, "invalid \"buf-alignment\" value %d, must be power "
+                   "of 2 less than INT_MAX", bs->bl.request_alignment);
+        return;
+    }
+
+    ret = blkio_get_int(s->blkio,
+                        "optimal-io-size",
+                        (int *)&bs->bl.opt_transfer);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to get \"buf-alignment\": %s",
+                         blkio_get_error_msg());
+        return;
+    }
+    if (bs->bl.opt_transfer > INT_MAX ||
+        (bs->bl.opt_transfer % bs->bl.request_alignment)) {
+        error_setg(errp, "invalid \"buf-alignment\" value %d, must be a "
+                   "multiple of %d", bs->bl.opt_transfer,
+                   bs->bl.request_alignment);
+        return;
+    }
+
+    ret = blkio_get_int(s->blkio,
+                        "max-transfer",
+                        (int *)&bs->bl.max_transfer);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to get \"max-transfer\": %s",
+                         blkio_get_error_msg());
+        return;
+    }
+    if ((bs->bl.max_transfer % bs->bl.request_alignment) ||
+        (bs->bl.opt_transfer && (bs->bl.max_transfer % bs->bl.opt_transfer))) {
+        error_setg(errp, "invalid \"max-transfer\" value %d, must be a "
+                   "multiple of %d and %d (if non-zero)",
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
+static BlockDriver bdrv_io_uring = {
+    .format_name                = "io_uring",
+    .protocol_name              = "io_uring",
+    .instance_size              = sizeof(BDRVBlkioState),
+    .bdrv_needs_filename        = true,
+    .bdrv_parse_filename        = blkio_parse_filename_io_uring,
+    .bdrv_file_open             = blkio_file_open,
+    .bdrv_close                 = blkio_close,
+    .bdrv_getlength             = blkio_getlength,
+    .has_variable_length        = true,
+    .bdrv_get_info              = blkio_get_info,
+    .bdrv_attach_aio_context    = blkio_attach_aio_context,
+    .bdrv_detach_aio_context    = blkio_detach_aio_context,
+    .bdrv_aio_preadv            = blkio_aio_preadv,
+    .bdrv_aio_pwritev           = blkio_aio_pwritev,
+    .bdrv_aio_flush             = blkio_aio_flush,
+    .bdrv_io_unplug             = blkio_io_unplug,
+    .bdrv_refresh_limits        = blkio_refresh_limits,
+
+    /*
+     * TODO
+     * Missing libblkio APIs:
+     * - write zeroes
+     * - discard
+     * - block_status
+     * - co_invalidate_cache
+     *
+     * Out of scope?
+     * - create
+     * - truncate
+     */
+};
+
+static void bdrv_blkio_init(void)
+{
+    bdrv_register(&bdrv_io_uring);
+}
+
+block_init(bdrv_blkio_init);
diff --git a/tests/qtest/modules-test.c b/tests/qtest/modules-test.c
index c238b3f422..2e0f73fdc6 100644
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
index 0b2a60c99b..787667384a 100644
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
index 1e26f4571e..845a29b9b7 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -40,6 +40,7 @@ meson_options_help() {
   printf "%s\n" '  auth-pam        PAM access control'
   printf "%s\n" '  avx2            AVX2 optimizations'
   printf "%s\n" '  avx512f         AVX512F optimizations'
+  printf "%s\n" '  blkio           libblkio block device driver'
   printf "%s\n" '  bochs           bochs image format support'
   printf "%s\n" '  bpf             eBPF support'
   printf "%s\n" '  brlapi          brlapi character device driver'
@@ -146,6 +147,8 @@ _meson_option_parse() {
     --disable-avx2) printf "%s" -Davx2=disabled ;;
     --enable-avx512f) printf "%s" -Davx512f=enabled ;;
     --disable-avx512f) printf "%s" -Davx512f=disabled ;;
+    --enable-blkio) printf "%s" -Dblkio=enabled ;;
+    --disable-blkio) printf "%s" -Dblkio=disabled ;;
     --enable-block-drv-whitelist-in-tools) printf "%s" -Dblock_drv_whitelist_in_tools=true ;;
     --disable-block-drv-whitelist-in-tools) printf "%s" -Dblock_drv_whitelist_in_tools=false ;;
     --enable-bochs) printf "%s" -Dbochs=enabled ;;
-- 
2.35.1


