Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C965263670
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 21:04:48 +0200 (CEST)
Received: from localhost ([::1]:52594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG5Oh-0007OK-GP
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 15:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kG5K8-0006xA-0a; Wed, 09 Sep 2020 15:00:04 -0400
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:14387 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kG5K5-0001M1-MH; Wed, 09 Sep 2020 15:00:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGSvqGaAm1A47LimDuf60zrkja2FoV+Xw1b04PqgjjFFNfcu+jSKlA+pGr6DDF5mDgNcRCo/wjj/5HtdzsSFM5hYHEoyfs99CCmNObvWwOzAs/4f+xcTBVQ5Pze8VQolLJqvIWMlGGXYMPQ3AIK+jGYgHb8dWc7dfIcZQzJGIjckeUFMLXjITDt/alWgF6IVulid9W2z0F2MkJsl8trGFnrjOQY6SB1unCYD9tMde9ehDdMkOPmwKqQE45zwZ9hiTmerAEIowrab0JA+evUlOxnjaqNaT0wjACZO/ftEpvMbgGJraEZ3lBbj4RoTubsGAEVHWKr6klEh0+7Qrg53jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnzOepWiRNRv01gtCFqb1rAkjWW4hFo7Sf1MJORZjik=;
 b=ZmiB5vxSOOmY7HfW034xeCAURBA/uC8KZzH1oyOefrj5U+YYVSV5S3QsnsXA9nyp1u50qhtw1Xo4BpW4B5tj6tfs1x3d7PlMDczUOJXqEBpEsdF1mWVBvhX2Y/ZBO6EAmhyudHPiwEaJPVd1lCOhFjT9AmAcSV0/E+IU0Rcbg/URNKtycZlBwVjxJyEO9RJAGiBMl4mD/QYSjm/WP/yKo8vN+y4BfMu4lTfklI0LXmxZYxnurMniyZ1urbi8gzFQuvE5q2K7iULVSX8KagaoqsXD+hyfCZLgRpanrCO0M1wMs1cWFcg3u5z5H+f6fSSeFj3Z0SxVgYmiPnhCFgS01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnzOepWiRNRv01gtCFqb1rAkjWW4hFo7Sf1MJORZjik=;
 b=WHwe2OI1qoG7rz7+OSxZPBNlC/3iNZJSKtCs69eW3EOSidknEamTUqlcrWyguDvohJF6EBuOD1CqUizaXSxiLjEAKZk5LkFoj4nDcW8m5aBqC0+6uD0p2r8er39BlJS6jrC8VQPVm/V106Ykt93edzFd4+bv9hlBzY5xPI8r1v0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3445.eurprd08.prod.outlook.com (2603:10a6:20b:43::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 18:59:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b179:9641:7589:d692]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b179:9641:7589:d692%7]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 18:59:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, berto@igalia.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, jsnow@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com, groug@kaod.org
Subject: [PATCH 03/14] block: check return value of bdrv_open_child and drop
 error propagation
