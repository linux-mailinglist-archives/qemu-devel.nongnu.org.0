Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C871E3921E2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:19:00 +0200 (CEST)
Received: from localhost ([::1]:38764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0vb-0000qZ-RM
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lm0so-0007OU-BF; Wed, 26 May 2021 17:16:06 -0400
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:2688 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lm0sj-0006kU-UC; Wed, 26 May 2021 17:16:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPuzulsVNVkUUmXYF57nI+YzO6oAEnNdEc5ZuA60jo9Fm8Uhxn2zyrqy5bpo+DJHOZtCp2Wgj/68PQ5R89QZxj3WcxwbSHJtN8QF9JghSyfS+7L7lwQbDpGHhJy/rxusn4TAWaJGTpT832UwMuHNP7Id0MllgaYikidWXrpWYTMNqlHwmCS2CX62zHebeP1Q0iRZjsUBP/NFZ8sxz69ZCIHSv/Muo1VgBPRfteexmhASIkAwfzw3/11f7KoCdNibBcp0zTjcam/ZTeql7fADR06/47LOXHRF/6zfZmpfS0AM99I+9w0XQBUkdsO8OkRMF+YiQyi3Hf/7VuSDlIACpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vUqLjDZn5LVggUnTdP6HAHubKURuEj6ekl38g3v1Vk=;
 b=VLvtnKu24AMEtyE57IXpt8nvyJ82oaHyw+qXzEWLi12vN87IpsAdClBupOf2Tb1NmwkRpHLD6jTXYIl70+NXynYKYRAKsDcNdQA+NY74iAFwhus4C9KdW4GFVLT3BEBEtgxLOfKTpY+wtLqgG8vnnBrY157Kgt1geaeJxcbA9tR/JLrYhalftRnwMfPWfn1WnMNmQ2f9Gq+8b4M1Xb6lU1xef8QLD3Xtt0x35Iy1IH4rF0/iFRqXFRSbBlsSVz7kpB+U961FgiWt39+5lKVRI9/ZeTsASzoWsEOs2MYmb8B5pQQqddTu/oNPbWB80oPo0MYi1ymrUNu2M0HG4VzqcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vUqLjDZn5LVggUnTdP6HAHubKURuEj6ekl38g3v1Vk=;
 b=IiQFKoJT7rSPZ5mLJal2CsyluaK2ARsgaGAvdnI0cq5g01osQjVoKJo5BTYO/nDroGVmXfYmVMEzCAb1OQiCTmhg58UA+gX4lXB9k3CNjD55VWU8SMnjLfQKjZ57zFJf4A8LsHPamNzsy9MK+OO1kYkcak9WfYLP4vBwmkKVaGk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5382.eurprd08.prod.outlook.com (2603:10a6:20b:108::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 21:15:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 21:15:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, codyprime@gmail.com, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 1/3] block: consistently use bdrv_is_read_only()
Date: Thu, 27 May 2021 00:15:32 +0300
Message-Id: <20210526211534.524597-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210526211534.524597-1-vsementsov@virtuozzo.com>
References: <20210526211534.524597-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR0502CA0021.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR0502CA0021.eurprd05.prod.outlook.com (2603:10a6:3:e3::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 21:15:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 441c0003-3f67-4aec-efa0-08d9208b6fe0
X-MS-TrafficTypeDiagnostic: AM7PR08MB5382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB538233F8E779CE9E69DD2FA5C1249@AM7PR08MB5382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0dDeJXZgNqptmVZRhsCvbcZaWfCT3wjdPXPaHIuvCWQpt6fB4bsAc1XJ3LPftYmDX7Y80N6B5XwZre1zzGaRVKzQxDvPbIYwLeOj+HkYLaLEx6EEASBVlEreBA7HpmUZ+GLJJo+aEMEr5wwlA5rZNT+R9IRhcPiFot/p54WyfuNmU7jwWMpnABd19cqggiX8Qh+AGgj4XWpwCLJjE8dGIbhOPEOp9LkZhjhwj+jAOgH9XlatXK1L7Zm8P3IpjXfeFDRCXinlhUmvsx9eKV03doU0ZAAYkOFP+TXSdvmnw+9gCBDuPmnED3J5fbiqLyjnvPTKpHF2zuzatU4FXs/PtEsq/JkRHjQBEzn5mTeeDAS5/X/n4X3l5tVrlD50jnVdtSv+VVGLQlyCbTxNmgQLwegA5F0sIf4aTHAdj9cbDIaHR8n7DdhLvlwr7BzKO4yQEp3SSEYPXQSybCo77pXu6G9BH1ymKYnFFjyM4RsvzsH6/kdBJmjxZ5roiQZzzrEuS5ACQT+pbPNOrF1PbYTxmTJaqiXwPt4ITiODlu5Xl1knZ53Tw1965SrHaFHz8oC3uOy1LG2aDhE8GxXIwQyWkMAKBC08x73+9Aek+iz8lgdAtv6UvUlXBCoxnKTbW1iP+XaaGlYUpT/MCSui+Qg5S9nvu1NymK2LN/CcqifMjTj8Y3Ez4Pt57ZSIpU7tzXif
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(136003)(366004)(376002)(346002)(396003)(86362001)(2906002)(478600001)(38350700002)(38100700002)(956004)(36756003)(316002)(6666004)(4326008)(5660300002)(66946007)(83380400001)(8936002)(8676002)(6916009)(6512007)(6486002)(26005)(2616005)(52116002)(1076003)(6506007)(66476007)(16526019)(66556008)(186003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?heGGlsI7oGmP0UiqX4yEgViHTDRmNeg2SzDoIixQDqI7hVlyQZaiXwV/9q26?=
 =?us-ascii?Q?+HBqTQUFLSSWj0Wv1Oq8XHyknns0eb/61/lKCKh7uH5YvYvFTxQCMYgBAQk7?=
 =?us-ascii?Q?j8XI7ZFxTIqv7oWCgcnpAPjn9Z3GMK9tzhw+yNCdu+DgN/vAVyzzz1dNndwC?=
 =?us-ascii?Q?fnFapGiiKSHgE3oRnbQfr0/nImSixGhDJdWJVzpRFUNxKD/RBBBKwB5n0UWF?=
 =?us-ascii?Q?KG9Bat7Yp1ly47PKyYB14SBo4CQD8Cf6mIR+tqq9uOCOMkfXeyN+5ocTRsSu?=
 =?us-ascii?Q?TS31Xdy2LKJEdAeSYe9G/dJ+85FGwt9CJ/7ylcZpN+Ym17NWrZS1e27popmb?=
 =?us-ascii?Q?LmwxjM0RUm1YKu+1fjSdJ7Ok6/Hfu4DjHa4s30K1nKB8wnkjNwLTETNuO0TE?=
 =?us-ascii?Q?PO1LCwboi8nXxDv7CVbhITSvudWaI0D6SHsVg1qVTlmkijYuweZ9uPXgI2wG?=
 =?us-ascii?Q?eHg7bCZcw2syEksCbS42b1iF19XdG0dQy1qxeNfP0kahe6oQoNNMrr0pp4QW?=
 =?us-ascii?Q?F0xTe8wfvlgWT08PRm+8DETHJT3ZcbWUwjqiS6gkofJBllaJCGeH2L6KGBln?=
 =?us-ascii?Q?ySia+evlSZlLqtssqk1MxaHY0eLKlCg5bWCCRj0FThERnNMErRXxVbyEk8PK?=
 =?us-ascii?Q?EQcKti0TD448f1EVBUIfPfU/9yj6F7Dk064/noKeAY1Ky2PjE/923WhUmF53?=
 =?us-ascii?Q?fEvvgMdzrYESU2Zl8CslplO+UZKSj9EuKDEktGVKzRrbVVMArv3pZVshmx67?=
 =?us-ascii?Q?ipYnstUHk3V/EDBvmfilWC1cX0JMtBARi6f0IzKvm55k1mlrewLu2iU8Vcu9?=
 =?us-ascii?Q?3+WiHmBc6cJBY2nYLiAPYS9hoqdQOa35g5QtayZF4/2vJQDJrNMYI1G7I4zS?=
 =?us-ascii?Q?zFoBPYmSqc1NYq8wB8hwob/pj1cDeMICFd7SYGWTAw74KtEIxepXMXl4GORE?=
 =?us-ascii?Q?04VFz+uzUp1Zna47dFWsmKIlmbZ/ycOl042HR1fNETmpL/hzYHPw5X0ih8wm?=
 =?us-ascii?Q?0b2SneDuyw1d/kHbkeGWkPGs8ug8uZb3NY724U2epkBN4X61ep+LE2AisqnE?=
 =?us-ascii?Q?NTQJsUj9ik2VsMLyPILEzDMeL2YHNJTzF7s3DJaHuA+0jmnTeGIpuoDRFYqS?=
 =?us-ascii?Q?TMIMKURsuFfW4AdURc1EZCRQJGiawG/W2lPm8GhUC7OUNFG4ebehR+GoKt2r?=
 =?us-ascii?Q?kzw0ZU/aYTtsypIYsvaGMfcBqEutS/PzLx5GNee8zd8SI0ngpnmBWheQzUi1?=
 =?us-ascii?Q?FJr9CT5vVqDwOcep2BBR61kvE1QsrVk6wVG/bJBH3XzOs5HEgEVQflFOItJf?=
 =?us-ascii?Q?++4jBcxXKq4FzXiXkCotyYT7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441c0003-3f67-4aec-efa0-08d9208b6fe0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 21:15:50.0545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08UIU/n6+rnV2JCp+kkAO7quF0qpb+YE2m7YvadTrY80nkfpLTkGvalLTkc1A9SU3iNZ31N7phgo9Dby+flnH1P0Z4Pa+jB1Leyk2rglHvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5382
Received-SPF: pass client-ip=40.107.21.101;
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

It's better to use accessor function instead of bs->read_only directly.
In some places use bdrv_is_writable() instead of
checking both BDRV_O_RDWR set and BDRV_O_INACTIVE not set.

In bdrv_open_common() it's a bit strange to add one more variable, but
we are going to drop bs->read_only in the next patch, so new ro local
variable substitutes it here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                | 11 +++++++----
 block/block-backend.c  |  2 +-
 block/commit.c         |  2 +-
 block/io.c             |  4 ++--
 block/qapi.c           |  2 +-
 block/qcow2-snapshot.c |  2 +-
 block/qcow2.c          |  4 ++--
 block/snapshot.c       |  2 +-
 block/vhdx-log.c       |  2 +-
 9 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 0dc97281dc..0270b609c4 100644
--- a/block.c
+++ b/block.c
@@ -1720,6 +1720,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     QemuOpts *opts;
     BlockDriver *drv;
     Error *local_err = NULL;
+    bool ro;
 
     assert(bs->file == NULL);
     assert(options != NULL && bs->options != options);
@@ -1772,15 +1773,17 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
 
     bs->read_only = !(bs->open_flags & BDRV_O_RDWR);
 
-    if (use_bdrv_whitelist && !bdrv_is_whitelisted(drv, bs->read_only)) {
-        if (!bs->read_only && bdrv_is_whitelisted(drv, true)) {
+    ro = bdrv_is_read_only(bs);
+
+    if (use_bdrv_whitelist && !bdrv_is_whitelisted(drv, ro)) {
+        if (!ro && bdrv_is_whitelisted(drv, true)) {
             ret = bdrv_apply_auto_read_only(bs, NULL, NULL);
         } else {
             ret = -ENOTSUP;
         }
         if (ret < 0) {
             error_setg(errp,
-                       !bs->read_only && bdrv_is_whitelisted(drv, true)
+                       !ro && bdrv_is_whitelisted(drv, true)
                        ? "Driver '%s' can only be used for read-only devices"
                        : "Driver '%s' is not whitelisted",
                        drv->format_name);
@@ -1792,7 +1795,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     assert(qatomic_read(&bs->copy_on_read) == 0);
 
     if (bs->open_flags & BDRV_O_COPY_ON_READ) {
-        if (!bs->read_only) {
+        if (!ro) {
             bdrv_enable_copy_on_read(bs);
         } else {
             error_setg(errp, "Can't use copy-on-read on read-only device");
diff --git a/block/block-backend.c b/block/block-backend.c
index de5496af66..21b834e9df 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2269,7 +2269,7 @@ void blk_update_root_state(BlockBackend *blk)
     assert(blk->root);
 
     blk->root_state.open_flags    = blk->root->bs->open_flags;
-    blk->root_state.read_only     = blk->root->bs->read_only;
+    blk->root_state.read_only     = bdrv_is_read_only(blk->root->bs);
     blk->root_state.detect_zeroes = blk->root->bs->detect_zeroes;
 }
 
diff --git a/block/commit.c b/block/commit.c
index b89bb20b75..b7f0c7c061 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -453,7 +453,7 @@ int bdrv_commit(BlockDriverState *bs)
         return -EBUSY;
     }
 
-    ro = backing_file_bs->read_only;
+    ro = bdrv_is_read_only(backing_file_bs);
 
     if (ro) {
         if (bdrv_reopen_set_read_only(backing_file_bs, false, NULL)) {
diff --git a/block/io.c b/block/io.c
index 1e826ba9e8..323854d063 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1973,7 +1973,7 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
 
     bdrv_check_request(offset, bytes, &error_abort);
 
-    if (bs->read_only) {
+    if (bdrv_is_read_only(bs)) {
         return -EPERM;
     }
 
@@ -3406,7 +3406,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
     if (new_bytes) {
         bdrv_make_request_serialising(&req, 1);
     }
-    if (bs->read_only) {
+    if (bdrv_is_read_only(bs)) {
         error_setg(errp, "Image is read-only");
         ret = -EACCES;
         goto out;
diff --git a/block/qapi.c b/block/qapi.c
index 943e7b15ad..dc69341bfe 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -59,7 +59,7 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
 
     info = g_malloc0(sizeof(*info));
     info->file                   = g_strdup(bs->filename);
-    info->ro                     = bs->read_only;
+    info->ro                     = bdrv_is_read_only(bs);
     info->drv                    = g_strdup(bs->drv->format_name);
     info->encrypted              = bs->encrypted;
 
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index 2e98c7f4b6..71ddb08c21 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -1026,7 +1026,7 @@ int qcow2_snapshot_load_tmp(BlockDriverState *bs,
     int new_l1_bytes;
     int ret;
 
-    assert(bs->read_only);
+    assert(bdrv_is_read_only(bs));
 
     /* Search the snapshot */
     snapshot_index = find_snapshot_by_id_and_name(bs, snapshot_id, name);
diff --git a/block/qcow2.c b/block/qcow2.c
index 39b91ef940..d39d9f4e9b 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1724,7 +1724,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     /* Clear unknown autoclear feature bits */
     update_header |= s->autoclear_features & ~QCOW2_AUTOCLEAR_MASK;
     update_header =
-        update_header && !bs->read_only && !(flags & BDRV_O_INACTIVE);
+        update_header && bdrv_is_writable(bs);
     if (update_header) {
         s->autoclear_features &= QCOW2_AUTOCLEAR_MASK;
     }
@@ -1811,7 +1811,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
 
     /* Repair image if dirty */
-    if (!(flags & (BDRV_O_CHECK | BDRV_O_INACTIVE)) && !bs->read_only &&
+    if (!(flags & BDRV_O_CHECK) && bdrv_is_writable(bs) &&
         (s->incompatible_features & QCOW2_INCOMPAT_DIRTY)) {
         BdrvCheckResult result = {0};
 
diff --git a/block/snapshot.c b/block/snapshot.c
index e8ae9a28c1..6702c75e42 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -415,7 +415,7 @@ int bdrv_snapshot_load_tmp(BlockDriverState *bs,
         error_setg(errp, "snapshot_id and name are both NULL");
         return -EINVAL;
     }
-    if (!bs->read_only) {
+    if (!bdrv_is_read_only(bs)) {
         error_setg(errp, "Device is not readonly");
         return -EINVAL;
     }
diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index 404fb5f3cb..7672161d95 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -801,7 +801,7 @@ int vhdx_parse_log(BlockDriverState *bs, BDRVVHDXState *s, bool *flushed,
     }
 
     if (logs.valid) {
-        if (bs->read_only) {
+        if (bdrv_is_read_only(bs)) {
             bdrv_refresh_filename(bs);
             ret = -EPERM;
             error_setg(errp,
-- 
2.29.2


