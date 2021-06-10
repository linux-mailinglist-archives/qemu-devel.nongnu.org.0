Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAABD3A2B27
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:10:12 +0200 (CEST)
Received: from localhost ([::1]:54954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJVk-0002o6-0P
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRv-0002BR-5T; Thu, 10 Jun 2021 08:06:15 -0400
Received: from mail-eopbgr80125.outbound.protection.outlook.com
 ([40.107.8.125]:56129 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRt-0004D6-Ax; Thu, 10 Jun 2021 08:06:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltHJXH9+/p3wtsB6u3DDOsrEnSg8K/OQxbdzC9BgA5DalZwGKzyVh8mfCL1Pniigx76SJQvupGLNVBHGb/j5PqtrvI7cSW0EXarRajsjqE+Z9GTqLKCfhDEhplsd7uhVywBDcN8QTkGTzHCj6vj+sh91h77alxKynWQ4GlhX6ymLx66N+RG1J1VsKHGK4k9fpOyADbVWC0LXWbUzwpzyiHmj8sJkppfMpU67djSASDJjZGGNd+HikG627IWhbv6GNelrgbPloT+GIsnAGi+XeLWvqcIxtigxJWCPxqkArZbx17h0zcoDjzLM8t1Fkw7oXE0qfNW9Xh429VMBmGj34w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XojueE0NUoG8LVPazb2DhQu5QuPuiIXyBWdMtA48LlY=;
 b=Ut90/SFeEo/MOaN2xPpXZgmjKZ25ySDdpUqXhChmN11H6QRmdId6UfdT4gWIBaS4UjCrMjD9+h7PLYh/PEGkKrur8oyRu+ZZAPnzX9IlI7PL5vZPqCZDQqEqZxowZ2BjyXkKXxXMcLLyQwhLg7eEHkNmP5MDqBs6fPY2WaM+V73IKYC0kr5NURoTAYBop5TNJ3HI/AAtcATLvwkx8CHrgwyI4ZoM7X2i0qaTHtIgVdez9pCwmUZWG6nEvq7EAFbKncW8kseXNzZTt1NK16HI22FoPKACm6KGTvmwotRvxWp+UneTUbMcciGma4V/RsEqkPzVYBRmL5g5xZCMXNQXnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XojueE0NUoG8LVPazb2DhQu5QuPuiIXyBWdMtA48LlY=;
 b=bFlPq2SWNfTXUlLbTlwpeeb/DBifOhLZkWVtRaEM58Up8e5jdRfHb/PD6EbgJRnuJFRSpwEQAVkucYKhIsmrVnUw3VQCikOHZjaDTf2fmHXiWkgeB9YXJDfMyzW0GZIOgKMDaOgQ2DDBv83lBzTEne1IfMXjCgHbfzrKzzAU9kU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4277.eurprd08.prod.outlook.com (2603:10a6:20b:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 12:05:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:05:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v6 6/9] block: move supports_backing check to
 bdrv_set_file_or_backing_noperm()
Date: Thu, 10 Jun 2021 15:05:34 +0300
Message-Id: <20210610120537.196183-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610120537.196183-1-vsementsov@virtuozzo.com>
References: <20210610120537.196183-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0802CA0005.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0802CA0005.eurprd08.prod.outlook.com (2603:10a6:3:bd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 12:05:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe549e58-003a-4fc2-de8a-08d92c081bd1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB42771C7CA2E31D93BAB96A32C1359@AM6PR08MB4277.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8G6n3Y9nuczQrfdPUss5VNJRvPPb4o4qb81tTzwRZnQaOCV7t8CZCCFmNhNRn8VROfQC1T1YVX/+6mgBkIUcDbXo6tYVBv0MXk0l0AwSX6GneTCaKSxsW17j/kYey2511BmaLGYCO6Nh6uBad4WkhDilq7wllb/SQU+0kU1TJR+bEMoC4n0z/9ayeE4PlfkSXCUcUF59r4tYj8iJhYP+HtGzsa/Glh+mvwpfnMx8xK8yrnGA3uPLu+G4XAXePtNkO9wJ/dfm+o+PG0YKBBJus2umFQFs2IjcOojmjxe6T4hdZ8e3UYSly8XZ11uTzT7Uo8h7uM3nn57En60g3Bg+46i5MvoLs92/acdKfK0m55Or9Lo4M7hJLK5wrbHjmlRqZOumiRfFBT88Z5hTjId+bOIHLy4UjN/GzlPIDQtk3yGi0tQZTKAQCMbVeon0yK363PTsN14tGWuyP42AWSYmBa/WssO6JlRzfD1tOVssevNPqCnSCiTLaXZRJNMfqePt2+aBW8Tz4QkUHGRpvjPPvzNWwK6jQ+0l1zpdat08DWBi4xlxd3qA0BaTOkXT5FuJzQtsHM9nzTSSSWlbDHUmH49NOcIa7mC+wTgMV/a0CWAjQlJWOrQqNrhd801zj6wD451IjzBVQiuAfARQRTpnrnYkmoOJzd7fzo4zdcrTAqI5XSliZxtCLZL27XtHUN6a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(956004)(6486002)(2616005)(6916009)(6666004)(186003)(478600001)(2906002)(5660300002)(38100700002)(36756003)(107886003)(8936002)(26005)(16526019)(6512007)(38350700002)(86362001)(1076003)(6506007)(66556008)(66476007)(66946007)(316002)(8676002)(52116002)(4326008)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?na9zVC3ugcP3CTi8zIbMSZTe+Y88hHdjQCR1HYNDayGiJX5qs5uY/wZAOt78?=
 =?us-ascii?Q?V+YnlkdWulwJVk2u6WFWFgCvmT0PrZJxqEijQOiA9RQ3oN9w8YsxAIgD+jz2?=
 =?us-ascii?Q?WlILjGKZmbItXlQboiUkUyujRUxV1daEdgiyUJiP+op/6Lu+GMs+ZciunLO/?=
 =?us-ascii?Q?ClAyQytho1xiaKy75sWmCo6pE8E1wbdVLTw2glAgXMR4IZ1OYJhasoGzJ1mw?=
 =?us-ascii?Q?6F4YJbpuLX7Ktl2zcHjJxhIs8BC8ubb39G3RjZDnw4tO6kvHQUv9cBsFsGHy?=
 =?us-ascii?Q?2CXIeZfbde9eRFbzsIWYpGTGj3RgqJ6ZZGapYgCELlsRLUhdVaQSVGJX9evw?=
 =?us-ascii?Q?lsqTnGdkkDolmDVxFKnKFToA/wgSFIJqPxyRsjwsIvkS1oD35G/omtJM5USN?=
 =?us-ascii?Q?qpNV/ii3i/dFxBtMkU0EB1TqMuNPsAfKub1hkoIoGb1MolA5+4CoFvqahTsB?=
 =?us-ascii?Q?m0OclOX4K9t5VYvGcivS4KbX6Z+ITSSe2AEPMqbMGtG/hSwKOsozNg2a6GMN?=
 =?us-ascii?Q?epDKg43LqLnXTg0SPJQOUNcz2MkJounL7hFnGvU6K5Gj7yztcYGOT9vsv5q/?=
 =?us-ascii?Q?4KzC1hNbrN/dqYx4+klaNj32BApiIpD9TdFCgT3WsJ+DKt3xKq73ZLSLuEcr?=
 =?us-ascii?Q?mylfvySxsKZw07VNmTZ1ooRApETCxFW8kDTsL1anecIyQIV5xRoKYQfXgQQE?=
 =?us-ascii?Q?NT27DL/eW9lRW8xPh+vrnTQvi2TU5yRyFyLTjJi7Cy8EUtfPoNtJLpeAUViC?=
 =?us-ascii?Q?u6/r0NWpCeg6qB7/sYjYuDJYGAiQfE/lJhS3C4TCOE6GcCAAqo76yX3RFLa9?=
 =?us-ascii?Q?Te0EnOdgYfKRvg2ct6BbYgkzhU4lP0RqngQibnNHk2D5Y6+0am+0UcCUcCjZ?=
 =?us-ascii?Q?XZeDQT2aWJ/NSQi06MJmPC3bWy/YyYaX1yACqpjnYcoQDPcrcNI+n4129RtR?=
 =?us-ascii?Q?n6XLhbF8+UbFcRzCF8Q5qbTMWhcaE62rx9sq1H+pXtZddpj+fUxYTXCSizgu?=
 =?us-ascii?Q?uTQaHw+gM736s0n6tHfXf1p4IPJ/z6YCcR5kljVz1vziD8htPM93gCxwE0/8?=
 =?us-ascii?Q?NyUS8sNH7I8dWRgDZc8MKLsiIJ2rzah4VTOEJU0nkBJnRhV8k6A7irWOKQni?=
 =?us-ascii?Q?FGJhqzgP/vR/kVgH8e3iajzAPS5cZz8jAWEoCHKetAEdacvsLY0xXArZ89/+?=
 =?us-ascii?Q?Ovt6M38PxKJSHKN34FdPgV3qIsms6nWBG5cemDvDMoj5OvqpQSOkVHkwaplj?=
 =?us-ascii?Q?T1pU6W6WaiSlcSCd7EI/bIL1SWJT5Um9tMu4VZOwIw3ff7Mv8G0iowQ8Mg7z?=
 =?us-ascii?Q?rf1eb8NpC2nyCU9WLMVIq+fp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe549e58-003a-4fc2-de8a-08d92c081bd1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:05:58.8959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQb1yzwUKMkTttQw26yovlQBGWzvWHpkCFddAqDuctxOe395MQRpINCmHwB48fPUT7NP9SWW6l+epD0BFu3sxZKeQXqLQs4Exdz/rdkBFZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4277
Received-SPF: pass client-ip=40.107.8.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Move supports_backing check of bdrv_reopen_parse_backing to called
(through bdrv_set_backing_noperm()) bdrv_set_file_or_backing_noperm()
function. The check applies to general case, so it's appropriate for
bdrv_set_file_or_backing_noperm().

We have to declare backing support for two test drivers, otherwise new
check fails.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                          | 29 +++++++++++++++--------------
 tests/unit/test-bdrv-drain.c     |  1 +
 tests/unit/test-bdrv-graph-mod.c |  1 +
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 1717e5cb98..f835b576a9 100644
--- a/block.c
+++ b/block.c
@@ -3152,6 +3152,14 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
         return -EPERM;
     }
 
+    if (is_backing && !parent_bs->drv->is_filter &&
+        !parent_bs->drv->supports_backing)
+    {
+        error_setg(errp, "Driver '%s' of node '%s' does not support backing "
+                   "files", parent_bs->drv->format_name, parent_bs->node_name);
+        return -EINVAL;
+    }
+
     if (parent_bs->drv->is_filter) {
         role = BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY;
     } else if (is_backing) {
@@ -4278,20 +4286,13 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         }
     }
 
-    /*
-     * Ensure that @bs can really handle backing files, because we are
-     * about to give it one (or swap the existing one)
-     */
-    if (bs->drv->is_filter) {
-        /* Filters always have a file or a backing child */
-        if (!bs->backing) {
-            error_setg(errp, "'%s' is a %s filter node that does not support a "
-                       "backing child", bs->node_name, bs->drv->format_name);
-            return -EINVAL;
-        }
-    } else if (!bs->drv->supports_backing) {
-        error_setg(errp, "Driver '%s' of node '%s' does not support backing "
-                   "files", bs->drv->format_name, bs->node_name);
+    if (bs->drv->is_filter && !bs->backing) {
+        /*
+         * Filters always have a file or a backing child, so we are trying to
+         * change wrong child
+         */
+        error_setg(errp, "'%s' is a %s filter node that does not support a "
+                   "backing child", bs->node_name, bs->drv->format_name);
         return -EINVAL;
     }
 
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 892f7f47d8..ce071b5fc5 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -95,6 +95,7 @@ static int bdrv_test_change_backing_file(BlockDriverState *bs,
 static BlockDriver bdrv_test = {
     .format_name            = "test",
     .instance_size          = sizeof(BDRVTestState),
+    .supports_backing       = true,
 
     .bdrv_close             = bdrv_test_close,
     .bdrv_co_preadv         = bdrv_test_co_preadv,
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 88f25c0cdb..a6e3bb79be 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -41,6 +41,7 @@ static void no_perm_default_perms(BlockDriverState *bs, BdrvChild *c,
 
 static BlockDriver bdrv_no_perm = {
     .format_name = "no-perm",
+    .supports_backing = true,
     .bdrv_child_perm = no_perm_default_perms,
 };
 
-- 
2.29.2


