Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E346A33F3A6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:48:34 +0100 (CET)
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXTN-0000C4-UO
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHg-0004en-Pc; Wed, 17 Mar 2021 10:36:28 -0400
Received: from mail-eopbgr60091.outbound.protection.outlook.com
 ([40.107.6.91]:41454 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHe-0006rZ-3E; Wed, 17 Mar 2021 10:36:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8C5lKwJ+l+KsBl2v38IO22+jD/2Cck4av0lMWPqfyM8gPASsXSDjOV6IB8CW82dPi+yj21IrQW5HSMWhi0xuO+2RndSUcGbd8G1WWHLDP9oo6FtKQS6DBUPBWA8rUWiSbjs53+UrRAWDqNw5cYl/aQRaxWG68N5mPT+cbbhOMDxBLE5vQDrw1gD78+knf/bccz3HdFKzY2H84j3mOnZNDYZYVDhKMpz0Bh92bOwLlGhFz6Whs5y4x6RR4ARZOSNh1zuxmSjBvXq3YSvszYUZlCuzBLUxTmEJfoJ4fIMmgLo0WusDRS1rgesLl2R1rsbu8jghwXO2o6+h6etTg2XIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f69/5RhnqM85k6ZpPxLyVyFvR458MtTs99ZEJDDoFvk=;
 b=RFv2h2G0mEOQU1P7l/9u8znFznpSA5j5dneOo/w3iLhHhuPVvgK/4WCMsMssMEOPuQEZJMTS1EUR6lFB87qAMpo5yz3OWYE45g/F4gzHO7q1yFeZ0AlqDNekgL/o4Q2jPI6WFAtaQFaPwJta+75xDGoXNYs6/M7lhOIoF8wjQjhd5zUaSM/tv95Ra53CimCxjsDw8iLhDQbWt0A4qOYlEtZSsSYcEt7jnKtB6vQU0+VTRA1OaeGqoLA6PEJzPUQpwtZ+e+/1yjFPsGzeYsAEnZQFT5ih5Fg85XI/Xm3eD4XbgtYDAGm93OgAaplD9VJaKyRjTq2WnpcdyNB+z6uo/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f69/5RhnqM85k6ZpPxLyVyFvR458MtTs99ZEJDDoFvk=;
 b=N2wI7G4dDIZE0CEeZS5OXZ8acImhwh8QrH6wnIfTZZ6vATHga7sVONd50H9KvWJhZYZ80nO71Vb+lUbLr3OYdeVjDiR9dYQ7BoDiAvOaYTNJZTdnnrSZpGYRAf4WaKlsGiBUUi844rhNvSyJ7zIDSE1xJhhVHCTixvrK/H5YDAs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 10/36] block: refactor bdrv_child* permission functions
