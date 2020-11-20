Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C7B2BA54B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 09:57:50 +0100 (CET)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg2Eo-0000td-2b
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 03:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kg2AQ-0005p2-Ex; Fri, 20 Nov 2020 03:53:18 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kg2AN-0001Uj-Oh; Fri, 20 Nov 2020 03:53:17 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ccr0W0Yh1zhdXB;
 Fri, 20 Nov 2020 16:52:43 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Fri, 20 Nov 2020 16:52:52 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>
Subject: [RFC PATCH 2/2] ramlist: Resize dirty bitmap blocks after remove
 ramblock
Date: Fri, 20 Nov 2020 16:51:57 +0800
Message-ID: <20201120085157.7136-3-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20201120085157.7136-1-zhukeqian1@huawei.com>
References: <20201120085157.7136-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new "dirty_bitmap_resize" interface to reduce dirty bitmap
blocks after we remove a ramblock from ramlist.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 softmmu/physmem.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index f6ff78378e..2a17e0a89a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2131,6 +2131,8 @@ static void reclaim_ramblock(RAMBlock *block)
 
 void qemu_ram_free(RAMBlock *block)
 {
+    ram_addr_t old_ram_size, new_ram_size;
+
     if (!block) {
         return;
     }
@@ -2140,12 +2142,18 @@ void qemu_ram_free(RAMBlock *block)
     }
 
     qemu_mutex_lock_ramlist();
+
+    old_ram_size = last_ram_page();
     QLIST_REMOVE_RCU(block, next);
+    new_ram_size = last_ram_page();
+    dirty_bitmap_resize(old_ram_size, new_ram_size);
+
     ram_list.mru_block = NULL;
     /* Write list before version */
     smp_wmb();
     ram_list.version++;
     call_rcu(block, reclaim_ramblock, rcu);
+
     qemu_mutex_unlock_ramlist();
 }
 
-- 
2.23.0


