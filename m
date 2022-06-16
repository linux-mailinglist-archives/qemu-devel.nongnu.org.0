Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508C54E00B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:30:47 +0200 (CEST)
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1ni1-0001pu-2S
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <15fbff488a908af01210071ffad70f9254d077fc@lizzy.crudebyte.com>)
 id 1o1nLz-0007PF-Pi
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:08:00 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:44189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <15fbff488a908af01210071ffad70f9254d077fc@lizzy.crudebyte.com>)
 id 1o1nLy-0003PD-7g
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=5ximnrdjmuNJ7F+rLu47YcLj79K0sHNt06kxYGAEflc=; b=eszYi
 ZrpLopVp3VpNceFwWSxzx55TxjzZXSWrrcGCdytTgLgdaZ1nwrzlHiHLh1ZcvD/wicJuRdfRlIFT/
 LknBJV+D1I6FtV6mqApjX4DQ9kku1Yv/D4ZFTs8q195A/IIRNpbtFJL8ZJHs+g664svaXPn1D5r5+
 2EmNVbs8QfkXZQ22PpKnAMT+d9RHY1x7xxjDm/kTsnOrdJLLnaAVuUHCSVs6uMGMPFqWCmUjQ45a9
 KKDpg8Zoe4R5GwYUBHVb4e35SFZn4XduNWAVrEs/6RmBOkEa+l7rjuzXJBiSh075bggY9dM4bffRf
 fngBsiQEZtihwzZ53lHpZ0b++4BGg==;
Message-Id: <15fbff488a908af01210071ffad70f9254d077fc.1655377203.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1655377203.git.qemu_oss@crudebyte.com>
References: <cover.1655377203.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 16 Jun 2022 13:00:04 +0200
Subject: [PULL 6/7] tests/9pfs: guard recent 'Twalk' behaviour fix
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=15fbff488a908af01210071ffad70f9254d077fc@lizzy.crudebyte.com;
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
Message-Id: <61bde2f44b87e24b70ec098dfb81765665b2dfcb.1647339025.git.qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 42 +++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 3c0f094929..c787ded4d2 100644
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


