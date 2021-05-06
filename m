Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09812375147
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:09:16 +0200 (CEST)
Received: from localhost ([::1]:55876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lea0R-0004OS-1i
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZy9-0002D8-82; Thu, 06 May 2021 05:06:53 -0400
Received: from mail-eopbgr60093.outbound.protection.outlook.com
 ([40.107.6.93]:50670 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZy2-0002tO-24; Thu, 06 May 2021 05:06:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ytjejn/fahYCp/YEHQ7TymPgG8exz1ErTS4J+Ck+MzGmyX2ZYCCZuG0LNssOgQaD13WwF3qoblJKi9UvGrzWBH2HTttXsoPUl2sGzw7ckftnF8fcMh549j0SoDFv/vPkJkamAUEAh1ut2QCgSP/n/UcJMEIGwXLMaCss3MLmBIX56LF2G2zG56mdNVgXGs8pV/Hc6uY6bynUgE0p/DzfRuh9OZdfoPO8+inOG130gBCCnkYMiYpklk+u9NQz28P9WeClk/4/J99P+h2I60cXz8yanZhNKpXUrLUdz0AwuN3HF0fCB21OViQXjDGVvnuwZpPuyFwoGBb1HvsWXcXYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJFN0kbNK1HYsScle4BJxnbgfK5v1ltAKvID4Xb5e1I=;
 b=oM6zQLoKUIaJ0xXMJ4Dsa9q78deTYUOiUhyGHaal8+NwZtgXTQMbT4YuqlOI7bqeAcQa4APxHpWs4gqRmhLP9krFbT5PKCRfNk8c4lWqUfcSkCySqcBbVYsWOHvF/zm3WL2Ze4T0rcpYWplxLbmrXF7XNU6abgwuzP/UAm0wQsDP8K4sSakHyH5wKOjljIaAKjYFylXwAHGRAU9+6OJHmw70sRfkoAhCJKoAO9wRB8iet6rCWsarrkYo6sN575RH9DXOhrrQf3fwtuEzCK8TagCO5fHIAJORTELguH81C0HEATaTrKX7A+2IXJYMdrGaqQQo+onzYtIlRACi+AVOGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJFN0kbNK1HYsScle4BJxnbgfK5v1ltAKvID4Xb5e1I=;
 b=u+n/L3a3YIEvvjIEM6mS6xTkTIozUlVMZRAO5fpFz/2AOmOp2Gvod1pk3dEwZTu8X9b9UQCWBRUmPgx8PacbdPHXwlJ9Npruecmr+AaK3wUD6DKUKSucPeUK+2N79/9mooi0ryJReGdCksVmNFPmSkN5kDmx9V5OIVXvao4xjaE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4166.eurprd08.prod.outlook.com (2603:10a6:20b:a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 09:06:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 09:06:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v3 2/8] block: drop write notifiers
Date: Thu,  6 May 2021 12:06:15 +0300
Message-Id: <20210506090621.11848-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210506090621.11848-1-vsementsov@virtuozzo.com>
References: <20210506090621.11848-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 09:06:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ed1aca4-88db-408a-780b-08d9106e4340
X-MS-TrafficTypeDiagnostic: AM6PR08MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4166A0E521AEF886BEBEAC64C1589@AM6PR08MB4166.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uDT7KrqwuS6+WuvNfcM6zC/NZFPfagC2XTTLXvcAdDuRlJ8Tdh+i1Vd+ZXEppUUFGgrcCdqgv+cDnBReOYEAfRbafllWlQq4MKM5xI8DRMmnh7Lme/U4xOjkDjKWUT8AouTDWG12rivQz8u13CRl6ATeiXXonVh6wjHSPLNVlCoMt2Fi94sQe86ox0JUJkWxRpaBFoTASY1RTJNCXndpnlnNe+eBxLF9/zGJ7QewnwVT4Vvf4qBPBYofDi8SpGsLDzrVTO7bM2oE7X28TW4rJts6mU2Q5atUQEYsSuE+yvc9RZ6rW83CsmOgKrAlJk2pr7YKTBO4938lbTeM39nXsnLfVCe6vlaJti5vrmPcoayGo6Igsq8g20gChbbNix/HMd5RYoVh7rqEwVUQKSuGyUXyW+xNX7IKD5vtcJAHXSMQ6x8gJ7aCwueGS0IApD0fp94J2nkDxXcP8EWvls3C4OqAbhH+CPkUK7iYuLvDjkbAxkJ77bQBYIVkqDyCncQpIl47XSmQzFYfHDyJI2FZBQh0y+025p1E0ranoUeHvRSSs0MtYEjISUBlpyBwWLZrkJtCnfCSPDOcevgffKLHB/AOBivnP4auYWL0+FZ4PDc9Wea1cLcVy7ezpNhzmJa0FvhhUXCHHonoT7jNSH/2GM7pxM5cbdxEIoZYGZzN8L1FtpWJ/zGRt39O8dnMBiSg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(366004)(376002)(136003)(86362001)(66556008)(6512007)(8936002)(66476007)(66946007)(316002)(6666004)(8676002)(36756003)(6486002)(1076003)(52116002)(4326008)(478600001)(2906002)(956004)(186003)(83380400001)(6916009)(6506007)(38350700002)(2616005)(38100700002)(26005)(16526019)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PHsTBX0AzKprTtbvlCJ5gXgZ76yVtSTMYcZY5V1s9YAb1n2xSIbwZhvbvUb8?=
 =?us-ascii?Q?UpWTp6gquAIk2MCEZAgZ9LFlXfWiDc3JLw7kxntpX8qESRodQEEAzoQMQ6lE?=
 =?us-ascii?Q?oESIpjoyAWChFeBrPUHCSiS5X8mcCQdYJeYgMfgOHxRqNQNOOIyqmgumf8ls?=
 =?us-ascii?Q?DIPFJzJnLM2YmT/49Lrp2nn/jvB4wRJbmEbVyUQywpxwIvJqKZSS9rEk6vQn?=
 =?us-ascii?Q?kIFUVY39fBFgQ6D5q3LMty2EIE9bY273VxDQBwuidNp+1A62DPjLcbtvBfIV?=
 =?us-ascii?Q?Fc1q+/12Oc0RnymxcE6JU0WG2ppIgQYOr0TP7cQ/p1z6nubmGclcbg3b6xGe?=
 =?us-ascii?Q?csMGze1YVvfoAmLkr7q/PrH7CkUqiOYOBUdT3PJ0GSuyOb5vkLW2EWbhibRz?=
 =?us-ascii?Q?/LjKFHSOFwdndH5SXvr3dmMev8TCAGt4XyNUolB23CegXzFIvNJmnDkOV81W?=
 =?us-ascii?Q?RYvgOJrmSaucf/TkYhg2c1KN1uSejwmSnQ9wzPW9r+96wtj3pABlPCH02I+f?=
 =?us-ascii?Q?D8qf1mwprz1QFSqZMA5CGMYLxcz5uvzZVzd6KtACTx2fUsaL4wsTyfkbhrF7?=
 =?us-ascii?Q?avDAVsqylD2FKY2GPfN9fAG218QGGTuosR2lpvjH7y53xnyE7cg84R6n6dYK?=
 =?us-ascii?Q?Hl+bdEAsukVyS29XQ2+vv+TEC2IBwf5W6gNrY7YnGh8o5uEWf5LyidBpW9F5?=
 =?us-ascii?Q?J++A0KZpcP6kHGscU2uH2HciAUKGZSpVfGKZQv2p3bZyXv2gE38WVIDNMS0T?=
 =?us-ascii?Q?EQznpNUSyhLh5s5vIeMX1jp5RKrD5xwg1DwO8f41yjkY+f4S+ljjn1kwmos5?=
 =?us-ascii?Q?qFLKUmQR6y5VrxDizDKN+VqtVQpMHlE6Ss4EY+/HsfciTGtUQhbWpQHTvsR4?=
 =?us-ascii?Q?E8QpiQ9QUt14ckVzEdv8j+ukVGC74yxY6ryWYa/vikhPVfhFY56XGRll3K4H?=
 =?us-ascii?Q?NOoqfiLkpRO2bJzG/fdoGikS2s1Ru568XoY9ctNt8NLMYShPCEJY++IXkitd?=
 =?us-ascii?Q?JnESY6ZPfWkG061ZMjn3HLN4pUyw5W/De/LqogdWB1+y0WNWdOjiBPlazKab?=
 =?us-ascii?Q?qf3lnZXzrU3/r/RqAzYq5O7O9hNKjwgUwbVrXJEaR2TmPK13/FG/OOP6kjmV?=
 =?us-ascii?Q?zDs9RmLe0sKbc2DH4SJ+lSj8cEK+Gz7IVhBB6Vs2a1ICgcD+0AdIdq/4qg8m?=
 =?us-ascii?Q?v1U+S1AeYe2nhk7pPfm5uhB0Mi7kzM/tYP8kFQPm5F8NGOZMC21QHXkhfBkX?=
 =?us-ascii?Q?ND6Eq+igVLOBcYGghRBx6Lua2+oUTa70nD1bY17dgJkyvlx/Cpqf4ih0Rywk?=
 =?us-ascii?Q?35X+VqMEDNT14tTMmlqG+/dr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed1aca4-88db-408a-780b-08d9106e4340
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 09:06:41.1586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFxh+qscKEY6Nqjjw86ED1NSHwpBimry+cLgWN1sV9ZGS8mpvXP5++fkbVrZ2Xh/ZK+sghUurBUkTlHg8haMdhe8BLxAyUMfFGlEuQlkvC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4166
Received-SPF: pass client-ip=40.107.6.93;
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

They are unused now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h | 12 ------------
 block.c                   |  1 -
 block/io.c                |  6 ------
 3 files changed, 19 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 51f51286a5..eab352f363 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -954,9 +954,6 @@ struct BlockDriverState {
      */
     int64_t total_sectors;
 
-    /* Callback before write request is processed */
-    NotifierWithReturnList before_write_notifiers;
-
     /* threshold limit for writes, in bytes. "High water mark". */
     uint64_t write_threshold_offset;
 
@@ -1083,15 +1080,6 @@ void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
 bool bdrv_backing_overridden(BlockDriverState *bs);
 
 
-/**
- * bdrv_add_before_write_notifier:
- *
- * Register a callback that is invoked before write requests are processed but
- * after any throttling or waiting for overlapping requests.
- */
-void bdrv_add_before_write_notifier(BlockDriverState *bs,
-                                    NotifierWithReturn *notifier);
-
 /**
  * bdrv_add_aio_context_notifier:
  *
diff --git a/block.c b/block.c
index 9ad725d205..75a82af641 100644
--- a/block.c
+++ b/block.c
@@ -400,7 +400,6 @@ BlockDriverState *bdrv_new(void)
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         QLIST_INIT(&bs->op_blockers[i]);
     }
-    notifier_with_return_list_init(&bs->before_write_notifiers);
     qemu_co_mutex_init(&bs->reqs_lock);
     qemu_mutex_init(&bs->dirty_bitmap_mutex);
     bs->refcnt = 1;
diff --git a/block/io.c b/block/io.c
index 3520de51bb..1e826ba9e8 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3165,12 +3165,6 @@ bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
     return true;
 }
 
-void bdrv_add_before_write_notifier(BlockDriverState *bs,
-                                    NotifierWithReturn *notifier)
-{
-    notifier_with_return_list_add(&bs->before_write_notifiers, notifier);
-}
-
 void bdrv_io_plug(BlockDriverState *bs)
 {
     BdrvChild *child;
-- 
2.29.2


