Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363EF294D8B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 15:32:15 +0200 (CEST)
Received: from localhost ([::1]:53978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVEDu-0005Jp-7m
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 09:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <9bec33a7d8f006ef8f80517985d0d6ac48650d53@lizzy.crudebyte.com>)
 id 1kVE5g-0004DS-Cp
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:23:44 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:47749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <9bec33a7d8f006ef8f80517985d0d6ac48650d53@lizzy.crudebyte.com>)
 id 1kVE5e-0003Z0-NJ
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:23:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=Akr9UuK1L3lZF7Xsio4Ln5H3B2b/JHGraEuk31vJZJw=; b=QY17O
 RFPmIPvL7OCpaydWsKOCfUdarMtH3Icmf3GFi/8ElOP6vbmNCWyyvgqYjZJrp8z6KBDOzQwgK9tjz
 Gj1x6lc4XewN2NNaeYykAwQoJ6td9xoSXuiUtCsYfD67Su6nuU7B7Fp3O7Uk3HngTDS9dmsew0eOH
 8xCDftr8dooj+v1REmHLqvS4UErkkDcf4MQW1iRURdIH3h/mtIzTIejxqtz7PaKanByiMr0QmejGx
 dWChq6npqhxt3Pn4VutQ/4LDWwWmPBS7AAonC7THHxDd0Tk7dN/lBUQuI74kATnQR/oHYbniAZIAK
 jTRkgboXdI2mnh+49XaP8Yms8GWjQ==;
Message-Id: <9bec33a7d8f006ef8f80517985d0d6ac48650d53.1603285620.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1603285620.git.qemu_oss@crudebyte.com>
References: <cover.1603285620.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 21 Oct 2020 14:55:46 +0200
Subject: [PATCH v2 8/8] tests/9pfs: add local Tunlinkat hard link test
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=9bec33a7d8f006ef8f80517985d0d6ac48650d53@lizzy.crudebyte.com;
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

This test case uses a Tunlinkat request to remove a previously hard
linked file by using the 9pfs 'local' fs driver.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 460fa49fe3..23433913bb 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1391,6 +1391,34 @@ static void fs_hardlink_file(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(real_file);
 }
 
+static void fs_unlinkat_hardlink(void *obj, void *data,
+                                 QGuestAllocator *t_alloc)
+{
+    QVirtio9P *v9p = obj;
+    alloc = t_alloc;
+    struct stat st_real, st_link;
+    char *real_file = virtio_9p_test_path("08/real_file");
+    char *hardlink_file = virtio_9p_test_path("08/hardlink_file");
+
+    do_attach(v9p);
+    do_mkdir(v9p, "/", "08");
+    do_lcreate(v9p, "08", "real_file");
+    g_assert(stat(real_file, &st_real) == 0);
+    g_assert((st_real.st_mode & S_IFMT) == S_IFREG);
+
+    do_hardlink(v9p, "08", "hardlink_file", "08/real_file");
+    g_assert(stat(hardlink_file, &st_link) == 0);
+
+    do_unlinkat(v9p, "08", "hardlink_file", 0);
+    /* symlink should be gone now */
+    g_assert(stat(hardlink_file, &st_link) != 0);
+    /* and old file should still exist */
+    g_assert(stat(real_file, &st_real) == 0);
+
+    g_free(hardlink_file);
+    g_free(real_file);
+}
+
 static void *assign_9p_local_driver(GString *cmd_line, void *arg)
 {
     virtio_9p_assign_local_driver(cmd_line, "security_model=mapped-xattr");
@@ -1438,6 +1466,8 @@ static void register_virtio_9p_test(void)
     qos_add_test("local/unlinkat_symlink", "virtio-9p", fs_unlinkat_symlink,
                  &opts);
     qos_add_test("local/hardlink_file", "virtio-9p", fs_hardlink_file, &opts);
+    qos_add_test("local/unlinkat_hardlink", "virtio-9p", fs_unlinkat_hardlink,
+                 &opts);
 }
 
 libqos_init(register_virtio_9p_test);
-- 
2.20.1


