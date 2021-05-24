Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E166538E8A7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:22:41 +0200 (CEST)
Received: from localhost ([::1]:50286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBTc-0000k1-UF
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBS2-0006mU-R2; Mon, 24 May 2021 10:21:02 -0400
Received: from mail-eopbgr50103.outbound.protection.outlook.com
 ([40.107.5.103]:9605 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBRz-0006u5-4A; Mon, 24 May 2021 10:21:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEGyblvuyK3kduPnBWwaYT3T4a/HBhgzXwLB5qV+6orZSIPy+K0XNRfOc/vayJHdSKwe1gzAHM2Nb75OV8Iymksb3znvGGWTiivf2CcDvZTHYD99+z61Da8eARkyseGKeFSZhxR5AmAOwcWw/7lL+wQ/fAgOotnQhWD6Ox+b/JD50P5hLj2xvlgREX3QSDHmaZCoL70kMeJl0m8V205lhld5Y/7lAc+0RRvoOFPWdM3jIlfNQqcGxa1eoue7g19NTQOoSiEdS8fSd9U00P4vki84P5EH4lr9I9yS8IPSy/NjgKQqky/1PIZU83oJXrXMbnHdbWsqFMm+EhsdQ9lhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ozwcWJK3aqKVEOEne3GdIscWecGJNjVW1O7F8ZCZfY=;
 b=oQiIVJwIVaHY2a1opYwA4Fhaxh7WyXAxVw/3SzPyVZYDrKJAI71T+XA0SQQxWjMlFGSGfVWRxIosiKqjaWr3gkEXrN0gMBF0klAdZivxY3EwZu4EnIJQ6JIUONvmzC672Ul+vJgzOGiAlLQ8w49m8T2KW/aFMbSw7o6Mgy4sgcGtbItvCJPX6J50vvtmMLeF3trHUTnHL4fOSvrZpx9sRm/otnIuL9SQTHRCUomvMGIw+J/YO1Lax+tZOkA4SUf4uhip2FgglBI7o0pO2GkHqqDqvEFpCWERykqudbrH5G2eLDT9CNZ7UdMkoUBSfBzn6pt2C7oEQ+F81E0z75i5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ozwcWJK3aqKVEOEne3GdIscWecGJNjVW1O7F8ZCZfY=;
 b=bbZJZLSzZjj1l1QuyTvR47rr/ukVx9kxE0vxNIRlFZkt7NhbdniG6OZVBXeD1nWZt4ikCwwsS3IR2kc0ar9GVXbtyv3WTsYWA0B4Dx4AxmruFkdpHWryjhMYcSo9MuUuvC1xk7H+R0x7SWU8Ozoi0ezW1/KECykw6F3uF5T4znw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4165.eurprd08.prod.outlook.com (2603:10a6:20b:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 14:20:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:20:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, ktkhai@virtuozzo.com, eblake@redhat.com,
 berto@igalia.com
Subject: [PATCH v3 02/10] qcow2: compressed read: simplify cluster descriptor
 passing
Date: Mon, 24 May 2021 17:20:23 +0300
Message-Id: <20210524142031.142109-3-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 14:20:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36dc45eb-3266-4d60-59da-08d91ebf1fce
X-MS-TrafficTypeDiagnostic: AM6PR08MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4165F894BA7E810A8B9BC600C1269@AM6PR08MB4165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HjhDz67yDyImnbQA/aJRCiQciI06AM9Ie0G2F7iEnV8c5LGHLvKVRvUt45xeBB3XWirEBNvwdeZoWRGScptYgNNJqi8JsqQoT1d/ONzpgOg7s3NCNFnIzHTw1Jz37UdFRunC+jpIpBPOa4gwzCIwQnc8/lR2riRgwrHbq6Gj9OGRT68A5BvymSkFoH6jSypPwP6zhtYBnbKGIkvy8QitrZqwjc9c6qtOWUc1NA4ZnqID9vm0i9VI9wjOTkcIDngffQQRsGbmm5wSJ/u5aHINILzlF/eGjuguCCT1bmLkbAQW+v5BJCo4TEV+vwzq1s1CuKOAh95tgz+G7fQEF2EgDdYQbQmPhQs9TZyGS5k0P+QLDgklQlxGxTjBwi5AeRP1cakZwRigEqXoRihOdLCV1i9uXu4rlRZUdozTsqvyJJlSczaX/KcJ5ZiT0/BrtGqBKTyEdTAJbytjqfyemTTkMP2TkhJFWIxn4w5npCpJ7Shrg/zjg0PlgeRRecm7sg8V41VZRSUNe++8yrbC2/xt3+0M+AzQcjMvpEJnbRmU0ppsVU1jYmPqw0sgJjwTUJks/8g6pmDVFfPfR+jUiQUARPRaFrJJfTJX8qR1utBI4H96v1mubHdAzOs/6wl6YhE/sE43mf2XC4dyyhcNa5xNw7s0J0P7P6PLfpi32CxIppKBRY9ILxd23w0mB0TOVRJe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39840400004)(366004)(396003)(6486002)(52116002)(186003)(36756003)(478600001)(2616005)(956004)(26005)(8936002)(316002)(83380400001)(2906002)(6512007)(16526019)(8676002)(6916009)(66556008)(66476007)(19627235002)(4326008)(66946007)(38100700002)(38350700002)(5660300002)(86362001)(1076003)(6666004)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?A/udOuVEquEcrAgft+nVF+TaoxxkEKJ/6UiecY6EN7Uncx+g2680ounA9bo5?=
 =?us-ascii?Q?9M++CH4rPf1GhysGGgbQw3Ezz6IX62xFWt3Jy3DZTsMAsweM8oAnnqOF9R98?=
 =?us-ascii?Q?ZqjXQqBt8D5y/kFKFA1qaglqmqQrjhbi3aKQ/wmUVOSK8S25V81g0eQ+jUsC?=
 =?us-ascii?Q?dYB9WH2Th6DSTckrdJEUgRg95hrwSjuHIArliLCxEbwnd3zGApWSuiU4RCXZ?=
 =?us-ascii?Q?zWIC2ho5uiwAu+wAXQDFq7eK1y0OYcpQ2clA5po3KfgGhEa9uH0hxZutivCw?=
 =?us-ascii?Q?3U+NhnksF+XYXAEKM6WwTpbzYwquRKZ6djSoQpP2Hd4yFmv4yADUYhnKsoMP?=
 =?us-ascii?Q?DbAc6k1Xt6GjaBp+4z6Bg5V/6Iom1Ku0r1NOtBVTi5ziL6N1F3Rd4vIcULPo?=
 =?us-ascii?Q?k7nn7SNBET2hmpCQvHRcSPE1fV3rDpAkf1OfcUuzr6wc/8IOKY1Ti5SLY4t4?=
 =?us-ascii?Q?c7voA+Ul/kPrpeYa1MFNdou/81W8qLfD26SbTyRNHWd8s+nyvZv0M561lrZT?=
 =?us-ascii?Q?OH0v1AtBW7b2HBbhKwC7TCN32iSv3hwSixODGBpTNUDdIrTF0sp103bKCdsM?=
 =?us-ascii?Q?EP76d1sTX5hgeyx0LtCyd2j+7231uoKWE5N4EyRoK1A5wK7YtgznRGy3Xwxh?=
 =?us-ascii?Q?Gh5PKQKM0OOCeHd8pU5D2bYiziNMJoiUGzYcfOY3oAnrIgdVv3DoHXG1Zvtm?=
 =?us-ascii?Q?NEe7qWT5IXoLDrZ9GoQyRtEFS9NpvO/BjOXF06WznAO7i3mlkkB6N8dTbYv7?=
 =?us-ascii?Q?bUlY+z++Mmkft/fjmbXFzITPXkL73IRB0aFp5svdRcAMtky3C6D62YM2VB2f?=
 =?us-ascii?Q?aOVCF/iLvHxihfhQPVNMVM+9/GNM34v+QRxYOLdZJJOSm4wFagHvFE1Eqccq?=
 =?us-ascii?Q?LU8yGWc1CcAJgaGM8YTuP4WTF6R4VSOgeFzGpQZ4ZVdNpFzuzb6lAJWL/zJW?=
 =?us-ascii?Q?nYdY4SlXz6EocSwPGlffEt8TRlVhaC8+Dvimm6vjwmbJ7Z1CrORc4eTPYpxm?=
 =?us-ascii?Q?4uXTrF59yt8Rd04asc6S6amYEJP962I8IwngbaJSrgzdxTHqvVyyFEs/SSrj?=
 =?us-ascii?Q?KChCbdOPTX/yH/zVFeKtIISavM2Ws29xfgh87aH40MRa1VZ4PjNXN5NL/oal?=
 =?us-ascii?Q?RhcxPWNxulUyPcIaxlBV75hr9F5STtcLUdTbrXE7mWNRLBbSfQoLCG7Nnd8V?=
 =?us-ascii?Q?O8wN/uUNK4QhrRrgBOhR4HuwERo5KeqQhgT2XusrUkJTIBQkiCMu2qOjDhzL?=
 =?us-ascii?Q?H5cfCr/86vvSjlvieZ3FYRHCG8VrrNX2u/7qvRz+fKGVgtkMo2VBpylgARGY?=
 =?us-ascii?Q?p0WybMiabMwwK6ZYw5PmEokw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36dc45eb-3266-4d60-59da-08d91ebf1fce
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:20:47.4802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LM69y/ko+nPkjN7+6HyESNUruWC9WixtmfnFqPD72ztWfFERc4Q/QWLIQdgyDOlKQnhURydAvb7x7pzP6MSGF41BxcIqZLcTtcoOkUQ7L64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4165
Received-SPF: pass client-ip=40.107.5.103;
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

Let's pass the whole L2 entry and not bother with
L2E_COMPRESSED_OFFSET_SIZE_MASK.

It also helps further refactoring that adds generic
qcow2_parse_compressed_l2_entry() helper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.h         |  1 -
 block/qcow2-cluster.c |  5 ++---
 block/qcow2.c         | 12 +++++++-----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 0fe5f74ed3..42a0058ab7 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -588,7 +588,6 @@ typedef enum QCow2MetadataOverlap {
 
 #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
 #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
-#define L2E_COMPRESSED_OFFSET_SIZE_MASK 0x3fffffffffffffffULL
 
 #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
 
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index bd0597842f..04735ee439 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -556,8 +556,7 @@ static int coroutine_fn do_perform_cow_write(BlockDriverState *bs,
  * offset needs to be aligned to a cluster boundary.
  *
  * If the cluster is unallocated then *host_offset will be 0.
- * If the cluster is compressed then *host_offset will contain the
- * complete compressed cluster descriptor.
+ * If the cluster is compressed then *host_offset will contain the l2 entry.
  *
  * On entry, *bytes is the maximum number of contiguous bytes starting at
  * offset that we are interested in.
@@ -660,7 +659,7 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
             ret = -EIO;
             goto fail;
         }
-        *host_offset = l2_entry & L2E_COMPRESSED_OFFSET_SIZE_MASK;
+        *host_offset = l2_entry;
         break;
     case QCOW2_SUBCLUSTER_ZERO_PLAIN:
     case QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN:
diff --git a/block/qcow2.c b/block/qcow2.c
index 39b91ef940..b3648f0ba5 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -74,7 +74,7 @@ typedef struct {
 
 static int coroutine_fn
 qcow2_co_preadv_compressed(BlockDriverState *bs,
-                           uint64_t cluster_descriptor,
+                           uint64_t l2_entry,
                            uint64_t offset,
                            uint64_t bytes,
                            QEMUIOVector *qiov,
@@ -2177,7 +2177,7 @@ typedef struct Qcow2AioTask {
 
     BlockDriverState *bs;
     QCow2SubclusterType subcluster_type; /* only for read */
-    uint64_t host_offset; /* or full descriptor in compressed clusters */
+    uint64_t host_offset; /* or l2_entry for compressed read */
     uint64_t offset;
     uint64_t bytes;
     QEMUIOVector *qiov;
@@ -4665,7 +4665,7 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
 
 static int coroutine_fn
 qcow2_co_preadv_compressed(BlockDriverState *bs,
-                           uint64_t cluster_descriptor,
+                           uint64_t l2_entry,
                            uint64_t offset,
                            uint64_t bytes,
                            QEMUIOVector *qiov,
@@ -4677,8 +4677,10 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
     uint8_t *buf, *out_buf;
     int offset_in_cluster = offset_into_cluster(s, offset);
 
-    coffset = cluster_descriptor & s->cluster_offset_mask;
-    nb_csectors = ((cluster_descriptor >> s->csize_shift) & s->csize_mask) + 1;
+    assert(qcow2_get_cluster_type(bs, l2_entry) == QCOW2_CLUSTER_COMPRESSED);
+
+    coffset = l2_entry & s->cluster_offset_mask;
+    nb_csectors = ((l2_entry >> s->csize_shift) & s->csize_mask) + 1;
     csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
         (coffset & ~QCOW2_COMPRESSED_SECTOR_MASK);
 
-- 
2.29.2


