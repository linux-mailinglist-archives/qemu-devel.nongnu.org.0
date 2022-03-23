Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994ED4E513C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:21:52 +0100 (CET)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWz3n-0006IH-4q
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:21:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWyzk-0000xz-Uo
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:17:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWyzg-0001yK-3F
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648034255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLnq4mun/H8h5jGXpNruvkOQAG3FzNTj3QZG2VFydpE=;
 b=PC9UC11GGqwIdx/nNWkEoQWZtoi/GDaXVcu7FkMSuWtvshjfYVIhjW1lEPeHAdEhZ25Ev9
 ofiM2cn7/tSlngYW8EBq4kp/Bm0v2DcUg9gFb6YVL3CCMzxX9g8Xqj3P1zujDqMXolZnmY
 EfkF+T0QsSyxM9tql171umYhp/k5ikk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-oN4q2bhaPSW-bELnyMPQHA-1; Wed, 23 Mar 2022 07:17:31 -0400
X-MC-Unique: oN4q2bhaPSW-bELnyMPQHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1F75185A7BA;
 Wed, 23 Mar 2022 11:17:30 +0000 (UTC)
Received: from localhost (unknown [10.39.194.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B2EB41136E1;
 Wed, 23 Mar 2022 11:17:30 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/8] blkio: add io_uring block driver using libblkio
Date: Wed, 23 Mar 2022 11:17:20 +0000
Message-Id: <20220323111727.1100209-2-stefanha@redhat.com>
In-Reply-To: <20220323111727.1100209-1-stefanha@redhat.com>
References: <20220323111727.1100209-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alberto Faria <afaria@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, sgarzare@redhat.com
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
 block/blkio.c                 | 460 ++++++++++++++++++++++++++++++++++
 tests/qtest/modules-test.c    |   3 +
 block/meson.build             |   1 +
 scripts/meson-buildoptions.sh |   3 +
 8 files changed, 501 insertions(+), 1 deletion(-)
 create mode 100644 block/blkio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cc364afef7..0fb08dd4f7 100644
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
index e89f2dfb5b..d9bb283108 100644
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
index aef724ad3c..d52f542b2e 100644
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
index 0000000000..dd2308b967
--- /dev/null
+++ b/block/blkio.c
@@ -0,0 +1,460 @@
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
+
+    /*
+     * blkio_completion_fd_poll() stashes the next completion for
+     * blkio_completion_fd_poll_ready().
+     */
+    struct blkio_completion pending_completion;
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
+    return blkioq_get_completions(s->blkioq, &s->pending_completion, 1) == 1;
+}
+
+static void blkio_completion_fd_poll_ready(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+    BDRVBlkioState *s = bs->opaque;
+    BlkioAIOCB *acb = s->pending_completion.user_data;
+
+    blkio_aiocb_complete(acb, s->pending_completion.ret);
+
+    /* Process any remaining completions */
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
+    ret = blkio_alloc_mem_region(s->blkio, &acb->mem_region, mem_region_len,
+                                 0, NULL);
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
+    char *errmsg;
+    int ret;
+
+    ret = blkio_create(blkio_driver, &s->blkio, &errmsg);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "blkio_create failed: %s", errmsg);
+        free(errmsg);
+        return ret;
+    }
+
+    ret = blkio_set_str(s->blkio, "path", filename, &errmsg);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "failed to set path: %s", errmsg);
+        free(errmsg);
+        blkio_destroy(&s->blkio);
+        return ret;
+    }
+
+    if (flags & BDRV_O_NOCACHE) {
+        ret = blkio_set_bool(s->blkio, "direct", true, &errmsg);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "failed to set direct: %s", errmsg);
+            free(errmsg);
+            blkio_destroy(&s->blkio);
+            return ret;
+        }
+    }
+
+    if (!(flags & BDRV_O_RDWR)) {
+        ret = blkio_set_bool(s->blkio, "readonly", true, &errmsg);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "failed to set readonly: %s", errmsg);
+            free(errmsg);
+            blkio_destroy(&s->blkio);
+            return ret;
+        }
+    }
+
+    ret = blkio_connect(s->blkio, &errmsg);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "blkio_connect failed: %s", errmsg);
+        free(errmsg);
+        blkio_destroy(&s->blkio);
+        return ret;
+    }
+
+    ret = blkio_get_bool(s->blkio,
+                         "needs-mem-regions",
+                         &s->needs_mem_regions,
+                         &errmsg);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret,
+                         "failed to get needs-mem-regions: %s", errmsg);
+        free(errmsg);
+        blkio_destroy(&s->blkio);
+        return ret;
+    }
+
+    ret = blkio_get_uint64(s->blkio,
+                           "mem-region-alignment",
+                           &s->mem_region_alignment,
+                           &errmsg);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret,
+                         "failed to get mem-region-alignment: %s", errmsg);
+        free(errmsg);
+        blkio_destroy(&s->blkio);
+        return ret;
+    }
+
+    ret = blkio_start(s->blkio, &errmsg);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "blkio_start failed: %s", errmsg);
+        free(errmsg);
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
+    char *errmsg;
+    uint64_t capacity;
+    int ret;
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        ret = blkio_get_uint64(s->blkio, "capacity", &capacity, &errmsg);
+    }
+    if (ret < 0) {
+        free(errmsg);
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
+
+    /*
+     * TODO
+     * Missing libblkio APIs:
+     * - bdrv_refresh_limits
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


