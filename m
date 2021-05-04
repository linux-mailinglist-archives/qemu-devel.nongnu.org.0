Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FE5372CEB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:29:12 +0200 (CEST)
Received: from localhost ([::1]:55108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldwz1-00030s-Qz
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrt-0003sk-9t; Tue, 04 May 2021 11:21:49 -0400
Received: from mail-eopbgr80102.outbound.protection.outlook.com
 ([40.107.8.102]:61999 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrq-0006zb-Ea; Tue, 04 May 2021 11:21:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QywL9IKS/i6MIaE6YhD2ctJ0tW2Yj66Ag8rxL4CK/n7c9j5vS7VodKBfbNDnl/k/+xBiO/BVlXDHiex2xBjkmItpfYDsQXoiDTFpb6MZZMD7YnvUQIArTDPuk8GYV5mxsYXHsBnTM575wSlS4WJbR7SL6iS6eOVdCWmXgnogBnftmMN+bfnPW5b2PHtFX6T2BPRDkyNcRnGAy1HdURJvtSwTb5pKSDOtT9ljFeRdz20lvD28A8HeXGbqSwSNN1bpdf8SEC9PmGZ3uLJrTg0vdYdfUBkhlikmW4UmvUpHVt8P9WrUO1KEtKK6/d9rI0I/1kkLTgyXQxxgPI7Jwpysug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMUamk2OvG16T34m1QTy9vV+ox2rLx83n5FJOG/3auk=;
 b=ROTz+dVkR4MuRl9UasOPYXV0Fhsuo/3F7jroQQ2CwMbAXxcJO0jMjsVi+QhRHmJtf7ari3WpQ57ScleuGLl5ERpmdWVEnga1gGJb1UJQTypHlupIR9q+CldtSjb1h5dY0RnsFPZcynRJcGHBPMdI3FWkBUSUDk7DTtHarKRewZzxOH0+GyOu/kNQ3l+o6AJKP7GgRVQeygVzFCDynzSqMTzk4YQJCRHYhJGSr8D6oNyW8tcAVBi8PBVlXrbuTYq+2Gs2CNWkeu0XB9smFQhIhmh2dsrYCkjmsU0uRSzWg4tk9hLncPjxxl5/kXHA9MAnTQG5ajy7dtu3bB7T8YDfpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMUamk2OvG16T34m1QTy9vV+ox2rLx83n5FJOG/3auk=;
 b=kqbG5dQa4bYGnW/z7f08UaC7/ibERwRVUOyxpBoix41ZOyxKRHNujUxdoEvx7CaoS7WyHXuLT1hTIj8TAh5gjBGzfbHkbuk/omanWjnfYh0biKuZ1UWES1cWfea2cB7vZCFzae4cZ9coyGU4dTs+J22npv3Nyh7T1wcSedIMOIc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4916.eurprd08.prod.outlook.com (2603:10a6:20b:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 15:21:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 15:21:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com
Subject: [PATCH 06/10] qcow2-refcount: check_refcounts_l2(): check l2_bitmap
Date: Tue,  4 May 2021 18:20:19 +0300
Message-Id: <20210504152023.322862-7-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 15:21:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e4b4d36-a936-4c2b-82b9-08d90f104caf
X-MS-TrafficTypeDiagnostic: AM6PR08MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4916510F87EFFD4F4DA8040BC15A9@AM6PR08MB4916.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:389;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJZQyrWl6/Y2oPvYuJ+X4EoMSnhcDLbP4rQSsqDpXn0frpcHV0x1WFs8NmTQrmxEAXE2yj7nuMwDmXD5IvsiVq8Ey/F/sOETLqg283E9kgYPCZ6t+O5z3+1yrxu84lRyYD5UrxptL+WKMoeKzqZ0Okubu3FsS7PRh8dWz3hR9BuuUHiXczKSuNBzh+FrmJAs6qakTSTZ6O54KEH+H1fcBawtYcVNNPvjzjKIspYQSyLmHpZy08yY1CQOq1GGqH7Dhi8vZvu8v7e8S3FS/GnpwJoDLy3DVnIpa3xLqqVIKzf8NhrGRZ/gX8+hj6VlKqlx2ncVX0rnn3teNqPWqKDZlMzS0N73Ahv6lQoxl5ZT9WqqZvr8blTRD1Nkq2uPLMVhSUrz5LLtEa2NT9UC8iTw6f0R5QCx6D6ziV4Sed0YYlZPg0LXdaXYWbuMxGg6Hg93VYh2Ckmk2rz9xDF3cppfpPO9ta/yTp6MGZiJcRUeOX9OjIRW7qnw5o1v91U10SaHXyVOFuZmZbsiSdErRqkpdSueJ8akzIgkrhBtlUN5V/EkP4d0eFDPlN6iJ6YE9pPaIJbjgrv0SiiMCZLdVFAdOnoqGJ6jtjRpa+nxdMOskao5pT7b3c5hTLPP1AaSYh0Hs8e+EZFvSV2p0VGtpGVgzwoTTHrm4fSVYlHEV392YfMnYpkQ9mF+dO/tEOCUfd6F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39830400003)(66556008)(52116002)(6506007)(66946007)(16526019)(66476007)(5660300002)(107886003)(36756003)(8936002)(4326008)(2906002)(6486002)(86362001)(186003)(26005)(956004)(478600001)(83380400001)(6666004)(8676002)(6512007)(316002)(2616005)(1076003)(6916009)(38100700002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fCGuw3erGU2/yUvtKKttHl2k5B9qED2pADWpEOSd1dHu2qRhIIPgPzkgi4qg?=
 =?us-ascii?Q?ak7G6OGmnJKBMIAyhyl4MdpnuuULGv9GjdGNdyKWPQ06tg/asLxVSiWy+kKe?=
 =?us-ascii?Q?eV1Y8mijMVvKaShQNdk8VrgMLSWu3LJQdMPsVai/iyGaxmrui6WEDeB2A8Zk?=
 =?us-ascii?Q?EL2bsGJbEOsKo3aC+uMJ19MZ7KJB1yHWTvB0p/5yx7SfJee6O5rNpG/gxZfD?=
 =?us-ascii?Q?oGPnU0UDy9UJIRyMgyMm7fqBKNzRmvDHMrDgmP+eFkHI5/ZQO3egyLmzqHHK?=
 =?us-ascii?Q?sWYyzWsop3LzMAKjqePlCkhIVrQTXg2mHvRQT2lcaIoD6LO2DVZLpO0syejU?=
 =?us-ascii?Q?Of6xY+Dzwe8ZQxngXzLCNwotnuZsO9KZzYRJBNZ0vxgygbbfKpYo2MeTmyfB?=
 =?us-ascii?Q?OCI5CYJoe5ref0+9d4S2IymE32rB8t3eUi9AMurwV+qO9SRQ3FjLHN3tOBA6?=
 =?us-ascii?Q?OMljP+gInaN4RdU+uAn2dK8NiJ+nCAiMgk+X12tldDulEBQCP31075oIwGKM?=
 =?us-ascii?Q?gTVA0KNy2TtS/E3kPU+nPQSgNmXPmCrX2Hk3wOGNG5KNUv25zfLdy+PKr6/Q?=
 =?us-ascii?Q?QyPpMvzQ5XEfmmolmGJR/vWBNLURiPDlr5VC5a4tJCuLpzwxuyGgEz1rypPe?=
 =?us-ascii?Q?tX23JdhI0tfDxIlCqUwlmF8lyb1RXrlUoISf7a2dEUqXiaHhCOuRkI4IgTnS?=
 =?us-ascii?Q?7ehf/qWq7K5Xe+e2ZWgSY9AfTVsbndG9bPRm0EQF+UN+Ar+eBsFLj5P7UwuF?=
 =?us-ascii?Q?xDALLMHqB96WU6IgCktBwW6IAg0IXeS/Otf44LwuCfb/yAp4ol78ob6F1yb4?=
 =?us-ascii?Q?z+7ismbZIhPdflN6g0x4ME9h4ky8jnhIpCkInGiU1Tg+kEYfQfoqqbjKrXOc?=
 =?us-ascii?Q?j3nzadx2GDgd+OqfAbvYa5U3Mriettg6CfKs00n2N9GVdXXPfm9kda/4AocG?=
 =?us-ascii?Q?cf3AzP817togJh1Epq2OhRKhzb++wBTrqcukGXAuU0EhdPe0unfVDNmGSDnu?=
 =?us-ascii?Q?FTFIh+fzTQbgGdY3vJPzKtLj1Bi4H0L9UJpM8B6aG6WWibt+gKjZdoy9HOrv?=
 =?us-ascii?Q?bRzf4GuVsOi5qLFiSctlsz4Tct7XWnxKQoxVFx6LS6b4FtBriIABqjxx6rdO?=
 =?us-ascii?Q?QWbgy+tbShGmedTNHPoOEUY/Bt5oap5eQ7QTN0xkaNsi25klMIDI4z9nJ7TE?=
 =?us-ascii?Q?O41I8076AUc0+JjtvmR69dxxIXhsceKlHIdZ93B1EFhwR/bEcv2V+pLypkUW?=
 =?us-ascii?Q?erGY3L+ORPHFMjHmubi3+hb/A4hsHqABlUoCe8/unzkw3EsBiS5CelIaRJyc?=
 =?us-ascii?Q?69VPu5pPilqXSTXqHkeET58X?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4b4d36-a936-4c2b-82b9-08d90f104caf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:21:33.1792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Gx5JN6EExm2rATf+HpwwU4JdNMSFmiNIFXVCsgfRJQT+q6lfKLtaebqbl9LeEQzD9L+pGOrWpv9P+qOCBwcz/62yeiTkN3lrVAYjBvBUhA=
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

Check subcluster bitmap of the l2 entry for different types of
clusters:

 - for compressed it must be zero
 - for allocated check consistency of two parts of the bitmap
 - for unallocated all subclusters should be unallocated
   (or zero-plain)

For unallocated clusters we can safely fix the entry by making it
zero-plain.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-refcount.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 62d59eb2e9..dc940f3003 100644
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


