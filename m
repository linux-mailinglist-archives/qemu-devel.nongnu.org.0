Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD86214B17A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 10:08:37 +0100 (CET)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwMrM-0001KU-Va
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 04:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56680)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iwMp0-0005sN-DO
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 04:06:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iwMox-0002zw-VR
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 04:06:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39874
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iwMox-0002z7-Pf
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 04:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580202367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I9bcYUVBS7YlvljqOSTUMtgB4UJko9QBdoOwL2ixfs0=;
 b=B1XsABDgo1wP6/RTs8/G0o9dlFbw9r7kvHBnaJq+li5zsZvmIGNG24XlQCG+Wtr2kBLQys
 e1wmfmsVjRGcVCxT44R7cRE2/7RMSgUfuhroMSUrnPNkKHin1EBM0a141lR5P2jux9INIH
 0L+RKTG38HtNxjmLsxZq1raFM+mLXDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-pNoKkH48P1m8xL1bci60Dw-1; Tue, 28 Jan 2020 04:06:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A304A0CBF
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 09:06:04 +0000 (UTC)
Received: from secure.mitica (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 472D210027A1;
 Tue, 28 Jan 2020 09:06:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/7] multifd: Add zlib compression multifd support
Date: Tue, 28 Jan 2020 10:05:47 +0100
Message-Id: <20200128090550.5112-5-quintela@redhat.com>
In-Reply-To: <20200128090550.5112-1-quintela@redhat.com>
References: <20200128090550.5112-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: pNoKkH48P1m8xL1bci60Dw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/core/qdev-properties.c    |   2 +-
 migration/Makefile.objs      |   1 +
 migration/migration.c        |   9 ++
 migration/migration.h        |   1 +
 migration/multifd-zlib.c     | 293 +++++++++++++++++++++++++++++++++++
 migration/multifd.c          |   6 +
 migration/multifd.h          |   4 +
 qapi/migration.json          |   3 +-
 tests/qtest/migration-test.c |   6 +
 9 files changed, 323 insertions(+), 2 deletions(-)
 create mode 100644 migration/multifd-zlib.c

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 4442844d37..bf88a50cdf 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -645,7 +645,7 @@ const PropertyInfo qdev_prop_fdc_drive_type =3D {
 const PropertyInfo qdev_prop_multifd_method =3D {
     .name =3D "MultiFDMethod",
     .description =3D "multifd_method values, "
-                   "none",
+                   "none/zlib",
     .enum_table =3D &MultiFDMethod_lookup,
     .get =3D get_enum,
     .set =3D set_enum,
diff --git a/migration/Makefile.objs b/migration/Makefile.objs
index d3623d5f9b..0308caa5c5 100644
--- a/migration/Makefile.objs
+++ b/migration/Makefile.objs
@@ -8,6 +8,7 @@ common-obj-y +=3D xbzrle.o postcopy-ram.o
 common-obj-y +=3D qjson.o
 common-obj-y +=3D block-dirty-bitmap.o
 common-obj-y +=3D multifd.o
+common-obj-y +=3D multifd-zlib.o
=20
 common-obj-$(CONFIG_RDMA) +=3D rdma.o
=20
diff --git a/migration/migration.c b/migration/migration.c
index 4f88f8e958..3b081e8147 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2265,6 +2265,15 @@ MultiFDMethod migrate_multifd_method(void)
     return s->parameters.multifd_method;
 }
=20
+int migrate_multifd_zlib_level(void)
+{
+    MigrationState *s;
+
+    s =3D migrate_get_current();
+
+    return s->parameters.multifd_zlib_level;
+}
+
 int migrate_use_xbzrle(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index 3d23a0852e..95e9c196ff 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -301,6 +301,7 @@ bool migrate_use_multifd(void);
 bool migrate_pause_before_switchover(void);
 int migrate_multifd_channels(void);
 MultiFDMethod migrate_multifd_method(void);
+int migrate_multifd_zlib_level(void);
=20
 int migrate_use_xbzrle(void);
 int64_t migrate_xbzrle_cache_size(void);
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
new file mode 100644
index 0000000000..1589ea78b2
--- /dev/null
+++ b/migration/multifd-zlib.c
@@ -0,0 +1,293 @@
+/*
+ * Multifd zlib compression implementation
+ *
+ * Copyright (c) 2020 Red Hat Inc
+ *
+ * Authors:
+ *  Juan Quintela <quintela@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <zlib.h>
+#include "qemu/rcu.h"
+#include "exec/target_page.h"
+#include "qapi/error.h"
+#include "migration.h"
+#include "trace.h"
+#include "multifd.h"
+
+struct zlib_data {
+    /* stream for compression */
+    z_stream zs;
+    /* compressed buffer */
+    uint8_t *zbuff;
+    /* size of compressed buffer */
+    uint32_t zbuff_len;
+};
+
+/* Multifd zlib compression */
+
+/**
+ * zlib_send_setup: setup send side
+ *
+ * Setup each channel with zlib compression.
+ *
+ * Returns 0 for success or -1 for error
+ *
+ * @p: Params for the channel that we are using
+ * @errp: pointer to an error
+ */
+static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
+{
+    uint32_t page_count =3D MULTIFD_PACKET_SIZE / qemu_target_page_size();
+    struct zlib_data *z =3D g_malloc0(sizeof(struct zlib_data));
+    z_stream *zs =3D &z->zs;
+
+    zs->zalloc =3D Z_NULL;
+    zs->zfree =3D Z_NULL;
+    zs->opaque =3D Z_NULL;
+    if (deflateInit(zs, migrate_multifd_zlib_level()) !=3D Z_OK) {
+        g_free(z);
+        error_setg(errp, "multifd %d: deflate init failed", p->id);
+        return -1;
+    }
+    /* We will never have more than page_count pages */
+    z->zbuff_len =3D page_count * qemu_target_page_size();
+    z->zbuff_len *=3D 2;
+    z->zbuff =3D g_try_malloc(z->zbuff_len);
+    if (!z->zbuff) {
+        deflateEnd(&z->zs);
+        g_free(z);
+        error_setg(errp, "multifd %d: out of memory for zbuff", p->id);
+        return -1;
+    }
+    p->data =3D z;
+    return 0;
+}
+
+/**
+ * zlib_send_cleanup: cleanup send side
+ *
+ * Close the channel and return memory.
+ *
+ * @p: Params for the channel that we are using
+ */
+static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
+{
+    struct zlib_data *z =3D p->data;
+
+    deflateEnd(&z->zs);
+    g_free(z->zbuff);
+    z->zbuff =3D NULL;
+    g_free(p->data);
+    p->data =3D NULL;
+}
+
+/**
+ * zlib_send_prepare: prepare date to be able to send
+ *
+ * Create a compressed buffer with all the pages that we are going to
+ * send.
+ *
+ * Returns 0 for success or -1 for error
+ *
+ * @p: Params for the channel that we are using
+ * @used: number of pages used
+ */
+static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **=
errp)
+{
+    struct iovec *iov =3D p->pages->iov;
+    struct zlib_data *z =3D p->data;
+    z_stream *zs =3D &z->zs;
+    uint32_t out_size =3D 0;
+    int ret;
+    uint32_t i;
+
+    for (i =3D 0; i < used; i++) {
+        uint32_t available =3D z->zbuff_len - out_size;
+        int flush =3D Z_NO_FLUSH;
+
+        if (i =3D=3D used - 1) {
+            flush =3D Z_SYNC_FLUSH;
+        }
+
+        zs->avail_in =3D iov[i].iov_len;
+        zs->next_in =3D iov[i].iov_base;
+
+        zs->avail_out =3D available;
+        zs->next_out =3D z->zbuff + out_size;
+
+        ret =3D deflate(zs, flush);
+        if (ret !=3D Z_OK) {
+            error_setg(errp, "multifd %d: deflate returned %d instead of Z=
_OK",
+                       p->id, ret);
+            return -1;
+        }
+        out_size +=3D available - zs->avail_out;
+    }
+    p->next_packet_size =3D out_size;
+    p->flags |=3D MULTIFD_FLAG_ZLIB;
+
+    return 0;
+}
+
+/**
+ * zlib_send_write: do the actual write of the data
+ *
+ * Do the actual write of the comprresed buffer.
+ *
+ * Returns 0 for success or -1 for error
+ *
+ * @p: Params for the channel that we are using
+ * @used: number of pages used
+ * @errp: pointer to an error
+ */
+static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **er=
rp)
+{
+    struct zlib_data *z =3D p->data;
+
+    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_si=
ze,
+                                 errp);
+}
+
+/**
+ * zlib_recv_setup: setup receive side
+ *
+ * Create the compressed channel and buffer.
+ *
+ * Returns 0 for success or -1 for error
+ *
+ * @p: Params for the channel that we are using
+ * @errp: pointer to an error
+ */
+static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
+{
+    uint32_t page_count =3D MULTIFD_PACKET_SIZE / qemu_target_page_size();
+    struct zlib_data *z =3D g_malloc0(sizeof(struct zlib_data));
+    z_stream *zs =3D &z->zs;
+
+    p->data =3D z;
+    zs->zalloc =3D Z_NULL;
+    zs->zfree =3D Z_NULL;
+    zs->opaque =3D Z_NULL;
+    zs->avail_in =3D 0;
+    zs->next_in =3D Z_NULL;
+    if (inflateInit(zs) !=3D Z_OK) {
+        error_setg(errp, "multifd %d: inflate init failed", p->id);
+        return -1;
+    }
+    /* We will never have more than page_count pages */
+    z->zbuff_len =3D page_count * qemu_target_page_size();
+    /* We know compression "could" use more space */
+    z->zbuff_len *=3D 2;
+    z->zbuff =3D g_try_malloc(z->zbuff_len);
+    if (!z->zbuff) {
+        inflateEnd(zs);
+        error_setg(errp, "multifd %d: out of memory for zbuff", p->id);
+        return -1;
+    }
+    return 0;
+}
+
+/**
+ * zlib_recv_cleanup: setup receive side
+ *
+ * For no compression this function does nothing.
+ *
+ * @p: Params for the channel that we are using
+ */
+static void zlib_recv_cleanup(MultiFDRecvParams *p)
+{
+    struct zlib_data *z =3D p->data;
+
+    inflateEnd(&z->zs);
+    g_free(z->zbuff);
+    z->zbuff =3D NULL;
+    g_free(p->data);
+    p->data =3D NULL;
+}
+
+/**
+ * zlib_recv_pages: read the data from the channel into actual pages
+ *
+ * Read the compressed buffer, and uncompress it into the actual
+ * pages.
+ *
+ * Returns 0 for success or -1 for error
+ *
+ * @p: Params for the channel that we are using
+ * @used: number of pages used
+ * @errp: pointer to an error
+ */
+static int zlib_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **er=
rp)
+{
+    struct zlib_data *z =3D p->data;
+    z_stream *zs =3D &z->zs;
+    uint32_t in_size =3D p->next_packet_size;
+    /* we measure the change of total_out */
+    uint32_t out_size =3D zs->total_out;
+    uint32_t expected_size =3D used * qemu_target_page_size();
+    uint32_t flags =3D p->flags & MULTIFD_FLAG_METHOD_MASK;
+    int ret;
+    int i;
+
+    if (flags !=3D MULTIFD_FLAG_ZLIB) {
+        error_setg(errp, "multifd %d: flags received %x flags expected %x"=
,
+                   p->id, flags, MULTIFD_FLAG_ZLIB);
+        return -1;
+    }
+    ret =3D qio_channel_read_all(p->c, (void *)z->zbuff, in_size, errp);
+
+    if (ret !=3D 0) {
+        return ret;
+    }
+
+    zs->avail_in =3D in_size;
+    zs->next_in =3D z->zbuff;
+
+    for (i =3D 0; i < used; i++) {
+        struct iovec *iov =3D &p->pages->iov[i];
+        int flush =3D Z_NO_FLUSH;
+
+        if (i =3D=3D used  - 1) {
+            flush =3D Z_SYNC_FLUSH;
+        }
+
+        zs->avail_out =3D iov->iov_len;
+        zs->next_out =3D iov->iov_base;
+
+        ret =3D inflate(zs, flush);
+        if (ret !=3D Z_OK) {
+            error_setg(errp, "multifd %d: inflate returned %d instead of Z=
_OK",
+                       p->id, ret);
+            return ret;
+        }
+    }
+    out_size =3D zs->total_out - out_size;
+    if (out_size !=3D expected_size) {
+        error_setg(errp, "multifd %d: packet size received %d size expecte=
d %d",
+                   p->id, out_size, expected_size);
+        return -1;
+    }
+    return 0;
+}
+
+static MultiFDMethods multifd_zlib_ops =3D {
+    .send_setup =3D zlib_send_setup,
+    .send_cleanup =3D zlib_send_cleanup,
+    .send_prepare =3D zlib_send_prepare,
+    .send_write =3D zlib_send_write,
+    .recv_setup =3D zlib_recv_setup,
+    .recv_cleanup =3D zlib_recv_cleanup,
+    .recv_pages =3D zlib_recv_pages
+};
+
+static void multifd_zlib_register(void)
+{
+    multifd_register_ops(MULTIFD_METHOD_ZLIB, &multifd_zlib_ops);
+}
+
+migration_init(multifd_zlib_register);
diff --git a/migration/multifd.c b/migration/multifd.c
index 1c49c2a665..7bb9c3582f 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -166,6 +166,12 @@ static MultiFDMethods *multifd_ops[MULTIFD_METHOD__MAX=
] =3D {
     [MULTIFD_METHOD_NONE] =3D &multifd_nocomp_ops,
 };
