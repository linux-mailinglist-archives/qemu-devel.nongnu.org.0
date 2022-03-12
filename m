Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5364D6E9F
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 13:14:31 +0100 (CET)
Received: from localhost ([::1]:58934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT0di-0001dl-CA
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 07:14:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1615696fe78186877ed5713166fe9f00546850c0@lizzy.crudebyte.com>)
 id 1nT0Yn-00030j-6y
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 07:09:30 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:52621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1615696fe78186877ed5713166fe9f00546850c0@lizzy.crudebyte.com>)
 id 1nT0Yk-0005Lx-N1
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 07:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=3NJWCrxaT7h/hOfZtG+/U/Q+vEuCGTA0s6O09Ns4aiU=; b=MNQE3
 grh6j+M8UEiMfNDrA8aXhYNsIFSt9nLLf9lIsL3c54WkSaxNiU3mD9uu/kJgdsDmw0D4rCMdxgOpN
 3O/un+khE4XRwD0FZJYjhLBGEF05+fetc3/QeSKyxFdiyLLFPU1IEF8k4FoQqGRjPFQVD93QFtFdN
 A3JdClhwnUYsu5N3TUELhmUm8X/mzDwQFIZrdo/VtKUSSd+hL2Iy7BGz7IF5bCSKcYfU7hclDxglk
 svwGHHLQ5Gk1PMa2JhbjlWn76336nqNQ506FMh/9NoMqbhHIKhXTA0nfaa6cOCv2Xp38gLYEKin4b
 qqKVtenURTCKTppIz2iFEpYcma3qA==;
Message-Id: <1615696fe78186877ed5713166fe9f00546850c0.1647083430.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1647083430.git.qemu_oss@crudebyte.com>
References: <cover.1647083430.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sat, 12 Mar 2022 12:06:51 +0100
Subject: [PATCH v2 6/7] tests/9pfs: guard recent 'Twalk' behaviour fix
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=1615696fe78186877ed5713166fe9f00546850c0@lizzy.crudebyte.com;
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

Previous 9p patch fixed 'Twalk' request handling, which was previously not
behaving as specified by the 9p2000 protocol spec. This patch adds a new test
case which guards the new 'Twalk' behaviour in question.

More specifically: it sends a 'Twalk' request where the 1st path component
is valid, whereas the 2nd path component transmitted to server does not
exist. The expected behaviour is that 9p server would respond by sending
a 'Rwalk' response with exactly 1 QID (instead of 'Rlerror' response).

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 tests/qtest/virtio-9p-test.c | 42 +++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index a1160f4659..f6e78d388e 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -669,8 +669,12 @@ static void do_version(QVirtio9P *v9p)
     g_assert_cmpmem(server_version, server_len, version, strlen(version));
 }
 
-/* utility function: walk to requested dir and return fid for that dir */
-static uint32_t do_walk(QVirtio9P *v9p, const char *path)
+/*
+ * utility function: walk to requested dir and return fid for that dir and
+ * the QIDs of server response
+ */
+static uint32_t do_walk_rqids(QVirtio9P *v9p, const char *path, uint16_t *nwqid,
+                              v9fs_qid **wqid)
 {
     char **wnames;
     P9Req *req;
@@ -680,12 +684,18 @@ static uint32_t do_walk(QVirtio9P *v9p, const char *path)
 
     req = v9fs_twalk(v9p, 0, fid, nwnames, wnames, 0);
     v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rwalk(req, NULL, NULL);
+    v9fs_rwalk(req, nwqid, wqid);
 
     split_free(&wnames);
     return fid;
 }
 
+/* utility function: walk to requested dir and return fid for that dir */
+static uint32_t do_walk(QVirtio9P *v9p, const char *path)
+{
+    return do_walk_rqids(v9p, path, NULL, NULL);
+}
+
 /* utility function: walk to requested dir and expect passed error response */
 static void do_walk_expect_error(QVirtio9P *v9p, const char *path, uint32_t err)
 {
@@ -1079,9 +1089,33 @@ static void fs_walk_nonexistent(void *obj, void *data, QGuestAllocator *t_alloc)
     alloc = t_alloc;
 
     do_attach(v9p);
+    /*
+     * The 9p2000 protocol spec says: "If the first element cannot be walked
+     * for any reason, Rerror is returned."
+     */
     do_walk_expect_error(v9p, "non-existent", ENOENT);
 }
 
+static void fs_walk_2nd_nonexistent(void *obj, void *data,
+                                    QGuestAllocator *t_alloc)
+{
+    QVirtio9P *v9p = obj;
+    alloc = t_alloc;
+    uint16_t nwqid;
+    g_autofree v9fs_qid *wqid = NULL;
+    g_autofree char *path = g_strdup_printf(
+        QTEST_V9FS_SYNTH_WALK_FILE "/non-existent", 0
+    );
+
+    do_attach(v9p);
+    do_walk_rqids(v9p, path, &nwqid, &wqid);
+    /*
+     * The 9p2000 protocol spec says: "nwqid is therefore either nwname or the
+     * index of the first elementwise walk that failed."
+     */
+    assert(nwqid == 1);
+}
+
 static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
@@ -1548,6 +1582,8 @@ static void register_virtio_9p_test(void)
                  fs_walk_dotdot,  &opts);
     qos_add_test("synth/walk/non_existent", "virtio-9p", fs_walk_nonexistent,
                   &opts);
+    qos_add_test("synth/walk/2nd_non_existent", "virtio-9p",
+                 fs_walk_2nd_nonexistent, &opts);
     qos_add_test("synth/lopen/basic", "virtio-9p", fs_lopen,  &opts);
     qos_add_test("synth/write/basic", "virtio-9p", fs_write,  &opts);
     qos_add_test("synth/flush/success", "virtio-9p", fs_flush_success,
-- 
2.30.2


