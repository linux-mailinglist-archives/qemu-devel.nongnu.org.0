Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AFA3E01DA
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:22:53 +0200 (CEST)
Received: from localhost ([::1]:59500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGrF-0003bR-0I
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmy-0002Qf-Q3; Wed, 04 Aug 2021 09:18:29 -0400
Received: from mail-eopbgr60122.outbound.protection.outlook.com
 ([40.107.6.122]:6733 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmv-0005TW-Jv; Wed, 04 Aug 2021 09:18:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/RP/+9vnd6SMjcENyhgDd0LskhLbym7LX9Xje3lmqX+b7t8irb6NYGeXUOGxuNY8UsPyJ+pVdYtWrNPfUUJtcRLQfOdMa0qG5dLwYmMufXz7SQ+NH/8Nsz0PzfqJv9gDPJN2MerlwE9fCfWRtxwIkwnnu3HPe6AZy7a48TgRqN0WEBud99SUmM2OTI1Kw/6JwDAx78JwYLxyEk4oQFdSdvNpPbfD0gpZWxMkjkXdRBl70VLeV3CVpz1rhRiuI+64jsH6rRgLXTdVZghSkbynXi34tt+5vrOw+vxlOAekeHtmbBL4OZ/EXqMm+7xkBvSVmz8vlxvxu27gbHmJZk0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoGws66xig/j4dJaO8EQ+d7EYYpUZZC/EJMCq0+pzA4=;
 b=agxIjEXNuI4FNhQbaGQMJ/gseNH21o6fjA4UeWspvB2TAo6krfgm1BdXlgf08wGtskaV+fH/k9uAfPw4u+a5wffO2lTYmBkqh934mnHYqHzTMcBPMnUnHrUrySjs8HkveYUFt2jIV6t6kp/XfSe97uB2sPhw22ejlna37OTk+kR7nE1RV5Sbzoe6e/oVpTE4S94oaRZPw5gvgfLZya1C0y1glxKHiYUHBFnmWQuFlkYN+XS3QhhaYsjJCPN0H6VMu3mNAWMlx5+ho2bSRW3qDubdCPKCcwYpFhY8BpJzbG40G8TYL7mevr5dnafnYKnSIywVIncnrAIJeUbE+FQt7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoGws66xig/j4dJaO8EQ+d7EYYpUZZC/EJMCq0+pzA4=;
 b=cthrAWU4/8vgs00YycBwHOEm82AWvk+DCMxXmsoixyENWj3ywr4o0K2tRmcdfO43fAVCeqzW0oBW/9sBbQ80VKXjhHTlCDZV7Yz8B+3Tf1UCPl6yzVPolGLm0v7TP3UlPQFBkK+SLaooWDahob7kFhOBERsCgLuiINry1YIcNWc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 13:18:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 13:18:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, kwolf@redhat.com
Subject: [PATCH 11/11] block: introduce fleecing block driver
Date: Wed,  4 Aug 2021 16:17:50 +0300
Message-Id: <20210804131750.127574-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804131750.127574-1-vsementsov@virtuozzo.com>
References: <20210804131750.127574-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 13:18:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f446b5ad-8a87-445e-54ac-08d9574a5190
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB621668A09E2BA2A387F654D8C1F19@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8+GK/sqm1beIdX0E539Z+TTxUcgu9qDgdsZrdFTCgXEBLY6HTNOIXhvJbK0bPlZ9rD+Ong+sqvRquYmXheYdIeggC8Ezpfa1JHGWxeLBnipGKKCZPbcd7vgJCAG5nFvAWUod9qgq5LKQl/VaFUcuB3R2E3JnDz1AiTlU/rf4Y6eczOCVEx/FQGqMlSBZMEy1/YO4O7PyfHZK5oLB/nWFbjYfea/Qb97Bd+HfhpIhmHSNInz3fBhOydbPnDXqZlJsTOIZCGrW8PhHCe7cIprMJo9I1rKO/YoBlTCICmoagZCkuPjcOvuSLDrlRvou54ePMLKi4yftRHJ38+9rEo6VPoyT42XCgx0Ph/4u0zMt9TANcU2RjlDIff7nNBMiviQWCn7UMrKRjbxwWYjwgS2aUhKAXhlz3ZeNURJDN5kyZqi9swRR9YQTf7d3LnAIlE3HrkoNn31Fx63NWs9YNa1gonVTK4dT8u4bNuo+mX9eLnjvtbyqnrDmbwT7bs+8XbMmQDt8tA+d3Wxz2dxITXb5T4xLL0KRKdoowBp5FXc0QrB8oh01Wrzg+TUnsLJidSUn7geqTy/JvhEalFVpcw05C2CeHQ8BOdIoS5ZqvkaM8mu8otVAwpIupv2QmYTycA6sVZB7KqZMcCh+fVXBam0vC63cM/v2s6P+qP6N46g9KMSd0ZEvbegZiHlNPA02PpbZSin5p4I4FU35BINnTujTm27ttg27qVGilvMzUPd+7oEPby6aNI3luAUvco51SCa00m3ia2oHTL5mNo0Dx/ZKaLbxmABN2olgdvo6kJNa1P4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39830400003)(396003)(136003)(478600001)(1076003)(8936002)(6666004)(36756003)(66476007)(86362001)(316002)(4326008)(6916009)(6512007)(52116002)(2906002)(38100700002)(5660300002)(186003)(26005)(38350700002)(2616005)(956004)(66556008)(6486002)(6506007)(83380400001)(66946007)(8676002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7KKYvfl7V4y7Mmb9r2z+4XuIYmMxSsZGdk8M8sxuHaK3j02IyDcnXEAx0ka5?=
 =?us-ascii?Q?y3pCqZhmmpmYLD3JS1u+2bhVbZKHfXxiCSZaQWO3JLN33GPId7WfWuqOLh7I?=
 =?us-ascii?Q?N/SpChcg0jbYynj2lzXE8dzxpT2MOHKxzY5SNOGGG0Wy+rdP3BhNQm1TXpvx?=
 =?us-ascii?Q?MSzS2DtBxxfHxlzgSDKfr/C8xF6fM4gwEvMFPJ1kzSOlzy1wNZf6EbIa6IgT?=
 =?us-ascii?Q?NG7frBXR6hM+oK1Uo6eUZ83gmlCj4qpsPUQAgPSoPc3dHEGIASOHB18sHNim?=
 =?us-ascii?Q?MtEvYon451OQ5MkQc8UKEoAIOQlkLxD1gECAVPX7qyUj0DACvLZcs5psjHnI?=
 =?us-ascii?Q?KIIlO9ymLMoBjemC6Z1b33tootwjoCp2IZ+4ogHqGjHlHK/mui1L3OLw6DxW?=
 =?us-ascii?Q?krCvOMWekaK5MQGmwQ1O+pmgrUL5zWKD4SIDCGNeQwiAJmi3vA6tPybt64nh?=
 =?us-ascii?Q?esAuRjoHiebshTv65Frc2vMGZcn5FV4zaPhH22VOgBQL30oP1lnrJZev99MA?=
 =?us-ascii?Q?5LsRbKdG24V7WKMfAWt0a5bTCtDzZvoOpH+S6vSKTXK5WJYDO61DtBk1fcqY?=
 =?us-ascii?Q?NjVBTL7sVmHVICDd9sXJog+E3u2jcxryavHIMb1P+0uMGK7cD/9FQz3BWG6e?=
 =?us-ascii?Q?/e85CVLqzuO7U4iPzwfidNr3lYG8VdMQefSvC+oDX7s9EIPTGtmDXyKASQ6l?=
 =?us-ascii?Q?6bBn9oxhoeB0+zPD/2Vc7gnLJYRWV0RFBmeiOjj5aTz+4hkt05KjhDvLSX0R?=
 =?us-ascii?Q?D9H/CvYQBYMVYN1whNoRiOxez0OZ/XVTqdeCZC6Ph6t8xg9wfwO0qWbRYgUg?=
 =?us-ascii?Q?6R9J9H82+pyOv9ZnzRxTRFHogaTvbkPqXiWtekCptUPtWafyOpZCnhWJlftw?=
 =?us-ascii?Q?6Y0snR3+PEjCiekoU8B5KhdNQzfjEUgaRpGEXqf/4zt2yt1dZ4c9Aj62a6xr?=
 =?us-ascii?Q?YLNuli46WrNzERsC5PwgCKsrUoXtTfK7v+jHnhbZ9H1irpnN94mw7v5NZ/LE?=
 =?us-ascii?Q?4Y7bJrdSU3V5Tr4jQdwG0VGNp4uxCLXVP3innUIb25slJDQJDFdo2Jh0FUgS?=
 =?us-ascii?Q?b2/tyF+5J2VFn7g5lSxqbFgDrA8vS1+S7yE6/7IZUG6HdSuA+yOOFSUU8U5i?=
 =?us-ascii?Q?hayRGjmaCft4Ins81yKbzlV5FfSRWbbc/dxkMFfziJSXEtVMlh5igGX42a3h?=
 =?us-ascii?Q?GXtmV3OZ+FUcuIIrCyhyUXxcxMgK4BKzAZGR5zUzELuUWLAzGQ86YTx341Pc?=
 =?us-ascii?Q?2kmnbBbhbLr/I9aiQdzIYAQcPvBgNGgtS6ODtUvneLHZD5eS8ofBZgY+SplK?=
 =?us-ascii?Q?E9/YdtrmY8+cQLHEI3OrTrC/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f446b5ad-8a87-445e-54ac-08d9574a5190
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:18:15.9376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tcbm2BkSAoF/364DQ6q1DzPMuLKAHOpgwigy/IRmPXLHoKWQ5U6rZYat8jEKosxJtwrvERV6j0ML0sDhxCx5DzKZrL+ld3Yc+qp1SvUv8/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.6.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a new driver, that works in pair with copy-before-write to
improve fleecing.

Without fleecing driver, fleecing scheme may look as follows:

[guest]
  |
  |root
  v
[copy-before-write] -----> [temp.qcow2] <--- [nbd export]
  |                 target  |
  |file                     |backing
  v                         |
[active disk] <-------------+

With fleecing driver, new scheme is:

           bdrv_ref()
[guest]<~~~~~~~~~~~~~~~~~~~[fleecing] <--- [nbd export]
  |                         |    |
  |root      +--source------+    |file
  v          v                   v
[copy-before-write] -----> [temp.img]
  |                 target
  |file
  v
[active disk]

Benefits of new scheme:

1. Access control: if remote client try to read data that not covered
   by original dirty bitmap used on copy-before-write open, client gets
   -EACCES.

2. Discard support: if remote client do DISCARD, this additionally to
   discarding data in temp.img informs block-copy process to not copy
   these clusters. Next read from discarded area will return -EACCES.

3. Synchronisation between client reads and block-copy write is more
   efficient: it doesn't block intersecting block-copy write during
   client read (hmm, we still needlesly block it, as block-copy
   always serialize writes, it's a TODO to stop doing so).

4. We don't rely on backing feature: active disk should not be backing
   of temp image, so we avoid some permission-related difficulties
   (cleaning them up in copy-before-write filter is a TODO) and temp
   image now is not required to support backing, it may be simple raw
   image.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/fleecing.c  | 183 ++++++++++++++++++++++++++++++++++++++++++++++
 block/meson.build |   1 +
 2 files changed, 184 insertions(+)
 create mode 100644 block/fleecing.c

diff --git a/block/fleecing.c b/block/fleecing.c
new file mode 100644
index 0000000000..7d213da1ca
--- /dev/null
+++ b/block/fleecing.c
@@ -0,0 +1,183 @@
+/*
+ * copy-before-write filter driver
+ *
+ * The driver performs Copy-Before-Write (CBW) operation: it is injected above
+ * some node, and before each write it copies _old_ data to the target node.
+ *
+ * Copyright (c) 2018-2021 Virtuozzo International GmbH.
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
+#include "qapi/error.h"
+#include "block/block_int.h"
+#include "block/qdict.h"
+#include "block/block-copy.h"
+
+#include "block/copy-before-write.h"
+
+typedef struct BDRVFleecingState {
+    BlockDriverState *cbw;
+    BdrvChild *source;
+} BDRVFleecingState;
+
+static coroutine_fn int fleecing_co_preadv_part(
+        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, int flags)
+{
+    BDRVFleecingState *s = bs->opaque;
+    const BlockReq *req;
+    int ret;
+
+    /* TODO: upgrade to async loop using AioTask */
+    while (bytes) {
+        int64_t cur_bytes;
+
+        ret = cbw_snapshot_read_lock(s->cbw, offset, bytes, &req, &cur_bytes);
+        if (ret < 0) {
+            return ret;
+        }
+
+        if (req) {
+            ret = bdrv_co_preadv_part(s->source, offset, cur_bytes,
+                                      qiov, qiov_offset, flags);
+            cbw_snapshot_read_unlock(s->cbw, req);
+        } else {
+            ret = bdrv_co_preadv_part(bs->file, offset, cur_bytes,
+                                      qiov, qiov_offset, flags);
+        }
+        if (ret < 0) {
+            return ret;
+        }
+
+        bytes -= cur_bytes;
+        offset += cur_bytes;
+        qiov_offset += cur_bytes;
+    }
+
+    return 0;
+}
+
+static int coroutine_fn fleecing_co_pdiscard(BlockDriverState *bs,
+                                             int64_t offset, int bytes)
+{
+    BDRVFleecingState *s = bs->opaque;
+
+    cbw_snapshot_discard(s->cbw, offset, bytes);
+
+    bdrv_co_pdiscard(bs->file, offset, bytes);
+
+    /*
+     * Ignore bdrv_co_pdiscard() result: cbw_snapshot_discard() succeeded, that
+     * means that next read from this area will fail with -EACCES. More correct
+     * to report success now.
+     */
+    return 0;
+}
+
+static int coroutine_fn fleecing_co_pwrite_zeroes(BlockDriverState *bs,
+        int64_t offset, int bytes, BdrvRequestFlags flags)
+{
+    return -EACCES;
+}
+
+static coroutine_fn int fleecing_co_pwritev(BlockDriverState *bs,
+                                       uint64_t offset,
+                                       uint64_t bytes,
+                                       QEMUIOVector *qiov, int flags)
+{
+    return -EACCES;
+}
+
+
+static void fleecing_refresh_filename(BlockDriverState *bs)
+{
+    pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
+            bs->file->bs->filename);
+}
+
+static int fleecing_open(BlockDriverState *bs, QDict *options, int flags,
+                         Error **errp)
+{
+    BDRVFleecingState *s = bs->opaque;
+    const char *cbw_node_name = qdict_get_str(options,
+                                              "copy-before-write-node");
+    BlockDriverState *cbw;
+
+    cbw = bdrv_find_node(cbw_node_name);
+    if (!cbw) {
+        error_setg(errp, "Node '%s' not found", cbw_node_name);
+        return -EINVAL;
+    }
+
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
+        return -EINVAL;
+    }
+
+    s->source = bdrv_open_child(NULL, options, "source", bs, &child_of_bds,
+                               BDRV_CHILD_DATA, false, errp);
+    if (!s->source) {
+        return -EINVAL;
+    }
+
+    bs->total_sectors = bs->file->bs->total_sectors;
+
+    s->cbw = cbw;
+    bdrv_ref(cbw);
+
+    return 0;
+}
+
+static void fleecing_close(BlockDriverState *bs)
+{
+    BDRVFleecingState *s = bs->opaque;
+
+    bdrv_unref(s->cbw);
+}
+
+BlockDriver bdrv_fleecing_filter = {
+    .format_name = "fleecing",
+    .instance_size = sizeof(BDRVFleecingState),
+
+    .bdrv_open                  = fleecing_open,
+    .bdrv_close                 = fleecing_close,
+
+    .bdrv_co_preadv_part        = fleecing_co_preadv_part,
+    .bdrv_co_pwritev            = fleecing_co_pwritev,
+    .bdrv_co_pwrite_zeroes      = fleecing_co_pwrite_zeroes,
+    .bdrv_co_pdiscard           = fleecing_co_pdiscard,
+
+    .bdrv_refresh_filename      = fleecing_refresh_filename,
+
+    .bdrv_child_perm            = bdrv_default_perms,
+
+    .is_filter = true,
+};
+
+static void fleecing_init(void)
+{
+    bdrv_register(&bdrv_fleecing_filter);
+}
+
+block_init(fleecing_init);
diff --git a/block/meson.build b/block/meson.build
index c630e9374a..caa52f49c2 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -18,6 +18,7 @@ block_ss.add(files(
   'crypto.c',
   'dirty-bitmap.c',
   'filter-compress.c',
+  'fleecing.c',
   'io.c',
   'mirror.c',
   'nbd.c',
-- 
2.29.2


