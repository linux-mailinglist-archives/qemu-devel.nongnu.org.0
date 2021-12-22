Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F6A47D60C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:51:19 +0100 (CET)
Received: from localhost ([::1]:46574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05lm-0007Mj-Qb
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:51:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bb-0000aW-FX; Wed, 22 Dec 2021 12:40:47 -0500
Received: from mail-db8eur05on2127.outbound.protection.outlook.com
 ([40.107.20.127]:22544 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bX-0002Yd-Uk; Wed, 22 Dec 2021 12:40:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fq4QNpzxpTwWitNnjLeVwtUyqMUcIq82TU/hi/i1pdYho7oRt5ukHQ8zBwowMBgLP//isXmkdoGDxVtTL4jVUeH07W9+g8ErteMDXAcMzgyZdz0AqHrFTaSYoviQ/T3Im1xJZL3VpfJgQHxufE4EH+SpiQvUG4nfyyue76sPiLz6GpjuWpU/5QF6uZJfyYYKs0R6tRzRZ70SknGhsWasqD/iTHVXSDSKVPiUzD+hHyJmvCWm2UEFPah9JHHrcwh1DPS5NZtcjrSDpuu2IJH5Ou04a0JVCaSLN/C2r/UNNEIJQUNawAVbxZ3ZRUkfCIGwRoWnXwgeBqie0Pj7Q+pdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGochcAmlq9WNCAxSlSglotwUEZXkkgcwtlvRC9XeWw=;
 b=WTdqtZabTfQmRyTauS6NwJTFvdQcByY5sZ/KkFSpx7pHeXOScG+A9Rg+J060xfakZ8BkNGrFlmrXz81lsZbABw9yDszDmWVOyX5qYenaeTplkZK7n0a0rtPJefF8oBWA5OwBMwwPQylrumtrz4XXm5brNu6oWZ807xLL0E8suBoXFXtnIubwpficRwZi3O4ICjDejreN1XiykzANr9g64Iq3/JK/FJ3znKQO/06/5Xv550Nu0QPxKVjqAaCVBP2Sc5kUvPwKGXjWN6DgBPfRtB5QZSyXljKnpvfRr7NYsJnrqLriCiNOLVv/KuUpLvt3sn8O4jUFIHkdACVKilEU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGochcAmlq9WNCAxSlSglotwUEZXkkgcwtlvRC9XeWw=;
 b=dFxlPV/RVSr9HBHgqyLYvdd7q+VxP3IV55mpjO9bqS150Oynz5P6a5Tx7EHjRJghhXs/l2n8qoK4lMEutcRHaT/HzaU2K+ezYNMQRkAsk5nlwPCbd6lAkis98fjJhfp8+9YDUlp4IVIC8uzCX5JhgO3mQMTmZ4AuoN0u0qLjQ7k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB7PR08MB2988.eurprd08.prod.outlook.com (2603:10a6:5:18::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:33 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 02/19] block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add
 return value
Date: Wed, 22 Dec 2021 18:40:01 +0100
Message-Id: <20211222174018.257550-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b567c6c-8349-4eb8-8654-08d9c57227ef
X-MS-TrafficTypeDiagnostic: DB7PR08MB2988:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB29884C0CDD1FE84496BEE8FBC17D9@DB7PR08MB2988.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8dwKo1TWsc24DGI4K9N78gJcIko69/zxGYPvD9HDTvUegTsPHUxI6N2bdcBEnSCSqgABXTNta8aVapiwQ78d00vBsCBlJh9REP0eAxsb5Ve6zFS6yVFBOAJaT4/hCCShPYphC2qMJHGLcDmV3Jeq7tF0SdjSplgRbArmjxH3dBSUFIyu++IP89t+cpA3YerYJawd+WOgFM/5fbnkZVjtON7Fthv5T6D5CpxdK99ZwroLIpm+8AR9HdyMAAJhg7aeHuxEqa9g2nxNUab9jRIk9ouBftNQ0EqfmzTgM4v3EKMNCE0Extp7kAUlE2iTg1fHP+jxmeNmNvJcYjrs1hPoziuq4P2djOcMUwrpldC8SFfsFh751kgI/SbaDZHM+qZSYI5H7EIYvoQ6tI9W++fvEOHIcG2PBqH8iIEuQf2sbPFxBc4zS97sQUmAcDqSUAJ9uFfDtD9GW8svV8Kq7xXeEF7a58v9RWrL+VkXoF0Z0a/cCWj7HRGX+/NALNi3+oQN7JIJFEXihHjLCKxIm4NyaGwsmBTzIUqbunvOiDUmFWUKAuj3lFFMpLRIKZ+TCIMYhp7BqDvuwf5dlmyqnZ3HMSw3/HZWbyRLY9Hg4ujNMnkDycgfRu6u8PUuPezHrCnKVmPUD1lQtOvzhNbheLtIXNtXm+YAlrRum2ID2bozszVxleGgJCoKhLR2FLr0Lay1b4WuhGdlqxVPQOewNMjL3Ef2k+wqdNpdEx0XzFuc5c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(6486002)(66556008)(38100700002)(66946007)(8936002)(1076003)(86362001)(83380400001)(5660300002)(52116002)(36756003)(6916009)(2616005)(8676002)(38350700002)(508600001)(6506007)(4326008)(6666004)(186003)(316002)(2906002)(6512007)(26005)(107886003)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?puv7Gnx6x/7xLVozz99e8wXtI3DEaUWC/soBSDf9XjUQqz25lM9sXyF+ZsaE?=
 =?us-ascii?Q?DwYOJTRoAhBfSk+dE2QcTcz6C7bSjCUvJP86E9p/VdWXW6LBiqdSvga2itcT?=
 =?us-ascii?Q?qVXEO/4m4r6BimXqBUq4rIUofTLqZdH5iiv3vkDOVUvu0chp6qy9eWMQGYgP?=
 =?us-ascii?Q?NZBbjWcvZ02+G9y3U7hTaFU9/UvOGlh3b5h7OLq7medT2yt2zM8WFhNWRMr0?=
 =?us-ascii?Q?tU+os6sbl2QSqD0NJGIGQJCtLvSHDoblUb++gp4NLyXAc+MaPPaDEjunhcOl?=
 =?us-ascii?Q?C+Om8PXFKcUs4GwFxeJfOqt/ZbFMgnUmHrKa7JmyI8vWAjTUm49ICFsYE6hl?=
 =?us-ascii?Q?WMGVdMMHmVPTJmiemauMroEayjUYJp3l5/y2oUFMnUN7sRSS8oaw3pAAJL9f?=
 =?us-ascii?Q?tWuwGwUOSthWQfosKzCgOttSZMbpZ8O9KQdbsb40rTWEnDcBfPjC8lvVO0Q1?=
 =?us-ascii?Q?nn/sk/wTWTS73lwcxb6hEYH4wbmpgo682cXWw4URIcVaNfM1M1it/U016Zc+?=
 =?us-ascii?Q?x0IeEJYmVPXR3m92IQogOyZWycOijy0V37ArZ1DyekDDqBELLczjUxCAclYE?=
 =?us-ascii?Q?xqEx+Mjl8jgkfe5DbqmW2mQB0iFv470soMOOeZ8Tz+HLnThEFL/prttq4V24?=
 =?us-ascii?Q?42lsCNxUYMyl64TxyS/x+F59o+nZTVQTfH/3dKABW9xYQFGZcltYtovJdCpz?=
 =?us-ascii?Q?5uQ4h7L5zJSF/MTAhK9+f18vSoKRvfFtnDlJO0nNp2qFaGZkMS9Aiq00jvs8?=
 =?us-ascii?Q?3I07522qleQ0i4Kk6g+a1utbG9kZ6mMKax86xEoJkparqp0e/1zXBguL/Bn9?=
 =?us-ascii?Q?ptCE1Y+0aR2WQdRK10EBaUQiXwUPp8f+mnDqnY3neYqs8rLJ1VZPPITj6fGn?=
 =?us-ascii?Q?Tv9cMR3ROrUZg204LPtudpCH8bhM6KoqrRcDciGYOf8fkwHh2sGXVlBVJ91O?=
 =?us-ascii?Q?so6aoM7EVND8HjXlp5mGFILFCImfHJQHl/9XyPEQ6qjLvUiThjoUVIk3py8X?=
 =?us-ascii?Q?N0/JoZdyyyBWeqJCSP+Y1WPmfLkTxpz6zKKrilBnHKsrrSW1opd4/2X+GCgS?=
 =?us-ascii?Q?bz8kiEPI+P3Rc5FCT2J2dNgMy7A91E3YBzVLJ1kgU09yLFiX6iiNlT1rIgfg?=
 =?us-ascii?Q?apToGJzGT/y7xDI0q6EcreJ+rTfDErURljolzLU5ityOBj72xLiZHD7bR6kN?=
 =?us-ascii?Q?zlDbzkMpkadTdrmYJ1V+oOSwPSzeMRqzjKZQwhpcvbU4J9XkK+HvhcHKGxs+?=
 =?us-ascii?Q?tHm+/waYaD4WHp+rvB62YeeDVgyS7TSLeHArq9XWvvW2uadHS1uHyBXqXMOn?=
 =?us-ascii?Q?txMRnTLo38syHVzIiKHFF4FaTWPgthZuC4K1SAgM5OCSxGrcFntXuW83BcgU?=
 =?us-ascii?Q?GOuXNqK3J7m3XTvMhNtLymXH/sRCk2CvBVi/BaA8lieR8N90D4gFaOo0BTuz?=
 =?us-ascii?Q?oCbARM4L3YVsqLaR+DKMaY4ZakM+J4z8oja+UEUim4gMBNYFChmII9ayBe4R?=
 =?us-ascii?Q?kQXK1Ygz9dNV0EKRMbZU63U0tGCTlzdhH16ZdKZ3rh8FUU7oFR0aEKujC+ec?=
 =?us-ascii?Q?soo+K8lueP3CanZlelS7Y52L6JnwdygbK9yVbkxzxiyzKEdq+vQgaNtTVLSu?=
 =?us-ascii?Q?JUFV172rKHjdbi3PiTP1lD+BhYw4925wfmdJpUgBib8aaj3XywY4OHlHn7zs?=
 =?us-ascii?Q?GTG2X0VVV6TEe62w8pkynnSl7Ss=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b567c6c-8349-4eb8-8654-08d9c57227ef
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:33.8619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9S3wtQ1EAzFY7mbEZerrZuJQrMvXcopHc1143MngE+RgzTymDA50iRjnTCXRTxvsHGoQ+EAEqWcHATF+/wi6S8huY6MFgBsy8i4fF7RcPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2988
Received-SPF: pass client-ip=40.107.20.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

That simplifies handling failure in existing code and in further new
usage of bdrv_merge_dirty_bitmap().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/dirty-bitmap.h    | 2 +-
 block/dirty-bitmap.c            | 9 +++++++--
 block/monitor/bitmap-qmp-cmds.c | 5 +----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 40950ae3d5..f95d350b70 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -77,7 +77,7 @@ void bdrv_dirty_bitmap_set_persistence(BdrvDirtyBitmap *bitmap,
                                        bool persistent);
 void bdrv_dirty_bitmap_set_inconsistent(BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_bitmap_set_busy(BdrvDirtyBitmap *bitmap, bool busy);
-void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
+bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
                              HBitmap **backup, Error **errp);
 void bdrv_dirty_bitmap_skip_store(BdrvDirtyBitmap *bitmap, bool skip);
 bool bdrv_dirty_bitmap_get(BdrvDirtyBitmap *bitmap, int64_t offset);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 0ef46163e3..94a0276833 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -880,11 +880,14 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
  * Ensures permissions on bitmaps are reasonable; use for public API.
  *
  * @backup: If provided, make a copy of dest here prior to merge.
+ *
+ * Returns true on success, false on failure. In case of failure bitmaps are
+ * untouched.
  */
-void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
+bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
                              HBitmap **backup, Error **errp)
 {
-    bool ret;
+    bool ret = false;
 
     bdrv_dirty_bitmaps_lock(dest->bs);
     if (src->bs != dest->bs) {
@@ -912,6 +915,8 @@ out:
     if (src->bs != dest->bs) {
         bdrv_dirty_bitmaps_unlock(src->bs);
     }
+
+    return ret;
 }
 
 /**
diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 9f11deec64..83970b22fa 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -259,7 +259,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     BlockDriverState *bs;
     BdrvDirtyBitmap *dst, *src, *anon;
     BlockDirtyBitmapMergeSourceList *lst;
-    Error *local_err = NULL;
 
     dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
     if (!dst) {
@@ -297,9 +296,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             abort();
         }
 
-        bdrv_merge_dirty_bitmap(anon, src, NULL, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
             dst = NULL;
             goto out;
         }
-- 
2.31.1


