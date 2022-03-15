Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2041E4D98E2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:35:41 +0100 (CET)
Received: from localhost ([::1]:35540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4Wi-0004BX-6l
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:35:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6f0813cafdbf683cdac8b1492dd4ef8699c5b1d9@lizzy.crudebyte.com>)
 id 1nU4Kv-0007sb-Tp
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:23:29 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:34903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6f0813cafdbf683cdac8b1492dd4ef8699c5b1d9@lizzy.crudebyte.com>)
 id 1nU4Kt-0004K2-UD
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=unZHmT3zWZNnuD5uSrtK7589kM7s18wLKGi/v3vo7LE=; b=YYhHA
 TmTXCdh0Ach2IScfLk84hTkadFGHaTF0/YAhrl5mZAiiFcfXz5WvqRyAwuyycENeEDuy2tUqMO3eE
 bSPsldkBWvMpgm1wDCV4PsczuW7Og6QuOuQJMnupYJMk/2tiXG12qnU65tyCQ+5Kn939w03emu8yV
 chPSzqviBeYKpzrMMG45FzIo+v2vc7oad4mcnRf6uv4Q5yT5vKMY6+ic0G/GKIpluARFRHksc4YN5
 8HcHe09PvHSu6XHwL79yRv1y8wCHYQA+jRiOCzEpXOrjTTSPPwz8+AUwlTI1H3Ll0Wgc70qPzfXg3
 v/GJD6ng9vrsuu0wjXvc1qv8ku3yw==;
Message-Id: <6f0813cafdbf683cdac8b1492dd4ef8699c5b1d9.1647339025.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1647339025.git.qemu_oss@crudebyte.com>
References: <cover.1647339025.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 15 Mar 2022 11:08:47 +0100
Subject: [PATCH v4 7/7] tests/9pfs: check fid being unaffected in
 fs_walk_2nd_nonexistent
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=6f0813cafdbf683cdac8b1492dd4ef8699c5b1d9@lizzy.crudebyte.com;
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

Extend previously added test case by checking that fid was unaffected
by 'Twalk' request (i.e. when 2nd path component of request being
invalid). Do that by subsequently sending a 'Tgetattr' request with
the fid previously used for 'Twalk'; that 'Tgetattr' request should
return an 'Rlerror' response by 9p server with error code ENOENT as
that fid is basically invalid.

And as we are at it, also check that the QID returned by 'Twalk' is
not identical to the root node's QID.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index f6e78d388e..2784ee4b2d 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -721,14 +721,19 @@ static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
     do_version(obj);
 }
 
-static void do_attach(QVirtio9P *v9p)
+static void do_attach_rqid(QVirtio9P *v9p, v9fs_qid *qid)
 {
     P9Req *req;
 
     do_version(v9p);
     req = v9fs_tattach(v9p, 0, getuid(), 0);
     v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rattach(req, NULL);
+    v9fs_rattach(req, qid);
+}
+
+static void do_attach(QVirtio9P *v9p)
+{
+    do_attach_rqid(v9p, NULL);
 }
 
 static void fs_attach(void *obj, void *data, QGuestAllocator *t_alloc)
@@ -1101,19 +1106,32 @@ static void fs_walk_2nd_nonexistent(void *obj, void *data,
 {
     QVirtio9P *v9p = obj;
     alloc = t_alloc;
+    v9fs_qid root_qid;
     uint16_t nwqid;
+    uint32_t fid, err;
+    P9Req *req;
     g_autofree v9fs_qid *wqid = NULL;
     g_autofree char *path = g_strdup_printf(
         QTEST_V9FS_SYNTH_WALK_FILE "/non-existent", 0
     );
 
-    do_attach(v9p);
-    do_walk_rqids(v9p, path, &nwqid, &wqid);
+    do_attach_rqid(v9p, &root_qid);
+    fid = do_walk_rqids(v9p, path, &nwqid, &wqid);
     /*
      * The 9p2000 protocol spec says: "nwqid is therefore either nwname or the
      * index of the first elementwise walk that failed."
      */
     assert(nwqid == 1);
+
+    /* returned QID wqid[0] is file ID of 1st subdir */
+    g_assert(wqid && wqid[0] && !is_same_qid(root_qid, wqid[0]));
+
+    /* expect fid being unaffected by walk above */
+    req = v9fs_tgetattr(v9p, fid, P9_GETATTR_BASIC, 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rlerror(req, &err);
+
+    g_assert_cmpint(err, ==, ENOENT);
 }
 
 static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
-- 
2.30.2


