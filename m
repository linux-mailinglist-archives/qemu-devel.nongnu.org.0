Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E10039789E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:01:44 +0200 (CEST)
Received: from localhost ([::1]:54062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7lv-0000Bb-IG
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bq-0002Ze-Tp; Tue, 01 Jun 2021 12:51:18 -0400
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:14240 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bo-0002Cd-Lm; Tue, 01 Jun 2021 12:51:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anypZfyA9T0zBjHbqftlqr/s3Mo4V6yLoTCWDuKUVa9LcwSgxHJ9X2luycllgvK1iGMmZy0t1PlziViwgiG0D3iXwpD4CsS9QRfNR4FTyv0XYiVzkF+lT9ukSYvxPLeGdVwC9QGuQ3X7bazfXeR/tmzbunF3o5nUiSl68wZXlMKc1W82jCWX1D1sGzh+x2wkcVhlbQlPFN1xZA1bIybsDxO3vX4iASj2G4SpcAdAafQw2KbFVVYgyqeRLH54uzTIY8tKpdEQtPXi1ymSTH+kvNHjZclWJ2FQWvUylUHmq+PwPygFeCfZfe6orsWuR8Iwzgz2BB5u0oqPfTJvH7RugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CxcOwZdKNFNzBx0wXYgJ5RkseoqLR9SUNfi8XYqszo=;
 b=EIkGzi8yauLKYVCA4QrewXyRMXrz71FILJgNaw8ebQe6emGP0+r+gPBL/jdohbqs3NEg/gLExCHvFmHtqvMCGe+CUhF1WqGjKhip9ny0Od53jAbkBLf6GX9kHJ8PgqpMwGQLeGcxqr2sop1hkh1WG+Dq7S1WH0uB1ccGBCRAo0qay1NFWv5uLIVSq5db34PlCzxuxvZU+G6WCMZBnNaxg4HnuCTwssHfzMHhkJDrwpZt7IY4Va0VqzLiTeiRK0O8kiGhkBFsBSO9fqy3EGD4Q2KcvabTevoWS6GrHFs4OjvP9972vockLXFUunAOd9pvRofqwZ1omOcvvSwRAIdb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CxcOwZdKNFNzBx0wXYgJ5RkseoqLR9SUNfi8XYqszo=;
 b=OJF5tyHyAxd6QElxhtTDZpVGmAaryDxBcdqYoSfE900ClOJvV+zLSBpvLVzAW+D9VP9R6V7TkCop3kMfPtRbCtxf+IB7MceA0Ji+uRgPFuLUbncx/e/ZKLK1kb7R7+ih/wF7VDxzopQwrLt0XnE7hudTpmIBTS3dyRWnp7C0sKw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 16/35] block/copy-before-write: introduce cbw_init()
