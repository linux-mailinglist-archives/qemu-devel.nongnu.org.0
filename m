Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08802400C22
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:35:06 +0200 (CEST)
Received: from localhost ([::1]:57686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYdF-00030i-1i
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTi-0002ui-ND; Sat, 04 Sep 2021 12:25:14 -0400
Received: from mail-vi1eur05on2102.outbound.protection.outlook.com
 ([40.107.21.102]:64544 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTh-0007MU-0s; Sat, 04 Sep 2021 12:25:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+xWVy5l2xUwxqJEbBcKoaPjN7mXd2NxgOHroVSxchnwU+XiqJbh7BzmjBg9ytquVU2QIHmcd1CiyYSQYT+0kj6yGT6DE1oit9Q2+YpcIY4dazlV6PDwkMi2cGAn6NgGs7bJb1P3NBo1uut+5iuJaedfqQ7WCk/V9cb5sUPMN8dpKyKs09EaEtb6q7PhdtxR6qMH+zw4XWDpRzk3ZD6RMQET27X2iyDluRWg5LNWdVKPFneS13hVkApUoa4qO9MF51oSap0VU3jpLQsP91kII1cpj3fzmhUpHzD5btfllVcTLvqGsaZNqt2gR9TTdVxhaEyvDtqIdiFVoPtBh+wO4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=0+oA3kpyQ/yVl7eX0w2zAOAqwYuwkV3Ba0tdWErIV/0=;
 b=IwZcWWh9ChsAlxtOXLphF6ttAcEg3A7qUBCoxshapWAtXxDMSsVx4fsm+1GwTNc+r03X+l8q+azg1n+hc6+wqjH7GXEbcZILI2yUvGsk+dE2erT82chs1FQj4Eo/4LSuAO+ErqyWAxa097dkr2OTnG1svtzHPCHEcLVU2zOCNE7qVMtlSK9wI1E4PbJkmQuTzRZske2vIAwsN4ko210ebDee5vuwx0NfQGwWn5c/m+QWv4pGOoORMpyeQL5eVqdAR0iJ9E3mpnwGJdgVSjHQCDMSuIBA29M696f4FuyOOvTxWObxr+cv7HX08tW3czeRIWAOmj1tClW0kjzvpD0voQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+oA3kpyQ/yVl7eX0w2zAOAqwYuwkV3Ba0tdWErIV/0=;
 b=wJrdZZSKlvqt6B4+7+KrP8KcOqosQ75aZaMtns0+phXgnc6l2kv8vO04Fvf0/PeT/4Ph+WJl+qKAnvwPpU5B5oF1+QdIOEhm4Mqs+IlS0juFI3hNAV/EV3hCDTlAuCmK/G63yHeL6LhHnOcW4Yiiiek8cuUkN1sFUUhhc0eQIzQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Sat, 4 Sep
 2021 16:25:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.024; Sat, 4 Sep 2021
 16:25:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v7 08/11] qcow2: introduce is_cluster_free() helper
Date: Sat,  4 Sep 2021 19:24:25 +0300
Message-Id: <20210904162428.222008-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210904162428.222008-1-vsementsov@virtuozzo.com>
References: <20210904162428.222008-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Sat, 4 Sep 2021 16:25:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22a971c3-d9f2-4e9f-80c2-08d96fc08bd9
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB69042D7611EE50A205FBF1C0C1D09@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UbcxU+/k13PQj9Gegl/i6OsYXtA3rCnBeMq45s8mmJr7GesFnUYlbE+Uvh60InDftZw2JJUcjW7iJB9z3vDCsTyE7AAIK/uhbORV4VGymo0uqiO8XIxu2CCLNO6neLxy8Y+yg0+qWP/36O0rJbHLnt0fZrwHwCES93vWZv1thpMcFy+1OyvTN6QXxjl3Nt6Wv/bx5x1jenYoiCXBYo9lx5wnFjVioAE7gYb+6ba5PmHheFU56auzuhOr+PqsZ77ZDsA10pHr+I8E7YccLwpuTEBZMpcGv5EXYgojBSnWAvLTVR+ixuW1nrDYMhIsNW6bsvi1AEatWYPRNJJ7H9AdBN/6ULuAw2JSFY4+JDWjcJsbOCHx8KniQbtT3fLLPTO9+Z/C45DId1vzSCcutk9vMobfZDCxPWyvgKmTHVWScqRPhvX0Bk2eHZgvfApbuP82shNHwS99bqe1WO/NfpnYjz0y6bTqj4P7p/Q1Iec7o+gbmQDxpALNMux67tVm5mrPT/SjoDc0oba2XM161XSj8DAJaV5HflcqVirnQZDLx8/24DZbcdQEyAHKlFUBNLkt1PvpRQvRsF1kqls5rwbVwq4lgO0PGdGuiiBllcoiFUNP5EiWCab00bvLLqQUEF6SOurrb4/EVBZnGh9YLtLpml+WQ6dmkjbQ/LUZS1NrRO9HQiCCUNg4oV/lApJ/msePXwQSW+NuAnJbMDryta7I+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39840400004)(396003)(366004)(6486002)(66946007)(8936002)(52116002)(6666004)(83380400001)(478600001)(4326008)(38350700002)(186003)(38100700002)(5660300002)(2906002)(1076003)(8676002)(6506007)(86362001)(6916009)(6512007)(66556008)(36756003)(26005)(2616005)(956004)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6nB0zn8gATAfAx2K7dalK2G7dAKH6ALJGX0+nBdKIMRr/M460an8cUByAlb3?=
 =?us-ascii?Q?rLTpvwAqV6KIl7VQVlzi2+PSlg22SCDcY+QbU8a52K0Uid073EW3s8dDiDsb?=
 =?us-ascii?Q?4OKO6uJ/L1EXlGDphue1G/B/n93BxXmjDd8X3oy+FGD9gPQMLwgoJsgmMM+o?=
 =?us-ascii?Q?zAcXCRVVQr5eL4Pr0MZjs7e7BSAyOeG5oVfGryPwvL/qkxYywPoQEMMycTRK?=
 =?us-ascii?Q?c+rzK/nAQX36tJky+LHLw08/SWUtBoCxyk9M5NBm6wqvm3hVtFV2iq9YK8yj?=
 =?us-ascii?Q?IGNL4HyCKT33jIp8oHrOotihpPn+Q8BIHH6RfEjZw6zPPuNnFOyC5sD8hdE8?=
 =?us-ascii?Q?3ol26/OoOJDLCt/Vw9c4gsfN2r+6Z+Tx2ymyd5Ksd+e5mu/DHubEf0jejsQT?=
 =?us-ascii?Q?TJCU1xfYj1jsIgUBHxrH+F4kRyBRN6W3plnO83/19q2yIUNYx7+ZZrG73WGh?=
 =?us-ascii?Q?RjQVyYnGdfQ6NpyvmAzR7ym49CVUzB/qJa+SUmBa4NadVVfevxTwXjFnKb7v?=
 =?us-ascii?Q?eJKRhprxge2NM1OGM2+0bgrZhzBCsnJ5rd0tCjMy5Nk7HSG3WnoOrN5zOUfg?=
 =?us-ascii?Q?bQcSAjNlgSFF3laVMVJaUriG6/M+NV0MXUkrfYHiw/NAj0DvCviH7ceIBtmW?=
 =?us-ascii?Q?Ibkg8O1bcjS2KJT8irHr4STnncOKjLKsRfWU0MRVYS66dgAiuDeYyG7EQDkO?=
 =?us-ascii?Q?Sz9QuQY5MVIas4pHctg92WOOw7LUMqSx7wjAgNUYaUrSrMiII+xGiguVeiCf?=
 =?us-ascii?Q?tae/iBTtK4D5VBeHAHqLNpFQSK0c4YGHYTrUpkIWNczifCc4ZFZp6KkAjAlL?=
 =?us-ascii?Q?OOLxtx6AF1mgUlDBGWTLHdRS2j0shWJQeXzx0J3+oD1qsMDEM5AlJlAeiiNo?=
 =?us-ascii?Q?U7MkXoXeWq8W2NTGsNtrsM9D3o4iLKOtbhdiyx25kbXiV8CHGccoIEY+scxu?=
 =?us-ascii?Q?c6IqdQWhXrnikPnPQCOOBvOf9mfigUpEmQQN9u6zatba/w6viRZ+VqxYXA3A?=
 =?us-ascii?Q?rwgwsCVdFNJPF+aotGlZp8NDc7Ng1RZdgu1dd3zM80qOcMp2irsqj22u45gU?=
 =?us-ascii?Q?fYvDD7yOALlNDGA34mLLujWme2y4G6NbHWhBgELuW2nWBm8/jieeFfwlGFR4?=
 =?us-ascii?Q?cet+PXrHkD38CMsCWLib/hw3yMwzwWIK/bTD41oHKZ8crcHGoHPX+cs8qxgG?=
 =?us-ascii?Q?pmX4+mTwmsHkuSf36cYV9Us5QqTsutxdedUq2KlJhBatlZBjgHirAv8bYBMQ?=
 =?us-ascii?Q?TK0YUYFYW0f7sehGAFBA7o8pozqGxL82ictb82JhcXUI9yI3+4lVLjf7xER1?=
 =?us-ascii?Q?zCoGZJRdKXXoBKzBNh8X52lS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a971c3-d9f2-4e9f-80c2-08d96fc08bd9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 16:25:02.2477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2scN7evRmKejYKde75cP2ftP6/DhJKnUg6PTbEPbbH89gaqApHJnqd9MEnyVlJNbAKIOieyHG8Mp1C3kXujJKItHG2eXlPmQngfY86MQGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.21.102;
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

