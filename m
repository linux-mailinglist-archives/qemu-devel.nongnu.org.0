Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7605EF61B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:10:57 +0200 (CEST)
Received: from localhost ([::1]:54792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtJY-0007bk-4w
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0c8d4cdc62ca2ced04244d46aae35972a69cf523@lizzy.crudebyte.com>)
 id 1odrzj-0006Yv-Sb
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:46:29 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:54071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0c8d4cdc62ca2ced04244d46aae35972a69cf523@lizzy.crudebyte.com>)
 id 1odrzc-0001oW-DZ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=pxLOkV/AwYMM84WLxgBwC1s0xHVALFBrtCY9LLr1o54=; b=D7N+N
 3xfGlIwnzK7DoDaeJM9LtYZQxdjRzBBxvu3bn8FLTRPlQYKKrX7OL8LF+6NGcj91MnN1QFGsTLflx
 vqtrjxDCaZh2NQZwWGeQC5STSuIYXWdj+H5dMD6Q9qlpr27bCVxA4W9Fe9IJA5kmqbP8F2xsrBJYI
 y/nvYd1Iw8Jlrnr4dUl5Pkv/5hY0/6tzt95kaZqBCpVri4tVlCUNbpdmPjYRHRB0dxMFAmholBAWa
 873l7WK5ADmOutjxaIiZ3+KPr89clGRUFmx6r354bS9fv2UiOzHh6U1UFRBdq3gVz34Ca+cvcSZYQ
 xwPh3JT3y0bP8aBoxplEP+RwGozWA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 29 Sep 2022 13:41:06 +0200
Subject: [PATCH v2] tests/9p: split virtio-9p-test.c into tests and 9p client
 part
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Message-Id: <E1odrya-0004Fv-97@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=0c8d4cdc62ca2ced04244d46aae35972a69cf523@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This patch is pure refactoring, it does not change behaviour.

virtio-9p-test.c grew to 1657 lines. Let's split this file up between
actual 9p test cases vs. 9p test client, to make it easier to
concentrate on the actual 9p tests.

Move the 9p test client code to a new unit virtio-9p-client.c, which
are basically all functions and types prefixed with v9fs_* already.

Note that some client wrapper functions (do_*) are preserved in
virtio-9p-test.c, simply because these wrapper functions are going to
be wiped with subsequent patches anyway.

As the global QGuestAllocator variable is moved to virtio-9p-client.c,
add a new function v9fs_set_allocator() to be used by virtio-9p-test.c
instead of fiddling with a global variable across units and libraries.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---

v1 -> v2:
  - Move osdep.h include from virtio-9p-client.h to virtio-9p-client.c.

 tests/qtest/libqos/meson.build        |   1 +
 tests/qtest/libqos/virtio-9p-client.c | 684 +++++++++++++++++++++++
 tests/qtest/libqos/virtio-9p-client.h | 138 +++++
 tests/qtest/virtio-9p-test.c          | 770 +-------------------------
 4 files changed, 849 insertions(+), 744 deletions(-)
 create mode 100644 tests/qtest/libqos/virtio-9p-client.c
 create mode 100644 tests/qtest/libqos/virtio-9p-client.h

diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index cff83c86d9..ca99c9ab7d 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -34,6 +34,7 @@ libqos_srcs = files(
         'tpci200.c',
         'virtio.c',
         'virtio-9p.c',
+        'virtio-9p-client.c',
         'virtio-balloon.c',
         'virtio-blk.c',
         'vhost-user-blk.c',
diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
new file mode 100644
index 0000000000..f5c35fd722
--- /dev/null
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -0,0 +1,684 @@
+/*
+ * 9P network client for VirtIO 9P test cases (based on QTest)
+ *
+ * Copyright (c) 2014 SUSE LINUX Products GmbH
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
+#include "qemu/osdep.h"
+#include "virtio-9p-client.h"
+
+#define QVIRTIO_9P_TIMEOUT_US (10 * 1000 * 1000)
+static QGuestAllocator *alloc;
+
+void v9fs_set_allocator(QGuestAllocator *t_alloc)
+{
+    alloc = t_alloc;
+}
+
+void v9fs_memwrite(P9Req *req, const void *addr, size_t len)
+{
+    qtest_memwrite(req->qts, req->t_msg + req->t_off, addr, len);
+    req->t_off += len;
+}
+
+void v9fs_memskip(P9Req *req, size_t len)
+{
+    req->r_off += len;
+}
+
+void v9fs_memread(P9Req *req, void *addr, size_t len)
+{
+    qtest_memread(req->qts, req->r_msg + req->r_off, addr, len);
+    req->r_off += len;
+}
+
+void v9fs_uint8_read(P9Req *req, uint8_t *val)
+{
+    v9fs_memread(req, val, 1);
+}
+
+void v9fs_uint16_write(P9Req *req, uint16_t val)
+{
+    uint16_t le_val = cpu_to_le16(val);
+
+    v9fs_memwrite(req, &le_val, 2);
+}
+
+void v9fs_uint16_read(P9Req *req, uint16_t *val)
+{
+    v9fs_memread(req, val, 2);
+    le16_to_cpus(val);
+}
+
+void v9fs_uint32_write(P9Req *req, uint32_t val)
+{
+    uint32_t le_val = cpu_to_le32(val);
+
+    v9fs_memwrite(req, &le_val, 4);
+}
+
+void v9fs_uint64_write(P9Req *req, uint64_t val)
+{
+    uint64_t le_val = cpu_to_le64(val);
+
+    v9fs_memwrite(req, &le_val, 8);
+}
+
+void v9fs_uint32_read(P9Req *req, uint32_t *val)
+{
+    v9fs_memread(req, val, 4);
+    le32_to_cpus(val);
+}
+
+void v9fs_uint64_read(P9Req *req, uint64_t *val)
+{
+    v9fs_memread(req, val, 8);
+    le64_to_cpus(val);
+}
+
+/* len[2] string[len] */
+uint16_t v9fs_string_size(const char *string)
+{
+    size_t len = strlen(string);
+
+    g_assert_cmpint(len, <=, UINT16_MAX - 2);
+
+    return 2 + len;
+}
+
+void v9fs_string_write(P9Req *req, const char *string)
+{
+    int len = strlen(string);
+
+    g_assert_cmpint(len, <=, UINT16_MAX);
+
+    v9fs_uint16_write(req, (uint16_t) len);
+    v9fs_memwrite(req, string, len);
+}
+
+void v9fs_string_read(P9Req *req, uint16_t *len, char **string)
+{
+    uint16_t local_len;
+
+    v9fs_uint16_read(req, &local_len);
+    if (len) {
+        *len = local_len;
+    }
+    if (string) {
+        *string = g_malloc(local_len + 1);
+        v9fs_memread(req, *string, local_len);
+        (*string)[local_len] = 0;
+    } else {
+        v9fs_memskip(req, local_len);
+    }
+}
+
+typedef struct {
+    uint32_t size;
+    uint8_t id;
+    uint16_t tag;
+} QEMU_PACKED P9Hdr;
+
+P9Req *v9fs_req_init(QVirtio9P *v9p, uint32_t size, uint8_t id,
+                     uint16_t tag)
+{
+    P9Req *req = g_new0(P9Req, 1);
+    uint32_t total_size = 7; /* 9P header has well-known size of 7 bytes */
+    P9Hdr hdr = {
+        .id = id,
+        .tag = cpu_to_le16(tag)
+    };
+
+    g_assert_cmpint(total_size, <=, UINT32_MAX - size);
+    total_size += size;
+    hdr.size = cpu_to_le32(total_size);
+
+    g_assert_cmpint(total_size, <=, P9_MAX_SIZE);
+
+    req->qts = global_qtest;
+    req->v9p = v9p;
+    req->t_size = total_size;
+    req->t_msg = guest_alloc(alloc, req->t_size);
+    v9fs_memwrite(req, &hdr, 7);
+    req->tag = tag;
+    return req;
+}
+
+void v9fs_req_send(P9Req *req)
+{
+    QVirtio9P *v9p = req->v9p;
+
+    req->r_msg = guest_alloc(alloc, P9_MAX_SIZE);
+    req->free_head = qvirtqueue_add(req->qts, v9p->vq, req->t_msg, req->t_size,
+                                    false, true);
+    qvirtqueue_add(req->qts, v9p->vq, req->r_msg, P9_MAX_SIZE, true, false);
+    qvirtqueue_kick(req->qts, v9p->vdev, v9p->vq, req->free_head);
+    req->t_off = 0;
+}
+
+static const char *rmessage_name(uint8_t id)
+{
+    return
+        id == P9_RLERROR ? "RLERROR" :
+        id == P9_RVERSION ? "RVERSION" :
+        id == P9_RATTACH ? "RATTACH" :
+        id == P9_RWALK ? "RWALK" :
+        id == P9_RLOPEN ? "RLOPEN" :
+        id == P9_RWRITE ? "RWRITE" :
+        id == P9_RMKDIR ? "RMKDIR" :
+        id == P9_RLCREATE ? "RLCREATE" :
+        id == P9_RSYMLINK ? "RSYMLINK" :
+        id == P9_RLINK ? "RLINK" :
+        id == P9_RUNLINKAT ? "RUNLINKAT" :
+        id == P9_RFLUSH ? "RFLUSH" :
+        id == P9_RREADDIR ? "READDIR" :
+        "<unknown>";
+}
+
+void v9fs_req_wait_for_reply(P9Req *req, uint32_t *len)
+{
+    QVirtio9P *v9p = req->v9p;
+
+    qvirtio_wait_used_elem(req->qts, v9p->vdev, v9p->vq, req->free_head, len,
+                           QVIRTIO_9P_TIMEOUT_US);
+}
+
+void v9fs_req_recv(P9Req *req, uint8_t id)
+{
+    P9Hdr hdr;
+
+    v9fs_memread(req, &hdr, 7);
+    hdr.size = ldl_le_p(&hdr.size);
+    hdr.tag = lduw_le_p(&hdr.tag);
+
+    g_assert_cmpint(hdr.size, >=, 7);
+    g_assert_cmpint(hdr.size, <=, P9_MAX_SIZE);
+    g_assert_cmpint(hdr.tag, ==, req->tag);
+
+    if (hdr.id != id) {
+        g_printerr("Received response %d (%s) instead of %d (%s)\n",
+                   hdr.id, rmessage_name(hdr.id), id, rmessage_name(id));
+
+        if (hdr.id == P9_RLERROR) {
+            uint32_t err;
+            v9fs_uint32_read(req, &err);
+            g_printerr("Rlerror has errno %d (%s)\n", err, strerror(err));
+        }
+    }
+    g_assert_cmpint(hdr.id, ==, id);
+}
+
+void v9fs_req_free(P9Req *req)
+{
+    guest_free(alloc, req->t_msg);
+    guest_free(alloc, req->r_msg);
+    g_free(req);
+}
+
+/* size[4] Rlerror tag[2] ecode[4] */
+void v9fs_rlerror(P9Req *req, uint32_t *err)
+{
+    v9fs_req_recv(req, P9_RLERROR);
+    v9fs_uint32_read(req, err);
+    v9fs_req_free(req);
+}
+
+/* size[4] Tversion tag[2] msize[4] version[s] */
+P9Req *v9fs_tversion(QVirtio9P *v9p, uint32_t msize, const char *version,
+                     uint16_t tag)
+{
+    P9Req *req;
+    uint32_t body_size = 4;
+    uint16_t string_size = v9fs_string_size(version);
+
+    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
+    body_size += string_size;
+    req = v9fs_req_init(v9p, body_size, P9_TVERSION, tag);
+
+    v9fs_uint32_write(req, msize);
+    v9fs_string_write(req, version);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Rversion tag[2] msize[4] version[s] */
+void v9fs_rversion(P9Req *req, uint16_t *len, char **version)
+{
+    uint32_t msize;
+
+    v9fs_req_recv(req, P9_RVERSION);
+    v9fs_uint32_read(req, &msize);
+
+    g_assert_cmpint(msize, ==, P9_MAX_SIZE);
+
+    if (len || version) {
+        v9fs_string_read(req, len, version);
+    }
+
+    v9fs_req_free(req);
+}
+
+/* size[4] Tattach tag[2] fid[4] afid[4] uname[s] aname[s] n_uname[4] */
+P9Req *v9fs_tattach(QVirtio9P *v9p, uint32_t fid, uint32_t n_uname,
+                    uint16_t tag)
+{
+    const char *uname = ""; /* ignored by QEMU */
+    const char *aname = ""; /* ignored by QEMU */
+    P9Req *req = v9fs_req_init(v9p, 4 + 4 + 2 + 2 + 4, P9_TATTACH, tag);
+
+    v9fs_uint32_write(req, fid);
+    v9fs_uint32_write(req, P9_NOFID);
+    v9fs_string_write(req, uname);
+    v9fs_string_write(req, aname);
+    v9fs_uint32_write(req, n_uname);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Rattach tag[2] qid[13] */
+void v9fs_rattach(P9Req *req, v9fs_qid *qid)
+{
+    v9fs_req_recv(req, P9_RATTACH);
+    if (qid) {
+        v9fs_memread(req, qid, 13);
+    }
+    v9fs_req_free(req);
+}
+
+/* size[4] Twalk tag[2] fid[4] newfid[4] nwname[2] nwname*(wname[s]) */
+P9Req *v9fs_twalk(QVirtio9P *v9p, uint32_t fid, uint32_t newfid,
+                  uint16_t nwname, char *const wnames[], uint16_t tag)
+{
+    P9Req *req;
+    int i;
+    uint32_t body_size = 4 + 4 + 2;
+
+    for (i = 0; i < nwname; i++) {
+        uint16_t wname_size = v9fs_string_size(wnames[i]);
+
+        g_assert_cmpint(body_size, <=, UINT32_MAX - wname_size);
+        body_size += wname_size;
+    }
+    req = v9fs_req_init(v9p,  body_size, P9_TWALK, tag);
+    v9fs_uint32_write(req, fid);
+    v9fs_uint32_write(req, newfid);
+    v9fs_uint16_write(req, nwname);
+    for (i = 0; i < nwname; i++) {
+        v9fs_string_write(req, wnames[i]);
+    }
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Rwalk tag[2] nwqid[2] nwqid*(wqid[13]) */
+void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid)
+{
+    uint16_t local_nwqid;
+
+    v9fs_req_recv(req, P9_RWALK);
+    v9fs_uint16_read(req, &local_nwqid);
+    if (nwqid) {
+        *nwqid = local_nwqid;
+    }
+    if (wqid) {
+        *wqid = g_malloc(local_nwqid * 13);
+        v9fs_memread(req, *wqid, local_nwqid * 13);
+    }
+    v9fs_req_free(req);
+}
+
+/* size[4] Tgetattr tag[2] fid[4] request_mask[8] */
+P9Req *v9fs_tgetattr(QVirtio9P *v9p, uint32_t fid, uint64_t request_mask,
+                     uint16_t tag)
+{
+    P9Req *req;
+
+    req = v9fs_req_init(v9p, 4 + 8, P9_TGETATTR, tag);
+    v9fs_uint32_write(req, fid);
+    v9fs_uint64_write(req, request_mask);
+    v9fs_req_send(req);
+    return req;
+}
+
+/*
+ * size[4] Rgetattr tag[2] valid[8] qid[13] mode[4] uid[4] gid[4] nlink[8]
+ *                  rdev[8] size[8] blksize[8] blocks[8]
+ *                  atime_sec[8] atime_nsec[8] mtime_sec[8] mtime_nsec[8]
+ *                  ctime_sec[8] ctime_nsec[8] btime_sec[8] btime_nsec[8]
+ *                  gen[8] data_version[8]
+ */
+void v9fs_rgetattr(P9Req *req, v9fs_attr *attr)
+{
+    v9fs_req_recv(req, P9_RGETATTR);
+
+    v9fs_uint64_read(req, &attr->valid);
+    v9fs_memread(req, &attr->qid, 13);
+    v9fs_uint32_read(req, &attr->mode);
+    v9fs_uint32_read(req, &attr->uid);
+    v9fs_uint32_read(req, &attr->gid);
+    v9fs_uint64_read(req, &attr->nlink);
+    v9fs_uint64_read(req, &attr->rdev);
+    v9fs_uint64_read(req, &attr->size);
+    v9fs_uint64_read(req, &attr->blksize);
+    v9fs_uint64_read(req, &attr->blocks);
+    v9fs_uint64_read(req, &attr->atime_sec);
+    v9fs_uint64_read(req, &attr->atime_nsec);
+    v9fs_uint64_read(req, &attr->mtime_sec);
+    v9fs_uint64_read(req, &attr->mtime_nsec);
+    v9fs_uint64_read(req, &attr->ctime_sec);
+    v9fs_uint64_read(req, &attr->ctime_nsec);
+    v9fs_uint64_read(req, &attr->btime_sec);
+    v9fs_uint64_read(req, &attr->btime_nsec);
+    v9fs_uint64_read(req, &attr->gen);
+    v9fs_uint64_read(req, &attr->data_version);
+
+    v9fs_req_free(req);
+}
+
+/* size[4] Treaddir tag[2] fid[4] offset[8] count[4] */
+P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
+                     uint32_t count, uint16_t tag)
+{
+    P9Req *req;
+
+    req = v9fs_req_init(v9p, 4 + 8 + 4, P9_TREADDIR, tag);
+    v9fs_uint32_write(req, fid);
+    v9fs_uint64_write(req, offset);
+    v9fs_uint32_write(req, count);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Rreaddir tag[2] count[4] data[count] */
+void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
+                   struct V9fsDirent **entries)
+{
+    uint32_t local_count;
+    struct V9fsDirent *e = NULL;
+    uint16_t slen;
+    uint32_t n = 0;
+
+    v9fs_req_recv(req, P9_RREADDIR);
+    v9fs_uint32_read(req, &local_count);
+
+    if (count) {
+        *count = local_count;
+    }
+
+    for (int32_t togo = (int32_t)local_count;
+         togo >= 13 + 8 + 1 + 2;
+         togo -= 13 + 8 + 1 + 2 + slen, ++n)
+    {
+        if (!e) {
+            e = g_new(struct V9fsDirent, 1);
+            if (entries) {
+                *entries = e;
+            }
+        } else {
+            e = e->next = g_new(struct V9fsDirent, 1);
+        }
+        e->next = NULL;
+        /* qid[13] offset[8] type[1] name[s] */
+        v9fs_memread(req, &e->qid, 13);
+        v9fs_uint64_read(req, &e->offset);
+        v9fs_uint8_read(req, &e->type);
+        v9fs_string_read(req, &slen, &e->name);
+    }
+
+    if (nentries) {
+        *nentries = n;
+    }
+
+    v9fs_req_free(req);
+}
+
+void v9fs_free_dirents(struct V9fsDirent *e)
+{
+    struct V9fsDirent *next = NULL;
+
+    for (; e; e = next) {
+        next = e->next;
+        g_free(e->name);
+        g_free(e);
+    }
+}
+
+/* size[4] Tlopen tag[2] fid[4] flags[4] */
+P9Req *v9fs_tlopen(QVirtio9P *v9p, uint32_t fid, uint32_t flags,
+                   uint16_t tag)
+{
+    P9Req *req;
+
+    req = v9fs_req_init(v9p,  4 + 4, P9_TLOPEN, tag);
+    v9fs_uint32_write(req, fid);
+    v9fs_uint32_write(req, flags);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Rlopen tag[2] qid[13] iounit[4] */
+void v9fs_rlopen(P9Req *req, v9fs_qid *qid, uint32_t *iounit)
+{
+    v9fs_req_recv(req, P9_RLOPEN);
+    if (qid) {
+        v9fs_memread(req, qid, 13);
+    } else {
+        v9fs_memskip(req, 13);
+    }
+    if (iounit) {
+        v9fs_uint32_read(req, iounit);
+    }
+    v9fs_req_free(req);
+}
+
+/* size[4] Twrite tag[2] fid[4] offset[8] count[4] data[count] */
+P9Req *v9fs_twrite(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
+                   uint32_t count, const void *data, uint16_t tag)
+{
+    P9Req *req;
+    uint32_t body_size = 4 + 8 + 4;
+
+    g_assert_cmpint(body_size, <=, UINT32_MAX - count);
+    body_size += count;
+    req = v9fs_req_init(v9p,  body_size, P9_TWRITE, tag);
+    v9fs_uint32_write(req, fid);
+    v9fs_uint64_write(req, offset);
+    v9fs_uint32_write(req, count);
+    v9fs_memwrite(req, data, count);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Rwrite tag[2] count[4] */
+void v9fs_rwrite(P9Req *req, uint32_t *count)
+{
+    v9fs_req_recv(req, P9_RWRITE);
+    if (count) {
+        v9fs_uint32_read(req, count);
+    }
+    v9fs_req_free(req);
+}
+
+/* size[4] Tflush tag[2] oldtag[2] */
+P9Req *v9fs_tflush(QVirtio9P *v9p, uint16_t oldtag, uint16_t tag)
+{
+    P9Req *req;
+
+    req = v9fs_req_init(v9p,  2, P9_TFLUSH, tag);
+    v9fs_uint32_write(req, oldtag);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Rflush tag[2] */
+void v9fs_rflush(P9Req *req)
+{
+    v9fs_req_recv(req, P9_RFLUSH);
+    v9fs_req_free(req);
+}
+
+/* size[4] Tmkdir tag[2] dfid[4] name[s] mode[4] gid[4] */
+P9Req *v9fs_tmkdir(QVirtio9P *v9p, uint32_t dfid, const char *name,
+                   uint32_t mode, uint32_t gid, uint16_t tag)
+{
+    P9Req *req;
+
+    uint32_t body_size = 4 + 4 + 4;
+    uint16_t string_size = v9fs_string_size(name);
+
+    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
+    body_size += string_size;
+
+    req = v9fs_req_init(v9p, body_size, P9_TMKDIR, tag);
+    v9fs_uint32_write(req, dfid);
+    v9fs_string_write(req, name);
+    v9fs_uint32_write(req, mode);
+    v9fs_uint32_write(req, gid);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Rmkdir tag[2] qid[13] */
+void v9fs_rmkdir(P9Req *req, v9fs_qid *qid)
+{
+    v9fs_req_recv(req, P9_RMKDIR);
+    if (qid) {
+        v9fs_memread(req, qid, 13);
+    } else {
+        v9fs_memskip(req, 13);
+    }
+    v9fs_req_free(req);
+}
+
+/* size[4] Tlcreate tag[2] fid[4] name[s] flags[4] mode[4] gid[4] */
+P9Req *v9fs_tlcreate(QVirtio9P *v9p, uint32_t fid, const char *name,
+                     uint32_t flags, uint32_t mode, uint32_t gid,
+                     uint16_t tag)
+{
+    P9Req *req;
+
+    uint32_t body_size = 4 + 4 + 4 + 4;
+    uint16_t string_size = v9fs_string_size(name);
+
+    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
+    body_size += string_size;
+
+    req = v9fs_req_init(v9p, body_size, P9_TLCREATE, tag);
+    v9fs_uint32_write(req, fid);
+    v9fs_string_write(req, name);
+    v9fs_uint32_write(req, flags);
+    v9fs_uint32_write(req, mode);
+    v9fs_uint32_write(req, gid);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Rlcreate tag[2] qid[13] iounit[4] */
+void v9fs_rlcreate(P9Req *req, v9fs_qid *qid, uint32_t *iounit)
+{
+    v9fs_req_recv(req, P9_RLCREATE);
+    if (qid) {
+        v9fs_memread(req, qid, 13);
+    } else {
+        v9fs_memskip(req, 13);
+    }
+    if (iounit) {
+        v9fs_uint32_read(req, iounit);
+    }
+    v9fs_req_free(req);
+}
+
+/* size[4] Tsymlink tag[2] fid[4] name[s] symtgt[s] gid[4] */
+P9Req *v9fs_tsymlink(QVirtio9P *v9p, uint32_t fid, const char *name,
+                     const char *symtgt, uint32_t gid, uint16_t tag)
+{
+    P9Req *req;
+
+    uint32_t body_size = 4 + 4;
+    uint16_t string_size = v9fs_string_size(name) + v9fs_string_size(symtgt);
+
+    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
+    body_size += string_size;
+
+    req = v9fs_req_init(v9p, body_size, P9_TSYMLINK, tag);
+    v9fs_uint32_write(req, fid);
+    v9fs_string_write(req, name);
+    v9fs_string_write(req, symtgt);
+    v9fs_uint32_write(req, gid);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Rsymlink tag[2] qid[13] */
+void v9fs_rsymlink(P9Req *req, v9fs_qid *qid)
+{
+    v9fs_req_recv(req, P9_RSYMLINK);
+    if (qid) {
+        v9fs_memread(req, qid, 13);
+    } else {
+        v9fs_memskip(req, 13);
+    }
+    v9fs_req_free(req);
+}
+
+/* size[4] Tlink tag[2] dfid[4] fid[4] name[s] */
+P9Req *v9fs_tlink(QVirtio9P *v9p, uint32_t dfid, uint32_t fid,
+                  const char *name, uint16_t tag)
+{
+    P9Req *req;
+
+    uint32_t body_size = 4 + 4;
+    uint16_t string_size = v9fs_string_size(name);
+
+    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
+    body_size += string_size;
+
+    req = v9fs_req_init(v9p, body_size, P9_TLINK, tag);
+    v9fs_uint32_write(req, dfid);
+    v9fs_uint32_write(req, fid);
+    v9fs_string_write(req, name);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Rlink tag[2] */
+void v9fs_rlink(P9Req *req)
+{
+    v9fs_req_recv(req, P9_RLINK);
+    v9fs_req_free(req);
+}
+
+/* size[4] Tunlinkat tag[2] dirfd[4] name[s] flags[4] */
+P9Req *v9fs_tunlinkat(QVirtio9P *v9p, uint32_t dirfd, const char *name,
+                      uint32_t flags, uint16_t tag)
+{
+    P9Req *req;
+
+    uint32_t body_size = 4 + 4;
+    uint16_t string_size = v9fs_string_size(name);
+
+    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
+    body_size += string_size;
+
+    req = v9fs_req_init(v9p, body_size, P9_TUNLINKAT, tag);
+    v9fs_uint32_write(req, dirfd);
+    v9fs_string_write(req, name);
+    v9fs_uint32_write(req, flags);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Runlinkat tag[2] */
+void v9fs_runlinkat(P9Req *req)
+{
+    v9fs_req_recv(req, P9_RUNLINKAT);
+    v9fs_req_free(req);
+}
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
new file mode 100644
index 0000000000..c502d12a66
--- /dev/null
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -0,0 +1,138 @@
+/*
+ * 9P network client for VirtIO 9P test cases (based on QTest)
+ *
+ * Copyright (c) 2014 SUSE LINUX Products GmbH
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
+#ifndef TESTS_LIBQOS_VIRTIO_9P_CLIENT_H
+#define TESTS_LIBQOS_VIRTIO_9P_CLIENT_H
+
+#include "hw/9pfs/9p.h"
+#include "hw/9pfs/9p-synth.h"
+#include "virtio-9p.h"
+#include "qgraph.h"
+#include "tests/qtest/libqtest-single.h"
+
+#define P9_MAX_SIZE 4096 /* Max size of a T-message or R-message */
+
+typedef struct {
+    QTestState *qts;
+    QVirtio9P *v9p;
+    uint16_t tag;
+    uint64_t t_msg;
+    uint32_t t_size;
+    uint64_t r_msg;
+    /* No r_size, it is hardcoded to P9_MAX_SIZE */
+    size_t t_off;
+    size_t r_off;
+    uint32_t free_head;
+} P9Req;
+
+/* type[1] version[4] path[8] */
+typedef char v9fs_qid[13];
+
+typedef struct v9fs_attr {
+    uint64_t valid;
+    v9fs_qid qid;
+    uint32_t mode;
+    uint32_t uid;
+    uint32_t gid;
+    uint64_t nlink;
+    uint64_t rdev;
+    uint64_t size;
+    uint64_t blksize;
+    uint64_t blocks;
+    uint64_t atime_sec;
+    uint64_t atime_nsec;
+    uint64_t mtime_sec;
+    uint64_t mtime_nsec;
+    uint64_t ctime_sec;
+    uint64_t ctime_nsec;
+    uint64_t btime_sec;
+    uint64_t btime_nsec;
+    uint64_t gen;
+    uint64_t data_version;
+} v9fs_attr;
+
+#define P9_GETATTR_BASIC    0x000007ffULL /* Mask for fields up to BLOCKS */
+
+struct V9fsDirent {
+    v9fs_qid qid;
+    uint64_t offset;
+    uint8_t type;
+    char *name;
+    struct V9fsDirent *next;
+};
+
+void v9fs_set_allocator(QGuestAllocator *t_alloc);
+void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
+void v9fs_memskip(P9Req *req, size_t len);
+void v9fs_memread(P9Req *req, void *addr, size_t len);
+void v9fs_uint8_read(P9Req *req, uint8_t *val);
+void v9fs_uint16_write(P9Req *req, uint16_t val);
+void v9fs_uint16_read(P9Req *req, uint16_t *val);
+void v9fs_uint32_write(P9Req *req, uint32_t val);
+void v9fs_uint64_write(P9Req *req, uint64_t val);
+void v9fs_uint32_read(P9Req *req, uint32_t *val);
+void v9fs_uint64_read(P9Req *req, uint64_t *val);
+uint16_t v9fs_string_size(const char *string);
+void v9fs_string_write(P9Req *req, const char *string);
+void v9fs_string_read(P9Req *req, uint16_t *len, char **string);
+P9Req *v9fs_req_init(QVirtio9P *v9p, uint32_t size, uint8_t id,
+                     uint16_t tag);
+void v9fs_req_send(P9Req *req);
+void v9fs_req_wait_for_reply(P9Req *req, uint32_t *len);
+void v9fs_req_recv(P9Req *req, uint8_t id);
+void v9fs_req_free(P9Req *req);
+void v9fs_rlerror(P9Req *req, uint32_t *err);
+P9Req *v9fs_tversion(QVirtio9P *v9p, uint32_t msize, const char *version,
+                     uint16_t tag);
+void v9fs_rversion(P9Req *req, uint16_t *len, char **version);
+P9Req *v9fs_tattach(QVirtio9P *v9p, uint32_t fid, uint32_t n_uname,
+                    uint16_t tag);
+void v9fs_rattach(P9Req *req, v9fs_qid *qid);
+P9Req *v9fs_twalk(QVirtio9P *v9p, uint32_t fid, uint32_t newfid,
+                  uint16_t nwname, char *const wnames[], uint16_t tag);
+void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid);
+P9Req *v9fs_tgetattr(QVirtio9P *v9p, uint32_t fid, uint64_t request_mask,
+                     uint16_t tag);
+void v9fs_rgetattr(P9Req *req, v9fs_attr *attr);
+P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
+                     uint32_t count, uint16_t tag);
+void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
+                   struct V9fsDirent **entries);
+void v9fs_free_dirents(struct V9fsDirent *e);
+P9Req *v9fs_tlopen(QVirtio9P *v9p, uint32_t fid, uint32_t flags,
+                   uint16_t tag);
+void v9fs_rlopen(P9Req *req, v9fs_qid *qid, uint32_t *iounit);
+P9Req *v9fs_twrite(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
+                   uint32_t count, const void *data, uint16_t tag);
+void v9fs_rwrite(P9Req *req, uint32_t *count);
+P9Req *v9fs_tflush(QVirtio9P *v9p, uint16_t oldtag, uint16_t tag);
+void v9fs_rflush(P9Req *req);
+P9Req *v9fs_tmkdir(QVirtio9P *v9p, uint32_t dfid, const char *name,
+                   uint32_t mode, uint32_t gid, uint16_t tag);
+void v9fs_rmkdir(P9Req *req, v9fs_qid *qid);
+P9Req *v9fs_tlcreate(QVirtio9P *v9p, uint32_t fid, const char *name,
+                     uint32_t flags, uint32_t mode, uint32_t gid,
+                     uint16_t tag);
+void v9fs_rlcreate(P9Req *req, v9fs_qid *qid, uint32_t *iounit);
+P9Req *v9fs_tsymlink(QVirtio9P *v9p, uint32_t fid, const char *name,
+                     const char *symtgt, uint32_t gid, uint16_t tag);
+void v9fs_rsymlink(P9Req *req, v9fs_qid *qid);
+P9Req *v9fs_tlink(QVirtio9P *v9p, uint32_t dfid, uint32_t fid,
+                  const char *name, uint16_t tag);
+void v9fs_rlink(P9Req *req);
+P9Req *v9fs_tunlinkat(QVirtio9P *v9p, uint32_t dirfd, const char *name,
+                      uint32_t flags, uint16_t tag);
+void v9fs_runlinkat(P9Req *req);
+
+#endif
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 25305a4cf7..498c32e21b 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -13,15 +13,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest-single.h"
 #include "qemu/module.h"
-#include "hw/9pfs/9p.h"
-#include "hw/9pfs/9p-synth.h"
-#include "libqos/virtio-9p.h"
-#include "libqos/qgraph.h"
-
-#define QVIRTIO_9P_TIMEOUT_US (10 * 1000 * 1000)
-static QGuestAllocator *alloc;
+#include "libqos/virtio-9p-client.h"
 
 /*
  * Used to auto generate new fids. Start with arbitrary high value to avoid
@@ -82,7 +75,7 @@ static void split_free(char ***out)
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     size_t tag_len = qvirtio_config_readw(v9p->vdev, 0);
     g_autofree char *tag = NULL;
     int i;
@@ -96,565 +89,12 @@ static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
     g_assert_cmpmem(tag, tag_len, MOUNT_TAG, tag_len);
 }
 
-#define P9_MAX_SIZE 4096 /* Max size of a T-message or R-message */
-
-typedef struct {
-    QTestState *qts;
-    QVirtio9P *v9p;
-    uint16_t tag;
-    uint64_t t_msg;
-    uint32_t t_size;
-    uint64_t r_msg;
-    /* No r_size, it is hardcoded to P9_MAX_SIZE */
-    size_t t_off;
-    size_t r_off;
-    uint32_t free_head;
-} P9Req;
-
-static void v9fs_memwrite(P9Req *req, const void *addr, size_t len)
-{
-    qtest_memwrite(req->qts, req->t_msg + req->t_off, addr, len);
-    req->t_off += len;
-}
-
-static void v9fs_memskip(P9Req *req, size_t len)
-{
-    req->r_off += len;
-}
-
-static void v9fs_memread(P9Req *req, void *addr, size_t len)
-{
-    qtest_memread(req->qts, req->r_msg + req->r_off, addr, len);
-    req->r_off += len;
-}
-
-static void v9fs_uint8_read(P9Req *req, uint8_t *val)
-{
-    v9fs_memread(req, val, 1);
-}
-
-static void v9fs_uint16_write(P9Req *req, uint16_t val)
-{
-    uint16_t le_val = cpu_to_le16(val);
-
-    v9fs_memwrite(req, &le_val, 2);
-}
-
-static void v9fs_uint16_read(P9Req *req, uint16_t *val)
-{
-    v9fs_memread(req, val, 2);
-    le16_to_cpus(val);
-}
-
-static void v9fs_uint32_write(P9Req *req, uint32_t val)
-{
-    uint32_t le_val = cpu_to_le32(val);
-
-    v9fs_memwrite(req, &le_val, 4);
-}
-
-static void v9fs_uint64_write(P9Req *req, uint64_t val)
-{
-    uint64_t le_val = cpu_to_le64(val);
-
-    v9fs_memwrite(req, &le_val, 8);
-}
-
-static void v9fs_uint32_read(P9Req *req, uint32_t *val)
-{
-    v9fs_memread(req, val, 4);
-    le32_to_cpus(val);
-}
-
-static void v9fs_uint64_read(P9Req *req, uint64_t *val)
-{
-    v9fs_memread(req, val, 8);
-    le64_to_cpus(val);
-}
-
-/* len[2] string[len] */
-static uint16_t v9fs_string_size(const char *string)
-{
-    size_t len = strlen(string);
-
-    g_assert_cmpint(len, <=, UINT16_MAX - 2);
-
-    return 2 + len;
-}
-
-static void v9fs_string_write(P9Req *req, const char *string)
-{
-    int len = strlen(string);
-
-    g_assert_cmpint(len, <=, UINT16_MAX);
-
-    v9fs_uint16_write(req, (uint16_t) len);
-    v9fs_memwrite(req, string, len);
-}
-
-static void v9fs_string_read(P9Req *req, uint16_t *len, char **string)
-{
-    uint16_t local_len;
-
-    v9fs_uint16_read(req, &local_len);
-    if (len) {
-        *len = local_len;
-    }
-    if (string) {
-        *string = g_malloc(local_len + 1);
-        v9fs_memread(req, *string, local_len);
-        (*string)[local_len] = 0;
-    } else {
-        v9fs_memskip(req, local_len);
-    }
-}
-
- typedef struct {
-    uint32_t size;
-    uint8_t id;
-    uint16_t tag;
-} QEMU_PACKED P9Hdr;
-
-static P9Req *v9fs_req_init(QVirtio9P *v9p, uint32_t size, uint8_t id,
-                            uint16_t tag)
-{
-    P9Req *req = g_new0(P9Req, 1);
-    uint32_t total_size = 7; /* 9P header has well-known size of 7 bytes */
-    P9Hdr hdr = {
-        .id = id,
-        .tag = cpu_to_le16(tag)
-    };
-
-    g_assert_cmpint(total_size, <=, UINT32_MAX - size);
-    total_size += size;
-    hdr.size = cpu_to_le32(total_size);
-
-    g_assert_cmpint(total_size, <=, P9_MAX_SIZE);
-
-    req->qts = global_qtest;
-    req->v9p = v9p;
-    req->t_size = total_size;
-    req->t_msg = guest_alloc(alloc, req->t_size);
-    v9fs_memwrite(req, &hdr, 7);
-    req->tag = tag;
-    return req;
-}
-
-static void v9fs_req_send(P9Req *req)
-{
-    QVirtio9P *v9p = req->v9p;
-
-    req->r_msg = guest_alloc(alloc, P9_MAX_SIZE);
-    req->free_head = qvirtqueue_add(req->qts, v9p->vq, req->t_msg, req->t_size,
-                                    false, true);
-    qvirtqueue_add(req->qts, v9p->vq, req->r_msg, P9_MAX_SIZE, true, false);
-    qvirtqueue_kick(req->qts, v9p->vdev, v9p->vq, req->free_head);
-    req->t_off = 0;
-}
-
-static const char *rmessage_name(uint8_t id)
-{
-    return
-        id == P9_RLERROR ? "RLERROR" :
-        id == P9_RVERSION ? "RVERSION" :
-        id == P9_RATTACH ? "RATTACH" :
-        id == P9_RWALK ? "RWALK" :
-        id == P9_RLOPEN ? "RLOPEN" :
-        id == P9_RWRITE ? "RWRITE" :
-        id == P9_RMKDIR ? "RMKDIR" :
-        id == P9_RLCREATE ? "RLCREATE" :
-        id == P9_RSYMLINK ? "RSYMLINK" :
-        id == P9_RLINK ? "RLINK" :
-        id == P9_RUNLINKAT ? "RUNLINKAT" :
-        id == P9_RFLUSH ? "RFLUSH" :
-        id == P9_RREADDIR ? "READDIR" :
-        "<unknown>";
-}
-
-static void v9fs_req_wait_for_reply(P9Req *req, uint32_t *len)
-{
-    QVirtio9P *v9p = req->v9p;
-
-    qvirtio_wait_used_elem(req->qts, v9p->vdev, v9p->vq, req->free_head, len,
-                           QVIRTIO_9P_TIMEOUT_US);
-}
-
-static void v9fs_req_recv(P9Req *req, uint8_t id)
-{
-    P9Hdr hdr;
-
-    v9fs_memread(req, &hdr, 7);
-    hdr.size = ldl_le_p(&hdr.size);
-    hdr.tag = lduw_le_p(&hdr.tag);
-
-    g_assert_cmpint(hdr.size, >=, 7);
-    g_assert_cmpint(hdr.size, <=, P9_MAX_SIZE);
-    g_assert_cmpint(hdr.tag, ==, req->tag);
-
-    if (hdr.id != id) {
-        g_printerr("Received response %d (%s) instead of %d (%s)\n",
-                   hdr.id, rmessage_name(hdr.id), id, rmessage_name(id));
-
-        if (hdr.id == P9_RLERROR) {
-            uint32_t err;
-            v9fs_uint32_read(req, &err);
-            g_printerr("Rlerror has errno %d (%s)\n", err, strerror(err));
-        }
-    }
-    g_assert_cmpint(hdr.id, ==, id);
-}
-
-static void v9fs_req_free(P9Req *req)
-{
-    guest_free(alloc, req->t_msg);
-    guest_free(alloc, req->r_msg);
-    g_free(req);
-}
-
-/* size[4] Rlerror tag[2] ecode[4] */
-static void v9fs_rlerror(P9Req *req, uint32_t *err)
-{
-    v9fs_req_recv(req, P9_RLERROR);
-    v9fs_uint32_read(req, err);
-    v9fs_req_free(req);
-}
-
-/* size[4] Tversion tag[2] msize[4] version[s] */
-static P9Req *v9fs_tversion(QVirtio9P *v9p, uint32_t msize, const char *version,
-                            uint16_t tag)
-{
-    P9Req *req;
-    uint32_t body_size = 4;
-    uint16_t string_size = v9fs_string_size(version);
-
-    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
-    body_size += string_size;
-    req = v9fs_req_init(v9p, body_size, P9_TVERSION, tag);
-
-    v9fs_uint32_write(req, msize);
-    v9fs_string_write(req, version);
-    v9fs_req_send(req);
-    return req;
-}
-
-/* size[4] Rversion tag[2] msize[4] version[s] */
-static void v9fs_rversion(P9Req *req, uint16_t *len, char **version)
-{
-    uint32_t msize;
-
-    v9fs_req_recv(req, P9_RVERSION);
-    v9fs_uint32_read(req, &msize);
-
-    g_assert_cmpint(msize, ==, P9_MAX_SIZE);
-
-    if (len || version) {
-        v9fs_string_read(req, len, version);
-    }
-
-    v9fs_req_free(req);
-}
-
-/* size[4] Tattach tag[2] fid[4] afid[4] uname[s] aname[s] n_uname[4] */
-static P9Req *v9fs_tattach(QVirtio9P *v9p, uint32_t fid, uint32_t n_uname,
-                           uint16_t tag)
-{
-    const char *uname = ""; /* ignored by QEMU */
-    const char *aname = ""; /* ignored by QEMU */
-    P9Req *req = v9fs_req_init(v9p, 4 + 4 + 2 + 2 + 4, P9_TATTACH, tag);
-
-    v9fs_uint32_write(req, fid);
-    v9fs_uint32_write(req, P9_NOFID);
-    v9fs_string_write(req, uname);
-    v9fs_string_write(req, aname);
-    v9fs_uint32_write(req, n_uname);
-    v9fs_req_send(req);
-    return req;
-}
-
-/* type[1] version[4] path[8] */
-typedef char v9fs_qid[13];
-
 static inline bool is_same_qid(v9fs_qid a, v9fs_qid b)
 {
     /* don't compare QID version for checking for file ID equalness */
     return a[0] == b[0] && memcmp(&a[5], &b[5], 8) == 0;
 }
 
-/* size[4] Rattach tag[2] qid[13] */
-static void v9fs_rattach(P9Req *req, v9fs_qid *qid)
-{
-    v9fs_req_recv(req, P9_RATTACH);
-    if (qid) {
-        v9fs_memread(req, qid, 13);
-    }
-    v9fs_req_free(req);
-}
-
-/* size[4] Twalk tag[2] fid[4] newfid[4] nwname[2] nwname*(wname[s]) */
-static P9Req *v9fs_twalk(QVirtio9P *v9p, uint32_t fid, uint32_t newfid,
-                         uint16_t nwname, char *const wnames[], uint16_t tag)
-{
-    P9Req *req;
-    int i;
-    uint32_t body_size = 4 + 4 + 2;
-
-    for (i = 0; i < nwname; i++) {
-        uint16_t wname_size = v9fs_string_size(wnames[i]);
-
-        g_assert_cmpint(body_size, <=, UINT32_MAX - wname_size);
-        body_size += wname_size;
-    }
-    req = v9fs_req_init(v9p,  body_size, P9_TWALK, tag);
-    v9fs_uint32_write(req, fid);
-    v9fs_uint32_write(req, newfid);
-    v9fs_uint16_write(req, nwname);
-    for (i = 0; i < nwname; i++) {
-        v9fs_string_write(req, wnames[i]);
-    }
-    v9fs_req_send(req);
-    return req;
-}
-
-/* size[4] Rwalk tag[2] nwqid[2] nwqid*(wqid[13]) */
-static void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid)
-{
-    uint16_t local_nwqid;
-
-    v9fs_req_recv(req, P9_RWALK);
-    v9fs_uint16_read(req, &local_nwqid);
-    if (nwqid) {
-        *nwqid = local_nwqid;
-    }
-    if (wqid) {
-        *wqid = g_malloc(local_nwqid * 13);
-        v9fs_memread(req, *wqid, local_nwqid * 13);
-    }
-    v9fs_req_free(req);
-}
-
-/* size[4] Tgetattr tag[2] fid[4] request_mask[8] */
-static P9Req *v9fs_tgetattr(QVirtio9P *v9p, uint32_t fid, uint64_t request_mask,
-                            uint16_t tag)
-{
-    P9Req *req;
-
-    req = v9fs_req_init(v9p, 4 + 8, P9_TGETATTR, tag);
-    v9fs_uint32_write(req, fid);
-    v9fs_uint64_write(req, request_mask);
-    v9fs_req_send(req);
-    return req;
-}
-
-typedef struct v9fs_attr {
-    uint64_t valid;
-    v9fs_qid qid;
-    uint32_t mode;
-    uint32_t uid;
-    uint32_t gid;
-    uint64_t nlink;
-    uint64_t rdev;
-    uint64_t size;
-    uint64_t blksize;
-    uint64_t blocks;
-    uint64_t atime_sec;
-    uint64_t atime_nsec;
-    uint64_t mtime_sec;
-    uint64_t mtime_nsec;
-    uint64_t ctime_sec;
-    uint64_t ctime_nsec;
-    uint64_t btime_sec;
-    uint64_t btime_nsec;
-    uint64_t gen;
-    uint64_t data_version;
-} v9fs_attr;
-
-#define P9_GETATTR_BASIC    0x000007ffULL /* Mask for fields up to BLOCKS */
-
-/*
- * size[4] Rgetattr tag[2] valid[8] qid[13] mode[4] uid[4] gid[4] nlink[8]
- *                  rdev[8] size[8] blksize[8] blocks[8]
- *                  atime_sec[8] atime_nsec[8] mtime_sec[8] mtime_nsec[8]
- *                  ctime_sec[8] ctime_nsec[8] btime_sec[8] btime_nsec[8]
- *                  gen[8] data_version[8]
- */
-static void v9fs_rgetattr(P9Req *req, v9fs_attr *attr)
-{
-    v9fs_req_recv(req, P9_RGETATTR);
-
-    v9fs_uint64_read(req, &attr->valid);
-    v9fs_memread(req, &attr->qid, 13);
-    v9fs_uint32_read(req, &attr->mode);
-    v9fs_uint32_read(req, &attr->uid);
-    v9fs_uint32_read(req, &attr->gid);
-    v9fs_uint64_read(req, &attr->nlink);
-    v9fs_uint64_read(req, &attr->rdev);
-    v9fs_uint64_read(req, &attr->size);
-    v9fs_uint64_read(req, &attr->blksize);
-    v9fs_uint64_read(req, &attr->blocks);
-    v9fs_uint64_read(req, &attr->atime_sec);
-    v9fs_uint64_read(req, &attr->atime_nsec);
-    v9fs_uint64_read(req, &attr->mtime_sec);
-    v9fs_uint64_read(req, &attr->mtime_nsec);
-    v9fs_uint64_read(req, &attr->ctime_sec);
-    v9fs_uint64_read(req, &attr->ctime_nsec);
-    v9fs_uint64_read(req, &attr->btime_sec);
-    v9fs_uint64_read(req, &attr->btime_nsec);
-    v9fs_uint64_read(req, &attr->gen);
-    v9fs_uint64_read(req, &attr->data_version);
-
-    v9fs_req_free(req);
-}
-
-/* size[4] Treaddir tag[2] fid[4] offset[8] count[4] */
-static P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
-                            uint32_t count, uint16_t tag)
-{
-    P9Req *req;
-
-    req = v9fs_req_init(v9p, 4 + 8 + 4, P9_TREADDIR, tag);
-    v9fs_uint32_write(req, fid);
-    v9fs_uint64_write(req, offset);
-    v9fs_uint32_write(req, count);
-    v9fs_req_send(req);
-    return req;
-}
-
-struct V9fsDirent {
-    v9fs_qid qid;
-    uint64_t offset;
-    uint8_t type;
-    char *name;
-    struct V9fsDirent *next;
-};
-
-/* size[4] Rreaddir tag[2] count[4] data[count] */
-static void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
-                          struct V9fsDirent **entries)
-{
-    uint32_t local_count;
-    struct V9fsDirent *e = NULL;
-    uint16_t slen;
-    uint32_t n = 0;
-
-    v9fs_req_recv(req, P9_RREADDIR);
-    v9fs_uint32_read(req, &local_count);
-
-    if (count) {
-        *count = local_count;
-    }
-
-    for (int32_t togo = (int32_t)local_count;
-         togo >= 13 + 8 + 1 + 2;
-         togo -= 13 + 8 + 1 + 2 + slen, ++n)
-    {
-        if (!e) {
-            e = g_new(struct V9fsDirent, 1);
-            if (entries) {
-                *entries = e;
-            }
-        } else {
-            e = e->next = g_new(struct V9fsDirent, 1);
-        }
-        e->next = NULL;
-        /* qid[13] offset[8] type[1] name[s] */
-        v9fs_memread(req, &e->qid, 13);
-        v9fs_uint64_read(req, &e->offset);
-        v9fs_uint8_read(req, &e->type);
-        v9fs_string_read(req, &slen, &e->name);
-    }
-
-    if (nentries) {
-        *nentries = n;
-    }
-
-    v9fs_req_free(req);
-}
-
-static void v9fs_free_dirents(struct V9fsDirent *e)
-{
-    struct V9fsDirent *next = NULL;
-
-    for (; e; e = next) {
-        next = e->next;
-        g_free(e->name);
-        g_free(e);
-    }
-}
-
-/* size[4] Tlopen tag[2] fid[4] flags[4] */
-static P9Req *v9fs_tlopen(QVirtio9P *v9p, uint32_t fid, uint32_t flags,
-                          uint16_t tag)
-{
-    P9Req *req;
-
-    req = v9fs_req_init(v9p,  4 + 4, P9_TLOPEN, tag);
-    v9fs_uint32_write(req, fid);
-    v9fs_uint32_write(req, flags);
-    v9fs_req_send(req);
-    return req;
-}
-
-/* size[4] Rlopen tag[2] qid[13] iounit[4] */
-static void v9fs_rlopen(P9Req *req, v9fs_qid *qid, uint32_t *iounit)
-{
-    v9fs_req_recv(req, P9_RLOPEN);
-    if (qid) {
-        v9fs_memread(req, qid, 13);
-    } else {
-        v9fs_memskip(req, 13);
-    }
-    if (iounit) {
-        v9fs_uint32_read(req, iounit);
-    }
-    v9fs_req_free(req);
-}
-
-/* size[4] Twrite tag[2] fid[4] offset[8] count[4] data[count] */
-static P9Req *v9fs_twrite(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
-                          uint32_t count, const void *data, uint16_t tag)
-{
-    P9Req *req;
-    uint32_t body_size = 4 + 8 + 4;
-
-    g_assert_cmpint(body_size, <=, UINT32_MAX - count);
-    body_size += count;
-    req = v9fs_req_init(v9p,  body_size, P9_TWRITE, tag);
-    v9fs_uint32_write(req, fid);
-    v9fs_uint64_write(req, offset);
-    v9fs_uint32_write(req, count);
-    v9fs_memwrite(req, data, count);
-    v9fs_req_send(req);
-    return req;
-}
-
-/* size[4] Rwrite tag[2] count[4] */
-static void v9fs_rwrite(P9Req *req, uint32_t *count)
-{
-    v9fs_req_recv(req, P9_RWRITE);
-    if (count) {
-        v9fs_uint32_read(req, count);
-    }
-    v9fs_req_free(req);
-}
-
-/* size[4] Tflush tag[2] oldtag[2] */
-static P9Req *v9fs_tflush(QVirtio9P *v9p, uint16_t oldtag, uint16_t tag)
-{
-    P9Req *req;
-
-    req = v9fs_req_init(v9p,  2, P9_TFLUSH, tag);
-    v9fs_uint32_write(req, oldtag);
-    v9fs_req_send(req);
-    return req;
-}
-
-/* size[4] Rflush tag[2] */
-static void v9fs_rflush(P9Req *req)
-{
-    v9fs_req_recv(req, P9_RFLUSH);
-    v9fs_req_free(req);
-}
-
 static void do_version(QVirtio9P *v9p)
 {
     const char *version = "9P2000.L";
@@ -717,7 +157,7 @@ static void do_walk_expect_error(QVirtio9P *v9p, const char *path, uint32_t err)
 
 static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
 {
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     do_version(obj);
 }
 
@@ -738,14 +178,14 @@ static void do_attach(QVirtio9P *v9p)
 
 static void fs_attach(void *obj, void *data, QGuestAllocator *t_alloc)
 {
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     do_attach(obj);
 }
 
 static void fs_walk(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     char *wnames[P9_MAXWELEM];
     uint16_t nwqid;
     g_autofree v9fs_qid *wqid = NULL;
@@ -778,169 +218,11 @@ static bool fs_dirents_contain_name(struct V9fsDirent *e, const char* name)
     return false;
 }
 
-/* size[4] Tmkdir tag[2] dfid[4] name[s] mode[4] gid[4] */
-static P9Req *v9fs_tmkdir(QVirtio9P *v9p, uint32_t dfid, const char *name,
-                          uint32_t mode, uint32_t gid, uint16_t tag)
-{
-    P9Req *req;
-
-    uint32_t body_size = 4 + 4 + 4;
-    uint16_t string_size = v9fs_string_size(name);
-
-    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
-    body_size += string_size;
-
-    req = v9fs_req_init(v9p, body_size, P9_TMKDIR, tag);
-    v9fs_uint32_write(req, dfid);
-    v9fs_string_write(req, name);
-    v9fs_uint32_write(req, mode);
-    v9fs_uint32_write(req, gid);
-    v9fs_req_send(req);
-    return req;
-}
-
-/* size[4] Rmkdir tag[2] qid[13] */
-static void v9fs_rmkdir(P9Req *req, v9fs_qid *qid)
-{
-    v9fs_req_recv(req, P9_RMKDIR);
-    if (qid) {
-        v9fs_memread(req, qid, 13);
-    } else {
-        v9fs_memskip(req, 13);
-    }
-    v9fs_req_free(req);
-}
-
-/* size[4] Tlcreate tag[2] fid[4] name[s] flags[4] mode[4] gid[4] */
-static P9Req *v9fs_tlcreate(QVirtio9P *v9p, uint32_t fid, const char *name,
-                            uint32_t flags, uint32_t mode, uint32_t gid,
-                            uint16_t tag)
-{
-    P9Req *req;
-
-    uint32_t body_size = 4 + 4 + 4 + 4;
-    uint16_t string_size = v9fs_string_size(name);
-
-    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
-    body_size += string_size;
-
-    req = v9fs_req_init(v9p, body_size, P9_TLCREATE, tag);
-    v9fs_uint32_write(req, fid);
-    v9fs_string_write(req, name);
-    v9fs_uint32_write(req, flags);
-    v9fs_uint32_write(req, mode);
-    v9fs_uint32_write(req, gid);
-    v9fs_req_send(req);
-    return req;
-}
-
-/* size[4] Rlcreate tag[2] qid[13] iounit[4] */
-static void v9fs_rlcreate(P9Req *req, v9fs_qid *qid, uint32_t *iounit)
-{
-    v9fs_req_recv(req, P9_RLCREATE);
-    if (qid) {
-        v9fs_memread(req, qid, 13);
-    } else {
-        v9fs_memskip(req, 13);
-    }
-    if (iounit) {
-        v9fs_uint32_read(req, iounit);
-    }
-    v9fs_req_free(req);
-}
-
-/* size[4] Tsymlink tag[2] fid[4] name[s] symtgt[s] gid[4] */
-static P9Req *v9fs_tsymlink(QVirtio9P *v9p, uint32_t fid, const char *name,
-                            const char *symtgt, uint32_t gid, uint16_t tag)
-{
-    P9Req *req;
-
-    uint32_t body_size = 4 + 4;
-    uint16_t string_size = v9fs_string_size(name) + v9fs_string_size(symtgt);
-
-    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
-    body_size += string_size;
-
-    req = v9fs_req_init(v9p, body_size, P9_TSYMLINK, tag);
-    v9fs_uint32_write(req, fid);
-    v9fs_string_write(req, name);
-    v9fs_string_write(req, symtgt);
-    v9fs_uint32_write(req, gid);
-    v9fs_req_send(req);
-    return req;
-}
-
-/* size[4] Rsymlink tag[2] qid[13] */
-static void v9fs_rsymlink(P9Req *req, v9fs_qid *qid)
-{
-    v9fs_req_recv(req, P9_RSYMLINK);
-    if (qid) {
-        v9fs_memread(req, qid, 13);
-    } else {
-        v9fs_memskip(req, 13);
-    }
-    v9fs_req_free(req);
-}
-
-/* size[4] Tlink tag[2] dfid[4] fid[4] name[s] */
-static P9Req *v9fs_tlink(QVirtio9P *v9p, uint32_t dfid, uint32_t fid,
-                         const char *name, uint16_t tag)
-{
-    P9Req *req;
-
-    uint32_t body_size = 4 + 4;
-    uint16_t string_size = v9fs_string_size(name);
-
-    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
-    body_size += string_size;
-
-    req = v9fs_req_init(v9p, body_size, P9_TLINK, tag);
-    v9fs_uint32_write(req, dfid);
-    v9fs_uint32_write(req, fid);
-    v9fs_string_write(req, name);
-    v9fs_req_send(req);
-    return req;
-}
-
-/* size[4] Rlink tag[2] */
-static void v9fs_rlink(P9Req *req)
-{
-    v9fs_req_recv(req, P9_RLINK);
-    v9fs_req_free(req);
-}
-
-/* size[4] Tunlinkat tag[2] dirfd[4] name[s] flags[4] */
-static P9Req *v9fs_tunlinkat(QVirtio9P *v9p, uint32_t dirfd, const char *name,
-                             uint32_t flags, uint16_t tag)
-{
-    P9Req *req;
-
-    uint32_t body_size = 4 + 4;
-    uint16_t string_size = v9fs_string_size(name);
-
-    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
-    body_size += string_size;
-
-    req = v9fs_req_init(v9p, body_size, P9_TUNLINKAT, tag);
-    v9fs_uint32_write(req, dirfd);
-    v9fs_string_write(req, name);
-    v9fs_uint32_write(req, flags);
-    v9fs_req_send(req);
-    return req;
-}
-
-/* size[4] Runlinkat tag[2] */
-static void v9fs_runlinkat(P9Req *req)
-{
-    v9fs_req_recv(req, P9_RUNLINKAT);
-    v9fs_req_free(req);
-}
-
 /* basic readdir test where reply fits into a single response message */
 static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
     uint16_t nqid;
     v9fs_qid qid;
@@ -1073,7 +355,7 @@ static void do_readdir_split(QVirtio9P *v9p, uint32_t count)
 static void fs_walk_no_slash(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     char *const wnames[] = { g_strdup(" /") };
     P9Req *req;
     uint32_t err;
@@ -1091,7 +373,7 @@ static void fs_walk_no_slash(void *obj, void *data, QGuestAllocator *t_alloc)
 static void fs_walk_nonexistent(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
 
     do_attach(v9p);
     /*
@@ -1105,7 +387,7 @@ static void fs_walk_2nd_nonexistent(void *obj, void *data,
                                     QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     v9fs_qid root_qid;
     uint16_t nwqid;
     uint32_t fid, err;
@@ -1137,7 +419,7 @@ static void fs_walk_2nd_nonexistent(void *obj, void *data,
 static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     v9fs_qid root_qid;
     g_autofree v9fs_qid *wqid = NULL;
     P9Req *req;
@@ -1165,7 +447,7 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
 static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     char *const wnames[] = { g_strdup("..") };
     v9fs_qid root_qid;
     g_autofree v9fs_qid *wqid = NULL;
@@ -1188,7 +470,7 @@ static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
 static void fs_lopen(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_LOPEN_FILE) };
     P9Req *req;
 
@@ -1207,7 +489,7 @@ static void fs_lopen(void *obj, void *data, QGuestAllocator *t_alloc)
 static void fs_write(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     static const uint32_t write_count = P9_MAX_SIZE / 2;
     char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_WRITE_FILE) };
     g_autofree char *buf = g_malloc0(write_count);
@@ -1234,7 +516,7 @@ static void fs_write(void *obj, void *data, QGuestAllocator *t_alloc)
 static void fs_flush_success(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_FLUSH_FILE) };
     P9Req *req, *flush_req;
     uint32_t reply_len;
@@ -1271,7 +553,7 @@ static void fs_flush_success(void *obj, void *data, QGuestAllocator *t_alloc)
 static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_FLUSH_FILE) };
     P9Req *req, *flush_req;
     uint32_t count;
@@ -1383,21 +665,21 @@ static void do_unlinkat(QVirtio9P *v9p, const char *atpath, const char *rpath,
 static void fs_readdir_split_128(void *obj, void *data,
                                  QGuestAllocator *t_alloc)
 {
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     do_readdir_split(obj, 128);
 }
 
 static void fs_readdir_split_256(void *obj, void *data,
                                  QGuestAllocator *t_alloc)
 {
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     do_readdir_split(obj, 256);
 }
 
 static void fs_readdir_split_512(void *obj, void *data,
                                  QGuestAllocator *t_alloc)
 {
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     do_readdir_split(obj, 512);
 }
 
@@ -1407,7 +689,7 @@ static void fs_readdir_split_512(void *obj, void *data,
 static void fs_create_dir(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     struct stat st;
     g_autofree char *root_path = virtio_9p_test_path("");
     g_autofree char *new_dir = virtio_9p_test_path("01");
@@ -1426,7 +708,7 @@ static void fs_create_dir(void *obj, void *data, QGuestAllocator *t_alloc)
 static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     struct stat st;
     g_autofree char *root_path = virtio_9p_test_path("");
     g_autofree char *new_dir = virtio_9p_test_path("02");
@@ -1449,7 +731,7 @@ static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator *t_alloc)
 static void fs_create_file(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     struct stat st;
     g_autofree char *new_file = virtio_9p_test_path("03/1st_file");
 
@@ -1466,7 +748,7 @@ static void fs_create_file(void *obj, void *data, QGuestAllocator *t_alloc)
 static void fs_unlinkat_file(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     struct stat st;
     g_autofree char *new_file = virtio_9p_test_path("04/doa_file");
 
@@ -1487,7 +769,7 @@ static void fs_unlinkat_file(void *obj, void *data, QGuestAllocator *t_alloc)
 static void fs_symlink_file(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     struct stat st;
     g_autofree char *real_file = virtio_9p_test_path("05/real_file");
     g_autofree char *symlink_file = virtio_9p_test_path("05/symlink_file");
@@ -1508,7 +790,7 @@ static void fs_unlinkat_symlink(void *obj, void *data,
                                 QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     struct stat st;
     g_autofree char *real_file = virtio_9p_test_path("06/real_file");
     g_autofree char *symlink_file = virtio_9p_test_path("06/symlink_file");
@@ -1530,7 +812,7 @@ static void fs_unlinkat_symlink(void *obj, void *data,
 static void fs_hardlink_file(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     struct stat st_real, st_link;
     g_autofree char *real_file = virtio_9p_test_path("07/real_file");
     g_autofree char *hardlink_file = virtio_9p_test_path("07/hardlink_file");
@@ -1555,7 +837,7 @@ static void fs_unlinkat_hardlink(void *obj, void *data,
                                  QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
-    alloc = t_alloc;
+    v9fs_set_allocator(t_alloc);
     struct stat st_real, st_link;
     g_autofree char *real_file = virtio_9p_test_path("08/real_file");
     g_autofree char *hardlink_file = virtio_9p_test_path("08/hardlink_file");
-- 
2.30.2


