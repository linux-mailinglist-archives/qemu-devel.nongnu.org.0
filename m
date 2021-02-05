Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5633108D1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:17:54 +0100 (CET)
Received: from localhost ([::1]:47636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yBV-00065B-Km
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7Z-0002vz-4W; Fri, 05 Feb 2021 05:13:49 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7W-00075T-GS; Fri, 05 Feb 2021 05:13:48 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DXB6L61NtzMVqV;
 Fri,  5 Feb 2021 18:11:54 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Feb 2021
 18:13:29 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 1/9] qapi/block-core: Add retry option for error action
Date: Fri, 5 Feb 2021 18:13:07 +0800
Message-ID: <20210205101315.13042-2-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205101315.13042-1-cenjiahui@huawei.com>
References: <20210205101315.13042-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=cenjiahui@huawei.com;
 helo=szxga05-in.huawei.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, cenjiahui@huawei.com,
 zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 fangying1@huawei.com, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new error action 'retry' to support retry on errors.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 blockdev.c           | 2 ++
 qapi/block-core.json | 9 +++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index b250b9b959..ece1d8ae58 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -342,6 +342,8 @@ static int parse_block_error_action(const char *buf, bool is_read, Error **errp)
         return BLOCKDEV_ON_ERROR_STOP;
     } else if (!strcmp(buf, "report")) {
         return BLOCKDEV_ON_ERROR_REPORT;
+    } else if (!strcmp(buf, "retry")) {
+        return BLOCKDEV_ON_ERROR_RETRY;
     } else {
         error_setg(errp, "'%s' invalid %s error action",
                    buf, is_read ? "read" : "write");
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9f555d5c1d..30ea43cb77 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1143,10 +1143,13 @@
 #
 # @auto: inherit the error handling policy of the backend (since: 2.7)
 #
+# @retry: for guest operations, retry the failing request; (since: 6.0)
+#         for jobs, not supported
+#
 # Since: 1.3
 ##
 { 'enum': 'BlockdevOnError',
-  'data': ['report', 'ignore', 'enospc', 'stop', 'auto'] }
+  'data': ['report', 'ignore', 'enospc', 'stop', 'auto', 'retry'] }
 
 ##
 # @MirrorSyncMode:
@@ -4839,10 +4842,12 @@
 #
 # @stop: error caused VM to be stopped
 #
+# @retry: error has been retried (since: 6.0)
+#
 # Since: 2.1
 ##
 { 'enum': 'BlockErrorAction',
-  'data': [ 'ignore', 'report', 'stop' ] }
+  'data': [ 'ignore', 'report', 'stop', 'retry' ] }
 
 
 ##
-- 
2.29.2


