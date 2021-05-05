Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB77C373555
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:05:50 +0200 (CEST)
Received: from localhost ([::1]:48290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBbS-0004Gh-0T
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBW8-0007d4-5H; Wed, 05 May 2021 03:00:20 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:33297 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBW6-0005pW-5Q; Wed, 05 May 2021 03:00:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/6Dqr4BqvNSY343A766J7vUrUtVy8J/rmYPOWIQrhIYqL8o5o47M39jKsMY5LBMgIrGNde0YZ5STbxV4wRj0gkprQnTYA4hlUIxkWP1NTh3EAjNzgs+EIrwbbNBDygRRMjBlvgfOI9L1k5oXCUFip7RF3zDZ//8F+/LXNR7DwQjVRo2UdhKkJrqsRNgliHmO81/sxhXWerZ+VS23vBOUPaSRBqsxVgX1IRqvRYXJAvqEq/uXmg5wsVXDiCrVotWorxy9eGf8wPjd2TvO/VhnSshhgtNx90tXPE5HyJf5bfULjhlg07Y+kYbJc1kXgFM9ajOFxpKrBtXQXsfxtxr8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hngAEev1nxwNGEj8FBZJ7ONnW4yWK2eBr0gvAaO7spQ=;
 b=V6lcO5Kb9qRShQgzosA2hqzutk+atj15Sswq8HaPBKh1Au6OIOZsvkmKYHvZU5f0A5TodbBQfSzbxHZiul+OpYxoMC/aMVbQTZyGf2oyWl0UTaodhhnfonXSOZQq7eGqUKANGIBbd6g46Yq8SKVrnsH1yulNq2hGYfGcIdwdJbueRM13eAOr9Y/E2/RpWyNEuZuX1J5XoXiUdfdUq27TzRnwF4rwqZ1lCSX7VkyxBw/Q8s8BxR2OdtJdnypUSSKdgvJUnhSNbf9NaQLufRxfLEV4sU2mN3aroLoZEOnfdsIeDvA3S9LzmUZdePiAJKmweraAnuqBaKv0OwjyIdTpZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hngAEev1nxwNGEj8FBZJ7ONnW4yWK2eBr0gvAaO7spQ=;
 b=mU1gC6/Ua+nIw0+zJWBgAm6ejwr/U+3GZviEwd6pc/zlhHVvypryty1jETG8yPHVmkPQDhIDIlkX84tHmcFMOLKT98DgkNNFrP/Enjq+i4681ONfW4uhulhE2w/mIoHviI23BrIZkyydRWg2y3xq+16Ua2PyJyOG4YDA6T/q5f8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:00:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:00:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com,
 eblake@redhat.com, berto@igalia.com
Subject: [PATCH v2 01/10] qcow2-refcount: improve style of check_refcounts_l2()
Date: Wed,  5 May 2021 09:59:46 +0300
Message-Id: <20210505065955.13964-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505065955.13964-1-vsementsov@virtuozzo.com>
References: <20210505065955.13964-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1PR0101CA0013.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Wed, 5 May 2021 07:00:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9638c94c-d698-4c9f-b288-08d90f936cd4
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652FC6A66FEC52AD2B23AD8C1599@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D3CYB5nYWobZKjtZEnZyAXQ9SUBXm7MRym4Mh0OKyeZq09RvRV1mkUPBjWZ4WLxC5BvkrNXqTyBNMgk5ksxJq46OCUdQyxhJcNByTv3cj0P0RLIi6KDPAl8+VguL+vgVs3L7pG+B34tzv1BNmuswHJkyQ/QetEizafbyCIe2E6FNSSeuQXecKz1iGZ+OC1hKUWuxdXBVpcUv1AArbkr2F/BWsc8QC5lwrwpxXK/AEbEUN3LX42BZ40XkehNGoPImAd+jCJYIIlIdWvCL/WZQjBfaU2m1xjMO9FZLkxKz4UtYGaBUDgKF9dVR+T0yrDGnGBVyI1Lc1ljfNveamuQk28W0h2v99j/WVHI1mVYZBpNqiql7ianidoWHAxbRBcD/Cm3+TZuQ0fCzPWmJeFvTKJQh90L98cUBnC1N2UoArUUKdGHeMxcDCKZbSqJXbUx40liFQnxCazrlGnx2l5rEWDdc+17XEUSK/kjwJhVhw0xfYo3mNGLbSiSl9fgxTuJDbKH4EBNdvuuUjdXk3xidZS9t7SOKRuWCdwMSoo8QZrjqW4srLLNOBR4eFR7iALWM9LfAAKn6eX7XeEbw56vdzZJ6hlfhwnVtojuT/xNRqAVzFSVv44aNl1f9iFKtiG8Wz0XbvPHXldseQN0y2MwOQ8kc9121cVQKnXHoIBZF9yLymj3oUGMyIu7vOJqs00J1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39830400003)(136003)(346002)(376002)(2616005)(2906002)(956004)(36756003)(66946007)(6486002)(8676002)(8936002)(6916009)(4326008)(6666004)(16526019)(186003)(6512007)(1076003)(316002)(38100700002)(86362001)(38350700002)(83380400001)(66556008)(26005)(6506007)(66476007)(5660300002)(52116002)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ukOI5QOSBGXH1JT53nb/kGpR115iDVJu1b5zsZqaRoT5rGwk4a46WItZIx3j?=
 =?us-ascii?Q?TER0uBSif6ecUWviBiEweRufj+6uj6OZl0DifzOtitj4s4dseUQmCFoeEROf?=
 =?us-ascii?Q?63q2OBBYyU9yaifO6cgEh0YlBGl8uXmkI8Ctjj4QT0sncDZBv7SnFc9IU1yZ?=
 =?us-ascii?Q?lCL188u2kYcG4LwCpK4mLTYHdxuyLa9XfJFHVsOegtGCyOAW3SBmRqF7V62g?=
 =?us-ascii?Q?9xLd17R4X4cinFkarisLFeMseSEOsyx1m0JsUEQEihy3L/4MAgCH/QEBHyMm?=
 =?us-ascii?Q?TZvG6Zi4NU8ego8HF18N+W6i9BiTZgSW2XkQx2QzZSdyvmuY8Jf4bLDZ2mqK?=
 =?us-ascii?Q?wrPqxLHK5zLpzlKj6iCIuKnGZxH+I8hP+wF1lxyE+JxEZbQ+P4VmgGW0T95I?=
 =?us-ascii?Q?CQrbSpALVWI6Lj+aLvMbv2i+57Bnexf/TGwMYlkeRfMbXyHUpbE1csqY1dmE?=
 =?us-ascii?Q?ADt/H0wA3YfWZVGJ05fvuScywYIrkRoORIc+frM+rlpS2UJ5zjOSki3H1LBB?=
 =?us-ascii?Q?JmOgUafs/BEzEhuKpDyvmKPGgyXxCxyvSkPztn3rvgOXAg8n9v7/RHKasyxF?=
 =?us-ascii?Q?mqMw3ACoeuycuG85Xl6lrklm8q55YtRTVL/FIGxH9dHU+S3FdlNZEkFi0Ki7?=
 =?us-ascii?Q?D8sya3gm5b9Yrr+eUTtV9KvsJPMQva1+/LUFt2Upb+dHFT9M169jjk9g1Xj3?=
 =?us-ascii?Q?irQ6R6+fxhfgLv3qFnzxhv0mDVLUTr9mARVeMGulyWVEqwCMSBXcINZFpUmz?=
 =?us-ascii?Q?e9SeJbz7KpbzoApjSA5VGHqvhMjO4qPdTFFGboD/lyjaJX3WVDm3ZkbjIgbQ?=
 =?us-ascii?Q?hqCV8CynQhL3R4QIxTzm3UqwSIFjGKIHIBm8S6dF/yEzhLQIugbBHAK+Tvov?=
 =?us-ascii?Q?6v9UkguPd+dztuydyyK3EfpviHe/5UPhQF5RneWi2Ol3jR5A0lscyQRNudp1?=
 =?us-ascii?Q?zA49mgxre6onGqQdlbD3eBT/1YB13TTiQE+XlkMGY//H3HR/amcT/TJ34A+q?=
 =?us-ascii?Q?mDcBXgOtSwPPoN0gD9Nn7F5A5rRjIICIONLofiX9H/7Z0wwuJA+whZVmU1VJ?=
 =?us-ascii?Q?FM8uhDby2NutgpfMyqVh8YI9vYlpwQEYzbrdKbSGbvFASlDsDG/G8koTpsxy?=
 =?us-ascii?Q?sY+Mu9xqfQwbxS3+jI/JjlSdxDRJQCiWq6MX9rrsu8X/JBD6SUwor7Wpzf2x?=
 =?us-ascii?Q?UcgmiXRNqy4Cel+ZCbNnR/nStGsrRiV/9Iet9F5LR3ZwK+qquBA1OsKdTvZK?=
 =?us-ascii?Q?li08oxnk8kMnAolE7Ph8iuObeXjjo1wYPcHoN1YfxVtvM1/9pq8LVsaMVCZC?=
 =?us-ascii?Q?lbdM484lwTqG/m+A0b11Or9s?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9638c94c-d698-4c9f-b288-08d90f936cd4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:00:11.1378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zb2iHOoiQlwCOCsDBk3gHLwDSb5VOOJSCBGEK6bsZVTGHEr0ldzRKanWiL8+IbUvA0qTkredo1V/ayqTTdOoaVaE1+RxrQmgQlPg03yQj5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.7.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

 - don't use same name for size in bytes and in entries
 - use g_autofree for l2_table
 - add whitespace
 - fix block comment style

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2-refcount.c | 47 +++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 8e649b008e..2734338625 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1601,23 +1601,22 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                               int flags, BdrvCheckMode fix, bool active)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t *l2_table, l2_entry;
+    uint64_t l2_entry;
     uint64_t next_contiguous_offset = 0;
