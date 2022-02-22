Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA8E4BFF43
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:51:34 +0100 (CET)
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYNx-00050T-Hf
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:51:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMY7l-00088C-Jd; Tue, 22 Feb 2022 11:34:49 -0500
Received: from [2a01:111:f400:7d00::725] (port=23531
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMY7j-0008Rw-6n; Tue, 22 Feb 2022 11:34:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3t58ydJqgNl23nwgYJLl0Qi41neTNDa9YGPYzoAoHRV7FzUgfoCQWyJc8KAqr87UE29fmaw3iRaI6riYbH5jr2oAGVoic7Wte0N1DbLUsj9587YhT0FhowZItMbqShqXeH/ykIIAWkGXN8iRRYl1qr35tlfg0uJHOJ6hxKLrb2DBK8m3mB0jv67oe2Pe06XMxKgClyO4FnBDLHrxaCO7bNbvJftOBGHdRLQ/qLGe3A1ya1dRFN1lHtV4BRSSvXYu3Ge4ybb1Ky2bVhqXyCmL2zzSkitTtctCzo7KW9GTygxqITBFIKz7VO8QOC3QIaeL2wL/Di5SXxvlVns3Ok0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kltBaAL+R9c0eB0UHbxV00rvSM46I+fUu842Tt7/jic=;
 b=eFlsStu2FTG2qqw028jPqCUS0y1OCfVQf3m9ZJZI61XX7ET3Hbgm+fGLsjT0OZF1w4ZKgmIpQEghesRKwfTwYta/Ryp8riEIQdZCr7npZe6li77+PGFhdRDOsBIgXn++5o87S8MDm5Ms2ui390OU0/WhQdVCWqHWgx9ULb2ApoqXb6wO6g6No3+8+eXLQTr8OBhUGYyFKPBI81iz1QQ4xJluV1A4dszLyQ+vDzedOj/v14Ar48f8AhkzwP+5GkBnNYA0b1iS0k5iNwGHO8xisMvgexrnLp+gbMu6V8D5kheYfSGDvY64Na9eQH62jlsijSE1hOXJYMoLqeZ6qyKIFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kltBaAL+R9c0eB0UHbxV00rvSM46I+fUu842Tt7/jic=;
 b=pYXDFkPyIi+38hO+hIcgO+OprNS33iseKqvimGhUrgSI0jx5yqfY6IUsxtb9a5FbhlEbp+YAlZtUQDwSW65YG+rItaW84PFCoj0CnriDUwEcc1a0/+if24F8SF0ZVAJ0ZEpEZ3VcdkVPIwrN+xJIh/eeOUSVBZLxPTXPVnaRwsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by HE1PR0802MB2524.eurprd08.prod.outlook.com (2603:10a6:3:e0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Tue, 22 Feb
 2022 16:18:52 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 16:18:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, eblake@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 4/4] block: simplify handling of try to merge different
 sized bitmaps
Date: Tue, 22 Feb 2022 17:18:33 +0100
Message-Id: <20220222161833.1453641-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220222161833.1453641-1-vsementsov@virtuozzo.com>
References: <20220222161833.1453641-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0401CA0023.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::33) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b86ab1a-5265-4cf4-0a93-08d9f61f041d
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2524:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2524A63481492AD91ED987C4C13B9@HE1PR0802MB2524.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YuCi8nM51u5Mj0nTjL56yzji6v+1oF3p7Y7HoMCGLUHijwGaqXA5Z1HADm995PqHSbASJWGqwpvqizamIQU8WE1V/fEfNeW8UGkB4yFIwlJHQoDMoQAPAc7DThy1uEXWwC6YImHph7PY7DFjdsj5dOIlq286i6L+gEFuS1Zb+MwbyEDICmFUBN6hGyNO7kIqleaOsVM5rEMemyuHmyVL7l67vcvZO1b3ba2ic/gkt1P4aJ/g3IFjYwP+fDg2Kuihy3nDl9ZKNPq66A5cBfaZqhtUmPhrEatb0zC41Kwz35VRamvHJnP9RxEs31h0JnwtmBj82oEvWLOLOlJUqMokenRz4NOBCpPyd316nXT+tH1La7sqlMAn2l9uJPxkL6qbxyyePpwqfP4leKJDAmLiQWUPy261M1yBMD2fJf4GzsSx6DyccDivtFCzOlMbpH0RHW1tEnwY5Gh6Wj+Ar7cBskaALpVr4yTRoDHnIBWELoNVf+MC8vjgvfGQmFhXuYBsbjv8fCuCopqXBSpYfm6gETAuMuYb4TbdEPMMpDuEkqhRoaYwFOAj5zWjF7Iibp1hhe3SnHPs1qV7sfghM/obIhYFuR0u7YiEPkvEVBXWcvWB9H+F4T52OOyoocxGIF0KFOn12MSS0x4ZLedAb58H8C7SF550jHvWdKsDtVZe81rikJ2cIcRZ8pvmrudNLpJwBo2fnOCLU4vgAVaKwkAAiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(6916009)(66946007)(26005)(8936002)(66556008)(1076003)(186003)(5660300002)(83380400001)(4326008)(86362001)(8676002)(316002)(2616005)(52116002)(6486002)(36756003)(6666004)(6506007)(2906002)(38100700002)(38350700002)(508600001)(6512007)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?231JdxWwCbiBkyBPb4/BJe2MUEkDvAbh915FgDvJsskz0Jjc1o6Eb2fF9Zvj?=
 =?us-ascii?Q?eE+YYfFeB9BuXv7PNJPTZd5niQS9B3+TMA0oZa+00uc8ke2Ya8ViKNJSlpzH?=
 =?us-ascii?Q?NLGendd7TD2X1OA+9+pChuR1CuyBkJ3mitbuhBoFkdWoLy79dvzP9V+/JBvp?=
 =?us-ascii?Q?YlApC06Vh04LjW+MtaAwKQtIlNMHqQC86llI8NmG1z7OYvP9bTldaZ22/TX8?=
 =?us-ascii?Q?1ZQ9KGd8Sjm2g0O2w78I1r7Gt+EgN8aYicp/kONgG6PuTv85NpXxDqPDmfSw?=
 =?us-ascii?Q?thnK4ddwjIhPF5SCSR0UqVt/ouya4a4rOZds69PtA4gKJyCEaKtn/nMAiCOu?=
 =?us-ascii?Q?IKUdJ/HglBxqDFmP8V43D2pqjjprY2g/VdJXE6g1PWsshctmj+i3xUP/3Um3?=
 =?us-ascii?Q?LVHHMFsbV4ztMpazNtKPhA0yBJzY5IKxKauhtD1ZW2hGQTg7DqBv7R48ULLg?=
 =?us-ascii?Q?BdNgLqMikgO3QWFMq5d2UT8iO0RDNeMOnNSYE0tJ+PcMVBx9eFycxV+v8PRI?=
 =?us-ascii?Q?1N68tPjCCM/kRd6udilD34ZpS9e/FXgTQ4tP2/Gu56kiwuos0u3kDduYc9lQ?=
 =?us-ascii?Q?XkZckNwn/FHznJ1OMoROGPvWPDjwpsmzFPlwCjlNDyf4IzlLaKJKhmfOeqvY?=
 =?us-ascii?Q?d6ibMKm/kumVt7z1zLthu4k2PB5IHCIQFyoGjennOiiaOP8mnyLxODlCEN18?=
 =?us-ascii?Q?0/9aRwzsKIk6e5TC04HJkL2BTvnn69szK7gt8Gwx/KS9S7zdQ/pQkmLm8IjA?=
 =?us-ascii?Q?+v30CO8+QzNblAXfDOZyb/a9rHO1cbAkcFEPi9dDrU5sZo6e0H6505XKhqCn?=
 =?us-ascii?Q?ze9vBb9W1Uok1wLGFbAUmkwPt0TwNjjQYVpZpqanbUZTMzxzNRttmAspxlKy?=
 =?us-ascii?Q?QZD4dgS3t0RoPbc0oPKonlbDBM00g9cX5VmNpPajrWVV0oPBQXz6+7QXgwf8?=
 =?us-ascii?Q?MCqsdKPU40ezK5qczUuu1hGVgg9XUEWmHApoBf2SdG4p63rIzCtZlRWnq1lL?=
 =?us-ascii?Q?RnxhXKvKZ56wLSuzJKypG9YuOasINeTHk6UEOaRY+ofstwWTe8i8Ph45tjVN?=
 =?us-ascii?Q?Nt7S51BqDOOFb7rWjL0M99P5e1ScjTpahN8VDK8EHcDaYl6yFXNJL7SGsEzI?=
 =?us-ascii?Q?WzgmJGtIwHJcu/rxMdDB2GORJxACG3N2brDWYG5mu2riGhsJnS9FyTNdYCOm?=
 =?us-ascii?Q?D1QY8lxkqEFu0BLfbnfqR3A/LOBvYT5NKQr29xIw7XkyrwngsMFaDzH1Tudo?=
 =?us-ascii?Q?YW0fGpb8kxzaEWOHaWvTlSfhrSfEPktaYWW0YzEjlFNzcr9iGatIFnadW4x+?=
 =?us-ascii?Q?MvhMlZcDyMvj2wTEwDELBf63b98kg1qLEZFiO6HNaofNOM9ZqIX5kh4TmCav?=
 =?us-ascii?Q?EyI4k8CHFgVJURSrJPDVIKKBJ73gaqw8R2Ss08VJmuOSIOF5PiYkrfq91RLy?=
 =?us-ascii?Q?xX9RNhc4cRLawhbH512DvAy2d0jvYg5sA+aopliSFivYDhHJMFGYzFXMBp2Y?=
 =?us-ascii?Q?senJdAZRgj9sEgYHCq6Sl1gVBrCgZk6ea2Nt/cjaNIVy2+ksHHy313G6Gr0j?=
 =?us-ascii?Q?lYlII1D4bxeoCFWlo8keeKhFj+Ugs/eLboANoBaw94m/5hsqjBORdDgrDi77?=
 =?us-ascii?Q?dqtDiHh+eZ8fD4z7A6aH0Wu2ixDpr4VF8ZV3k3sAfd8gWMdGgJQvBv5vUXlG?=
 =?us-ascii?Q?i8EdNszhlIqCTXIkq4ZZ/m8BKWw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b86ab1a-5265-4cf4-0a93-08d9f61f041d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 16:18:52.4160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zIj+MAeNElRnpqC/SUwwm69olkhb+CS6kfSNvAhPY9w0zqFljeJIpZS4Jw1RtgXtGtx4mYO7c+dwVYG/+6kHnsNfJvmFc+e/68s03N/REU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2524
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::725
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::725;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

