Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA962F8F99
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:08:00 +0100 (CET)
Received: from localhost ([::1]:35906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tjj-0006xi-2W
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVD-0004ON-5t; Sat, 16 Jan 2021 16:52:59 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:35449 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVA-0000ae-Cu; Sat, 16 Jan 2021 16:52:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hutX3dnkQ7/mMgT1hny79FJtinlX1L9M2N1cfzrEukRuzwYdreNwN/oWHBGPGHk2fSXOgxMGwpztEAg9EBC9twwTWB+nh4pzRwuO2AH0B8/VbiWxhQ0ypTxPSXk9HgLmxCDm21ggSjtOzeDTV4NdWDlYfXjej9JQHroFwTSoHYvzytJUStNuLhAdzRqns0u6YrtkIgEUM1t9yovuHVkhV3NI1DCA1bLs18v2D4q4qPCG+REecPkTfbp5pMPCmmGOvL3jOT1l2wmxqScqU5cD5SwQbnwclGWe2eINgUe5I7bvftx26L28YwEBVfL0kbrL9JrAikvgG0atHLjdDrlTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHiqVSYrrsIGha2K3VmGGWdTMKAgFqst8R0FSwT8/Ho=;
 b=PycblVjJI3Q04AAhr2TFMJdAUa9xrqgyqgAxiIk9MRAkCNEW+GXKQYxFsqfZaiA46SBq+peTJAR96hfXOy6hFf8oseTwr8KM+Qn6o4gv14+URLA2K8YdtJllSKsv15/ljYplbCaVYRHTG+OH8kqqtyAMMlXGma4q193n0AmwoWPHcB5JQd1VLCSTjfuNJfzWaa1kGX5jbjbgpJltrlzU10aY16DXH1WykBi/o34GIh3DXr8rp6PfzZm0rpUg34+/dbt19r6msdedtT3tzl5DQvUWTWlh4+lLvOnGmlSibbuPnkzhC6AOtCHbsMmrGxXXosiP/vbBDZHOnmNPJ9WSKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHiqVSYrrsIGha2K3VmGGWdTMKAgFqst8R0FSwT8/Ho=;
 b=LuSna4ocIfF1XYywuS1yUjuSnDfEcvJBPhdHoooy0yAi50yzv5ZjBDdAbQ6deO0Pa8ADWFOcpQw839ZXvp0UaxvsjjrONeLT+mmd/7mDFh16G9FtFjcU1bM0O47QPcyIP32RWx6VWk7uOFq/LbNjCrtQlpeJgCbDPIm90lEtFlc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:52:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:52:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 03/14] block: check return value of bdrv_open_child and
 drop error propagation
