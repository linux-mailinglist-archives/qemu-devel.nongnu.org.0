Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99DE32791F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:24:39 +0100 (CET)
Received: from localhost ([::1]:57640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdr4-0003jb-Ol
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lGdoi-0001YZ-NL
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:22:13 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lGdof-0005Xy-Oo
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:22:12 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DptW10QlzzjSlK;
 Mon,  1 Mar 2021 16:20:45 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Mar 2021 16:21:59 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: David Edmondson <dme@dme.org>, Juan Quintela <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v2 3/3] migration/ram: Optimize ram_save_host_page()
Date: Mon, 1 Mar 2021 16:21:32 +0800
Message-ID: <20210301082132.1107-4-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210301082132.1107-1-jiangkunkun@huawei.com>
References: <20210301082132.1107-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=jiangkunkun@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Starting from pss->page, ram_save_host_page() will check every page
and send the dirty pages up to the end of the current host page or
the boundary of used_length of the block. If the host page size is
a huge page, the step "check" will take a lot of time.

This will improve performance to use migration_bitmap_find_dirty().

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 migration/ram.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 3a9115b6dc..a1374db356 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1991,6 +1991,8 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
     int tmppages, pages = 0;
     size_t pagesize_bits =
         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
+    unsigned long hostpage_boundary =
+        QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
     unsigned long start_page = pss->page;
     int res;
 
@@ -2002,7 +2004,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
     do {
         /* Check the pages is dirty and if it is send it */
         if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
-            pss->page++;
+            pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
             continue;
         }
 
@@ -2012,16 +2014,16 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
         }
 
         pages += tmppages;
-        pss->page++;
+        pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
         /* Allow rate limiting to happen in the middle of huge pages */
         if (pagesize_bits > 1) {
             migration_rate_limit();
         }
-    } while ((pss->page & (pagesize_bits - 1)) &&
+    } while ((pss->page < hostpage_boundary) &&
              offset_in_ramblock(pss->block,
                                 ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
-    /* The offset we leave with is the last one we looked at */
-    pss->page--;
+    /* The offset we leave with is the min boundary of host page and block */
+    pss->page = MIN(pss->page, hostpage_boundary) - 1;
 
     res = ram_save_release_protection(rs, pss, start_page);
     return (res < 0 ? res : pages);
-- 
2.23.0


