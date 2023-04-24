Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DE06EC947
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:45:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsje-00041D-CZ; Mon, 24 Apr 2023 05:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsjN-0003vb-0y; Mon, 24 Apr 2023 05:43:38 -0400
Received: from mail-db8eur05on20723.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::723]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsjK-0001KL-Sf; Mon, 24 Apr 2023 05:43:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JY+tVdmbeNoXm0a7diQDxgmAc4X418qC3sol7wAYZ0fHg/VKmr5XuI5h/ZQ1NK9o6iMlOcrhHpetkGaJs4jOg+tdPwOTr3gcpXF71ulyLfXAyRM/A1iMb/nfsIr+HKrMDv/CPEJD924fe6TFTp1XOXWiLThk2vkvbdzmFClewNQC4iwqHkLTXPRKQMmtwQf/gXwKpYEEX61AsYxV+bYsFnkK6shcW9MKykFX7mePUXW7AjV+Jg1eoVuZUWqUNt//szVkdqVJURAnmAY1tdUs19T9afdVWCv/y2gIF4GsxssjbpCk7GTsJSjIIgIQdoyH9lkHgMuk/cme60JtxxnoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvjgCXeWxk0xp5Byzd2O9mNaLa86cq3CK18VjqIBo+w=;
 b=gL6u89Zz09IClkKjFkDnr31dfKL7LDKZTey8dP/WQlAeDnTNv/t+Il5UJn943kkVEzXSCQnSGn/BrI1DjTwmTWiUKjmQgjh4OJ8q1OsQG5ghPzKrFSxf8ntA1+Y1nM/LlZ3PHYrIPZOzVFdnCzaSkb/dQCdR31aH95NSPGkOvOaE2sz8W+/aqmLmnjbtH9BJSn5OtG8Vc7ztR/YcpPa1M2IQIV85KTs3PJazCBGDwOoMEB2zErH0MTs7H/B2Vc+CZW/3SH8HJ5Sul/vnva1SjgGwsAQpKdTxatiSNKQx38i1w4nr1huveUQlmLqtNcztydphiqKjzo4UtFU08JYIZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvjgCXeWxk0xp5Byzd2O9mNaLa86cq3CK18VjqIBo+w=;
 b=MPWzuuIZs2tKHJJ4ZCuFsnDKNEVGt+U/7A9nbgPM7iSemFgDZkOTMDytAo/6KDEfMSG5N++O5WesmzAHXCJMyt7lGYSnTCGWcNYRcBEZIGHniNG9ayB++kT9RKB2bqCbuiklmOIVR+atAVhlrvWNiFBKjwqStL9KC3vFwDGsFMv9IQ3TiLek1o01pWLKLeMKmwtijdUOyMm5PpHi0angi/XsbOxCfpofeDBM/HnUIXwreu1ccwc1QRWnnrlR9F1k7g9AOy5bDvKD+PJg72+LlriMt1VfWmoRe5eNuBwaffNRQ4UWWwpB2XvB/rYgdnX0R2gGPiUARIEIn0xTX6MAlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB6188.eurprd08.prod.outlook.com (2603:10a6:10:1f6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:43:23 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:43:23 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v4 3/5] parallels: Add checking and repairing duplicate
 offsets in BAT
