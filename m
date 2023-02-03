Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F8F6893A7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:28:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsLz-0000aS-Bc; Fri, 03 Feb 2023 04:27:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsLq-0000Vn-WD; Fri, 03 Feb 2023 04:27:23 -0500
Received: from mail-db5eur01on0701.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::701]
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsLo-0005Cv-U4; Fri, 03 Feb 2023 04:27:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmUdFQOhS5nukhL2pq2QqLg1rbfOQTcjvBMwtboooF3ESKx4iOdze2onE4Go8iuMvdY+m5gtuIPndrL1SjHG90OGW1Y0jpLTxoBOg5D//8vvhv6bhxRRtniJfmBkDcs1CA7LCn04GgCFhXbRaedJZX1CH7c7SOA5kKd2ah/AdVWz0qXUevxMj4zPaZbKQGTMDKMW6K1w3r72lVLnqrw3HEi7pR9kftiDWvvCFZNHsgfFdWyntEStlw7hQApPPDV8mdcTl2eT3sqjJgswduNWLcuyvm46b4j65UaET5qCJndPMj/1kioit4VBxM/CLHaRJQxD6rzPLSPwkRLQRXzdnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hb4vv+Sq7qmJ2wAjTcDBQ+NvPJm1vu2P65fpyRSXvgk=;
 b=Zui/uNomxqobCPDfPoEqUoY4niSmpfPWCNxVbwZZFCA9EcvXzZ4SiOgy3CyCHk99RLHa3SFRoYW9xwOMebYlPCIC9QOxcCwvd9eGc9C/Oa+Ih7USRXcKhv4aHx9TkkLA1Ic/yyqFD7/9Fo4FauP0DboIcriu3tV4bRglNbiE7sOx8nm655aqtd3xxT3swgMewt1Q1lLpAhlqZatRpSjRKZK7TwXEsPUa3Wl07+rVrLg2su4QErnRci5kUlbuYisd6gOtUMlYx19mxce3nrOWW8f+lPMcvVk+rQI0wN4HD0RP7L5cleOknWBwCGz31iAV1Q+gLcElPx9CJ2ulUz/gQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hb4vv+Sq7qmJ2wAjTcDBQ+NvPJm1vu2P65fpyRSXvgk=;
 b=rQI+PVQaThzvfy3myR3HmGzddnADIaVY+sxjekMkQlkUMRB7swfMLiR4LPQo/Ut64K10JJY+goXBOw4nwh8cEMP4k7lbaw8R84WOMpBHyrslvd1+Psb/WBYFH9LW/ijfvIm9wh0XQyOsDn6lzrkKcnLjpq33r139bNnfMBzCKxAAVzPglLJqtOoZSFvnt9XPbPLcuY2RGfqdss34Qq6+sYpv7o2sYsGuCUbhYte6b307tzWAcqNZCFUH6ZaiR20SnrtdWJXREp0tgzaDZIe6PGv5w7JdP6FjkdSNw7KOrmwjJDsxqTbLbAUbslb1M2NzFwr69VsnoGF+XCzN6H6WBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAVPR08MB9356.eurprd08.prod.outlook.com (2603:10a6:102:30f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Fri, 3 Feb
 2023 09:27:07 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:27:07 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 5/5] parallels: Image repairing in parallels_open()
