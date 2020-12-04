Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78C12CF69E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:13:16 +0100 (CET)
Received: from localhost ([::1]:52770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJKF-0006Xl-Ru
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFe-0003N2-SG; Fri, 04 Dec 2020 17:08:30 -0500
Received: from mail-eopbgr10108.outbound.protection.outlook.com
 ([40.107.1.108]:31004 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFc-00024O-QT; Fri, 04 Dec 2020 17:08:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+YMRU6f3X77eOvo8aBi3vqX46+23BOdrlhuc79Z0p3yaU1AHGyhJjVBOKFXKKTJmWJI3vWVeQaEK+EcLP48KYbwT4DooFAe9n2NrZD/xCJwAJ70jsxQPtt/QsCwdH1Eko2OCrI4Rfh7981bIYvIhp48yHiDmdfR4NUYI4qPO18ZZp8qTUmR/jbPVqVzEsbGbIlLQ+3gw14HaT89sOKnXZYwYjCQ8IMjz6ps/8FVnMNdKFS6Pn2K4Ug1ib3U7xySqPa4DaXY1WSolDlUzdQo4Z34E0Qk7zcMG9rgW0pCTiwevxxhyKgMvlGpYfL//93mXjoDxGfPgrBm57p7TuhNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eCCJ+yv6h620/iFwwUoD2atejSkLc1qEP+q2NGFcjE=;
 b=OJU2rQX4sziFGcKLI2NewojntWQPRuSJEbSPmaE/6cuvLIHE0begDs3FMiUvLQwarDKQx8BdGtOgZ9zGQWCSbSKazk7+969JvQEJq4vmdyOUQ+DO6opZZULVvWRPq5gSRhWkmFpEV3U3DTbmWGm4x3Q2QeTop37wBvbcgWPmzuRTv2SI9fFxX3450MG0S8UwxTXvXTvn45lDDOXvRvqfNApuR/Z2mOTdjPUqPdF7uogqoHg4IULbOnStZ3Dkglz75GJ1mhIIrJWiuC9LmeEnETCt+MaNfE2jFTEr6Zt8OBk3BaBqLdP8gwFIwiiDoTUh6HuFbRpduqSVquqMtP4scQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eCCJ+yv6h620/iFwwUoD2atejSkLc1qEP+q2NGFcjE=;
 b=VifWAJn1uZ3AQtIrDzYamJjxGK5+jtm+tA3ZJRcDS62S/Cr8djuVz8UaPssXqnobAua2y3Ih07tyBl3iZAdt6AHecRzIBFXEcmS6YmAzvT0NDnGi7iuKl7r0BraMFyyNwAnw1+XMjcoy90nZQ66mcJGTNIPyJ2rlkBmuCgV0oPM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 03/13] copy-on-read: add filter drop function
Date: Sat,  5 Dec 2020 01:07:48 +0300
Message-Id: <20201204220758.2879-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201204220758.2879-1-vsementsov@virtuozzo.com>
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 4 Dec 2020 22:08:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 086584e0-fe12-4884-57d8-08d898a119d1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072475E2C3820640294C3EAC1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: da2tQVuMSNVgbTvh9TYxOgcgGeJTDlkZHoryUL4d23Jtma6t9lpt5NzxRZvexnubuzXQsDSJ+vajzJS0/AX2JsF8Ewfsv4S8gI9IAmHZY2km9W4Zkl77X5p+9jiEhbmXTxR2gTP0aOI3IqH7jr/09xRIaeAv1Dwq9KrlxXXBhgSOFj6bbeID1irOyTY4fDMI7+ODDiIBgeIP1EGAoE1vyOfn/M/Rd3iu4c/Vw2xldOATV/bw1DPKUhR8LzWfQY6kH8sBNt7+CyEkjRxVAb8kIIupg4giq7gUFAq9iJDxCEDywD7Zfq5cZHrAjxyM1Xb+LzlxZxZU3fUbjGtONrbuLLR+rymeIi2r6XLhrzP5wiO1RpTvPcff1+jjuOq9wSMCB0LLe6gOIyMAtuM9YeoCFK0CqUhd0N+9kziZjnm6cdYo2AOqy8pcE8kgQYwlU0vmq/rBc9LLzf1Fpa9opGmqlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(8936002)(2906002)(6916009)(52116002)(316002)(478600001)(6512007)(6506007)(83380400001)(2616005)(8676002)(6486002)(956004)(5660300002)(6666004)(107886003)(66946007)(1076003)(66556008)(186003)(36756003)(86362001)(16526019)(4326008)(26005)(66476007)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?L9exy983junWA64ZC+Y6+mBbUu9rVb4qTRFsrwfJCIoGZBNkTQH2NFXDad1F?=
 =?us-ascii?Q?BudDMkBsfQj4IyIo+9MWm47ZJtmU5cEIe2Dj81WJ3CiLDEbnPEuz29YjJWqL?=
 =?us-ascii?Q?WsIoDS2Gpm7uQxJ0uSo2yvMU3ybJPKgYS33a8tArLRLShaUuaz51APLEoZgv?=
 =?us-ascii?Q?EcquCywDQVwOJYfBQSBWOdRp0Ul4VcsrwmSg3GO0twijoj6KRLtfpuPzGlAM?=
 =?us-ascii?Q?Xl5QeW/yuGAzgCjCTjjiyJfVEB7w1P5/q5/8ckwotjD+2XqdoKT9llXm1cAX?=
 =?us-ascii?Q?38Olu6FbHVpti45WZWalkKT8dXl6xApr7lmEVG0/sKGQrz0Ua02PUCuAll4p?=
 =?us-ascii?Q?V3esYylpVM9ndMljAQM7IBGgDn2lNNTGhPmXC6475zNiTCBZLYkRxUfMn0SU?=
 =?us-ascii?Q?4ixQS1d91PedxvHYyVhs2S3nIOQ5nrvTJLe6Cn5t8RYFEUxOSN4mZu5xGMTO?=
 =?us-ascii?Q?Z9d2Js56X6zkZDvfdmuHVSk65Df0Ka2NLKuVbXXysfxb3OZzu5annY0oc+8V?=
 =?us-ascii?Q?dtjTZoUJI0QnTqcc0D5SpwJCH6TV6TB744jqP6jJG4zgT6jYSJeFZ9zLz5+T?=
 =?us-ascii?Q?tbvpGdP2XZJ+J0XJ1eICY3JQb/VWqLW5EAG4fWJpt90Yme/3PG7O9ROCW1tH?=
 =?us-ascii?Q?qo4dPwtXlV5EL12LYsaDeCLiB37tdtzwl19/rU/k79ypvVS/Xdwv3IY5fYLj?=
 =?us-ascii?Q?K34gLniSUUaYLmniFTikcGuKk9IiOELVWbzCXpfO0+wO+OSIPI0AvTkRL8zp?=
 =?us-ascii?Q?IPSVtbhI7L2mX1wc7/w9w9NSaLp4yP1wBYjbTUnD1tBCBNTHqCtZ2gvGL1Kl?=
 =?us-ascii?Q?UOx8yvInZCeFTf/gIqY2OwiEfMv7LfpglAQlkESubGLXJI+Gn7ngELOY3kO9?=
 =?us-ascii?Q?lBtjids8lPvFTU9LKqPjqQlSn6LPf9DoRjMiKsjSoEjM4lBgf1mgimR2PXlA?=
 =?us-ascii?Q?I99TdvN78CoN/kqfSUEKdUqXp/gmJsU6UmWNn53x7K2iITZvW6gWBgzWi+aM?=
 =?us-ascii?Q?mxuY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086584e0-fe12-4884-57d8-08d898a119d1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:16.4755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdOJt/GxyJ6bmJ7Ron9aAV0SRLxn1cxYlfVP66edIlJa3HhtZYyA2F87n6Oe+kfNDoxioKynFXL/MtOz/FYAe1DpbcgooRHk+WF35RLrmoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.1.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Provide API for the COR-filter removal. Also, drop the filter child
permissions for an inactive state when the filter node is being
removed.
To insert the filter, the block generic layer function
bdrv_insert_node() can be used.
The new function bdrv_cor_filter_drop() may be considered as an
intermediate solution before the QEMU permission update system has
overhauled. Then we are able to implement the API function
bdrv_remove_node() on the block generic layer.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-on-read.h | 32 +++++++++++++++++++++++++
 block/copy-on-read.c | 56 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 block/copy-on-read.h

diff --git a/block/copy-on-read.h b/block/copy-on-read.h
new file mode 100644
index 0000000000..7bf405dccd
--- /dev/null
+++ b/block/copy-on-read.h
@@ -0,0 +1,32 @@
+/*
+ * Copy-on-read filter block driver
+ *
+ * The filter driver performs Copy-On-Read (COR) operations
+ *
+ * Copyright (c) 2018-2020 Virtuozzo International GmbH.
+ *
+ * Author:
+ *   Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef BLOCK_COPY_ON_READ
+#define BLOCK_COPY_ON_READ
+
+#include "block/block_int.h"
+
+void bdrv_cor_filter_drop(BlockDriverState *cor_filter_bs);
+
+#endif /* BLOCK_COPY_ON_READ */
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index cb03e0f2d3..618c4c4f43 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -23,11 +23,20 @@
 #include "qemu/osdep.h"
 #include "block/block_int.h"
 #include "qemu/module.h"
+#include "qapi/error.h"
+#include "block/copy-on-read.h"
+
+
+typedef struct BDRVStateCOR {
+    bool active;
+} BDRVStateCOR;
 
 
 static int cor_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
+    BDRVStateCOR *state = bs->opaque;
+
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                                false, errp);
@@ -42,6 +51,13 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
         ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
             bs->file->bs->supported_zero_flags);
 
