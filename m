Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DCC667901
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:22:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFz5n-0003vC-FP; Thu, 12 Jan 2023 10:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pFz5k-0003t1-7M; Thu, 12 Jan 2023 10:02:08 -0500
Received: from mail-dbaeur03on2097.outbound.protection.outlook.com
 ([40.107.104.97] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pFz5i-0007HH-Fg; Thu, 12 Jan 2023 10:02:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFRvqA5ECMwfBIOPi4c9nLn059NrqJxCMbMS46yxkra+ag6DxiZZXbK64OACi/wiab3VnAskF5/njiBOUkOmxwqx/w4X/hBzeMwyrZgH0uJiXziRkHaxUZ6tcQ8V+RiDPjKylga+PGQ69Qoff/DtBUavKkqOoyXHDfpBM9cXYSmjvpH0497gCwpsy7LCbJF0DjIC6GDd6tMU5Ta88kyQkj7oQTDg1ODljj8lLeCtrec5JZlMRomS0CU9mfqidZ/YSISQxswRsa3sBGML0HeUfCGKpgQcv3+qdceQU8DVCNdD7q/5f00zs8pYoCRZFJtoZS4sJ288E54KkWGMUi7ttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhoORh7ti4lTDwYzrwFh/n7lu5rIYvylTFxJRVwbNrY=;
 b=BYLUbay8T2NljPwCEQqrsgvyTYa65olJdfW+GafCip1k1Zz1jzptYs3xhvwsohEp2UIQ3N91vRCcA+KA3ZHSKdRVspWMMwCR3Rz4le6NX0JUvG1JbfW5MjhsVvOOAeBPMT3uX9aAiqqr35o4zaCpgNu/YgbJk9Qq4Kx12qV/w9ZeR4Q20nAOTjl8rD6acTXFOoMlfUWVNhEcTQkGmxcrh0AAxMoelHxB9FMzHo244LKXQ1U5M/84y6kYSE+XkS2RrLWNTKAjMSodrF7W0yk+7sV9ffcgqKQugKsBc5KSQbufvCC+6q2K2/xV8ICvpr4awAbO+jIwQwmYMYD2tbHm2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhoORh7ti4lTDwYzrwFh/n7lu5rIYvylTFxJRVwbNrY=;
 b=z/HQcvvuwB/yFpda2JquF+PPIgWnpwHnekZ+/bCZ48PfqEgfoV6I1WB8dvF3vhMtmoarZS7UeaUKcwNmG65jfBPK0TcNTg4zuwE18lir2goIFL/X++vowOCSWVh7gXJ1P0tRTQYbEIRSW5SizgZjYkmI0lRmv1deJyFY95IzqaFI1w5cK/vp+24udvfghfXUyDHxdiCLRizSEEqjJauF8/pX/cZCbHuTHCioWa+XzEeWb1fVOW8QyO6mIdWALceap9Gg7ZOXQqWeAOi3YCbrjFr+/5SO1xjpk56Fh9Es5vXjLjYsEGTLd3MtUy9e7pzYUiqPwAlHpWdmvWJu8dAZsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9250.eurprd08.prod.outlook.com (2603:10a6:10:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 15:01:58 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 15:01:58 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 3/5] parallels: Add checking and repairing duplicate
 offsets in BAT
Date: Thu, 12 Jan 2023 16:01:47 +0100
Message-Id: <20230112150149.1452033-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
References: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0701CA0035.eurprd07.prod.outlook.com
 (2603:10a6:800:90::21) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: 363059f1-087b-46e1-135b-08daf4adf3da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kc3oIiS2RkGMHwhbdKo+XWmi9/pEh1JfYvU/fyYSyxW/6DzvQ0Lsl//CM0n/ExpmOYf+ZXkaaW2Y+dp5mqiWOIeXa21lA7YO9MX9zBzfjZ1Y6MzZo3ARkJFzrymU62pXcR0sZi4ZE0o95ZLsqwnzBHYMQcU2M2VbFa3KcjYDN3Fz17oZuMLJAm100PHaKhUVFQ/NKR7XE4NuN+I+szUd11QpGF+wYR2xGvmv4ODAYX5EWs9Qc8QZunPPSCUCe8Q2ix3jMYuGsDcJfK+LlLgbFlrsXhP91SXNOoXNzZEctmIyZDG//5i4c98bfP71ujS/MUuIxY4YLEsd1DyQN4QM4VfDcGWMEWzEuTlJPvWVNAvINlc+gokPDefkM77uAL0lcYlqGWI8TGEj2Kq3pll/I4wyWIFQ3qbkH8ZsQrWq0PVXu7tuTMCuuercmlykvHKanLABP29CUeJ3jV0UBJnRBpJuQ+pS7tlXEK8e9DDO978TVijCa/t86odF96nuUrBPjOQj7XOKtuNEOwur6cPxGAHVmlQHcnRggRDj54yUR8kI3YrgaKOrc/Zk2+4NCj6dbKWQh77LWCGo/ErQVMrjhxTR8qGVbDA+3HaWk48AISCmprxIW1aw7YF5AxMStBHkT22U/seu6lGp8j/mTErLz3bJNaOnRCf3eAfwXkQb71n28z7973to5sgCx4mz9AxLkftze9REAY6Hou2HNpXOqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(451199015)(36756003)(5660300002)(86362001)(6486002)(316002)(6506007)(52116002)(6916009)(44832011)(2906002)(6666004)(478600001)(66946007)(66476007)(66556008)(8676002)(41300700001)(4326008)(8936002)(38100700002)(6512007)(38350700002)(2616005)(1076003)(26005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?52zrh+6bs6yBTPqh3K5bAr9RF6C4rgbpuJO7KHRUudRY3I+yHKRoKLyVWePT?=
 =?us-ascii?Q?MGhvUPgAYrUpWeUg7tE7tVWF5gw/vIYQeKyUs4MweFdFjOhROmtCTHJc8uxA?=
 =?us-ascii?Q?a1n4qJWbyBxvTVqxXX7B3XPcobMW01QBvxgXrqZ8VB4ajDQcNM/ud+QxLK8/?=
 =?us-ascii?Q?h+vtakp2gzIG9OO414ro7G2AsaNIXPfEmvT7f5vBv7Dy1+KKLuDSfh6FtREv?=
 =?us-ascii?Q?u+wmbO4MlkOoae8qHfXpDarUARoF9wUwBLTA+1ZqzM+9KVk2Z2NA5y+JBT/j?=
 =?us-ascii?Q?pNjtqtyrUgjQseqJGLZenIqsriwMfFrklVvEGH8BcMwbep2JuHYgeODTvpbH?=
 =?us-ascii?Q?Z2n8vi2oWRWONocakfH69D+m3HssbywoTROB+pg/xMdDDA2+knZWqxqkAsln?=
 =?us-ascii?Q?bv6PTJegcnEXukszIEB0M+es7N4zTz8lBCxsmKLSa8GklIzPyX4ulVDtA0NE?=
 =?us-ascii?Q?1Pv/QVh1conOWs/4r+rP2SOs0FSmP3Bj8Cm9I70LSP2xtONvlZ7O9ZHlgoZ8?=
 =?us-ascii?Q?FOZNt7S4hCbQo0uoX2dhiEyGTp/x9aRaSKMAUBb32VHKThsuc3LnRHe14G+G?=
 =?us-ascii?Q?Vdl+1cLY2tJ0ee8/FGUyrY+siYSj0ZEE0jbphTiORPAQOXCobmbYmnP8QZL/?=
 =?us-ascii?Q?90qpiJoPr+p30RzNfPDpWCKVj1DVqGbLw2Fod4vkja8nljUXwQLmtraqZtZW?=
 =?us-ascii?Q?ZtdCxOJcAEz/aRYojKhQlzQx4ZrtyeG8WqHMhOm/kgE7JcpT8dOsg8/U4iTE?=
 =?us-ascii?Q?2cwSr5Ry1X5YDRnt5P/5UKOSXoPr5wPH/cciFTs8Mm8d4d5dHQssGG/kujN2?=
 =?us-ascii?Q?ZoInCAYtamDIk/i4Ka1sRsksV0KElZWGDBp2crL8Vht92/Uq6JfTHfrMYmRU?=
 =?us-ascii?Q?VL+GsnfhfLGt+3mty0SYdfajtt8/Gn1oNJL+bfr0jdB+NIhgOmpKqZk/PbvC?=
 =?us-ascii?Q?2BgLkt0nUyIBQZeIpGX1ZG6H8ZonFSKH4kZlH9GsInaVF1Snp1YD81RmK/TF?=
 =?us-ascii?Q?U833NPah7fgNQv0WA24PCpld7uuU4nS5sJgTqpVKn6k8KVqJ+IssWIK5P40C?=
 =?us-ascii?Q?Qx8sr61PrQ3rPPaXS6QtMK4AG6zUsCMy0HLzwibHidIPf900yc6orgxf/hOE?=
 =?us-ascii?Q?hQKjJrVTWEpe6d/AiS6PbagPfXr2AGsSCABstACkPMhTBbjHr4t49bQxLPl1?=
 =?us-ascii?Q?GPWULgiXlQUsayBGcjNchUludv8YIKtHGITEJhMkGbOZcMV+Ton2fAxjZxI6?=
 =?us-ascii?Q?REvOyadyODNJRbd5OzcXtlY9q0n2Kpq85WBV712tdOd633zfgPAXc8k/zG3b?=
 =?us-ascii?Q?fzFR8lD3lcJLCFMNhEiA7DDdoYsU2ItuBP9rEJ7WRVAHg7rUJkr2CezAmJTE?=
 =?us-ascii?Q?4aaUfZQbvctN8CazjE8cN7Dbcpb2YgfoOVQfV6CkrLTTfZXfJhkON+Epn9fw?=
 =?us-ascii?Q?A+x/1PQSHs4gKonUlbrShkM7W0R/wWp4pwuIAYkqs8aAij0s4W0KNRET7qIh?=
 =?us-ascii?Q?lurryty+aGaCfJEiYmPib7vsz4loy/X8u3lbda3e+Fvmq5fccgy8xG086jTl?=
 =?us-ascii?Q?6fSu8rMyyAiSS3ReNzFAQWYEfEDu16OtW2TzauOvwpCXIgRysBBbmUUo2bPW?=
 =?us-ascii?Q?Ta+d0YJeHyV6gEjiTvgnwos=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363059f1-087b-46e1-135b-08daf4adf3da
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 15:01:58.5739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCgwCz4UowatdSZE7kqvo7qt2nbZuzf+89mxrTzUiCs3whMid6PFrTyP+ogeu3DYrXg9NNg9I5TYsEc8wjL+HgPI0BtRdAx3Y8l5305hDuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9250
Received-SPF: pass client-ip=40.107.104.97;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Cluster offsets must be unique among all the BAT entries. Find duplicate
offsets in the BAT and fix it by copying the content of the relevant
cluster to a newly allocated cluster and set the new cluster offset to the
duplicated entry.

Add host_cluster_index() and highest_offset() helpers to deduplicate the
code.

Move parallels_fix_leak() call to parallels_co_check() to fix both types
of leak: real corruption and a leak produced by allocate_clusters()
during deduplication.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 168 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 151 insertions(+), 17 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index da1e75096c..73e992875a 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -136,6 +136,26 @@ static int cluster_remainder(BDRVParallelsState *s, int64_t sector_num,
     return MIN(nb_sectors, ret);
 }
 
+static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
+{
+    off -= s->header->data_off << BDRV_SECTOR_BITS;
+    return off / s->cluster_size;
+}
+
+static int64_t highest_offset(BDRVParallelsState *s)
+{
+    int64_t off, high_off = 0;
+    int i;
+
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off > high_off) {
+            high_off = off;
+        }
+    }
+    return high_off;
+}
+
 static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
                             int nb_sectors, int *pnum)
 {
@@ -518,17 +538,9 @@ static int parallels_check_leak(BlockDriverState *bs,
                                 BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t off, high_off, count, leak_size;
-    uint32_t i;
-    int ret;
+    int64_t high_off, count, leak_size;
 
-    high_off = 0;
-    for (i = 0; i < s->bat_size; i++) {
-        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off > high_off) {
-            high_off = off;
-        }
-    }
+    high_off = highest_offset(s);
 
     res->image_end_offset = high_off + s->cluster_size;
 
@@ -541,13 +553,6 @@ static int parallels_check_leak(BlockDriverState *bs,
         return 0;
     }
 
-    if (fix & BDRV_FIX_LEAKS) {
-        ret = parallels_fix_leak(bs, res);
-        if (ret < 0) {
-            return ret;
-        }
-    }
-
     count = DIV_ROUND_UP(leak_size, s->cluster_size);
     fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
             fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
@@ -560,6 +565,122 @@ static int parallels_check_leak(BlockDriverState *bs,
     return 0;
 }
 
+static int parallels_check_duplicate(BlockDriverState *bs,
+                                     BdrvCheckResult *res,
+                                     BdrvCheckMode *fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    QEMUIOVector qiov;
+    int64_t off, high_off, sector;
+    unsigned long *bitmap;
+    uint32_t i, bitmap_size, cluster_index;
+    int n, ret = 0;
+    uint64_t *buf = NULL;
+
+    high_off = highest_offset(s);
+    if (high_off == 0) {
+        return 0;
+    }
+
+    /*
+     * Create a bitmap of used clusters.
+     * If a bit is set, there is a BAT entry pointing to this cluster.
+     * Loop through the BAT entries, check bits relevant to an entry offset.
+     * If bit is set, this entry is duplicated. Otherwise set the bit.
+     *
+     * We shouldn't worry about newly allocated clusters outside the image
+     * because they are created higher then any existing cluster pointed by
+     * a BAT entry.
+     */
+    bitmap_size = host_cluster_index(s, high_off) + 1;
+    bitmap = bitmap_new(bitmap_size);
+
+    buf = qemu_memalign(4096, s->cluster_size);
+    qemu_iovec_init(&qiov, 0);
+    qemu_iovec_add(&qiov, buf, s->cluster_size);
+
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off == 0) {
+            continue;
+        }
+
+        cluster_index = host_cluster_index(s, off);
+        if (test_bit(cluster_index, bitmap)) {
+            /* this cluster duplicates another one */
+            fprintf(stderr,
+                    "%s duplicate offset in BAT entry %u\n",
+                    *fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+
+            res->corruptions++;
+
+            if (*fix & BDRV_FIX_ERRORS) {
+                /*
+                 * Reset the entry and allocate a new cluster
+                 * for the relevant guest offset. In this way we let
+                 * the lower layer to place the new cluster properly.
+                 * Copy the original cluster to the allocated one.
+                 */
+                parallels_set_bat_entry(s, i, 0);
+
+                ret = bdrv_co_pread(bs->file, off, s->cluster_size, buf, 0);
+                if (ret < 0) {
+                    res->check_errors++;
+                    goto out;
+                }
+
+                sector = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
+                sector = allocate_clusters(bs, sector, s->tracks, &n);
+                if (sector < 0) {
+                    res->check_errors++;
+                    ret = sector;
+                    goto out;
+                }
+                off = sector << BDRV_SECTOR_BITS;
+                if (off > high_off) {
+                    high_off = off;
+                }
+
+                ret = bdrv_co_pwritev(bs->file, off, s->cluster_size, &qiov, 0);
+                if (ret < 0) {
+                    res->check_errors++;
+                    goto out;
+                }
+
+                /*
+                 * In the future allocate_cluster() will reuse holed offsets
+                 * inside the image. Keep the used clusters bitmap content
+                 * consistent for the new allocated clusters too.
+                 *
+                 * Note, clusters allocated outside the current image are not
+                 * considered, and the bitmap size doesn't change.
+                 */
+                cluster_index = host_cluster_index(s, off);
+                if (cluster_index < bitmap_size) {
+                    bitmap_set(bitmap, cluster_index, 1);
+                }
+
+                /*
+                 * When new clusters are allocated, file size increases by
+                 * 128 Mb blocks. We need to truncate the file to the right
+                 * size. Let the leak fix code make its job.
+                 */
+                *fix |= BDRV_FIX_LEAKS;
+                res->corruptions_fixed++;
+            }
+            res->image_end_offset = high_off + s->cluster_size;
+        } else {
+            bitmap_set(bitmap, cluster_index, 1);
+        }
+    }
+
+out:
+    qemu_iovec_destroy(&qiov);
+    g_free(buf);
+    g_free(bitmap);
+    return ret;
+}
+
 static void parallels_collect_statistics(BlockDriverState *bs,
                                          BdrvCheckResult *res,
                                          BdrvCheckMode fix)
@@ -608,7 +729,20 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             return ret;
         }
 
+        ret = parallels_check_duplicate(bs, res, &fix);
+        if (ret < 0) {
+            return ret;
+        }
+
         parallels_collect_statistics(bs, res, fix);
+
+        if (fix & BDRV_FIX_LEAKS &&
+            (res->corruptions_fixed || res->leaks_fixed)) {
+            ret = parallels_fix_leak(bs, res);
+            if (ret < 0) {
+                return ret;
+            }
+        }
     }
 
     ret = bdrv_co_flush(bs);
-- 
2.34.1