Date: Sun, 17 Jan 2021 00:51:58 +0300
Message-Id: <20210116215209.823266-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116215209.823266-1-vsementsov@virtuozzo.com>
References: <20210116215209.823266-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ceca64c3-dde8-4419-3a89-08d8ba691030
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB354260F4F044376E728C93E3C1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9zTHbUBCwJvcRhTgjjUsiHuw5aiBR77rgWOItIcNP/92TgIKXYFv1XJDrGVKHalqprAf6+gi/D4BHJ3vbX2boGZ6qFNtxBNAgi8WHuhHSHy8+SUj/0AMgpMSjyfHEnfcc26u06VMsVlG2TJwxLRYNsdyLxx8xk31UKJlQjpFuIRvk6BDJSfr7X4B5wHgWGPKD8zo6ZfvYki5TTqj3iVl3HDD82Vvyq7Kh4EPdft4VEnlK9Ohofz1GC37b4MKSek2uDXlLjTMOo60vbOCUn5w8BaBygnIMCSBmzqc2Aiv1o1Wqj6ejl1GQV7cxMR8SA9EOfwDI4kGCyF0GSC90X+/2VNblB5kri1NH1F6O2Hg0eBS+LljJEV9HGSBe7qkFtQfZSAerlxG6G1Vs7zUwJALaHTf13aFWQ24BOCYYvtIhNxeFklnnLgLeyHJttgVJpX/6wIMK7r0HqUosR0vUL95o2JZpS0+XSFVzPu/Pl6w4ljU6lX1aHXN+tPuTGm0BKBymtcASMeqd/lZl0QS2t94jA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UNNQa0beh2nX7mLRp7KGkShZ7FEzzvhIXgDXt/5aJF+4VJLWz/9QuT4vc14h?=
 =?us-ascii?Q?HZJ95WarAEuETY9o6bxIEplyvQ61394GlHL8ohJ6kNOWq1r0RIQ6VR4oXIOo?=
 =?us-ascii?Q?K7m5O7qxjSYTDnqFbKfyRoknrzm7l3bkf0RcfSq75YrocFnFULrem1XH6+f3?=
 =?us-ascii?Q?ZKIngPDUTWkhkmenTgBArzYUheMCt2t84i4fCryItNiLqCTr1zyZbfPbZOeK?=
 =?us-ascii?Q?0F15v1/PSY+SFfdBUpOQLWERT2KrjcNiCl4mF85TZExkNZg0rjqr6qAHIJMt?=
 =?us-ascii?Q?31X7zu2wkgl3ojCkaKgMC/gjyKYNsX0jNVNaOh5hI+3t2B9oe8Nw8InSjIYh?=
 =?us-ascii?Q?sK9uUtNzTEg3DG1iXBdQhbvXx68dV3Hr9P7eMpRFKiZGf30xACjXcRTbbGhJ?=
 =?us-ascii?Q?G7UEn3HDllavgXgVbRH5+ikM/vds04uUgZ4hETTB3rOFiwhR9/Z4rQh12HYk?=
 =?us-ascii?Q?96CXqTrxqhlrqWXNGQRX5kWxh38mQECIyXJHQ462Hdfxbn63EF/647auBoGp?=
 =?us-ascii?Q?u7uYv06UR18MBvB7J+sqosXFOlF2f7gDGB9LAnRgG8vDtVKf5+2vilfKPzUj?=
 =?us-ascii?Q?8N+k+ZlO6+J36XWslJfJOgGvk1pM9B524uPJ4jodB2dodKlnyMKzxxacJWNN?=
 =?us-ascii?Q?8ijn4eF9NcgHfHpagc9Ng7a+EWtWukMu7qYycGSaHQqiM+HsclBdTCFflx+Y?=
 =?us-ascii?Q?1O28A7r1eOPqYet7sXOaZJD3+kZOBE+YorpTDkYsvy3qrbIv1zD55kG7JZ1o?=
 =?us-ascii?Q?q9VnW2ZZruM6ZsHAscXA+pOwpv9F4F+czRozgQ3SGpGIwLUTtrKJ+v6UEV6v?=
 =?us-ascii?Q?1Fx6FsB6W0g9ctLYlBmdXO8obMmrtGzN9mGJ27XrdMgM/Nz0rMceEpVZWkPn?=
 =?us-ascii?Q?oGpeSYPUxUVJU+pYrfwg9KfbFp5H3dgwRdG+j57HdUqtr1/759C1e65OlTgy?=
 =?us-ascii?Q?jxU2iUZH4Cs90PkPa9RxU+C/e/s2Rrr3nG1ja8n1KAahBB5XLDBVJpBDl+so?=
 =?us-ascii?Q?tPWv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceca64c3-dde8-4419-3a89-08d8ba691030
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:48.0277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEKmTC3d21bUyvEb3ljRwkLPq+sGHqY6nlH51hzms+DwNNQr21uPHYeImYrZe0SWX+7rX1RNMABcfxuSfNcfm5hfPeuCOR8dppIr+LctXnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is generated by cocci script:

@@
symbol bdrv_open_child, errp, local_err;
expression file;
@@

  file = bdrv_open_child(...,
-                        &local_err
+                        errp
                        );
- if (local_err)
+ if (!file)
  {
      ...
-     error_propagate(errp, local_err);
      ...
  }

with command

