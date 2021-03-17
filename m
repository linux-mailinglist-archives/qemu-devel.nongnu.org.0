Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1697A33F3E1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:16:12 +0100 (CET)
Received: from localhost ([::1]:48412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXu7-0004pA-0T
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIO-0005Zc-2q; Wed, 17 Mar 2021 10:37:12 -0400
Received: from mail-db8eur05on2128.outbound.protection.outlook.com
 ([40.107.20.128]:5633 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIM-00079x-2a; Wed, 17 Mar 2021 10:37:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5RyMQJvSogcpgl+DZZOgbLsfGz1XD2knZhJDoxMqBFAkar5v2bS+NCNH8ovlaJIUwS/1hb0ISVHntpLeAkdJS6/zC+YaDR7RhAIDVmTTvn38czPf+NSNgX4PPKQOAK5pH+UU4e9e1zYV3/UonL4mwP2wWFE0Nuc1GfNBMtfAdUHkXhoABqSbNpU2lj7n8qGiA/jifytR05P0U1hy55YYC+BCMP6zfTMOBJbqTMRxDTiTTAE24JvH1MRdr6TGVjUN04l8ASFTscry3hPx/HLrBi0se5bzKZbz7CnR1pDnMC1Gj6F47RN5e2b0f0yd0y9z3uHe2IXlzUR2jkqskephw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uf2kObg2JOykYZkfMlchJRq1hql2HSNxsoDM+Orol88=;
 b=hwFKMZ2vrhva92H4pwB81eMZbknnDu8UunSEJAf5dmKTU4LeGhX9fUFv5ZtgD/ySqwR0bR52Kj6D/y3Ha3Bn31NJgDZ2P+JNMxLgwYOx5q1Dm3XB8nWK9nljHOXVukVyUtuId7JELLeCBkrM9lepdSS4UMwROwgvtDvv7myOBAFVeuQ2+O0S2/CRct3n31nrJkHsncT3HJw+LpsPzND6TidivX37z3ZttILmElduG+c645+UsZrYpt5YL1Elts2Bj0EXaUxwkr/ifwlw2KCpS77vLKhyXQo5icq96gHbK5mIxOPfn6fbw6m+dhpBpk69FHI/yzzuajnnNzB1I47EJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uf2kObg2JOykYZkfMlchJRq1hql2HSNxsoDM+Orol88=;
 b=JY5JdQW9ZwT4A4LFQTeyOCdSnO53FoqtPe/07SH03eOZsX+8j8NBbdRa1Dye/u29EVME1T5Cvl6JlxkCAQ7RHSSOmZ6Ki45uYPgIBTI6iekRMKh04dnUYc2IvEkjgUO2OqwyJzLD1EAkupdMrn/8TeTVTPH8OtXVXoVF2xPSJlM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 36/36] block: refactor bdrv_node_check_perm()
Date: Wed, 17 Mar 2021 17:35:29 +0300
Message-Id: <20210317143529.615584-37-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa181db3-aca5-4b64-8d39-08d8e9521c46
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62164B9423CB3122E070BEF2C16A9@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GHaFYcjtL6TnNOLyusWjsHIvhQ0EN7rKo3uXBuUjRb+HrdDLYKRRJXxZGeawO3H/FDyddb/EETU4A8nSPe9cxKuvz/N2rQ7UGRG3ds9mmmSx21n37du4aO+4a107VxKGYTPlLIgUbZ7wovvIdyFkBNlci5m2wl5Xg2jLZV8ziGq3Bnq2nclasGrtsQVHugWVJFJl7vJus750N77H6aMWnhAWr08H97d9gzAh6z6ULUU3MhxYfLBVWp4alUdUA2t3vEnGfzwVhipave6FnZc8reCjbWmEip2rElsKqfJppKDFTkSEhV01RkpQArHRUgc8rflwc92ZY1e9KAcmSnZAOysuWt0Hn07H/dtH3HU2jToTqEHpgbYkOB8qZ4ANQ1Xa7oOySxSt+bZ6bmG+KCcUDwzFvtuOc31tN8Jwdt4s2n6BOPSs61JCwiXDnHTKI66xR8boaYDQwLzeMGRW6n2gDjB8rBeoDDrPBmPQTp9ErBEmgAs6KrJ8+VBUwOOXoWAnZFO3oli+l6/B1LHU5odVh3yGWz7HmeTZbGGyij1R8dKsTrGc+OgXqqLO5CsL8D3c5j5sRo1OmcsBYPdsjT8MeajgBaFI8usmBRsZNz50gxdU7MoEIOxZm/y045Ge4CBp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39840400004)(136003)(6916009)(83380400001)(316002)(2616005)(66946007)(6512007)(66556008)(8676002)(956004)(26005)(1076003)(16526019)(6486002)(186003)(4326008)(36756003)(8936002)(2906002)(6666004)(5660300002)(478600001)(86362001)(66476007)(6506007)(52116002)(69590400012);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7D0+XH27D56CuqHCUjRTGUmEqjW3aGGSoTS8YUrxRslcv2cVGOISgGpMrf1b?=
 =?us-ascii?Q?mUnTLtzveE2fiDefB0/bjUGmRLCwtHt/mxK/HyA/YKYlhKasdOgMmKPzFIMj?=
 =?us-ascii?Q?vyNnj8eZ97PIfAUPvog2zRqY9GIEEY2OVX/uVKyu6fKwnCtGQQNlEOFMSgRs?=
 =?us-ascii?Q?ycP9omYcBXES3XdP4e1/7Vh7sEIzm4CbuBpz9U95kGcH6Lu1aKoMx0vGGcld?=
 =?us-ascii?Q?2m0FMia/vsJq+v7ugs+0OVcmXcIN4x2oA4dTu1FGloUL4AQbWTTUjPo4BZUd?=
 =?us-ascii?Q?XWyGoTAQwUhcjU+vSUaGWWFjuJtDMPizscIU+wgZibAfyuz4esY3tx3rOAmP?=
 =?us-ascii?Q?rGDxBq8BcGdGB4X2Xvb7ul3p4JZA+kZavi6GD34FuzLnLNBUA2WEkaxuOjN9?=
 =?us-ascii?Q?4vTd5UoIjXpFiuuBWezgXrIbRmgSGvtcqjh/k/BfB9/Y8wNpNkXILnd0BYtt?=
 =?us-ascii?Q?4WunuDG6n4t2a/i8bYrKblkrp1yCpiGjcz2ENAUokPB6v4FFDwVepmp/pgNa?=
 =?us-ascii?Q?6QR3ZS05O1Fj3j2PzD2L1Pd1ixCqF2TaSzLkZF3HgFU2BMYKpNdR9r8EKVXc?=
 =?us-ascii?Q?ItQ4QL8f0NALYmyK8AuvfrgGwVN7/c80CkLG3ZAN4qqbxBFZ4X/bHmqqEplS?=
 =?us-ascii?Q?yM/S1a4scB1iWt0zwxhjBY/Wj8uBm2fq1mxv5y9r5jld2fjuYyxZtesP/vi0?=
 =?us-ascii?Q?Vk1WW2p8aQTOUHjgNzFF1hmsBL/LBhXNPDCkvLNYjnZjCKPjBXpdmTZil4cL?=
 =?us-ascii?Q?3zisOpoOQF2OcgYxjJdzOrSytV+mX+UyiFWwcKTB+ydbNxLSy3TU2KKBRvAk?=
 =?us-ascii?Q?xk/si/Q+qzx6j+4MCWEhh+S9IbfG3mvmpRtW0yOA94ETD4aC7MwEy+ZSVHsF?=
 =?us-ascii?Q?IEfxfBWKTHWf3LLZ44JBm+EcaMyY1XIQHoKQpGJbkSJstD1ClLD3vkICaZSv?=
 =?us-ascii?Q?VG/zQTUKwODA4VEY+hHbIA+ZA0KBk1d/vlqB4dAQYB0/YRcBHcVnCuECjGwn?=
 =?us-ascii?Q?FC3pWXw7hW63mAlVpZ9HkvgzG07aGh4I50Fk0dMWoHY+4nqcTlo5w+rMEg/g?=
 =?us-ascii?Q?5QR7Ons6Ik6ddIvfad5WEcjaMEgIXr5Eco6RPouU9muiZVLa0ApD35rseAHV?=
 =?us-ascii?Q?i3onojY4zkVcj7AC/7CZmCX78EuzicrSYpvfc6Z3QG8OpunYJlLsvuWPwd26?=
 =?us-ascii?Q?IAbb/f82qDr1GS20R3kaoGYrQi2oZDTQ2Uhe1TovvMsBQ4NGEjv2DJaNUttO?=
 =?us-ascii?Q?OvjWO/uRRmiJTy61S25evzHruI8Tsq/aTCsRsjCXZxUUXn92Fbe3N/HXUK9c?=
 =?us-ascii?Q?OrqoxHXxnudrS3Ehrli5urvj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa181db3-aca5-4b64-8d39-08d8e9521c46
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:54.5643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TU12grWXU0BVRiXQZ4DhrnQGT3gyzOAv+1E+4BOez7HEKnobMJ2YGoZ2arGIdOTcEzsTFQiugpmQ9cBL0oF9PfLYtcy2I+NUpvFz8fqDVIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.20.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Now, bdrv_node_check_perm() is called only with fresh cumulative
permissions, so its actually "refresh_perm".

