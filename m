Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C361754E00A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:30:09 +0200 (CEST)
Received: from localhost ([::1]:48990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nhQ-0001Jk-OL
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a6821b828404abdc18a0d9e21275ad1d7fd6ed05@lizzy.crudebyte.com>)
 id 1o1nLf-0007Fo-DO
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:07:41 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:54059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a6821b828404abdc18a0d9e21275ad1d7fd6ed05@lizzy.crudebyte.com>)
 id 1o1nLd-0003Jm-PR
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=XwupY3TUi3aYveup2Lsr+XAgkE/lW8+yacjW+GAe2R4=; b=fcjBN
 oFTeLy+oR1/3BjAmm8BmjlbY1Xnuob9835KccU+V0g29JmaSIAMFQl+NqzNVIZWqIlmdpL8yn9e5c
 /sd2aAcYRnLSrOkShb+rYhwE42gFGNlGMaouWYWNv/uRlmnBFPpOafACSu/CXq0P3llfL5x82e/zj
 BtFdAsvuwjlDY/00+c577kn5ZYQCbzwbJ0+nUy8aEHBCYj9+GTBwIPeZrRsBjEEOmwBTi714A2+XK
 yNifqCmOq/6estCuEa4brwMveiXh0HtVrBdnwNB30ZEb4foOnDDVbJUCT4NPhHuq8N0wOdsNcs1xC
 09nQfNl/EIYeHVh3SXzKCk3WRp/tQ==;
Message-Id: <a6821b828404abdc18a0d9e21275ad1d7fd6ed05.1655377203.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1655377203.git.qemu_oss@crudebyte.com>
References: <cover.1655377203.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 16 Jun 2022 13:00:04 +0200
Subject: [PULL 3/7] tests/9pfs: compare QIDs in fs_walk_none() test
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a6821b828404abdc18a0d9e21275ad1d7fd6ed05@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Extend previously added fs_walk_none() test by comparing the QID
of the root fid with the QID of the cloned fid. They should be
equal.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <5bbe9c6931b4600a9a23742f5ff2d38c1188237d.1647339025.git.qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 87 ++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 7942d5fef9..3c0f094929 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -371,8 +371,15 @@ static P9Req *v9fs_tattach(QVirtio9P *v9p, uint32_t fid, uint32_t n_uname,
     return req;
 }
 
+/* type[1] version[4] path[8] */
 typedef char v9fs_qid[13];
 
+static inline bool is_same_qid(v9fs_qid a, v9fs_qid b)
+{
+    /* don't compare QID version for checking for file ID equalness */
+    return a[0] == b[0] && memcmp(&a[5], &b[5], 8) == 0;
+}
+
 /* size[4] Rattach tag[2] qid[13] */
 static void v9fs_rattach(P9Req *req, v9fs_qid *qid)
 {
@@ -425,6 +432,79 @@ static void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid)
     v9fs_req_free(req);
 }
 
+/* size[4] Tgetattr tag[2] fid[4] request_mask[8] */
+static P9Req *v9fs_tgetattr(QVirtio9P *v9p, uint32_t fid, uint64_t request_mask,
+                            uint16_t tag)
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
+/*
+ * size[4] Rgetattr tag[2] valid[8] qid[13] mode[4] uid[4] gid[4] nlink[8]
+ *                  rdev[8] size[8] blksize[8] blocks[8]
+ *                  atime_sec[8] atime_nsec[8] mtime_sec[8] mtime_nsec[8]
+ *                  ctime_sec[8] ctime_nsec[8] btime_sec[8] btime_nsec[8]
+ *                  gen[8] data_version[8]
+ */
+static void v9fs_rgetattr(P9Req *req, v9fs_attr *attr)
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
 /* size[4] Treaddir tag[2] fid[4] offset[8] count[4] */
 static P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
                             uint32_t count, uint16_t tag)
@@ -1009,6 +1089,7 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
     v9fs_qid root_qid;
     g_autofree v9fs_qid *wqid = NULL;
     P9Req *req;
+    struct v9fs_attr attr;
 
     do_version(v9p);
     req = v9fs_tattach(v9p, 0, getuid(), 0);
@@ -1021,6 +1102,12 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
 
     /* special case: no QID is returned if nwname=0 was sent */
     g_assert(wqid == NULL);
+
+    req = v9fs_tgetattr(v9p, 1, P9_GETATTR_BASIC, 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rgetattr(req, &attr);
+
+    g_assert(is_same_qid(root_qid, attr.qid));
 }
 
 static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
-- 
2.30.2


