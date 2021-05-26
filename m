Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044C03921F0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:23:24 +0200 (CEST)
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0zr-00066k-2E
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lm0sv-0007QV-Ir; Wed, 26 May 2021 17:16:14 -0400
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:2688 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lm0sp-0006kU-QC; Wed, 26 May 2021 17:16:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUZJfBQnP9k/A5yWiAlUHseSsd+oZQJQ1muPQQwrNa8BBkyJvpiwko5GWnxI3BDsHLkHVvyWtVFo/y4e3jslSj0fTHN8JeEFfw6xHS7YbSyTwMASCSZ27yivY/MXfNkqP/fJ4+W9iwQHl9t+hA0WKOHYFKEKFNPtWzP53pLI+qJ4vBxb6vAJZbVQhxlfzRK4Nc66rrXD4f7LmdGLMxLCeM2YpnFMSi8DrbVwiRRaiFdWmBfFf9MtgdOGxXla9TjdQc3JSMx4z3BC4tWFmrq381bJkONd1wGnyQpySBwLDjTmAUnYu2ykZuGUgaJ1HAXlfy7gNv/p0QB/M5hNNlkpbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRGPwpJuuMrY7C2mhOvOGXuHunyhZk/yXi1/6Ynf4JA=;
 b=Y0HfpaRfzLGMgXHtBuyVNBUnSIDoxlWOnMBAqT5tGaF7Bf3Q298QCAj1e+QjeMYABijp4HtdS0f9T0uLwsSqjJDYTuI9n/qJKB8mYw/a1LEkB5WNPv4XkA6yJWUzd7ItuED5WQDO9fSfwZXzae+SeTsNXK2w6FSQOzwAVs7lgX6nbszcLiY0X2kJlUntNZvsHg/SG64jl+/yr6Xnk4qrv8ZzrN6TyMECRkBegc4ogGpmOe0sqo3y8i4zNQ81lOpwA/8DSUZJzx25LvmCs39ANp7yUQ1thnBVAOiDZ9L9b5O+yfNXnhm9v/d+KskpNG9JYwGJLXHNZ4kl7yaZR25U0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRGPwpJuuMrY7C2mhOvOGXuHunyhZk/yXi1/6Ynf4JA=;
 b=bHVpRFr5A+KtUckXLnCq+NqWgisx53M552QMtKQbvkDHsIvFCGvxqWIadCAyjTduBiW3wTKQpcblgnjchxdKlZOujfXkqoKwhP4w+66IGOjb5z3fTJCKgZppeDIMRWS6raGh3axS0gmSUoIfzFTFyWhSjGTW6dTmUNvcAFq4GeU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5382.eurprd08.prod.outlook.com (2603:10a6:20b:108::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 21:15:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 21:15:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, codyprime@gmail.com, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 2/3] block: drop BlockDriverState::read_only
