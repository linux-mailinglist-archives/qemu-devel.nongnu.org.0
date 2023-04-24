Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03F76EC899
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:19:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsJj-0006MG-R6; Mon, 24 Apr 2023 05:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJi-0006Ld-56
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:17:02 -0400
Received: from mail-db5eur02on2071c.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::71c]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJg-0002zR-Do
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:17:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8muLacHPupYAYDvLFKqbiQN+Pcph3lXWRh4xC0xWE1GLA98dY/F0wrXmwSZcM3Wvcu2NjwnCxUjyU6Sj0vrsBApRrrLfdHs6g7eKzjv0C9lX9Fzb5w32mKXv/2reD9ihwijd84M0X15opX7Ha/R+T40R3/8fxIApreAThJtdb8SuiELcTRJQpgNSqgNTTOg5SzSBMLXvMVoRoAtbf/T+3g/tcrHIFljSRYLV0DrE12gcOz8i4tRLiZvCkLCqL3tGcoCQrkHzRBRtR4difqI7XwR71XBNyBMdaPLfNlWED3/1yrSVQWwZVRMRkvSuJTXiAgXEMzlvPOfO6YcFA/TtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMDOrMQOAEcLzCo+0O8hmjMAoxZudV/fIB8RrFdBEuk=;
 b=c1GoHy8UkKcq9qoW2Xs2YfP8f6TIzPjfwO88hFo1GW4nn6Cdp7Qe8jr5cjJck4ClwX3ZsybE277pGeSF5fGPn9psT/XIYKSQObBmX/G23+jVxVeWMXDm2PvBXZcd6elu0MlF9/gu+rGvtAhpg91hhGz7k7k4mNURkL8VoHcPlf9PVWCwesHet08d9EZxgnQ0jKIB6AuQftHxuQMN0eyELEFyW04W2rbF8SOf7dyme0D6Wgn7CkZ+kzB6CuRnKW5PRwzAgMMBsNcGbFDmonTJjwY5up3zBR8OhvUFi4ZMpfj34NceXHfXP5xqoAyp1WFpJEyKXVyXyFQCUrw7T3Fxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMDOrMQOAEcLzCo+0O8hmjMAoxZudV/fIB8RrFdBEuk=;
 b=mPDP+nMU/baaUOMRe+Bbsz8j+7WGtR0PmLnaY8IpihZ38SRh3NaCcoIPkYr5DI/HbT9D+1wmHtJGg9ELe79/fFnfX2oLFQ0tWKWTsptQ+dUAgCL8waAwug/rMn+2qzKFCYj1wNryF08yTZYbTCN4AExg4iHMr3CjKbnKEVmclJW+Qx8H+3makGn6EkkswYKL3gkxmxFGurpKkwklYZGUmfe+lBbe3tX43vpCfE0j/iMHFjpRygLsWj+6zTr8IgUv+TlABH2Rk1QMrcjNZ6xxy123VzfwJYumc2ZVAIGxIBqS426wgkh2HCpW9rlTLAEX08921hHrRrMuXIxXnMh4sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:16:47 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:16:47 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v11 07/12] parallels: Move check of cluster outside image to a
 separate function
