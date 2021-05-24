Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4917738E8B0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:25:14 +0200 (CEST)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBW5-0005IC-AE
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBS3-0006pj-Oi; Mon, 24 May 2021 10:21:03 -0400
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:51129 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBS1-0006l3-KU; Mon, 24 May 2021 10:21:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h42hG0BBmIn7R4DZ25yZli4zUdmNayPdJngmFRhbvyNl7SLHDYJHGUr+8vkB6t2iuMRQRx2818B7Zwmffj+21LIKWRCY+xorsE7t1JUYJRsmOemshO4IVY18233A/bIQ5JYO9D2OMb1TxlO3Vk2RCJlawnMAZWFHPM5KNwhs9YElVQtn6fwePkXMkK1ZJNCXnYQ6mIJaMPlbFnneXplOfWRPlxf4K/U93wnKPemuSrd6lGPE2WilJtPBDI/GgGW9AhM2lnPPa8ozQDEP4GzcswSR3sDZcDwdkh8cMiTA46cMqShrR+PM+aP2QHjRlvj+bRncbouuhXY9eAq/UpHjqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ5wxpZjo6CWp8sO9JbQAwX3ht0ArKOrRW9o8GTApMU=;
 b=ZTTdGmaohXOYO6XRUnGgZhl3q15k+7KIeu9PhrfWmdmUuOQCaab8iK2ubGFrxQ9JwOe61ePzwYTfV7zbvN2iI9Zj2MGtNVlCCj5hNKfkgurXa8237OdwPs7zjSfFASCVRlcebH1F6LC81EymKxXpUTkDo4PapKdiQKEfYB2vb3Q114Slao9/HsuodDU1HXvHxymSO3fmYEuqDrMCRC98TLKV6jklDbi33phz7w3HbQuuHz3CvOw0DMvOIaUFh8i4oz9zQf4nflxlbntV0Y18SOE8CMV4KJIm5Oki3rd3IMlCadsN3vmgUrwtm2N+w9sRyVevSzKUr5vKNr2SM/GDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ5wxpZjo6CWp8sO9JbQAwX3ht0ArKOrRW9o8GTApMU=;
 b=tHR9/H7WWcFnXWs66mVZvHQu++OMgjZpt8x0YPxiLgicrYcA8DL+2c3cInFCy62G79zDDj5G9u/BIlBKxeV/5+v8lWRqnqI6dfcG68TdL5wNdwBzg632RJ8DRRGNimQ/X1g3d30vAdkw8tJJWUsMEXxPJM7kZdoyRan+3r82XGw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4165.eurprd08.prod.outlook.com (2603:10a6:20b:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 14:20:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:20:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, ktkhai@virtuozzo.com, eblake@redhat.com,
 berto@igalia.com
Subject: [PATCH v3 04/10] qcow2-refcount: introduce fix_l2_entry_by_zero()
Date: Mon, 24 May 2021 17:20:25 +0300
Message-Id: <20210524142031.142109-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210524142031.142109-1-vsementsov@virtuozzo.com>
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR09CA0063.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR09CA0063.eurprd09.prod.outlook.com (2603:10a6:7:3c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 14:20:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23dd0b0d-238b-48c9-fb63-08d91ebf216f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4165ECCABA2411EC6550CE48C1269@AM6PR08MB4165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: alJblTzhZGec6gLmPw9UlsjIY1U76ciwdgPm7JqxBwfCtnwf9ExPU4xKUO2XjN6PGFBmdPf7747nw/MobDnDUaKOkElXCPWYV3gLsPxVsq32qD95UMECANHkJNW6ZmyExTTj6QTCaN4zLlhNQPsyCOTpPJgesnZBC7aWPtptryrDaMetx5a9dipUEkdg7AMkOimJbACoCjI+WYRsAwgX4FMXOBg1fz8O+IZ4qG6Jvbnv8DVfuf2FRP6jGudvLAbsrx0Vs0YS0A28Jn1crnSLduui7XUZ2AvpmGhUPc6aKae5SUWN5cjpxI7EYT79lAoELrYQQxFQQ5vIJe4r61F7HECLdI9fZGMUeVetgxBjlZ9Z1ax3mqByunUXow8fR8UvYKrBwMCJTSO/SqLx45r1lVNV/cKvneLFE1ibF0dzRA8Yp7iG1Fnp/wWaGbkMpC9G5c1fo5up8NXL20nrTVfKaqn/33/GVjSoQaInI4DOPHonXCrIV1VdwQxW3kLba1Ps4IcwqyD8Sc8mt24uS8F0xl9nTOPlc78h3YbPAjQxQ4tlRng5iSk5HH7bpHC1d9qOD70HkOFARcEAKqjFigUI/sum9GVLlYYeDSMCdQut9Bg4VDcfIYk2adk4rYhy4KlSCblQrZTWKrWJwaR6XLKWvQzQilO7FeyDi7/PK+ND0MBy46X9sZkPHU3cwQsyapP8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39840400004)(366004)(396003)(6486002)(52116002)(186003)(36756003)(478600001)(2616005)(956004)(26005)(8936002)(316002)(83380400001)(2906002)(6512007)(16526019)(8676002)(6916009)(66556008)(66476007)(4326008)(66946007)(38100700002)(38350700002)(5660300002)(86362001)(1076003)(6666004)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pWk/50c/eIp2tJ5TT7eRYeIVHSKbh6BFKmz7if2Wb5JQpwOLQAcdd7OXdNWS?=
 =?us-ascii?Q?if9uC61HuyZf8Jy35sLdItBquUg0FJ4NnDmr4Lmr9usF4TJdC0YXA8eNPJZI?=
 =?us-ascii?Q?k6efVAnVOsMGRPk6klobIGbCtCERxXc/Ng9bn5BzGpALDG2UAGwYr0wFbZv8?=
 =?us-ascii?Q?EKAEQrfLbQgcdhw6F1k/ZQXwzSiydXBYLi1yEEC3sKuyK1CLRI4KL9PbaI03?=
 =?us-ascii?Q?bc5+Z8TaEzGFXaAYqF28ydf/j/qrb1y1M56aIgsEKDFTDofnpG/3hEg21DB1?=
 =?us-ascii?Q?E6G1sX6tIg+cxZtVwj0+vi+qkvDvqCUgPcE1b8VQ18fMXZvkfFQ80GjJ4ZXk?=
 =?us-ascii?Q?wXpc+EIXqQrFJsWHMzL3ffIYJs3NiENf7c+6dSzwEjlgHG5hyFh02+wTh1eQ?=
 =?us-ascii?Q?KA4j139BPIqWzIqWgZTLAt5yo3ky6U0hP7Sk1OSVBSYKwvAQO3qVb3FNpHMC?=
 =?us-ascii?Q?A2z3gbOJZV9ZimY5eNUJlcRvEQlIHyBtL6+iOWUeckN/5JvyPBG/B4T0iYh2?=
 =?us-ascii?Q?Pu/3pgr0/Nf95UYZRV5y7mEnH6y1IJm9EPSoGVUT5JggV6Sf+RWbgfxOMcYR?=
 =?us-ascii?Q?5T+k3UHiUmgqtdbawjj+qHyAw1TOkRHJJ+7SD/NB6YI0un1hudMnGIvcJZXk?=
 =?us-ascii?Q?eVrKvdxRAAHVZV5bBrMQ4MEpnO6sBWuvUwNYZg+8pW4bGNs+Q9LLETex8/1T?=
 =?us-ascii?Q?EGnDX0AUJPQn9vUe6ycUfACLmrD77GoV+J5CLmIpsu6TQiMjfnZXWesjxKCl?=
 =?us-ascii?Q?Yc/WwVOHZ6Vrwsu6k4mZ7BSDSW/6jTHca//0YZ3VPBYPPxXQ1EJbk05x4yKW?=
 =?us-ascii?Q?3jlE68CxuE7lBHl9Ed+90p6X+vBloPX2n3A8eA2ZdgF5hop75eejTaQXjGef?=
 =?us-ascii?Q?i4ODN9MjEs2/6dOolR7DHE+epbuJZBdeT22D6oh4Cj2tVr73CF46bTeZa/q8?=
 =?us-ascii?Q?YWVpmTD4Zqe2j6IESRc+xdZ4BEc1MTwbVvKyJFDdfJfS3BwOgWZuxMV6ukuc?=
 =?us-ascii?Q?7zaXcEYjDBLCQt3oFHr2b36xz2vaik1peWErsN9aBSWN7z9pD4LiMZOpBLVp?=
 =?us-ascii?Q?LyaBJWQF0JQq2ZafBD/NwTBfe96RaBjFPnLi/RIpqKFoalBV5Lqd2FaftMxa?=
 =?us-ascii?Q?0yai2epgJPbnZcoNCpa0SsnxR3JdQa+K3w42TmIgwuBfvHZivQk5QG2zJ5RL?=
 =?us-ascii?Q?OpIWQKTOf+3UTSEYhspXhzwEgEUlAGThNVwIt9cZcQlFVeaGeSE/0O04HBuU?=
 =?us-ascii?Q?lGeBFhqPEqZ2VxLgCB00/wCikmOYRv2j7JHjhmnbwYBfh+rfTISsWSacsny8?=
 =?us-ascii?Q?pHqARsHIvVxqfrnwDms/Ndkj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23dd0b0d-238b-48c9-fb63-08d91ebf216f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:20:49.9842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vp8H0yvbQ/dkXnjxeOYjgEhtyc1zEaGFsfvyiSUcS8Rt6KGY/qaHtk03FNShRp6Sw38XVEkhzpCi/AeoNoMMsP5orAYJbVQG8cSSOyIxuZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4165
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Split fix_l2_entry_by_zero() out of check_refcounts_l2() to be
reused in further patch.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2-refcount.c | 87 +++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 27 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 66cbb94ef9..184b96ad63 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1587,6 +1587,54 @@ enum {
     CHECK_FRAG_INFO = 0x2,      /* update BlockFragInfo counters */
 };
 
+/*
+ * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN.
+ *
+ * This function decrements res->corruptions on success, so the caller is
+ * responsible to increment res->corruptions prior to the call.
+ *
+ * On failure in-memory @l2_table may be modified.
+ */
+static int fix_l2_entry_by_zero(BlockDriverState *bs, BdrvCheckResult *res,
+                                uint64_t l2_offset,
+                                uint64_t *l2_table, int l2_index, bool active,
+                                bool *metadata_overlap)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int ret;
+    int idx = l2_index * (l2_entry_size(s) / sizeof(uint64_t));
+    uint64_t l2e_offset = l2_offset + (uint64_t)l2_index * l2_entry_size(s);
+    int ign = active ? QCOW2_OL_ACTIVE_L2 : QCOW2_OL_INACTIVE_L2;
+    uint64_t l2_entry = has_subclusters(s) ? 0 : QCOW_OFLAG_ZERO;
+
+    set_l2_entry(s, l2_table, l2_index, l2_entry);
+    ret = qcow2_pre_write_overlap_check(bs, ign, l2e_offset, l2_entry_size(s),
+                                        false);
+    if (metadata_overlap) {
+        *metadata_overlap = ret < 0;
+    }
+    if (ret < 0) {
+        fprintf(stderr, "ERROR: Overlap check failed\n");
+        goto fail;
+    }
+
+    ret = bdrv_pwrite_sync(bs->file, l2e_offset, &l2_table[idx],
+                           l2_entry_size(s));
+    if (ret < 0) {
+        fprintf(stderr, "ERROR: Failed to overwrite L2 "
+                "table entry: %s\n", strerror(-ret));
+        goto fail;
+    }
+
+    res->corruptions--;
+    res->corruptions_fixed++;
+    return 0;
+
+fail:
+    res->check_errors++;
+    return ret;
+}
+
 /*
  * Increases the refcount in the given refcount table for the all clusters
  * referenced in the L2 table. While doing so, performs some checks on L2
@@ -1606,6 +1654,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
     int i, ret;
     size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
     g_autofree uint64_t *l2_table = g_malloc(l2_size_bytes);
+    bool metadata_overlap;
 
     /* Read L2 table from disk */
     ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size_bytes);
