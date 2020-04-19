Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2261C1AFBEB
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Apr 2020 18:23:52 +0200 (CEST)
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQCjX-0001xl-7Z
	for lists+qemu-devel@lfdr.de; Sun, 19 Apr 2020 12:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41242 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eedba1df29df6d0a13fec0c6ea9d751f0362995b@lizzy.crudebyte.com>)
 id 1jQCiJ-0001F1-Eb
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 12:22:35 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eedba1df29df6d0a13fec0c6ea9d751f0362995b@lizzy.crudebyte.com>)
 id 1jQCiI-0000AS-UR
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 12:22:35 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:41945)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <eedba1df29df6d0a13fec0c6ea9d751f0362995b@lizzy.crudebyte.com>)
 id 1jQCiI-0007ux-AD
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 12:22:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=IezmcX2Zz1GFPAfr+8apNBJ7XzlcmwBnC7ZbeGtNK9Q=; b=c0kJI
 tpZMNIAU3AuNWTHz0ImVS87Dsv5GGt6qS578y04kpjJx1Fr9CMxDEFZqRcQrk8nnsPldr2HuPB2VG
 fOHJ+mIFnyqJ42YtbCtLTU8Yddhnt6S0kNr2ue2D3gw4RizwZ5SEx5J7FFiN6l0fvTOeNfUulT31O
 rEBQTaTimztBlzLhztATRcT3spThPRfZyGUfecRr221s+GpH0zgoba+/xeEpfjgwUzulFii+ywVZX
 TlNX1Wpn+La8S8EqQjPwV+AF2ynkzdYcUaT74DcwrjDnaFYDXPKImsznjA737EBKhG2dMz6qL2iQa
 inruYb0fjQbp6CT2N0qJ3d9UeaAnw==;
Message-Id: <eedba1df29df6d0a13fec0c6ea9d751f0362995b.1587309014.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1587309014.git.qemu_oss@crudebyte.com>
References: <cover.1587309014.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 19 Apr 2020 17:00:06 +0200
Subject: [PATCH v6 1/5] tests/virtio-9p: added split readdir tests
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=eedba1df29df6d0a13fec0c6ea9d751f0362995b@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs1p.gnu.org: Linux 3.11 and newer
X-Received-From: 91.194.90.13
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous, already existing 'basic' readdir test simply used a
'count' parameter big enough to retrieve all directory entries with a
single Treaddir request.

In the 3 new 'split' readdir tests added by this patch, directory
entries are retrieved, split over several Treaddir requests by picking
small 'count' parameters which force the server to truncate the
response. So the test client sends as many Treaddir requests as
necessary to get all directory entries.

The following 3 new tests are added (executed in this sequence):

1. Split readdir test with count=512
2. Split readdir test with count=256
3. Split readdir test with count=128

This test case sequence is chosen because the smaller the 'count' value,
the higher the chance of errors in case of implementation bugs on server
side.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 108 +++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 2167322985..de30b717b6 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -578,6 +578,7 @@ static bool fs_dirents_contain_name(struct V9fsDirent *e, const char* name)
     return false;
 }
 
+/* basic readdir test where reply fits into a single response message */
 static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
@@ -631,6 +632,89 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(wnames[0]);
 }
 
+/* readdir test where overall request is split over several messages */
+static void fs_readdir_split(void *obj, void *data, QGuestAllocator *t_alloc,
+                             uint32_t count)
+{
+    QVirtio9P *v9p = obj;
+    alloc = t_alloc;
+    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
+    uint16_t nqid;
+    v9fs_qid qid;
+    uint32_t nentries, npartialentries;
+    struct V9fsDirent *entries, *tail, *partialentries;
+    P9Req *req;
+    int fid;
+    uint64_t offset;
+
+    fs_attach(v9p, NULL, t_alloc);
+
+    fid = 1;
+    offset = 0;
+    entries = NULL;
+    nentries = 0;
+    tail = NULL;
+
+    req = v9fs_twalk(v9p, 0, fid, 1, wnames, 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rwalk(req, &nqid, NULL);
+    g_assert_cmpint(nqid, ==, 1);
+
+    req = v9fs_tlopen(v9p, fid, O_DIRECTORY, 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rlopen(req, &qid, NULL);
+
+    /*
+     * send as many Treaddir requests as required to get all directory
+     * entries
+     */
+    while (true) {
+        npartialentries = 0;
+        partialentries = NULL;
+
+        req = v9fs_treaddir(v9p, fid, offset, count, 0);
+        v9fs_req_wait_for_reply(req, NULL);
+        v9fs_rreaddir(req, &count, &npartialentries, &partialentries);
+        if (npartialentries > 0 && partialentries) {
+            if (!entries) {
+                entries = partialentries;
+                nentries = npartialentries;
+                tail = partialentries;
+            } else {
+                tail->next = partialentries;
+                nentries += npartialentries;
+            }
+            while (tail->next) {
+                tail = tail->next;
+            }
+            offset = tail->offset;
+        } else {
+            break;
+        }
+    }
+
+    g_assert_cmpint(
+        nentries, ==,
+        QTEST_V9FS_SYNTH_READDIR_NFILES + 2 /* "." and ".." */
+    );
+
+    /*
+     * Check all file names exist in returned entries, ignore their order
+     * though.
+     */
+    g_assert_cmpint(fs_dirents_contain_name(entries, "."), ==, true);
+    g_assert_cmpint(fs_dirents_contain_name(entries, ".."), ==, true);
+    for (int i = 0; i < QTEST_V9FS_SYNTH_READDIR_NFILES; ++i) {
+        char *name = g_strdup_printf(QTEST_V9FS_SYNTH_READDIR_FILE, i);
+        g_assert_cmpint(fs_dirents_contain_name(entries, name), ==, true);
+        g_free(name);
+    }
+
+    v9fs_free_dirents(entries);
+
+    g_free(wnames[0]);
+}
+
 static void fs_walk_no_slash(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
@@ -793,6 +877,24 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(wnames[0]);
 }
 
+static void fs_readdir_split_128(void *obj, void *data,
+                                 QGuestAllocator *t_alloc)
+{
+    fs_readdir_split(obj, data, t_alloc, 128);
+}
+
+static void fs_readdir_split_256(void *obj, void *data,
+                                 QGuestAllocator *t_alloc)
+{
+    fs_readdir_split(obj, data, t_alloc, 256);
+}
+
+static void fs_readdir_split_512(void *obj, void *data,
+                                 QGuestAllocator *t_alloc)
+{
+    fs_readdir_split(obj, data, t_alloc, 512);
+}
+
 static void register_virtio_9p_test(void)
 {
     qos_add_test("config", "virtio-9p", pci_config, NULL);
@@ -810,6 +912,12 @@ static void register_virtio_9p_test(void)
     qos_add_test("fs/flush/ignored", "virtio-9p", fs_flush_ignored,
                  NULL);
     qos_add_test("fs/readdir/basic", "virtio-9p", fs_readdir, NULL);
+    qos_add_test("fs/readdir/split_512", "virtio-9p",
+                 fs_readdir_split_512, NULL);
+    qos_add_test("fs/readdir/split_256", "virtio-9p",
+                 fs_readdir_split_256, NULL);
+    qos_add_test("fs/readdir/split_128", "virtio-9p",
+                 fs_readdir_split_128, NULL);
 }
 
 libqos_init(register_virtio_9p_test);
-- 
2.20.1