Date: Fri,  3 Feb 2023 10:26:56 +0100
Message-Id: <20230203092656.2221598-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203092656.2221598-1-alexander.ivanov@virtuozzo.com>
References: <20230203092656.2221598-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0099.eurprd09.prod.outlook.com
 (2603:10a6:803:78::22) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAVPR08MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: f2209fd5-c894-46fa-35b5-08db05c8d17b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gM7KoU/JPj+pZ5qdzD+ssmElJATEStNOF13L1kvM73dFNtngSjfn+p/Vm7RH52RoA1BbYXlNBxNCFKw1wAWIm3CbQ8a2N3FnrDQtHvZkU3pHHMGKKSpuofh+cQAVysVTUD14xDMMTp9yDaXO7ITf5cp0JEXSLTmSlW8MbqR2IpeFN7mACSp6gn6umaZMaerQrFwzBwzWBs22BBurg0U67GmZzvMITxJIazdkbn42fiufgPnpyLnrr2oObNWJ3tMmM30JDEFZce7wfnmUzrhLlzaIQZuWG56gleT1+yLnZGDlHkflktWsXaeGNqxyIA5OzmABCLBz84sj5mRYriVL9s6OKfBrYncLfO7+fs0SivCClfLEE+5FvAIdIIBsxsYeHESxG6dk4nF/PEvAsWRSNJw4LmMBN9VwIwund+ABCKDsUfBMlNGPnB9iNpmyAGe8eMKNwQ4SqUdoRthP7merlCaJKJTwvLlF+QGGyhaD0KUVslUug2wt3VMmWE/X2A/TpFAaBjaEtAzBuKcQo6y1vQfeiIXjlsJOYDOO86Cy4l7DoQAq2QxnsQ8gKWjo7sdpe0It4h8MswPhrIWS+N3d6dsJaoukfLIeCQzkgskYkEZxNX9PlSpSaowUlZ+JrH4IP//9YdWmLP2TfJ46EsERYzs28Tt+x4bTfIX6/p0mg7AXX03qmzj+dwHdWEKmohHex35fVxsCssbQ9UPBMzW2sA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(451199018)(478600001)(52116002)(2616005)(44832011)(36756003)(6486002)(5660300002)(2906002)(8936002)(316002)(86362001)(4326008)(38350700002)(8676002)(6916009)(66476007)(6506007)(1076003)(66556008)(186003)(38100700002)(26005)(66946007)(6512007)(41300700001)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cWmYPnjmvla10wRINryKUldteCB2A1kyarWj363SekcFK0i+Kz0r3pM8L0B4?=
 =?us-ascii?Q?OG+ThoH+KKvPDrH1lO9y83L4lCCK9kLbFlxz9kTFW9EDESEfMoB8ujpRpAYI?=
 =?us-ascii?Q?wI2rM3WF3D86PE0GyH5feDvs1r06VfUE3RwB9J6MkVv7X9BJ55mTCFhhJU4O?=
 =?us-ascii?Q?CCYFblmSXkYR6PqyiYxWv4Z6dkX4suzCdJ9rMmX8XcN7/DQWkxhcdFDSDbMl?=
 =?us-ascii?Q?tqbCBX2glDT6USQF/+0YmFW1hpJ6lqGrfg5wDFqoTcqTAVxlLxmHqp7wM14o?=
 =?us-ascii?Q?mRY4HuXV6YYP9G5ONJxGKeHV7Qj7fcIepfD3z9QdJFIBtym/Y4IR+mU3EXSx?=
 =?us-ascii?Q?wEBg9QdXy/fkgWcRUcm87UZRiL6dd/awTsG6fdByL+7l3m7K6vufj+N6pGdy?=
 =?us-ascii?Q?MSnZb7a105osHMelYdiBG9bv0BMVwQLrtl5p25+TvzI4RGUPWs2dRbMcC7OT?=
 =?us-ascii?Q?UVpHrCvwuYm9qmovm1iadOkUfmq66fGTM7VGIUufFMPVfFktGEvtBXgKtetG?=
 =?us-ascii?Q?gdOf/k8fWEvHEvY18xqn+MEcA3RSd83JvBJjMvSzIeB2Etn035BGWV7BCK6r?=
 =?us-ascii?Q?ASjjZ6k+KQdpCXmLncDZvogQUm8R5jl9a4gELfM9taRT9ZGvbaeW59RcpHl6?=
 =?us-ascii?Q?38UNtTbmSJDoAPtVGzeCHK3yiXSKtKwcxsm1h7neiYs0pDMZoXtt/zIdveSi?=
 =?us-ascii?Q?84QYWk21Zi2OBni1LB2nP8IfumCux52sZpaBJd/F0H9Z/30DAJs9wczbu0oM?=
 =?us-ascii?Q?PQop3CM6OxUqcjg+mrcqbXYLdxM8/TtAUjGKO21bwrwlT2YKvOwU4zr9x2vg?=
 =?us-ascii?Q?zOtwttAYKhKYrPw4dQB2K5xCv9FdhKCUZm66BwY1AXDtRySEnRSpxo4u3Nl+?=
 =?us-ascii?Q?v4AdoxZaxBuHALWUL3kt9jt0JCLMbdE02yDUfxKBRluIqGBmqB/VtKiTamxf?=
 =?us-ascii?Q?jp/8Om7H4aYVbylPfvx/GBYKigJL8KSa5xt0C16/DVjHkZWEL6nBWWIw9IzJ?=
 =?us-ascii?Q?w5HzD0Oa1kCgXyaVtSqXhf7vDEKhAaxurCImUqEu1hlssMxWz1Lx0B7WxPKw?=
 =?us-ascii?Q?qYSP9daVec9d0y2rApYWe6CvQDe/rYBZ3Is/xA5IY7d7d53V5HJdF/8NiVRf?=
 =?us-ascii?Q?uOSW29uiierHA0hnNUJwxsEVkPSwwTbtV4eaNBjAcL7QWWFpEgYPjOGhoHmM?=
 =?us-ascii?Q?LxDqVqMaJskCkZkaJRpgwOZ4cMsLYCf0P4xdWUleEn6pN3uvZrDn/qnoZ2iV?=
 =?us-ascii?Q?6NAtdRIpleWxQxvHvrOsK0AIFSb2AbH7ZiBvSRmlFrpnr1jw1RnEUF9cONHF?=
 =?us-ascii?Q?T9RH8oKkyQKTCdIU/GAjmHOek5ghC/rjAul4jyVPLXRoqtJFQ797KuGSxfqz?=
 =?us-ascii?Q?iu7tFI21APnagogO5HZPvhdAcEI/mUEJY4dcoLJskuf7y+XJc09fsJx9cliK?=
 =?us-ascii?Q?1uTW4ifL/CTstlztUo9AKVmPMXKZxxDZyiculfFhkQfapwxxrFDfkuKke0o1?=
 =?us-ascii?Q?QM59GcVeSW6bBRWC0afPnrjykZZi5ee937g6lcN0zWJrldJtLlN03XLL32xY?=
 =?us-ascii?Q?G5NfCP4RAYqfDCFlo5SjZShrzuRIc0MzRraZ+uRVhflVpsmYuFlQ/UczNE5y?=
 =?us-ascii?Q?EW9w3b19WraSYRjp0YsZyho=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2209fd5-c894-46fa-35b5-08db05c8d17b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:27:07.1042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pltD/ksC/wBGgfUugztUCMiVfBpixSylhclHgVhveW4qASW+LpwJKkY2+H5MFO/bmBLkQH75WCq1FHCbLC/lLr9zQyW4Y+7BCxaQ1MVTypM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9356