+    state->active = true;
+
+    /*
+     * We don't need to call bdrv_child_refresh_perms() now as the permissions
+     * will be updated later when the filter node gets its parent.
+     */
+
     return 0;
 }
 
@@ -57,6 +73,17 @@ static void cor_child_perm(BlockDriverState *bs, BdrvChild *c,
                            uint64_t perm, uint64_t shared,
                            uint64_t *nperm, uint64_t *nshared)
 {
+    BDRVStateCOR *s = bs->opaque;
+
+    if (!s->active) {
+        /*
+         * While the filter is being removed
+         */
+        *nperm = 0;
+        *nshared = BLK_PERM_ALL;
+        return;
+    }
+
     *nperm = perm & PERM_PASSTHROUGH;
     *nshared = (shared & PERM_PASSTHROUGH) | PERM_UNCHANGED;
 
@@ -135,6 +162,7 @@ static void cor_lock_medium(BlockDriverState *bs, bool locked)
 
 static BlockDriver bdrv_copy_on_read = {
     .format_name                        = "copy-on-read",
+    .instance_size                      = sizeof(BDRVStateCOR),
 
     .bdrv_open                          = cor_open,
     .bdrv_child_perm                    = cor_child_perm,
@@ -154,6 +182,34 @@ static BlockDriver bdrv_copy_on_read = {
     .is_filter                          = true,
 };
 
+
+void bdrv_cor_filter_drop(BlockDriverState *cor_filter_bs)
+{
+    BdrvChild *child;
+    BlockDriverState *bs;
+    BDRVStateCOR *s = cor_filter_bs->opaque;
+
+    child = bdrv_filter_child(cor_filter_bs);
+    if (!child) {
+        return;
+    }
+    bs = child->bs;
+
+    /* Retain the BDS until we complete the graph change. */
+    bdrv_ref(bs);
+    /* Hold a guest back from writing while permissions are being reset. */
+    bdrv_drained_begin(bs);
+    /* Drop permissions before the graph change. */
+    s->active = false;
+    bdrv_child_refresh_perms(cor_filter_bs, child, &error_abort);
+    bdrv_replace_node(cor_filter_bs, bs, &error_abort);
+
+    bdrv_drained_end(bs);
+    bdrv_unref(bs);
+    bdrv_unref(cor_filter_bs);
+}
+
+
 static void bdrv_copy_on_read_init(void)
 {
     bdrv_register(&bdrv_copy_on_read);
-- 
2.21.3


