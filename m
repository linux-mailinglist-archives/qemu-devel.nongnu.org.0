Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73AF4D39DE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 20:19:21 +0100 (CET)
Received: from localhost ([::1]:58902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS1qC-0005uK-Un
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 14:19:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <699dea34f26b6f60746a16a35748b65d76515f1a@lizzy.crudebyte.com>)
 id 1nS1m2-0003nQ-IF
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:15:02 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:58537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <699dea34f26b6f60746a16a35748b65d76515f1a@lizzy.crudebyte.com>)
 id 1nS1m0-0004ri-Vq
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=8z1sLYd5CDw7cg4PvCyJAi/AJyQA5yqK83lyVZ4XFWY=; b=Vt29E
 UHy+VB2U1n9YKapf6cDDyAJKmVTq7hUSYdUAZP7G3HFYMYEH2X5USRbL3/QHGDc3wdHeTlIgQPZ51
 IURMhzHeF5RUQLyMR7AsNm7ZOqgrHbQS9WvyMf9PMZrTta7lRpBETlnda2FtTbcfbqrjI309NrMPF
 83aCHPdz9UUZ8SBw6WvuYR0btAJz5pR9WZFGwm6Xe6oCaM5LM07UOMBTbhLw/IvJEAg2kubKllKNj
 2d390mEIqggIa2+TTKSywheavRl22dxFePDyvDDMQ+shYXerXhZmUtArZVyC/Bmp5d6xIEGwCKxVm
 lyDSa1pnmWMCCNIpvsxdur+rLxW1Q==;
Message-Id: <699dea34f26b6f60746a16a35748b65d76515f1a.1646850707.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646850707.git.qemu_oss@crudebyte.com>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 9 Mar 2022 15:49:04 +0100
Subject: [PATCH 3/6] tests/9pfs: compare QIDs in fs_walk_none() test
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=699dea34f26b6f60746a16a35748b65d76515f1a@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
---
 tests/qtest/virtio-9p-test.c | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 6c00da03f4..9098e21173 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -146,6 +146,11 @@ static void v9fs_uint16_read(P9Req *req, uint16_t *val)
     le16_to_cpus(val);
 }
 
+static void v9fs_int16_read(P9Req *req, int16_t *val)
+{
+    v9fs_uint16_read(req, (uint16_t *)val);
+}
+
 static void v9fs_uint32_write(P9Req *req, uint32_t val)
 {
     uint32_t le_val = cpu_to_le32(val);
@@ -166,12 +171,22 @@ static void v9fs_uint32_read(P9Req *req, uint32_t *val)
     le32_to_cpus(val);
 }
 
+static void v9fs_int32_read(P9Req *req, int32_t *val)
+{
+    v9fs_uint32_read(req, (uint32_t *)val);
+}
+
 static void v9fs_uint64_read(P9Req *req, uint64_t *val)
 {
     v9fs_memread(req, val, 8);
     le64_to_cpus(val);
 }
 
+static void v9fs_int64_read(P9Req *req, int64_t *val)
+{
+    v9fs_uint64_read(req, (uint64_t *)val);
+}
+
 /* len[2] string[len] */
 static uint16_t v9fs_string_size(const char *string)
 {
@@ -425,6 +440,40 @@ static void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid)
     v9fs_req_free(req);
 }
 
+/* size[4] Tstat tag[2] fid[4] */
+static P9Req *v9fs_tstat(QVirtio9P *v9p, uint32_t fid, uint16_t tag)
+{
+    P9Req *req;
+
+    req = v9fs_req_init(v9p, 4, P9_TSTAT, tag);
+    v9fs_uint32_write(req, fid);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Rstat tag[2] stat[n] */
+static void v9fs_rstat(P9Req *req, struct V9fsStat *st)
+{
+    v9fs_req_recv(req, P9_RSTAT);
+
+    v9fs_int16_read(req, &st->size);
+    v9fs_int16_read(req, &st->type);
+    v9fs_int32_read(req, &st->dev);
+    v9fs_uint8_read(req, &st->qid.type);
+    v9fs_uint32_read(req, &st->qid.version);
+    v9fs_uint64_read(req, &st->qid.path);
+    v9fs_int32_read(req, &st->mode);
+    v9fs_int32_read(req, &st->mtime);
+    v9fs_int32_read(req, &st->atime);
+    v9fs_int64_read(req, &st->length);
+    v9fs_string_read(req, &st->name.size, &st->name.data);
+    v9fs_string_read(req, &st->uid.size, &st->uid.data);
+    v9fs_string_read(req, &st->gid.size, &st->gid.data);
+    v9fs_string_read(req, &st->muid.size, &st->muid.data);
+
+    v9fs_req_free(req);
+}
+
 /* size[4] Treaddir tag[2] fid[4] offset[8] count[4] */
 static P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
                             uint32_t count, uint16_t tag)
@@ -1009,6 +1058,8 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
     v9fs_qid root_qid;
     g_autofree v9fs_qid *wqid = NULL;
     P9Req *req;
+    struct V9fsStat st[2];
+    int i;
 
     do_version(v9p);
     req = v9fs_tattach(v9p, 0, getuid(), 0);
@@ -1021,6 +1072,25 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
 
     /* special case: no QID is returned if nwname=0 was sent */
     g_assert(wqid == NULL);
+
+    req = v9fs_tstat(v9p, 0, 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rstat(req, &st[0]);
+
+    req = v9fs_tstat(v9p, 1, 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rstat(req, &st[1]);
+
+    /* don't compare QID version for checking for file ID equalness */
+    g_assert(st[0].qid.type == st[1].qid.type);
+    g_assert(st[0].qid.path == st[1].qid.path);
+
+    for (i = 0; i < 2; ++i) {
+        g_free(st[i].name.data);
+        g_free(st[i].uid.data);
+        g_free(st[i].gid.data);
+        g_free(st[i].muid.data);
+    }
 }
 
 static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
-- 
2.30.2


