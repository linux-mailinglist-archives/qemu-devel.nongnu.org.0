Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BED372D08
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:34:26 +0200 (CEST)
Received: from localhost ([::1]:34486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldx45-0006Rk-DR
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldws1-0004AF-3g; Tue, 04 May 2021 11:21:58 -0400
Received: from mail-eopbgr80102.outbound.protection.outlook.com
 ([40.107.8.102]:61999 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrz-0006zb-Dr; Tue, 04 May 2021 11:21:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epdkC18H8a8DLJcnbtFi/oq6lD1n0dIxMUmkkkABaklWvs6NP78Fwb6DT4CTfNf75QgZSaLntTaN/9gedygYoKe6z+jCYDYVsxNPsZVhfMMlEvt5pld29a9A0sL4C401s+1+xepnNxq/2CyawqToUVNsBvHb2kor9pkpcITDGcBKr+aYzkYzR51RO6mGPk799OAAhe+quM9/DER9c+V1yWvNW3B8kndqYrBRF9lrY+n1dl+iYjBXyHXoOaOqaQC3zpZ+luhgfH1stZQtLUAOG5d07Bt9zNR1elHBC2Wh97DZWCzo5kcPUDHeNZmJCu5kYxp6crnul46UTvTwrV4CtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz+c/369NlV3tQVgiVsR6mp8iCYXUcN8vmKgKBl37go=;
 b=eOIXhqk0VC1D53XoJijHCthk5gx4eJFhB+Xb8C8fMuUKizROXCT+hI92VQP+9+I4rpHSoiEh4Iy1L6Hho11UJM54WhvbfHcDk7Q/vbOhKXQoEUvsvSwYyI/yC0HOlvWh/arP7mQk6bhKUgJwBZrvFCygXVLEw3cth7J92g3ULFu+BxQ6WrTARhIpTYP3yPphgOVQMpDTgB8sYY4xwX8CQJsT6q5Wy2uS/bHsLTwYFG8LFhzlLHl/WJ6SmTvnPrLSmGsGkwlRk5nFa1XVN47Orod1VBgGtkLC2pxRHQim3JdhTWKyD4e8nOJU3pMm36duTRJ0RA4VV6cp3kLxQK9lrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz+c/369NlV3tQVgiVsR6mp8iCYXUcN8vmKgKBl37go=;
 b=XBEdUZMy5sjFUMJfnxv2tQT/eIWUavfea/D8ySEbVimrENHp8piyoC4pnGVYj5b8I+KVwJNA1axBpZWbB0GREaw89dAgS3dZ8KVODkyvPtMfGTOtCyZpbhEHRmOXwNjBtKEtiGSvPV3t3TYUtPw2+y56J5zaG2uE9iLxX1AUUTg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4916.eurprd08.prod.outlook.com (2603:10a6:20b:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 15:21:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 15:21:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com
Subject: [PATCH 02/10] qcow2: compressed read: simplify cluster descriptor
 passing
Date: Tue,  4 May 2021 18:20:15 +0300
Message-Id: <20210504152023.322862-3-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 15:21:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1b08fa3-be9b-48ec-6ca9-08d90f104a63
X-MS-TrafficTypeDiagnostic: AM6PR08MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB49167E36123C14C5B46C44CBC15A9@AM6PR08MB4916.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sm1T/QnIRf/qz5XCAjrmNdGCdERZbgtKYApdDiRGBOkNSjwiNWp0WyzvPBQZVh81P7Y52u+xFDwNCogBkEMtgttbnMYbwS9vjBR+klpsCeuRHkpnc+69x1wkOHdnSnbGSzxsXkwB834BuJ8G4md1JMZyWZmbk8Dpi1L7GJQytVag4Bon9Zxqf9nwNfVvtEzzqsYljQcyh/DnObWfjWdZ51i3tLETUj8e3mTI5UxK0AdS1NXbcNS+lzbAnyruNJSWqzR45h7rvEWJdjVDzRfiBE1BQWW9R6IfSd3QS/fP6D+EehG/qihkcTAYmHCB8yvoAeOiZApM/Cq8vA3sOjw3+n6aNryiBLGou42kR/YaJ/Af7cPX9IrcSqpME/519MWAwMvFvs+vM935UCCTJCFvGPye9RCrxpsfo3GP9HJ2BmWflrWJ7J8g3kZBxSfuJEmCUcYa5JrZk5RFcszbCykQwtIFWtSv91dmO8NSFZG7HWKOurf/9dSkPvELu/EuNC6/HAjr8gT5b0ynw1P6BAxbA8uom8d0z5vcEgX8UcYVfpVukpF1S7Ly47+flbvMIF/621++uTU39BoJ/Iq/GUClD2yVDHTNDNXIBbPouWtfS92hZzWxCRf+KjtwTZ3sM+nMDYL6EGz8pW9MgtIyGtfeRUMJlhc4WdYX3EAyGtiS6QCO8OM/zuW6jdxrU60eIRJa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39830400003)(66556008)(52116002)(6506007)(66946007)(16526019)(66476007)(5660300002)(107886003)(36756003)(8936002)(4326008)(19627235002)(2906002)(6486002)(86362001)(186003)(26005)(956004)(478600001)(83380400001)(6666004)(8676002)(6512007)(316002)(2616005)(1076003)(6916009)(38100700002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?g0QfaDegL8D6crYS+A+wglQmx9QJs+UPfYvWM3MI6VEPMv7LifQ9FA3Kba9V?=
 =?us-ascii?Q?Q7jpW9Nk1Kzc5gBt82YFvL3z6aUfRFJizOp1MS4ORhadtCgwlqIyLOpwVMML?=
 =?us-ascii?Q?ztf98YaG0E0L155QHgBxi8iFpE50HlvW3UgrybMxck+t6HVBZGqZJ0XOrR+q?=
 =?us-ascii?Q?w7mKCBdA9eKxeXtj0AChd4lZ5LmZ45P0OoHhc8wGBwvNTVqECef70qfog0Aj?=
 =?us-ascii?Q?2Z9rxJsGXZ9bDLy4bFh2xXMeDDY0ys99q11/747NLBF8yheayynixxqfqTWc?=
 =?us-ascii?Q?XV+Z8ouc+BxbrmQhd4auoBErxBc48rBCJqS5v9qnW/DlV/Ilm3Re7YuZ1Xyu?=
 =?us-ascii?Q?QAPnqcNiYFfdYsYsT6pFKW02XLBUZt81UjEqrzeG7r31D/1DNwqzzXjHvMXP?=
 =?us-ascii?Q?rKk4Aytc5tmPuQTX7/07N+9j6BNg1eB281uKKtUz6MzVIx8x6f2bczzrxW80?=
 =?us-ascii?Q?7JdehaptSPE4+YERttgry1EbnCOEIJKrcfQ3X4dprtBEgOdoGNVv+RYfLflj?=
 =?us-ascii?Q?vty4/ymgYwt4s9leK+YO5KDAkCcnM7n9HUxW3X1RdnLFQvLYOtUKQWaYXMgX?=
 =?us-ascii?Q?EdxYpUKcxCJhRkswXr0rI9ERtdxebgz3v1QZ1/yJldwejOmwu80Fq7fHqNwr?=
 =?us-ascii?Q?g5mUmp5/yZILkkAqJ/UwZs4JdLafa6RPrOzPo7bJEYid0zZU1tkF82H9zp5V?=
 =?us-ascii?Q?cjsVIF4QRoNQviqv5E2pjCU5q9RtfbnERAhD1LwhpAVNLO5d9uAl+vbVwnW3?=
 =?us-ascii?Q?LqoOUQsSueSFz8KV3UBPdrHKBCDHXLQoT/iPal5cYoOB52pTJ898qWWkjxRF?=
 =?us-ascii?Q?yn5QilKF89/SHR4+Y7RglUi3YdsRlZm0OQv6iRgVpRtn/CzmLSmxu461Pf0P?=
 =?us-ascii?Q?ONddjWJ7GtBWotMNF+DKHg1XLxjQvMAH/LDSR0FBn/fib204J6rP4HYctdVP?=
 =?us-ascii?Q?+MJQIYhHU7zk3kG7iVobbQkPmDA+RJhc1RNR9jxwETid1MP9fKDmR1GLdXCJ?=
 =?us-ascii?Q?m+Dw8AbdmJWKGzblBhrqxUHaBY3NccgwmFbZ/5OGbdAYktgzr0O+8qcM3XBR?=
 =?us-ascii?Q?t/jj5D3aUMocTNwzlsScFm5HkhsxMsGCcT+NHX+FCeIljt7Bgnekf6sYkU5g?=
 =?us-ascii?Q?gMHpKtLHB7bwojdUCnC0sfpRhuy7dVouickvHZWyW1ZNCNCtNrHSQQM0ou4J?=
 =?us-ascii?Q?8QIuIeAOEWzW7F1jAMuBglW75hTRhdOKiOqKiN3+3uB+uSRJzTtNp9l71ryx?=
 =?us-ascii?Q?HJppaBdAto3C7azzMl2qhgWWePBvmOlWvxOu6FTNp2dQ01BAH4uuaACLtSen?=
 =?us-ascii?Q?j1XEghfNdxYK29A+eMcbXXNo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b08fa3-be9b-48ec-6ca9-08d90f104a63
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:21:29.3042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FM+3Wwzs+l7qSTF1HWAwfDTSBvqt0aDZLukZ3Gwx5uGWbTnTp7Eu4X2K9o81+1oNQbg+QJ4ji84XR8/MLi95f8rc3trrrcLgReZk8bUDD5o=
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

Let's pass the whole L2 entry and not bother with
L2E_COMPRESSED_OFFSET_SIZE_MASK.

It also helps further refactoring that adds generic
qcow2_parse_compressed_l2_entry() helper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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
index 9727ae8fe3..746ae85b89 100644
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


