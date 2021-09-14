Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC73D40ADEB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:38:16 +0200 (CEST)
Received: from localhost ([::1]:35268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7hX-0001vq-Uv
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VL-00026u-5H; Tue, 14 Sep 2021 08:25:39 -0400
Received: from mail-eopbgr50116.outbound.protection.outlook.com
 ([40.107.5.116]:58241 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VJ-00065R-Df; Tue, 14 Sep 2021 08:25:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hr8yPPOsiyoEJEhgfBo/btT3TP2Uil4THlCK2NFZlQLJ8SM99MF39xdJvUGSGfBz7vX6+HmKXqMf3vW0t6zYkgJoh4BDo3RJT49pIQtLkJoEkD3gncSuUsw4gGwm/SSVGgWM1aBclnTsKCZdw8ElBKm+qfSwqHn9sOihGx/cmkvDNmlauQHA/OrtbiKjMKbdfH0CAzA/OuvGJNCqVdvquoM89RYB9JhV78xihq0UBdozkORPRIFY5GIA9SpbSFEHs8TLXG5saMBAewgjsZQuo+/g7ckePHsQYnAH0wzEiThkwYaERFsjW4fo5bsFeMaWSIaMMT9DggzRQzQwxyeQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=uNBRu4JdIVBQ5ZsYPNqSHtqtZIR0iNKK6ywR+Zpu4A8=;
 b=n8ariuUjs9gM4vd0162ZX/NyOV69pa0x+6RvDaTj9NUG7VFgnCr9Ma2C6wyyUYhSvG9/BQ2+WyFORpCzesCzZupde3UzBRY0PRUJWkZ48k/8xNbnlL5dQBCihQ4QR14BzZf58zE8qpe5pE4iS1xGH9aaEKgfjeLCWrwFKS5jAoe+S5tzgGLi6bH2asDRtLPrNj5CvlQp7dLRJomptpRfboyqm7Ymp2xeWoeYuW0fgPStX0fcE2YPTS1sO71rQFgPFE0C2I3k7DdxYDnbBNfq+0PhqXjLECL+7FecV0RR4YEHq2NXUK0064XVFxjuCQwrTaUKAE17waY3aicgZNkrLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNBRu4JdIVBQ5ZsYPNqSHtqtZIR0iNKK6ywR+Zpu4A8=;
 b=nV9pEzf5shjcwjobjGnZ/wFtxjff8y1Gv7S4HheZWxftfliDV9Th6ee82ExhUjxAoCp688Mqr0tX1t6lITZNgmBSeSC62MuI0sV8CxJIca5Z6IzwBgGcpY+4RY4qeP34qd6i1l1tJlsvD6cP02uMJIrVsprV96n6oVxRb74WWfU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3158.eurprd08.prod.outlook.com (2603:10a6:209:44::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 12:25:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:25:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v4 08/10] qcow2-refcount: improve style of check_refcounts_l1()
Date: Tue, 14 Sep 2021 15:24:52 +0300
Message-Id: <20210914122454.141075-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914122454.141075-1-vsementsov@virtuozzo.com>
References: <20210914122454.141075-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:25:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95bc51c4-7f19-4cd9-c3dc-08d9777abba4
X-MS-TrafficTypeDiagnostic: AM6PR08MB3158:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3158108CE1E7849C5E8D751AC1DA9@AM6PR08MB3158.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eRrOhqgYt0tGO7dSq2aWoNoaFgY6NxveFjYInaeBBZd3z/Jz57lBZqda6YP1YwctooD0Sce6OVjA8rwC+eng3lKP2laq74SS3CoWVdfig+9eWwLWDpiByElX34I3B/yONUvot+7lluGs/gO1jGQ1wZk3FHTb4yQktC6KK4XpmqSdqYlXAqlxriZ8E/S7riufseBcVQWkpJwyBRvDv3/cSzC5AEi/MNEn2bgGoq1BMnKix6ME1kNrAqbOWJ03ZEIaap+RlNclF38qsuELj1BiKODkfWG9+A2m53sN2BJkjwGKKUMz3HIwlW2bGlcj96Trla/rt22HrmFydhoyU+EmCfvLHczeA44HuWojddP1IADNAPoGmVOPnq0weF6oeaUu0Ksz/T9MBhntYFBhKhVP+DBMZcGcnhqH0E5QhjxMMqV2RjWBQu8JEYbooo9SXI/gKH+Q11m/nXnXO437GawI4lChPnznN0IyRMSZXtG/gKn/pfS9UuzMeNiaLBNIN3NlJU+Utxz3Rja3OOpokSfulubwmDuERQcaWtoDKKOIECuNUkTVTqwrZhD5xFpEzYTa6Zkfvzd/RlcbqAtuh+DpejjnqqQXhGso4ibKVbUU1LHVBTzWuVxqNcRL+CnTT5jOWAcdkguLgg21LuMHduIXIPMsB5uQupYiYT0EEIB5Vk2wJqU3lYU0qyDM5rwuqD29PtnDfiMlaBDSKSgxS58obA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39850400004)(366004)(26005)(186003)(6506007)(478600001)(36756003)(38100700002)(38350700002)(86362001)(8936002)(1076003)(2616005)(316002)(4326008)(6512007)(107886003)(83380400001)(6486002)(2906002)(956004)(6666004)(66476007)(52116002)(66556008)(8676002)(6916009)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?796lCJK7jjVnNzao5Zq8sDMHFSdoDFIZobpdjqk3kB8ORlJpNZQW/d/Pa0c3?=
 =?us-ascii?Q?g77E+Fr3vDdyzwuz0mmoRY2cK4RwuBtBzAZ5hRq+ARwoV5xrCJ2WTcgVi+J5?=
 =?us-ascii?Q?0BmAgZ4PVljBWNJRl+SLTtGWKoMBeHH3/mcJE/lu3p0To3YpFr6ZwSo4kPpS?=
 =?us-ascii?Q?RDLi6YKcONxOd90j4PYdUSQHdbqZwAvzHC/QDDzDya/mfj5q/Kf+rzljS7//?=
 =?us-ascii?Q?6rsfGnnT5DATW+aHwBWh6C1DJSVl78I5cuDWXxy00CEnWe0SCr6WI4SD/cxA?=
 =?us-ascii?Q?DdDkWVWYHlrMRcc+bjVq3sicMKeveGSoSZy7pD7Ep2OENkIJ3QFqY7D9HG3H?=
 =?us-ascii?Q?bD+Vf1FCJBKjvRbFaOppPByYaALj7Yb+Bgn7uLSFpHXu8yx4AKqvOt0ue0bN?=
 =?us-ascii?Q?xtAIqguXG5ain5UzZ6DrFgRtAnl1r+cJ3J3RIp9pbMUEXqEyFKOZ4vtipk6j?=
 =?us-ascii?Q?ZjXZL1rkJhx1O47JIPWKmNUlCdoCWxCdFKgnL9Xv9zjScmj6Eh5M6t2f0VrY?=
 =?us-ascii?Q?oXxIpQex6AUFPZpa4kXWC4ddpiBz/aTCB3WWeJsrGp2JUPhimwNsUkDNx8PN?=
 =?us-ascii?Q?zajHRXGFA54Otqpfj+QQiliAY/xWCdO5m0JZr1wRSaOsBjeKxiY3dILlFpBv?=
 =?us-ascii?Q?CThjHki1bcja4p0YHpdcBDhkVeguxoy799RNEa1wLsCXQeA6NDVCbZy50mu0?=
 =?us-ascii?Q?RPZSNex0gzJR4Xxi1ATah+Qlb0XbvuUYEFGR8x+KFzVgHJxU2ENE2R8QHvar?=
 =?us-ascii?Q?8zveBlthCj7xuOI4XcfAATNl/RrHP9Zm0klD29Uj7J1NeLxsC1BCTQFilvAU?=
 =?us-ascii?Q?74EE7gUOOpVc8jZzrdUW6qYD0rhPqWiBTAU6j8n7oBBiGQXKS+YFeqoKhMiR?=
 =?us-ascii?Q?VNU3R5u6c2cohy7eERNZUOEZ0lS0y7YMDMP4/q9wDHwAsV6LEaYbP7PWuPeF?=
 =?us-ascii?Q?x6dPJ6YFI/bOlX+lxV1iYQaUWLMH7Z1M51b/hLbbIgejf0Li+anQINE23STD?=
 =?us-ascii?Q?T9Gihm1tgHQadU1yRAGst8t+EqdHCpb7AiNJ0gUo/El5lOkZkvsLTQVMdYgQ?=
 =?us-ascii?Q?UyKwCrly1rbjbrjCkBX3/ldP3EPFfsDRb8geEDe03yW9M1bo5ujXH+CwL5Rw?=
 =?us-ascii?Q?9bAHsKwm48XD5brGEm4Gcfkt+G0K1flwc5shW4a1wTt5bbBQCPCJWIc+eqs3?=
 =?us-ascii?Q?Szy+HebnFlGdA8JFR9Tia8JmVsay8ulU57r2zlBZLAr3tGYNP/q1Wd1H0KO4?=
 =?us-ascii?Q?B32XZVydAzJvEqi8rb04O/vXIF7N4duEHDCJd9gdXDRo4v4NXkqQUXtqgBft?=
 =?us-ascii?Q?DeEBhF9L7vSa4yK0a0OCm+rz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bc51c4-7f19-4cd9-c3dc-08d9777abba4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:25:26.9241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXyZg4tMWk+pLPixfrUya62rm/r/nBKOIp1J4qv5Ls66T9owoVwHrOcTogshtPo5As7fO/YBejsQSBfgL3pMV3bJ7ivloSpxYoBed9bz+hM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3158
Received-SPF: pass client-ip=40.107.5.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

 - use g_autofree for l1_table
 - better name for size in bytes variable
 - reduce code blocks nesting
 - whitespaces, braces, newlines

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2-refcount.c | 98 +++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 48 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 5d57e677bc..153e5ca087 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1860,71 +1860,73 @@ static int check_refcounts_l1(BlockDriverState *bs,
                               int flags, BdrvCheckMode fix, bool active)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t *l1_table = NULL, l2_offset, l1_size2;
+    size_t l1_size_bytes = l1_size * L1E_SIZE;
+    g_autofree uint64_t *l1_table = NULL;
+    uint64_t l2_offset;
     int i, ret;
 
-    l1_size2 = l1_size * L1E_SIZE;
+    if (!l1_size) {
+        return 0;
+    }
 
     /* Mark L1 table as used */
     ret = qcow2_inc_refcounts_imrt(bs, res, refcount_table, refcount_table_size,
-                                   l1_table_offset, l1_size2);
+                                   l1_table_offset, l1_size_bytes);
     if (ret < 0) {
-        goto fail;
+        return ret;
+    }
+
+    l1_table = g_try_malloc(l1_size_bytes);
+    if (l1_table == NULL) {
+        res->check_errors++;
+        return -ENOMEM;
     }
 
     /* Read L1 table entries from disk */
