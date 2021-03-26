Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DD034B0B7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:43:35 +0100 (CET)
Received: from localhost ([::1]:33466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPtIs-0007lu-Bc
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPse1-0000bb-BD; Fri, 26 Mar 2021 16:01:21 -0400
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:9409 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPsdy-0006bj-TR; Fri, 26 Mar 2021 16:01:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2ERhUOvtpYcFnfRDGaYDHbu90EW+VKdXitI5mE7C/EzhBLSPfa5bHX068iU2pyf9aaAm/ko+IYzGO8xPDBYQitgLMg2H+PVc81vodDsUuDZXtChUaxcWNXhP3Y7OZm/rpSSKyFiExq/meSjtZxo4xjr9TKClSyNMMEHXEcgB+sRq4WZIJMFUVQdcySU1fhNotLjeCvt9hXtuuh7GtrZ1NuXpl/UJJdnvXBYu1UT1v35AnzQvA1h7q9GG3lUQS9JobuKNSfQtDArEJAgSRoPs4jhzMz9ffoEFyjZ9JYWsUgGnAdBxNEWMUITKLD9sgKp8AdgaSqM2JzW6Mii+jLm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1R6YBn/tIIM3NCFzA+f6AReKsjIpB/lkO9dj8svUs0=;
 b=En3IqQPt+yifOtf4e2WOhH4q6Q5delyHZ3yb5m+xzQ1Kd6XEbBd2xhcZejWulSsYmP5Ois2u+TCoS7E0dVJcnJiWXPV56Lf5P8xa1tX+HAI/UkQMcKNsvqahDinysX+zLBxZyKjtJAdN2Gz+Es2gvK2uQt0kGJuy6lEFt3L1x/EA1a0K1r+FZGfGMX//QEjkZO/vvLY4uFz6qEEtYHUW3zRAyZmw5T2PVQey6qpfSmG1Lnj69q+f01p0Lh98il/2urr0DO44o6uf5BGZPy998I4q33l2Z6A2tycS012G3ylwugA/kqGNPEMnQMayFuYmyhBckC4OUVogtBqMg85fVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1R6YBn/tIIM3NCFzA+f6AReKsjIpB/lkO9dj8svUs0=;
 b=TlScyvUpJsM6S2dQeZ8pld76nCvr/8eurPOb4JuGMY4MDkbBZTNB0KljWseDthGwtjQNel+8GxZ+9BaAUJ0MXssCP2zSoEDP94MTGmT4jRb92fIje5A3ZKOfg/RBqLgDfHbfenl1SR7Mqf2Y9lMaLFN7XW6XZnFhpWbtBYu1TRE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 20:01:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 20:01:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v5 3/6] qcow2: introduce is_cluster_free() helper
