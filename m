Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33EE3824FD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:04:24 +0200 (CEST)
Received: from localhost ([::1]:53252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXId-0004Uv-OX
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0M-000458-Fc; Mon, 17 May 2021 02:45:31 -0400
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:63681 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0G-0001xR-5Y; Mon, 17 May 2021 02:45:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRX2SEC6ZKJ3X71ZhtTafzzmzQKJAaPLN7XChgTdRWnvW54863qfL8H5aPLNlymjB3sXuXQBp/R3wFmWkWBVV5u4HGcOvMLbTC7YZoNWuGqKI6LPADvX5o8OjVqbUGCwDe/8qj83OrNxjJcMlH39o7yNeHS/Ve19Fyvt0ykwMxndSlMG60mCHwf5orw/ZRat3AhAWVlIlLOu3AJKIjgzexxr5Xj097iingu6We7EcdEMR+pKhCZJ2OIlg4l1vKgsy4TrKWtGYgYRUFSl0G07ZdzvQEUzD3KxfWqgupmEtHTqrknOE2FMYTycgYtaMBvq+z/7GGag4YjKvBhgSysvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7h12npdFpHkBvwXawypfkym5RDO1kdB4SUV4OSXlJTs=;
 b=a7FqN92cthb+SIvZEjqmGc4SzblEzUahirp1tRXHuodxpEwRYWzSPX1/Kn9HZEZu0FwZ3fCZHsEIlt4KUeHsmDB9ZwtAnZY3mC79SU7LijrvYxlOFMeI0JIz2oCJsO4+texW+ZviZ5FId8fwrq2zhV7+LW4Oo/7Q/5xtI1niVHFpCwtSEEU8GyF1YrCmb48tHGCBH5wt3NyyL1HdHT4hb5i+JCfowfSl8toHj2rb45rG1tPKjQaJhFu+JabEnLN3XGHcLSJqZ7ALPuoliqq3D8o10EUoSRvd4eslAmeLTuZO55ngmKe75q5ureQs5eYK9NlamzbCO0JMiivQ59xB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7h12npdFpHkBvwXawypfkym5RDO1kdB4SUV4OSXlJTs=;
 b=SdGNHB3ansVma7nWM7sNtDSUEZuCR+OE3VTWj0nesvT8DTuj5OrCL+Nj+w5X0tvUAgmrDq2mkklcO6KdTHq2e66XXfjwoPl5yfhjXuRZli29UWkSm/bv+rKnTYskSLY8P8ikOHhVoZsdXKiIRAh7K0B2Dyef1V8+tO/yRIPtG3s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 06:45:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:45:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 14/21] block/copy-before-write: cbw_init(): rename variables