-    int i, l2_size, nb_csectors, ret;
+    int i, nb_csectors, ret;
+    size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
+    g_autofree uint64_t *l2_table = g_malloc(l2_size_bytes);
 
     /* Read L2 table from disk */
-    l2_size = s->l2_size * l2_entry_size(s);
-    l2_table = g_malloc(l2_size);
-
-    ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size);
+    ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size_bytes);
     if (ret < 0) {
         fprintf(stderr, "ERROR: I/O error in check_refcounts_l2\n");
         res->check_errors++;
-        goto fail;
+        return ret;
     }
 
     /* Do the actual checks */
-    for(i = 0; i < s->l2_size; i++) {
+    for (i = 0; i < s->l2_size; i++) {
         l2_entry = get_l2_entry(s, l2_table, i);
 
         switch (qcow2_get_cluster_type(bs, l2_entry)) {
@@ -1647,14 +1646,15 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                 l2_entry & QCOW2_COMPRESSED_SECTOR_MASK,
                 nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE);
             if (ret < 0) {
-                goto fail;
+                return ret;
             }
 
             if (flags & CHECK_FRAG_INFO) {
                 res->bfi.allocated_clusters++;
                 res->bfi.compressed_clusters++;
 
-                /* Compressed clusters are fragmented by nature.  Since they
+                /*
+                 * Compressed clusters are fragmented by nature.  Since they
                  * take up sub-sector space but we only have sector granularity
                  * I/O we need to re-read the same sectors even for adjacent
                  * compressed clusters.
@@ -1700,9 +1700,11 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                         if (ret < 0) {
                             fprintf(stderr, "ERROR: Overlap check failed\n");
                             res->check_errors++;
-                            /* Something is seriously wrong, so abort checking
-                             * this L2 table */
-                            goto fail;
+                            /*
+                             * Something is seriously wrong, so abort checking
+                             * this L2 table.
+                             */
+                            return ret;
                         }
 
                         ret = bdrv_pwrite_sync(bs->file, l2e_offset,
@@ -1712,13 +1714,17 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                             fprintf(stderr, "ERROR: Failed to overwrite L2 "
                                     "table entry: %s\n", strerror(-ret));
                             res->check_errors++;
-                            /* Do not abort, continue checking the rest of this
-                             * L2 table's entries */
+                            /*
+                             * Do not abort, continue checking the rest of this
+                             * L2 table's entries.
+                             */
                         } else {
                             res->corruptions--;
                             res->corruptions_fixed++;
-                            /* Skip marking the cluster as used
-                             * (it is unused now) */
+                            /*
+                             * Skip marking the cluster as used
+                             * (it is unused now).
+                             */
                             continue;
                         }
                     }
@@ -1743,7 +1749,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                                                refcount_table_size,
                                                offset, s->cluster_size);
                 if (ret < 0) {
-                    goto fail;
+                    return ret;
                 }
             }
             break;
@@ -1758,12 +1764,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         }
     }
 
-    g_free(l2_table);
     return 0;
-
-fail:
-    g_free(l2_table);
-    return ret;
 }
 
 /*
-- 
2.29.2


