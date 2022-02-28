Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342E64C6B73
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:01:01 +0100 (CET)
Received: from localhost ([::1]:46298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOehy-0006Ns-Fy
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:00:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNr-0002U3-A8; Mon, 28 Feb 2022 06:40:07 -0500
Received: from [2a01:111:f400:fe02::721] (port=57446
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNo-0002MY-Sa; Mon, 28 Feb 2022 06:40:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KshGxiIaPCV/2tU9mSH4LqhF0CSzCqkuqLxZv/lYAPkTQGbAr5JRHj8QA8NyCPqW/AxbnakqvuWdGkYeVGDZ/ZyQp0Nlrj1o33V7vvsWanyWSdZ6MRo6KaRcVCBrimxr3xPlDR4y7jYhnO01E0cdKch4I5h8mY/G0ccKXU8if8NSzFlPXK5IIN4J/Fy03ADj4wSBcX5Bu+eZVw1SbUzzUpFNdPPNXU38wWPq2Sz6LuswQ1ix2wf8VEUryqPuKr6w0/buYfTNAmuLwqdekeBDr+x5in67dSIAFuTxQRsMaHNeV8QlQ72aAot9JciGhGpi6iPaRzw4f1mg+oM7+Xo2tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLVC4Eo4TWKZdYpq1VLkSOCIIOwMWgRVTe6/fcTJTWc=;
 b=ZReLr1j3EBptg32meJnt3eqLM/0Pozl/altp8xO1vb1cSrr9Ukyi6tI4uQJyrlnuhAI6BUHNOutife6Kmklnwy0yTWhUcJDwjkBPmNUKLUuTcNXvlU5se6Pem1n7Rd6DC34Zfqd4QfdxqU7o5WmeEDFBHjBI5qowtY1HvcLphg3AO9z1CP5TZjjzrZsFmrxjF16I/Jt1RUEonmu8qaaABmRxD9L/BB9NCVIONWzX+gKXkkfgEpRljhwLuXq8TUswFr3qD+NW0onwgAL4/DwSoT92HJhcYhwFlUpYKZKLl18FxPqZHFujmMCa4h7/pn8/4lJAl18UkLdxe0KqMM82/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLVC4Eo4TWKZdYpq1VLkSOCIIOwMWgRVTe6/fcTJTWc=;
 b=gG1pDxTxZxgFAWu4TUyNOtVWajynJNlpDwy5RubLKyqz8hDNZnheMDl83xpD266CR/fV4QE7DD5kcuCUkqLqeRsALsRBTR9Wo4ScYagj9Ji9Z/bPzjnwGeiLk9vsMLr3glUj99Xnq4BUEUeGARheDoiRjsMfeoasJ57lcEVq+QQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2272.eurprd08.prod.outlook.com (2603:10a6:800:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:54 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 11/16] block: introduce snapshot-access block driver
Date: Mon, 28 Feb 2022 12:39:22 +0100
Message-Id: <20220228113927.1852146-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31104fc8-1691-4b04-6b9b-08d9faaf0a0c
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2272:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB22720EEC34931DF9F644E564C1019@VI1PR0802MB2272.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C7AyyC1VeTXvT1fb57h6TzIfsHoe+TpiQiGNZVfEiXUzJMJKLFIJEhz1EjHtj8K8+63EsV4myQYrgBJmffEMXyxYVYODvwki1x+TX1b7ReUhAcTO2OrGCjWmGuk3uWRsdmty8uTCnTLYoAPBINf04ayhYEff/tGptIqsspN/GsHnoQJM6F3w6wGIFIP8QSseyhcFE5op2qYMRqf4bKjlgdlyzDkC9/e3t1qeOkY/Fi4IHXUkZ/52rVptBjws4CpvZUeEYPNDU+bLFRm+u/WUsfpE8FYLv9YrS8f5U7uk2yV+VDeHxrOOr4Iy97HICl+rZSufd8OKHnELlsbav97VhNR6KEfhXsvOo7RkQfbBQkUaacOPdHq3l4zCoAtsCJgMFDeFgeVLVeHh4hBE4qCEzVnJSD6+h59k8RPd2Cml0rqNAGoR5i8sktf549TWDT99kJhZFPflJK9NOz6ofLbJWGs/KLj3UNXFkt/WxkTlsqXGRP/WUXjL7N6RY15Na9uwHHlEBnPFti/bhcEZnmIESiA9pSjVQBSi8S4elrRjQX/VJEta7NYvHVl1G8SGiuKr4mmblLyHdHgLTU/oSX1XHfKDKaqSXOUPYVXcTP3yWb5584TO9SwjX8CVhPb7yCENp9T4qPXS9aSnh4SUjr+qSrswiGHL0RcPRgQdAeggt6masiLkZFef6dM0FU/DTuqCLCrLAA42LL5Pl4XeOz2kK5P0N3aSPsb9zvyYsaQhfg2sSOu5elfr959mugA7XzwhQfd/n+8ynWesy6ovBt4c6VIIukn1MjyRoxXlkP9WBKXzpqiykT8N5hvs/+PPD9Xd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(4326008)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(316002)(83380400001)(1076003)(186003)(26005)(107886003)(6486002)(508600001)(6916009)(52116002)(6506007)(6512007)(6666004)(2616005)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xzhZRkb/cP7rq9JdzwK7rJBdSBSOuUGn4MDbjlmh5mUmT/rQms4wjK6dzOJo?=
 =?us-ascii?Q?EXT9+hUxowZ8mfPw2CPtG/gYG+bLxVlrrndZLhtpRbMv8/7H4gQ8QkrJdjt7?=
 =?us-ascii?Q?fPOR70ceELPZPUOvDJ1nur3H3nF8jhrMO/Z3LhpJTJMrJPHGasr17XTraoBe?=
 =?us-ascii?Q?8GyAbu0ULcbIQn0b/8WE6OzHvTv6PrQqScsPac4iw4DLU5Xfey3tYIafk2om?=
 =?us-ascii?Q?xPuHtUnCeLt2QpgSoYsYbps5EUOUVBH0UoDBC76SIZgrpNBOdQXvtsmVWqin?=
 =?us-ascii?Q?evIZfFa4HNLH59dlK4VwY7JP8R7y6fq+Kdawvp64XZERMqtyhFzd5w33MtOZ?=
 =?us-ascii?Q?7v3Cwllf067Ku0OUkRbCZi9aHlt7Mxj08U2WKKkcA9BBk6aZ4b9CsQikPDBJ?=
 =?us-ascii?Q?8SNfhyyMV7AhosFBbPrxz7hS6pohxZp3hkfCXR9uXAeAVDnR44qI7XdgaaLs?=
 =?us-ascii?Q?sJgDZF5rW1/vd0nwu/nHotKLEU7MfHonxE9mmOnCg3dMzR4C+2WAspi3sEbW?=
 =?us-ascii?Q?487+BTwoF+Elm8VvP9aaCPJClea7knCfkq5SYd3wMOUAJVTOJ48idUbP9iC0?=
 =?us-ascii?Q?7FKmY0b1cJbtzAxuI0kqqD4g9n9Vga7dkPTpD7dROq6/KsVyg+l8RHk8Ui9Z?=
 =?us-ascii?Q?8RnVaUE6m1N8Pie6f7QetoNZgyEGzEpRldbGDrr8b9NCCOgPn2Ms87Wilga2?=
 =?us-ascii?Q?S8dSLmiClPTJGMMgc/+JBWMO6WgE6gAnyR92YwtVmM7I8cEA5iSBXavshoW9?=
 =?us-ascii?Q?rJ7NxBvC8ThqBb866lpS73Dxcr1TEpY6OdYGu2yRoByQzDe9BN9/jAQBN9Dv?=
 =?us-ascii?Q?USYFjHWoqwpS35yT74alQxJUYTOfEaSP6TcZID0+U4vf70D0b5LmRt4Fl5A9?=
 =?us-ascii?Q?4KCrivMVjXy8DvDtG5W9flptlOF6bX4ayvUKF4Q87dWGSR008i4IGnzncqo/?=
 =?us-ascii?Q?qNYsoSfRoY9YmTBhCRjZWHpy0pA2VCZLxjxf6Rpn8lqP6N+aFAvzVvsWbwEA?=
 =?us-ascii?Q?CFsM9CaZ0EiyrVp2rUO6isnU3ZldG2LbdywogAnhy0p7qjf9PjFYdBezx4vK?=
 =?us-ascii?Q?Rn8bqUqYoUKx4NbMAzJ2KfQpuLpUeVbQ6QClSb55tixXZXeOe7V8TGg5IhhU?=
 =?us-ascii?Q?XXmNL1PbGEmt3lXhJUroQRetJRjg5rM6ylqrN6Eb/9SaE/YuYRNV08zGOIdj?=
 =?us-ascii?Q?Bcol95xDflda3wx/66MjojqSoufQQoUseDXnLFgx6gO52S51z2XZfQMl22yK?=
 =?us-ascii?Q?DDnfwNT5R4u6rzs2qm7IzJvCjmbnctOLfJ15T9wyY06W++sf/+leMClsyVxj?=
 =?us-ascii?Q?erVkTvyc0kyCIiblOGOLyv5OpyjLdl1ppyzZuEaTUWJ1R2bhCvm99Mj7BPen?=
 =?us-ascii?Q?dCcctIdNjyFoNaXQ/2tJT9T92m8stqecECJdg4X/8g9eup9yedAQRKMdw9Tg?=
 =?us-ascii?Q?Qe8aeXAi7lcAgg7dfpyvs7zuJ3e+UFHPOzMFSI4BrjRrHTY1mIUoULrzPyuA?=
 =?us-ascii?Q?P0NiXRihvDqk57bViW+GzsJ0rDI97jmVzCOPv4FJA7PBHH3AcXWq5EWPxzkU?=
 =?us-ascii?Q?pgmoyYg/Fs8zXMJPVoyj7YnDxZcFDn8viUTcRvJVRff1qkMwG/GSxxvS145l?=
 =?us-ascii?Q?pQtXznnytLZICg5U3ngEVY1lfnlq48dSQIlMCEkHwmyPibKA42MbU0ra5BVs?=
 =?us-ascii?Q?kUt/qQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31104fc8-1691-4b04-6b9b-08d9faaf0a0c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:54.5863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LDTktC6pfr8Xus6eXc3quhuALpW0Isa5ZyNfwtl0CtaOpjfrUfpqDSrOWLl+zUNssGqzaDmUcfWzbRJ8L1LpEIrX21Bon/mY1eZjAmu+wA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2272
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::721
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::721;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new block driver simply utilizes snapshot-access API of underlying
block node.

In further patches we want to use it like this:

[guest]                   [NBD export]
   |                            |
   | root                       | root
   v                 file       v
[copy-before-write]<------[snapshot-access]
   |           |
   | file      | target
   v           v
[active-disk] [temp.img]

This way, NBD client will be able to read snapshotted state of active
disk, when active disk is continued to be written by guest. This is
known as "fleecing", and currently uses another scheme based on qcow2
temporary image which backing file is active-disk. New scheme comes
with benefits - see next commit.

The other possible application is exporting internal snapshots of
qcow2, like this:

[guest]          [NBD export]
   |                  |
   | root             | root
   v       file       v
[qcow2]<---------[snapshot-access]

For this, we'll need to implement snapshot-access API handlers in
qcow2 driver, and improve snapshot-access block driver (and API) to
make it possible to select snapshot by name. Another thing to improve
is size of snapshot. Now for simplicity we just use size of bs->file,
which is OK for backup, but for qcow2 snapshots export we'll need to
imporve snapshot-access API to get size of snapshot.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json    |   4 +-
 block/snapshot-access.c | 132 ++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS             |   1 +
 block/meson.build       |   1 +
 4 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 block/snapshot-access.c

diff --git a/qapi/block-core.json b/qapi/block-core.json
index ffb7aea2a5..f13b5ff942 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2914,13 +2914,14 @@
 # @blkreplay: Since 4.2
 # @compress: Since 5.0
 # @copy-before-write: Since 6.2
+# @snapshot-access: Since 7.0
 #
 # Since: 2.9
 ##
 { 'enum': 'BlockdevDriver',
   'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
             'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
-            'file', 'ftp', 'ftps', 'gluster',
+            'file', 'snapshot-access', 'ftp', 'ftps', 'gluster',
             {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
             {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
             'http', 'https', 'iscsi',
@@ -4267,6 +4268,7 @@
       'rbd':        'BlockdevOptionsRbd',
       'replication': { 'type': 'BlockdevOptionsReplication',
                        'if': 'CONFIG_REPLICATION' },
+      'snapshot-access': 'BlockdevOptionsGenericFormat',
       'ssh':        'BlockdevOptionsSsh',
       'throttle':   'BlockdevOptionsThrottle',
       'vdi':        'BlockdevOptionsGenericFormat',
diff --git a/block/snapshot-access.c b/block/snapshot-access.c
new file mode 100644
index 0000000000..77b87c1946
--- /dev/null
+++ b/block/snapshot-access.c
@@ -0,0 +1,132 @@
+/*
+ * snapshot_access block driver
+ *
+ * Copyright (c) 2022 Virtuozzo International GmbH.
+ *
+ * Author:
+ *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+
+#include "sysemu/block-backend.h"
+#include "qemu/cutils.h"
+#include "block/block_int.h"
+
+static coroutine_fn int
+snapshot_access_co_preadv_part(BlockDriverState *bs,
+                               int64_t offset, int64_t bytes,
+                               QEMUIOVector *qiov, size_t qiov_offset,
+                               BdrvRequestFlags flags)
+{
+    if (flags) {
+        return -ENOTSUP;
+    }
+
+    return bdrv_co_preadv_snapshot(bs->file, offset, bytes, qiov, qiov_offset);
+}
+
+static int coroutine_fn
+snapshot_access_co_block_status(BlockDriverState *bs,
+                                bool want_zero, int64_t offset,
+                                int64_t bytes, int64_t *pnum,
+                                int64_t *map, BlockDriverState **file)
+{
+    return bdrv_co_snapshot_block_status(bs->file->bs, want_zero, offset,
+                                         bytes, pnum, map, file);
+}
+
+static int coroutine_fn snapshot_access_co_pdiscard(BlockDriverState *bs,
+                                             int64_t offset, int64_t bytes)
+{
+    return bdrv_co_pdiscard_snapshot(bs->file->bs, offset, bytes);
+}
+
+static int coroutine_fn
+snapshot_access_co_pwrite_zeroes(BlockDriverState *bs,
+                                 int64_t offset, int64_t bytes,
+                                 BdrvRequestFlags flags)
+{
+    return -ENOTSUP;
+}
+
+static coroutine_fn int
+snapshot_access_co_pwritev_part(BlockDriverState *bs,
+                                int64_t offset, int64_t bytes,
+                                QEMUIOVector *qiov, size_t qiov_offset,
+                                BdrvRequestFlags flags)
+{
+    return -ENOTSUP;
+}
+
+
+static void snapshot_access_refresh_filename(BlockDriverState *bs)
+{
+    pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
+            bs->file->bs->filename);
+}
+
+static int snapshot_access_open(BlockDriverState *bs, QDict *options, int flags,
+                                Error **errp)
+{
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
+        return -EINVAL;
+    }
+
+    bs->total_sectors = bs->file->bs->total_sectors;
+
+    return 0;
+}
+
+static void snapshot_access_child_perm(BlockDriverState *bs, BdrvChild *c,
+                                BdrvChildRole role,
+                                BlockReopenQueue *reopen_queue,
+                                uint64_t perm, uint64_t shared,
+                                uint64_t *nperm, uint64_t *nshared)
+{
+    /*
+     * Currently, we don't need any permissions. If bs->file provides
+     * snapshot-access API, we can use it.
+     */
+    *nperm = 0;
+    *nshared = BLK_PERM_ALL;
+}
+
+BlockDriver bdrv_snapshot_access_drv = {
+    .format_name = "snapshot-access",
+
+    .bdrv_open                  = snapshot_access_open,
+
+    .bdrv_co_preadv_part        = snapshot_access_co_preadv_part,
+    .bdrv_co_pwritev_part       = snapshot_access_co_pwritev_part,
+    .bdrv_co_pwrite_zeroes      = snapshot_access_co_pwrite_zeroes,
+    .bdrv_co_pdiscard           = snapshot_access_co_pdiscard,
+    .bdrv_co_block_status       = snapshot_access_co_block_status,
+
+    .bdrv_refresh_filename      = snapshot_access_refresh_filename,
+
+    .bdrv_child_perm            = snapshot_access_child_perm,
+};
+
+static void snapshot_access_init(void)
+{
+    bdrv_register(&bdrv_snapshot_access_drv);
+}
+
+block_init(snapshot_access_init);
diff --git a/MAINTAINERS b/MAINTAINERS
index 34a36affff..1ccc546cc6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2520,6 +2520,7 @@ F: block/reqlist.c
 F: include/block/reqlist.h
 F: block/copy-before-write.h
 F: block/copy-before-write.c
+F: block/snapshot-access.c
 F: include/block/aio_task.h
 F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
diff --git a/block/meson.build b/block/meson.build
index 41e9cc5dc3..038a95689b 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -34,6 +34,7 @@ block_ss.add(files(
   'raw-format.c',
   'reqlist.c',
   'snapshot.c',
+  'snapshot-access.c',
   'throttle-groups.c',
   'throttle.c',
   'vhdx-endian.c',
-- 
2.31.1