Move permission calculation to the function. Also, drop unreachable
error message and rewrite the remaining one to be more generic (as now
we don't know which node is added and which was already here).

Add also Virtuozzo copyright, as big work is done at this point.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                | 38 +++++++++++---------------------------
 tests/qemu-iotests/245 |  2 +-
 2 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/block.c b/block.c
index b61ac9ff19..95d8246d92 100644
--- a/block.c
+++ b/block.c
@@ -2,6 +2,7 @@
  * QEMU System Emulator block driver
  *
  * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2020 Virtuozzo International GmbH.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -2236,22 +2237,18 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
 }
 
 /*
- * Check whether permissions on this node can be changed in a way that
- * @cumulative_perms and @cumulative_shared_perms are the new cumulative
- * permissions of all its parents. This involves checking whether all necessary
- * permission changes to child nodes can be performed.
- *
- * A call to this function must always be followed by a call to bdrv_set_perm()
- * or bdrv_abort_perm_update().
+ * Refresh permissions in @bs subtree. The function is intended to be called
+ * after some graph modification that was done without permission update.
  */
-static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                                uint64_t cumulative_perms,
-                                uint64_t cumulative_shared_perms,
-                                Transaction *tran, Error **errp)
+static int bdrv_node_refresh_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                                  Transaction *tran, Error **errp)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
     int ret;
