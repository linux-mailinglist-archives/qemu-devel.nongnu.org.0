Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C3136DC45
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:46:28 +0200 (CEST)
Received: from localhost ([::1]:43508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmOQ-0003kw-Ft
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblya-0006HQ-I9; Wed, 28 Apr 2021 11:19:44 -0400
Received: from mail-eopbgr80128.outbound.protection.outlook.com
 ([40.107.8.128]:24602 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyV-00028J-5I; Wed, 28 Apr 2021 11:19:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgwHab/WFiWMgGoqyF6z2hV6AvGs+WItJL3Lwaz8qGliYpU9gLRt8Ao8STujtLy6vVRfOeKcGCz850xsuuT7Q7FDHn8W69BZIeR20cukl5++ZDR2Pjszp1EGdtQMJl6U26n/Qp73o0UlP/NOXFV6B867yNIaWhttUjcS92h2Mx+K0ZRmqZCX433cgqCNPJ95KqIe1/HmEI8A7oXpWUH9gx3IM8uA2Tbd27kxfrfB1e1NGqye4vfBC8QkuGryfb/mMCbB/pv94O4TeXx7zgS2cQ7//w6iGvH3E309o46EABVh+KICEDSM5u7aJG7i8pyEy7mDE+u6FZXoKvCzS3G2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAa7mRfZthtbkAYjv2UjYrYLZtwF4DqlNNg342GHyDM=;
 b=nTU78/js2S5IrR00tao0SKW738rRzSWhLKilYU/7eCz3q1DNU2iG7xdYktYBRx78kSXn3Pudv6jzxpoY73RiCgweIsqTZX2eUa42eeZfb78VWx8PPBBuWYd1BZdifUzPytVB3yXOpg7hx0Xq2ztVEGHcOrDMCVSnWUWYGjEuGF9nC/y8YPIPpgQmOm8JJ3h0G9tcWmNo6JsDQUEbnV6s35UXCumchCuGLBWvSOV9mtyRJeamZFXZKu5aLJeXLzrLinV9bbm8vARWRUxXlWXo0ZEOgFW/iiz8EoGYCIxOd/ZeesXdx+SYfjOqQjtndKKXMMsOIwxMAaNmuVTXQGx3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAa7mRfZthtbkAYjv2UjYrYLZtwF4DqlNNg342GHyDM=;
 b=tsPE3JbrUmqW9Qr0txF+Rqkn2/WSGebEV9QpX8P/DfayuLcS5mnZJgW30Zt5PoKlxMCkqpBXshgM3kQygCX74WI10VKJ3mv6Wq1/9KH6aOwX8P56HnF30GpyoAvRkpGZfvY02PUF5+NEVYziGmm3KwNrM+cTsSnne6SWh9B9cHw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2419.eurprd08.prod.outlook.com (2603:10a6:203:a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.26; Wed, 28 Apr
 2021 15:19:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:19:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 32/36] block: inline bdrv_check_perm_common()
Date: Wed, 28 Apr 2021 18:18:00 +0300
Message-Id: <20210428151804.439460-33-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6291e9b-7755-411c-9f5b-08d90a58f257
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24191E79E0F38554CA884729C1409@AM5PR0802MB2419.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W0200DS1Gjhj747w3Nnu26kSnKq4yQLMeQ+f6JlEID350s3EWJ5GVONc1K6Pco9jSlogXIYDOSMwRvabAO/QOjMaj88R1KZWCLYA/TfOtY9zvDwCuDfo5mSo/vxBzf1Robhq9Fc+GJ3SKZR+Bo5kCk8C7BTz0ejKd9BmIxNHn9FwAFhv/1Z78hQOY0i38PmzCcNMaQZ2xcpyttoMrYo5Cqc+GNNOcS1ozbE/rkWZE2xr6hzz/LjI515UyXklFzMyLcT7jg1g1wFnLoqFcBNw98GKqiIN81EwY4oG0MdCv245Z+X5wrgK0y7t4vhiMdJMqE6hfeOl4/aK0cBm5o+6lQUYFLgrYNTg6SaEuBu+Wtil8bfsPg2mLkLUmMvSG3nE/6qO/0UcEjlaNDNMO6582DC8bnJUNr/rymfuppjKBG8D5GcRaPt1IBQhel94ifvJrejqr4hIvtHVBqCA11Z55zGKLrU6g7PrRbI1yE1TqjXKzjyQVRNXfDypvqj1g1ePuVGqsa7TwVCsUyBXvwRrZ4vr5iGI5H94wWypa3azCMWKeVAVnPmv2doqDUo2uuEFY2B9SSE6TONJ7sy1JtNve98Ow8nqFF34sg+Gn0i9rZLvN4NK+PydagRaz9Apnr13796jvAcIuj1zljRrCqAh0ivJTmQk8OB/SsmbH9jU1Bg8gILHpebihp9JoBIyDugM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(376002)(346002)(366004)(6666004)(66476007)(83380400001)(8936002)(186003)(66946007)(16526019)(8676002)(956004)(36756003)(38100700002)(66556008)(4326008)(2616005)(6512007)(478600001)(52116002)(26005)(86362001)(6486002)(6916009)(1076003)(2906002)(6506007)(5660300002)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?s9BnvwM8lJx6v20MLOeGABNSiBGRIeHEAX8DAVGOzrSh3NRbhuhJGjq7YzNL?=
 =?us-ascii?Q?lC1k2ptQ/vUiT1cs4Hvv/TbwCiUPLqKL1cfuZBdVHNiUZMQ/nL8f6K0f3XEB?=
 =?us-ascii?Q?1/I3MBJrKGVFUHD/rv5wy9/VjENn+/y+cXp+s7tUdy+1ouUk1RTlnrf/OzFd?=
 =?us-ascii?Q?gCNUDrAueZKGfs+YasoJA3ZCrC5i92FLrgKBB0zLgcYD+rhym6+LN2rR3Y8Z?=
 =?us-ascii?Q?GnVALXkaKGcvtM8RhohJcKeQWSXGjSSe0FWyIl9aH7FBvszH+FrHVgBtKI9s?=
 =?us-ascii?Q?f6oqw5TGuFOsSvD0ubUbETZe5Y3E35N/vhkHJoK6GzMiQCNhjLHTw/SLts8E?=
 =?us-ascii?Q?6aIsQT1wP3xvQsflYa1MHgXVJqTU3VVtmscxURl9ED0C0KBuuYJ1xRNYydxj?=
 =?us-ascii?Q?a1oBXD8naP+xIlz2447UxI616vgSxfd2OQiszpqAOvPZU6RpHMS2JfxWMIZ5?=
 =?us-ascii?Q?gBtfPHtb+rxCnQAqi0lV/Els+NsjkUFN9WLPnD7NyMszgc4X+6smMqwDD697?=
 =?us-ascii?Q?z2cI92LbRIOsZJS8A39eEs83qePPAkHPNtQqRz6iP9g9HhESVqTG1UVkoUle?=
 =?us-ascii?Q?es8gcmUWItkEkO5rjtW1g9b5E7bisWxlUEdh9x43oXADtLKR5j04dXv3dOdN?=
 =?us-ascii?Q?DqvzHKtKTNP9kGlPBpSJF9Ji6Jb25S7EPfXEaokAdCrsM8z+AtlqeQIN7u1I?=
 =?us-ascii?Q?qJ5ihIBNioOky4sPH5mBxaAz0F2IbjuKN7XmiBunx4ERkd5i7DXCWAUKYjcW?=
 =?us-ascii?Q?YPIZu/tQw+YryIeAihQj0twoFeYAdkv20IlYz5FCDlMHavgRk2/GeYqumKEL?=
 =?us-ascii?Q?A/70Cx9+IYxbVguNvvJq5IVRVCvShcS1AKxrCvyZWqSZJbfIBkBw1xWiIZFv?=
 =?us-ascii?Q?kXMt9cZfWttj9MCCN/yRCbnNyAguPu5/juA50I0saZb/nq3EsiV8vQounKe/?=
 =?us-ascii?Q?IqtWlm8pKDu/L6V4BtX6YFXIkQo8gKsASaZ1VRfkxjR96ZRMNYuLkna9i2BG?=
 =?us-ascii?Q?E89Dm8u1c1zoKAWyf6BEtZrfEaL2uNd2DoHopQKOmQNYMwYZxWKCNO3MVd8C?=
 =?us-ascii?Q?gijU+5YOTD1jnnfhLwUuO583vPY5NbHvQ73SKRHexjXT7iwb3fXb2UtaXQwy?=
 =?us-ascii?Q?KWeSIWXpGKqUQrVqZ6ySbeH88iwRDyQlV5CVd32DZpqlEBqnvGok7f6FFCq+?=
 =?us-ascii?Q?j1xerIgWyAin52Uj8cafF4N8XfjgA+YCzWk6yRiHGMmT59fBi/6za4/N9hbQ?=
 =?us-ascii?Q?+XJm4WYkHjs9KUvA3DoapYgDrLS9lmDpBSbfxCK0c0t0/ajI/FMB0Ml02WuH?=
 =?us-ascii?Q?R8Gz6iPLYJAz1mAbHV9P1kE0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6291e9b-7755-411c-9f5b-08d90a58f257
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:59.0308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXG58zc6Z6gciZW7foQ//7kT5z3gkoM51RSggiY7fn5aUczP3aMvje3IwLCCvtqIhw3MfKFVXFMNCsYkmyDD0URKSWWBeU+fX4bxqgG0FuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2419
Received-SPF: pass client-ip=40.107.8.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

bdrv_check_perm_common() has only one caller, so no more sense in
"common".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/block.c b/block.c
index bf7c187435..38bd2ea32e 100644
--- a/block.c
+++ b/block.c
@@ -2373,33 +2373,13 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     return 0;
 }
 
-/*
- * If use_cumulative_perms is true, use cumulative_perms and
- * cumulative_shared_perms for first element of the list. Otherwise just refresh
- * all permissions.
- */
-static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
-                                  bool use_cumulative_perms,
-                                  uint64_t cumulative_perms,
-                                  uint64_t cumulative_shared_perms,
-                                  Transaction *tran, Error **errp)
+static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
+                                   Transaction *tran, Error **errp)
 {
     int ret;
+    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriverState *bs;
 
-    if (use_cumulative_perms) {
-        bs = list->data;
-
-        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
-                                   cumulative_shared_perms,
-                                   tran, errp);
-        if (ret < 0) {
-            return ret;
-        }
-
-        list = list->next;
-    }
-
     for ( ; list; list = list->next) {
         bs = list->data;
 
@@ -2421,12 +2401,6 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
     return 0;
 }
 
-static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
-                                   Transaction *tran, Error **errp)
-{
-    return bdrv_check_perm_common(list, q, false, 0, 0, tran, errp);
-}
-
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
-- 
2.29.2


