Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63601296E01
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 13:56:09 +0200 (CEST)
Received: from localhost ([::1]:40584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVvg0-0006e4-Ch
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 07:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <127710a7492e53b241083831e11ba25b50fcaa8d@lizzy.crudebyte.com>)
 id 1kVvYv-0004w8-WE
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 07:48:50 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:40993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <127710a7492e53b241083831e11ba25b50fcaa8d@lizzy.crudebyte.com>)
 id 1kVvYs-0004QQ-48
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 07:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=RRYV2V8efYiYdm3SDBKXqfdnY+J0tgfzztDfqmMM+x4=; b=VYTfi
 8nc6rel42IHfm6AO1PIxU9rUXzuz7ws8oVJdvVxlQzwiV9D/py/1FTeh8nKs1tUfGsXbLCWFNZcJn
 bxQcWELQNZ6x+EKDVJPxvDObUngvihscGAulHWE0+pXsME/Tz+ibFjsMQR4TXvn0kbyy96uMFgibP
 GWexIYMfcQzmAGHt8qcnYJBa+n7X7HbxgOwU+ICjeG1Br39cXb4V2D8P0EruFWwrZlghBI3vnOsYk
 AKWlO6aLRmckTk/zXSagKuxCbsQjHS3ovJGaIrBaSl7WrpTAOHDq/R5vZPI6LoqZ/K3Kqv0eVGbfV
 qbH67fyEuq6076/y0UwHQY9kD1b7w==;
Message-Id: <127710a7492e53b241083831e11ba25b50fcaa8d.1603452058.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1603452058.git.qemu_oss@crudebyte.com>
References: <cover.1603452058.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 21 Oct 2020 14:36:23 +0200
Subject: [PULL 11/13] tests/9pfs: add local Tunlinkat symlink test
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=127710a7492e53b241083831e11ba25b50fcaa8d@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 07:46:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

This test case uses a Tunlinkat request to remove a symlink using
the 9pfs 'local' fs driver.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <a23cd4d2ab6d8d3048addab8cbf0416fe5ead43e.1603285620.git.qemu_oss@crudebyte.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 0c11417236..33cba24b18 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1295,6 +1295,32 @@ static void fs_symlink_file(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(real_file);
 }
 
+static void fs_unlinkat_symlink(void *obj, void *data,
+                                QGuestAllocator *t_alloc)
+{
+    QVirtio9P *v9p = obj;
+    alloc = t_alloc;
+    struct stat st;
+    char *real_file = virtio_9p_test_path("06/real_file");
+    char *symlink_file = virtio_9p_test_path("06/symlink_file");
+
+    do_attach(v9p);
+    do_mkdir(v9p, "/", "06");
+    do_lcreate(v9p, "06", "real_file");
+    g_assert(stat(real_file, &st) == 0);
+    g_assert((st.st_mode & S_IFMT) == S_IFREG);
+
+    do_symlink(v9p, "06", "symlink_file", "real_file");
+    g_assert(stat(symlink_file, &st) == 0);
+
+    do_unlinkat(v9p, "06", "symlink_file", 0);
+    /* symlink should be gone now */
+    g_assert(stat(symlink_file, &st) != 0);
+
+    g_free(symlink_file);
+    g_free(real_file);
+}
+
 static void *assign_9p_local_driver(GString *cmd_line, void *arg)
 {
     virtio_9p_assign_local_driver(cmd_line, "security_model=mapped-xattr");
@@ -1339,6 +1365,8 @@ static void register_virtio_9p_test(void)
     qos_add_test("local/create_file", "virtio-9p", fs_create_file, &opts);
     qos_add_test("local/unlinkat_file", "virtio-9p", fs_unlinkat_file, &opts);
     qos_add_test("local/symlink_file", "virtio-9p", fs_symlink_file, &opts);
+    qos_add_test("local/unlinkat_symlink", "virtio-9p", fs_unlinkat_symlink,
+                 &opts);
 }
 
 libqos_init(register_virtio_9p_test);
-- 
2.20.1