+    uint64_t cumulative_perms, cumulative_shared_perms;
+
+    bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
 
     /* Write permissions never work with read-only images */
     if ((cumulative_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) &&
@@ -2260,15 +2257,8 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         if (!bdrv_is_writable_after_reopen(bs, NULL)) {
             error_setg(errp, "Block node is read-only");
         } else {
-            uint64_t current_perms, current_shared;
-            bdrv_get_cumulative_perm(bs, &current_perms, &current_shared);
-            if (current_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) {
-                error_setg(errp, "Cannot make block node read-only, there is "
-                           "a writer on it");
-            } else {
-                error_setg(errp, "Cannot make block node read-only and create "
-                           "a writer on it");
-            }
+            error_setg(errp, "Read-only block node '%s' cannot support "
+                       "read-write users", bdrv_get_node_name(bs));
         }
 
         return -EPERM;
@@ -2324,7 +2314,6 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
                                    Transaction *tran, Error **errp)
 {
     int ret;
-    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriverState *bs;
 
     for ( ; list; list = list->next) {
@@ -2334,12 +2323,7 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
             return -EINVAL;
         }
 
-        bdrv_get_cumulative_perm(bs, &cumulative_perms,
-                                 &cumulative_shared_perms);
-
-        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
-                                   cumulative_shared_perms,
-                                   tran, errp);
+        ret = bdrv_node_refresh_perm(bs, q, tran, errp);
         if (ret < 0) {
             return ret;
         }
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 11104b9208..fc5297e268 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -905,7 +905,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # We can't reopen hd1 to read-only, as block-stream requires it to be
         # read-write
         self.reopen(opts['backing'], {'read-only': True},
-                    "Cannot make block node read-only, there is a writer on it")
+                    "Read-only block node 'hd1' cannot support read-write users")
 
         # We can't remove hd2 while the stream job is ongoing
         opts['backing']['backing'] = None
-- 
2.29.2


