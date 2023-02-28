Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463D96A5AC8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:26:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0vi-0007be-NJ; Tue, 28 Feb 2023 09:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pX0vB-0007NC-Tm
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:25:44 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pX0v6-00049k-8V
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:25:35 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PR02v61vhz9tDV;
 Tue, 28 Feb 2023 22:23:19 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Feb 2023 22:25:17 +0800
To: <pbonzini@redhat.com>, <peterx@redhat.com>, <david@redhat.com>,
 <philmd@linaro.org>, <mst@redhat.com>, <jasowang@redhat.com>
CC: <qemu-devel@nongnu.org>, <eperezma@redhat.com>, <arei.gonglei@huawei.com>, 
 <yechuan@huawei.com>, Longpeng <longpeng2@huawei.com>
Subject: [PATCH] memory: avoid unnecessary iteration when updating ioeventfds
Date: Tue, 28 Feb 2023 22:25:14 +0800
Message-ID: <20230228142514.2582-1-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Longpeng <longpeng2@huawei.com>

When updating ioeventfds, we need to iterate all address spaces and
iterate all flat ranges of each address space. There is so much
redundant process that a FlatView would be iterated for so many times
during one commit (memory_region_transaction_commit).

We can mark a FlatView as UPDATED and then skip it in the next iteration
and clear the UPDATED flag at the end of the commit. The overhead can
be significantly reduced.

For example, a VM with 16 vdpa net devices and each one has 65 vectors,
can reduce the time spent on memory_region_transaction_commit by 95%.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 include/exec/memory.h |  2 ++
 softmmu/memory.c      | 28 +++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 2e602a2fad..974eabf765 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1093,6 +1093,8 @@ struct FlatView {
     unsigned nr_allocated;
     struct AddressSpaceDispatch *dispatch;
     MemoryRegion *root;
+#define FLATVIEW_FLAG_IOEVENTFD_UPDATED (1 << 0)
+    unsigned flags;
 };
 
 static inline FlatView *address_space_to_flatview(AddressSpace *as)
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9d64efca26..71ff996712 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -815,6 +815,15 @@ FlatView *address_space_get_flatview(AddressSpace *as)
     return view;
 }
 
+static void address_space_reset_view_flags(AddressSpace *as, unsigned mask)
+{
+    FlatView *view = address_space_get_flatview(as);
+
+    if (view->flags & mask) {
+        view->flags &= ~mask;
+    }
+}
+
 static void address_space_update_ioeventfds(AddressSpace *as)
 {
     FlatView *view;
@@ -825,6 +834,12 @@ static void address_space_update_ioeventfds(AddressSpace *as)
     AddrRange tmp;
     unsigned i;
 
+    view = address_space_get_flatview(as);
+    if (view->flags & FLATVIEW_FLAG_IOEVENTFD_UPDATED) {
+        return;
+    }
+    view->flags |= FLATVIEW_FLAG_IOEVENTFD_UPDATED;
+
     /*
      * It is likely that the number of ioeventfds hasn't changed much, so use
      * the previous size as the starting value, with some headroom to avoid
@@ -833,7 +848,6 @@ static void address_space_update_ioeventfds(AddressSpace *as)
     ioeventfd_max = QEMU_ALIGN_UP(as->ioeventfd_nb, 4);
     ioeventfds = g_new(MemoryRegionIoeventfd, ioeventfd_max);
 
-    view = address_space_get_flatview(as);
     FOR_EACH_FLAT_RANGE(fr, view) {
         for (i = 0; i < fr->mr->ioeventfd_nb; ++i) {
             tmp = addrrange_shift(fr->mr->ioeventfds[i].addr,
@@ -1086,6 +1100,15 @@ void memory_region_transaction_begin(void)
     ++memory_region_transaction_depth;
 }
 
+static inline void address_space_update_ioeventfds_finish(void)
+{
+    AddressSpace *as;
+
+    QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
+        address_space_reset_view_flags(as, FLATVIEW_FLAG_IOEVENTFD_UPDATED);
+    }
+}
+
 void memory_region_transaction_commit(void)
 {
     AddressSpace *as;
@@ -1106,12 +1129,14 @@ void memory_region_transaction_commit(void)
             }
             memory_region_update_pending = false;
             ioeventfd_update_pending = false;
+            address_space_update_ioeventfds_finish();
             MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
         } else if (ioeventfd_update_pending) {
             QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
                 address_space_update_ioeventfds(as);
             }
             ioeventfd_update_pending = false;
+            address_space_update_ioeventfds_finish();
         }
    }
 }
@@ -3076,6 +3101,7 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
     as->name = g_strdup(name ? name : "anonymous");
     address_space_update_topology(as);
     address_space_update_ioeventfds(as);
+    address_space_reset_view_flags(as, FLATVIEW_FLAG_IOEVENTFD_UPDATED);
 }
 
 static void do_address_space_destroy(AddressSpace *as)
-- 
2.23.0


