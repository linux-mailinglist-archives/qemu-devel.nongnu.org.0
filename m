Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579C140ADB4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:29:19 +0200 (CEST)
Received: from localhost ([::1]:44282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7Ys-0005QP-DH
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VA-0001mk-Gu; Tue, 14 Sep 2021 08:25:30 -0400
Received: from mail-am6eur05on2131.outbound.protection.outlook.com
 ([40.107.22.131]:32082 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7V8-000628-SO; Tue, 14 Sep 2021 08:25:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hN/YgegiPIZN6h+N0Bh47Xh75b+UC8dI3a0AoHPzVYoprDr+bn/NCA6aEKatFjQUZWC4pZ5ABtnVFU4XmQSBVzZ25l9+OYpttmDjBehDwXnzuXv6vWdtsDPci1LYU6tpQjJZx1HhMnU0BuD++SyAgycr2uUsOChstWWgmnZv/tGjha1StKJvFQblCXSmSxo5AnwXDrP4EYQj+QdXzBoJTcPdlMMRXEDfDgIbTrn1IL0bvrzOrkEts6ImYHzcNCaJ6BMUMu6oQ2M/9T83BeK2TFM1bAbw6n5Y/pPgsqYGW33vKVHNIfQ7lbSPcHowlgPEMhmQ+Xus/qVW7VJ1Uibcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=2R0jsrKmMDSx2wDubS0WReXS8D74xpRF2RJ+UPHIol8=;
 b=iJ/SuYJ9LhsKb92yr9fl9ZGYlPSIsDnic7+qcU/6rJdZAESk4ElmBX17AeKZHaNIx8ikaYHUdMdwOQTy9G5v+z2zF9g1RyBaXNgIhv9M5oXajEC5OR2ha0sM27O1TdF9eZ22+W7Vj+HHPhUGiu0ZAI40DJUV5+d32cWPPvoL77o3hEIrCfCjAeQDDPI0RIvmVJWiZiq77+x77ACr+vsza7uu5EQ5xBCRfl4k2dFR59XnT4cc+uxjmzUD7RA+hbMWNNOm+nE9/TqCj1NDSUXP/WXEMaQD2H7xhPHWh5VxRJ338OSVvTKhxnb8i5QrBGhfr2HIEkIh39YlaHZ0mwF/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2R0jsrKmMDSx2wDubS0WReXS8D74xpRF2RJ+UPHIol8=;
 b=cfxAVPKz6KSdrjzHTSyqrADkW24XI3x9+NEWhpLzvG11Q/i5bDTbwP4D0gy2jgt9rxRJDgvO0QZQ7vtSsF/vpgfJq79dJ25n18vixvw3AVjg9Wjqwuz9tHx5tRc2QzK2YpM4Mp7bCSDph7/uh1WqPcmT0uiHOErEmACXHiBw62I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6946.eurprd08.prod.outlook.com (2603:10a6:20b:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 12:25:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:25:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v4 02/10] qcow2: compressed read: simplify cluster descriptor
 passing
Date: Tue, 14 Sep 2021 15:24:46 +0300
Message-Id: <20210914122454.141075-3-vsementsov@virtuozzo.com>
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
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:25:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 903ca4d1-a402-41dc-2b53-08d9777ab6eb
X-MS-TrafficTypeDiagnostic: AS8PR08MB6946:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6946B7167D24EB86680DC32FC1DA9@AS8PR08MB6946.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tqJ6fq5I51cioNx6j2FWY6rLiUjkQdz1B7MsoJQ5GxhJKU65iBjCNV+BQam7uXaw3kDH4BFOcP3aKWD90yOMOu0VHaV3MqoaC/pPa9NI/Pvlf5yf1bDYwmB/DZHFe0akfGMztbS4C8ddtyFZo5v6vExfvOxnoAMeUYQGddL9OyByEFFCnAbcEKunpmTbg1z3Sl/k1+rmOOzCw7VqasR/FPmfU5S1w22RIhERHyDwCcKMYPu/WpJhDtqcgob6BgKOZL+hfPse4dxgOiTH3uMIBexqKJkpjZhBwEDUIOJcD1F76e2BbDkj5nJeqROub5u/kaubIBYe+wkZoWdT0tiMi9ob0D08VSK/M5kP1ZlBfRTsLSMWmf+V6VgBQpaQA00XxzRmcIXSTYaN02FfuVHfhz5w7jZhZB0NnKDBrsAgPuEPCuT5HUpptEDra3KPDpHHjnRS1KNTNIWTf9PePbP4aG3BjQCGjPBjbi4Eu/6qYRYKa8n31ZzzJyTlefZAG9v9kDnKuyedmZZNyjRxK7ULsggOuoCnKNsOz+16T9R9+Z8Tqb557cUTMhhnDGYpG3RKwEOfCWVQYe3nIANnNaTmFoxwSVkJGgEZQKpbTmCv7fuE3thsTlWSPzAidOK+w2+CbqRw1fY2QUrVv/VifQ3h1UiZLXkR7dHpECTUBO99/Ro6wh1Yt+Sv118xdUx4t4oLM63ftEnNTn2OXujyP6iJ4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(66556008)(66476007)(2616005)(38350700002)(26005)(86362001)(107886003)(2906002)(6916009)(66946007)(4326008)(508600001)(186003)(5660300002)(6512007)(316002)(6666004)(8936002)(6506007)(6486002)(36756003)(19627235002)(8676002)(83380400001)(52116002)(1076003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?URP5QqFGv4kssUqkbwwUn69vQQ6aHTTKqD3DnGMNNyKj5K6voasJ0rKAgA1u?=
 =?us-ascii?Q?6CH0e/BnDV3bZpmWit15FHgIX+gczfTxDwsYkSM8RZzlI+j+720aSiOrJ0+V?=
 =?us-ascii?Q?rERjFXPHMeYtFJGWSsbJ2wds45smiHbOOL/Tzgw+kqiWHgQGhIGl+8AxImcJ?=
 =?us-ascii?Q?HrG6NMeCoPBrWuCsUfYPy/9LBVrrosTiwaBuWsfDxe/YmWqoQZxgm0EN6CKz?=
 =?us-ascii?Q?Ajho5Hr0n+7tOI0k6HXnagFcwJAB5RgpMjgChpUQCoCNcvZOrukqcqrMdtPs?=
 =?us-ascii?Q?aqIQKVYDDiqB/HSjdI3aBbScmhybgfNGjYqSDEYzYryvfDZPwp/mpemnOpCe?=
 =?us-ascii?Q?58IhZIduBuGkgkSr5vpbfuNQArSmE4I53K3ttdeR2ug5ek04bvN2eRy/Cltk?=
 =?us-ascii?Q?cLn8/Vk833jllkUBpt/jZQ2qj5CBrCPDeYTrLBkfAXWWWwpCX7fAEyAIx0BB?=
 =?us-ascii?Q?IcY8XDUOFopyEGGrUMWCLGpnS1BUVtfuFEqZrq+FLch6ns0UnaTaQlJmPqPi?=
 =?us-ascii?Q?g7WfgBy+1C3dORGKjt59d4+54nnvHIByk0hn33MXuXl0q5kjjQGPjsNZ+Wx2?=
 =?us-ascii?Q?MfdDAhoTZSo5yxjC0Mpn6uif8ZFTciXT2+rs5ME6RPrIJuhRYCN5nR0+2Ujy?=
 =?us-ascii?Q?9aZodq5TtQpScydKvQ6koauTHBCYF3x/H5veLE7LBPlUjJvlO23oihu0625I?=
 =?us-ascii?Q?hb3j6XT1XUEv4qM/tk6z75ssHwTn1OOGdSF6BFW+ThFKM/fZkr8oZMpJRotj?=
 =?us-ascii?Q?awyaGrS+BoNnCh4MDLH4RR7NTGaqmklPyXghavYD/NLaBRKcaxlDFfNTQ5jh?=
 =?us-ascii?Q?YrJmFIZpJRBe4zSuecX9r5FR5Rnx3gNaUjGZG0f2FUgZgdgjGOkQs47plCa2?=
 =?us-ascii?Q?TI/UYyfVOv7VC1N2ZyBM4HAXtaZHV2vrzVmGJAFIMjJgNvnl/le+98p9TNbe?=
 =?us-ascii?Q?XQPZv5T2IKrW/QrZmRTDSoFd5UMz2TSdbXiU6yI7BiB5xNcKs0/WMaer0vBa?=
 =?us-ascii?Q?ekrliFUnBxVU7K7+7mJLxDDMePdydtP+HzxFTD/iSK/0jiHtgArB1PccB1Em?=
 =?us-ascii?Q?E6pLPeUZ2pb+J78Ko8y9zd4q7f7fbuKmEb9N4+bgSty0bzqvYYCqzI81cJ4Q?=
 =?us-ascii?Q?UwhxcXRA9bLBLcjzFy9j8jCI2JWpySml7KX1e2kRkOzoci+nSkKL0o9YvCsQ?=
 =?us-ascii?Q?dIrrWBJt4OaXoUsgcLsPyvMccRpWHaVu0Lwi5nm41/v8LnOoSwPQnUWwrDKJ?=
 =?us-ascii?Q?pBSkrruz2G+fgGYF/Qrxyi9n0MPVh8u6zDulzT0n4I6VAI6MvuoKEFeB7X9U?=
 =?us-ascii?Q?kcCEdUbWvowl4kwFH/m3jBfA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903ca4d1-a402-41dc-2b53-08d9777ab6eb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:25:19.0327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpMyJlF6LyindrdNvTTbk2e5e94snk+FmsXBCJ48AuCjyfmU4BoqZisfkB9PbaS3iZTE3QGbANba7rTG/YfB7eAKt0b+V+fQniW/160OgQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6946
Received-SPF: pass client-ip=40.107.22.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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
index 9f1b6461c8..e5d8ab679e 100644
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
@@ -2205,7 +2205,7 @@ typedef struct Qcow2AioTask {
 
     BlockDriverState *bs;
     QCow2SubclusterType subcluster_type; /* only for read */
-    uint64_t host_offset; /* or full descriptor in compressed clusters */
+    uint64_t host_offset; /* or l2_entry for compressed read */
     uint64_t offset;
     uint64_t bytes;
     QEMUIOVector *qiov;
@@ -4693,7 +4693,7 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
 
 static int coroutine_fn
 qcow2_co_preadv_compressed(BlockDriverState *bs,
-                           uint64_t cluster_descriptor,
+                           uint64_t l2_entry,
                            uint64_t offset,
                            uint64_t bytes,
                            QEMUIOVector *qiov,
@@ -4705,8 +4705,10 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
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


