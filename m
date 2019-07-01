Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C80423E8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 13:19:30 +0200 (CEST)
Received: from localhost ([::1]:59012 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb1Ht-0000x1-W1
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 07:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60194)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hb0t9-0008M6-Qr
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:53:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hb0t6-0004o5-97
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:53:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47550)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hb0t5-0004lu-8c
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:53:51 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EF1D9C05D3F9
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 10:53:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-241.ams2.redhat.com
 [10.36.116.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1647353786;
 Wed, 12 Jun 2019 10:53:44 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 12 Jun 2019 12:53:23 +0200
Message-Id: <20190612105323.7051-7-quintela@redhat.com>
In-Reply-To: <20190612105323.7051-1-quintela@redhat.com>
References: <20190612105323.7051-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 12 Jun 2019 10:53:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 6/6] migration: Add zlib compression multifd
 support
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
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/core/qdev-properties.c |   2 +-
 migration/ram.c           | 262 ++++++++++++++++++++++++++++++++++++++
 qapi/migration.json       |   2 +-
 tests/migration-test.c    |   6 +
 4 files changed, 270 insertions(+), 2 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index ebeeb5c88d..e40aa806e2 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -651,7 +651,7 @@ const PropertyInfo qdev_prop_fdc_drive_type =3D {
 const PropertyInfo qdev_prop_multifd_compress =3D {
     .name =3D "MultifdCompress",
     .description =3D "multifd_compress values, "
-                   "none",
+                   "none/zlib",
     .enum_table =3D &MultifdCompress_lookup,
     .get =3D get_enum,
     .set =3D set_enum,
diff --git a/migration/ram.c b/migration/ram.c
index 3b0002ddba..691ebd9108 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -583,6 +583,7 @@ exit:
 #define MULTIFD_VERSION 1
=20
 #define MULTIFD_FLAG_SYNC (1 << 0)
+#define MULTIFD_FLAG_ZLIB (1 << 1)
=20
 /* This value needs to be a multiple of qemu_target_page_size() */
 #define MULTIFD_PACKET_SIZE (512 * 1024)
@@ -625,6 +626,15 @@ typedef struct {
     RAMBlock *block;
 } MultiFDPages_t;
=20
+struct zlib_data {
+    /* stream for compression */
+    z_stream zs;
+    /* compressed buffer */
+    uint8_t *zbuff;
+    /* size of compressed buffer */
+    uint32_t zbuff_len;
+};
+
 typedef struct {
     /* this fields are not changed once the thread is created */
     /* channel number */
@@ -841,8 +851,260 @@ static MultiFDMethods multifd_nocomp_ops =3D {
     .recv_pages =3D nocomp_recv_pages
 };
=20
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
+    uint32_t page_count =3D MULTIFD_PACKET_SIZE / qemu_target_page_size(=
);
+    struct zlib_data *z =3D g_malloc0(sizeof(struct zlib_data));
+    z_stream *zs =3D &z->zs;
+
+    p->data =3D z;
+    zs->zalloc =3D Z_NULL;
+    zs->zfree =3D Z_NULL;
+    zs->opaque =3D Z_NULL;
+    if (deflateInit(zs, migrate_compress_level()) !=3D Z_OK) {
+        error_setg(errp, "multifd %d: deflate init failed", p->id);
+        return -1;
+    }
+    /* We will never have more than page_count pages */
+    z->zbuff_len =3D page_count * qemu_target_page_size();
+    z->zbuff_len *=3D 2;
+    z->zbuff =3D g_try_malloc(z->zbuff_len);
+    if (!z->zbuff) {
+        error_setg(errp, "multifd %d: out of memory for zbuff", p->id);
+        return -1;
+    }
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
+static void zlib_send_cleanup(MultiFDSendParams *p)
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
+static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error =
**errp)
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
+        if (i =3D=3D used  - 1) {
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
+            error_setg(errp, "multifd %d: deflate returned %d instead of=
 Z_OK",
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
+static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **=
errp)
+{
+    struct zlib_data *z =3D p->data;
+
+    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_=
size,
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
+    uint32_t page_count =3D MULTIFD_PACKET_SIZE / qemu_target_page_size(=
);
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
+static int zlib_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **=
errp)
+{
+    uint32_t in_size =3D p->next_packet_size;
+    uint32_t out_size =3D 0;
+    uint32_t expected_size =3D used * qemu_target_page_size();
+    struct zlib_data *z =3D p->data;
+    z_stream *zs =3D &z->zs;
+    int ret;
+    int i;
+
+    if (p->flags !=3D MULTIFD_FLAG_ZLIB) {
+        error_setg(errp, "multifd %d: flags received %x flags expected %=
x",
+                   p->id, MULTIFD_FLAG_ZLIB, p->flags);
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
+            error_setg(errp, "multifd %d: inflate returned %d instead of=
 Z_OK",
+                       p->id, ret);
+            return ret;
+        }
+        out_size +=3D iov->iov_len;
+    }
+    if (out_size !=3D expected_size) {
+        error_setg(errp, "multifd %d: packet size received %d size expec=
ted %d",
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
 static MultiFDMethods *multifd_ops[MULTIFD_COMPRESS__MAX] =3D {
     [MULTIFD_COMPRESS_NONE] =3D &multifd_nocomp_ops,
+    [MULTIFD_COMPRESS_ZLIB] =3D &multifd_zlib_ops,
 };
=20
 static int multifd_send_initial_packet(MultiFDSendParams *p, Error **err=
p)
diff --git a/qapi/migration.json b/qapi/migration.json
index 153527e120..085eba8f07 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -493,7 +493,7 @@
 #
 ##
 { 'enum': 'MultifdCompress',
-  'data': [ 'none' ] }
+  'data': [ 'none', 'zlib' ] }
=20
 ##
 # @MigrationParameter:
diff --git a/tests/migration-test.c b/tests/migration-test.c
index e5b8125e1c..e6995ae4e7 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -1219,6 +1219,11 @@ static void test_multifd_tcp_none(void)
     test_multifd_tcp("none");
 }
=20
+static void test_multifd_tcp_zlib(void)
+{
+    test_multifd_tcp("zlib");
+}
+
 int main(int argc, char **argv)
 {
     char template[] =3D "/tmp/migration-test-XXXXXX";
@@ -1275,6 +1280,7 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/xbzrle/unix", test_xbzrle_unix);
     qtest_add_func("/migration/fd_proto", test_migrate_fd_proto);
     qtest_add_func("/migration/multifd/tcp/none", test_multifd_tcp_none)=
;
+    qtest_add_func("/migration/multifd/tcp/zlib", test_multifd_tcp_zlib)=
;
=20
     ret =3D g_test_run();
=20
--=20
2.21.0


