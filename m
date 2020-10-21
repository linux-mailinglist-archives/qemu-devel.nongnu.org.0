Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39379294D74
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 15:25:31 +0200 (CEST)
Received: from localhost ([::1]:34152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVE7O-0004tN-5K
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 09:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <4eabeed7f662721dd5664cb77fe36ea0aa08b1ec@lizzy.crudebyte.com>)
 id 1kVE5H-0003DH-Ew
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:23:19 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:40655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <4eabeed7f662721dd5664cb77fe36ea0aa08b1ec@lizzy.crudebyte.com>)
 id 1kVE5F-0003XE-Tt
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=W7iYAoERptWBWAbC1eeAwkwTLmJrWJ4gAtPJthWD3vY=; b=S0WVf
 Fmjubi8f+tfSPPOmzd0WeUd/PRmU1ytGmeUbJxsFhe/1denWWkpLXxiN0dpzhi9uJ4YxGnnKMCSdx
 kr3a70l2qsEMWeeBht5Mftgodj+izmVQADrxQ6ZJcCD2qDKflWUCzrdEB21A7MPpT/fZ3R0aD6kDK
 PXq0MfwdtNbOicmnI+9uyH/qINxt3TsJIaPkE3wfwtK1tqZudyKPiV+W9Lu8ua/YVyklgY8uz97fU
 i54mvvO8lQO5aI1fpyF6LnZkpN1MzaC+re5w7ieUtaNDpXUy4WnvOzaIGyEZzZEo3j6YCtbBrYR4x
 kkmsYlOkjLjRgUFl+tIHhy8Ewnfww==;
Message-Id: <4eabeed7f662721dd5664cb77fe36ea0aa08b1ec.1603285620.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1603285620.git.qemu_oss@crudebyte.com>
References: <cover.1603285620.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 21 Oct 2020 14:28:37 +0200
Subject: [PATCH v2 4/8] tests/9pfs: add local Tunlinkat file test
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=4eabeed7f662721dd5664cb77fe36ea0aa08b1ec@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 09:21:52
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
 tests/qtest/virtio-9p-test.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index c030bc2a6c..6b74a1fd7e 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1196,6 +1196,29 @@ static void fs_create_file(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(new_file);
 }
 
+static void fs_unlinkat_file(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVirtio9P *v9p = obj;
+    alloc = t_alloc;
+    struct stat st;
+    char *new_file = virtio_9p_test_path("04/doa_file");
+
+    do_attach(v9p);
+    do_mkdir(v9p, "/", "04");
+    do_lcreate(v9p, "04", "doa_file");
+
+    /* check if created file exists now ... */
+    g_assert(stat(new_file, &st) == 0);
+    /* ... and is a regular file */
+    g_assert((st.st_mode & S_IFMT) == S_IFREG);
+
+    do_unlinkat(v9p, "04", "doa_file", 0);
+    /* file should be gone now */
+    g_assert(stat(new_file, &st) != 0);
+
+    g_free(new_file);
+}
+
 static void *assign_9p_local_driver(GString *cmd_line, void *arg)
 {
     virtio_9p_assign_local_driver(cmd_line, "security_model=mapped-xattr");
@@ -1238,6 +1261,7 @@ static void register_virtio_9p_test(void)
     qos_add_test("local/create_dir", "virtio-9p", fs_create_dir, &opts);
     qos_add_test("local/unlinkat_dir", "virtio-9p", fs_unlinkat_dir, &opts);
     qos_add_test("local/create_file", "virtio-9p", fs_create_file, &opts);
+    qos_add_test("local/unlinkat_file", "virtio-9p", fs_unlinkat_file, &opts);
 }
 
 libqos_init(register_virtio_9p_test);
-- 
2.20.1