We are going to change the concept of "free host cluster", so let's
clarify it now and add a helper, which we will modify later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-refcount.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 8e649b008e..13b1fed43e 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -961,13 +961,32 @@ int qcow2_update_cluster_refcount(BlockDriverState *bs,
 /* cluster allocation functions */
 
 
+/*
+ * Cluster is free when its refcount is 0
+ *
+ * Return < 0 if failed to get refcount
+ *          0 if cluster is not free
+ *          1 if cluster is free
+ */
+static int is_cluster_free(BlockDriverState *bs, int64_t cluster_index)
+{
+    int ret;
+    uint64_t refcount;
+
+    ret = qcow2_get_refcount(bs, cluster_index, &refcount);
+    if (ret < 0) {
+        return ret;
+    }
+
+    return refcount == 0;
+}
 
 /* return < 0 if error */
 static int64_t alloc_clusters_noref(BlockDriverState *bs, uint64_t size,
                                     uint64_t max)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t i, nb_clusters, refcount;
+    uint64_t i, nb_clusters;
     int ret;
 
     /* We can't allocate clusters if they may still be queued for discard. */
@@ -979,11 +998,11 @@ static int64_t alloc_clusters_noref(BlockDriverState *bs, uint64_t size,
 retry:
     for(i = 0; i < nb_clusters; i++) {
         uint64_t next_cluster_index = s->free_cluster_index++;
-        ret = qcow2_get_refcount(bs, next_cluster_index, &refcount);
 
+        ret = is_cluster_free(bs, next_cluster_index);
         if (ret < 0) {
             return ret;
-        } else if (refcount != 0) {
+        } else if (!ret) {
             goto retry;
         }
     }
@@ -1030,7 +1049,7 @@ int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
                                 int64_t nb_clusters)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t cluster_index, refcount;
+    uint64_t cluster_index;
     uint64_t i;
     int ret;
 
@@ -1043,10 +1062,10 @@ int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
         /* Check how many clusters there are free */
         cluster_index = offset >> s->cluster_bits;
         for(i = 0; i < nb_clusters; i++) {
-            ret = qcow2_get_refcount(bs, cluster_index++, &refcount);
+            ret = is_cluster_free(bs, cluster_index++);
             if (ret < 0) {
                 return ret;
-            } else if (refcount != 0) {
+            } else if (!ret) {
                 break;
             }
         }
-- 
2.29.2


