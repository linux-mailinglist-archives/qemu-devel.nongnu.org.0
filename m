Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1306640ADC3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:33:59 +0200 (CEST)
Received: from localhost ([::1]:52610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7dO-0002i5-2K
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VG-0001sO-9B; Tue, 14 Sep 2021 08:25:34 -0400
Received: from mail-eopbgr50116.outbound.protection.outlook.com
 ([40.107.5.116]:58241 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VE-00065R-Dm; Tue, 14 Sep 2021 08:25:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFEB+pkSEcF4Ga8i2yKdIAjULp3mVToXp4/qKZEOse+g1YI4nXim+CG89e3nlMT6DU4ENMw9f0ez+GLJ9lR179O05hdq5wjKTd1EEvCg9C/GrU1XCgVd5zBfke1h5jiHnlSr1Kj7OAkBh7UriEReOb/8xwCKCBb2GtIebDhVMo8t7N5J4U1WJ/WTNfN0r4Ry4MRQxnACLypfcsjUhbKK4ERIVlY55U4fRS2AJgr5oWlDJ8Sxv2NqRqr0O31Iu3Q3iqo9qEUdEzJ35d1+k74sVC60otCJegb7VE76YhpTyOb99h+TVJ1LOn+Nt5jstSdM4AM4FRz85cx9uah1704Lqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8rdt9D164FRdKx9NBMPkBjNfXBaw8NV2pzs2lRsFwuw=;
 b=SC6oaDrq+/UH1UkBNPYBhTmleOnwQYawRqhqZlj/ywK9tIQT/hGmWuEHPy5inK1cN/dKMpbJ7Yfrra1NPgRoEXFKTeMmP8wo+bACuFUoFVwO9dZiz2Yu7yz8TolzIIBx44cCp1PW11BbFnye6IIrg+EhibkLNhf9ATEIBvLkU5d4vmD4IfYy6CmdjRs6vt1MbrgOMB8yBBOkPX4l8iBknLthlCQhX3vySx4TCiFLE7H7u+IpgKsPEUQ1nD9XkxoElwvz7+VOa6tx1I5FIx2hBwBxVteNee7eNvvsw0q3VxFrsHn2o/7H7EKoc7vUJgLU0AoWzdoxxk26FUN0YNobuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rdt9D164FRdKx9NBMPkBjNfXBaw8NV2pzs2lRsFwuw=;
 b=nQtZ4Zu50Mr1cxOdYaJEoWy513oniXburhyIjOEoDusDafhZ0O4NxPZ31TmG1UBUqzHhZSRPFgSzlGcJVV8n/NYbpDAiG6sPYX76H9ieepPpsMoaVJiBYh9N7FqjDVVYkwqGf6Lu0D8yZqdGusdHyQ746BF6ClADVIRKeGUU8vg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3158.eurprd08.prod.outlook.com (2603:10a6:209:44::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 12:25:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:25:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v4 06/10] qcow2-refcount: check_refcounts_l2(): check l2_bitmap
Date: Tue, 14 Sep 2021 15:24:50 +0300
Message-Id: <20210914122454.141075-7-vsementsov@virtuozzo.com>
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
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:25:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7521419d-0654-4531-5083-08d9777aba19
X-MS-TrafficTypeDiagnostic: AM6PR08MB3158:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3158581FC9743BC420E3CD47C1DA9@AM6PR08MB3158.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:293;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pcc1MOOkL5+WBJKZ3hGejmlXPHxf0oi30O0FGQQ1XgypOY+rUJpt+Kd6GXBMfeiLddz59khlz8xiZxpjgj2468GpwtTwyyzn3VUIt45EefyDwt5+SgUIdHuEM6oVqLhUw+C1JVf14L/JgBXgDnleW83DxKNdAWYwgwmkXF8MAt/H15Au3NoIMxINcoQ6GBsSTiKjY9z9gsCZu6Ojd2udpPRq+jAsNYdbyMtYlp73ti5xB5SLTcUQXL8IxRedq+VgwnZyn5o3LEIbTkyWF1t0T4a41fs4Bby62IXFcp9yadip9HEGGWxm2ljhzaW/t0U8GT34r9XyXlCeucU1efa1tyBwFtRy30do99qB5DLFw62lHWIVCEufAICAEQGdVMOxoyl+0vGKlQ6capvi0C4PvXxCVV35U7kvXMfh1eoyGAeU2lzz88wwi32ZfuLoGP+QD1o/Ncn8pIz2EM0rQHUWjRD9l8/ZTxFQjS9w76OJynAE0WCiR3UpcFAuRBCOmaJ9qf9YSEUBakM9r+vry/ndLeX/iaQ4bXTPaQmkl471cBdL2ZA8sH40RVULRZHY9Q7pPrVSZ5KQscXeVLC5ns4tRUylA1rsR3dWXGPuvG//8rjqYkzbqU2+CRUnwOtvVJKKSS7t0rMnuqTHAiETn7VlTMtKOUBU8B2ePhoiqqMiTZ+MNmRktI+Mj42TYK+SdGRRw3JqCjoh85jPOlQaaWfrgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39850400004)(366004)(26005)(186003)(6506007)(478600001)(36756003)(38100700002)(38350700002)(86362001)(8936002)(1076003)(2616005)(316002)(4326008)(6512007)(107886003)(83380400001)(6486002)(2906002)(956004)(6666004)(66476007)(52116002)(66556008)(8676002)(6916009)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B2iPHNHQiucfZIZM6Ge1hqLmcYLd7tJPItvZmmzj6s4HLGHTrV+LLskbrChf?=
 =?us-ascii?Q?N6iHNexoT8dYKnabuWOpM8iAKZhf+CJwfAmEmXO+JxTDXm5ZOJgb3e9gvx8J?=
 =?us-ascii?Q?PWn1qk7chgoDYB0u/hBjbxLakpdhW13H9IkzeizBbYtz8v9vofn+3T+SYV6b?=
 =?us-ascii?Q?dlhFJA5sFtYyMqzX59SsblbSvRU+z+/WCm2oKIKRlXuijAP4ve/4Q+8bn8i2?=
 =?us-ascii?Q?C8cwdaoMRQp81cI9+cBjYhxYvkB2W1jvoNAHWSHtlSywrAd0Tbirm0VcYp/T?=
 =?us-ascii?Q?BNrclmierMXf8n2hRK3VuN/CzQdb+LEb+tvBNES29vA/u0AicykVmPni6sM5?=
 =?us-ascii?Q?WxWKZRJ3MVRcTxXvYYCwagAkdhlo+Jm//b5TSH5odI/k0KalxhKxghTtql2p?=
 =?us-ascii?Q?bFxK9F8QYkc+yIYC3pGVHLMeitHSuEYBl2RJcCieaVpaNMQnuX0NjZORTjUN?=
 =?us-ascii?Q?TsloNctY7ijMKORz97x3FR3GmMyV8GRFsUn8yLr6SrsbRFcYpcFeb5FiGTbf?=
 =?us-ascii?Q?Ct8MtfQD4d4zcGFX9n47wedGz7KVZfFU4trbKLgez2gj6Mi5n6OzcCatjMeA?=
 =?us-ascii?Q?AcUAQDvaXX5J21u81JxYNt1FXRNr70iBB7qtEZjkYA+rJ2cV4tKJg9C2UVXO?=
 =?us-ascii?Q?K4Wj8Og5B8+PS38syFr02gD1Q66yhR2cgg+1BbOfMWXSiYeMeqW8JdI0ko+g?=
 =?us-ascii?Q?wPg2KK39WIDgVFza8qz2clBzCBxunNidYdRqSw3Q1V1ln3+v7hiWTYZehKeA?=
 =?us-ascii?Q?necm2MZmdRIP/D2dHRfvPcceUhi3uXsgoNydMwrOnw9kc13J2qqIoNWoz17A?=
 =?us-ascii?Q?+3GWItimu/e3YRtX/bTjszLTFk2WpN2a59O6F24we2VkjVLqmdXxZ9UBe0vY?=
 =?us-ascii?Q?UZ7xfvBfKbHj9bn0bbA2IikikMr7DdDxKaoqPsrR/1Hv5ZHxR/BAdMYn7Jh5?=
 =?us-ascii?Q?KtttcaPHi/61+rSvlyTVc0SszoykONX+kxJ+6Vc0CJDU4JcgoQfeO4OIAve4?=
 =?us-ascii?Q?gaMkn5lvZX2ZHzSlw02UxqfaFqCLK77jET1Llr3vWLtpIJSQ/Xb2rlH82SM9?=
 =?us-ascii?Q?jyExhHbOVYYY3RB2gqJ8PEZpVIuFlKflouR9djSuFtPwzL1fu+4L59zCF5QD?=
 =?us-ascii?Q?vxDeJBta6iLy3IFxzfS185Na83lmvFB0WCwaVO6LxHUACfKclTC0dXDIdCfi?=
 =?us-ascii?Q?z9oEf+lcC4I/3ili+Su8vB1pdZVCziVvqk/Dmp9CgaAD0ger3EZBEBs05vtB?=
 =?us-ascii?Q?QcXoKDBytrOEL7fGtsxlKsKwlHRpSFqaCDH8Rxsteq8ogrqNSoqT/wXDAHhU?=
 =?us-ascii?Q?baBFKnflUg83uhnwuGhUgo+B?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7521419d-0654-4531-5083-08d9777aba19
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:25:24.3404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXLC8QgBf1y0FMRFF6I+ToOXx8GiI+ndALpMBftUs9Y9+GY/qE6NiuCkPozGgHJn7hjlhFzUX56f3wNWq0Hb613hX8yXS/dKdkG8IQmDa10=
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

Check subcluster bitmap of the l2 entry for different types of
clusters:

 - for compressed it must be zero
 - for allocated check consistency of two parts of the bitmap
 - for unallocated all subclusters should be unallocated
   (or zero-plain)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
---
 block/qcow2-refcount.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index f48c5e1b5d..9a5ae3cac4 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1661,7 +1661,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                               int flags, BdrvCheckMode fix, bool active)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t l2_entry;
+    uint64_t l2_entry, l2_bitmap;
     uint64_t next_contiguous_offset = 0;
     int i, ret;
     size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
@@ -1681,6 +1681,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         uint64_t coffset;
         int csize;
         l2_entry = get_l2_entry(s, l2_table, i);
+        l2_bitmap = get_l2_bitmap(s, l2_table, i);
 
         switch (qcow2_get_cluster_type(bs, l2_entry)) {
         case QCOW2_CLUSTER_COMPRESSED:
@@ -1700,6 +1701,14 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                 break;
             }
 
+            if (l2_bitmap) {
+                fprintf(stderr, "ERROR compressed cluster %d with non-zero "
+                        "subcluster allocation bitmap, entry=0x%" PRIx64 "\n",
+                        i, l2_entry);
+                res->corruptions++;
+                break;
+            }
+
             /* Mark cluster as used */
             qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
             ret = qcow2_inc_refcounts_imrt(
@@ -1727,13 +1736,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         {
             uint64_t offset = l2_entry & L2E_OFFSET_MASK;
 
+            if ((l2_bitmap >> 32) & l2_bitmap) {
+                res->corruptions++;
+                fprintf(stderr, "ERROR offset=%" PRIx64 ": Allocated "
+                        "cluster has corrupted subcluster allocation bitmap\n",
+                        offset);
+            }
+
             /* Correct offsets are cluster aligned */
             if (offset_into_cluster(s, offset)) {
                 bool contains_data;
                 res->corruptions++;
 
                 if (has_subclusters(s)) {
-                    uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
                     contains_data = (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC);
                 } else {
                     contains_data = !(l2_entry & QCOW_OFLAG_ZERO);
@@ -1799,7 +1814,16 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         }
 
         case QCOW2_CLUSTER_ZERO_PLAIN:
+            /* Impossible when image has subclusters */
+            assert(!l2_bitmap);
+            break;
+
         case QCOW2_CLUSTER_UNALLOCATED:
+            if (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC) {
+                res->corruptions++;
+                fprintf(stderr, "ERROR: Unallocated "
+                        "cluster has non-zero subcluster allocation map\n");
+            }
             break;
 
         default:
-- 
2.29.2


