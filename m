Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E175D29321C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 01:45:39 +0200 (CEST)
Received: from localhost ([::1]:51252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUeqQ-0005An-Uw
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 19:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a4e89602a5afdfa882257ffb6490b8eaab1dfe66@lizzy.crudebyte.com>)
 id 1kUejs-0006u2-Uu
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 19:38:52 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:39643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a4e89602a5afdfa882257ffb6490b8eaab1dfe66@lizzy.crudebyte.com>)
 id 1kUejr-0002QN-Dp
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 19:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=6n/i/C1rDejh9fjH3REhKBGgVYhUsuDkA5GQDhv4UI0=; b=jRl4S
 oWPYaSBOfeJL5Lt00O+Vs8lAyFBfsHP2NlX/tC0AqpaZkGC9ViqodBbHje4KaMdWInhYnrviB/HA9
 lcFznYPBkqHsJ/KeU5DC9DIUZuo3tX406+wqoZn1Bcbzlgo48qBSVDakk4bs6x6bLyhQtICgVwO6f
 scK3JxeWxDaHZNWuYecPfi1+zFCZ06zkKhHb/ydBwKpC2apCcLbCiLUHRHyfum7NQm7qtSK+TbGWG
 cC2XqPBurdyqnzNq7olqknCHuEq2QipJwaT0vy22rvPfSmEx0kurAsXEZYQmLdlf2VwD3uLKXBLH8
 Yhf2C3NIFd2GhRZzUsg7M0EKeS0FA==;
Message-Id: <a4e89602a5afdfa882257ffb6490b8eaab1dfe66.1603149434.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1603149434.git.qemu_oss@crudebyte.com>
References: <cover.1603149434.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 20 Oct 2020 01:13:24 +0200
Subject: [PATCH 4/8] tests/9pfs: add local unlinkat file test
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a4e89602a5afdfa882257ffb6490b8eaab1dfe66@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 19:37:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

This test case uses a Tunlinkat request to remove a regular file using
the 9pfs 'local' fs driver.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 1b133f52bd..06a9f10d34 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1194,6 +1194,28 @@ static void fs_create_file(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(new_file);
 }
 
+static void fs_unlinkat_file(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVirtio9P *v9p = obj;
+    struct stat st;
+    char *new_file = virtio_9p_test_path("04/doa_file");
+
+    fs_attach(v9p, NULL, t_alloc);
+    fs_mkdir(v9p, data, t_alloc, "/", "04");
+    fs_lcreate(v9p, data, t_alloc, "04", "doa_file");
+
+    /* check if created file exists now ... */
+    g_assert(stat(new_file, &st) == 0);
+    /* ... and is a regular file */
+    g_assert((st.st_mode & S_IFMT) == S_IFREG);
+
+    fs_unlinkat(v9p, data, t_alloc, "04", "doa_file", 0);
+    /* file should be gone now */
+    g_assert(stat(new_file, &st) != 0);
+
+    g_free(new_file);
+}
+
 static void *assign_9p_local_driver(GString *cmd_line, void *arg)
 {
     virtio_9p_assign_local_driver(cmd_line, "security_model=mapped-xattr");
@@ -1236,6 +1258,7 @@ static void register_virtio_9p_test(void)
     qos_add_test("local/create_dir", "virtio-9p", fs_create_dir, &opts);
     qos_add_test("local/unlinkat_dir", "virtio-9p", fs_unlinkat_dir, &opts);
     qos_add_test("local/create_file", "virtio-9p", fs_create_file, &opts);
+    qos_add_test("local/unlinkat_file", "virtio-9p", fs_unlinkat_file, &opts);
 }
 
 libqos_init(register_virtio_9p_test);
-- 
2.20.1


