Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B737400C21
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:33:32 +0200 (CEST)
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYbj-0000BY-8Z
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTc-0002ae-7b; Sat, 04 Sep 2021 12:25:08 -0400
Received: from mail-vi1eur05on2102.outbound.protection.outlook.com
 ([40.107.21.102]:64544 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTa-0007MU-BS; Sat, 04 Sep 2021 12:25:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKbBMe4d6A23Q5kzvaO/nL8e2r8qSICOkYmD1dtZJd+ZNCG666XhjpWykWmb83FA3fxhwoucQcQ8GJ255ZJBsp1P6AUCg2fxd5EI+IbMYBmnwViMbkz8BNcq5EBsbkVU9sFj3vSrtgVxEalCicLIOLqU7YOLuBqGHQ4rnJ1VpcA2nYQ3mB7/Jd5tAOyplhYnTSccldXrUvU7vlzLgtm+++Pcbu+PPvPbAi69IqsPFRRKdMEiqEcmW+AjxrZvUF4TFTCj+tBwdoIMhBCPhMpjjgHNCKFvJmFkRdlPNbBCOCWMd/yt8GuxF9ZB0kuDeOsKw/GbyIqVQWBpzD6bVLXq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=CcURf/lFhcsYAxwLtqa7e3ZB0qF24OaX1tymCrJJVsU=;
 b=bHIvPmgqymlFEppGwDQuLZV3NzPr21TnkcAIZJUcnZGVJbmyu9wxKKgacLloixYSgQndRAlsXwWD/E2zW+q5AlvwQUpGYd8FStEKtYE8smmIs/KpY5/5qqeNIX8RSSgEOfG6ubBpXE40BPaJcQwJPNT60E9D61ZkrGlayv1mrN++AKudPfuksF3GYywN6EpidBp0HDgn1D3R6Jjc6SzZZ2rMCXsSVT2W/fFoQsoLHWH+htCIB0zkiFZQWvYutf4PdPnaaOnqPCZZaKqvdcNZmu85QIizhju140JYfpENCIzwoe9GuuOBvCtQcBFA9gT1o9igQtGvPviFHdhik+ANSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcURf/lFhcsYAxwLtqa7e3ZB0qF24OaX1tymCrJJVsU=;
 b=I9XxoJ5wVw/POba3gubg4kRlyHATT8r86cggpSLVwA7gQp46TwvTZrvl6Bj0Q40xCZKNH/DYlBPHSNmxR136t3lnjRAYub9rBOT2D1D9ZGHMP+cdgqVNP1XSN288uRwjv1BeJZp4rIwLe+GRqhEqJqzljrbDKy5kP9/Kp2w3i+A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Sat, 4 Sep
 2021 16:24:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.024; Sat, 4 Sep 2021
 16:24:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v7 04/11] qcow2: introduce
 qcow2_parse_compressed_cluster_descriptor()