Date: Wed,  9 Sep 2020 21:59:19 +0300
Message-Id: <20200909185930.26524-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200909185930.26524-1-vsementsov@virtuozzo.com>
References: <20200909185930.26524-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM3PR07CA0054.eurprd07.prod.outlook.com
 (2603:10a6:207:4::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.136) by
 AM3PR07CA0054.eurprd07.prod.outlook.com (2603:10a6:207:4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.5 via Frontend Transport; Wed, 9 Sep 2020 18:59:53 +0000
X-Mailer: git-send-email 2.21.3
X-Originating-IP: [185.215.60.136]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 715aacab-7082-44c9-c632-08d854f2897f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3445:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3445B5594D9A7E4C6321D255C1260@AM6PR08MB3445.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2NABOHVqOXPWBttiuAmoyQ1mqjd4PhhYFBQLpfUNAh2PXotN2yRO/p5UImGvrfd7NXyY94wuY4EqMUTC6f8y7HuZJ0X+zeiQC597TGe8MUcYj66CTeYsvi8q8KYa5HIbeL2SXEz79LDUxlT4TATGKY72Dtw06StVmL5h6JmUT7Z9F1smlwPvhGnrvZJXCK7sl3X/GKpu/1XdgqxpDKGDB4WMmAt3AcSLkeOHzKwR3YwLsPoqD1N+XESykvqMG7BcaXDq413T+ugk/Taszqyxmjnfhk6FV19lpLP/XeFDEJto6Ug/MrHgJvHI1Jr8RmFE/YmEhgbMSH2lYgdGfBniWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39840400004)(376002)(346002)(66946007)(52116002)(83380400001)(2616005)(956004)(2906002)(6666004)(8676002)(6512007)(1076003)(86362001)(5660300002)(26005)(36756003)(6916009)(478600001)(6506007)(8936002)(316002)(16526019)(66556008)(186003)(66476007)(7416002)(6486002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Nea+cX6ej+1OCvP5YPELa6+6sCxgY8E1AZm8hx49gHXt4ENllJ2d/+JirBpGNZ3t+tB4zJ4Nxg2cD+PrkM6gcHgAZJgJFS7mq7jGTLUgSdBCPOwb4Qv9uknlOvpPtFV2nARoW3OXg2rvHxN3G2fqRm26whC5A9d5whCmxOhlGfokIsGn3c9feU5YdHrRuL4Ei1PkHLt+E2tBod65jqchXACDlhgU8Kzgmp3KBeV9AUFbD/gbQWPl5f8FCu2NZmaDDOXrUg7v8rx9Kfhh5OE2t259zEcUZ4BPW7Gvrql5kerGSiWcfaZ7tgcErlqrxXtfZBqcKqREjyz2yHsic3D2ZUzN2HEHOgTnbJaaeyrpqkx25/3i982A/3Wzx7dKsMnb0P8jr19KjmLIKM9R2+41PFTYdm+Iaym5imJ+/1egjNoh8cR8ETrSgGgvtcEAFo1p5UforZ8qy/Ohi8NmCprf4FdaXmDJH0LMJXfwlmdyA2ZZDkrKAcS3wRl/d7DAgW6BbXEBESUeg0SzGkVYFaC8r8QgsPoOpd/CDOCk46OK4+uQxK2uBFjFvi60/sFbq4qWpvKAevLUUkAJ9r4CpxR18G54hMwL4g7tUu2Cs16n4ACGg4UgUIofrb7HYwYGCACKQ5UiQyzWLrmrFX0d5PHUoA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715aacab-7082-44c9-c632-08d854f2897f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 18:59:54.0537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdBWYqZP1yXr17Cw18rmDEuusJdjlDSasvfsbMX5W8DKwSTgYwYSNSJGNZJhSJrxeYR15U3uQlPRhsoa2t5YgqOf+MUi7lanPJBDCUAn1jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3445
Received-SPF: pass client-ip=40.107.7.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 14:59:51
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 block/blkdebug.c     |  6 ++----
 block/blklogwrites.c | 10 ++++------
 block/blkreplay.c    |  6 ++----
 block/blkverify.c    | 11 ++++-------
 block/qcow2.c        |  5 ++---
 block/quorum.c       |  6 ++----
 6 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 9c08d8a005..61aaee9879 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -464,7 +464,6 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
 {
     BDRVBlkdebugState *s = bs->opaque;
     QemuOpts *opts;
-    Error *local_err = NULL;
     int ret;
     uint64_t align;
 
@@ -494,10 +493,9 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
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
index 57315f56b4..7ef046cee9 100644
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
index da56b1a4df..10175fa399 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1613,9 +1613,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
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
index 6df9449fc2..672b09e13d 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -898,7 +898,6 @@ static int quorum_open(BlockDriverState *bs, QDict *options, int flags,
                        Error **errp)
 {
     BDRVQuorumState *s = bs->opaque;
-    Error *local_err = NULL;
     QemuOpts *opts = NULL;
     const char *pattern_str;
     bool *opened;
@@ -976,9 +975,8 @@ static int quorum_open(BlockDriverState *bs, QDict *options, int flags,
 
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
2.21.3