Date: Mon, 24 Apr 2023 11:16:21 +0200
Message-Id: <20230424091626.195590-8-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
References: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS8PR08MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 814ac9e6-7749-4744-d0b9-08db44a4a072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XqIhS1L+rKlm0sTvOFZmGHiSgdmsFNXmMPWlY6kLmiZ0H+SVpwChl+x3bbJV4kC/JNunwg/UpCoTo7eVY8GUGGgAxtAbof23KaZup6HK+W2XBxzVeTdKeOQxsq2LGFMOaqfCpNNcmmKR8f6Tq35+O4cpYBJ0pRMYD+Mz+yQqjIrd6Qay90T83o3iymwwEgD2uibIFUqH/HtL+sQ2+bp61jl0DSEa56ymF4B8vse6Ja8Dq1ivwFNfca9kqAVCxte+GJec014Ohebmz1R1qEe58EVQXUgBYuPgm/hVTRhq4C+SYby5F48XmKuO3ry3Y5QxZNZRPZPfejlerasX+B0+QVMHwTPf84ANEfb5YyiyxK6TF7mlVg/B5ZSPF7jvkFhL2i+8DwTB/XGngyqU7vydA1ro7JISCwiKbhtN49PGFE3m4grj7ThM+7jkOmXIlHPUHmeH/24ytlgzIqoVZ/EcFb3YIqchFNBODIsQgxBFXW3gCA49FOd0ZDUTvNA8XRSkxC2IBzJ5RvLP5kE381OWpk+WDaUG6Q9wugvnLssGh+1qNyaXHZFQila61QBr1/ZpUpFRbrDUjNEdMiN+Pbm01hVO7fANcWW7wKM6VlLERFZXG7zcoBoMgzMN3bfUaxQz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199021)(36756003)(38350700002)(478600001)(316002)(4326008)(6916009)(66946007)(66476007)(66556008)(41300700001)(44832011)(2906002)(8936002)(8676002)(5660300002)(38100700002)(186003)(2616005)(86362001)(26005)(1076003)(6506007)(6512007)(6486002)(52116002)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LFJnSKcKzbQ0cvEqHG8GhiRrOxpAAuueBRa/Elzjts9ZcKPm74jKcIQjzFz5?=
 =?us-ascii?Q?l761PfyW4VpGVKdlqlgzM+tp26XyBrrKdg4gf2rrKA8rgrb3ggFAMDGmJiSp?=
 =?us-ascii?Q?oyHhJJxx2AB+Po+ClzRuncDv9eCYMxkRd/Q1EQV80C7mCX0qc1zTBlxxEK/q?=
 =?us-ascii?Q?PQ4LDla8dwTs0cUK8g3d6XRCQ9JoFf/A5dQy91B0tntwVBwG20bdPQspRxhp?=
 =?us-ascii?Q?T7WLanRq7lLDv4btZz59f9d9ngx/IwSRFDPGDACUNKO8zNkigGaRytREVbtW?=
 =?us-ascii?Q?R6y3CQeJ0l28Lx1AZQFGjRUHiMwyQt3R23jBCJfYRj4tNpR+pur0VEfJnsun?=
 =?us-ascii?Q?8TuJ3vzisV3Nw+8QsrQmGrFNSuAJ+slyy0kTppWLpx6Pua323MPfoYhQPPZ0?=
 =?us-ascii?Q?7faQPrd0eiuNZVxT4ehmqU719y/4DEomhWugC5aNjN7W6U4b9Lo3t3e9xqUI?=
 =?us-ascii?Q?8TzdZxLP3IptcOyiaRBG7CkVkYIZeKq3BpKP8Zu4cXxMf5Uc8k+5OuQybo3C?=
 =?us-ascii?Q?+MWDWLZibse+deiprPfAM141Ymrrw4RgGanRF2UDCxn4JCLRUcNjPNJFb2Tn?=
 =?us-ascii?Q?qim3jxT88zN1kaoy9hZatmdddCUtIeXAMi4EFZvbXZLqc/f9tk+jDyWmE/tL?=
 =?us-ascii?Q?Uuaig6PUfVnzlyghiPyW91FCLmWCHP+Iua3UAMo6MUYq7lF2IiGyWllJnf8n?=
 =?us-ascii?Q?dtA57AeYZiTV6+l0Omo9pXbpftCI0tBpyJcpYwQBdpA1PjJKzdzyqh2vsvtP?=
 =?us-ascii?Q?hESEFkIQQWmjhKesFZ1hIfgfD3iWlJC7ESC95196r1gv1/fckWieOr9ae3bV?=
 =?us-ascii?Q?Bkn39OjyuSajjopIy1tZOTBnZj9tMVHIM8UG2i3r/yZFayrc2lIfb+Hg9m21?=
 =?us-ascii?Q?cqO7PxEZ7r5duBC4rO0X/ct+broaHYpU6+BPNzDO4ubrJgRHEAsWcmedUZjq?=
 =?us-ascii?Q?aWAxpogvlZC1Cj7s9LKen8kodIL1mPQiyetwUbpRzhgDFJh5Iy63eeaunq6u?=
 =?us-ascii?Q?hMXpetiCuOAb18X0HAVW1FCvvh+i7FIA0zqZRh9bzgzfUfpXAcsjM1G2FYc0?=
 =?us-ascii?Q?fhMmgDpBXZtB35iU6jv2+EbxAQHV7Wid6dkIQpgWbuSVT6VY0Ei5ZoIGblt8?=
 =?us-ascii?Q?FQ6k2b4ISCuPiLvrLdesIdBtP29jdDYE+/u97R3+F1e3syswRhidzGgo0Ixe?=
 =?us-ascii?Q?7LndNwpLMCOM4mYYPovQ7DFP7V+GHOLYhEO6LhuuVxpjfvUPC7IK3B2tIxsw?=
 =?us-ascii?Q?DUx0KYwdQqqYFFqvvWhU2lblcREER70uffelnTtGHHv0rjjk8PRWA9jupZt7?=
 =?us-ascii?Q?9tW4zZWyhZ3MZJhW3OL8IkKoe3oOp02lpIZMc3yeBLiq6SCP2IO5Qgpugu60?=
 =?us-ascii?Q?wv2XjUau41GZzj3u78FMhIYkwLSNAQmCXFEpYziFqN6+QjQhFa2T8mWsReH1?=
 =?us-ascii?Q?C/vXFDRu2joFxzcfCq97GkWrajz0iO1uFcAes9bOGqoIK0ktTknOQUzansyK?=
 =?us-ascii?Q?Nx7yGmEbWQtqW49aM5WgVa18Qv7yXokg3SP16fgNMvhIC0IUH1FWhZBXUklF?=
 =?us-ascii?Q?wd6NxWeFdPVn/QgDHMGUnuW+IHQ3ph+05bO6v6/cherW6qzrGZXK4ecVNetI?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 814ac9e6-7749-4744-d0b9-08db44a4a072
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:16:46.1559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: db/V4S0VTFYDf2k9wBmSlhWWdIjUmNaH5s24TOIkj9TtF6t5P2E+J5TWnY+ao8upPTX9TlH5DkArflyhkRJ8n13M77kE4bkgBodbK6HJ8FM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534
Received-SPF: pass client-ip=2a01:111:f400:fe12::71c;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We will add more and more checks so we need a better code structure in
parallels_co_check. Let each check performs in a separate loop in a
separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 79 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 28 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 4f14bac616..8588c3d775 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -441,13 +441,12 @@ static void parallels_check_unclean(BlockDriverState *bs,
 }
 
 static int coroutine_fn GRAPH_RDLOCK
-parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
-                   BdrvCheckMode fix)
+parallels_check_outside_image(BlockDriverState *bs, BdrvCheckResult *res,
+                              BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off, high_off;
-    int ret = 0;
     uint32_t i;
+    int64_t off, high_off, size;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -455,23 +454,9 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
         return size;
     }
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    res->bfi.total_clusters = s->bat_size;
-    res->bfi.compressed_clusters = 0; /* compression is not supported */
-
     high_off = 0;
-    prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off == 0) {
-            prev_off = 0;
-            continue;
-        }
-
-        /* cluster outside the image */
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off > size) {
             fprintf(stderr, "%s cluster %u is outside image\n",
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
@@ -480,19 +465,11 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
                 parallels_set_bat_entry(s, i, 0);
                 res->corruptions_fixed++;
             }
-            prev_off = 0;
             continue;
         }
-
-        res->bfi.allocated_clusters++;
-        if (off > high_off) {
+        if (high_off < off) {
             high_off = off;
         }
-
-        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
-            res->bfi.fragmented_clusters++;
-        }
-        prev_off = off;
     }
 
     if (high_off == 0) {
@@ -502,6 +479,52 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
         s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
     }
 
+    return 0;
+}
+
+static int coroutine_fn GRAPH_RDLOCK
+parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
+                   BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t size, prev_off;
+    int ret;
+    uint32_t i;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
+    }
+
+    qemu_co_mutex_lock(&s->lock);
+
+    parallels_check_unclean(bs, res, fix);
+
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    res->bfi.total_clusters = s->bat_size;
+    res->bfi.compressed_clusters = 0; /* compression is not supported */
+
+    prev_off = 0;
+    for (i = 0; i < s->bat_size; i++) {
+        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off == 0) {
+            prev_off = 0;
+            continue;
+        }
+
+        res->bfi.allocated_clusters++;
+
+        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
+            res->bfi.fragmented_clusters++;
+        }
+        prev_off = off;
+    }
+
     if (size > res->image_end_offset) {
         int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
-- 
2.34.1