Date: Sat,  4 Sep 2021 19:24:21 +0300
Message-Id: <20210904162428.222008-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210904162428.222008-1-vsementsov@virtuozzo.com>
References: <20210904162428.222008-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Sat, 4 Sep 2021 16:24:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb830fca-03a6-46ac-e289-08d96fc08937
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6904DD000C5930DD3E1E7067C1D09@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S9vdKZY2eHvWNFqsQUeaUr18h/cogZqeCYTaXz5rbrLDhWbCziWdGfX4YfXNcg03UuVmIUYc89bk6CsWAv9HHDGY/Pp4lcC+wrLQg6u7LNhhhYUg0q2riekv/YNbnjuZSfMWeky/ilKfxrVNAnpJjwklqQmIh1RFwjlfLszg6NQq95ZcYSEmn3RHI9t4NBlOn2FqZFW7XQgiLwM9ov4FFOocToRmIjNi2wLb5HVJrqcTxHg4x+Pf/dLU8MaNDeieMmprSjCTTSQm1CsRrZVeipJvOU9Sxqmkj2WRMKWCYLAcPupZnKwnHnfmA5nyVWCXDf+7m6+3VGIlmV36khyoLfG4UknrNt8hDRt1DY74sD3HIzS0gCV7ZmgG8C2ZH5+dtI2+LUg2dNe4Ag6gWign7fzL4jNzzOx4sTnn9ndK78FLF2mjM7x+GbF6eJTsM9cVQt4m6LQg+Mz0CQMUqJ2I0dyYZ4bxko43+cimc2PVkWHePaXomV+97tNd1YZCPaty1whi6UciXk7TkLdeuVx5ok4nzP26LOQiDYohkBPA8UK6YJTW6dZ8Nc4jC2APoF7B+84b6ikgXOdTPWWf8ZTdwtM0KidO3fDuJ2Etr7obYcoW6IHtoWk+o0pIQTf1jk/UPdeihADLAMn69jM45hG+gtcqd7Ii7iMVzwd7YEWaa9EvOH8EI4sjIHd77gqZ4zIP9PKpLVTcGCb89nziMvP/kQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39840400004)(396003)(366004)(6486002)(66946007)(8936002)(52116002)(6666004)(83380400001)(478600001)(4326008)(38350700002)(186003)(38100700002)(5660300002)(2906002)(1076003)(8676002)(6506007)(86362001)(6916009)(6512007)(66556008)(36756003)(26005)(2616005)(956004)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PihLmQleuB01lRtrImchKgvHtYkcOu15Fgxbl0PB8x/pWEGrQ+DndaUGf/1G?=
 =?us-ascii?Q?1Xu9lyYXx7JXbWP/Aqxsg/XN4MshB3wZk+O3ys5u9BZLRP4CSFR9JTdmYOIS?=
 =?us-ascii?Q?fz/yjKeSpGBwK2weLm/5l+Kkx13Uj7NMCJd7030Vj7vWR/lXkcW4AA8SjTui?=
 =?us-ascii?Q?q1OwUhInHOoPW4DUQbW53z3mzsxSEb612FDCvo70tn3T9anMvGOu4JS1l0np?=
 =?us-ascii?Q?vC9mSih6iWmIAiP3AoWSxf+gXsNKjF+Bu5cEHEZW68tfdQHDtdjFyeU4Jw7Z?=
 =?us-ascii?Q?A79dobRldoC1XWFYN7apmH0aMm9ZK78k0rdmOPxhyseBHN5456H+5novuCy3?=
 =?us-ascii?Q?+2k+acMXkMum5uC8R9PLL6MkeMz+Mhr2Af5g1VHAvZkLNBDK/RcaKGAUKDDQ?=
 =?us-ascii?Q?/6HhojvpNIeAU3R0K2Ccpnf/RBpTl1Yn/rRjF4jkrdW8rUq9cOolvLCXCSCw?=
 =?us-ascii?Q?lhtAvdbEEbnIE/ZKnhQTKm85mdF0HvUPgM3UATZtynIy+aOCaUOtMOKzjTov?=
 =?us-ascii?Q?w4N4wp0rMdCz5k7pltPVin47I3iI58DEDcJIqejucKYsnjzZCTMYZIWoFfHP?=
 =?us-ascii?Q?cTxuud27wvGzsUZRBWWJC1tP0niprc8iYmvFjIiumAOhfsQlVlXCjO2y8Yfn?=
 =?us-ascii?Q?0zF4/CuMh6P16OxDwu6GoXNjZF3Htgf9AzgDWrM6xuWIOvtzXEHC7OGn93JQ?=
 =?us-ascii?Q?JlvgMEWCSUzBVnvlAxxAPSQNQ6/jS7PlmZcSYSnIKY5FpyaeUKzhxbQzlr/F?=
 =?us-ascii?Q?dGNIBm3Kqc+vHnTPm1pwoF4KWVntSFsXjCb6QoJaX6Fi8uV7IAJz79wLGuZB?=
 =?us-ascii?Q?VHUtlFYT1wrLvEsP91LwBPIiCdMMB2AhcK1J2uCQaJSiypMw0hFarNn+1Chq?=
 =?us-ascii?Q?6X0BMFmHV/ABGywGhfigLEqrRvWc9XYeElZS0yc6yIXbBVJFT54iMz86x/fH?=
 =?us-ascii?Q?PTiolpSJUY05ykc9AGSETNcCi5IFoBF7rRxPVdhL1FFsU39SSuVduCZk9gLI?=
 =?us-ascii?Q?YpjdZB045cidU34r+ivZD2VVnNIfkgkiFhtfkQQLIa27IYs9oN4w/E7fbcM5?=
 =?us-ascii?Q?/Mbh4GF1sO5DCwS1WcArcB9+rtFD/khUwDv8R1Cv9ivaM384bsjzmMcEGrpU?=
 =?us-ascii?Q?VCElGCEWGPkAQWLT+4o9GsnPp0pzeO0gcGKn4sLnwGHO2OLZOSyMmj96tMlo?=
 =?us-ascii?Q?aTPQTqu6/8xs4adygPYGh2VTgq2ynJqRPFMcQFsSW2B00M0Ef2owbrLo1L9i?=
 =?us-ascii?Q?yf+WJxqug5yCVFapYe+CQzt/e30uNRl+xQm/f5b2Gv3xolIObxfS7aby8LF4?=
 =?us-ascii?Q?yhPESWIMdMRZwaiHtqV/rYr3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb830fca-03a6-46ac-e289-08d96fc08937
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 16:24:57.7286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkIbAQhJTUnnMTqG8K1YTiPCQVzJ0F7x86NYY8n+sQ9OOa2GlPCeAZx3fryIH2KubGwQPh9G8NSqlAAcB9Y9kSt/pAvJJUdInx2A05SDZYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.21.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

