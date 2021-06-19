Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BDC3ADA61
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 16:24:49 +0200 (CEST)
Received: from localhost ([::1]:54868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lubtw-00068r-RZ
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 10:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lubr1-0002C4-P8; Sat, 19 Jun 2021 10:21:47 -0400
Received: from mail-db8eur05on2121.outbound.protection.outlook.com
 ([40.107.20.121]:8480 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lubqz-0005FQ-TD; Sat, 19 Jun 2021 10:21:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrKMCz5Ob478L7FbRqbhF87BPsfM4vfiJ/sJMEWsmb7U1/ZI9+AFq879de7hBV3bdc6Uxqw0Mo/hRq4zOQQ/prpKR1xY8FktZYUSn9GimvntVQD1Ut0d+WPlmSAP4dd1Aa2ukcQ/+PiWmQ5HSArrApfXoVscQ3cpoj0CVs4O2v5ckWINtBqz3dyyO+DHUe43Eu5s/xk1AOMxIvoq3vFjoE/x1myaoMJIyD4bpaOaQ4BINhN4kUES/oZF5rzw3VJDexAJTicXib1+HXhz+8SQyzAI7NTZon7yeX97/ycaEiFJn3pPgbZHBjoE8GfwdwIjNof/n1N8L1Hf4oJeebWEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmqoMj36hJwHv6E7LlQpVOTNuppyooZ8e3+T3fvOq+I=;
 b=ahUVFK51uPzwPSw6xehXcn8dOYjAdSxF4EwhNUvDp+0x8hsEgjAVZAVM3njdBSHc1rk0IIF7M/KBYTTqx2E5xBQrQTbL0JtxzH+nD1XsvTqzXlg/YWB0n3NlCsYGePoLpYDfZ/2WNVTotjXC3vsMvfOuyXTsuR/c1tHlfz36lqbQr8Q6AtiWRB2WgLmet+afAay/Gewiwt6gKkXI9UHmmj4uxZedKWVUzmfHN5j/DDaDGENmdHZBaBPvBbrwiUd4VH+CrK3uKBFX2bB4l8/Mmf7P5uVUNQcHWnvT060kcKH/1X5efm9X/JDoOxqc+UAtq+yiAznWKk2JISmfrj3vGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmqoMj36hJwHv6E7LlQpVOTNuppyooZ8e3+T3fvOq+I=;
 b=mKpSBuUEA86yNsP0pa+gQSGTECbmdMl3UY5MSmj0G/aZm+ojizTtZs6EpzpAPSbJynaKetg66Lhp4399MfiC1sjlaNA8S0fwawDZJ+PNv2j1ZjMoXK42ovZclSqViDRguucekBFkP9URBNQyka5gyBQckOcytNPEk9w1+PWP0qY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6069.eurprd08.prod.outlook.com (2603:10a6:20b:29c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 19 Jun
 2021 14:21:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 14:21:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, stefanha@redhat.com
Subject: [PATCH 2/2] block/commit: use QEMU_AUTO_VFREE
Date: Sat, 19 Jun 2021 17:21:20 +0300
Message-Id: <20210619142120.48211-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210619142120.48211-1-vsementsov@virtuozzo.com>
References: <20210619142120.48211-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0902CA0059.eurprd09.prod.outlook.com
 (2603:10a6:7:15::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1PR0902CA0059.eurprd09.prod.outlook.com (2603:10a6:7:15::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Sat, 19 Jun 2021 14:21:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37c6eb7d-b9b9-418c-c5ca-08d9332d8dd7
X-MS-TrafficTypeDiagnostic: AS8PR08MB6069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6069C95420346E3D2C1244E8C10C9@AS8PR08MB6069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:12;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IemKFkzf+notUwq/WmK8qT3xuH8KpnzyWfP8Rafq18hggIqdfc9XCTIig602KSBR4obzbjeIp3Ul4PB4mVg8fQeYaop0Ws0dRSNOhMUcyzN/3tNj91EXu4toaoRJQE1KsN3B9+GmWW3IWC6gOyNCtzVDVz2bsP2j2wufyrRn4q/oldRuTNGqWaq3tYY39AZ6kHtA3P64ulk77hQOlS43lX2iQc0bepEFh8u93CitbW7JjTp/F5k8y53tc3VXYmzdOmotNvQisMm2ltH8MFno3O1fgudly1wXVqqAG3dzZ9kO3g/KjIUgALSCn9T3w8wkPSKWcAKUK3k7SaFPxqm48BhY2t13Gfygo7ANudNTXU7kjauPush4Z0q6JopaKmGQFcOb6qTDkTd1jZp7OxRr8FENONKuoL9tJlkfzf0w/efTM/cPSlRkNQFeOlJv6IKhsyqr37HM0dfNZCU29eWWExCNubUPsjRJm56bzHdQ0rOx3B9uftYzh0ODDsMyOLilx6G80BSHchDHgQ/An33gQ2bwLxDDHD6ZGuq45V2EaV8+XjNFXKwClfTYSt1WVL5WBNnEykIoc97bSaWFLJ6HwF1ymX4ypGPYcnucS9bAAOFOBxDrwEFjLFaykN6tPAJnnQgLu3PTVGTARP7n0ZKzCr87rBNuuC+WG4JDjrFEl8uDufCkrRQFI6OeBt5KhHSyls8opEBJg1ChbecAz02TUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(376002)(136003)(366004)(346002)(6486002)(38350700002)(2616005)(956004)(38100700002)(66476007)(2906002)(66556008)(6512007)(66946007)(6916009)(5660300002)(6506007)(1076003)(4326008)(8936002)(36756003)(86362001)(83380400001)(26005)(8676002)(186003)(52116002)(16526019)(316002)(6666004)(478600001)(69590400013)(84603001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W12G1WefisWJx1BCrXbDoBdSU30UIepAspecu4Ot3Q3/gADNroTGQn1p1rsu?=
 =?us-ascii?Q?FNFrJhiwMjmj8+SyFObXEgxl1eCcL17ab5DbhgpVDiWWArkFlQV1h/UHu9Vy?=
 =?us-ascii?Q?Q9iRYqp7FFbhud4KHsOxI1JkYmrFtHB82xEY4N+57vkA0epn9Hz5KXXdm2Jk?=
 =?us-ascii?Q?W+5sAjInuqh0I9BGIsRkVI+14xUUxh/lpOwokwIO1cDMKoO4bRssYJPsytsX?=
 =?us-ascii?Q?oNvvSe0sThYDR4EQKbgf1/pBwiAAPRt1VNabtQ8ZcpaqTiqmPwrjYusjt6la?=
 =?us-ascii?Q?b5rHTkOPLTzQZsfi/3IBxRSXorazImLlsa1MtIlMTv6mBaYRv1uX6v4WZx0q?=
 =?us-ascii?Q?mUNq1SQoaJUbBKFaYo3RONF9QdLcW+leeGGd5FcI1siQ6wRXmzj0TCK3XTsP?=
 =?us-ascii?Q?RYaY3fKJkLHmFLlgGTyI7i0S2dous3WgdaLSUN8OwNKX2sVTM98FLK+ivc+L?=
 =?us-ascii?Q?v4k96rLciaWNzB3AM3crvClfFpyFxkHJTpcZk12+kBjhLeLANmzagcwrirS4?=
 =?us-ascii?Q?gBuAO7+ZtTA/ESHR4Q9SYnJE7AQQEdkmGC1uzAoUdYau7SlSWmdEwZfhwBdw?=
 =?us-ascii?Q?wwTIWnaVMt6/1Th+zzi9muRwwDrA0dr4ul/XvGj7yO/OGyPYo8ejCoGhA4tZ?=
 =?us-ascii?Q?JZrtzlRcpui5a2Ne+I1nPBz77HdJc3MXpoBX4KQgszzBORnXfyxEsJ8pSIdJ?=
 =?us-ascii?Q?I/P1wzkWbxPKuuDE7p3cCFUDjkytulres7AYYPU0yaojA0mIPiekn1fDOxE3?=
 =?us-ascii?Q?0kQ4t73Qy4EC7dLs9soacsVEm0f0ij7EPyyf96zkX0n9HWEhQsFy8mJV3TGd?=
 =?us-ascii?Q?yvevL8cWzxh0+ZQQC+tdtnt2R/wfO8qE89YjuKdSy97edSk1Q1lpcRZLIm7b?=
 =?us-ascii?Q?Qh/JPpD8pDtcf7CLKUR9kzyK8e5c7gabvrTHB1RDylx6Htnpo7dAlDcLSFp3?=
 =?us-ascii?Q?VtIjeAHGJvcJLq4OKi5UupPq7/zGi3FTwTd2CbLI2Q3q3n/srtxCoT2JGc0T?=
 =?us-ascii?Q?Eih4ZXtGIo81C07OqAiW0XWSkotpltpe05u55YjBFp24mRpVHnv6+64zuMYF?=
 =?us-ascii?Q?8IR4EYsI4wF/aJhKeu7Fk7mJMdBbRTrQ8PM+8Tjb98HKcTm7SIkUk7rHLiIc?=
 =?us-ascii?Q?n91BwWfOlF3HXvbzGDpckvoHnPnovsLKlblTGhqeFBTBp4CT/hl71/C5gBGg?=
 =?us-ascii?Q?LY3IpQS7Bd7aUkLWEgULJpsEcTmp48beuaMfWeS633ROp5AuuFHK4PyEhIPK?=
 =?us-ascii?Q?PeQvV2WwCvR995qhMG244xAeh9Ly4Ma3SlL6gMIcAQts5zTFXyfElbvDX4c8?=
 =?us-ascii?Q?KSQjmt8HETP22cS5jJGPeG6p?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c6eb7d-b9b9-418c-c5ca-08d9332d8dd7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 14:21:39.7183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +f00AT7YeF8sSrMz9HF3ULqQpibQNFg5WQPVyfM1vONxuGnpzSqlbNO7+WVtPOOfIiyPzYmS7DINQZgdmi0Md9LOwpvGjRfnmFZBqZ3yxik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6069
Received-SPF: pass client-ip=40.107.20.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/commit.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/block/commit.c b/block/commit.c
index b7f0c7c061..42792b4556 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -119,24 +119,24 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
     uint64_t delay_ns = 0;
     int ret = 0;
     int64_t n = 0; /* bytes */
-    void *buf = NULL;
+    QEMU_AUTO_VFREE void *buf = NULL;
     int64_t len, base_len;
 
-    ret = len = blk_getlength(s->top);
+    len = blk_getlength(s->top);
     if (len < 0) {
-        goto out;
+        return len;
     }
     job_progress_set_remaining(&s->common.job, len);
 
-    ret = base_len = blk_getlength(s->base);
+    base_len = blk_getlength(s->base);
     if (base_len < 0) {
-        goto out;
+        return base_len;
     }
 
     if (base_len < len) {
         ret = blk_truncate(s->base, len, false, PREALLOC_MODE_OFF, 0, NULL);
         if (ret) {
-            goto out;
+            return ret;
         }
     }
 
@@ -174,7 +174,7 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
                 block_job_error_action(&s->common, s->on_error,
                                        error_in_source, -ret);
             if (action == BLOCK_ERROR_ACTION_REPORT) {
-                goto out;
+                return ret;
             } else {
                 n = 0;
                 continue;
@@ -190,12 +190,7 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
         }
     }
 
-    ret = 0;
-
-out:
-    qemu_vfree(buf);
-
-    return ret;
+    return 0;
 }
 
 static const BlockJobDriver commit_job_driver = {
@@ -435,7 +430,7 @@ int bdrv_commit(BlockDriverState *bs)
     int ro;
     int64_t n;
     int ret = 0;
-    uint8_t *buf = NULL;
+    QEMU_AUTO_VFREE uint8_t *buf = NULL;
     Error *local_err = NULL;
 
     if (!drv)
@@ -556,8 +551,6 @@ int bdrv_commit(BlockDriverState *bs)
 
     ret = 0;
 ro_cleanup:
-    qemu_vfree(buf);
-
     blk_unref(backing);
     if (bdrv_cow_bs(bs) != backing_file_bs) {
         bdrv_set_backing_hd(bs, backing_file_bs, &error_abort);
-- 
2.29.2


