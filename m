Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3F92EFFB2
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:05:37 +0100 (CET)
Received: from localhost ([::1]:55244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDw0-0003g6-7b
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpW-0006Am-VR; Sat, 09 Jan 2021 07:58:55 -0500
Received: from mail-eopbgr60103.outbound.protection.outlook.com
 ([40.107.6.103]:49158 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpV-0003dJ-2x; Sat, 09 Jan 2021 07:58:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWRUnSp9GKpaCmqKLbwI+OGQuaYRDJmzuFgT//9MiJT9XHg9Vx5D5BldHVnH/eNBLQqaiy47po6a2kSuH3h744Ni9055QL7ZyvloEkPnTLUVSNj1yPVePXh6uVGpAJcLRx24HxNQj04twn/PvS4nkTN79lBacUvExZQOmmsTUAsFovJyzgqoqh+Zssf0tz/r4DsgsKkZ3gEygss0Axh9e3cXBh2UUW1kerbDNS3awtyvmM7jvfaEDvmp2zxqJL9d7z4h+TPCJBgm+poUBh+vurHuGoC9IGlHqW5YkG9cEa/ebq9ZbexH29bXpxvPvB0GSKrtdjyML1Zinrw8AgoVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHiqVSYrrsIGha2K3VmGGWdTMKAgFqst8R0FSwT8/Ho=;
 b=N6zpZbRvJ504sfC4zxpnLwWXrX7EvIoUCI3gcpPgqryi5N0ZSpxzTqMShx4iXJigIwkesAhGnW8Y/jge8wK81RBr53uzWZu40qaURG/OfQS6bGyjS75DE2gSkchoQU9erzvsB20emoLrlfxrJOQAfl8DIAWv8ttoEsEiGnPEofLTfag6OYv5VhjdDafsTIrvLDPH9s/L8A39rlIJnaQAXvjMRcC8h3DBhyz2j/2xWTGoIxFwsRWf7r8KeFjyg5FBgCg4jwqie+m6Qf4co/E4PZKA4Qi5F0jGGDvvjZGZGMc5NQ+AB2r4kLyXl2o/qzHaW97ixmBlhAmAKeSh/GSJRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHiqVSYrrsIGha2K3VmGGWdTMKAgFqst8R0FSwT8/Ho=;
 b=VPZ8aKXZOBy4POMvyNT6t/ywnFqqhgZlHjjz9/k0MqzUriDH2Y8VmxP5KhkgHjCVBSPOoONbKvFXhPnLHRJeoSR4HeiQhJ/ZFBBK6oDLtKhsxjkeIggQipjnupY7xprUCkkHX1yuoeOVRvakSlq4uxv9z/fXxBhe1cWjBaGYn08=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 03/14] block: check return value of bdrv_open_child and
 drop error propagation
Date: Sat,  9 Jan 2021 15:58:00 +0300
Message-Id: <20210109125811.209870-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109125811.209870-1-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a0da22c-6bfd-4fec-44fa-08d8b49e4bc8
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2418DEE8A1712E7811EB6CDCC1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yz+yLCDDQNdE25Cuk3tPJ8DOWjGrXbqbPeOfxQaUzn/3JKYB1um5VEQd80lolTUYd3r5X8ANZBlOtnxk8koZYRs5c6OAXzYKqC5ZpfYFacqLVPbKoranjJWSIMcLlwVJ+Ac8PbhK/LKskr8AVizxlK1N22fRXtwH5bAxsAwRxxk6NhvKbi8WhztkkVXqoYDvtBuIcmz8m9SgfnMgMUGcpF4lSEv1kXntE1BRgetSb8cSkzJ6Cu8V2VrWuZSj6G7n1XpAXk13Hxpua3Xwid5zvtDfG1h1SrGb7TswKPIXFNGT82dwXfCDVRM5c/JsL0sbNm7HhmzAErUHl0qJyST/NTw2u71MbxGk6CKhq6gS4sWYwN0pF9oorMiMV/dPLF+yEqfr1nPy79SVYllgQXpT5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(36756003)(6512007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dErJ+J62ZWGLqXBDn4HatVhW7+KVnswhhdTuhWHNvV9DqzeBW8JyIxLAUwOS?=
 =?us-ascii?Q?Lmlhan63+6VqsMHZ1GonufYuSHvk1z1xJS1AwnlydfQzc7KEvP9LEGltzyXD?=
 =?us-ascii?Q?Y9uICcD8EuFI3GaqtK9B6ag24BbPnp85qxDHaTbHmgkKfsr8HdEzIxnSIxB+?=
 =?us-ascii?Q?OxLxO266D+0jxxrb4xc7h1dxAW4dh4kL+VMiIIt+KnEKa1MzTEt4VpDGK5HS?=
 =?us-ascii?Q?u1NJCl7QSW0XiUROXusP234Wi5ovSEsyQFX31KzpEZI3/Pb6bs5kaXJA2IWQ?=
 =?us-ascii?Q?AYWiRyGBLAg/nm1yzsILI/rNHsNm7cGF52CCWwVXyvtj6hwyZSJT/9qOGipP?=
 =?us-ascii?Q?AQc4ssgDntqL6rjAVN/O11veyun6vZck9haz9HWnd9E/QjiXqoZcE9Q+pi3H?=
 =?us-ascii?Q?XTTLWT3l7sLXoELxpyQ4/hozmIbrJwNmZOtijjoGfzdKD7l+EsdGxddyid8n?=
 =?us-ascii?Q?Ho7WGkpmmLZbdbERs4N7ZWs28Ek0fcAdBfG9e6xOT3DLLPIPvMWDDjAlEy5C?=
 =?us-ascii?Q?Dbu7uoEGX0hhdV+DgZfzzmUvySjiEgg4ZBTy0HQOl1EpNxdDMNxGeDm426a/?=
 =?us-ascii?Q?9WS7vUa0L7ax1V1Pz+6R2BwQhhD3cOrDkRHjdx8h3RgLcSk0UHEnFHns/Om2?=
 =?us-ascii?Q?9+WZFq0snn9sR2djnO2okFrebu/GGi0jMuoCsAM1R6gbN3CbzsiylIdX4psZ?=
 =?us-ascii?Q?1d7VsDCRJHn/qeX4zP9Xbf3ZngqYL2pIaRgQ8djBi+AY5eVpOKk8hyw8EkHX?=
 =?us-ascii?Q?gFoFDxx/cn3EG/2Z9FW77VZhLnw7PC8h+QP/EdpW9OPxMcciLX/59OXLUvEm?=
 =?us-ascii?Q?dx9VLdRzCjh0HIQLa/4Nz+n2MgnchqliN9dqYQI7ANoh3WDaSMqTnn4e01Ln?=
 =?us-ascii?Q?4/xIQQAnA4BgagOmEkeodIXn66R9GyByTWKDIOQMb7+CdTOQFoXt7sS9T5O2?=
 =?us-ascii?Q?2NiYeop4phuSupwYsVjsAfIhOgKv5H9Mu308B0v5nmvr4MAoD9707LPgQRdj?=
 =?us-ascii?Q?ASr9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:44.1227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0da22c-6bfd-4fec-44fa-08d8b49e4bc8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82+YRBEipXOcbidjHc5nAmcTUvfQi9dbaibtb9ROFnDQvVV/AHj+2OScEQY1o0KBFLGuxFNbdpccQjrvLmzfKXXBkediex+iDCn8fwebm6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.6.103;
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


