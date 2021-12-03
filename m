Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A312D467ED6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:32:26 +0100 (CET)
Received: from localhost ([::1]:41788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFEH-0003M2-PK
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:32:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8u-00011i-6R; Fri, 03 Dec 2021 15:26:52 -0500
Received: from mail-db8eur05on2098.outbound.protection.outlook.com
 ([40.107.20.98]:1792 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8r-0001dZ-4i; Fri, 03 Dec 2021 15:26:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iefV9s7CI9raWykNscSPkrbx0i3bT1UJTenT9K9So+GuRVQRn/2XEIlwHPPjjmLKbqBNOAUKO09FWhLx2BDEDfTdYQppwwpqHfKsCsfxM7mdEYphL7ZkU0+dcziOSgZy+8AEOtBcIsqXrkKvZdkSHreXGhwjs4AlfItuSk2j//oJ9wnpfiJAksHCBR1po4BFBxpdOW7WQBmCeWCYVG2xNQKBCWYOvriSW3Oo/n2ajG6Xuckh5V2MbJd1vcbmm2tlMM3YPZLfDmmNsb0lKGacyonjdz6zlYIvBRWD4eSZ99cEi0SrboXSdl/u5onynYorYi2h1avKvN2g4WficG8joQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJmj01KFgYGt01mpFsopt3xuBF4uLFTukUjGF7gO8z8=;
 b=mXHnzOAkC+pM7o19yhFNEr+AauakJhgVI+M/epOiiSZj74N28tHD1+LM4JqiVV7yO7aDrXxBzl9OfM4Nc3lUAIFblY9OahfplG0EUpZle9eIk+LA7P27q1JQtgdnjeC9Hfje7uyZSGSYDu+UOe42KvHPhn/BjW89yUhdfAdQE+YHmFzxYi6MhkgTgq1inQ+Cu5XYSuJYgd/QjDcUa/wmkd0cqU0461jHGrpzSbnZ8ig+JuQD/Yc2ZNlvWgSB6Vtq2Gj6GcS4OfcGabiQZtmUwSWTIRMmFnpU7ng9lKD5Nls/i0NAf+SrFh4W7GP0zkXPETRabo77BkJywHfdBBW42Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJmj01KFgYGt01mpFsopt3xuBF4uLFTukUjGF7gO8z8=;
 b=FoB66ZvsGEgRl/4GfYTHC4v4LJKE+omSQBsjkloGGo8ClKPcvgP09NCxtWrXRBpF064t/FUxX7hbqRjI0VbHiTP8xhEEw0DHL++hHweEjEV/FBna2tDOL5yHsys1wQMG5XyP/VVN7tYvNdRtcmOrbdldagVrrC2rjvP3y+1tN34=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4068.eurprd08.prod.outlook.com (2603:10a6:208:12b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 3 Dec
 2021 20:26:25 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 14/14] block/snapshot: drop indirection around
 bdrv_snapshot_fallback_ptr
Date: Fri,  3 Dec 2021 21:25:53 +0100
Message-Id: <20211203202553.3231580-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fb5f9b5-dfce-4598-74ff-08d9b69b2df2
X-MS-TrafficTypeDiagnostic: AM0PR08MB4068:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4068D347CC522E3DE45A70F9C16A9@AM0PR08MB4068.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5orQHoH/4xBBi784t3KVnuvW9yK6cbMGMHE2DVE2aqlchg5fUXZBsMGVN50wQpNWnOHg/pVAvyi4NgAsEbJehvRyW12IqqLIfvk0ke9IZpMevkHxoXLX26tNqzMbRAty517s4OTuyX9PNmL26nTC1Oi293qSiCmQmByREb67BTGhl0NaJZ+lXKvmbRSunz9r48tLbDlYGECQayIo3v8fElfBfPnWhqOX0aCXOwci8V5Oh1I15jYsPUoQNuhtnNJCC+dzHZx8fAFsjb9ldRmURpI8UuYYjao9+gdUKEzNdk70pTj3UF7/dyd6F3HoGs84qZRxh4VH+BGoQQpqkZdQwChORlOToZc7NgXY9PqBQtiT4VP5Pal/g6pvqEY1JMPKJrB1Ur0WqEm0fVBKbIqVtNcJvXHIVuZ6AEe0Q7Kxy0T3Y4PnFd6UgH/4+rvSyjO+B/OJur7f4HgMsT5wcYl1TyE82AVIRgNOTp+o4vPwc4MEe75ew8g0lMoGG42xmlgQgpdq5fFNbOfS1Wjh0P6d3pQss1q9zMzj8y00rgY+jbIJrvd4qQqagXIDxOju6tA0j0g5Y8L18+90mmrI1rqUGu1QQmYiwmwnnNeoSN99J/Cedr9sap7JCAj4xMsyEVfpMC5VIDpEMUSvEMju/tDeQpksl65J8CZD+Y/qMhaJb4SUT+lETfuZTLRCcH0B1PwgANTGgsmo+Gba3+Nhs8h4rA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(107886003)(83380400001)(26005)(6916009)(8936002)(2616005)(66556008)(2906002)(508600001)(6506007)(6666004)(38350700002)(66946007)(66476007)(38100700002)(52116002)(186003)(316002)(4326008)(6512007)(36756003)(6486002)(956004)(8676002)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JnOftCNd/yZ6tzwNkVaDV9GhhnFO9GOpr5GP1a580ZDITrG8Vxk9amJGaV7E?=
 =?us-ascii?Q?vM0AW3c0DQkY3UwKGLZfICbTFdQRuN81KjwhscwhRXQ9MZpfrhe4h18rrCoG?=
 =?us-ascii?Q?DKIbTJedmYgTtE8V75l2sc9Y0Mh3BSJV9yGzeF8NMZRFEUdvOWJ+QbB8yC+s?=
 =?us-ascii?Q?olJNsbyKfWIGbUbIDvv63MUcr9yTvDkX3TsWUtRttRLJuV9z8Psd53vg3k/k?=
 =?us-ascii?Q?PREA7MCFqwjRHM5nleqyogNcH51OSqYXbXozXixbM8YfCpfIpozRF8QHLNBf?=
 =?us-ascii?Q?wksqyYmbObbl5Uso2S5opOhGwwgS4EWqpRwkNd1f8v5mdj5vIJzq36SkBNxG?=
 =?us-ascii?Q?PsNN30qlZq83ok/YTgnF0BYQLojuTnFQs5BANpk448CmZYrRniNhCiyWXioZ?=
 =?us-ascii?Q?lNSW1xVj1vi/L41fQrpjVrC/2yLyLJpMEyjd1I/0o+NH7ycwnplkLGg/8glr?=
 =?us-ascii?Q?mulOPMxwrLwqApfVFF6H9Xlgj3kxzKnwehk6DrawH6hqKqlARcrCkYu+Uc1b?=
 =?us-ascii?Q?HqDO8tyBad4y1C1egn5iSzgPAr1wl895f8diSgaPlnrHwFtn0CQKq/auSKr7?=
 =?us-ascii?Q?dZ3G4u68u8oJHDcJSX4QP9YznfoC35BOH+kYuUlzqqNarxiNArzE75UHHKM3?=
 =?us-ascii?Q?AAIR7At/ANna6rs+5KaEyocNef6KQVU3AGtCwNSDhWJg1ZpvRjEGF8xx8isg?=
 =?us-ascii?Q?g0oRnj9SM/9N3hEm7VmOtDt03Y8/VVdwdwqXjFobchQvFn0mEdMrHkUzJo1T?=
 =?us-ascii?Q?7d8irwxqPgI6Dr1RaFn0fG4w2admt5MLRHeveIiXSLHkbrwvN8PJ3RbNJLRc?=
 =?us-ascii?Q?su14nYCV3tyvB9h/UNLOocc4L91LMSD7RcUL0vX1VMVKOH3J5GCl79yaOW8s?=
 =?us-ascii?Q?iwYh0FlKOBqAmfp6BOqq0/i1aLTrfZ0lyUDQSvCu6LLSHXe9+NuLJTW+nQya?=
 =?us-ascii?Q?0w0bD/m6K5RHQc+6PC4espXEosZ0jUx+cp8pKaTDO+WNKGWNXTWPrDSkdo8v?=
 =?us-ascii?Q?sMAtzlp08olQ0yHUG8r4PAwpxfyu5OtvSlh1zG7EJAVoPB7s8QE4jtTTq47I?=
 =?us-ascii?Q?xiSESz9KRJxYBxoQmTtAkVY/2xAqU6SUt72mhLyCnkgNRV29AzzdBKZY676G?=
 =?us-ascii?Q?rATUI0qvU/X4KSYzvbKzMDf0fI6WyMH50ZypulLYPotYtc5feBwBwVUo2yND?=
 =?us-ascii?Q?f/S85lO9mCEohdZKYLh5zal6bNoPel5+dP20U06p1osK2soQYE3qkLcL37/u?=
 =?us-ascii?Q?D0jaxA+K5l6L6cNnYl3tEIcI2DtblpQoHNU7wiLVs0M9qNlFLz95LlSQOCJE?=
 =?us-ascii?Q?ALEcYXIl6qehTLNcLf9ymLVwB/Vc71gerNyLpRqEuTD1vaVCtNsMBTXA3WTl?=
 =?us-ascii?Q?FdcaLmcBOEZL+0jIUhRPmPc6Y0FRvmvgkqXf+g8knLWtpfWkQOrCiD0d5W1r?=
 =?us-ascii?Q?x/dn1OGsb15GBeyMJpkt2MoqoRKNMt8sP63o+0pSNzAElagVmfqm91DVrUv7?=
 =?us-ascii?Q?oFAQCXu+ctEB7E4GmLi3ydi9lw15NrYOQzJMIbPhdG7s+FdBPNPRo/6M+bjy?=
 =?us-ascii?Q?g5mfVoJLTyG5qo7tZd4BHcOBfFiNcakiJHy2DW+CO6XCgn7kvP5jtpBV+Cjy?=
 =?us-ascii?Q?ul0UFXkN53P4nItCmxjjogCvVkA/c+a7ZnQprASibDjSHhToASHDscX9Gk4z?=
 =?us-ascii?Q?3ngGNw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb5f9b5-dfce-4598-74ff-08d9b69b2df2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:25.8956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: or7ptYQ5xTB2BIUj03xN3vY8kq7nt4icSe1QPRoUyi26FWLTZ4jkDspSWAnxY8wRuQsrw3UwU3zN5Tjoze0E+BQMgkJG4XkbQm921RJakwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4068
Received-SPF: pass client-ip=40.107.20.98;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now the indirection is not actually used, we can safely reduce it to
simple pointer.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/snapshot.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index cb184d70b4..e32f9cb2ad 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -148,34 +148,29 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
 }
 
 /**
- * Return a pointer to the child BDS pointer to which we can fall
+ * Return a pointer to child of given BDS to which we can fall
  * back if the given BDS does not support snapshots.
  * Return NULL if there is no BDS to (safely) fall back to.
- *
- * We need to return an indirect pointer because bdrv_snapshot_goto()
- * has to modify the BdrvChild pointer.
  */
-static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
+static BdrvChild *bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
 {
-    BdrvChild **fallback;
-    BdrvChild *child = bdrv_primary_child(bs);
+    BdrvChild *fallback = bdrv_primary_child(bs);
+    BdrvChild *child;
 
     /* We allow fallback only to primary child */
-    if (!child) {
+    if (!fallback) {
         return NULL;
     }
-    fallback = (child == bs->file ? &bs->file : &bs->backing);
-    assert(*fallback == child);
 
     /*
      * Check that there are no other children that would need to be
      * snapshotted.  If there are, it is not safe to fall back to
-     * *fallback.
+     * fallback.
      */
     QLIST_FOREACH(child, &bs->children, next) {
         if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
                            BDRV_CHILD_FILTERED) &&
-            child != *fallback)
+            child != fallback)
         {
             return NULL;
         }
@@ -186,8 +181,8 @@ static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
 
 static BlockDriverState *bdrv_snapshot_fallback(BlockDriverState *bs)
 {
-    BdrvChild **child_ptr = bdrv_snapshot_fallback_ptr(bs);
-    return child_ptr ? (*child_ptr)->bs : NULL;
+    BdrvChild *child_ptr = bdrv_snapshot_fallback_ptr(bs);
+    return child_ptr ? child_ptr->bs : NULL;
 }
 
 int bdrv_can_snapshot(BlockDriverState *bs)
@@ -230,7 +225,7 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
                        Error **errp)
 {
     BlockDriver *drv = bs->drv;
-    BdrvChild **fallback_ptr;
+    BdrvChild *fallback;
     int ret, open_ret;
 
     if (!drv) {
@@ -251,13 +246,13 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         return ret;
     }
 
-    fallback_ptr = bdrv_snapshot_fallback_ptr(bs);
-    if (fallback_ptr) {
+    fallback = bdrv_snapshot_fallback_ptr(bs);
+    if (fallback) {
         QDict *options;
         QDict *file_options;
         Error *local_err = NULL;
-        BlockDriverState *fallback_bs = (*fallback_ptr)->bs;
-        char *subqdict_prefix = g_strdup_printf("%s.", (*fallback_ptr)->name);
+        BlockDriverState *fallback_bs = fallback->bs;
+        char *subqdict_prefix = g_strdup_printf("%s.", fallback->name);
 
         options = qdict_clone_shallow(bs->options);
 
@@ -268,8 +263,8 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         qobject_unref(file_options);
         g_free(subqdict_prefix);
 
-        /* Force .bdrv_open() below to re-attach fallback_bs on *fallback_ptr */
-        qdict_put_str(options, (*fallback_ptr)->name,
+        /* Force .bdrv_open() below to re-attach fallback_bs on fallback */
+        qdict_put_str(options, fallback->name,
                       bdrv_get_node_name(fallback_bs));
 
         /* Now close bs, apply the snapshot on fallback_bs, and re-open bs */
@@ -278,7 +273,7 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         }
 
         /* .bdrv_open() will re-attach it */
-        bdrv_unref_child(bs, *fallback_ptr);
+        bdrv_unref_child(bs, fallback);
 
         ret = bdrv_snapshot_goto(fallback_bs, snapshot_id, errp);
         open_ret = drv->bdrv_open(bs, options, bs->open_flags, &local_err);
-- 
2.31.1