We have too much logic to simply check that bitmaps are of the same
size. Let's just define that hbitmap_merge() and
bdrv_dirty_bitmap_merge_internal() require their argument bitmaps be of
same size, this simplifies things.

Let's look through the callers:

For backup_init_bcs_bitmap() we already assert that merge can't fail.

In bdrv_reclaim_dirty_bitmap_locked() we gracefully handle the error
that can't happen: successor always has same size as its parent, drop
this logic.

In bdrv_merge_dirty_bitmap() we already has assertion and separate
check. Make the check explicit and improve error message.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 include/block/block_int.h |  2 +-
 include/qemu/hbitmap.h    | 15 ++-------------
 block/backup.c            |  6 ++----
 block/dirty-bitmap.c      | 27 +++++++++++----------------
 util/hbitmap.c            | 25 +++++++------------------
 5 files changed, 23 insertions(+), 52 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 27008cfb22..cc40b6363d 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1382,7 +1382,7 @@ void bdrv_set_dirty(BlockDriverState *bs, int64_t offset, int64_t bytes);
 
 void bdrv_clear_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap **out);
 void bdrv_restore_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap *backup);
-bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
+void bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
                                       const BdrvDirtyBitmap *src,
                                       HBitmap **backup, bool lock);
 
diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 5e71b6d6f7..4dc1c6ad14 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -76,20 +76,9 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size);
  *
  * Store result of merging @a and @b into @result.
  * @result is allowed to be equal to @a or @b.
