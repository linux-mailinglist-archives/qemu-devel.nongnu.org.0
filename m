Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF2354DFE7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:21:06 +0200 (CEST)
Received: from localhost ([::1]:38354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nYf-0002Gg-Ba
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0e43495d3b4a50fc5e22f7b71261fdd5b56fdfcb@lizzy.crudebyte.com>)
 id 1o1nM5-0007Ts-BS
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:08:05 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:41567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0e43495d3b4a50fc5e22f7b71261fdd5b56fdfcb@lizzy.crudebyte.com>)
 id 1o1nM3-0003Ua-RH
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=5GVtuCb+h3vMK5cR5MF6sILSOR2ZmkmU+JK820SIpM4=; b=dUjdT
 Y7wF7xqtcKm7OjGQ3PjtZXpndbJ1B5/YR2/4QoN+/0KudoLZTZV1OB6XTVkwh3s9imD5GiQeW5hD+
 82rev7ZvI8J3HiMEJU052LVHLfZk1FgAFyhdooUwFu4RTrOdiNJ0dy+KgrrrxRMyTz8dNN9fb6lYA
 saC/RfE2WpPRVakK88r4yR9MNDmjPXaQg15X5rwLJXxErbuQVqDZ9nKzzwqx5WOWMPLADMuiHmQVc
 2F8GbAy+2bm6DUQLfI3gxYOou5vBF39m1pQRlwaQ/L1omKLQzS9159FZMmrySoui7gRtglkx5LGXF
 tW9LEfptHOCN7tEmMSx5Y5w6jd13g==;
Message-Id: <0e43495d3b4a50fc5e22f7b71261fdd5b56fdfcb.1655377203.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1655377203.git.qemu_oss@crudebyte.com>
References: <cover.1655377203.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 16 Jun 2022 13:00:04 +0200
Subject: [PULL 7/7] tests/9pfs: check fid being unaffected in
 fs_walk_2nd_nonexistent
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=0e43495d3b4a50fc5e22f7b71261fdd5b56fdfcb@lizzy.crudebyte.com;
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
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <6f0813cafdbf683cdac8b1492dd4ef8699c5b1d9.1647339025.git.qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index c787ded4d2..25305a4cf7 100644
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


