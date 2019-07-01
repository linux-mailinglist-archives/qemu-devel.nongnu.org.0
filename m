Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C652825D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 18:15:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTqNF-0007qt-VF
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 12:15:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTqAL-0004Vi-RO
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:02:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTqAK-00029Q-GH
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:02:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hTqAF-0001tV-A3; Thu, 23 May 2019 12:01:55 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8B6030ADC98;
	Thu, 23 May 2019 16:01:40 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-143.ams2.redhat.com
	[10.36.116.143])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8B401001E6F;
	Thu, 23 May 2019 16:01:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 23 May 2019 18:01:01 +0200
Message-Id: <20190523160104.21258-13-kwolf@redhat.com>
In-Reply-To: <20190523160104.21258-1-kwolf@redhat.com>
References: <20190523160104.21258-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 23 May 2019 16:01:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 12/15] virtio-scsi-test: Test attaching new
 overlay with iothreads
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This tests that blockdev-add can correctly add a qcow2 overlay to an
image used by a virtio-scsi disk in an iothread. The interesting point
here is whether the newly added node gets correctly moved into the
iothread AioContext.

If it isn't, we get an assertion failure in virtio-scsi while processing
the next request:

    virtio_scsi_ctx_check: Assertion `blk_get_aio_context(d->conf.blk) =3D=
=3D s->ctx' failed.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/libqtest.h         | 11 +++++++
 tests/libqtest.c         | 19 ++++++++++++
 tests/virtio-scsi-test.c | 62 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)

diff --git a/tests/libqtest.h b/tests/libqtest.h
index a98ea15b7d..32d927755d 100644
--- a/tests/libqtest.h
+++ b/tests/libqtest.h
@@ -619,6 +619,17 @@ static inline void qtest_end(void)
 QDict *qmp(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
=20
 /**
+ * qmp_assert_success:
+ * @fmt...: QMP message to send to qemu, formatted like
+ * qobject_from_jsonf_nofail().  See parse_escape() for what's
+ * supported after '%'.
+ *
+ * Sends a QMP message to QEMU and asserts that a 'return' key is presen=
t in
+ * the response.
+ */
+void qmp_assert_success(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
+
+/*
  * qmp_eventwait:
  * @s: #event event to wait for.
  *
diff --git a/tests/libqtest.c b/tests/libqtest.c
index 8ac0c02af4..546a875913 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -1038,6 +1038,25 @@ QDict *qmp(const char *fmt, ...)
     return response;
 }
=20
+void qmp_assert_success(const char *fmt, ...)
+{
+    va_list ap;
+    QDict *response;
+
+    va_start(ap, fmt);
+    response =3D qtest_vqmp(global_qtest, fmt, ap);
+    va_end(ap);
+
+    g_assert(response);
+    if (!qdict_haskey(response, "return")) {
+        QString *s =3D qobject_to_json_pretty(QOBJECT(response));
+        g_test_message("%s", qstring_get_str(s));
+        qobject_unref(s);
+    }
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
 char *hmp(const char *fmt, ...)
 {
     va_list ap;
diff --git a/tests/virtio-scsi-test.c b/tests/virtio-scsi-test.c
index 162b31c88d..923febc76e 100644
--- a/tests/virtio-scsi-test.c
+++ b/tests/virtio-scsi-test.c
@@ -188,6 +188,52 @@ static void test_unaligned_write_same(void *obj, voi=
d *data,
     qvirtio_scsi_pci_free(vs);
 }
=20
+static void test_iothread_attach_node(void *obj, void *data,
+                                      QGuestAllocator *t_alloc)
+{
+    QVirtioSCSI *scsi =3D obj;
+    QVirtioSCSIQueues *vs;
+    char tmp_path[] =3D "/tmp/qtest.XXXXXX";
+    int fd;
+    int ret;
+
+    uint8_t buf[512] =3D { 0 };
+    const uint8_t write_cdb[VIRTIO_SCSI_CDB_SIZE] =3D {
+        /* WRITE(10) to LBA 0, transfer length 1 */
+        0x2a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
+    };
+
+    alloc =3D t_alloc;
+    vs =3D qvirtio_scsi_init(scsi->vdev);
+
+    /* Create a temporary qcow2 overlay*/
+    fd =3D mkstemp(tmp_path);
+    g_assert(fd >=3D 0);
+    close(fd);
+
+    if (!have_qemu_img()) {
+        g_test_message("QTEST_QEMU_IMG not set or qemu-img missing; "
+                       "skipping snapshot test");
+        goto fail;
+    }
+
+    mkqcow2(tmp_path, 64);
+
+    /* Attach the overlay to the null0 node */
+    qmp_assert_success("{'execute': 'blockdev-add', 'arguments': {"
+                       "   'driver': 'qcow2', 'node-name': 'overlay',"
+                       "   'backing': 'null0', 'file': {"
+                       "     'driver': 'file', 'filename': %s}}}", tmp_p=
ath);
+
+    /* Send a request to see if the AioContext is still right */
+    ret =3D virtio_scsi_do_command(vs, write_cdb, NULL, 0, buf, 512, NUL=
L);
+    g_assert_cmphex(ret, =3D=3D, 0);
+
+fail:
+    qvirtio_scsi_pci_free(vs);
+    unlink(tmp_path);
+}
+
 static void *virtio_scsi_hotplug_setup(GString *cmd_line, void *arg)
 {
     g_string_append(cmd_line,
@@ -204,6 +250,15 @@ static void *virtio_scsi_setup(GString *cmd_line, vo=
id *arg)
     return arg;
 }
=20
+static void *virtio_scsi_setup_iothread(GString *cmd_line, void *arg)
+{
+    g_string_append(cmd_line,
+                    " -object iothread,id=3Dthread0"
+                    " -blockdev driver=3Dnull-co,node-name=3Dnull0"
+                    " -device scsi-hd,drive=3Dnull0");
+    return arg;
+}
+
 static void register_virtio_scsi_test(void)
 {
     QOSGraphTestOptions opts =3D { };
@@ -214,6 +269,13 @@ static void register_virtio_scsi_test(void)
     opts.before =3D virtio_scsi_setup;
     qos_add_test("unaligned-write-same", "virtio-scsi",
                  test_unaligned_write_same, &opts);
+
+    opts.before =3D virtio_scsi_setup_iothread;
+    opts.edge =3D (QOSGraphEdgeOptions) {
+        .extra_device_opts =3D "iothread=3Dthread0",
+    };
+    qos_add_test("iothread-attach-node", "virtio-scsi",
+                 test_iothread_attach_node, &opts);
 }
=20
 libqos_init(register_virtio_scsi_test);
--=20
2.20.1


