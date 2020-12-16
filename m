Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385882DBB39
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:30:06 +0100 (CET)
Received: from localhost ([::1]:48436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQK5-000685-8y
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ8B-0002yo-S6; Wed, 16 Dec 2020 01:17:47 -0500
Received: from mail-eopbgr00123.outbound.protection.outlook.com
 ([40.107.0.123]:51180 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ88-0001E7-V4; Wed, 16 Dec 2020 01:17:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTxbcMsGmzVC2khyzwK/ygM9SE+kpZHOAAYRoUAPxz5+6KoTK/O3kQ+MGdxubKfJxSrsU5a8qb5I5kZEIflsqKif1A1Glw5zORJq1c+/w/RBqqozp9MocV1S+QcRb7I0ClQOR4+6dzN/8v9H5qQc/6qF6j9TbqE2fMeRNdvJPdRhhM69PM5Uvz2l9bVXqXzvkKYxjz0cRKcmTSA11H/O+SNOShxePmRPKHWhwueauEvJ/nhrVRomT/04E6fIvznbz9eN5+I5jY0exv0x01U3BppnlPWBiivn8SakKHtgLzS9mlOTUKVRObdGp2vnW0qr2j3Xtd1qwNgAu2oorYWU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1EN1Y/Yprxl4SBjkfLXYv0cV9ISMI/aWeFX9S/Ue4E=;
 b=mUSgxgs1ua0N65x8Uo7l6X1oeNVThD/24VqON4GcbpKL4RfPCwDlPteq/zzeRPqLBnX/OlLt0cte6N0GeJBzwYOSXXsw7GHFEJVMAOIeyJfnVLGFqJsj6u0LKmrk6CHntuy6l2JGMD8FXgjTk5mM1slIxL8uWD/f4JcOyrFFnG3yKaREdplaWb7Hne315Y9qLSTredetOVTYFN0AYQqLgz3zz1JUtP60ANV6n+iD4HHZASyAGwRaAteysZX9vdFdWNi0dGmEFnShARJqQe6aMqv5T+nZR4uIs0o6XeedckdXQEc48k/+yndsR+3tGBDq+LrF7ngsp29L92dyUSVfMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1EN1Y/Yprxl4SBjkfLXYv0cV9ISMI/aWeFX9S/Ue4E=;
 b=JcJZvmebsKxdq+eS7tARSEkkT0gCZiTQyzQkSFd8YhYkc2rbYTpxlnlTaBDIH/j/GHkLfQtZMNtmNM5flQnZoc5uG3se8PqZ6wUYisedBvP2B49XKuPsOJQOYK+cB0RU8beuEkLkfhcX7uYKrLQ2zOs050AJScOmCimPb9dWExc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 12/13] block/stream: add s->target_bs
Date: Wed, 16 Dec 2020 09:17:02 +0300
Message-Id: <20201216061703.70908-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216061703.70908-1-vsementsov@virtuozzo.com>
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69f0e266-409a-4083-a731-08d8a18a4443
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63090CECB154A0E719C4102AC1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:137;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ULBTZN6c/J6fh7h9df2Rx5fBQI/PoiUB1nGPz6c7froPzCxHUiL1n9t3hFZNeHBw0Gn0x1j4wKgJsQWAnVuTC3BIpxTa+/67NImc5aqcNZNP10BnBfY9g8JEBdTHVNMZ29aX/ZeK0m/00ZcSzo6kkyqE9M8rMucKLrBoKforUUyswYkWMLesxUWC82a+L9p7wi0Hw4RCSaXY5hHGMqtengwtX67SQ6R3Wku546/tY3HOam28S6VwyWR4ehpibYzTuUjNqZbgEj7ZPXOT41VjikCyPshmsPC+VL8oN7EUY1HJxZUMaSjwOjHdYbtv6ovLKhjSQrx4CwNcWOL+wMgGIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39840400004)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ejXUsUuZbrLHg25uafrQszJoUDs1AK9iJ6cfIJIV02+A8Ghrk9S8vD6WJiKH?=
 =?us-ascii?Q?5nffPdTm2kpwvvYb54VwOHajtUXXn6bkfT6vYCHduvIRu81IiP/8+b2mFqY5?=
 =?us-ascii?Q?1RWS7SeGz+/oL+7UTuU5mvBtjuEKJPLSyYkwAlX2Z6nxxi56tWbQ6BmIar1d?=
 =?us-ascii?Q?2sHpwg9nQCjPPs7/UNAXuZ4cQ5tdHYG+gcqEY1Qdb6gc2lm8ienUYQTTJfjk?=
 =?us-ascii?Q?JOBe+We7/Ubk6bA6P+JVZ8eeVfDrqQCP3ivgrRX9c5Go1IdT7C9JrIMCvG5t?=
 =?us-ascii?Q?rKppZoVm9Egk/rSgINImCEfSk5mCr6B1dxNAAkovhD9Yjfu8ySxIXQB79NfO?=
 =?us-ascii?Q?GHgWlmVoeXR0g0gh7Aj4lZBIYN8sbvnBGvuXcfOGnnEbwOT0kkBxOgNI9Qjn?=
 =?us-ascii?Q?1cXBSnL/sLnpGF/gwurqP8geWije0qMzKrS6WnGDkQSPfAjEpeuKs7tH0LJC?=
 =?us-ascii?Q?H44HN+WikTKnItoL8/Hq9XF1q5Y2CfUSy1n4vT4F54/oD4UUAvp64M6durfU?=
 =?us-ascii?Q?HAD4qCsrwhe+ntY4poOB5LF8MwAg0NaQDdQBuenQHCFcK+ZJ6F2A8wF3YpYP?=
 =?us-ascii?Q?5LPCRql89k9zx3O6asw43h7N1nVwR0cgaonYOSPR5wOPHjyJjDkdSiN3XBj/?=
 =?us-ascii?Q?Zs2RtDz5C45P0ZywkseyBJzFMXkmKd72n64+IsFcGCWflXokNTFYVN7Bg3Jl?=
 =?us-ascii?Q?raNHuE7obvrkVpaj1LlQEekTOmpRLlKMHSGZDQ15Vd9zPZkQ5Kb90FVdIUDb?=
 =?us-ascii?Q?7MhuWvFd83iFsJ7tYE1vLTkA3qwE9F8gtBQz5D9Bc1lba0Zmi822VL5YdMU4?=
 =?us-ascii?Q?ktgia0+kPDETXSzJdToGkmQcULR+7Ph5jzI3SPmLMmaLHVkYlnlVUFDK62jf?=
 =?us-ascii?Q?rO/4YVC7MTXux9jWYer7MlDU7ZICEZyuHo+6OkrZl6ZTRygYTkW68gHIOhht?=
 =?us-ascii?Q?g2j+ArA1cXuSnIiLFZWrDzDDgyuU+kxG4pw8v5Slo2g3D2LotuTaefsm+d7m?=
 =?us-ascii?Q?BOK/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:29.4583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f0e266-409a-4083-a731-08d8a18a4443
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yP0VPnpKSt6FUds2hkP8GEqW15S06rpaGelx7uSvgMB4Ic7tGU+l90ZeWTuvnjALOECBawTsq/zQ0A04ukDaRxhDZBno2we7LDj2yfZHTNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a direct link to target bs for convenience and to simplify
following commit which will insert COR filter above target bs.

