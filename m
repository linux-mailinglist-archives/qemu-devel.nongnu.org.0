Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C8022D407
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jul 2020 05:01:17 +0200 (CEST)
Received: from localhost ([::1]:43154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzAR2-00040L-BB
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 23:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1jzAPV-000269-Dv
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 22:59:41 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:33214 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1jzAPQ-0000k8-NK
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 22:59:41 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6A9CB38F33A4A384F404;
 Sat, 25 Jul 2020 10:59:28 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Sat, 25 Jul 2020
 10:59:21 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [RFC PATCH 2/8] migration/dirtyrate: Add block_dirty_info to store
 dirtypage info
Date: Sat, 25 Jul 2020 11:11:03 +0800
Message-ID: <1595646669-109310-3-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595646669-109310-1-git-send-email-zhengchuan@huawei.com>
References: <1595646669-109310-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhengchuan@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 22:59:28
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: zhang.zhanghailiang@huawei.com, linyilu@huawei.com, qemu-devel@nongnu.org,
 alex.chen@huawei.com, ann.zhuangyanying@huawei.com, fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zheng Chuan <zhengchuan@huawei.com>

Add block_dirty_info to store dirtypage info for each ramblock

Signed-off-by: Zheng Chuan <zhengchuan@huawei.com>
Signed-off-by: YanYing Zhang <ann.zhuangyanying@huawei.com>
---
 migration/dirtyrate.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index 9a5c228..342b89f 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -33,6 +33,19 @@ typedef enum {
     CAL_DIRTY_RATE_END   = 2,
 } CalculatingDirtyRateStage;
 
+/* 
+ * Store dirtypage info for each block.
+ */
+struct block_dirty_info {
+    char idstr[BLOCK_INFO_MAX_LEN];
+    uint8_t *block_addr;
+    unsigned long block_pages;
+    unsigned long *sample_page_vfn;
+    unsigned int sample_pages_count;
+    unsigned int sample_dirty_count;
+    uint8_t *hash_result;
+};
+
 void *get_dirtyrate_thread(void *arg);
 #endif
 
-- 
1.8.3.1


