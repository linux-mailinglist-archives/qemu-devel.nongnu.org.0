Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202C3373562
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:11:33 +0200 (CEST)
Received: from localhost ([::1]:37846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBgy-0003I8-7M
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWN-0007yW-6J; Wed, 05 May 2021 03:00:35 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:64516 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWJ-0005yd-SF; Wed, 05 May 2021 03:00:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dlao3SOtX8xB4H7UMVxXDlI5rv39iTBvblVKuzc1QVwBohnxSUHIypxYaOCKZaUXf1kpqM+18okN6t854gP/pxEvY7AIXIe+FmD8YXylcoPKK4cQsIg6gwuZogJSbhtX1gl6kSkoWP+gyMzu7TqU7xjQE/nVugC7E0E6Dn023UfScwQlSiDu9A+WIAnYikmulS/jxXjpessZMX63u7cOo06Qt5wpurpnNOBgXm1AzIZLqT1/+jx4U5+XWylOx2zCLGRYGyqWFodzfUEE5pXRuWa7jEUoz0JSrviGjNOgcxIPQZt4N/kwbz5B7rCuNn0NGn+5Mxjnj5XKzVbn7deI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffmEzwA0uINAiwdsXSGxI1/Cggk7sOwDcpdAjAro5oc=;
 b=Tc7VJi56jpgp9mXQjiJJDyaGkjXZDZJFn39SSSZhJVYeg/LnDt4+5P3gx+pFVpMoltF52iCpdRW6OzVc1VuiyXykE+Cy1ygOQEkdDm64guHrbSkAvy2PHM5GUS29XX2f28v8xDf26reOn8jCl/LquzkRImHn4/xYJMnev7fALw1jFcg5UtnbyDPnESe4FC9IUIZ4IOAQ9O6JqF+A8r3Zn5AVWLndGkmwpm45G67I0TozajyJcnGpNk7+g90edAL+vAWjjbvDgmMwkklwB761Pei0IpNSpZLAUbJ4gAZucCkpXkCySRl5oDSMvHiI+sBfs1E2+fURDz5G0sK9BQd9lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffmEzwA0uINAiwdsXSGxI1/Cggk7sOwDcpdAjAro5oc=;
 b=OYRxFmcBELYzQciGkLhP4AatScNuCn3uZ2++6D6u4nTAh3GH8pgdFLF3dWWmrkOAARjeFICPGVXRtq4uXPWuWfssOHpKvbBJBg+of9f0EGSI+cVo9FMnTAfWNSckUuHnEmru3U84uiZ+RkBosw6qRFGlcTg10xneQfhglfW0WyI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:00:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:00:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com,
 eblake@redhat.com, berto@igalia.com
Subject: [PATCH v2 02/10] qcow2: compressed read: simplify cluster descriptor
 passing
Date: Wed,  5 May 2021 09:59:47 +0300
Message-Id: <20210505065955.13964-3-vsementsov@virtuozzo.com>
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
 Transport; Wed, 5 May 2021 07:00:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 860d7244-cd22-4a3a-37cd-08d90f936d8c
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16521AA8223C837F13A5772BC1599@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qkSx7KdFMuxQlWCn5CMOi5Un1YsAGQRiKCHrtZKqh38/aRqNrl6BsFdB1tEp+b83fOytxpV0coB4fwxmLKFCfXCdzuSWJenj77rBGdR/bOBFZOUUjTKN5tjH7XkjiS2K1OERm8RE86Ymxbau5rV1cHwqL4u5Os7M2fECRum53zfVwJ/ATFy29yT5OwfthJwXvNFngZDbtjRZ6NFobMrgcNkpzn1R0Dz337i43WPZYPVXSIqj8CeuzRaMHSCZcrIDL+BY0xczkA9EwS69SI5TIqCkkuXDuhJ5XT6frCpLszMxknVjfgcoucJ/Zvs0bOnF8ytHcJ0a2G82O5IUe4qRLTXGDXKytFLyM7Dam1rr1jgZmQx8D+Yn5Xs1iJtK35R8DACQ9VnIkWXTUwuOCjUk7rLA5N/iGMshK/pPYnVC6+6fc2QDlfU6EHGolxb0dsGdPcLyYlCxfgaMfeN5HnNudPgGAdZu/2748mWm//PHytW51hYkJ0A/rJfInv5DYbLxv33NxtmM8UlNKMELrKiibmb2Zqycxu8ybmZMpGfg92zCRDsL3K3Ms8x4eCR+qzix0JL3eQJIuqXmr4l67H1gwJVTczegmgR8K7D1YOeUgHN7i04gikZDtdNIJC286pap3AUEA9U8DkTctOw1IbbOUlBYe1lo3a8c3piqhCEtsxGvbtbSRY0Uk7OD4s1eaC3h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39830400003)(136003)(346002)(376002)(2616005)(2906002)(956004)(36756003)(66946007)(19627235002)(6486002)(8676002)(8936002)(6916009)(4326008)(6666004)(16526019)(186003)(6512007)(1076003)(316002)(38100700002)(86362001)(38350700002)(83380400001)(66556008)(26005)(6506007)(66476007)(5660300002)(52116002)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6pjiNo4Jz+sw0gvKooth59aRXtF+2mlHB++Vv5Yjyg3xrdCH82FncXXVjSl7?=
 =?us-ascii?Q?E1T/G9DUqH1j7kxDfX6Ki42bVi0IPUaMdKqmB/LnKGBCsOenVQwu4WMKpqbp?=
 =?us-ascii?Q?qyEkWNXskQoWZKGZcCXWrp7TC1p6HUsggsSwhiT9MA8GhXAAVB/fpRzBRhgd?=
 =?us-ascii?Q?nYDk3Ft1NH2VV10MhB9kXukYm/i8K7HPqVaI8utLWdHePdXPozRkUTNoDqi/?=
 =?us-ascii?Q?d1Ug9ee2c170DvXWCeK8jQMUGWXd7Z4lgb7gb+zfDggocFzsMAkPzi2A/Wlw?=
 =?us-ascii?Q?N8e6ECcV4OHdcnczNQcN3SU16vVtK+juslndpY9Jf/DRPrW4HkAYefi7wJYp?=
 =?us-ascii?Q?R01c6GbYzCTIMEZFcbALPon4PA8aXZ3afFW1yJxpT5plJLwVmkeLjFdee07h?=
 =?us-ascii?Q?ig4q6NdbC2osWxvoxF5ILmhEhUfDU3yaKAHAmsDSAePfA0rchaXQ1FvJa/Oe?=
 =?us-ascii?Q?ybiQASqepLreSwQU0Fs+9JckP9JV6C/u0XuVEyPru+xBA87PkQR7dh4lf3aX?=
 =?us-ascii?Q?l0oyKF2zvLIxW6kk06DfNl0KOWUWSGBhbtD71O5YyLXUhtgNEgND7cJzQnF5?=
 =?us-ascii?Q?YvKTVNf0ag23VieVIa/+R1Mrirj6Xqamn5a/EXr4VmOMaOHFf9f5QIsSBZTV?=
 =?us-ascii?Q?soISuVO/XDyQ8AfmoKlvVSx8TqeL+tgPdtQKRVvHgnzCyVSiUZK1NA9+8CFF?=
 =?us-ascii?Q?+Bfi+6ncmOVbke3Ebq/I6Q7rx0ig+/+YvgT1J1SPohSf2HavXUDF3tGY9VZN?=
 =?us-ascii?Q?CSDgNil49sy2QJ5BHImgleaWncdPRKYoh2wJfxUSPtv75MtHD41HYhkrBOH/?=
 =?us-ascii?Q?a9favLR0h3DxkP84lSmcw+PPWPsy4M9npeBeoBAoTQuBrq/lKnDd/uaywPTo?=
 =?us-ascii?Q?9TL/TwAA92g82GumaBWbnfe9j3SB1K4K7C0Bmf+POo/qKgZ2+ZAdRY8VEIpa?=
 =?us-ascii?Q?5BGUiRqIM0RvFS9FFmzvTjZ6rVw9LxeglT7frKEPzrRQgcH88KY4nn8Hj6/w?=
 =?us-ascii?Q?oLvGOTwMH+0mjOLc6Fa3pFhkkm48tvtL0HbL++gE7sUbGOKPcFBfmyOxPijZ?=
 =?us-ascii?Q?O47hYxuHeZQphr9bPHhdFAun2NylifTZCJICKY29FlJLbsxfhUER0mzm2If+?=
 =?us-ascii?Q?3N4F/eDOKtXkSKLAzCuViwCcffNSITTEXfDhkbbrj54rCzqcs8SelC2eAjHg?=
 =?us-ascii?Q?bqreic8c2rueLsUFXv1ChEPmMLw8OKsWjr79ZYvhUtbJPM3oFHuX0m/pbb/G?=
 =?us-ascii?Q?7aQiYM2CCy5r+oWeGEymOwymHa/+FwCYwjZgPO7pOwiNdd7riXF0Quu3JSuj?=
 =?us-ascii?Q?0CfG3U+oWteIqW+n+Dp9Cyz5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860d7244-cd22-4a3a-37cd-08d90f936d8c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:00:12.3823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ko+SCk2L2/8Mo8qw7hOOaEeYkXeGi96GNEwi8vuaUP1nIVsOuKvXPJViRIdnIA8t3e8btFXd17QxMxor4I1vp2Uq9EPq67nGdHEwiggIaag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.7.118;
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

Let's pass the whole L2 entry and not bother with
L2E_COMPRESSED_OFFSET_SIZE_MASK.

It also helps further refactoring that adds generic
qcow2_parse_compressed_l2_entry() helper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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


