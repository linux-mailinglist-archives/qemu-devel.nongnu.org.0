Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5443332241A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 03:21:55 +0100 (CET)
Received: from localhost ([::1]:52406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lENKk-0004pi-Cn
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 21:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lENGt-0001ul-Ob
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 21:17:55 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lENGs-0006Um-15
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 21:17:55 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dl2j20fP0zjRL8;
 Tue, 23 Feb 2021 10:16:06 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Feb 2021 10:17:29 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH 1/3] migration/ram: Modify the code comment of
 ram_save_host_page()
Date: Tue, 23 Feb 2021 10:16:43 +0800
Message-ID: <20210223021646.500-2-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210223021646.500-1-jiangkunkun@huawei.com>
References: <20210223021646.500-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=jiangkunkun@huawei.com; helo=szxga05-in.huawei.com
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ram_save_host_page() has been modified several times
since its birth. But the comment hasn't been modified as it should
be. It'd better to modify the comment to explain ram_save_host_page()
more clearly.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 migration/ram.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 72143da0ac..fc49c3f898 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1970,15 +1970,16 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
 }
 
 /**
- * ram_save_host_page: save a whole host page
+ * ram_save_host_page: save a whole host page or the rest of a block
  *
- * Starting at *offset send pages up to the end of the current host
- * page. It's valid for the initial offset to point into the middle of
- * a host page in which case the remainder of the hostpage is sent.
- * Only dirty target pages are sent. Note that the host page size may
- * be a huge page for this block.
- * The saving stops at the boundary of the used_length of the block
- * if the RAMBlock isn't a multiple of the host page size.
+ * Starting at pss->page send pages up to the end of the current host
+ * page or the boundary of used_length of the block (if the RAMBlock
+ * isn't a multiple of the host page size). The min one is selected.
+ * Only dirty target pages are sent.
+ *
+ * Note that the host page size may be a huge page for this block, it's
+ * valid for the initial offset to point into the middle of a host page
+ * in which case the remainder of the hostpage is sent.
  *
  * Returns the number of pages written or negative on error
  *
-- 
2.23.0


