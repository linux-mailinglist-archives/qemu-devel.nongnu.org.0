Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911F05AAAC5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 11:00:44 +0200 (CEST)
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU2Xb-0006hK-Li
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 05:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2QZ-0000Rz-Te; Fri, 02 Sep 2022 04:53:27 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:3043 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2QX-0006SC-4o; Fri, 02 Sep 2022 04:53:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFE9QuwL/RcBxqul/LoOxevXkl0NnelmUDokyv21ZAbzXODudzzPpFHd0OGIc2WYwfzYIKYxt388sDVlkeMdwmsF4YK70LxfoT61Avsip7TNNoSuNIyqmg15bbVe92+ZEiNrSMFT0IMIp51zvFZcUH69il0VZJN+h7v6O+IjWYQCt0tJ2Ur1P+GAr62C7i32tz2Uy4SzNObEggEuubrDpYwS/BAtHBJuPqMxcMZbOC/QEM6UWRksihaDLCz3HhdS825t+HIiOLJZ3p0YmK2JjgpKq8Vr7nO0MmyX0564nqpE2pOhysVW31KHablwu01fZ38xSRWcfmu0XASpRjCg0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ub42rWEP0BN3npn+Why/3X7LoHQWveut1Om9M6a7oWg=;
 b=buYKF6frXIuJQgsRN02h9RrXFxsBwkSRPB2vQvS++nlfjhWT2YkA22qvUCNh6aK0KA7kxBF4xV67Rm9QmGXuWLfN/AscxhTk2ob6/FecVUssgjydXUhit/vDQGR7wSl1Dlm+jsBmQkG6bkV5en9/WN8W7fR0+MTvnk/oP0HcbBPM914sFTqhpVGbR6D4h9dcVSW8VNXFZ6E+X0vnrWhBz5P08R7NEFMBR3aHjOpQY355/CigmdmgiV6rJNdmDp1MW104R93YG+zFiSs1IVqhGEGzyK5fsJAz8Ytq+hhSQx2/f1KkNsEuJObLUIpPGveo0FCOkZGqNdr7obesg83rQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ub42rWEP0BN3npn+Why/3X7LoHQWveut1Om9M6a7oWg=;
 b=qOhohB5Zu02HGijFa0vOENANt3MbRVqxyOmKBFqm/ne9J4ZlGEB2777uC32/U878i4XbRHYJVWOgw3owGOMbx5MdUm9Ol1RsmBJq1ipmkZTvDVXhR5VM9533/rTNrEP8ykhAcrYb/nCQ9SicAwv3MWRrC+83znKqmVcCcH5thEXSllyJMgery57lhZN7RyK8k0Vs4QKliI/zQOxliinhmSEtxg4xVwSU6TWYH1dEXAP0cOZ3x7g+YAkZHOF/QJ8vx9++W40XriDuHFXIoBFhVdlbwHZkjcqrWlejkorC4MKNXHIA+IABREfmBXgLhKVbzAdtqfOcs3np/8WA29eq0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB5619.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 08:53:10 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 08:53:10 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 3/6] parallels: Add checking and repairing duplicate offsets
 in BAT