This functionality will be reused later. Let's make a separate function
now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h |  4 ++++
 block/qcow2.c | 21 ++++++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 0fe5f74ed3..4859ca3d0d 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -914,6 +914,10 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
                                           uint64_t offset,
                                           int compressed_size,
                                           uint64_t *host_offset);
+void qcow2_parse_compressed_cluster_descriptor(BDRVQcow2State *s,
+                                               uint64_t cluster_descriptor,
+                                               uint64_t *coffset,
+                                               int *csize);
 
 int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m);
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
diff --git a/block/qcow2.c b/block/qcow2.c
index 9f1b6461c8..2095188b6f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4691,6 +4691,19 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
     return ret;
 }
 
+void qcow2_parse_compressed_cluster_descriptor(BDRVQcow2State *s,
+                                               uint64_t cluster_descriptor,
+                                               uint64_t *coffset,
+                                               int *csize)
+{
+    int nb_csectors;
+
+    *coffset = cluster_descriptor & s->cluster_offset_mask;
+    nb_csectors = ((cluster_descriptor >> s->csize_shift) & s->csize_mask) + 1;
+    *csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
+        (*coffset & ~QCOW2_COMPRESSED_SECTOR_MASK);
+}
+
 static int coroutine_fn
 qcow2_co_preadv_compressed(BlockDriverState *bs,
                            uint64_t cluster_descriptor,
@@ -4700,15 +4713,13 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
                            size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
-    int ret = 0, csize, nb_csectors;
+    int ret = 0, csize;
     uint64_t coffset;
     uint8_t *buf, *out_buf;
     int offset_in_cluster = offset_into_cluster(s, offset);
 
-    coffset = cluster_descriptor & s->cluster_offset_mask;
-    nb_csectors = ((cluster_descriptor >> s->csize_shift) & s->csize_mask) + 1;
-    csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
-        (coffset & ~QCOW2_COMPRESSED_SECTOR_MASK);
+    qcow2_parse_compressed_cluster_descriptor(s, cluster_descriptor, &coffset,
+                                              &csize);
 
     buf = g_try_malloc(csize);
     if (!buf) {
-- 
2.29.2