Date: Tue,  1 Jun 2021 19:50:07 +0300
Message-Id: <20210601165026.326877-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba233791-f396-4376-97de-08d9251d71d4
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1972F6666D164A0A19F028FAC13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fDqbHxr/kFxe2ih5rYyAmcrJVcVic3EuGUQ0n3uzI51G9wL/QAfI52DjB2UqKzklLwSXxq+T2GEjB64QeJTq+mNuQa13kDLe9XXXeDY6+NNAAZvuyyIzAtynWEdYGUUwC9MGCublZUpgSnI+1eOnfWsecb1CQ4xyXI8RI32R+POHr7T3h+VPz/v99VSG0ZU5Uv7FhogKy9odnJHnBU9DJQo9eB2Vl7wU74JUNiqklwvfOQcNNLgW+IYdu405XPeAspaLD0F8kucgpdI5cGNGf3xGndDsU9ilm00y7vVtSkagq7M9h4iKn7W4EFXMkzKwc9uVNghbl7GoJqnejIQUrzeqOlcxGr5wvDfVYfSWCNQJtAtdqlNIuCvEzb2l4MT+tu/sZB4BW1O3o6JuANWptSyaFjph/xNP77D9Iv3SzciKwmRKCvSTABWzDHgAis+QiA4R6szXl0c/JWi6zgFA0BdZTRglpNXpE5bS0qYmKuJVq8sC8QzDyJ0z3N4AsUI1NPKlcuqVI3DIQhM3uZYiwx3fucpEMa6BRN5BHxgubivpA1tRKnB+33W7ngRtRfaZSrHIJDbpHq4MvPeBVPK0msuVS4OiOBWlxwLucw0ufZBOyaFp0E4ekOGeIX570AyUi5I33gaOa/EIEzIcbGmTbNMxL5DiFpREVGRlRuIhEeF+wFPBhzB9bmxCCQPwzl2U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hdukJKCTHKV2GwlHwo59C9WWv7QZGR7Le0z6PDZuyGFeVdi6Iz22VeKFkfia?=
 =?us-ascii?Q?6XOFn2FdZ6nSdwcBBD/ZzEsMuN9NJBEJdOYHG+A1dYMINIk9flR/sFUKEXfD?=
 =?us-ascii?Q?X5deCmiRc8vq9hTbsst07maLcm5rHASYcJSlsSrHCAc3GWeDVDN9Yc0MR3N0?=
 =?us-ascii?Q?N3xL4gPYC+2MGnDKZQgRIpFZIq7UougXf5zD+2YFf/sndLAzF3bd/yMv6ixh?=
 =?us-ascii?Q?W0TcO23QnojGRg9BNzReR9gKxdXZCRzle6y2Nqw7qSXGpD/Hxuv3X9/sTie/?=
 =?us-ascii?Q?lOf2YI3z1duOSQ/yuK+YCXyaIZuhwSV+vvR6/y2yEcIT4jeWFSaC3E3uG/vD?=
 =?us-ascii?Q?SFy4LTn5VdO2eFEJut8SyAbHy3xi5xqpnQ+/tFGGKPqET5Sj0UXG7paBBUVp?=
 =?us-ascii?Q?snSUPTgZKyjdVCKiT0hTp2aEP7Rr0tqdr3JdEq0IUg8tYBz2tqu8myDe/IoD?=
 =?us-ascii?Q?Ieg7ImwARZFiIrfHwjqTVQJqCFoNNcpQtSbz0I7vigZss1PCV/n6GUZnN2k4?=
 =?us-ascii?Q?Dtnv4hqK4CKtxJjohbHn2D/m2xNkvukj1Azh7ekie3ws28DCPTvJgacXyHvn?=
 =?us-ascii?Q?v/eqdj0MqrRhxSRvAEKTUQ4x1MI8/w09VwgfCJEJawjZ0Z99HxoR/Dm0ez6P?=
 =?us-ascii?Q?mIZdqeFfY3sfAqNTqNSY6nqfMFeD0StxCFtmMY6fEAm+HOROytxngDNwSlqt?=
 =?us-ascii?Q?72zeF9NrRG2F4+jv617816qsYGE+TuLdzdXG1ULQuIcn+YpJOhOnXkVPoqu2?=
 =?us-ascii?Q?UNs3relppP/bEBA/vqRpzOAFFp5+GCMfOnmfIHfNiH3tZg5DXdC5XrtugIid?=
 =?us-ascii?Q?folbbxrbWEbeA8rWUd6mvY5+/9iQ7ndcX75U3+PN7790R6f8LLqzAt7xrv1u?=
 =?us-ascii?Q?wO796r5GKaTqpMVbpjB7eaFigxJT3j2DtDBPqaAKkZP53NYu2IZYLX4KkFtq?=
 =?us-ascii?Q?f918YD4yCDRnBtkcjx+mbqMSteJQNlwiJby++klWgNcMklIU8Zl8a5bJVWZ/?=
 =?us-ascii?Q?2K4x3wHEN9ox4sK3TStDCSBd6ESIGzLE3O+JHtmqTn85TtmraLe+SLrYc3zD?=
 =?us-ascii?Q?0FBVu0s5MPI0vtKRTsmA/8CBrpbIdtiMePin5ARYDXsjpHCvmh9sMcnTPA4K?=
 =?us-ascii?Q?ySQPreUu5Oe72V3+BgIef2Lg5MReRA4kWPONi3E0NfDmXcu/lacz3OhisOqq?=
 =?us-ascii?Q?Ku0HGVMogFuuejbXVmwobwBHXshOjVObwU+rZGc8F+TV34Cxakh9Ss8SuvRC?=
 =?us-ascii?Q?72l4NIKLV8g5xJvY6qaop58QPgiiV1OETHrYMdpupwEwF0/2P1waql28b0rY?=
 =?us-ascii?Q?eHtQDZVZWmTRXHP05EdbXj2d?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba233791-f396-4376-97de-08d9251d71d4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:04.5166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJLk76zpkpCqJ30vuGhn/EWd371rxZ7INIriat13YLq9rTFMU1bqZ+M6lTKUJ9H93wBDjMN52THzx4L1roOh88wfkpC1mEyvooXNoEUZYv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.22.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Move part of bdrv_cbw_append() to new function cbw_open(). It's an
intermediate step for adding normal .bdrv_open() handler to the
filter. With this commit no logic is changed, but we have a function
which will be turned into .bdrv_open() handler in future commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 69 +++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 28 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index adbbc64aa9..a4fee645fd 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,6 +144,45 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
+static int cbw_init(BlockDriverState *top, BlockDriverState *source,
+                    BlockDriverState *target, bool compress, Error **errp)
+{
+    BDRVCopyBeforeWriteState *state = top->opaque;
+
+    top->total_sectors = source->total_sectors;
+    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+            (BDRV_REQ_FUA & source->supported_write_flags);
+    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
+             source->supported_zero_flags);
+
+    bdrv_ref(target);
+    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
+                                      BDRV_CHILD_DATA, errp);
+    if (!state->target) {
+        error_prepend(errp, "Cannot attach target child: ");
+        return -EINVAL;
+    }
+
+    bdrv_ref(source);
+    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
+                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                  errp);
+    if (!top->file) {
+        error_prepend(errp, "Cannot attach file child: ");
+        return -EINVAL;
+    }
+
+    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
+                                      errp);
+    if (!state->bcs) {
+        error_prepend(errp, "Cannot create block-copy-state: ");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 BlockDriver bdrv_cbw_filter = {
     .format_name = "copy-before-write",
     .instance_size = sizeof(BDRVCopyBeforeWriteState),
@@ -181,36 +220,10 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
         error_prepend(errp, "Cannot open driver: ");
         return NULL;
     }
-
     state = top->opaque;
-    top->total_sectors = source->total_sectors;
-    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-            (BDRV_REQ_FUA & source->supported_write_flags);
-    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
-            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
-             source->supported_zero_flags);
-
-    bdrv_ref(target);
-    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
-                                      BDRV_CHILD_DATA, errp);
-    if (!state->target) {
-        error_prepend(errp, "Cannot attach target child: ");
-        goto fail;
-    }
 
-    bdrv_ref(source);
-    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
-                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                  errp);
-    if (!top->file) {
-        error_prepend(errp, "Cannot attach file child: ");
-        goto fail;
-    }
-
-    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
-                                      errp);
-    if (!state->bcs) {
-        error_prepend(errp, "Cannot create block-copy-state: ");
+    ret = cbw_init(top, source, target, compress, errp);
+    if (ret < 0) {
         goto fail;
     }
 
-- 
2.29.2


