Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14815A14C3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:46:15 +0200 (CEST)
Received: from localhost ([::1]:47244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRE7Z-0003LB-Qk
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtX-0000gE-3v; Thu, 25 Aug 2022 10:31:46 -0400
Received: from mail-eopbgr130132.outbound.protection.outlook.com
 ([40.107.13.132]:23550 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtV-0004pj-Fg; Thu, 25 Aug 2022 10:31:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETWhT1oB+R1GNTeewXe5SEW2ewOeqKkeL6N5A8RD592thSevlFdaihszUoKf9rb5AePQJuP8JfVCF55T3JEZ2k8RvwZ229iymYaGf6GHL7P26z2x4+cZ6nu4lflnWSCBYfIaPKQwfJaZkQ6JFQSNZTgD/6C+Hrw5ZpSLmkQOcDpbGWxqO5/3pPBmlRPFQKbVUdIkq/IlNXOCx8LeN3XeFehw5I+rgazW/2+DyF6yMl5iFkWbNS5vxl61TkuCRBqpElhgkB5xl/2pOLGvcIgUfvHBq7nGZdw4qfCCALsfb0cQKCL+Yy2FRg3euE97Mfgc714NbBHiIdM4zlTB7wwGRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arrAPOJikaGyeNEaTWhS7yx8/exfEpCQTqDC8N98mzI=;
 b=geyDsA3QTMFMVUNL/RVoKYuC9/n8H/oMUV7Q6gpE6Rk9n2lybfndGFkSI/dSkZX3Pc1V7+kjDsOynC3Dn6SLGaJVjiHetWqJKPylA5d//Aqs8uqMoMjhSd2wPY+OHfWJBWMCh/BdFSxtjbyls/5tLuJ+bqyIcRDZ8sOgcbsXUAqESKyeUI2tb4/tx8I1tpcta7e0aFyyjrgyrMd07CjPox2DdUFgzr8fkqWVQug8vrv4bh3ikE4GNTWiB/xBSn+BBhdevS/D5o/057+H03AecNDo61l/Zus0yxOa5owWO0qmHTu6QSsdiUQ1zNDgPcoBs5Ud8N7iGdqC+nEbrGSXmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arrAPOJikaGyeNEaTWhS7yx8/exfEpCQTqDC8N98mzI=;
 b=jg3+2riBRJDEMm8f7BGLI5/lAW0aZp4uA0SN59p4OcXb+nHC00UB7gU+7dBTMZ2t9k1nOimd1g0nfubvOAYc2GVzJIuersexaExMuQ/rTe1+eCg1IPCLOQ7UbYdMxCpCUXwtL3nEdC9RSzdgTkRAvEodIA6fRhrXCjF9qs+YpW7qS+I1AKugdm0v/0rIdpf585uf5PqpmLsFxbsrBCm4YBqtopHD77fQfkjZV8lTgH3/AcW8wERWGt0gdl+B9qe7pO2aCrFgKgJsSEi0Alc+mgUmN3nCYaHP7BO6zmXlwQ2bFv3yWVlXJEEw8gUjcQ2KCmxXstr250sg6qzF+OWd3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3569.eurprd08.prod.outlook.com (2603:10a6:208:dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 14:31:24 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 14:31:24 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v6 09/10] parallels: Move statistic collection to a separate
 function
Date: Thu, 25 Aug 2022 16:31:08 +0200
Message-Id: <20220825143109.176582-10-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::29) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b0deb3a-4b19-467c-5f05-08da86a67cb7
X-MS-TrafficTypeDiagnostic: AM0PR08MB3569:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MKhXRdFVuyrjgA6XpCRHFdUQSbBZ3laUexFPQ/RD3Lxg7Qvr8kZrmCj9pz1qeiVSqHzLlpZsMkJXQyVbaJxKGZ0pVPjygcwZSUkPcnwuV+o8UxhVo++W2qx7v1RTBLhAOr0JQdz8Hl3kHkhkfS4wXC7+GP+QU313hT5GHXq7DUNLaX92fLAMNXq0UguLGdv6BYshzH7bbeX9am+o5RaBzNCwaXdnJFbCbwquEicahLEFAt/1Wevf7GcoMJcD5s0GsYueJ2SdmZNyp4Vn/cCTUTBzBFbVX9UhQnorUQr6JWtth5763K3nuqh1rMCZ5Rd+Gi4BS8egDm0PXHVzeQd8a+rpvuL8Rx+QyNxECDiiCNY27UVUoKPhx47XSBzW3J+l/nvW6VWSw1V5akNH7a7Caik1H4IJws8FLm3eSum9QbT5RgjvfhbWmQr1ykLt0ydPR0FGlBWyHqFWc+En42h2IIdFxye2uP0Ae/GV0Ke/Wt9FxG8NeML8oKvC4PTblLSxkwS9y5ITkLQkQ4Ck9dpPxyULBLzntfLzugOViv4ciWtPvQZH9nLaD5qtGF/llS/SpN31/iPHzEX/pX7SG+LDTSt+zbTBhVlT5n78PKUKXdULbR0rQXYE1tbl1EHhPAugM4TUAevS+8l4DrnemgppDGRVFgIoMwKSbraez6BkZaZVbYqDk4SwzZ3tutqsFUK7nofby24Y7O3TZqYxNDADWMcQV6VTTpHDzpUPECXo4vv9eU2hIDfb/DdS58KbWoaj3Hx/p0qxqPK9GmfMc/V5zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(346002)(376002)(39850400004)(396003)(186003)(2616005)(1076003)(38350700002)(86362001)(66946007)(83380400001)(66556008)(66476007)(8676002)(316002)(5660300002)(8936002)(2906002)(44832011)(6512007)(478600001)(6506007)(6666004)(52116002)(41300700001)(38100700002)(4326008)(6486002)(6916009)(36756003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h8o4iGXkYnizTWQwTH0e6VPHnosdKcaGFs6SVriTY5wgnsYgazMszFBoJ/20?=
 =?us-ascii?Q?VS33965eyM3m4seLvU8+JRdiua4FvOuOFmJxPtnls14pt4yN3rVlzEJgy5L4?=
 =?us-ascii?Q?Zv+5VAxnkzNjK+saC+t7JqCs1XppSjifhj+M6oxT/wcXtt3BuB0Aplkn+lxR?=
 =?us-ascii?Q?CM5RbeBuknBwUH80p8FRDU2iMS2FwJFGNICrKB0kFZUHTx/5iqCg7RA/PnGQ?=
 =?us-ascii?Q?IAHdlu3SpW42FV6mIdBRUATDI4qUfPngFPfJ2NhOoWn/5jL09Z8LPVDhuh4/?=
 =?us-ascii?Q?tke4+J9gyI9+EjjrdxZi4zwnhRGYKdfC4tuHxm/d9cy2DTATnXoc16QmbLix?=
 =?us-ascii?Q?Qn844CXTD3Zil21EIOqdkYQSAQBARy+0plOEI5ry3bcHMnWmXiJ/t/L45TTv?=
 =?us-ascii?Q?QvcjL8QHGSsTve6VemlJofr5sYXJNVDC2piOphQ73gCXG1H9OhBnM7CDL28o?=
 =?us-ascii?Q?ZZdR72EptGhshYLePDBhcaIo14xkL2Ki6uTFTArY/129dsqmTqdEBryES+rn?=
 =?us-ascii?Q?v/arYQ67zlwP3MD2B/k1F1Z50Gx2tDA03d7iLp0m/FJEYNCy68ZK3cqkdhc1?=
 =?us-ascii?Q?qh8Q4Ump/9Z6e/iq+OUNjhZuIYGhdO2F+kUJRBQRJa1o92X4HHNkJMuNMxDV?=
 =?us-ascii?Q?KPtzRLc3wjvBckaQ2pdUWdb+51GqwbtnCQgWnbORjzN8945B4ZzRn2Db97fc?=
 =?us-ascii?Q?mTH3n+D1SSgET0WmD72PsOvz4NWsg0RFoAVliPbs37MWKYpPv+SUxfYDMmBe?=
 =?us-ascii?Q?d5630LbaDk9WjGHi4Rcx45Dho7GDs6nQBMK9FfWJ13j3ze9AOTGNbeXMrYrs?=
 =?us-ascii?Q?7gEV/13upGH6A8qAKYCvJG0ow+jyWXnhq7i2EDTVyttgO4owZRsYHu2W6bYr?=
 =?us-ascii?Q?bvmIu8xQ27YNHq9GIrf1/jwa/ZZwwJarSxEhVYocEqTd5lp3aTc5jXR6DdRo?=
 =?us-ascii?Q?QGQZZRY2npOFWl4sExveXb5GNhzKTJD73RU7EsS+2l60WCUQxafrvrNE9F4/?=
 =?us-ascii?Q?y3FduegbIA31jhCVBUFQZ80cusoH20Zf5g8HKUJ4zcaOTPVD2bHzWiqyvIO1?=
 =?us-ascii?Q?2Qv/rsoaEE1wLFJQTKEwWGCQ5OkIdNNCFf8JL46R2Ofq8ejXdUz1ea8YnPFc?=
 =?us-ascii?Q?jQQW5YW07acjrToyKQ+07YIzqJyAEDtERO7EqS0gk0CJiuwKuQZG4Wc/abRj?=
 =?us-ascii?Q?s0zHN6cbJ7cOcpdZsiLJOqD2+HWmXYE5fkOCP1FnXYlE/4XGTBa9fHBQkQZV?=
 =?us-ascii?Q?LW9QpzsevQ1wgbrslncIk6iEfgVNkuBA9wpy2xJGa11QRDM9RX2hqlHO4J7v?=
 =?us-ascii?Q?b04WqWEBjeAfrjWxhNTIo7xDYpHr0mqpvEcbiMheL2jliDIpds7hXPg3E8XS?=
 =?us-ascii?Q?z18Cr4bd6oU/zp/xX7/p0qolFich9gTtdu/kYGlNSqbCv0Zc1LH9vX2CVxks?=
 =?us-ascii?Q?8gHLz/sNs3eX9EYYbWwGWK2rZWZilWZEYzy+oozK3vm+jVeYzsTSSHB25AVK?=
 =?us-ascii?Q?1X23gU5kii9Kc/vrTRIf9pBFTjpM00a8uBUPU/BBu0QrtNzLrGiuU9KnDTfH?=
 =?us-ascii?Q?ydGK+BhbK4b1Vu4ZSjIoO9anKQySuFOHpHtaOgcMQEHhDlvu/H0mrqOXXVTu?=
 =?us-ascii?Q?cIJphrYp7K5yaB9BsDbTLV8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0deb3a-4b19-467c-5f05-08da86a67cb7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 14:31:24.2524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwQfGyYEGgZexpeCd2ftmKZEsVCFabuliQFd1cuTq8EptJGd6fMClkwbRBySiVmB27+4gcUwIC99K55gHebHOut3HHlVsDxDB24swMjLvSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3569
Received-SPF: pass client-ip=40.107.13.132;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 53 +++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 1874045c51..eacfdea4b6 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -526,47 +526,56 @@ static int parallels_check_leak(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static void parallels_collect_statistics(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t prev_off;
-    int ret;
+    int64_t off, prev_off;
     uint32_t i;
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off == 0) {
             prev_off = 0;
             continue;
         }
 
-        res->bfi.allocated_clusters++;
-
         if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
+
         prev_off = off;
+        res->bfi.allocated_clusters++;
     }
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret;
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
+    parallels_collect_statistics(bs, res, fix);
 
 out:
     qemu_co_mutex_unlock(&s->lock);
-- 
2.34.1