Date: Fri,  2 Sep 2022 10:52:57 +0200
Message-Id: <20220902085300.508078-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15f837ad-a08a-426d-c4f6-08da8cc09013
X-MS-TrafficTypeDiagnostic: AM8PR08MB5619:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h5l01JDBPQLCOy+8N5jLTZBXBeO4UG89CjZgDKFX6aDN201voF1X7B6dtrmh4Hzm0bjy6XEXogsdYh9P844rnYFa2d8NFtGLOVP4uTK8yPvxqMfzDvjBALEf32S96meiLNTxq77KrrL3UandKG2iUnpbzR4ACd33E+tIqkJUDXg3ZdpGCrNaJCOZOay8jyDUTAahEAmycl057mDyRzN4qm+COXXN+H69UtQtbSgaQ0dCiQ7SRuyFdPtlL0Lavw/QTKTkfy8molUTBPodHCmOVoFBmpCbeKhmyG5XUd3tl1bZ+ZAG/iAms1tPjRJpuEmUfS9U6WsyCDtVJn80MGPJVOf+JavCYZXl3KTxOTn0YAUIKm4znEdO9HvHC6AcFYu/X098UCUNH6wjzOB+f/nNO/wpSPh5Pp5I8PAkOl2yi+C+TYnUHT3HZ1CCI4x23BAYIhffR3GdUr1we09bU0yRX0PFy9Lgr4pFd8O/i2PMCuJfWF1pr9bXz8lKJZcsbjhWjdIdL9c3hTdfqOFWM0R7iI80hcAGi9koXgrKefmlh/r6/T0lMIeexZJqLkbDEGFPnS4t0RUs/rnwZXlfmbCzhhQEzZhCfadiJJ6YnX15U/JlURB6j7XhIB/HQ/IlqlZFGTV5zgmrOIng+I3b5470RRz/uVC7PuYvh8Q3coqyeR2xItvLKHfZGsqwyTuQ6/c0vVWVz+vtQLFEhoJ3TLHCVtLG7ca7yW3HqZ4dw/CsACCqhRejpE1jROcHRbv90WE0VFSIGx8nbmgivsc4/JyvIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(366004)(39850400004)(8936002)(6916009)(8676002)(86362001)(66556008)(66476007)(4326008)(66946007)(316002)(6512007)(26005)(2616005)(83380400001)(1076003)(186003)(478600001)(6486002)(6506007)(52116002)(6666004)(38350700002)(41300700001)(38100700002)(36756003)(44832011)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QHEIIivX5S6ADFf9mdU/R+5oPcawBdkr9GrpMKymxOof5L69BXccI7au/LMX?=
 =?us-ascii?Q?DlJL32b/P8xi6ZqJlpiLySksQHOlNQL4w8ACJJw7EkTP2gApUF89UKm7IMw1?=
 =?us-ascii?Q?mcCY3jUNUyP4PCov/n9KToSmO3PPYgmfizID17KJQ6ghHaAgNVxMMthIQuoo?=
 =?us-ascii?Q?eCazCr9LHspBPJzX5ZGBn0vn1jlitrAA9OB99JSVuLPwwCJaWiFgwHRtEmIm?=
 =?us-ascii?Q?b3zg4yqsy+p49ns6VqiRhYc2gOpY69GneQM7X9whTH/Cssf1dYjQDcj49+1C?=
 =?us-ascii?Q?W2PeWwLVvkU0Vj6wYRW3QiupMXKHYfIl7rKGHuxv0xKfjCCLGoydnyZoye2j?=
 =?us-ascii?Q?AjG/iNgmRRrm2+v834FxR8RfVw17Lxij6g20/cmPAowF91ATkLffyuPJm7w8?=
 =?us-ascii?Q?jK9nWQIQEJEtG+EWQIfMcSorIQ+XngLcr7BLdxczAJnd6y3FwOeh8d6Vsh+c?=
 =?us-ascii?Q?OgqeIB2eA/lCUzO00rl8hIuJeIZwd9px2l6ZFf1gOxWuCnWrTaXGjIjfBCPd?=
 =?us-ascii?Q?LKBxiPq9APAXzV3iH/VtKvhUIrjf3PyXh02KfKClH0S0JdIPNF5NtuWaOCAu?=
 =?us-ascii?Q?HzE7g7ONRLCEN3tgiGJRpFTtikRlbO7rmXT+z79rzhk8jfCY2BjFyo1JmpAA?=
 =?us-ascii?Q?wbExhVSWA9fW7F3XNatX9JPDj/xalYI1GQix3xioOkV0AbakRAOc9/LV6XX3?=
 =?us-ascii?Q?Eig8vtZR5BkaaltSJPGS/VLaqkTylOnX1vSDN4K7ZHX3kSyArCPGM4r2gGjg?=
 =?us-ascii?Q?ArAtzWsS8G6wa1TvM8O6s6jJdRQ5B5T7pNOcgC98/BbVmTtOkLHBjFl0t0d7?=
 =?us-ascii?Q?DIs3a0qTaEWqrkxVlRwgIb4auIEirl/Cjf7rWsk8Uq1+/oeutPtjQ4oHqdAz?=
 =?us-ascii?Q?A45cz8lT05a8gRgxBGFC+hw71IqsQ8JPldrtQ7zFk7Pi2sILDiHlSLLPrscT?=
 =?us-ascii?Q?J8XtzqbosFFtme60CqcjDUB2FtvcPhTWvHY7uOP7PzO1MGA1t/AbrWXgye4T?=
 =?us-ascii?Q?TuNAbtN4pXWdVnIguwDitFJd0yx52QlRrjOMgCpUzG1BUuvj+DAAejPoOa7u?=
 =?us-ascii?Q?D2T1d4c5tYzxVZ2QYD5Afx4ffje7KUSiQ5OjD4gN2+TWSvNKEN0W5RpOxiiv?=
 =?us-ascii?Q?jvVQV0zJ1SfOyr5D+xrx3+sGbcydGKeb7xgb8uS/nCPywliI/nLGTZt3YSdl?=
 =?us-ascii?Q?1zxz0T69Eky0bvXIG/jd1TAI/eVA308ndQ03hPoTKkmv7fRSwp2Bzxm0k3Dv?=
 =?us-ascii?Q?al+GskxWhTIf/UXwMOuqyKBGanriTRC9ZZo1Cic64VNWKuzBVdy8r8lcpZwl?=
 =?us-ascii?Q?ULCenuTC42MruBcVIEl07zwHLkf3eQzRS4pi7YYVZ+Dnig8esK7q9esBGbPw?=
 =?us-ascii?Q?IgQ5ZdVLXgIiMnJ9EZSpffheIJ23/KaRgBdFwzjgrtcZRZEt7XEFHcv+aPpE?=
 =?us-ascii?Q?Yn7p1oHmIYWW0Ap5/mTOmBCbuA6DF88eoVubrPjEwVOuE1b8b6iTz1vZ+qTu?=
 =?us-ascii?Q?vVm79G23MiNBlQiVaWLe4WOzRJz8Pln9tneiQ97A3xm8LerHyUeJ5V9br72x?=
 =?us-ascii?Q?bN5ZAQAwo75f5pO5oU6bm2i838rZWxTMjTA8JBYx3A314eZsjBW6U2kYlXcH?=
 =?us-ascii?Q?GW8/E+0eZYgjYgzpMPSDBHY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f837ad-a08a-426d-c4f6-08da8cc09013
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 08:53:10.6889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RshedFSVbEySm2q7OJvvTlno50v/5icgtLpkrUqs+9gzIorXlEdgwadZ5ASC8T1W0wEso9EbB6JtSqkLdIe0pmFIZ6eWb1QsPfDy75KtC7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5619
Received-SPF: pass client-ip=40.107.8.91;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Cluster offsets must be unique among all BAT entries.
Find duplicate offsets in the BAT.