=20
+void multifd_register_ops(int method, MultiFDMethods *ops)
+{
+    assert(0 < method && method < MULTIFD_METHOD__MAX);
+    multifd_ops[method] =3D ops;
+}
+
 static int multifd_send_initial_packet(MultiFDSendParams *p, Error **errp)
 {
     MultiFDInit_t msg =3D {};
diff --git a/migration/multifd.h b/migration/multifd.h
index c7fea4914c..3fa5132f1d 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -23,11 +23,13 @@ void multifd_recv_sync_main(void);
 void multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
=20
+/* Multifd Compression flags */
 #define MULTIFD_FLAG_SYNC (1 << 0)
=20
 /* We reserve 3 bits for METHODS */
 #define MULTIFD_FLAG_METHOD_MASK (7 << 1)
 #define MULTIFD_FLAG_NOCOMP (1 << 1)
+#define MULTIFD_FLAG_ZLIB (2 << 1)
=20
 /* This value needs to be a multiple of qemu_target_page_size() */
 #define MULTIFD_PACKET_SIZE (512 * 1024)
@@ -160,5 +162,7 @@ typedef struct {
     int (*recv_pages)(MultiFDRecvParams *p, uint32_t used, Error **errp);
 } MultiFDMethods;
=20
+void multifd_register_ops(int method, MultiFDMethods *ops);
+
 #endif
=20
diff --git a/qapi/migration.json b/qapi/migration.json
index 289dce0da7..032ee7d3e6 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -494,12 +494,13 @@
 # An enumeration of multifd compression.
 #
 # @none: no compression.
+# @zlib: use zlib compression method.
 #
 # Since: 5.0
 #
 ##
 { 'enum': 'MultiFDMethod',
-  'data': [ 'none' ] }
+  'data': [ 'none', 'zlib' ] }
=20
 ##
 # @MigrationParameter:
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index d2f9ef38f5..8effed205d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1313,6 +1313,11 @@ static void test_multifd_tcp_none(void)
     test_multifd_tcp("none");
 }
=20
+static void test_multifd_tcp_zlib(void)
+{
+    test_multifd_tcp("zlib");
+}
+
 /*
  * This test does:
  *  source               target
@@ -1475,6 +1480,7 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/auto_converge", test_migrate_auto_converge)=
;
     qtest_add_func("/migration/multifd/tcp/none", test_multifd_tcp_none);
     qtest_add_func("/migration/multifd/tcp/cancel", test_multifd_tcp_cance=
l);
+    qtest_add_func("/migration/multifd/tcp/zlib", test_multifd_tcp_zlib);
=20
     ret =3D g_test_run();
=20
--=20
2.24.1