Received-SPF: pass client-ip=2a01:111:f400:fe02::701;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Repair an image at opening if the image is unclean or out-of-image
corruption was detected.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 64 ++++++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 31e74c9d3a..5beca421ec 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -957,7 +957,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
     int ret, size, i;
-    int64_t file_size;
+    int64_t file_size, sector;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -1035,34 +1035,6 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->bat_bitmap = (uint32_t *)(s->header + 1);
 
-    for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i);
-        if (off >= file_size) {
-            if (flags & BDRV_O_CHECK) {
-                continue;
-            }
-            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
-                       "is larger than file size (%" PRIi64 ")",
-                       off, i, file_size);
-            ret = -EINVAL;
-            goto fail;
-        }
-        if (off >= s->data_end) {
-            s->data_end = off + s->tracks;
-        }
-    }
-
-    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
-        /* Image was not closed correctly. The check is mandatory */
-        s->header_unclean = true;
-        if ((flags & BDRV_O_RDWR) && !(flags & BDRV_O_CHECK)) {
-            error_setg(errp, "parallels: Image was not closed correctly; "
-                       "cannot be opened read/write");
-            ret = -EACCES;
-            goto fail;
-        }
-    }
-
     opts = qemu_opts_create(&parallels_runtime_opts, NULL, 0, errp);
     if (!opts) {
         goto fail_options;
@@ -1125,6 +1097,40 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
     qemu_co_mutex_init(&s->lock);
+
+    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
+        s->header_unclean = true;
+    }
+
+    for (i = 0; i < s->bat_size; i++) {
+        sector = bat2sect(s, i);
+        if (sector + s->tracks > s->data_end) {
+            s->data_end = sector + s->tracks;
+        }
+    }
+
+    /*
+     * We don't repair the image here if it's opened for checks. Also we don't
+     * want to change inactive images and can't change readonly images.
+     */
+    if ((flags & (BDRV_O_CHECK | BDRV_O_INACTIVE)) || !(flags & BDRV_O_RDWR)) {
+        return 0;
+    }
+
+    /*
+     * Repair the image if it's dirty or
+     * out-of-image corruption was detected.
+     */
+    if (s->data_end > file_size || s->header_unclean) {
+        BdrvCheckResult res;
+        ret = bdrv_check(bs, &res, BDRV_FIX_ERRORS | BDRV_FIX_LEAKS);
+        if (ret < 0) {
+            error_free(s->migration_blocker);
+            error_setg_errno(errp, -ret, "Could not repair corrupted image");
+            goto fail;
+        }
+    }
+
     return 0;
 
 fail_format:
-- 
2.34.1