- *
- * Return true if the merge was successful,
- *        false if it was not attempted.
+ * All bitmaps must have same size.
  */
-bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result);
-
-/**
- * hbitmap_can_merge:
- *
- * hbitmap_can_merge(a, b) && hbitmap_can_merge(a, result) is sufficient and
- * necessary for hbitmap_merge will not fail.
- *
- */
-bool hbitmap_can_merge(const HBitmap *a, const HBitmap *b);
+void hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result);
 
 /**
  * hbitmap_empty:
diff --git a/block/backup.c b/block/backup.c
index 21d5983779..fb3d4b0e13 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -228,15 +228,13 @@ out:
 
 static void backup_init_bcs_bitmap(BackupBlockJob *job)
 {
-    bool ret;
     uint64_t estimate;
     BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(job->bcs);
 
     if (job->sync_mode == MIRROR_SYNC_MODE_BITMAP) {
         bdrv_clear_dirty_bitmap(bcs_bitmap, NULL);
-        ret = bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap,
-                                               NULL, true);
-        assert(ret);
+        bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap, NULL,
+                                         true);
     } else if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
         /*
          * We can't hog the coroutine to initialize this thoroughly.
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 94a0276833..99337e72de 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -309,10 +309,7 @@ BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *parent,
         return NULL;
     }
 
-    if (!hbitmap_merge(parent->bitmap, successor->bitmap, parent->bitmap)) {
-        error_setg(errp, "Merging of parent and successor bitmap failed");
-        return NULL;
-    }
+    hbitmap_merge(parent->bitmap, successor->bitmap, parent->bitmap);
 
     parent->disabled = successor->disabled;
     parent->busy = false;
@@ -902,13 +899,15 @@ bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
         goto out;
     }
 
-    if (!hbitmap_can_merge(dest->bitmap, src->bitmap)) {
-        error_setg(errp, "Bitmaps are incompatible and can't be merged");
+    if (bdrv_dirty_bitmap_size(src) != bdrv_dirty_bitmap_size(dest)) {
+        error_setg(errp, "Bitmaps are of different sizes (destination size is %"
+                   PRId64 ", source size is %" PRId64 ") and can't be merged",
+                   bdrv_dirty_bitmap_size(dest), bdrv_dirty_bitmap_size(src));
         goto out;
     }
 
-    ret = bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
-    assert(ret);
+    bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
+    ret = true;
 
 out:
     bdrv_dirty_bitmaps_unlock(dest->bs);
@@ -922,18 +921,16 @@ out:
 /**
  * bdrv_dirty_bitmap_merge_internal: merge src into dest.
  * Does NOT check bitmap permissions; not suitable for use as public API.
+ * @dest, @src and @backup (if not NULL) must have same size.
  *
  * @backup: If provided, make a copy of dest here prior to merge.
  * @lock: If true, lock and unlock bitmaps on the way in/out.
- * returns true if the merge succeeded; false if unattempted.
  */
-bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
+void bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
                                       const BdrvDirtyBitmap *src,
                                       HBitmap **backup,
                                       bool lock)
 {
-    bool ret;
-
     assert(!bdrv_dirty_bitmap_readonly(dest));
     assert(!bdrv_dirty_bitmap_inconsistent(dest));
     assert(!bdrv_dirty_bitmap_inconsistent(src));
@@ -948,9 +945,9 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
     if (backup) {
         *backup = dest->bitmap;
         dest->bitmap = hbitmap_alloc(dest->size, hbitmap_granularity(*backup));
-        ret = hbitmap_merge(*backup, src->bitmap, dest->bitmap);
+        hbitmap_merge(*backup, src->bitmap, dest->bitmap);
     } else {
-        ret = hbitmap_merge(dest->bitmap, src->bitmap, dest->bitmap);
+        hbitmap_merge(dest->bitmap, src->bitmap, dest->bitmap);
     }
 
     if (lock) {
@@ -959,6 +956,4 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
             bdrv_dirty_bitmaps_unlock(src->bs);
         }
     }
-
-    return ret;
 }
diff --git a/util/hbitmap.c b/util/hbitmap.c
index 305b894a63..d0aaf205ed 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -840,11 +840,6 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size)
     }
 }
 
-bool hbitmap_can_merge(const HBitmap *a, const HBitmap *b)
-{
-    return (a->orig_size == b->orig_size);
-}
-
 /**
  * hbitmap_sparse_merge: performs dst = dst | src
  * works with differing granularities.
@@ -868,28 +863,24 @@ static void hbitmap_sparse_merge(HBitmap *dst, const HBitmap *src)
  * Given HBitmaps A and B, let R := A (BITOR) B.
  * Bitmaps A and B will not be modified,
  *     except when bitmap R is an alias of A or B.
- *
- * @return true if the merge was successful,
- *         false if it was not attempted.
+ * Bitmaps must have same size.
  */
-bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
+void hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
 {
     int i;
     uint64_t j;
 
-    if (!hbitmap_can_merge(a, b) || !hbitmap_can_merge(a, result)) {
-        return false;
-    }
-    assert(hbitmap_can_merge(b, result));
+    assert(a->orig_size == result->orig_size);
+    assert(b->orig_size == result->orig_size);
 
     if ((!hbitmap_count(a) && result == b) ||
         (!hbitmap_count(b) && result == a)) {
-        return true;
+        return;
     }
 
     if (!hbitmap_count(a) && !hbitmap_count(b)) {
         hbitmap_reset_all(result);
-        return true;
+        return;
     }
 
     if (a->granularity != b->granularity) {
@@ -902,7 +893,7 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
         if (b != result) {
             hbitmap_sparse_merge(result, b);
         }
-        return true;
+        return;
     }
 
     /* This merge is O(size), as BITS_PER_LONG and HBITMAP_LEVELS are constant.
@@ -918,8 +909,6 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
 
     /* Recompute the dirty count */
     result->count = hb_count_between(result, 0, result->size - 1);
-
-    return true;
 }
 
 char *hbitmap_sha256(const HBitmap *bitmap, Error **errp)
-- 
2.31.1


