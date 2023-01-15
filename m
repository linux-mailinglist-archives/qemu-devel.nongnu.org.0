Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BF166B258
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 17:02:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5PB-0001kW-HQ; Sun, 15 Jan 2023 10:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P9-0001jQ-Ug; Sun, 15 Jan 2023 10:58:43 -0500
Received: from mail-db3eur04on2130.outbound.protection.outlook.com
 ([40.107.6.130] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P8-0001Kk-Ab; Sun, 15 Jan 2023 10:58:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KP+ooVUzmTZnDwxW0NJjlXEtVS55WyVwMxk6bzZ03cj2iPQqXp6bQ0F0H4QznU9aBAjx2ZYEo4kX4yKPYxaIjlL9i63xleNd6LbqSWGlUvCKa2Rq7jLLWzX5mqalwH3ZeXwXKXcuF3rauVMoNqvCovqKRG2s16xptNrHrxdnHnVGHdEBCEQF6G6ZZOWJV7XbM+1TcKXCSNZBPp8fnf+fNJMf4F+AKI+pmbP94dRDVtPWKox/F5QG0n3uhpY3mZ2XrhwTFLvNnNT0Z7U4v39SdpJ2OnViOHGaNKWbApYf4iH1XS07WCcO1X1zKO96T1qedYN0Qv17MHF/Px9rP33TCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geGN+NrX22435C3Q3VUc7ChRkoMS8dsEkQOqFjwtgk4=;
 b=PFxV3y3Xx+4l3ptly5gQ0DX92mfjvfKxr7pb6+9mBmt1S5PomMe/Ow6t40AHUCyqnjHfah6E8mYJmVaA3BAhF+rTw1ycPUXzbuIxR4rxcVw4Q2E3MslLu5D7NM3q2qf/rmR/xLV6UkcDN+hsTD4f+NfEImI+4QSpBBRS9IwHiuEXSuU7bNHmzBtFCBn+X1e6bqDl8IbQPRJFoGS5VhfZCR1FdCto6LFdDCcJLP/8xR16xdCyfVKoPYkGQ6646zbPp42sNu4khNa1cTFEvbRMU6LViCW+1pegeo7R/nrJ4+Qi/kvi1lE/+E1vqqJKK7WQvLpjrsBg4N5kbG0ukIt91w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geGN+NrX22435C3Q3VUc7ChRkoMS8dsEkQOqFjwtgk4=;
 b=hId6W5xxtF4d15lKkYtfmsYIiI3YDXKB0q1lZqLKukch/yZIdRwV0ZNb/6QYtgd0+fRveCntR3C6kANn3UTl1wSx+TK+DP+XCLfpwUQM82KRuvNnfY2LNITJBA9TUtQiFMY1FfECK7MnvRH2MTW4vgHNe0+yoQQy9aQZw+vnu6gDtc6vac968Uvra4qM996T8zVgreQWSgPfTdtNkxdG2hWjWCz8nVWMRjGA3QpKqhvGvqX1lx6wcp9FZP3CskhIR3OxNRqRRMkkI42dmwro/pKRXvJjtw9be7Jvr/qq+GiL4TLnTYRsb15x9zYIep4z5eJLeh9bfZzDI+eyXikuTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB8PR08MB5467.eurprd08.prod.outlook.com (2603:10a6:10:11b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Sun, 15 Jan
 2023 15:58:34 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 15:58:34 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v8 08/11] parallels: Move check of leaks to a separate function
Date: Sun, 15 Jan 2023 16:58:18 +0100
Message-Id: <20230115155821.1534598-9-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
References: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0312.eurprd07.prod.outlook.com
 (2603:10a6:800:130::40) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB8PR08MB5467:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e082e41-4328-4059-49a2-08daf7115a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Esb5MDPWbK2N2bzSwNeaVzaAU8x5Q/s8r3+tLrqLqWpdKojBu2RTpN5iUOcPbDhbKdiVoVrWsxJ/Ty19keWW+9fV+LfwJuLNXRNU/ttH6nL/eARvTqoJFsCLR8Lw48YqjpFX67NEAKfY5srcMIjjEf7A0muJYNKgxrRnNzBZrS5NHPy3BIdl25HvlKc17K2goeX+825Z3HwPiIfmK0/pwELRdGKcSxQAZq2sr/6LPCtXw+l20wzAvHpqiL341sK152hwZCUfl1MwD6qwpvZhrBUWaCr9PhAhvDpbp8KlIT8psT8xoJv5im3vP1d8gb6VOMfwdnQb1gfmqw4KK6pQix5AbzaAhLjfMoe8FROgy6oreMjWOLmTygWvjgC7DRxHGMb8c/59/Za9be86Fugbtl4Blcmh4nvEAioQoVNNO3cj3Fp9kyrrIP1/bHCmsSVscxZTGvPCtmH8ojds29Hr5UHXajY8/RsX90LhhtsJmYGKBqgTm51sw+PS9f9kxrtAkcdl8k27FdxNajcTv2/q5nOeOI7JKFupmp8IMhQ56EhUdnRB3B04dmtq362zAHJ8NTGZ3mif03KjrZhx+pkHFeoOgFl/nLW9GpxEk+b3nRLfW+se4c3CPdBZkhRySVxmDivO1PjmU4ePMg70mKksSc072pXW3+y2FGH/i2OHrplvTLOQFRQSeKMMlzyHvSkpCqVDtmoub1J1+VeRZRj2PQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(346002)(39850400004)(451199015)(2906002)(86362001)(38350700002)(38100700002)(36756003)(2616005)(6916009)(1076003)(52116002)(316002)(5660300002)(66476007)(44832011)(41300700001)(4326008)(8676002)(66556008)(66946007)(83380400001)(6506007)(6486002)(6666004)(8936002)(186003)(26005)(478600001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?18Xxw0WYMm7vHxgjd07Sq/lYlc/P8iAZcN7QlSJHnEb8Xamou3fLWVRypqNZ?=
 =?us-ascii?Q?JpNaCA4EQPufGACITeWHZON5TKkWTCTfD8m3HRFiGIClIUBPFkC2tlr6n9T6?=
 =?us-ascii?Q?fo95YA8lvguyhNNNZ57FMrij4EYxmxd5DkZhsVvC5xliIlneyHw1AyFWsdS5?=
 =?us-ascii?Q?sSv10w1XcHHm2gfgvvEizNhzjaJxr+EAW4aqD0pTQ8WH81AwF9a5BgSDGjdU?=
 =?us-ascii?Q?Z2fkrjMITlS3t31fuAI2Tz8chYyuBT6EUN1E6UOGD8GqusJhmP2yxhL6W1+q?=
 =?us-ascii?Q?syMRoR9pAetuBYcllh4dEjIP8dHnlKK9YlLWCxD+R9tdFf+y96Wu4XOaTkg5?=
 =?us-ascii?Q?ejbj6AAskdBiRd0cq/2FHh1OT3CdOFSPENRVQr4hM35pmc9niDLzf2vk2bEe?=
 =?us-ascii?Q?vHTXxweiR2AvnufRqzSvjNFM7U+x2tbEVgU1YlUmezCy5CjbbhQ/V2yPSgIW?=
 =?us-ascii?Q?RQWFmqOeZTEbyFHM1JE2F/7clrV7dAA2Topiq9IvA47+s8bH4zCXFXM/e6y2?=
 =?us-ascii?Q?kgZEXY4sD+vZyrbe8219r1iUZAt6fixUFKJ16KCnwIyvrC0vWOi/IP5mxQtR?=
 =?us-ascii?Q?zibX0bnDY8Vy20Vio26m4Nn5CwDQ5WvAr4RYVKJryB/9RQl6joKJd+lvd8BT?=
 =?us-ascii?Q?HvNZvUDGi4wVN/RIkynvlBbAI3EHOkbhzy2uLwPuKhKP+RiEceAW6kXMl5IG?=
 =?us-ascii?Q?XPZO1HCwJgXqm1AGvANhW4hRfiaKX1FocoZEb2fCQhYT372D1JMClDqXgraw?=
 =?us-ascii?Q?tQ5H+e5XiQBxRPFy/d+H+bthJoeT4N+TWD1d2Qv0YdlepRLvNRX9BbihCoU0?=
 =?us-ascii?Q?48oQbvnjAG8sNW5cyPlz8IhtRBiwsu3ZgR3DpU40npLYT9iW6JcxEmXXqQhB?=
 =?us-ascii?Q?bkJw0fUMOf0Yz2EOta+KZXMlSny7GrZiqfh4b659FIOvPnTsfofZYLtR3gxJ?=
 =?us-ascii?Q?1B5rt8YeNUo+caY9d16II7m4cW5fA/HnzhjUXZiWCagu1WYmk8GaS+G963rO?=
 =?us-ascii?Q?PwA+glxh5MBM70SZxoIO4yZlynzZx+4q81gHvTW+qQfoA8CEwZxK+AuMFLDw?=
 =?us-ascii?Q?6B6hP9qn3ElCR6mrObMM57IW04z/DxsjKbk86A587Nryp5Uzg9O4mMpnP58P?=
 =?us-ascii?Q?TrKP+BRj6LmlMVlO4YnxYJRkDvUxs34Vd+fLr8xYklmLnw9/PU/SpM/Y9KRt?=
 =?us-ascii?Q?1Pzc7OSVtSnO9Y5rtaBtTR2LIlKVWmlftFflfe7Ed3dqkADEVvocGRADRGVr?=
 =?us-ascii?Q?hxCB7WvAEkQ7zBHpvEC0d2USIQWV45i+snZCYgx+d+xQz3Yz2RlAXKRBo0q4?=
 =?us-ascii?Q?40QCXshCLO80MlKSLTVUxaExHqkgUBNJrrHOaKYPeYAT8uYrn28zh0NlyFAm?=
 =?us-ascii?Q?SV5vyd7vl3JAqVB4rqzM3PPSH+EknY0Sa3Snw4yi54FIU17Dbp6Jg0byjU0u?=
 =?us-ascii?Q?DtOuz38L6iUdWGwgh6BND6cdkvCwK0CjIFLgp1E+M3V92E9EyA3CwE6EMarQ?=
 =?us-ascii?Q?NHl63yjl2KbJr6F9B0V9emQxnScpK5ivzYBktkd3Cb45nHmts/SLtsviKAtJ?=
 =?us-ascii?Q?BF5C6/zR1lHq4xoR7tndyL2oHzgAY1gpe5ZhsTYfeW458bY4MFWimgF6P3FR?=
 =?us-ascii?Q?pgV+Z8Mt5hPZnPqTgBR463Y=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e082e41-4328-4059-49a2-08daf7115a99
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 15:58:33.3784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2IMNE2snfvGuoZCScQMOcfFJSSGGqxUL8CkZtao0Shidqcp0pG9bbYIPZmPax8ng9qLj0zsKunNmM8EkiGgxRCmdkOyWZKG2Sn6FW0oWDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5467
Received-SPF: pass client-ip=40.107.6.130;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 84 +++++++++++++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 32 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 3d06623355..5db099b1dd 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -475,14 +475,14 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static int parallels_check_leak(BlockDriverState *bs,
+                                BdrvCheckResult *res,
+                                BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off, high_off;
-    int ret;
+    int64_t size, off, high_off, count;
     uint32_t i;
+    int ret;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -490,41 +490,16 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         return size;
     }
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
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
-        res->bfi.allocated_clusters++;
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off > high_off) {
             high_off = off;
         }
-
-        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
-            res->bfi.fragmented_clusters++;
-        }
-        prev_off = off;
     }
 
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
-        int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
         fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
                 fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
@@ -542,12 +517,57 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             if (ret < 0) {
                 error_report_err(local_err);
                 res->check_errors++;
-                goto out;
+                return ret;
             }
             res->leaks_fixed += count;
         }
     }
 
+    return 0;
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t prev_off;
+    int ret;
+    uint32_t i;
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
+    ret = parallels_check_leak(bs, res, fix);
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
 out:
     qemu_co_mutex_unlock(&s->lock);
 
-- 
2.34.1


