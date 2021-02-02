Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A5C30BED9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:55:53 +0100 (CET)
Received: from localhost ([::1]:55478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vDk-0007sZ-4i
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8p-0001ET-3t; Tue, 02 Feb 2021 07:50:47 -0500
Received: from mail-eopbgr60139.outbound.protection.outlook.com
 ([40.107.6.139]:33232 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8m-0001qn-LP; Tue, 02 Feb 2021 07:50:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOOtDXyIsbqapLY2Zvz6KwpK7605pyHeW///97rSDl1rCrL5uTYLmfLfZLFnoTUs8M1cvhwFpIG1QiPQeBHPXwSy6x34YAvFUEKu5Jk3m8unpREjnryIoskfy5tAxZzt6eDyVwH43g4v4/yRqFu6n2XcunqcVbYXlTYE14zNAhEoUAyVWTj3ZItRpRvb3oO3WRGceCUVc6QVGWKPYU/uxfUqmXGNz2vvE2OOjkK1lyD4yI6vJxRT7YX+oBPFCidGslVc5V+M0cCTNY/0eTglgi7QTX8O0xISEIaDvCtsnkUnGsb0f/MOeVo7vZrtG9Y2EGoVZ51HMq1yBWPkiR0vJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHiqVSYrrsIGha2K3VmGGWdTMKAgFqst8R0FSwT8/Ho=;
 b=DBkh06THBPJ3fDcWxLLt97LWfGOjtzdfbQO5eyNBMw1YjGH55aBCOzCbZJXPXUyhjuJfyeHgeL34atwpEiDshzdbB+jFdC8EdpwMRlE/1+lkXj32QckzmCX/gHK5IvxqvPahwSowDPcyha9flUvb0wcYeJgQRnozFex26fBoLOrK8A8l+2J3otEOYAeMp7EwOLehGaPznvtvzo4PTSghhORu6eHagDqHhtCdg7nXwHW6YmNpuHiKsrM/oQtzhC0/m0UahahtYNT4BgPi7fbaz8A+6M4i66cHebQXvEnJRSg2OhfB0EurELLjhHNUmrdykHBAnUpjdbiQ+THhU1ZJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHiqVSYrrsIGha2K3VmGGWdTMKAgFqst8R0FSwT8/Ho=;
 b=PsgXnoYCPSK237S1x8pUNtuTbHBtNS/NuGGRHlgd3vnGrF3TNuU8Jn3fLK8ebe4VGBsqWHdP0x6ewGjIXM3O0mEKtfclax/1Adh5NOE8rVhLtpOLgoswutA4NhDfD21VKbUXEFyoSCl8bi/fLdulV6tbf2PMKFvnAEzFden1dCA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 12:50:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 03/14] block: check return value of bdrv_open_child and
 drop error propagation
Date: Tue,  2 Feb 2021 15:49:45 +0300
Message-Id: <20210202124956.63146-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202124956.63146-1-vsementsov@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.137) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6623e45-e895-4047-ea59-08d8c77921f0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3623:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB362356045F2DE176241E8226C1B59@AM6PR08MB3623.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FKRvT7ZpzBohTvxupQl+Lss8I9sgO9kIbP3rrTy3VJ7pw21yoDHOWURHVBgQ0tths0+FyhpYk/yDbw9SjqwcD+CXo3Y1kJKeldKQSqct+m04c+CBMO3mnChISbhbpnIP40mzfdmlkIZ/iFTFl5OLFqE0puTg99+zrzOJ7TUy6nqPYmeUUusXCXSFOgBbW586YIWw5LPjUzr6Np416E56r8WbfbfVF0QrYYjXxhfjmW9qmVfj33DTf0GS0/0EcZ08GJ+yfztDnu/uFMw/KS18IyE5tbAJD+HBucC7RnH534OXq9zw9wRHc2mJPMMxeao0simR+nFSYHJPjGURqnXhVj/Vk0hIK8lBIC93/+sQkP1zrl1Ya1ulMQyRajhhf86NCbdXuovtx9VndfOpHOyeqJZvNW8Rs1XPOPokeoQOjsK7YU8RGCrk3/JPJ4O1vxuklde1jEGKksWY1TvjqhAP3vrXrQFHm2f3/qbRHDMf0Jh4fgRy81SBPdfN9yDSFxY0cflqa3yx9AQDUHf4VWsJNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39850400004)(376002)(396003)(136003)(2906002)(5660300002)(66476007)(316002)(66946007)(52116002)(6512007)(66556008)(36756003)(8936002)(6486002)(86362001)(7416002)(26005)(1076003)(83380400001)(186003)(4326008)(16526019)(6916009)(478600001)(2616005)(956004)(8676002)(6506007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BohCMvYWu8PAs3nNOjYqd+NRv8tw1JOrYPMUDUSvNnKcswXtIBI0DnnWqkB0?=
 =?us-ascii?Q?KF3DgtNMI0h5UXDy4duJw2WFUOQwbj1bXf+kQBOQVWpORbQwx5CQo7dCUHzj?=
 =?us-ascii?Q?82NvwL5soZpVnUC4WoVybol4DKLV+U4lyriUvZg7/Ga7wkk5ah1aqOmQTwc1?=
 =?us-ascii?Q?/8iiUS2zcIx1dWzaFR2bB2UryLS0cxTpdehgyg0MIiH8FWU9VycujTRkhaqS?=
 =?us-ascii?Q?Cyk03d/sZVDplKKnEXwaZ4JkbnVoecUDPFTk8pCoklbNpcElV/x0I4nGZKM4?=
 =?us-ascii?Q?NrncxNxyNHJ74MXOS0JXZGmDkvkcRr5BWraNwPYCAhVQ3g4vLjDt3mIw9xXt?=
 =?us-ascii?Q?HNuUVdh/FqB4LDsEZoSTvT8Qb6m5lXCzP99SXSGAn2Z07AsiREsjodkkjw/U?=
 =?us-ascii?Q?g9MdP5EEqwf96GTX8nFL+rX4i8Lu8xVSUAnQXI9pe5kwkwgdkOmgbb6PF2VS?=
 =?us-ascii?Q?4erBYh1abQFafOoR6mWuGWvzT0inunVjPViOWA5DgG5KVjgpM4zBjOMkTndy?=
 =?us-ascii?Q?A3uRynMC/0VBJOYKmrHLGQw2CnGhX2+nsqjWK0Rvzo4agM7pSXnLEbLylDkv?=
 =?us-ascii?Q?6oCZqquE4jD/XGVZE2E8dOHoVT6nprRKzmJERzVRmkHWvTlvUlvXMXdGSPbh?=
 =?us-ascii?Q?JSDH+rdE+F9CsMzCZEFA4lNfpsFtNMU65w51N/J2OjmvvM2UKKYqtJB4liq2?=
 =?us-ascii?Q?vjdiYc974JPR/I0WgVeWRX0vbi/L8kDDJHlYlb651uqgQNVseD4u2phikwB7?=
 =?us-ascii?Q?LCGDMMdrlId9yyx3ydYWsTJgvsqUC/B6Lt7cSpjP+jFH/8eInus3/zmvcjrQ?=
 =?us-ascii?Q?XVHBAHKDSXZVXKvt8LQiaYX/UuO7ATCrHNdjXwjT7EM20zO9QLyl3poverL1?=
 =?us-ascii?Q?xdcQTdtZbOKXUpl4dmVOf3Qu/C+e9UA+Z0yzEzgsIpM3g83UYOdEq3UbDV0P?=
 =?us-ascii?Q?Ke0cFxGEUwOKzFrNwEXrfVXLBcBD6cmVK091nGp6Cn1SSN9Eqk59XvjPXkI1?=
 =?us-ascii?Q?4uifOkIPDZ2MSMlCCm3xgatOFtP/4UQgUG4bR1B4QOhp0ymTsKaSiRg4zuYm?=
 =?us-ascii?Q?eiF3my0Y?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6623e45-e895-4047-ea59-08d8c77921f0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:34.8666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q81K6QvtvlbLL1LTOEtPSrfCn9Lvoi9dCBWrjTsrlaA9tFKHk+ixS7NPF0gW7EmhU4oHBm0hZ4WgmVST+1KIfw1bPjztyfTrEo/zspMOFsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623
Received-SPF: pass client-ip=40.107.6.139;
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