If a duplicated offset is found fix it by copying the content
of the relevant cluster to a new allocated cluster and
set the new cluster offset to the duplicated entry.

Add host_cluster_index() helper to deduplicate the code.
Add highest_offset() helper. It will be used for code deduplication
in the next patch.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 136 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index dbcaf5d310..339ce45634 100644
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
@@ -547,6 +567,114 @@ static int parallels_check_leak(BlockDriverState *bs,
     return 0;
 }
 
+static int parallels_check_duplicate(BlockDriverState *bs,
+                                     BdrvCheckResult *res,
+                                     BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    QEMUIOVector qiov;
+    int64_t off, high_off, sector;
+    unsigned long *bitmap;
+    uint32_t i, bitmap_size, cluster_index;
+    int n, ret = 0;
+    uint64_t *buf = NULL;
+    bool new_allocations = false;
+
+    high_off = highest_offset(s);
+    if (high_off == 0) {
+        return 0;
+    }
+
+    /*
+     * Create a bitmap of used clusters.
+     * If a bit is set, there is a BAT entry pointing to this cluster.
+     * Loop through the BAT entrues, check bits relevant to an entry offset.
+     * If bit is set, this entry is duplicated. Otherwise set the bit.
+     */
+    bitmap_size = host_cluster_index(s, high_off) + 1;
+    bitmap = bitmap_new(bitmap_size);
+
+    buf = g_malloc(s->cluster_size);
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
+                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+
+            res->corruptions++;
+
+            if (fix & BDRV_FIX_ERRORS) {
+                /*
+                 * Reset the entry and allocate a new cluster
+                 * for the relevant guest offset. In this way we let
+                 * the lower layer to place the new cluster properly.
+                 * Copy the original cluster to the allocated one.
+                 */
+                parallels_set_bat_entry(s, i, 0);
+
+                ret = bdrv_pread(bs->file, off, s->cluster_size, buf, 0);
+                if (ret < 0) {
+                    res->check_errors++;
+                    goto out;
+                }
+
+                sector = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
+                off = allocate_clusters(bs, sector, s->tracks, &n);
+                if (off < 0) {
+                    res->check_errors++;
+                    ret = off;
+                    goto out;
+                }
+                off <<= BDRV_SECTOR_BITS;
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
+                new_allocations = true;
+                res->corruptions_fixed++;
+            }
+
+        } else {
+            bitmap_set(bitmap, cluster_index, 1);
+        }
+    }
+
+    if (new_allocations) {
+        /*
+         * When new clusters are allocated, file size increases
+         * by 128 Mb blocks. We need to truncate the file to the
+         * right size.
+         */
+        ret = parallels_handle_leak(bs, res, high_off, true);
+        if (ret < 0) {
+            res->check_errors++;
+            goto out;
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
@@ -595,6 +723,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             return ret;
         }
 
+        /* This checks only for "WithouFreSpacExt" format */
+        if (!memcmp(s->header->magic, HEADER_MAGIC2, 16)) {
+            ret = parallels_check_duplicate(bs, res, fix);
+            if (ret < 0) {
+                return ret;
+            }
+        }
+
         parallels_collect_statistics(bs, res, fix);
     }
 
-- 
2.34.1