Date: Mon, 24 Apr 2023 11:43:07 +0200
Message-Id: <20230424094309.197969-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
References: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0247.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBBPR08MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: 8021f51a-8796-4aa6-4986-08db44a85868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cQy4smkv+G3PfohNhvIk73bz03AhtWCHKsKxaz4vxXaBa5pjJSWsb6Jzui3NwUm1QirDjY1b/h8Ry6qjok9JIYqUCQz2G5GFs5m+dSor8w576WxcKug4gyBG8HltcZgHgPTFBW6CqcMOIyaza2Woj3BrrpRKy5eDctpkdc/fl6Im/K+7VuosShT/ecd8QJowYegKr5zQV4e+zs076iD1nN7jtmccWNDXx4bvu+hHPJuhkKxW7Zpl+SEqZpBWsGtzoqkk5CsK43+B3gkjQ2WcgRDEfY5uRKSLgRUNXaHCnHeC2kLTv6pdmnxWZiWb+xwi56cF1fhT0/OQpYK5F8sbAJhOYDkIZAwKHeLBrot63nYlFTFWa0SguqjxBn3r4yVZpuGLy1dKCrufLpAkYETmWCDaT2H7SPnmI41fAnfAinF+8hd3keqT/2+ZD2GWbH9gq2LDo1pXvmRqGt56Qji6I7Ku69jqzrS5xdJxy9vvthTnkgeNOAWWKLcp6y3UQPNZDShEc8HZNW6amzyhE3UxgZEdrhciLt3tMq+shTudMi4UIb1GLMDnw1RtCrHnaYrN25puJh/eTSK1UZudaP3QIcJxoKzTCA2EHvz+/xY3RrBjJ/rV86yWlZAv4txSge3x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39850400004)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(44832011)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(6512007)(26005)(186003)(1076003)(38100700002)(38350700002)(478600001)(52116002)(6486002)(6666004)(83380400001)(2616005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zCE3MAlTEPWNwYbfSpa9tuUaqoT5VXdttHsEvooJG3aHlovJ58rJAb8avNCO?=
 =?us-ascii?Q?l50I5mZ4YlqcXec2+k6eT6ReYBWceWJ8BFfCMvh93tljdmHivgct3FRWyI3U?=
 =?us-ascii?Q?omR2eae73T9bB65mKhoTFfTnTtqgKoxaNEWGc6NY09NO+M+k06Qjtzsfod3E?=
 =?us-ascii?Q?zBolr1bGbYLDJHRIZWLOJ7/9oC1LF4aIm24Qnfy8ZYn+XFCCVLXeWCv0avqm?=
 =?us-ascii?Q?pwp0vD+h6y8h0cnlbbEU9G2IF6kAB0PVM2kx5MV3Oiv1b0ux48mQIQVaSeXZ?=
 =?us-ascii?Q?GhZIu55j1i59dbq39lMUKQoCePwLyPv/7zZuHMmWkp2gHFnZQKimYgMHI5Uq?=
 =?us-ascii?Q?8KdwdachyghcOwMwqf+FaQAjJTzumi363yzjoJ1lO1mGIgf+TNMt9qU6kXBk?=
 =?us-ascii?Q?JacSQwxLp9ScwV1cfolXsTUkt6F64BblLqz7rqVqUlQ0T9SFW6iuREOSjc0h?=
 =?us-ascii?Q?l8TZJ5knDOINUPA5O1an8amB42ivuN6tEwHF3B6LaYCZgKaM3kBQXnn7Vj4A?=
 =?us-ascii?Q?dFZgV204CeGCt74R9DJTDy19Ka/6NI0OEtr9Wx3F/ba4ghi5lRN+MQN4HLjc?=
 =?us-ascii?Q?8VaMQRNLtHz2i6Fa3PSTCL0ztHMkfH5aByB9mUbtRrsSOMRj3TGyOcKvFc05?=
 =?us-ascii?Q?hN9TX6Tm1B84BISthl6BbNgj1chnhaQVJ2Y2tB2rLLVO2YUyfefeIPW/hxLK?=
 =?us-ascii?Q?B71vHFIEL013RUUESv9k04gnWWOLRT5iOtSAWztH/xKUeRrKyqLxU1Jutvga?=
 =?us-ascii?Q?cFuddj7pNjv91bLY/Z2ZNdJY1K8dxQXR2jBowYOfLugx37uMB2JKRwcwpi/1?=
 =?us-ascii?Q?UoJCmAqOpsgXY6noMa/Ogmjg7Xei4gbBPybpVRzKPPsE9mpqoSkXgC30ev4R?=
 =?us-ascii?Q?fdtznarDrEZzlHzNLqyhZTKKrApJAsnDRHP9c8pNW6nXtFsrhio4Vxx7X/7K?=
 =?us-ascii?Q?ExcKNx6pS95RwH0+vG3G8RzVeuHBVLCBQXoJzdo/0CX5ID2dChBG9tbz0EdN?=
 =?us-ascii?Q?VnRji+dYVbBbI/Isl+fzd6N3gGRTXrGauQm0mG+pB8wsU+wSv+RZtaLeFwo3?=
 =?us-ascii?Q?C7+Rr7gr4aZ4rcr/+T0hPRbEbaC1AIJ1S0TRbZXClXR+AXV1UxSiTtC/EhLU?=
 =?us-ascii?Q?Q1EkVHmXQDPd1Ms9Wv3jjUUZHmX0QXB2Ypm0PzozpoRj3+yTVWA6dIN7b+ES?=
 =?us-ascii?Q?ttH3pRyvQpPZ3V83sAqOpYEgQNVNMSMx+I5+cHe1gPLBye6B+KXV0i4E9N4V?=
 =?us-ascii?Q?MtAGxKqJORWlMZogYv1Wm6fQEuZvKUsRueT6+aAKFCy8p/BXBAZT7X0JCJIO?=
 =?us-ascii?Q?Up9iafZ1dGi5sfHtwsFa84zSANT0zcy9xfx5/cibtStD6t2FuKdsP+eNwNAi?=
 =?us-ascii?Q?P/CSLiNpjF0qQcdf/GoxdDHuCTmq7LOoHzSuIB2oZC9K0GnhRRtV2XMFxh6Y?=
 =?us-ascii?Q?VCt6Pfn3noI4uCubzp0nOKgVxCYWJWz1UxrK8mfFrFyLp43J5faxkM4gaaEh?=
 =?us-ascii?Q?vPEJSzrvWRqVUjFe/AT2mg8djOzt1rZrr7rRVrzgC/HY8jYWt3cw92pBJuLN?=
 =?us-ascii?Q?UtKANg5AQy7p73FO6F7KAY6X6i8VWVfQNmZkIKSogCVqtx/mgzagyZakEaV6?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8021f51a-8796-4aa6-4986-08db44a85868
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:43:23.2722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntSkiiPpQrm5pBEXZoZbz3nuKaFeYiEQkb/zKqg4/T+orJ2G3p85KedOIUvQOt/cWiiNqT31B05Yed820CQWaI2roZfdb49Yaw1OxYlrtVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6188
Received-SPF: pass client-ip=2a01:111:f400:7e1a::723;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add host_cluster_index() helper to deduplicate the code.

Move parallels_fix_leak() call to parallels_co_check() to fix both types
of leak: real corruption and a leak produced by allocate_clusters()
during deduplication.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 134 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 129 insertions(+), 5 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index ec89ed894b..3b992e8173 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -136,6 +136,12 @@ static int cluster_remainder(BDRVParallelsState *s, int64_t sector_num,
     return MIN(nb_sectors, ret);
 }
 
+static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
+{
+    off -= s->header->data_off << BDRV_SECTOR_BITS;
+    return off / s->cluster_size;
+}
+
 static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
                             int nb_sectors, int *pnum)
 {
@@ -533,7 +539,6 @@ parallels_check_leak(BlockDriverState *bs, BdrvCheckResult *res,
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t count, leak_size;
-    int ret;
 
     leak_size = parallels_get_leak_size(bs, res);
     if (leak_size < 0) {
@@ -550,16 +555,123 @@ parallels_check_leak(BlockDriverState *bs, BdrvCheckResult *res,
             fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
 
     if (fix & BDRV_FIX_LEAKS) {
-        ret = parallels_fix_leak(bs, res);
-        if (ret < 0) {
-            return ret;
-        }
         res->leaks_fixed += count;
     }
 
     return 0;
 }
 
+static int parallels_check_duplicate(BlockDriverState *bs,
+                                     BdrvCheckResult *res,
+                                     BdrvCheckMode *fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    QEMUIOVector qiov;
+    int64_t off, sector;
+    unsigned long *bitmap;
+    uint32_t i, bitmap_size, cluster_index;
+    int n, ret = 0;
+    uint64_t *buf = NULL;
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
+    bitmap_size = host_cluster_index(s, res->image_end_offset);
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
+
+                ret = bdrv_co_pwritev(bs->file, off, s->cluster_size, &qiov, 0);
+                if (ret < 0) {
+                    res->check_errors++;
+                    goto out;
+                }
+
+                if (off + s->cluster_size > res->image_end_offset) {
+                    res->image_end_offset = off + s->cluster_size;
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
@@ -611,7 +723,19 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
             return ret;
         }
 
+        ret = parallels_check_duplicate(bs, res, &fix);
+        if (ret < 0) {
+            return ret;
+        }
+
         parallels_collect_statistics(bs, res, fix);
+
+        if (fix & BDRV_FIX_LEAKS) {
+            ret = parallels_fix_leak(bs, res);
+            if (ret < 0) {
+                return ret;
+            }
+        }
     }
 
     ret = bdrv_co_flush(bs);
-- 
2.34.1