This is a part of original commit written by Andrey.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/stream.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 045d6bc76b..626dfa2b22 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -33,6 +33,7 @@ typedef struct StreamBlockJob {
     BlockJob common;
     BlockDriverState *base_overlay; /* COW overlay (stream from this) */
     BlockDriverState *above_base;   /* Node directly above the base */
+    BlockDriverState *target_bs;
     BlockdevOnError on_error;
     char *backing_file_str;
     bool bs_read_only;
@@ -53,23 +54,20 @@ static void stream_abort(Job *job)
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
 
     if (s->chain_frozen) {
-        BlockJob *bjob = &s->common;
-        bdrv_unfreeze_backing_chain(blk_bs(bjob->blk), s->above_base);
+        bdrv_unfreeze_backing_chain(s->target_bs, s->above_base);
     }
 }
 
 static int stream_prepare(Job *job)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
-    BlockJob *bjob = &s->common;
-    BlockDriverState *bs = blk_bs(bjob->blk);
-    BlockDriverState *unfiltered_bs = bdrv_skip_filters(bs);
+    BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
     BlockDriverState *base = bdrv_filter_or_cow_bs(s->above_base);
     BlockDriverState *unfiltered_base = bdrv_skip_filters(base);
     Error *local_err = NULL;
     int ret = 0;
 
-    bdrv_unfreeze_backing_chain(bs, s->above_base);
+    bdrv_unfreeze_backing_chain(s->target_bs, s->above_base);
     s->chain_frozen = false;
 
     if (bdrv_cow_child(unfiltered_bs)) {
@@ -95,13 +93,12 @@ static void stream_clean(Job *job)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockJob *bjob = &s->common;
-    BlockDriverState *bs = blk_bs(bjob->blk);
 
     /* Reopen the image back in read-only mode if necessary */
     if (s->bs_read_only) {
         /* Give up write permissions before making it read-only */
         blk_set_perm(bjob->blk, 0, BLK_PERM_ALL, &error_abort);
-        bdrv_reopen_set_read_only(bs, true, NULL);
+        bdrv_reopen_set_read_only(s->target_bs, true, NULL);
     }
 
     g_free(s->backing_file_str);
@@ -111,8 +108,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockBackend *blk = s->common.blk;
-    BlockDriverState *bs = blk_bs(blk);
-    BlockDriverState *unfiltered_bs = bdrv_skip_filters(bs);
+    BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
     bool enable_cor = !bdrv_cow_child(s->base_overlay);
     int64_t len;
     int64_t offset = 0;
@@ -125,7 +121,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         return 0;
     }
 
-    len = bdrv_getlength(bs);
+    len = bdrv_getlength(s->target_bs);
     if (len < 0) {
         return len;
     }
@@ -137,7 +133,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
      * account.
      */
     if (enable_cor) {
-        bdrv_enable_copy_on_read(bs);
+        bdrv_enable_copy_on_read(s->target_bs);
     }
 
     for ( ; offset < len; offset += n) {
@@ -199,7 +195,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     }
 
     if (enable_cor) {
-        bdrv_disable_copy_on_read(bs);
+        bdrv_disable_copy_on_read(s->target_bs);
     }
 
     /* Do not remove the backing file if an error was there but ignored. */
@@ -314,6 +310,7 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     s->base_overlay = base_overlay;
     s->above_base = above_base;
     s->backing_file_str = g_strdup(backing_file_str);
+    s->target_bs = bs;
     s->bs_read_only = bs_read_only;
     s->chain_frozen = true;
 
-- 
2.25.4