spatch --sp-file x.cocci --macro-file scripts/cocci-macro-file.h \
--in-place --no-show-diff --max-width 80 --use-gitgrep block

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/blkdebug.c     |  6 ++----
 block/blklogwrites.c | 10 ++++------
 block/blkreplay.c    |  6 ++----
 block/blkverify.c    | 11 ++++-------
 block/qcow2.c        |  5 ++---
 block/quorum.c       |  6 ++----
 6 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 5fe6172da9..315965a013 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -465,7 +465,6 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
 {
     BDRVBlkdebugState *s = bs->opaque;
     QemuOpts *opts;
-    Error *local_err = NULL;
     int ret;
     uint64_t align;
 
@@ -495,10 +494,9 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
     bs->file = bdrv_open_child(qemu_opt_get(opts, "x-image"), options, "image",
                                bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, &local_err);
-    if (local_err) {
+                               false, errp);
+    if (!bs->file) {
         ret = -EINVAL;
-        error_propagate(errp, local_err);
         goto out;
     }
 
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index 13ae63983b..b7579370a3 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -157,19 +157,17 @@ static int blk_log_writes_open(BlockDriverState *bs, QDict *options, int flags,
     /* Open the file */
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, false,
-                               &local_err);
-    if (local_err) {
+                               errp);
+    if (!bs->file) {
         ret = -EINVAL;
-        error_propagate(errp, local_err);
         goto fail;
     }
 
     /* Open the log file */
     s->log_file = bdrv_open_child(NULL, options, "log", bs, &child_of_bds,
-                                  BDRV_CHILD_METADATA, false, &local_err);
-    if (local_err) {
+                                  BDRV_CHILD_METADATA, false, errp);
+    if (!s->log_file) {
         ret = -EINVAL;
-        error_propagate(errp, local_err);
         goto fail;
     }
 
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 30a0f5d57a..4a247752fd 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -23,16 +23,14 @@ typedef struct Request {
 static int blkreplay_open(BlockDriverState *bs, QDict *options, int flags,
                           Error **errp)
 {
-    Error *local_err = NULL;
     int ret;
 
     /* Open the image file */
     bs->file = bdrv_open_child(NULL, options, "image", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, &local_err);
-    if (local_err) {
+                               false, errp);
+    if (!bs->file) {
         ret = -EINVAL;
-        error_propagate(errp, local_err);
         goto fail;
     }
 
diff --git a/block/blkverify.c b/block/blkverify.c
index 4aed53ab59..95ae73e2aa 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -112,7 +112,6 @@ static int blkverify_open(BlockDriverState *bs, QDict *options, int flags,
 {
     BDRVBlkverifyState *s = bs->opaque;
     QemuOpts *opts;
-    Error *local_err = NULL;
     int ret;
 
     opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
@@ -125,20 +124,18 @@ static int blkverify_open(BlockDriverState *bs, QDict *options, int flags,
     bs->file = bdrv_open_child(qemu_opt_get(opts, "x-raw"), options, "raw",
                                bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, &local_err);
-    if (local_err) {
+                               false, errp);
+    if (!bs->file) {
         ret = -EINVAL;
-        error_propagate(errp, local_err);
         goto fail;
     }
 
     /* Open the test file */
     s->test_file = bdrv_open_child(qemu_opt_get(opts, "x-image"), options,
                                    "test", bs, &child_of_bds, BDRV_CHILD_DATA,
-                                   false, &local_err);
-    if (local_err) {
+                                   false, errp);
+    if (!s->test_file) {
         ret = -EINVAL;
-        error_propagate(errp, local_err);
         goto fail;
     }
 
diff --git a/block/qcow2.c b/block/qcow2.c
index 5d94f45be9..e8dd42d73b 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1611,9 +1611,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     /* Open external data file */
     s->data_file = bdrv_open_child(NULL, options, "data-file", bs,
                                    &child_of_bds, BDRV_CHILD_DATA,
-                                   true, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+                                   true, errp);
+    if (!s->data_file) {
         ret = -EINVAL;
         goto fail;
     }
diff --git a/block/quorum.c b/block/quorum.c
index 0bd75450de..cfc1436abb 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -929,7 +929,6 @@ static int quorum_open(BlockDriverState *bs, QDict *options, int flags,
                        Error **errp)
 {
     BDRVQuorumState *s = bs->opaque;
-    Error *local_err = NULL;
     QemuOpts *opts = NULL;
     const char *pattern_str;
     bool *opened;
@@ -1007,9 +1006,8 @@ static int quorum_open(BlockDriverState *bs, QDict *options, int flags,
 
         s->children[i] = bdrv_open_child(NULL, options, indexstr, bs,
                                          &child_of_bds, BDRV_CHILD_DATA, false,
-                                         &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+                                         errp);
+        if (!s->children[i]) {
             ret = -EINVAL;
             goto close_exit;
         }
-- 
2.29.2


