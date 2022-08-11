Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F358FECD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:07:59 +0200 (CEST)
Received: from localhost ([::1]:47090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM9mw-0002Ba-MK
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gQ-0002fg-Pr; Thu, 11 Aug 2022 11:01:14 -0400
Received: from mail-eopbgr60138.outbound.protection.outlook.com
 ([40.107.6.138]:46683 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gO-0003b2-Tu; Thu, 11 Aug 2022 11:01:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZxh6T1DBbLcK1ArRrsAoPkj72RGKpZv3Z1Y5cA3OG4CCQWerJXYUfwgnYqiJWwCkb/Z4ZP5Uu/c2/+gI6od7YOeQbkO3DZ/21aKhTf8FhSrTAZRhFlYHn6mhRSqSPEYcW3twQn3+/g2CUJFoPkqouhzsHVoLk4jjVgJaAu8KcBR4HqsmJtFRIq/0cAywPNqZ6zxZomI0Du6GRfguQE4LlSk/4vyLW5xJWU5u9rJkTEZ2SynJDNT/VLbwMQdYVVvobtkbKPs4NXC6l3WySSrM92BPgF7L45tho82VfKsh8q/WcIy5NFDw6cbxbpU+GXAnJK7sqPbuU9T7oF8wx84rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thUbh96sABitnUnEHNhzu02PjOvbLR8/JQHvhHNVqyo=;
 b=d2LDpPauNsI36R9XqKvmGAIiJtch6ZZmXBJmt2WNq27fAkssNXjlhOFXbMznZFIGQ+2ciSnEPKpEKpJN30eC0jEAxF0cH8JZtE4h9rkQR6a5ZqQkhcBqv8XWo+7y7RcyyWMvfgWex4JdjwxHZU/8A2Et2Plbmtu8N4h4E2D+ShXOp2FZTF/5iDMAjG8XndKOqfhqrw4VsWdeaHNNbexDeCvBCpysxE4i32ye6yWmgrFOxeL2Bq0fR893Ce1lHfvR5Ab3tlajfO2OggoaVJg0mT+oablRnCEf2hbJ7AC4GlSF/Q4Jh9awyEY/v8Oo5M1Nd5uUxfHhNoSu1FCLLmuICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thUbh96sABitnUnEHNhzu02PjOvbLR8/JQHvhHNVqyo=;
 b=i6ztwBO72WsEQCiDTQit0LAqpZ4Zp/VWVuHN8H0/C7c9e/3JsG52VQJf7GMVfoUTmd39jHJK+qM9vVWsE1IeHi2DZaTZc3FVAjRaZKpijHG28v4GNgQ5dE4eOuKrwW2jlvSnc5IU2kHcNig7SX33zRIGbHLvez7gW7IBKUbHWFkFHuQFHHQpBNQRkG5vm72iNTk1HIMk+yock5+bXUzUPqI4w7NrR+9mf54VLDVenfCyHVpcJJfoDPLBaxnCi2IXHvA0bfHnAQE/48hZjgkjB6jx1W/GjXkVEybmn4FOwgxgejGFnzxd75DzYv3l+XIH9qGv+/cxnWrdzyBidVPFKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB6521.eurprd08.prod.outlook.com (2603:10a6:10:254::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.18; Thu, 11 Aug
 2022 15:00:58 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.021; Thu, 11 Aug 2022
 15:00:58 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 5/8] parallels: Move check of cluster outside image to a
 separate function
Date: Thu, 11 Aug 2022 17:00:41 +0200
Message-Id: <20220811150044.1704013-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a822794d-ecdd-4bbc-09c9-08da7baa4c8d
X-MS-TrafficTypeDiagnostic: DB9PR08MB6521:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fga+2yb9Qzxyo3zSiG0FyzackoxH1n3+rZcZZk6nvgxwCiA8Lw8wdkYWWxZFmYe+W3KYmcSIpIX9emkT+68yOlrEE1/2YrmtB3oTlNoodC1awurbzUvhBOIeOVXIrxT/brBQA9tl0Kf/2NeomK8dQViajkd0yOeBW5+2CBeneqmqak7KEETOIqai54mLxy7G9oYF/L7H8vPzEPJUtvCoKiyr6lOmZfAy41ihekvJCI80e1vsmoxeX6FfNkuoShcNiryaQ4RSnM+wZTBJtLARFQZlwyvlyKwPcVUZEzSRDZS0Bh1/3hZuCQKNp4i/ImzoIMw8gAutxLR04SQtrRmJUXv8WFWnmHezcxtDDljGT/Qcm+mTINuuv/BIfD+R/KwJCTIjXIIBSj3Ws4nkp9ATPHqGgtT2QHoCpKIE75FA5snGtHKpV5PlH9gM+p4nkrl9lpSR2fjVcRByt2bFAw4lrmouRCqBWdmhlfTM0BVMXL84YEnsrXQJA4iWK0pQKTEXeheijqyFLSvroVdKuSTBLyiu7kiIful41JywIEPZae1KrP1cxLDTXS6cHjUz3PvB9bSKzA2ky2gL+qqbo5Xa7VB9rs+2G9jeXdSng/Tw6q5nJgQ2CBq/obD2AcviTDocVtLX76ZdHj7tT1TOHibrmfwwxwhhhrb0r7t+qhLEJnOdCIvAhRqMOnfbQWW9IO5bMobEjkVLHshFg9aT0a3BqdlsWXGJD5mtf2r9jRETkHBXawGVQsbyyWOCXxIcl27+KRY2djdeH7tJCdzUhU/fw2BPE5+AKRk3gAe2F6jgTMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(136003)(376002)(396003)(366004)(346002)(6666004)(36756003)(6512007)(6506007)(41300700001)(478600001)(26005)(86362001)(2616005)(1076003)(186003)(6486002)(83380400001)(52116002)(5660300002)(4326008)(8676002)(66476007)(66946007)(66556008)(6916009)(316002)(38350700002)(38100700002)(44832011)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OuA/aErm6rwOuJuRtgOWpQpAg0BF6mLWIOTyaC4B2JhiwDs0Rv9YSoB2lup5?=
 =?us-ascii?Q?8iTd+3l1dS/Qrs7jT1XjoRCWtWchZA6nwftZ8HNAQJWmKtkl0usRUEuYpuUb?=
 =?us-ascii?Q?Yvl3aDSB1X8i05ariiU0aVqiRMyYFsiunuDENJmDUDvN8WA1k3pT6bqBh3FI?=
 =?us-ascii?Q?EYIgjuMck7h8FBUUsiWnh5FT42nWOb4b2dwwPNyIHC4wuTAXdsf+hItjowvh?=
 =?us-ascii?Q?ck6fyf65fNhAFUOPosfyUgmVmYkT+ggXXncxF8sLYtWuT0GhrjmOexXOCFIg?=
 =?us-ascii?Q?56/ePUkv/b+v7+aSXjA3c54b+8CVJk5Nd6mecZlq5UkajURLIzJuTfQ3406U?=
 =?us-ascii?Q?XQBl+Yfp9js4jj2MVD3cMfOIVSQ3m8ZNNv0xk+XHaQeRHAzCEF6yiOvjpONx?=
 =?us-ascii?Q?z1eZKyEgAtjwHVIa9tohhToZx4x/HGE8lPnrWTbFi+isjEJ0lRAbIzskLri/?=
 =?us-ascii?Q?D4yqf3IqNUIIGsua7Y1Xoc9Z85Vn4gg6cgH+PnPPHj3XXCLKZNd4ROHmhgn0?=
 =?us-ascii?Q?Q7xxQyb8ZGYR/HjiRzdz89142wcD5f3TwSmU5ardmNlHBbl3DK1CW+ckg/UK?=
 =?us-ascii?Q?0V8D7Qa+TR6/9h0AsQXAicSgTPnafEo2zhJXn2zgnvgC0FwsdrH4rNH4lubf?=
 =?us-ascii?Q?tX4djMe2CHzZItKuhypQ6xyH0mLCpMLJslaE9no1IjgglKn2RLeluKo4tszh?=
 =?us-ascii?Q?Fbe9tEziEDT1Mj/TrimGoesUsMlB4umFjC4PwU/6yok+djYqpDJ9K2mIjDbu?=
 =?us-ascii?Q?sOGOomLdJhphKt951nRdlMLKRxCvBjRWInmN+9fwqHp5qXshYMqSchFEqYz2?=
 =?us-ascii?Q?kx0mqhHDPcSzRnnb3lECtTY/iqmdN0dgncxZmHvYHCUQHkniJdFp1FQ/Fuzc?=
 =?us-ascii?Q?FaiSTqfb0sdoDFAOW5ucVa9tiu613xtJpRwrfYLKT1QKy4DV2ptDWLghTMNC?=
 =?us-ascii?Q?6Z8LrvIXgPBif/LBlz1GV5DoP3QNp5Wf21dEvjp4T7Y3RQMez9qicifp8vdb?=
 =?us-ascii?Q?SlJvlHd7hv0navRj06sHZSgiDvt/apxAMk3C+BtEo6H+TpS+mG/4POdPxPRl?=
 =?us-ascii?Q?LELRorpbm957NHuUEOZp81pVOFGCfgS3xKkaVRohfQgjGcoEjRzOheWn03dy?=
 =?us-ascii?Q?RwaQ9FeD4IgqpwOKuvz8mw23puU0xtd474ZkvvJq7PhKgFYqOwQe3TxL1tpZ?=
 =?us-ascii?Q?oOdRTdwiCvcazrVtMCbac0HR1GZgc/cnj5woZLjtSRXgUQNGTjEiAJauFfky?=
 =?us-ascii?Q?m2Kk4m6nY0/Qbw3TDP2aINSpN4itpcwpRCm4a8xj4hNCryHB19yknjy97ub/?=
 =?us-ascii?Q?UQNn5mdWYVoUKnXIKGxBXg/kWV7aU2RRGsFOdGxqCwPj1HAredrOJnMCzeMs?=
 =?us-ascii?Q?4sI78vS0FjI5n3Si60ZmRXnovKelLi+ens0g/PzHcxu0ys+dNwN++fUmRJRP?=
 =?us-ascii?Q?mIdGUGkIGYjV3Jib7WlbL76tp5oM/2yLxQ4rbh2HknqsXTZ1vq64zfviumpq?=
 =?us-ascii?Q?BXOSPhibXJQmeEiim9Db2/w3Kd3wMCI7VEFZaJpUCqYC+aPSKY7LIx1Ceb5f?=
 =?us-ascii?Q?eYnIOL9Uix7gMUXauz29OflyH0E9vHPt5w9UE/f521qAdPGWncTwJgf412HC?=
 =?us-ascii?Q?IdrWwbaRQZcWR578jieStiE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a822794d-ecdd-4bbc-09c9-08da7baa4c8d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 15:00:58.6408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djNnhx9QNVLYGAN27J5PdXcShdCh2A8pBe4uKJb0n7foe6Yu+FQBIHCmfnBTZEnHdBu7EQsl3shwB3+k+/Gk56syGw2dXE1bmMpgjHP0nLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6521
Received-SPF: pass client-ip=40.107.6.138;
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

v2: Move unrelated helper parallels_set_bat_entry creation to
    a separate patch.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 48 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index c53b2810cf..12104ba5ad 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -439,6 +439,36 @@ static void parallels_check_unclean(BlockDriverState *bs,
     }
 }
 
+static int parallels_check_outside_image(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    uint32_t i;
+    int64_t off, size;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
+    }
+
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off > size) {
+            fprintf(stderr, "%s cluster %u is outside image\n",
+                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+            res->corruptions++;
+            if (fix & BDRV_FIX_ERRORS) {
+                parallels_set_bat_entry(s, i, 0);
+                res->corruptions_fixed++;
+            }
+        }
+    }
+
+    return 0;
+}
+
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
                                            BdrvCheckMode fix)
@@ -458,6 +488,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
     parallels_check_unclean(bs, res, fix);
 
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
@@ -470,19 +505,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             continue;
         }
 
-        /* cluster outside the image */
-        if (off > size) {
-            fprintf(stderr, "%s cluster %u is outside image\n",
-                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
-            res->corruptions++;
-            if (fix & BDRV_FIX_ERRORS) {
-                prev_off = 0;
-                parallels_set_bat_entry(s, i, 0);
-                res->corruptions_fixed++;
-                continue;
-            }
-        }
-
         res->bfi.allocated_clusters++;
         if (off > high_off) {
             high_off = off;
-- 
2.34.1