Date: Wed, 17 Mar 2021 17:35:03 +0300
Message-Id: <20210317143529.615584-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d7f7439-0d9a-458c-e4d8-08d8e95205f3
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544CD17E1EB5E7DF0F7C3B6C16A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7xtwM+R/p18ZZyDt3RXL+3hpwDmc6wqRFnsdBh2Q2XNOdcHSSrY9eT6gY7bK24dEpVcsvayG5uMXSDEGbCLjFNFtMcqsB51NqvXjyOwhzFEW9Zv+C0LamxFLhdSH3TxMXfORbPREUt8CKpYHM2gI6tBdR8kVrlQbYQgRLj+i6hVZbw7T5kkh1mJgxZQmHQZXg/pCnzeDUT7/ah2jvMcjWOMm22UMRdxCHE5DbXkKtp9YbylAEo5QxwDa+t3MVi1qZQif0gcfxBSgfLDehE+9159lHMGiz1NyX7R9Ce0ix9Si5woTLaNZ/QY9AIRunxer2SL1YMO2bJjx6KYK8uTJLtzKwjnnGtHzvVg8XZap1wpFAqWHTaDIOJjjmooyKdaFTJigUbLFK2Bu4PQy0usUD8lEOEMUO4ujh2H8NR+5tZjOPUS6zvcq9W/VIJemrGD+AeK8VO5BQxB2CFPnl0Sgm3gw3v7awqQi5Eqlb7ag1XcFd1/XBclCVFYzoILGbiRmACPtSxJH/77l2jb1ovFdD+Svb4ZITYmaLTNp/6He3xrTXWjSjfA8sg4vlDDkbAMihO7ZJ4pDkIhF0l/+vUTe8MfMc66OTatHHO3Ezx6oeK4BBil22X4/MON28/TdAQh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(186003)(8676002)(16526019)(26005)(86362001)(1076003)(52116002)(36756003)(6916009)(66476007)(6506007)(4326008)(6486002)(2616005)(5660300002)(8936002)(66556008)(66946007)(83380400001)(2906002)(478600001)(956004)(6666004)(69590400012)(6512007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FGN6+pbuJQjnifyd2SN5O3beuNela2aUcymUK4L6HXj+g604vtURUKcT9E4H?=
 =?us-ascii?Q?YFLlacUI9PE2nzmouwsxp+z2QtgsxkgtOup87nwCRJb7bEF3QrIvKK59aYgy?=
 =?us-ascii?Q?GVknmVtW3/fOhz/MtGMNS21f3cy9q3k/IPEqKHx3IGV8I3gTu4mm/2zHcrI5?=
 =?us-ascii?Q?+mxOTfPuDtbSs8wSH57FUQFWZ21TcbDgII6Nd0HTksvbiH0Scgts6Uzge0q9?=
 =?us-ascii?Q?OY6a+sfKRuO/JpKT2YdND8qHQmc9xsA6Hqj3Dkm0Na1h+sX38Ei8wNcKzdT3?=
 =?us-ascii?Q?xUgI/sXg564P6OtFIIeqNs57HWD8QvGbeJbSqjxIvtQYBr+ZVLE3pArTAj8p?=
 =?us-ascii?Q?4ah0OlroWFol4jTIjRAFivJKLyCCVrjg5GEfIoswLzJRuAy5h1ZSyUNoXlJa?=
 =?us-ascii?Q?l22Maty34jcLC4rZTbhyN4SPCERwjyvk0WWleoTpoXxO7/78/gp/kLMxonj1?=
 =?us-ascii?Q?ItlxFKziJf3pIkSiAZVBSO7qsAcMzi/FykCmjbFpQPFznNY7KQ46NPo1UKVj?=
 =?us-ascii?Q?VRvLeiBa2E91Fnw9iuK4G1kshphBVB85SSwZco3OUSTsFq/KWRjveBQt6qzB?=
 =?us-ascii?Q?HE3NU5GyXL513AQKHklrmg27/lhDDpS8V8VkeKTsDpxaAAUAATkQ6HXb3S+O?=
 =?us-ascii?Q?MN6ec0S6bQcJyLQ0rSqxbUaijgBegeseC1F5uFcl6ogmBcJzu1n+ESwJmzt5?=
 =?us-ascii?Q?2PzUbAeN6yriOvGeVgZdAvQsRBPB7a1rMa9+hv2QOxjDMFFeSYvA7m8Gu8xS?=
 =?us-ascii?Q?JGte0ylmN6XUc6mfz5jzJxoORIDE7MObJ0d6e7sc472inUjaySejT+o62qyZ?=
 =?us-ascii?Q?pKF37AnzCsE1sR2k9gn6bUHgwGi+gGAz4UdiM2ePuRxHNsG81xOGmUqyN9Tv?=
 =?us-ascii?Q?pLNqEqiuemC5W8I6j2uMjevcK0CQnbuk2S5T8rBFkHCPdRG/kXaIyjXb0uqY?=
 =?us-ascii?Q?kj0ZlhjfOym7O0dYx9LqaWAFv1tSFQDdlQeKiIZN57EnOXNtqetNtZJM+wEq?=
 =?us-ascii?Q?09FfE/TImoWbrKKQluJovAn/NcO8ZOEfsw92OYoUsXwFaEHJYfY+9zDmnj2l?=
 =?us-ascii?Q?9DT0r8dZioXhnkwmWJv0wW//VwXoPbt6E25qGMhZS8uvr+IJpZwPTbddE9x/?=
 =?us-ascii?Q?Hk5BznX/cdE13CvKC3c3XoXL3zTuOEh3plzS9dYeo/zfbOyWGldshG/HTqHC?=
 =?us-ascii?Q?L21umOpgYxmixgSopswa5BbqHsqc3dRAdcoFoA7aiVcA3XCrPl6QHWjhcSPx?=
 =?us-ascii?Q?emHpAXOQUspzPxjcGt2/h3R2mYLhkCLchbu5AkfimhfYYyLtq6imloijn7ON?=
 =?us-ascii?Q?9QsNCXT4X4641drC5wy+pIt6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7f7439-0d9a-458c-e4d8-08d8e95205f3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:17.1794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rb0d/AsniQeylY8z/5Vh2Yy747y3Az4n+9JDgxruiq315z/r4GdHdwr7J61gRc4RMUMKJAMKoZ7/mFRIkdLLoUxa85rN4g0mGGqx/227UdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.6.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Split out non-recursive parts, and refactor as block graph transaction
action.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 79 ++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 59 insertions(+), 20 deletions(-)

diff --git a/block.c b/block.c
index 69db01c2ec..2d64c498fc 100644
--- a/block.c
+++ b/block.c
@@ -49,6 +49,7 @@
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
 #include "qemu/id.h"
+#include "qemu/transactions.h"
 #include "block/coroutines.h"
 
 #ifdef CONFIG_BSD
@@ -2059,6 +2060,61 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
     }
 }
 