@@ -1685,19 +1734,10 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                             fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR",
                             offset);
                     if (fix & BDRV_FIX_ERRORS) {
-                        int idx = i * (l2_entry_size(s) / sizeof(uint64_t));
-                        uint64_t l2e_offset =
-                            l2_offset + (uint64_t)i * l2_entry_size(s);
-                        int ign = active ? QCOW2_OL_ACTIVE_L2 :
-                                           QCOW2_OL_INACTIVE_L2;
-
-                        l2_entry = has_subclusters(s) ? 0 : QCOW_OFLAG_ZERO;
-                        set_l2_entry(s, l2_table, i, l2_entry);
-                        ret = qcow2_pre_write_overlap_check(bs, ign,
-                                l2e_offset, l2_entry_size(s), false);
-                        if (ret < 0) {
-                            fprintf(stderr, "ERROR: Overlap check failed\n");
-                            res->check_errors++;
+                        ret = fix_l2_entry_by_zero(bs, res, l2_offset,
+                                                   l2_table, i, active,
+                                                   &metadata_overlap);
+                        if (metadata_overlap) {
                             /*
                              * Something is seriously wrong, so abort checking
                              * this L2 table.
@@ -1705,26 +1745,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                             return ret;
                         }
 
-                        ret = bdrv_pwrite_sync(bs->file, l2e_offset,
-                                               &l2_table[idx],
-                                               l2_entry_size(s));
-                        if (ret < 0) {
-                            fprintf(stderr, "ERROR: Failed to overwrite L2 "
-                                    "table entry: %s\n", strerror(-ret));
-                            res->check_errors++;
-                            /*
-                             * Do not abort, continue checking the rest of this
-                             * L2 table's entries.
-                             */
-                        } else {
-                            res->corruptions--;
-                            res->corruptions_fixed++;
+                        if (ret == 0) {
                             /*
                              * Skip marking the cluster as used
                              * (it is unused now).
                              */
                             continue;
                         }
+
+                        /*
+                         * Failed to fix.
+                         * Do not abort, continue checking the rest of this
+                         * L2 table's entries.
+                         */
                     }
                 } else {
                     fprintf(stderr, "ERROR offset=%" PRIx64 ": Data cluster is "
-- 
2.29.2


