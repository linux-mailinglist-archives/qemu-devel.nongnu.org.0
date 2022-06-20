Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBAB55172A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 13:20:08 +0200 (CEST)
Received: from localhost ([::1]:46902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3FRu-0001ZZ-Q3
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 07:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FB2-0003D5-PO
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FAv-0007Ze-JT
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655722952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bii81+5cPbNcQvLi1k3r8ya1PODnQU2o6ZLg47dNnZQ=;
 b=FyPZQe7XY8/9uq555du+eaDuC5333iJsNhZXOvbnw9KU+bcRlbgxW0TPTac3oI6sQOZQzd
 EJJTAEmQc4429d7sdueAnGH87XXRs7SwhV+BQM6CTjzBQH6sE3tRY4KV7LF59TuGrk1dQi
 4r1bNysym4y3oDUU7RWGhRMfDw2bpsY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-p2sI7VEAOi2XTv-wdgxDjA-1; Mon, 20 Jun 2022 07:02:25 -0400
X-MC-Unique: p2sI7VEAOi2XTv-wdgxDjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A54CC185A79C;
 Mon, 20 Jun 2022 11:02:24 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F42EC08087;
 Mon, 20 Jun 2022 11:02:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: [PATCH v2 09/21] migration: introduce a QIOChannel impl for
 BlockDriverState VMState
Date: Mon, 20 Jun 2022 12:01:53 +0100
Message-Id: <20220620110205.1357829-10-berrange@redhat.com>
In-Reply-To: <20220620110205.1357829-1-berrange@redhat.com>
References: <20220620110205.1357829-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a QIOChannelBlock class that exposes the BlockDriverState
VMState region for I/O.

This is kept in the migration/ directory rather than io/, to avoid
a mutual dependancy between block/ <-> io/ directories. Also the
VMState should only be used by the migration code.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/channel-block.c | 195 ++++++++++++++++++++++++++++++++++++++
 migration/channel-block.h |  59 ++++++++++++
 migration/meson.build     |   1 +
 3 files changed, 255 insertions(+)
 create mode 100644 migration/channel-block.c
 create mode 100644 migration/channel-block.h

diff --git a/migration/channel-block.c b/migration/channel-block.c
new file mode 100644
index 0000000000..ad52342c10
--- /dev/null
+++ b/migration/channel-block.c
@@ -0,0 +1,195 @@
+/*
+ * QEMU I/O channels block driver
+ *
+ * Copyright (c) 2022 Red Hat, Inc.
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
+#include "migration/channel-block.h"
+#include "qapi/error.h"
+#include "block/block.h"
+#include "trace.h"
+
+QIOChannelBlock *
+qio_channel_block_new(BlockDriverState *bs)
+{
+    QIOChannelBlock *ioc;
+
+    ioc = QIO_CHANNEL_BLOCK(object_new(TYPE_QIO_CHANNEL_BLOCK));
+
+    bdrv_ref(bs);
+    ioc->bs = bs;
+
+    return ioc;
+}
+
+
+static void
+qio_channel_block_finalize(Object *obj)
+{
+    QIOChannelBlock *ioc = QIO_CHANNEL_BLOCK(obj);
+
+    g_clear_pointer(&ioc->bs, bdrv_unref);
+}
+
+
+static ssize_t
+qio_channel_block_readv(QIOChannel *ioc,
+                        const struct iovec *iov,
+                        size_t niov,
+                        int **fds,
+                        size_t *nfds,
+                        Error **errp)
+{
+    QIOChannelBlock *bioc = QIO_CHANNEL_BLOCK(ioc);
+    QEMUIOVector qiov;
+    int ret;
+
+    qemu_iovec_init_external(&qiov, (struct iovec *)iov, niov);
+    ret = bdrv_readv_vmstate(bioc->bs, &qiov, bioc->offset);
+    if (ret < 0) {
+        return ret;
+    }
+
+    bioc->offset += qiov.size;
+    return qiov.size;
+}
+
+
+static ssize_t
+qio_channel_block_writev(QIOChannel *ioc,
+                         const struct iovec *iov,
+                         size_t niov,
+                         int *fds,
+                         size_t nfds,
+                         int flags,
+                         Error **errp)
+{
+    QIOChannelBlock *bioc = QIO_CHANNEL_BLOCK(ioc);
+    QEMUIOVector qiov;
+    int ret;
+
+    qemu_iovec_init_external(&qiov, (struct iovec *)iov, niov);
+    ret = bdrv_writev_vmstate(bioc->bs, &qiov, bioc->offset);
+    if (ret < 0) {
+        return ret;
+    }
+
+    bioc->offset += qiov.size;
+    return qiov.size;
+}
+
+
+static int
+qio_channel_block_set_blocking(QIOChannel *ioc,
+                               bool enabled,
+                               Error **errp)
+{
+    if (!enabled) {
+        error_setg(errp, "Non-blocking mode not supported for block devices");
+        return -1;
+    }
+    return 0;
+}
+
+
+static off_t
+qio_channel_block_seek(QIOChannel *ioc,
+                       off_t offset,
+                       int whence,
+                       Error **errp)
+{
+    QIOChannelBlock *bioc = QIO_CHANNEL_BLOCK(ioc);
+
+    switch (whence) {
+    case SEEK_SET:
+        bioc->offset = offset;
+        break;
+    case SEEK_CUR:
+        bioc->offset += whence;
+        break;
+    case SEEK_END:
+        error_setg(errp, "Size of VMstate region is unknown");
+        return (off_t)-1;
+    default:
+        g_assert_not_reached();
+    }
+
+    return bioc->offset;
+}
+
+
+static int
+qio_channel_block_close(QIOChannel *ioc,
+                        Error **errp)
+{
+    QIOChannelBlock *bioc = QIO_CHANNEL_BLOCK(ioc);
+    int rv;
+
+    if ((rv = bdrv_flush(bioc->bs)) < 0) {
+        error_setg_errno(errp, -rv,
+                         "Unable to flush VMState");
+        return -1;
+    }
+
+    g_clear_pointer(&bioc->bs, bdrv_unref);
+    bioc->offset = 0;
+
+    return 0;
+}
+
+
+static void
+qio_channel_block_set_aio_fd_handler(QIOChannel *ioc,
+                                     AioContext *ctx,
+                                     IOHandler *io_read,
+                                     IOHandler *io_write,
+                                     void *opaque)
+{
+    /* XXX anything we can do here ? */
+}
+
+
+static void
+qio_channel_block_class_init(ObjectClass *klass,
+                             void *class_data G_GNUC_UNUSED)
+{
+    QIOChannelClass *ioc_klass = QIO_CHANNEL_CLASS(klass);
+
+    ioc_klass->io_writev = qio_channel_block_writev;
+    ioc_klass->io_readv = qio_channel_block_readv;
+    ioc_klass->io_set_blocking = qio_channel_block_set_blocking;
+    ioc_klass->io_seek = qio_channel_block_seek;
+    ioc_klass->io_close = qio_channel_block_close;
+    ioc_klass->io_set_aio_fd_handler = qio_channel_block_set_aio_fd_handler;
+}
+
+static const TypeInfo qio_channel_block_info = {
+    .parent = TYPE_QIO_CHANNEL,
+    .name = TYPE_QIO_CHANNEL_BLOCK,
+    .instance_size = sizeof(QIOChannelBlock),
+    .instance_finalize = qio_channel_block_finalize,
+    .class_init = qio_channel_block_class_init,
+};
+
+static void
+qio_channel_block_register_types(void)
+{
+    type_register_static(&qio_channel_block_info);
+}
+
+type_init(qio_channel_block_register_types);
diff --git a/migration/channel-block.h b/migration/channel-block.h
new file mode 100644
index 0000000000..31673824e6
--- /dev/null
+++ b/migration/channel-block.h
@@ -0,0 +1,59 @@
+/*
+ * QEMU I/O channels block driver
+ *
+ * Copyright (c) 2022 Red Hat, Inc.
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
+#ifndef QIO_CHANNEL_BLOCK_H
+#define QIO_CHANNEL_BLOCK_H
+
+#include "io/channel.h"
+#include "qom/object.h"
+
+#define TYPE_QIO_CHANNEL_BLOCK "qio-channel-block"
+OBJECT_DECLARE_SIMPLE_TYPE(QIOChannelBlock, QIO_CHANNEL_BLOCK)
+
+
+/**
+ * QIOChannelBlock:
+ *
+ * The QIOChannelBlock object provides a channel implementation
+ * that is able to perform I/O on the BlockDriverState objects
+ * to the VMState region.
+ */
+
+struct QIOChannelBlock {
+    QIOChannel parent;
+    BlockDriverState *bs;
+    off_t offset;
+};
+
+
+/**
+ * qio_channel_block_new:
+ * @bs: the block driver state
+ *
+ * Create a new IO channel object that can perform
+ * I/O on a BlockDriverState object to the VMState
+ * region
+ *
+ * Returns: the new channel object
+ */
+QIOChannelBlock *
+qio_channel_block_new(BlockDriverState *bs);
+
+#endif /* QIO_CHANNEL_BLOCK_H */
diff --git a/migration/meson.build b/migration/meson.build
index 6880b61b10..8d309f5849 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -13,6 +13,7 @@ softmmu_ss.add(migration_files)
 softmmu_ss.add(files(
   'block-dirty-bitmap.c',
   'channel.c',
+  'channel-block.c',
   'colo-failover.c',
   'colo.c',
   'exec.c',
-- 
2.36.1