+static void bdrv_child_set_perm_commit(void *opaque)
+{
+    BdrvChild *c = opaque;
+
+    c->has_backup_perm = false;
+}
+
+static void bdrv_child_set_perm_abort(void *opaque)
+{
+    BdrvChild *c = opaque;
+    /*
+     * We may have child->has_backup_perm unset at this point, as in case of
+     * _check_ stage of permission update failure we may _check_ not the whole
+     * subtree.  Still, _abort_ is called on the whole subtree anyway.
+     */
+    if (c->has_backup_perm) {
+        c->perm = c->backup_perm;
+        c->shared_perm = c->backup_shared_perm;
+        c->has_backup_perm = false;
+    }
+}
+
+static TransactionActionDrv bdrv_child_set_pem_drv = {
+    .abort = bdrv_child_set_perm_abort,
+    .commit = bdrv_child_set_perm_commit,
+};
+
+/*
+ * With tran=NULL needs to be followed by direct call to either
+ * bdrv_child_set_perm_commit() or bdrv_child_set_perm_abort().
+ *
+ * With non-NULL tran needs to be followed by tran_abort() or tran_commit()
+ * instead.
+ */
+static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
+                                     uint64_t shared, Transaction *tran)
+{
+    if (!c->has_backup_perm) {
+        c->has_backup_perm = true;
+        c->backup_perm = c->perm;
+        c->backup_shared_perm = c->shared_perm;
+    }
+    /*
+     * Note: it's OK if c->has_backup_perm was already set, as we can find the
+     * same c twice during check_perm procedure
+     */
+
+    c->perm = perm;
+    c->shared_perm = shared;
+
+    if (tran) {
+        tran_add(tran, &bdrv_child_set_pem_drv, c);
+    }
+}
+
 /*
  * Check whether permissions on this node can be changed in a way that
  * @cumulative_perms and @cumulative_shared_perms are the new cumulative
@@ -2324,37 +2380,20 @@ static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
         return ret;
     }
 
-    if (!c->has_backup_perm) {
-        c->has_backup_perm = true;
-        c->backup_perm = c->perm;
-        c->backup_shared_perm = c->shared_perm;
-    }
-    /*
-     * Note: it's OK if c->has_backup_perm was already set, as we can find the
-     * same child twice during check_perm procedure
-     */
-
-    c->perm = perm;
-    c->shared_perm = shared;
+    bdrv_child_set_perm_safe(c, perm, shared, NULL);
 
     return 0;
 }
 
 static void bdrv_child_set_perm(BdrvChild *c)
 {
-    c->has_backup_perm = false;
-
+    bdrv_child_set_perm_commit(c);
     bdrv_set_perm(c->bs);
 }
 
 static void bdrv_child_abort_perm_update(BdrvChild *c)
 {
-    if (c->has_backup_perm) {
-        c->perm = c->backup_perm;
-        c->shared_perm = c->backup_shared_perm;
-        c->has_backup_perm = false;
-    }
-
+    bdrv_child_set_perm_abort(c);
     bdrv_abort_perm_update(c->bs);
 }
 
-- 
2.29.2


