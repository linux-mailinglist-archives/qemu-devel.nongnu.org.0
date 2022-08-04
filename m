Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498F6589FBD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 19:14:18 +0200 (CEST)
Received: from localhost ([::1]:54500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJeQL-0007Ec-Dw
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 13:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJcDW-0003QV-0s
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:52:54 -0400
Received: from mail-eopbgr60105.outbound.protection.outlook.com
 ([40.107.6.105]:27575 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJcDS-0002DQ-KK
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:52:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9hQ8jAJsixUcWZU44NiJgpS1m6rFn6JMpVjQIxevBcA0FBgyeuAaPcOtSxukIoDnfb6im579zh4pQmLa698ty0o+PBky2J6vqg6OcXqfY5vmLWWatQZ1YV6npur63hwCWYGAiehN+qjit+d+sBz92XdzowFyM2og8408mRLyHY9//UFO0JzGnxH98hTKiHL8xVaYGAkEkhUtE+y+x+6+JPpBcAzhPHpJ+Su1NpvoRpO2azTAGzarzeO3AsqsA/YrxUO6d4BuCEVb9YRkU/EEYshBpXKd9ep8w3zpsTsGLYw9XFBlB/13IcemSx3v0sTUxxXf1xVXinEGE6Z62hzQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4DZffO6E142Wt6JwJal59fuaXjFpQa88yMQcOAFRAE=;
 b=Z+9Ckn+W0u85ryA0oKPATPW9fCJKfb2CIJq1F/wrLRYYVFttQ08R1jTvMcrqSlbflqRxn+w8HJKgzRCy+HserAyqEpfTcrcY33okl8JMvH7vW1xe94SHMA0vN9eugJXN1fqPFZ/jnDyC1KteLOh66K3pahiCtist/5vchVDFHAS75fNPZ4XDYGPo4k3JSYiJ+D67oLpnAUpreOVjVxyLPPGUc9MPzfbHktA/2P7tbQ200+prb8Ug6Q1FHxgOCIu3kER415FgFk1MhWmSLHo8xej9tLieC+z9dvHGqhuQoVj5eI5gLNL4WIlBJRnjLTjg/SVdrrujelMGzgkL0Lt18A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4DZffO6E142Wt6JwJal59fuaXjFpQa88yMQcOAFRAE=;
 b=CqEVBn/2ruBO1O7XKR1kPDiDWTFQFliInznqMGPedno1G9LLlJw1voX9hwNlJXdr32UzHe8LRqFhf6I9J/wDbKMRRykcuGa0rwVO167jKG0O/oEcpTVgRpcmIbHlp4WgQygzhaSRc4kkjsU3AIRodRPcoMmWlr5seQU70S9JR/9k8cbADwpzVeKeBbCSBxqnr/kQeRGm49x6iNgE9kaD9/MBqOy+oiloKCHNXTAoXht8pdWgFHA2SWuOD0fN2NKzf/hoieEEhPZSQTMy7WPtgW1Uzlzz6Ie8goIcUKMwz6nNfrms/DAjecvmX+IdPqf6kQLi/EnMrtmXlDMF+h7mvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBAPR08MB5624.eurprd08.prod.outlook.com (2603:10a6:10:1a8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Thu, 4 Aug
 2022 14:52:10 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 14:52:10 +0000
From: alexander.ivanov@virtuozzo.com
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com
Subject: [PATCH 1/3] parallels: Add checking and repairing duplicate offsets
 in BAT
Date: Thu,  4 Aug 2022 16:51:58 +0200
Message-Id: <20220804145200.564072-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220804145200.564072-1-alexander.ivanov@virtuozzo.com>
References: <20220804145200.564072-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2debf98c-f14e-4a37-0479-08da7628e8ca
X-MS-TrafficTypeDiagnostic: DBAPR08MB5624:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MZsPUiH3hbscSzhKgk5bjfQ6DxgIjVvyG4NN85bKT2GAtESs7q7jQbcgLWlHfXq6S1Kt4pJIWBPDSx4VVFWR36Kz0UWr1cM4nTR7iAJMSgvj0z4c5Xl8gaGY82kmxV8NKtIysPi/U7SM66K543vZhZdl3njkFMdbF51NmRgxc+YY9t7JFc8BcgJKcOLlYB/J4ngeQJdRHiGcwQHe/WIQveFQUTL2Q7tBpXinn6XE38wsIdTtrN5vm+TyD55p+B0Ej/cz7kiIV6/Fg2VdMtCXul+V+r3AVm6EF4ScisiIkmqTtKRooy2t3emK/Ds3C19DX3AuxzyUVX5RLyx6++xDPIfLmK/6jJctePaxBdL7lrjwKIquDNL+SGhQV8M2hZcjX59TNSLswdVqJNx4D/RUugD/KxuW8p6yXRFt1v97J/vlgYlSSFeu8vshrOLs8hnNiDXK6ecboJ9vVWG+kEua07QiPJanbvSrUj+Tc+OEwakSn7pEL0x457Z/wd36L0igI1wVU7Ap7D5eSpFpkSZSQYbo3UIm4liLsgRfwGxrLife6WvfCnC1GEF3PnW7qVTRU/ozzZI9wjxEkAmcKVahcLTP3o2ccu+JdUaiR0m3kdRTgLgAfDsV2fLz1KCDiwIs9OY90hLqw4SfKCOuRyUOZY7X7LjCxmzkQ/0uxhsKWuB+2GaMSTbHhssrflAkUdH4zhPlzBzkF7KkxlEtSOOIFZNvaxYdmb/mhmiTlnzS1HPu2Dg6jLkWk8Gc/Hyiy55E7yfRiVTGmTkHc+BRpnQ1fqoS6Br8CC22MJmNwHdsguA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(66946007)(8936002)(2906002)(83380400001)(2616005)(107886003)(186003)(66556008)(8676002)(36756003)(66476007)(1076003)(5660300002)(4326008)(316002)(6486002)(478600001)(26005)(6512007)(6916009)(41300700001)(6666004)(6506007)(9686003)(52116002)(86362001)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MsQeCmrX2a/EqIv+RjF39y7Fsm72W57m9kYxRkt4l2rYXhDepuVvOkezy5PH?=
 =?us-ascii?Q?UVhO8JrlwkLNuaacEP2HzIkkFHxdYczuLwFJEgtmpcfG36rKUuoMsnaW03xc?=
 =?us-ascii?Q?baHBWqrjrMpY7fM9/iBBgBZEYugfccw9Vd4fBQSdWWsEpl3S3OsK3V8O5OeH?=
 =?us-ascii?Q?5QP2fGZaTJsHYR8w7w38o+1vAGG7ehzlzF3LevZuLQ33So2jKb6RfkRwNr80?=
 =?us-ascii?Q?Omk3mi5oOZu59dDHFPbQFCoOcnOl/3+3Wcib99ZaqMJZfVhfWDzCGb6a2lF7?=
 =?us-ascii?Q?WB6VLxHMzEBIKmrUkijlQH9XQptbhqH0yAhcJlCm/P113H/jh26zfqMZ7eRp?=
 =?us-ascii?Q?fQM83zJ49z3o7tLPuL3OySSWqmfGisIJNfsIIR8GXfSF35eNEDwVqL5f/2EE?=
 =?us-ascii?Q?D2R5XAJqec9t7zEpk0+T4S9ukJSJzXjKaxuf4Rd0WozjpHxVMtoW2pfkQO/Q?=
 =?us-ascii?Q?iL7va8hEBJkgflm70QvZkamhX9PbE25zUjLfZ1HuWrN+kcTimAvoZ1Jn8TCT?=
 =?us-ascii?Q?woY38WGgcDqDOi6jE4tBA4cjP6IxH3zJh09xUxLRLzzEnt5oVTaM8fg+8NuP?=
 =?us-ascii?Q?0OE8G2gVRO3Sd0B9eKtYsMNIQRqdWzNQ9cQeb1AIwvkntJU9RT47fAwFa6zD?=
 =?us-ascii?Q?its0gjwG7/ZK2p+4nOQZyPU6XNvVkT1k8hulMMLBt1OuNjt2QvJdMfnEnh9d?=
 =?us-ascii?Q?sTpkHhvqTkkPB09B0vPJL53cR1Q+D1RNvP/n3NH/mYSYnfAxwRtXGuNsF+/x?=
 =?us-ascii?Q?NxbO7adDxIesL5XEKzUUKE39oXPkCdpJ5pE7O3Dv96r8vx3PEJpknerb3DNd?=
 =?us-ascii?Q?aGz/a85B9STlic9H69Fx5SDM9PLcsvNmj2M/WvEZoAJisP+lGpCxRaQPxTj8?=
 =?us-ascii?Q?oweJY0DAoPKmn/MSJs6+muSp//V442egeFtuCRfBJWBLq1PZVsXiKa5tfF5f?=
 =?us-ascii?Q?z3mwrZjOD5qPew3ud+vzrdWW6n6NG6pbVYnjVEHvk0qu+vDPp7skyFJvb9HJ?=
 =?us-ascii?Q?wqmiGkqZgvuBhmtKnLZFxwTSbtEcWGhOFuj29mXIzWpadogFmRPTkzIOP+94?=
 =?us-ascii?Q?b+4PF3t1dgNyzz0jvt1sQzWFouJHgrrk2kYiqfISrJxsNqURR3FzkGjs3X2Z?=
 =?us-ascii?Q?/kciaw8Ak4lK9E0+XtqWWijfGijsa/4KxbyiRVxb6j8JAb6hXVTmWdUhsRR5?=
 =?us-ascii?Q?K/nIl0Ux/FFdOPmgWO32TZnxhqbP5TYV+UaLfJnU5YPMoGD9RHXqjWBWupGi?=
 =?us-ascii?Q?wbIvUG9I4tgPd+BGi3OFDEMtUEuj6LVk40dQVUhQS6YLKROskVZwEhhNu9zJ?=
 =?us-ascii?Q?N/LipztYW5toM4x1e9Dy3J7G1KMVYz1kvattT41v/QNuMzJEq9+STJuD2Cwl?=
 =?us-ascii?Q?31wYDiaISqQfeHEIIy4jpfpKrW7lhOBKM28JnwvO87k8DfSWW/n/FkFug0B0?=
 =?us-ascii?Q?Sfj5dry27WpPTdGs+hn2L23x+dHsgnanCBocRwzCwr0NJ1gRWW3n2BXC8TXz?=
 =?us-ascii?Q?6QRxowt/4gkgTGuTPcDBEPtdwzpFLA0BX4LYZGLp8Ilj2D4+QjvOl/pDW6Cr?=
 =?us-ascii?Q?qOovL1wtGbfikgtxT/3du/a0ziZHq2JVzDcya38kF0pr6zi1ZUrS/q5LNbCI?=
 =?us-ascii?Q?tIGjP5Y9WZMG2aCQ5QPI9x4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2debf98c-f14e-4a37-0479-08da7628e8ca
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 14:52:10.3763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUNYvPnDl2b3tNKcWIVeFT72KpmtfMdEHP3kgV66cOzcjKA9LE+0NXxHYvJvx6IXvyfzaYshESG664wFCcZyS7GAJhfi2vODJCYWwroxFQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5624
Received-SPF: pass client-ip=40.107.6.105;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Aug 2022 13:10:06 -0400
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

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

There could be corruptions in the image file:
two quest memory areas refer to the same host cluster.

If a duplicate offset is found fix it by copying the content
of the referred cluster to a new allocated cluster and
replace one of the two referring entries by the new cluster offset.

Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 93 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 3 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index a229c06f25..6a82942f38 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -64,6 +64,11 @@ static QEnumLookup prealloc_mode_lookup = {
 #define PARALLELS_OPT_PREALLOC_MODE     "prealloc-mode"
 #define PARALLELS_OPT_PREALLOC_SIZE     "prealloc-size"
 
+#define REVERSED_BAT_UNTOUCHED  0xFFFFFFFF
+
+#define HOST_CLUSTER_INDEX(s, off) \
+    ((off - ((s->header->data_off) << BDRV_SECTOR_BITS)) / (s->cluster_size))
+
 static QemuOptsList parallels_runtime_opts = {
     .name = "parallels",
     .head = QTAILQ_HEAD_INITIALIZER(parallels_runtime_opts.head),
@@ -419,9 +424,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off, high_off;
-    int ret;
-    uint32_t i;
+    QEMUIOVector qiov;
+    int64_t size, prev_off, high_off, sector_num;
+    int ret, n;
+    uint32_t i, idx_host, *reversed_bat;
+    int64_t *cluster_buf;
     bool flush_bat = false;
 
     size = bdrv_getlength(bs->file->bs);
@@ -443,8 +450,31 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
 
     res->bfi.total_clusters = s->bat_size;
+    res->bfi.allocated_clusters = 0;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
+    cluster_buf = g_malloc(s->cluster_size);
+    qemu_iovec_init(&qiov, 0);
+    qemu_iovec_add(&qiov, cluster_buf, s->cluster_size);
+
+    /*
+     * Make a reversed BAT. The table has the same size as BAT.
+     * Initially the table is filled with REVERSED_BAT_UNTOUCHED values.
+     * A position in the table is defined by a host index
+     * (a number of a cluster in the data area):
+     *     index = (cluster_offset - data_area_offset) / cluster_size
+     * In the main loop fill the table with guest indexes
+     * (a number of entry in BAT).
+     * Before this, check if the relevant entry in the reversed table
+     * is REVERSED_BAT_UNTOUCHED. If that's not true, a guest index was
+     * written to the reversed table on a previous step.
+     * It means there is a duplicate offset.
+     */
+    reversed_bat = g_malloc(s->bat_size * sizeof(uint32_t));
+    for (i = 0; i < s->bat_size; i++) {
+        reversed_bat[i] = REVERSED_BAT_UNTOUCHED;
+    }
+
     high_off = 0;
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
@@ -468,6 +498,59 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             }
         }
 
+        /* Checking bat entry uniqueness. */
+        idx_host = HOST_CLUSTER_INDEX(s, off);
+        if (reversed_bat[idx_host] != REVERSED_BAT_UNTOUCHED) {
+            /* duplicated offset in BAT */
+            fprintf(stderr,
+                    "%s BAT offset in entry %u duplicates offset in entry %u\n",
+                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR",
+                    i, reversed_bat[idx_host]);
+            res->corruptions++;
+
+            if (fix & BDRV_FIX_ERRORS) {
+                /* copy data to a new cluster */
+                sector_num = bat2sect(s, reversed_bat[idx_host]);
+
+                ret = bdrv_pread(bs->file, sector_num << BDRV_SECTOR_BITS,
+                                 s->cluster_size, cluster_buf, 0);
+                if (ret < 0) {
+                    res->check_errors++;
+                    goto out;
+                }
+
+                s->bat_bitmap[i] = 0;
+
+                sector_num = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
+                off = allocate_clusters(bs, sector_num, s->tracks, &n);
+                if (off < 0) {
+                    res->check_errors++;
+                    goto out;
+                }
+                off <<= BDRV_SECTOR_BITS;
+
+                /* off is new and we should repair idx_host accordingly. */
+                idx_host = HOST_CLUSTER_INDEX(s, off);
+
+                ret = bdrv_co_pwritev(bs->file, off, s->cluster_size, &qiov, 0);
+                if (ret < 0) {
+                    res->check_errors++;
+                    goto out;
+                }
+
+                size = bdrv_getlength(bs->file->bs);
+                if (size < 0) {
+                    res->check_errors++;
+                    ret = size;
+                    goto out;
+                }
+
+                res->corruptions_fixed++;
+                flush_bat = true;
+            }
+        }
+        reversed_bat[idx_host] = i;
+
         res->bfi.allocated_clusters++;
         if (off > high_off) {
             high_off = off;
@@ -477,6 +560,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             res->bfi.fragmented_clusters++;
         }
         prev_off = off;
+
     }
 
     ret = 0;
@@ -515,6 +599,9 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
 
 out:
+    qemu_iovec_destroy(&qiov);
+    g_free(cluster_buf);
+    g_free(reversed_bat);
     qemu_co_mutex_unlock(&s->lock);
     return ret;
 }
-- 
2.34.1


