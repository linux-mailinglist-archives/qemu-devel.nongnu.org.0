Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16432C61D3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 10:36:49 +0100 (CET)
Received: from localhost ([::1]:42314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiaBM-00083r-T9
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 04:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kia7K-00038J-VN
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:32:38 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kia7H-0006wX-Tz
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:32:38 -0500
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Cj8Xs5mqSzQlNn;
 Fri, 27 Nov 2020 17:32:13 +0800 (CST)
Received: from dggemi758-chm.china.huawei.com (10.1.198.144) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 27 Nov 2020 17:32:32 +0800
Received: from localhost (10.174.187.211) by dggemi758-chm.china.huawei.com
 (10.1.198.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1913.5; Fri, 27
 Nov 2020 17:32:32 +0800
From: Zeyu Jin <jinzeyu@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2 5/6] migration: Add compress_level sanity check
Date: Fri, 27 Nov 2020 17:32:30 +0800
Message-ID: <20201127093230.2711-1-jinzeyu@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.211]
X-ClientProxiedBy: dggemi702-chm.china.huawei.com (10.3.20.101) To
 dggemi758-chm.china.huawei.com (10.1.198.144)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=jinzeyu@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Ying Fang <fangying1@huawei.com>, qemu-devel@nongnu.org,
 Zeyu Jin <jinzeyu@huawei.com>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zlib compression has level from 1 to 9. However Zstd compression has level
from 1 to 22 (level >= 20 not recommanded). Let's do sanity check here
to make sure a vaild compress_level is given by user.

Signed-off-by: Zeyu Jin <jinzeyu@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 migration/migration.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index c11f137a8d..fab26084c2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1235,16 +1235,40 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
     }
 }
 
+static bool compress_level_check(MigrationParameters *params, Error **errp)
+{
+    switch (params->compress_method) {
+    case COMPRESS_METHOD_ZLIB:
+        if (params->compress_level > 9 || params->compress_level < 1) {
+            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "compress_level",
+                           "a value in the range of 0 to 9 for Zlib method");
+            return false;
+        }
+        break;
+#ifdef CONFIG_ZSTD
+    case COMPRESS_METHOD_ZSTD:
+        if (params->compress_level > 19 || params->compress_level < 1) {
+            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "compress_level",
+                        "a value in the range of 1 to 19 for Zstd method");
+            return false;
+        }
+        break;
+#endif
+    default:
+        error_setg(errp, "Checking compress_level failed for unknown reason");
+        return false;
+    }
+
+    return true;
+}
+
 /*
  * Check whether the parameters are valid. Error will be put into errp
  * (if provided). Return true if valid, otherwise false.
  */
 static bool migrate_params_check(MigrationParameters *params, Error **errp)
 {
-    if (params->has_compress_level &&
-        (params->compress_level > 9)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "compress_level",
-                   "is invalid, it should be in the range of 0 to 9");
+    if (params->has_compress_level && !compress_level_check(params, errp)) {
         return false;
     }
 
-- 
2.27.0


