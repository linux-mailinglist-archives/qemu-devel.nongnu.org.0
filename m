Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DF3684FD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:37:45 +0200 (CEST)
Received: from localhost ([::1]:43108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcKm-00058c-BL
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEf-0007TM-HV; Thu, 22 Apr 2021 12:31:25 -0400
Received: from mail-eopbgr00116.outbound.protection.outlook.com
 ([40.107.0.116]:34309 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEX-0003vI-DD; Thu, 22 Apr 2021 12:31:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxnKhXybJN6BYQkVfQ6MGL8Zr9OXvAXaR8V2NquikFdnnNs5meK4E7jXjFSLxYesKMImFMhiShWYG4KOHqfz4hPR420Jq4s3H4muHSw0ofPsjDzrRh4FdmJ8xOcyIWh9ffiMU81mvbUQ18oY/kcUNhD6QIbNwmX3X90LSWgUjQKbPrTjCwTGOsZeOgP86HVz6EKkZsXBu2Jd3lt6gHYibj9MASB7T0tkZ34znJH3AbUXbuwCUyrdxnuB9g3LBoASH0rUm/B8+jpTNtragow9q4eazZbYw47LHyO8AFfBk3wNixzAvyJm6vH1Q+cnO0EMaJrfYPeJWjA4RItt4E8fhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m5bCo55moG9oA9KkUl8MhaONF6dHB1WZCrTUrcdHiQ=;
 b=O6wTqU/LwO7aV9j/cUnRUbn1NMWoaOKKcBJan1J8SF+GmYMCceyMydHUaegFOFjBnTh0K+3OL/pbbfS9U1THLET/7whWh/ZOGG3Jm0LNfRJiLu2horw6/Pz69y3hcR3QoTQySSK5lll25h2FCjNUEGjSYW6GBGKd7GVSped8YzaVJZBfZ/t1SUGs/HbW3TMA+Fmh/NmDV2nI6u/iTr3p9w5giMzwG9rOEMegVWU2uM40y2CcCQgaJmK+ZVHxlOTWMLBBvLs7Cx0AATPVtqIozK6hfulxUjvqzyAjzn+5nP/xZ8eDaHLm+tmnk3Yzoenb4p3OokcP/xSJT4b7wfgmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m5bCo55moG9oA9KkUl8MhaONF6dHB1WZCrTUrcdHiQ=;
 b=PmM6GX2a4AwMleIt+rShdr9WH/ZpmSGuGYYLc/DgpoccZ4Nk+RApFu8vnkTRd1iat0q0GCB2PMbAn42dwIQa9DeLc3zv3v0KDY8RVVkySMatBailNWSKzxZ+rUs2Pyu6mVVW1R2pUO3foyfbrNDbAt/p9qR2mRy8/mWldOyiE6I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3861.eurprd08.prod.outlook.com (2603:10a6:20b:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 16:31:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:31:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v6 07/12] block/qcow2: qcow2_co_pwrite_zeroes: use
 QEMU_LOCK_GUARD
Date: Thu, 22 Apr 2021 19:30:41 +0300
Message-Id: <20210422163046.442932-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210422163046.442932-1-vsementsov@virtuozzo.com>
References: <20210422163046.442932-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0501CA0006.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0501CA0006.eurprd05.prod.outlook.com (2603:10a6:3:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 22 Apr 2021 16:31:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1fa9aba-0fc0-4e85-7df7-08d905ac083f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38617133C40D2E3617516EF9C1469@AM6PR08MB3861.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:287;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UMO1QZ0ssImuKvnPK67pD7TE+lGrx0It/uhqXHeQ7flQdO9mKu66QRM4aYKqwdT3gxmuvEShSlpOeGqDuyNJrbZI9uAxrF1dok/vde0VfMB0wN0orGYL6jIoheWB0bkTC7s0ueYtQ0/wAMB7QnA0d5pwWPriTJc65cqazPV8YPIh08U1jwmoCs8BOgPxoDMPSc7ye6KEGdm8undGjzMxLWhj5D6vMkh9x9LVTxCuXhU+vdUag1BIaaXUKs1oJVjctqaEDljjqvje019rsccXiSGzO6B8BpPSNgj0fioZEPLlhvuSmTfjfWDo+qnrXQZ3trz98iBruIkYY0GiDdF6lVOaDFvSrx2UuBOaS0U2GNtOg2nduLDLl0zlinYfgAuiy0TtLD9BEJuK9iAbYF+RD7DUrj0plmFPkSoTicPvmX7N8O7wGo6OxfocnSBFZX4yWVGAFf19VfjQbxmyGF39xNEzyDF7F58w3niMGJ+LW4HC32BWvwqRSSvBJIyYIjKmMEA2fpd/ZhkI+txi89WlmwiSib58xKNvQq35CSj309r+O67gwmTHehaZkxboG8NnKKnAx+DXq32IdYiTrkEfMYaKjIvhyjlf0Q//Zj4QB+2Wfq99Qjf52+/1cF6j66riZgUEtJRh9RPRsal6epLv87vu09tf80eTO3fPyYhyurLmQ1wslyxB165bFv8uCnx8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39840400004)(396003)(6666004)(4326008)(19627235002)(107886003)(26005)(6486002)(956004)(2906002)(83380400001)(2616005)(52116002)(316002)(478600001)(8936002)(66476007)(6916009)(66556008)(66946007)(38100700002)(1076003)(38350700002)(5660300002)(6506007)(8676002)(186003)(6512007)(16526019)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Z/XsERihMfI3uYIl1rl+mLQCHLvN4mnbSwH2p3aXTFWEH/wXcN3H1myhLc+d?=
 =?us-ascii?Q?a0QgLfgVXlc8AWpt2SBZv7nHs8BuBVEfYpGGJixo9WnOyosLfHLwd90w0yv/?=
 =?us-ascii?Q?9ak2YniNpRzXyixcrdPYJt+f30zz6o3V/HQ28kNzPcrgNIsQ3Tmn6LDSKRxJ?=
 =?us-ascii?Q?DZxLN1f8X/XFVuxbFle1jaWfvvFswiLZd6IPSpCGnKC2TRnGbFvwcJij32dk?=
 =?us-ascii?Q?UmJbs/Z59iK3/yXs3g7CaZGv1elZHddGL7H+LyzRvuVEiQWmkUv3BgMKeVjh?=
 =?us-ascii?Q?3rWN/VAnyT0uEO4okxRpeRywfspyHF12qRvKYA2YEJzuatAZTgQ3jEfiglPA?=
 =?us-ascii?Q?fi0TQ3SO+xNhv9+3SEnoFyPf1RG0KDdxq9UuDWj01xf3hXPFdQYakUhnTFVm?=
 =?us-ascii?Q?bmVkwyrzc9th5wCOVHLYYoDmDanboIlWCb7mYadIPl3Ob3xssBau3b6loZdN?=
 =?us-ascii?Q?eNs9iPTq1R6BpJkR71AhGNGXq2qMyW8xHGZZTsT1b+x4Rh/GbLROljDvPx2I?=
 =?us-ascii?Q?Cu2zB7L4+8MSe1DTxDLqeVwHRUOj/LeYEK4ODjSJfLQllGFr/e7XzX/9xU4q?=
 =?us-ascii?Q?haMFsfSadB9qNbbeU1J7rQAm90aIIFyWm0SQBnKOZnLEiH8l1WWxq3ny3r6f?=
 =?us-ascii?Q?eWmDvgBEE5kjnTtXJfKHrnE5jByMhMjkoqVziyzm8tgAsp4DoFslwOyiJ9R0?=
 =?us-ascii?Q?boWqacm2rD2gHKotnWkPkW0fq5r2MuYXkD8eybWpusO6z/Je8fBA0jMj0XXc?=
 =?us-ascii?Q?2wpUqr27oQIealnv1Ay+V7Mu/rj6siNWAv4SJ4FEOdtU0CRDMLkJkEfwCSfi?=
 =?us-ascii?Q?wtkKdGeSOPIV3GjPrF8wmKJwvAAqb/+ONTVd2MYOw9/7Y+ByVdnq7ZNVDBUp?=
 =?us-ascii?Q?QJg/MobflhQP08MqcVomP1AF//C5g/QARzCM0uVwwxgAqPnDIf9tIID+tlYa?=
 =?us-ascii?Q?wIlWu0EaI4EEAKC/87ReBB3+winyt2+X2F5dFLR61SQQnRv7/eTvVfWuFNcE?=
 =?us-ascii?Q?ivrv9/FvrvGCy/VMKX4C7UKWisJb2J26FqBpf38N5+Eb6rRojzvVtzHqVvp2?=
 =?us-ascii?Q?mqtBk11ROpS7P6wjYoLxDG7X6lrvKwN4RFPHbenvaiNMPCx5fK5TBIYlPuQE?=
 =?us-ascii?Q?O9wyzAzJ1EG4u4y7eu1cmBy1OtcE4fcngU652ihLuyq8O9hwdHSKYn8yZEvU?=
 =?us-ascii?Q?eP8s2ZVmoQ8g3TNvveA4Xst6p8ii1q20NZJfh326zjeD8GO+bvGVQ+6qkHSb?=
 =?us-ascii?Q?tm5gpFnUSMHFdjz9cM07/gi1SrFItwI+nMaF8DRJ+oevZAkvoh8t+LUVQClj?=
 =?us-ascii?Q?d2Ax3X+wL0NpEP/C5ViLOYR+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fa9aba-0fc0-4e85-7df7-08d905ac083f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:31:08.2041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oxFMJREB5Xo+1xfDt+rEo5lT1/Hk0UrFliGacp3MOmA1wHuqImWz+++0cSU7Lw/mRsL8zrrxomO/oelJKMLLPfSPm+kkOApe7f1so1JLIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Received-SPF: pass client-ip=40.107.0.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

We'll need to handle qcow2_get_host_offset() success and failure in
separate in future patch. Still, let's go a bit further and refactor
the function to use QEMU_LOCK_GUARD.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 066d44e2be..be62585e03 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3931,10 +3931,6 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
     }
 
     if (head || tail) {
-        uint64_t off;
-        unsigned int nr;
-        QCow2SubclusterType type;
-
         assert(head + bytes + tail <= s->subcluster_size);
 
         /* check whether remainder of cluster already reads as zero */
@@ -3942,32 +3938,37 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
               is_zero(bs, offset + bytes, tail))) {
             return -ENOTSUP;
         }
+    }
+
+    QEMU_LOCK_GUARD(&s->lock);
+
+    if (head || tail) {
+        uint64_t off;
+        unsigned int nr;
+        QCow2SubclusterType type;
 
-        qemu_co_mutex_lock(&s->lock);
         /* We can have new write after previous check */
         offset -= head;
         bytes = s->subcluster_size;
         nr = s->subcluster_size;
         ret = qcow2_get_host_offset(bs, offset, &nr, &off, &type);
-        if (ret < 0 ||
-            (type != QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN &&
-             type != QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC &&
-             type != QCOW2_SUBCLUSTER_ZERO_PLAIN &&
-             type != QCOW2_SUBCLUSTER_ZERO_ALLOC)) {
-            qemu_co_mutex_unlock(&s->lock);
-            return ret < 0 ? ret : -ENOTSUP;
+        if (ret < 0) {
+            return ret;
+        }
+
+        if (type != QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN &&
+            type != QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC &&
+            type != QCOW2_SUBCLUSTER_ZERO_PLAIN &&
+            type != QCOW2_SUBCLUSTER_ZERO_ALLOC)
+        {
+            return -ENOTSUP;
         }
-    } else {
-        qemu_co_mutex_lock(&s->lock);
     }
 
     trace_qcow2_pwrite_zeroes(qemu_coroutine_self(), offset, bytes);
 
     /* Whatever is left can use real zero subclusters */
-    ret = qcow2_subcluster_zeroize(bs, offset, bytes, flags);
-    qemu_co_mutex_unlock(&s->lock);
-
-    return ret;
+    return qcow2_subcluster_zeroize(bs, offset, bytes, flags);
 }
 
 static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
-- 
2.29.2


