Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981E833F393
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:43:25 +0100 (CET)
Received: from localhost ([::1]:49286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXOO-0002Pg-LJ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHc-0004SL-8X; Wed, 17 Mar 2021 10:36:24 -0400
Received: from mail-eopbgr10137.outbound.protection.outlook.com
 ([40.107.1.137]:61154 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHY-0006nM-G9; Wed, 17 Mar 2021 10:36:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfMyxT63n8NrEupKEymPRI+z9tg2bA9eKlHxxkdr9m++4B0rKnABog04tmcFvbcpblhQgJ0XJ7hUxMfB5ivmaEymdonqy7QWyAa4glaRmuKQ4ZAfgRPvQPu41+dBjUvdI2fXkQeLuaFnSoLpulUNEZyMzLX5UoaSEuZv8HCAWrqbuoiXWEsNCxGUC8axahZfQeFAxsJAVcdYNFLO0Rf1HnMUOwrL/H0JBOpMqEQKEkIisivXMtJlN0acq0Ck/eaQ2Y3jfRiWNFxjlnx7TO+DGAHBGRiKvi+Qq0MxT9Ohw6el54Xl4akdx4qZUrvv0B+El84sfCRE22TfhuByl9uMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RaqixNqiJ+awM22JtpG7afb0o7QgXU7R2Rh8PGM0Zc=;
 b=SJHZUzouYpzfeIIHFC9jqD9bTbEVwLH9DE7DYlxssowutKauSmOAc5bVB21mARzcotDmiHVbkorxs02wvZ2s4lzk4j7paElajhYYD0wKhC69jnlL3XSXIAy+NEgJ5zTV6ORrqejdQLmunkljhRgFAA//F3nJ3wS2JFshZ7yReLZ03vT211C9qlSKzUTdrp15gQp0SoSwg2gKLYvD403lY0ZE1vOPeDJGo3GX9532TvHT9PgVe6wyJ9rbroSZcd+SEhPOqC9CQdQ0Xb5UsOYiZjHZ0qrv6U2IzZJuesl1o9Mr/dJXalDOCYtbBO/KNQREoof1bGPBGMOdZHZqXm0CIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RaqixNqiJ+awM22JtpG7afb0o7QgXU7R2Rh8PGM0Zc=;
 b=bgerqov8maJ6TTm6936YsPduUvD8ZrTfq8OA8n+rVGMXMcTBx8AzTRhv+Trproz6taq2ey6PDZvfCmtfBm2siXuzcpZVFAkf8393UkQVyNeox1V7cNOw63uTtfamKwGulyk6fiN2KyY8BkLMW4Ns0gC7Fb5wcLU9APWSJyXtlfM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 04/36] block: bdrv_append(): don't consume reference
Date: Wed, 17 Mar 2021 17:34:57 +0300
Message-Id: <20210317143529.615584-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cc6bf93-58d8-41e9-84d6-08d8e95200a9
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1650A518FE0DBC12E3A4B38CC16A9@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vR2uQG5vw1t3HaVpeHg1aSvqGo5XVrect+/mDBrR5UzLIPprtjKkBuBBggiQ/URufcK63BQZwck+hm8B2A7HaE6zPwzMT/ed5xJvvNn3240MdTqkIj3ago1d5+9SqIF7aj6X5E5UvM/CDyJqnJ1k5mS0SXJckT/EdIQ2dHCtr9v1LQrrbwBm7n0ZfBP8s0qX50XlwfD1buB0L7h3R+Q6Kz0r1r5vXqRpmpZD3G1bvHi/+wlMkbubzmZMmP0Zj8EHpVclZykokNein69xuff8W6p946EgpzXpx5hBDadICpQ3X52Cr+8vdoUSKs9iezEw0ZidZbw0Ql1N4BfhpvezSg7kts4LsLzL3JrxNmPUvKAD8RYfFCzrLnmYiyvUFrq7QynAIPPjEkjM/tPteC759qxXYCKOdfEfIcTiT7O312LJeCcm2GBcMYbKsX/8+UpJIN05aCQKML2/i4/p/2jblqw5sesGCRK3+gDd3rD7XqQCpB2+CvE/G2WIzkv5L/x1GYBTbTe8GtoVAf4hjVgR0DVUkaXeFNrhxWGlYLpy05erH2xlMCGhX0fBS6WCMdyCWf+OZ2PSA7PEXs1de+i7WF/y0bS08y0spBLZInSy3ko07aWP5+gkIF/VWvVZuzap
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(376002)(136003)(366004)(316002)(1076003)(956004)(6916009)(6506007)(69590400012)(66556008)(66476007)(6512007)(26005)(4326008)(5660300002)(83380400001)(8676002)(52116002)(2616005)(66946007)(6486002)(6666004)(186003)(36756003)(16526019)(2906002)(86362001)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kQeShmKtx/oP2Q/5vlrvM1pUO7ols8Wxbzl2F01zwaHW9rd841fxZbB52Zfd?=
 =?us-ascii?Q?Io/0nKdRiDwNdNmv4ZsJwvt7q6muOZ3RKvmKqDOIRCWx7HjmnkxeeW8VSOi1?=
 =?us-ascii?Q?Y6uab/+APXsMjRPNGxKsywkI0j+njTyr6E2Z4ZNDAiq5QAk+jduEXxoHSnSg?=
 =?us-ascii?Q?pHlPpmkSBBlGsaUxemMNKRK96C1JFasjYGPkDMvHo8gDbmvCKDtcJmDRrLkg?=
 =?us-ascii?Q?x8bpx1ZeFEz7rIYJG+KpptMW2GvpQ/AK4DwBZijEd4ZrCXW8AbdalAKQ5/KA?=
 =?us-ascii?Q?0SImFYmiv42vYNKMYj1uLVsyyqP0ySZ5o9wyPcvjneBsGXsm7X9NS36zjwHo?=
 =?us-ascii?Q?5pvq7SMyGB6qu6Yha7ocrauPqOZNpnnl3SOJEVfEzjwdh39HpZnuHIhi4UER?=
 =?us-ascii?Q?VTrc9g3elp6RtuXPKntmHQ3ZQGprPfpNTSZ0aA5llw+xCBvvHmRO0PtEdgwy?=
 =?us-ascii?Q?WoPjLY3vibQR0BTPXyocxNKvPh9/P+raenlntzFK6NpkUXuow+IMQ6bogbly?=
 =?us-ascii?Q?N2lDxCs5HxpdXNXvfLQE4CoNHMSlLUfeVVqSlsN9YGLIRPqCCsdYLFUhXvYb?=
 =?us-ascii?Q?9Jc27Baxj+uzwZtk7vfHUPvs2+iu6cvC237hQ4edvOJt5l5as9A7Ay4Sat33?=
 =?us-ascii?Q?gN+CdSkglqvPAliXarHijSMj9k/FpTCKV3QPNHezBWrEhqG9vezCnbAgs0KJ?=
 =?us-ascii?Q?OU6mYJZeGwB9SF4Uir6i2KMYVCJ1nMK0rutEOVqAlCiOC6YgCzddDmkh5Fvl?=
 =?us-ascii?Q?miBocQD9PkBhPMPAcE43U4Dw7N9KAASa3WIUAom0fGTrNvRnN3ZgbcGNWgjV?=
 =?us-ascii?Q?L9iHWrBR4pCAP8a32UiJXn2zjwIQNL40Oi2ysiuMSbP8+OoCRDWpF2Ln4P2P?=
 =?us-ascii?Q?eL1L2cyFqcgEXqFFr+IwnTrpC/W6qEB93lHKAT1+FFDLje0IrGUK02uqeBF4?=
 =?us-ascii?Q?3GPET0Z9VdZcCh4ulNAAd7Foq9ijLZRG/+26UWmX9lmD4SL3SkvLAvWQ+Nd9?=
 =?us-ascii?Q?6obXSwMZkP8ONk6bvpE05RFE0dEmmVjYaUcbHW/eOULHQM0IBDsAE0sCWqed?=
 =?us-ascii?Q?CXVYaXdG4L8nXZF2Axp1Qd2iGswS22m6joccynn5wmdJ04PwT1PduPBO9I3l?=
 =?us-ascii?Q?PTe1sDXOAhLr/fcAFkKOgz0UjA8OZFO7Xw+gR+K+HXf8O+y/2GSKtJXaMg4v?=
 =?us-ascii?Q?+IVXnVYuB4r2+eqbE6vItkCXu1A+U4W9I6bPWgisNSNdowP84NDDsJKxDAhd?=
 =?us-ascii?Q?qFnPmLwiIr2U+DU+8dr54A7iwFAFsNl7Y529aSwOOHaTnGejpcZkPo18FsyZ?=
 =?us-ascii?Q?vnwjBNOkJaF0JyyDDRjf/hwo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc6bf93-58d8-41e9-84d6-08d8e95200a9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:08.2924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdwBa5k8tb9H042sIU9NqYeFzplhQGUT1BRFiYJiVbnmcCFPIO8BSlOPSCrspvItO/DX0pgF7j0dhuY3LmfTU2e9+O6DLVoQKj/mqMZ+2rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.1.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

We have too much comments for this feature. It seems better just don't
do it. Most of real users (tests don't count) have to create additional
reference.

Drop also comment in external_snapshot_prepare:
 - bdrv_append doesn't "remove" old bs in common sense, it sounds
   strange
 - the fact that bdrv_append can fail is obvious from the context
 - the fact that we must rollback all changes in transaction abort is
   known (it's the direct role of abort)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                          | 25 +++----------------------
 block/backup-top.c               |  1 -
 block/commit.c                   |  1 +
 block/mirror.c                   |  3 ---
 blockdev.c                       |  4 ----
 tests/unit/test-bdrv-drain.c     |  2 +-
 tests/unit/test-bdrv-graph-mod.c |  2 ++
 7 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/block.c b/block.c
index f377158c42..297a4f7018 100644
--- a/block.c
+++ b/block.c
@@ -3179,11 +3179,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
         goto out;
     }
 
-    /* bdrv_append() consumes a strong reference to bs_snapshot
-     * (i.e. it will call bdrv_unref() on it) even on error, so in
-     * order to be able to return one, we have to increase
-     * bs_snapshot's refcount here */
-    bdrv_ref(bs_snapshot);
     ret = bdrv_append(bs_snapshot, bs, errp);
     if (ret < 0) {
         bs_snapshot = NULL;
@@ -4645,36 +4640,22 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
  * bs_new must not be attached to a BlockBackend.
  *
  * This function does not create any image files.
- *
- * bdrv_append() takes ownership of a bs_new reference and unrefs it because
- * that's what the callers commonly need. bs_new will be referenced by the old
- * parents of bs_top after bdrv_append() returns. If the caller needs to keep a
- * reference of its own, it must call bdrv_ref().
  */
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp)
 {
     int ret = bdrv_set_backing_hd(bs_new, bs_top, errp);
     if (ret < 0) {
-        goto out;
+        return ret;
     }
 
     ret = bdrv_replace_node(bs_top, bs_new, errp);
     if (ret < 0) {
         bdrv_set_backing_hd(bs_new, NULL, &error_abort);
-        goto out;
+        return ret;
     }
 
-    ret = 0;
-
-out:
-    /*
-     * bs_new is now referenced by its new parents, we don't need the
-     * additional reference any more.
-     */
-    bdrv_unref(bs_new);
-
-    return ret;
+    return 0;
 }
 
 static void bdrv_delete(BlockDriverState *bs)
diff --git a/block/backup-top.c b/block/backup-top.c
index 589e8b651d..62d09f213e 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -234,7 +234,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
     bdrv_drained_begin(source);
 
-    bdrv_ref(top);
     ret = bdrv_append(top, source, errp);
     if (ret < 0) {
         error_prepend(errp, "Cannot append backup-top filter: ");
diff --git a/block/commit.c b/block/commit.c
index dd9ba87349..b89bb20b75 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -312,6 +312,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     commit_top_bs->total_sectors = top->total_sectors;
 
     ret = bdrv_append(commit_top_bs, top, errp);
+    bdrv_unref(commit_top_bs); /* referenced by new parents or failed */
     if (ret < 0) {
         commit_top_bs = NULL;
         goto fail;
diff --git a/block/mirror.c b/block/mirror.c
index 6af02a57c4..a2a33267e5 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1613,9 +1613,6 @@ static BlockJob *mirror_start_job(
     bs_opaque = g_new0(MirrorBDSOpaque, 1);
     mirror_top_bs->opaque = bs_opaque;
 
-    /* bdrv_append takes ownership of the mirror_top_bs reference, need to keep
-     * it alive until block_job_create() succeeds even if bs has no parent. */
-    bdrv_ref(mirror_top_bs);
     bdrv_drained_begin(bs);
     ret = bdrv_append(mirror_top_bs, bs, errp);
     bdrv_drained_end(bs);
diff --git a/blockdev.c b/blockdev.c
index 5cc7c7effe..825d40aa11 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1587,10 +1587,6 @@ static void external_snapshot_prepare(BlkActionState *common,
         goto out;
     }
 
-    /* This removes our old bs and adds the new bs. This is an operation that
-     * can fail, so we need to do it in .prepare; undoing it for abort is
-     * always possible. */
-    bdrv_ref(state->new_bs);
     ret = bdrv_append(state->new_bs, state->old_bs, errp);
     if (ret < 0) {
         goto out;
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 8a29e33e00..892f7f47d8 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1478,7 +1478,6 @@ static void test_append_to_drained(void)
     g_assert_cmpint(base_s->drain_count, ==, 1);
     g_assert_cmpint(base->in_flight, ==, 0);
 
-    /* Takes ownership of overlay, so we don't have to unref it later */
     bdrv_append(overlay, base, &error_abort);
     g_assert_cmpint(base->in_flight, ==, 0);
     g_assert_cmpint(overlay->in_flight, ==, 0);
@@ -1495,6 +1494,7 @@ static void test_append_to_drained(void)
     g_assert_cmpint(overlay->quiesce_counter, ==, 0);
     g_assert_cmpint(overlay_s->drain_count, ==, 0);
 
+    bdrv_unref(overlay);
     bdrv_unref(base);
     blk_unref(blk);
 }
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 65c69b23f7..8188ddd84c 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -138,6 +138,7 @@ static void test_update_perm_tree(void)
     ret = bdrv_append(filter, bs, NULL);
     g_assert_cmpint(ret, <, 0);
 
+    bdrv_unref(filter);
     blk_unref(root);
 }
 
@@ -202,6 +203,7 @@ static void test_should_update_child(void)
     bdrv_append(filter, bs, &error_abort);
     g_assert(target->backing->bs == bs);
 
+    bdrv_unref(filter);
     bdrv_unref(bs);
     blk_unref(root);
 }
-- 
2.29.2


