Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4122447F8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 12:28:20 +0200 (CEST)
Received: from localhost ([::1]:33978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6Wwd-000347-Ip
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 06:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k6VuD-0002Jr-Np
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:21:45 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:50080 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k6VuA-00045y-2g
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:21:45 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9EA59DF8D2776D958153;
 Fri, 14 Aug 2020 17:21:33 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Fri, 14 Aug 2020
 17:21:25 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2 02/10] migration/dirtyrate: Add RamlockDirtyInfo to store
 sampled page info
Date: Fri, 14 Aug 2020 17:32:05 +0800
Message-ID: <1597397532-68043-3-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1597397532-68043-1-git-send-email-zhengchuan@huawei.com>
References: <1597397532-68043-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhengchuan@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 05:21:34
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

Add RamlockDirtyInfo to store sampled page info of each ramblock.

Signed-off-by: Zheng Chuan <zhengchuan@huawei.com>
---
 migration/dirtyrate.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index 914c363..9650566 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -19,6 +19,11 @@
  */
 #define DIRTYRATE_DEFAULT_SAMPLE_PAGES            256
 
+/*
+ * Record ramblock idstr
+ */
+#define RAMBLOCK_INFO_MAX_LEN                     256
+
 /* Take 1s as default for calculation duration */
 #define DEFAULT_FETCH_DIRTYRATE_TIME_SEC          1
 
@@ -39,6 +44,19 @@ typedef enum {
     CAL_DIRTY_RATE_END,
 } CalculatingDirtyRateState;
 
+/*
+ * Store dirtypage info for each ramblock.
+ */
+struct RamblockDirtyInfo {
+    char idstr[RAMBLOCK_INFO_MAX_LEN]; /* idstr for each ramblock */
+    uint8_t *ramblock_addr; /* base address of ramblock we measure */
+    size_t ramblock_pages; /* sum of dividation by 4K pages for ramblock */
+    size_t *sample_page_vfn; /* relative offset address for sampled page */
+    unsigned int sample_pages_count; /* sum of sampled pages */
+    unsigned int sample_dirty_count; /* sum of dirty pages we measure */
+    uint8_t *hash_result; /* array of hash result for sampled pages */
+};
+
 void *get_dirtyrate_thread(void *arg);
 #endif
 
-- 
1.8.3.1