Date: Fri, 26 Mar 2021 23:00:42 +0300
Message-Id: <20210326200045.363290-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210326200045.363290-1-vsementsov@virtuozzo.com>
References: <20210326200045.363290-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0166.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0166.eurprd05.prod.outlook.com (2603:10a6:3:f8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Fri, 26 Mar 2021 20:01:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ba47045-e476-4ef3-3f98-08d8f091e38d
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB58776377EA331C77CA3F92FAC1619@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rExNEqYgSIHzxY2/Fh7g2pp13iZCyfvX5Gombbvz46qw9o0oGxM+vTYb6aZs7clyC839LWS9QlYoLMK/oT04DrbRhabYqNScDOB3G/9s757CKF9cKTJsGeo73VR2Hk3vbAMgJHxNxPSQu1YnpFGEEVAya1JeB49IZmfHltmYt3RUdjRU1oRMn/ePXPLJvSUn6rOP1mIsS1qVuNn4nTUgjgHGo3lpoqdznBIi+jgplz99PbHCp9wKyOs7kJWZh6FNCgrnRdq/UsRxagJprBujagC18sNC/l4FaX6eBIPjSgZBBtyWIuKmF8a152dFDwrcecbklzX0E6kZONGCG42UQFdVKsdHZR6eRytabHyvEc5QQ1zHX7mO2LKhe1s3WWPst4i4VeN9BO6/rvEv4G5U3gpqlDtyZ3tmAAyGQ/YKlgVhE07Y4pgHi7ctpATTp6MZnsXEGmULXUeFAxPvXPGuh8NDWFo5zxrbV/9jyQgh3/vYmr4MGMCm3R4+VfCfkXMrxAP9ixpHLalFguC3WoQVBiPNwUWLNeaV4228vZKbK3HrfG90FZ14UTkHvCHx1KFsEboQHDafQIFeNm97uOjEZpnpGq19m8+x0YzGSW/83tdiPGErt/Xb3oX+DcDK0KDuG2T7lANxAZOr6VcHFyD7mDzYsRww67mYamRwGLEezsjg2lNMOrG3Pgvz4UplvPPx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(366004)(376002)(136003)(396003)(1076003)(316002)(6486002)(52116002)(36756003)(6916009)(86362001)(8936002)(956004)(107886003)(5660300002)(2616005)(4326008)(26005)(16526019)(186003)(83380400001)(38100700001)(6506007)(6666004)(69590400012)(478600001)(66946007)(2906002)(66556008)(66476007)(8676002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MGQ/YpEYQsywEt0QZSQBoCIo/hfXUaVugkNZ31Bqb2lveq06tYvinK4sGfjV?=
 =?us-ascii?Q?+m0rd4BUqdhge0VCAUcrO0tbcroCfhgHP/r+sGjYNUre3LJ3DqR0RCLJcXPg?=
 =?us-ascii?Q?busAsOAsoheDGt3x49jqaSc0orF4hvtCLNPHgJuAEtvPJS6h7VwiGZJMBA0M?=
 =?us-ascii?Q?NRNJCrfa8HL48XEUzqxD/qFnTo9zHdSe9KSA0lBKspPHlTtHZ/UOiNRE6sj1?=
 =?us-ascii?Q?qG14jUxtABPKm7J//TtyL8OhTCAjJ4useVxA2MM+Mr7Z9n+BSWQN0k6iKULR?=
 =?us-ascii?Q?70GYvMcs7ojP20hO8DDvsdN3iTQk4fVmq+0sO2EqD5j8O0oG6PQ2wYSJ8BZH?=
 =?us-ascii?Q?IvVcrkBJgJ/Z1LPshiEf/jziE0ZH5H2Y9xPGGHo9pErvQS24S2ybsCk6um8g?=
 =?us-ascii?Q?5mIBVUc+Krngf+WLWJXtyORodgeEI5dDrb3FIcxjZNniDfo6vvS2GQwcwQPc?=
 =?us-ascii?Q?JNjsX7FpiByS8GugRma8msUFyKQY20OTBqprQe+6NGHEkcIFJ3Kys18k017I?=
 =?us-ascii?Q?1WnanUcxe1JsG1gNzVKuy/KWKQMYovSnCFyJ+IIVU5JHOa/5+zgSOes8QR7b?=
 =?us-ascii?Q?rWy2hvzEar0QOHChZs4QztUfGTrtePK2KmcSvX+qtr6n1X76zib7zX874ygo?=
 =?us-ascii?Q?UMEiFQl6V54+wLIa+GhR58pLf1vx4QrhUyM1l2PjXNed0cyz7/qmQQRGVtmH?=
 =?us-ascii?Q?4xVhLdKt/my5qdyFdpmYlmMfrCBDb1Irfwi2J2c2ahPKo0Bul9zJO3Qvqv0P?=
 =?us-ascii?Q?TRO6BGDGNnLUirGAfIsjmnh7IW7jXWRG+abqCcrYDBr4Ylujy4qtL6WoghFL?=
 =?us-ascii?Q?MVJsR8KSZgQOIFrzKmjdygm9cfKsnGwjDw/FSTDQprz0tdEbceR+I4/jTBRF?=
 =?us-ascii?Q?CA1ikj4YG4BiHV5r35aNL+OCzhq2Zmm4MuxYHVrXBzE92q30IRHtxTlYZ+n+?=
 =?us-ascii?Q?motMOXiw/XLBzjq2Znq5GLUUtQZ1/jHuagWTbXw2i3GDOCxy/9pzbTABskaF?=
 =?us-ascii?Q?O+pB2ZHSrwwEuZj8Zk6tvFh14Hzy5YGB2bHBPYADPAtfXDRYQGdVL8o3xDDm?=
 =?us-ascii?Q?sfrIwLCKL5yGBPUf/0Qyk7/7bkHARLaT+EKZVjkhHnY5SNvQCSF8XpR7aP6w?=
 =?us-ascii?Q?PfWgm0m4K0zDopHtT+rLTsSlkpxJAJr/42lpgyRkyPXAUAoaNb0eN49mVYHf?=
 =?us-ascii?Q?Kh3wF1N/Rrt/MMAFXGSHvpvE4f5O2+M2OHoD10goGGNC9TTgXg5tegeUJiyo?=
 =?us-ascii?Q?ZP8RaZ3DqBG1zmCWJKfOqagtBWpG83rkHT2pfxUSYhP3g8mWPDEE79Mad7h7?=
 =?us-ascii?Q?jiEviQMyZI7jN2JnwvijI07L?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba47045-e476-4ef3-3f98-08d8f091e38d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 20:01:05.3316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLybVsfj1PUe54HOAPXGOfR95JMa+sRmler7Ea9ud/swtM/KYJbXwtIqYeNUIAEz6qTonPYU5FDnOTLLPBUtpF7A1XvNeRN/kEWPXv0GP/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.20.134;
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

We are going to change the concept of "free host cluster", so let's
clarify it now and add a helper, which we will modify later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-refcount.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 543fcf289c..1369724b41 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -962,13 +962,32 @@ int qcow2_update_cluster_refcount(BlockDriverState *bs,
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
@@ -980,11 +999,11 @@ static int64_t alloc_clusters_noref(BlockDriverState *bs, uint64_t size,
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
@@ -1031,7 +1050,7 @@ int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
                                 int64_t nb_clusters)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t cluster_index, refcount;
+    uint64_t cluster_index;
     uint64_t i;
     int ret;
 
@@ -1044,10 +1063,10 @@ int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
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