Date: Mon, 17 May 2021 09:44:21 +0300
Message-Id: <20210517064428.16223-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:45:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 241292f4-2d4f-4649-0322-08d918ff4d78
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4341CA2DB15E1B904D8E4544C12D9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jalFLwK7R7l8QnL/LUksCJCDHfwFD9aWSgen4OGX50VROXyVdvvj7LGszEx7VSUhlgDEEcHYcIuSvS08/P929cHRw5T2Ow0vE5Xg7h27bFub5WLIxsFPp06juRm74bCJatrevOmE+TAwWZEnIUspKlo+Mx1DG5zhGZ+Do5bbvGzbcF9KGoZ+hrPeSVVnJyx8lOi3gtZ6Sjlp9NzqP/g/WWAWGGchDeOIn0lRLi6v6ogQGgB8wbZnQ07UMGmT6Sjb1tAD1nEjeXKZxishV23lxjDUXlPW190BspJJmt5ZaC0BqR6uTSs/xc2RQ67L15w/sL/gXDgTD52Bh6gxRsvfFhmOlgUbtni+hIqLCgwDFpKaNit9SYDTlyyqR/1i/P3t+7xWTnApr9kP1n71ZdcipSoVBexqIQh+rEx65QxMe6A0GanoQRj2r827xNcv8jfujjLBISWWGHZ2UeBx4PL8nfeg/v6jJmXHWOEM4+mIhzi1FgeQ8S4mqZcV1CN5wmXetLgfkFTZAvqeWb8pw16adbVfDHyTlABws9AwnaXwVRCqMRFAOpEHOKLkcWFdHTZfNMtiUeOXYDYiQ4vue68Fa5ucWJKP+Rtvl3oKwHoD9EDrZ1ylyBSUssDoS1o4L3zx5qzNaErqMvuKWCNU6o/GGNaCoQ5DJc4xv1orOgmItO1B3loAJNeCjZJNHOmeMo02
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(1076003)(8936002)(316002)(107886003)(4326008)(6916009)(6506007)(38100700002)(26005)(8676002)(5660300002)(86362001)(38350700002)(186003)(7416002)(2616005)(6666004)(16526019)(66476007)(66556008)(2906002)(36756003)(6512007)(6486002)(956004)(66946007)(52116002)(83380400001)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0WMwqUlPkjITXv8Hv16qVQXf8h7l1zVdvScvq8xFde1lvAUWfN9tXYOLoxJB?=
 =?us-ascii?Q?wGByzLjperHYG3Nrz8y4X+VkHpl32UsiFzsNjtx01jAbaOYitRnQ5H6J1Tj+?=
 =?us-ascii?Q?czx8HaSpPPSmkOqwx3escAL8BWvZpQZQzgj8i1q+ccFvLgXbJNtCLg7rHsie?=
 =?us-ascii?Q?hgP5zAlFHjAZEKgIDh3gg23EX+7IpIA55asqgKVPxjm7sdmfjalnkg5Sxx1G?=
 =?us-ascii?Q?hVxgPx5Js7OJOPmV4Z8TbsB4jUuxXf6KjqW9NWjPw/maqOte4mk0Hr7b4kSE?=
 =?us-ascii?Q?CYWbZ5sgOMRE4ptYmCJDZKipbcLIjgucRMvfCKz5EEaM4FpJpOf8t7xwB5xz?=
 =?us-ascii?Q?fMiLOtTJdUBk9d7DW5BNJ3tV++cQ6caO6iqypUbYEuGUYocUv+/nwI4Pp6vx?=
 =?us-ascii?Q?/luIm8jcBiEklXK2LA633QK7J8k4qk5QiWgMdlwydeUtyOw2fvXkeO1L1FcP?=
 =?us-ascii?Q?LFFmbCR7MdXpG7nCK3uIaZuYaEh9a+FLO35OkGhkXriAwTKkhDXZAxCOpAMl?=
 =?us-ascii?Q?9nc2gMCYx5zy8HPTss4ZhiDKEXU5UCNB4a6rgG+l1tSUAEki84mzLATh+5hN?=
 =?us-ascii?Q?+pSO8DkSdriiE7SxYDfKZQDfBiBAdCuK7e4LLa+P3gFYOLHq92/nJ1M6eURm?=
 =?us-ascii?Q?d/w+CqyhFCb4YnbOmzYvYSwePbssCt1pphxYfW+eaUGl/xxFnYFhzkBLdQD2?=
 =?us-ascii?Q?ae1p8XBdYJCnlsFkTppb68rGncY2nTAJD+wCpTN/a7wcpK6a56oJhqviys6t?=
 =?us-ascii?Q?qIfntBO/eH775XNcvLmFjIQtJ+6BcOQZ9jDwN2xSh5O36bbKSTr/3Jun05uU?=
 =?us-ascii?Q?AALxLZ05xDu5VL6QsA2hj3FPNmrIreGLGGJ5/hzg+e5SkXVCKVF2v74GFxSh?=
 =?us-ascii?Q?JPvDd4z1Fm13EBUEG6cWuk92KhP+fR3KJTMhUeeFEB5sY51GpHy8szD9a/JX?=
 =?us-ascii?Q?KxwWVzeO3zoZYNdXZ2uxEey7Aoe7Me/iOvMtb/FWM/OUbflaEKqaPeIqDv2a?=
 =?us-ascii?Q?RSCDHscVPi6Zhq75CGyB1nQYMaBUg6z+xx73kMKKqrd6Eq1mU1dFnpzorkyh?=
 =?us-ascii?Q?cEhHurKvfEmZcL2CNM5WP+bPrlrDXMLtxsTsNzRE1kBGQ9lQKiUYEfeo0DW0?=
 =?us-ascii?Q?ToiU2iINVHBkpAHH8kSH153gTkm9Xvu7c2NNdvVNbJRF/4JZ/y1SoLpkY6Rq?=
 =?us-ascii?Q?xWwcwCgvK4yITGsRKkizuFKcUqIHtdlGYiOrPR7RlxELy9g6KIyV5/V7GbuE?=
 =?us-ascii?Q?jNz/G5yWyG5uwEs4s0H/3c4P/eowfuQuApI5ibN3cr7RPiJQRDhtoteZEq75?=
 =?us-ascii?Q?WnSjXWi6Ra5EKMGwFitO8a7w?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 241292f4-2d4f-4649-0322-08d918ff4d78
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:45:04.6477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8SMZhlocJ3+GRn98ew/1XEeg0u+5L9nfBBq8/6/Hn3Pfw69xk7AblwN6zid4zSj2svhP2T9BpBv3tLpuejmg48M5DUsx66+B5EsUvrApcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.21.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

One more step closer to real .bdrv_open() handler: use more usual names
for bs being initialized and its state.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 94b1357fd8..78dc421db2 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,40 +144,39 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *top, BlockDriverState *source,
+static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
                     BlockDriverState *target, bool compress, Error **errp)
 {
-    BDRVCopyBeforeWriteState *state = top->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    top->total_sectors = source->total_sectors;
-    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+    bs->total_sectors = source->total_sectors;
+    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
             (BDRV_REQ_FUA & source->supported_write_flags);
-    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              source->supported_zero_flags);
 
     bdrv_ref(target);
-    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
-                                      BDRV_CHILD_DATA, errp);
-    if (!state->target) {
+    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
+                                  BDRV_CHILD_DATA, errp);
+    if (!s->target) {
         error_prepend(errp, "Cannot attach target child: ");
         bdrv_unref(target);
         return -EINVAL;
     }
 
     bdrv_ref(source);
-    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
-                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                  errp);
-    if (!top->file) {
+    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
+                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                 errp);
+    if (!bs->file) {
         error_prepend(errp, "Cannot attach file child: ");
         bdrv_unref(source);
         return -EINVAL;
     }
 
-    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
-                                      errp);
-    if (!state->bcs) {
+    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
+    if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
     }
-- 
2.29.2


