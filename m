Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82851372CF1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:30:28 +0200 (CEST)
Received: from localhost ([::1]:56722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldx0F-0003gd-In
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrw-00040T-70; Tue, 04 May 2021 11:21:52 -0400
Received: from mail-eopbgr80102.outbound.protection.outlook.com
 ([40.107.8.102]:61999 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwru-0006zb-1v; Tue, 04 May 2021 11:21:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3kRiFyhIyIfKDvmb0JTW4Lzc9CFOeDLkx75BFks4X78oY+lrDau4P9RG8n3800kESde7cQNTQY4oAFUbfQI0SsuHn+IaQER2Ntad7n/GsBTkyJMxs5FJzjWFvq/mCUVNmeMJqSVNrfSc1T1Hexgoz0JHbYyeSQk6Xr6/ftJIfs6uyptaExBo4s5/MkpYOtba9apP6E63+dM04SIyaXIzsUPHjO9kicOPj7niqMCxrBcgz/roaygalh+ivOKCRMpH8ptU2IWqK08c5MbheAB7WXgMPiazL0G+H7tr2jqUUq645RponGfOU5FXDvnmd50uFzDMiTanPz9Cw/AsEWzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2H7wyfGI/yknLiVGgVhdJTWzj24jM5cCIioK5hYINBg=;
 b=JCwybo52jk9IvWPWKK/bu3ly4xLs7V+s7esKKQtIX5RUnn45rm8Lu7Ko1OD6Rfn7WARThVeDB7VhUAn/3XjyWamfld9pjLn+hs7CzakZqdibWOSTe5/irgLBhTe23Isa2xRV8d2A1m5bWoyMQ6DimWnUPGr+nwojKmtpeHlfT+aKnp6Zxx4gnZW/cxOFa3EdH+vG2e8yO42OjqoXu3Mj3mqWyBFc4y5MhNCCcpWdWVLGyEwCGpeYPa03ai+YxS2rOPEUZUtcRr8ErSJ0hwX4YIpx8XvTBnqWHJWg7+dSqwASE0Sia7Lfr04PZTwUsYseZRPnXbEbXF2DdGbhUEarBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2H7wyfGI/yknLiVGgVhdJTWzj24jM5cCIioK5hYINBg=;
 b=ee0LDtdcRH95/iHW4/bkDszkK3uttqByXcnQ9JX7TNVkP74x6Vvok4IoTpW8byadw04TupskcaPH8gwuzVMq1e1khJU2HY4xSpH+9jpYgC3HPVJHV7uxEIgY+JbJHabrfGWkCL0xLJ/ashXaj4sJqEO4fanGeXooGFT/x8MfVFY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4916.eurprd08.prod.outlook.com (2603:10a6:20b:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 15:21:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 15:21:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com
Subject: [PATCH 08/10] qcow2-refcount: improve style of check_refcounts_l1()
Date: Tue,  4 May 2021 18:20:21 +0300
Message-Id: <20210504152023.322862-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504152023.322862-1-vsementsov@virtuozzo.com>
References: <20210504152023.322862-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR0901CA0052.eurprd09.prod.outlook.com
 (2603:10a6:3:45::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR0901CA0052.eurprd09.prod.outlook.com (2603:10a6:3:45::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 15:21:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d906d65b-f032-4b48-8a4b-08d90f104e25
X-MS-TrafficTypeDiagnostic: AM6PR08MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4916486D6AF65F2BD6D7BB0FC15A9@AM6PR08MB4916.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N+pGhJngWD0xiOFJcmsg6qO03XZM+/OepQeudvMEGueaL1y1pjQHHbsmGeysXuN7ZTY3P3iHKHb9jiRd9H7gTE46Lu2yMHazRt5gY0vNzn9A4RU0+PXjuPDrok8kgL3ZR220/zDUCALnWCwav90rTwIsFsWoIgOc6hCmGcIlupyVZQPaOeJgfxDcjQw03j1Y9XO2eAPBLJosyJ0YZltQrdlSByYNJMv9kv6oeqIZSgmM8gqG7pcFD3L5lojmtn5m1WsZcF5WIp8CnOoWsEjpMPFJa+YZVlzPStvbJh0bLLNoTMOV/OqQBP7r950Fh/PLJYy8DNJMu0jRto5sxIJ4RTfaITEaZM7w48tBsG7DveD/7yTR4DncZNITxwJ6WkcPTnDjEcWMRrZEa78mYoL6W4OlxoMh9A05DRJHzCEYD8qL/bdaG1zMuyOiJtOMBinEbiYCM90vPPUsVnN3eCQlqnER8M0+bWWOF5vx0KddAIDVYiythvazJUWh+PAGYO4wbMKxkYiouxwS+duMx5PAzr8M1da8vyulm1mjgkE/9idCuGFxDh28u5GLW2nPDwcSsAfp8svGlyet3cP9x6o95AuUiCKFNVXoxYFkJXJzrnu4g6qaQOXiwdizrBUS1rJ9CpoY8WYnTMyRL0SdJ/OEK8mcGOhJl6j8D8Ciq1iuUULFaUlHzT4T0jxl2hyf46BJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39830400003)(66556008)(52116002)(6506007)(66946007)(16526019)(66476007)(5660300002)(107886003)(36756003)(8936002)(4326008)(2906002)(6486002)(86362001)(186003)(26005)(956004)(478600001)(83380400001)(6666004)(8676002)(6512007)(316002)(2616005)(1076003)(6916009)(38100700002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4JeWhAtovyEVU9XoqYXINfCQ9gHIsbsgNyu9d6k3Nn6vHDhNip/7vJH9ml7f?=
 =?us-ascii?Q?rRLTPWf1iyUfz/+pOyaM0iDmcy7L7SSICKCy96HXGWyoC6onpI6DhNsBm8zf?=
 =?us-ascii?Q?JWoDC6lEPTwYsSe4xUsZpHZg7127aHlVyPSg2Zpb+TK2S0dJFLEdla7W7S3w?=
 =?us-ascii?Q?YRllLXqZ7hS6ky8ZDTNq/oKsa71/sfwRtzreAI6Nq4rJ7UybpTHJs8kB+PKr?=
 =?us-ascii?Q?6lHvFOPGioWDCv4pWmctwVhmue8h1K4KPHQ2XGcXY2Cf+ddhxZDNdzu5TO/b?=
 =?us-ascii?Q?elwk2C14BS1wbba5gV3ZKl5maIPqbs0PeY1Tn2zugknpqSJdL6s8NF97v2LX?=
 =?us-ascii?Q?jn5NUqelKBYGkDLtpSDAdX6VWhejTreJF8u+uf5EesE/qpAF37kIzvRGaKkp?=
 =?us-ascii?Q?NoDy0cufpCkX1hq3vRtdaJkm0IpSacDTqYAYhRxfcCH9uC9cL9ZjJxj1Ziad?=
 =?us-ascii?Q?Qa6bwsc3ovgnk9dfP+MCCMNf1FWD7W/4wP9dd28HgG3boWAiDiGsAQhlHZVk?=
 =?us-ascii?Q?g2O8RiOdSXJaWQnWOlx2Rzn++q30ZtAqnsbHPWNKaJhiRXQdmCK9OK0Fc8wF?=
 =?us-ascii?Q?hTs6f4dI6KlTeFRiaHSfBhyXxaAlgKkmFEWYXge3ckZB8OhZacufGEILc0CR?=
 =?us-ascii?Q?HAcDl8RZ7hscbB5VPDhS+LSxAFXjmgKuryXMWVuY57GyyH/Ej4aneBXZev/P?=
 =?us-ascii?Q?2m//XjAKqA1drKqkZs8y9qPYsViHnZw6VuXdiK9IA1etK+tU8URzYAaYbwY+?=
 =?us-ascii?Q?fRCiwJqL2g0BJlpPWdnWrq6Gu1mcdGTOc8ebvk24DvXPUsaLkdonlgcdLI4M?=
 =?us-ascii?Q?liqPtfKTYQ9Z4DzuNPLU29xmXf4SmxKPVGwnnidKQFvhgbL2sN2+IqDIeU33?=
 =?us-ascii?Q?o97P9q15xCmNhELF6qM2Az8HgoAKCJEMPN1Eq0zRJo/ATJIdb50UsDag3y3X?=
 =?us-ascii?Q?pgzC9WlJcuNNHRP2IN2+QcZtvo0IcNJZJRIz++flieEInyQwSD2GuREOA6Lu?=
 =?us-ascii?Q?9r4VGVyu10cB1vqlPKXTJiM8FJ5gYwEKJ42+Ars2E8uaV8QbQc0rxAG0T47k?=
 =?us-ascii?Q?yfJmtRJvVprtBRAtBmbbC3o8s/cfB8olllzXmMOtzJiQFibJNLQMlNIIqlPj?=
 =?us-ascii?Q?nfjZoWHhybzCibcj2OEfkBGkcKzFwmtfXFvlNoJbo5fsPfXVNygP8l2kc0Cg?=
 =?us-ascii?Q?on1o5DLi+8I0lkR5MrNzk/zh8tLGBai7kPJETe0cazFgxFBHZiY0uVPceH+m?=
 =?us-ascii?Q?BhGCNKjz4RxgoKtsmxGtLNjhXxz5RmY4i4gQPUZBp4SZsgrTx+8SlrX+Y39D?=
 =?us-ascii?Q?U8dvgu6G2VbC0TQnOKkURh0J?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d906d65b-f032-4b48-8a4b-08d90f104e25
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:21:35.6026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DP2s2UAmznFHHeASu8BEstzt+Cvn79Assy5ljy9lGW3DXXZ2VL0MpWUBt9df6I4NKTvMl/1QWiad7QMtipE9wF5hcN7I1p9va6xlQZyIVcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4916
Received-SPF: pass client-ip=40.107.8.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
---
 block/qcow2-refcount.c | 97 +++++++++++++++++++++---------------------
 1 file changed, 49 insertions(+), 48 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 44fc0dd5dc..eb6de3dabd 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1864,71 +1864,72 @@ static int check_refcounts_l1(BlockDriverState *bs,
                               int flags, BdrvCheckMode fix, bool active)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t *l1_table = NULL, l2_offset, l1_size2;
+    size_t l1_size_bytes = l1_size * L1E_SIZE;
+    g_autofree uint64_t *l1_table = g_try_malloc(l1_size_bytes);
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


