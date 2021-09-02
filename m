Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AB43FEF38
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 16:13:26 +0200 (CEST)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLnT3-0004za-6f
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 10:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuxiating@huawei.com>)
 id 1mLlFm-0000gy-1L
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:51:34 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuxiating@huawei.com>)
 id 1mLlFi-0006uF-E3
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:51:33 -0400
Received: from dggeme762-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H0fKg29klz8xQ8;
 Thu,  2 Sep 2021 19:47:03 +0800 (CST)
Received: from huawei.com (10.174.185.176) by dggeme762-chm.china.huawei.com
 (10.3.19.108) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.8; Thu, 2 Sep
 2021 19:51:18 +0800
From: yuxiating <yuxiating@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH] migration: initialise compression_counters for a new migration
Date: Thu, 2 Sep 2021 19:51:17 +0800
Message-ID: <20210902115117.5633-1-yuxiating@huawei.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.176]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=yuxiating@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 02 Sep 2021 10:08:37 -0400
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
Cc: qemu-devel@nongnu.org, eric.fangyi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the compression migration fails or is canceled, the query for the value of
compression_counters during the next compression migration is wrong.

Signed-off-by: yuxiating <yuxiating@huawei.com>
---
 migration/migration.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index bb909781b7..f20bc560e5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2252,10 +2252,11 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
 
     migrate_init(s);
     /*
-     * set ram_counters memory to zero for a
+     * set ram_counters compression_counters memory to zero for a
      * new migration
      */
     memset(&ram_counters, 0, sizeof(ram_counters));
+    memset(&compression_counters, 0, sizeof(compression_counters));
 
     return true;
 }
-- 
2.24.0.windows.2


