Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFDA4D39A3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 20:14:42 +0100 (CET)
Received: from localhost ([::1]:53776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS1li-0002Mb-0z
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 14:14:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <51e7f12fad3f36ce166e2f6e415784b13c4df5c4@lizzy.crudebyte.com>)
 id 1nS1jx-00011Q-Mr
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:12:53 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:37147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <51e7f12fad3f36ce166e2f6e415784b13c4df5c4@lizzy.crudebyte.com>)
 id 1nS1jw-0004jp-6A
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=LLaVFJXt6ye6hukG82NJJ1PyuRvSgPlK/UTJCur82V0=; b=eea5d
 MrY7wnzu2+43AZNa0NZ/a+tu9ny7uvet3NwOhBLA/Q7Cevon7C/WytxXOFIv1Fri4nactiCnCd+Jq
 g8saYMwUyVKjEhldbvjiilHF2xWhDObN7Unz6gS1yPJK/k9o15+rAHW/gQD6dEb9FVKm5nCnRLuz5
 XvtF9I32YQXKpeO/9Gs6ev39LvVh8+LOlpi96QMJP7mh1buqk8hioXNIPn/eY9kNrGtGxLm6GXA17
 nwC0uIp2zlqose/9OfRiV1CDe1ubLPHpxOg0vu4rXVjfoLOPEwZLpGdCJXs692j3FF9ainqyQRXEf
 ixWKrPlTKJOKt2dT3ANkw4GcyGgMg==;
Message-Id: <51e7f12fad3f36ce166e2f6e415784b13c4df5c4.1646850707.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646850707.git.qemu_oss@crudebyte.com>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 9 Mar 2022 19:21:18 +0100
Subject: [PATCH 6/6] tests/9pfs: guard recent 'Twalk' behaviour fix
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=51e7f12fad3f36ce166e2f6e415784b13c4df5c4@lizzy.crudebyte.com;
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
---
 tests/qtest/virtio-9p-test.c | 42 +++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 9098e21173..f29de1ca64 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -638,8 +638,12 @@ static void do_version(QVirtio9P *v9p)
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
@@ -649,12 +653,18 @@ static uint32_t do_walk(QVirtio9P *v9p, const char *path)
 
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
@@ -1048,9 +1058,33 @@ static void fs_walk_nonexistent(void *obj, void *data, QGuestAllocator *t_alloc)
     alloc = t_alloc;
 
     do_attach(v9p);
+    /*
+     * The 9p2000 protocol spec sais: "If the first element cannot be walked
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
+     * The 9p2000 protocol spec sais: "nwqid is therefore either nwname or the
+     * index of the first elementwise walk that failed."
+     */
+    assert(nwqid == 1);
+}
+
 static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
@@ -1531,6 +1565,8 @@ static void register_virtio_9p_test(void)
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


