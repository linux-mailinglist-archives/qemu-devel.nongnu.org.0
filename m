Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EDC165F01
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 14:42:26 +0100 (CET)
Received: from localhost ([::1]:42408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4m5y-0007z9-0r
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 08:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j4m50-0007Qk-30
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 08:41:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j4m4y-00080n-Sz
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 08:41:25 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3239 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j4m4y-0007pi-He; Thu, 20 Feb 2020 08:41:24 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CABEFBD4CB1A8257D996;
 Thu, 20 Feb 2020 21:41:14 +0800 (CST)
Received: from HGHY4C002233111.china.huawei.com (10.133.205.93) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Thu, 20 Feb 2020 21:41:07 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2] test-vmstate: Fix memleaks in test_load_qlist
Date: Thu, 20 Feb 2020 21:41:03 +0800
Message-ID: <20200220134103.26224-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: thuth@redhat.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 qemu-trivial@nongnu.org, dgilbert@redhat.com,
 Chen Qun <kuhn.chenqun@huawei.com>, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

There is memleak in test_load_qlist().It's not a big deal,
but test-vmstate will fail if sanitizers is enabled.

In addition, "ret" is written twice with the same value
 in test_gtree_load_iommu().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
 tests/test-vmstate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
index cea363dd69..f7b3868881 100644
--- a/tests/test-vmstate.c
+++ b/tests/test-vmstate.c
@@ -1241,7 +1241,6 @@ static void test_gtree_load_iommu(void)
     TestGTreeIOMMU *orig_iommu = create_iommu();
     QEMUFile *fsave, *fload;
     char eof;
-    int ret;
 
     fsave = open_test_file(true);
     qemu_put_buffer(fsave, iommu_dump, sizeof(iommu_dump));
@@ -1250,10 +1249,8 @@ static void test_gtree_load_iommu(void)
 
     fload = open_test_file(false);
     vmstate_load_state(fload, &vmstate_iommu, dest_iommu, 1);
-    ret = qemu_file_get_error(fload);
     eof = qemu_get_byte(fload);
-    ret = qemu_file_get_error(fload);
-    g_assert(!ret);
+    g_assert(!qemu_file_get_error(fload));
     g_assert_cmpint(orig_iommu->id, ==, dest_iommu->id);
     g_assert_cmpint(eof, ==, QEMU_VM_EOF);
 
@@ -1395,6 +1392,7 @@ static void test_load_qlist(void)
     compare_containers(orig_container, dest_container);
     free_container(orig_container);
     free_container(dest_container);
+    qemu_fclose(fload);
 }
 
 typedef struct TmpTestStruct {
-- 
2.23.0



