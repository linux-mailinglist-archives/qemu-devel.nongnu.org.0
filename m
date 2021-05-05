Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BC2373557
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:08:06 +0200 (CEST)
Received: from localhost ([::1]:55270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBdd-0007C9-Vq
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWH-0007vN-RP; Wed, 05 May 2021 03:00:29 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:64516 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWF-0005yd-KL; Wed, 05 May 2021 03:00:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMb0k4eMQb9fdRugDMIR04u/ZLwMNrfsZLgacFrxAQq07NRYtLw3MC316VFDOol/qMeuKG2k9whPQ1lOPxB5S7aI1Iho05Kc1vPnQkt/tGjAcIF9eX4aqyJNloURQ35hpnArJzK1mDORMoJvTp1+H1kX5wdbHm1BX0RQ8vOkt7ADka1hWSMUbyh2BIi7Lgj/R+a/xjt5VNE05yKL1SIM4VaVB3npiP81o8mTEvgB8rP9oU9D2aONSqnrVEC/pzwTfagRq6buuV8XA4eeiNO4X8NQgGlM37laVweWQA0XW0uINv6292WNIPX7FVbKMZEeYIf4bY37x1BTa3UdXPZOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1GsUaDfim50SnaIEID5KcE5RqXwxEjZIEX0ir3DYXI=;
 b=cupkjcm10jb9rcxHCYK2Aq6qVQmKYYvD/pQrtm9Xi97o0pa8tMmHqwZQEh9Yw8VSEImeCUCWQgv2S2Ds3z/4nyBbyfet4YZ8bzutgkSgg33NQiqReFKZ9exs09dNDv0gvi+4dQcvFoDm9wdzA2k8cEZv3ZZvA0chhSajjPFxCHUq9S49heA8X7ig3GjxyZyHm8/aC7jUYENqA/KRFISOqV8cF62yLwdOrKb9M+Z4aKplfXerqW4pBuMtDa6CLZ89P/k8suYouH78aY/FgJAahSpzp+Z34GMhLs2xUEEDz0S/uwlJzKVMmRQE1zel/Smo3rWatQpluRm6GesBW7hLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1GsUaDfim50SnaIEID5KcE5RqXwxEjZIEX0ir3DYXI=;
 b=pKDtW13m7uAEpKSGxSMr8F1vGiTeRPfRGYTYpgXF4nNFPBg2klGWHgWP7PljuV/7Mm3IgzNFm/nj3Oq/CH4jNRz40ms6JKn9Os+HFUuXzA4ij2Q229fKfC9Wm/ijT0hGHWYg34ABFZmV5F2DnyxduQdIhb5keJs9GcVblSHM6Fg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:00:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:00:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com,
 eblake@redhat.com, berto@igalia.com
Subject: [PATCH v2 06/10] qcow2-refcount: check_refcounts_l2(): check l2_bitmap
Date: Wed,  5 May 2021 09:59:51 +0300
Message-Id: <20210505065955.13964-7-vsementsov@virtuozzo.com>
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
 Transport; Wed, 5 May 2021 07:00:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89ad73ba-19ad-4f44-9d59-08d90f9370b2
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652886E66A19F7BB6485F96C1599@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:389;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7t9GabUcr3aBpLjW8A9MqJTtazBRlo7cgEL6/dmYRHNBVZo6ge2JrXWOGBFBA/QUC+tCToedHVrGKmQcFjTvXj0GlLpJ+ZhR6IhD62aP6oGsAMFInXzxPEcEC7o6B2NRdJkLPjbhHTlijCaraNt9cTiMiM+xfYmQh705RfYHo1+JNjGhY9OKJMc92cngx5L7vlsU4EdldWVMj+kMOIivDArDEqnsy/8marvVDtkkY0EKq/62iNLThBCnEAKusPH/31yVKfOIPENn5enR5JVb3d53e7LVT2Y8jMnJd5E35ZjLpL7Vlz+5EWfKkP3+m3pTPryij6Rr6RqVIJ2kZpdWnwDbztg09uJyGyAuYmqOrDt1z3qjk9smLn1Bepus89aMe8TVyI5tMbP8rc7MaqfjS2l5cVF4i+8T9sjTEVs9+G1tTXNcbZNDjGK1OVmmoD6K6O9InR60yNov1XaxDG6iICHorfx8qoBJqCa3MPOxoD29DfOk1hkXWFa3s4G8TYoyJ4kr20pZ9JRng6LD8hETGlOYc4zhA6mN0e1BPXBGI3yKNxsCSUKhUchk4rXFI573O/qdWxX/3htC45SWifL5X7goZ7H2hf0HcwEV4AoFpOUGCCvSMaRBqouXGs1Z4L1VyUVdaVH0O7eqZKQWauGxWFg9b9+XQ3SXbh8FzappsmgPuefMLrLuNTuF7xd9z+wM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39830400003)(136003)(346002)(376002)(2616005)(2906002)(956004)(36756003)(66946007)(6486002)(8676002)(8936002)(6916009)(4326008)(6666004)(16526019)(186003)(6512007)(1076003)(316002)(38100700002)(86362001)(38350700002)(83380400001)(66556008)(26005)(6506007)(66476007)(5660300002)(52116002)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8s/DvbgZHYBVfZrl8TQsxS1d702pH2eOlXmXtUvdKwqs079Mp21VBnxApyN3?=
 =?us-ascii?Q?AUgjIWSHBiyJ1UdQrnXCnFA+H09bU6inxLuUxym7NNvK7cadaLoJIlYVZoPf?=
 =?us-ascii?Q?LtwecrYmtKQ9TKGHUKFkQWhRfw7huvA6de50zgtA6R19B4tKdmPwPwNxj1th?=
 =?us-ascii?Q?Ibp5CR1CnZRo1kBM5b1CXFjh102etNvIleq8eSU99K/ok/Pd3wEAoZlSbbCP?=
 =?us-ascii?Q?fSSoDF+bIBy869LMwriAOAzou1BEMTtihQquNw08ryxgdkx2FG/gE9+Qhmyh?=
 =?us-ascii?Q?KcOwEFFmRXFvYgyEMz8XiM55wKPdWTjjimRiykucXZFpt0DB7UMHkxpv4dNe?=
 =?us-ascii?Q?x4x7tlL2yLbTlwDFc+A6NvEfi2bsCjhK7HIMRrZKOdKmnYlbKDTFi5AEF0yK?=
 =?us-ascii?Q?rPCf3trrstfhexQYxOxp5x4R7M2D2cB3jJWCglGef+n8/+kHM/WHnx0RDG+T?=
 =?us-ascii?Q?W1gcZMJ2Qm6RxAty606W+R1ErudVtx6qm3EJMWG/Px+cGwtsYkjdkl4nP6b3?=
 =?us-ascii?Q?4k1RQcj+eq4HMs+NXjH3PrEVkgku4YJ2JseWjyJdUIx/mSEgLVT9hhpNTTJT?=
 =?us-ascii?Q?q5BnDCczhyCKeW9BK/vt781ajo/5eUbiXpfa8WOMSI+JDfVYGCjUufsipV/z?=
 =?us-ascii?Q?NNmOzvx/y1GIFBvU8DjwXI7hRZJD4udy3JMiq8MYBEY6AB4iIa6OXsR6zQgE?=
 =?us-ascii?Q?TUY3UUPwtlR40IA5HALAU0qs05mZWmk39UyGXFlpZ8SvnCV1vHCZefTMZ+VU?=
 =?us-ascii?Q?txqYsiOwmeIG90L7UMOuyXcybY92BHTmC3vJZWw5i+cl7m0L1AFSyyF6oubC?=
 =?us-ascii?Q?PPXGLwnDE1aqWOoqew5Ww8E/3JjJShUjju474VdYiTCQSySb085wZiJEa9pk?=
 =?us-ascii?Q?rhXHACV1JLmat+WlqprdidgdWktPiNGE1d+KREJ3ZmKzNRBc8VV8kzk2dfcZ?=
 =?us-ascii?Q?TBkePjlhSAY2tSYSAK0xfPGSy6V4smX6qhqpzhn0+8bJWKLRFFkEBzBUyQ77?=
 =?us-ascii?Q?Co19UOHS6LxiWTyUOOvzjqS8G5+KWrTrR0NGSR3cQMZ/4kXQME+5BEjecSbr?=
 =?us-ascii?Q?toilwMhsVkeEaCWhRc7SMG3L1Zt5HTFcw/nTS7Reniwjh9/TmkDGn3MvsOMU?=
 =?us-ascii?Q?EsZUU/QKhfZPKdN5qyLWurPDKKMDRSt9+UQOi8o5G4kAHm/dKbuMD/krvD7R?=
 =?us-ascii?Q?C4E7aZd4TEjdtrGLAfIUxrhFAhCsZh6UrImg1ILigF60fmw9QvvyGRrIf+Dx?=
 =?us-ascii?Q?U9bBsFMyy6VG2H2ExK555yLkmqEKbEezBiYJSx4pN8glUc3NErED5mjtdxXz?=
 =?us-ascii?Q?GlkKSXIGwm/ZttShPjyXM/Yw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ad73ba-19ad-4f44-9d59-08d90f9370b2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:00:17.6123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQ+mWG9L49KClv4tD3T7IrpBfJFIWyhMe7WgDbougLGxYiLwYzHANEKz3gAukoegV7BzyHjNNlkvleu3IbF2R4gKN9RIVdhabNf7kF/Tbc0=
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

Check subcluster bitmap of the l2 entry for different types of
clusters:

 - for compressed it must be zero
 - for allocated check consistency of two parts of the bitmap
 - for unallocated all subclusters should be unallocated
   (or zero-plain)

For unallocated clusters we can safely fix the entry by making it
zero-plain.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2-refcount.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index f48c5e1b5d..062ec48a15 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1681,6 +1681,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         uint64_t coffset;
         int csize;
         l2_entry = get_l2_entry(s, l2_table, i);
+        uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
 
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
@@ -1800,6 +1815,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
 
         case QCOW2_CLUSTER_ZERO_PLAIN:
         case QCOW2_CLUSTER_UNALLOCATED:
+            if (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC) {
+                res->corruptions++;
+                fprintf(stderr, "%s: Unallocated "
+                        "cluster has non-zero subcluster allocation map\n",
+                        fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+                if (fix & BDRV_FIX_ERRORS) {
+                    ret = fix_l2_entry_by_zero(bs, res, l2_offset, l2_table, i,
+                                               active, &metadata_overlap);
+                    if (metadata_overlap) {
+                        return ret;
+                    }
+                }
+            }
             break;
 
         default:
-- 
2.29.2