Date: Thu, 27 May 2021 00:15:33 +0300
Message-Id: <20210526211534.524597-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210526211534.524597-1-vsementsov@virtuozzo.com>
References: <20210526211534.524597-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR0502CA0021.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR0502CA0021.eurprd05.prod.outlook.com (2603:10a6:3:e3::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 21:15:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d19c4c3-a1e2-48d4-245a-08d9208b709f
X-MS-TrafficTypeDiagnostic: AM7PR08MB5382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5382CF06334573426B110FB5C1249@AM7PR08MB5382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:208;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9woX/k+VKfKRlGCwr3Jvxbc3Y9EKvYj+6HTmGwIMc6RKJul+UwNBxLK2yR3DReQea/aCPlJt0uFGOTvH8C7IVpuCySTIvSvwisyhQS3lZYmq/G4dwvnyglJG3apQ7ECFau8rSpJus4ummVnussYw/KrCUmjKuh4lpftg+m/K4DWpzj9m6QqRjxabtMz981bbrGNSynnc++GsvhemIdvzDhtO/UL7dVfxwm2aR/Uie7GokmK64BuL5LWRo9t4TaDWZOFolhA0cd4lV4bfV+cIO7wSGTcvz6jbjr7zSxc6/Uegfs5M4I1jKVGi12PbmgZ/YUyBWxW9RduG7NWRLC/IBozhzZUv2ySoWXPxZ3X2FOZwf5h4dlW0fzGHj+e0DATMCIggwe1QdzGvRa7en7wqL+qqWKit7NuuXLEae5Z9HUlqZogqfkAqD1497xsl1KWSPnRiQihLu7uh+a7kp0uK6K0ko5AA4l0YUMTrORKz9R4O9UImRQvohKwIItKDaa8Ojp3Or5XWcAffcWcLPsQhiMgfHT5yGeQwwSYunCR475ro3W66moGE7T/XaGo5+ybAp/LL8B12hnK1g3M+oYrUqTDJgM8Lnwl6lbTN9alXbyO25OCpYUpsxC9RBZ+BoSYUPNJJb0pMaOTeir4stE6hpIbn8ELXs9IZEDxfkB3iNex7UKA2WEWxxAn/bwGbShJA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(136003)(366004)(376002)(346002)(396003)(86362001)(2906002)(478600001)(38350700002)(38100700002)(956004)(36756003)(316002)(6666004)(4326008)(5660300002)(66946007)(83380400001)(8936002)(8676002)(6916009)(6512007)(6486002)(26005)(2616005)(52116002)(1076003)(6506007)(66476007)(16526019)(66556008)(186003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2DSpKsBuKKcx1ci6FEwzkQYEyqhnsv9rHnbuz8HRVoYeHMi5jq+XAddWVWqD?=
 =?us-ascii?Q?7U1FdTjjNKcsJ1p5vinFlTaRyKuZeysrUws5e/Jd0xjUl5VwifEGVR6e0gCH?=
 =?us-ascii?Q?sMIuF3C2bOItBfv6BP5g6cDT8aheS6HcWNsby4+1Ur4DLTax//8xFV2MfqTg?=
 =?us-ascii?Q?ByQW4C7mCMOCXOqDyDQEhtYattJvnfPTB573wLLNfYFWZt8IbF6XSeQ9jBxl?=
 =?us-ascii?Q?Z6q97KOvDwB3//ZxibBvH58jDoJwbF0Q8TmYRx3S6ksKOyDnXtquWcQQLzte?=
 =?us-ascii?Q?usGlowYS8uhz9oY7EEka0JiOZeBxzca+/BO5pum+jwMoi234a2X2emibjKb6?=
 =?us-ascii?Q?7Np8Fh0mHJJmzZKN/q3tumtOEV4YQX4Ep1ga7MduEmLWs8DB0IG9uoQbHh4V?=
 =?us-ascii?Q?MQZtrJMEAi8DbpObzrU/HmGI+eH3JJ6j1l+2CXEau18L8B1e7PfoWlsOge0z?=
 =?us-ascii?Q?DkEh/CbCQG+Qnz044Gaf5qMCGU2MD84hjIi5FNiejzYoR6uqfF6uv+UNTVeF?=
 =?us-ascii?Q?TeHRrRSdkDTxHqDq4VlYmGYNTngcs+AT21C3MN5s6vQkDblKpNXNtCaysyd+?=
 =?us-ascii?Q?DDVoPMo/Wh3a2qelfxmbrwCbN5XxhDIpY9FZHW/klURNFGJs9nNz5R79eN/d?=
 =?us-ascii?Q?EiPBiD6N91rK/WBgfPHdEAVwhZnN98+6KlMrL9MlnTiKOcL3U9Mp1yZ8YSXd?=
 =?us-ascii?Q?QfbGTtWFAtE2EL6mZsaSZSLseuzxqaxeiTcKJrMAwOhXSIhS/5K/l6YlyDk3?=
 =?us-ascii?Q?QF/bpFrhL+6dVRiz47C00qEP6IeJvT7y5PDACRYyt1KLfRNk/squGy0QAGRr?=
 =?us-ascii?Q?mR0dVHkbfMtw014/Yi+tC6/gGWJLPFwTQdczJOcqXbp7O8oIFFspsIsRhYF8?=
 =?us-ascii?Q?54JzCxTEmf5O0cSojQoCz1viUzMfRlHSlt5uWgDTeYWthQ8/SQKQc3AfUh03?=
 =?us-ascii?Q?8QoOu1J14ZAFxUm1OxAcCOnz6t5C3YkAdUeOpuW1ZihXIAT5WzcUHbk2txvB?=
 =?us-ascii?Q?AfDBRagGh8xlQ14B9awTVSdBiSPcEU9BRaSshBLfdaWcRc69Tnbwnv2sXTBZ?=
 =?us-ascii?Q?NupbW43RvSVKwjxI5MIONtb2jS9su6tQjR6/DSUX3paSTBfwma30+XotAKFO?=
 =?us-ascii?Q?ue3OlkCYXICS7F6g0hCrCUvZqtuEiZ3gZuio0rmLq/1wx6Xe87vZj8EXiV0F?=
 =?us-ascii?Q?on2U3MgPpGGfl48yHPe7RSMfvSVnMcVTjLGQ4vuwAQ1tHrhvYjYABNpH8cfc?=
 =?us-ascii?Q?gjGN5s6TLRyLLtuMjKR6UdVyCmlB/ASfyMFFFqO3SIB3262A6MAv7u46QJFN?=
 =?us-ascii?Q?QDo+xaaty9UXIUOPLST0jpzx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d19c4c3-a1e2-48d4-245a-08d9208b709f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 21:15:51.3588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoU/6fnWpMtppMXtiAJ2zxWUWz9mUCcZsyUhtdWm8GO8t751nHYN6xpGyoV3Ym0TUp3aDg5+G8srOwuWfOT2g3XJFyR/RAaN+Kr6SyY2KGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5382
Received-SPF: pass client-ip=40.107.21.101;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This variable is just a cache for !(bs->open_flags & BDRV_O_RDWR),
which we have to synchronize everywhere. Let's just drop it and
consistently use bdrv_is_read_only().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h        | 1 -
 block.c                          | 7 +------
 tests/unit/test-block-iothread.c | 6 ------
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index b2c8b09d0f..09661a134b 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -843,7 +843,6 @@ struct BlockDriverState {
      * locking needed during I/O...
      */
     int open_flags; /* flags used to open the file, re-used for re-open */
-    bool read_only; /* if true, the media is read only */
     bool encrypted; /* if true, the media is encrypted */
     bool sg;        /* if true, the device is a /dev/sg* */
     bool probed;    /* if true, format was probed rather than specified */
diff --git a/block.c b/block.c
index 0270b609c4..d36329e712 100644
--- a/block.c
+++ b/block.c
@@ -265,7 +265,7 @@ void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
  * image is inactivated. */
 bool bdrv_is_read_only(BlockDriverState *bs)
 {
-    return bs->read_only;
+    return !(bs->open_flags & BDRV_O_RDWR);
 }
 
 int bdrv_can_set_read_only(BlockDriverState *bs, bool read_only,
@@ -317,7 +317,6 @@ int bdrv_apply_auto_read_only(BlockDriverState *bs, const char *errmsg,
         goto fail;
     }
 
-    bs->read_only = true;
     bs->open_flags &= ~BDRV_O_RDWR;
 
     return 0;
@@ -1549,7 +1548,6 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
     }
 
     bs->drv = drv;
-    bs->read_only = !(bs->open_flags & BDRV_O_RDWR);
     bs->opaque = g_malloc0(drv->instance_size);
 
     if (drv->bdrv_file_open) {
@@ -1771,8 +1769,6 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     trace_bdrv_open_common(bs, filename ?: "", bs->open_flags,
                            drv->format_name);
 
-    bs->read_only = !(bs->open_flags & BDRV_O_RDWR);
-
     ro = bdrv_is_read_only(bs);
 
     if (use_bdrv_whitelist && !bdrv_is_whitelisted(drv, ro)) {
@@ -4548,7 +4544,6 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     bs->explicit_options   = reopen_state->explicit_options;
     bs->options            = reopen_state->options;
     bs->open_flags         = reopen_state->flags;
-    bs->read_only = !(reopen_state->flags & BDRV_O_RDWR);
     bs->detect_zeroes      = reopen_state->detect_zeroes;
 
     if (reopen_state->replace_backing_bs) {
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 8cf172cb7a..c39e70b2f5 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -194,13 +194,11 @@ static void test_sync_op_truncate(BdrvChild *c)
     g_assert_cmpint(ret, ==, -EINVAL);
 
     /* Error: Read-only image */
-    c->bs->read_only = true;
     c->bs->open_flags &= ~BDRV_O_RDWR;
 
     ret = bdrv_truncate(c, 65536, false, PREALLOC_MODE_OFF, 0, NULL);
     g_assert_cmpint(ret, ==, -EACCES);
 
-    c->bs->read_only = false;
     c->bs->open_flags |= BDRV_O_RDWR;
 }
 
@@ -236,13 +234,11 @@ static void test_sync_op_flush(BdrvChild *c)
     g_assert_cmpint(ret, ==, 0);
 
     /* Early success: Read-only image */
-    c->bs->read_only = true;
     c->bs->open_flags &= ~BDRV_O_RDWR;
 
     ret = bdrv_flush(c->bs);
     g_assert_cmpint(ret, ==, 0);
 
-    c->bs->read_only = false;
     c->bs->open_flags |= BDRV_O_RDWR;
 }
 
@@ -256,13 +252,11 @@ static void test_sync_op_blk_flush(BlockBackend *blk)
     g_assert_cmpint(ret, ==, 0);
 
     /* Early success: Read-only image */
-    bs->read_only = true;
     bs->open_flags &= ~BDRV_O_RDWR;
 
     ret = blk_flush(blk);
     g_assert_cmpint(ret, ==, 0);
 
-    bs->read_only = false;
     bs->open_flags |= BDRV_O_RDWR;
 }
 
-- 
2.29.2