-    if (l1_size2 > 0) {
-        l1_table = g_try_malloc(l1_size2);
-        if (l1_table == NULL) {
-            ret = -ENOMEM;
-            res->check_errors++;
-            goto fail;
-        }
-        ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size2);
-        if (ret < 0) {
-            fprintf(stderr, "ERROR: I/O error in check_refcounts_l1\n");
-            res->check_errors++;
-            goto fail;
-        }
-        for(i = 0;i < l1_size; i++)
-            be64_to_cpus(&l1_table[i]);
+    ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size_bytes);
+    if (ret < 0) {
+        fprintf(stderr, "ERROR: I/O error in check_refcounts_l1\n");
+        res->check_errors++;
+        return ret;
+    }
+
+    for (i = 0; i < l1_size; i++) {
+        be64_to_cpus(&l1_table[i]);
     }
 
     /* Do the actual checks */
-    for(i = 0; i < l1_size; i++) {
-        l2_offset = l1_table[i];
-        if (l2_offset) {
-            /* Mark L2 table as used */
-            l2_offset &= L1E_OFFSET_MASK;
-            ret = qcow2_inc_refcounts_imrt(bs, res,
-                                           refcount_table, refcount_table_size,
-                                           l2_offset, s->cluster_size);
-            if (ret < 0) {
-                goto fail;
-            }
+    for (i = 0; i < l1_size; i++) {
+        if (!l1_table[i]) {
+            continue;
+        }
 
-            /* L2 tables are cluster aligned */
-            if (offset_into_cluster(s, l2_offset)) {
-                fprintf(stderr, "ERROR l2_offset=%" PRIx64 ": Table is not "
-                    "cluster aligned; L1 entry corrupted\n", l2_offset);
-                res->corruptions++;
-            }
+        l2_offset = l1_table[i] & L1E_OFFSET_MASK;
 
-            /* Process and check L2 entries */
-            ret = check_refcounts_l2(bs, res, refcount_table,
-                                     refcount_table_size, l2_offset, flags,
-                                     fix, active);
-            if (ret < 0) {
-                goto fail;
-            }
+        /* Mark L2 table as used */
+        ret = qcow2_inc_refcounts_imrt(bs, res,
+                                       refcount_table, refcount_table_size,
+                                       l2_offset, s->cluster_size);
+        if (ret < 0) {
+            return ret;
+        }
+
+        /* L2 tables are cluster aligned */
+        if (offset_into_cluster(s, l2_offset)) {
+            fprintf(stderr, "ERROR l2_offset=%" PRIx64 ": Table is not "
+                "cluster aligned; L1 entry corrupted\n", l2_offset);
+            res->corruptions++;
+        }
+
+        /* Process and check L2 entries */
+        ret = check_refcounts_l2(bs, res, refcount_table,
+                                 refcount_table_size, l2_offset, flags,
+                                 fix, active);
+        if (ret < 0) {
+            return ret;
         }
     }
-    g_free(l1_table);
-    return 0;
 
-fail:
-    g_free(l1_table);
-    return ret;
+    return 0;
 }
 
 /*
-- 
2.29.2


