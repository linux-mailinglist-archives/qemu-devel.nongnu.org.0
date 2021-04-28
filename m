Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5BA36DCAF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:08:41 +0200 (CEST)
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmjw-0006Iq-Vd
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyn-0006Zl-Vc; Wed, 28 Apr 2021 11:19:58 -0400
Received: from mail-eopbgr80128.outbound.protection.outlook.com
 ([40.107.8.128]:24602 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyk-00028J-LS; Wed, 28 Apr 2021 11:19:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3LKGxxuOs82qHQnvnhi85w+931MsXvzeTBj6j5YSJFU/ghN6eSAzH/N64C4KnYaC+9qQv/ZFeAbNob6LQkGmsn0nlsOlu/ecySnp8k6iqthIuCHtZmt5YsNO9BKboHAyY6+6Sx6/OS5dXZttA1eqkJBiZXSbRhlXAsKXE3Nc6lLKHtlmriDaSr8elFUssTzc3Tj621jN5Zh+DyOkLvHg1Fei7cR0uIf0v7spbnjBW3r9TN65fiUi0SbORY03dPjMOd/EJRvYmrWFp2pDPcQaZzMbuBDEAh+MfTU7S2bZXba9Um6oATEm6PG7hR3lTw1iCSqUGcGBnH+lsYFCuAYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cj3qhNFhekB51M25WI/oMFAWIR/Q9rcJDeUpCQ20iA=;
 b=LhhHQgdC0crVf7CG7H+venWBLIgwGVTATe80EbCoQBSQ1HEQ7HH7GWOEuhyyZamzTI3PcDtv3PU/kFWTqftSdmQzMO3wldYR6rAKYLbRKI/wmKlHEpT+gIeT/ihj5mXSKqi4cZz7b4+l4wLonLPoOw/fX2VJctrkXs7PZXfHeJZddpTEleVNbO5gDPSOv9n/z9/JYNDbWKyiMcbLYxOtgI04qfwvOt7kwBJ4zgYmUQhgxlwKrwHz5xyRORzlWUgTujqM3f3vfMM0r31Pqo6bRmaG/hgGWOeqqKRejddu/MJqeY9n8UltjwY/eez0bY2/SEiYr3eSQt7NhOOUKqa+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cj3qhNFhekB51M25WI/oMFAWIR/Q9rcJDeUpCQ20iA=;
 b=cruT1tQLXWu6tRpjmJxDbkeNi2yPegdVuGELQUadhPOMYaPYPb9aBKB4OE0UXZRPrerD0g+Hr0qYXnOWIEo4TR+dHeUm/Zg+Cj9QoIbGt5clRDhg89Trl9+TyuRi1hVzxg71SyNXWh1yHYnDARygBG+SJzY7vdDb+r/cRIDEqm4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2419.eurprd08.prod.outlook.com (2603:10a6:203:a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.26; Wed, 28 Apr
 2021 15:19:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:19:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 36/36] block: refactor bdrv_node_check_perm()
Date: Wed, 28 Apr 2021 18:18:04 +0300
Message-Id: <20210428151804.439460-37-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:19:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9c07587-962a-48fd-fcc6-08d90a58f4fa
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24192FB57D78C2B8240DFA1DC1409@AM5PR0802MB2419.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXd52IrPbBQbeOHbnL9z8p1zzts6cQ3FSQX1SR3twCby4Wablxc31qg+07EY4AOr2vtkn0mTODifwbsnM6AJnealLCeD+dbqbtXe7AFHmxJgv8sIsNRffONwAmHNvUw/WVDfKHyIHz/UwBeMFDRGooxcnL0p7pzH7vOeLPumb8M1bpT5DKRRbW6hwocoBL/afkFsDKEjvLTeMWS8V/B5uJsIJJ7FHLRNNOqO/2e6ZwEY/Zbudqk3LIBuiv7B7jKVsHZ/Xm6Xo3oVvlPGLotmkflu/sh2DU+r/kaKnaFyNTx6hEdTk3J55bSV24q0icfcXDuVvQUIAwQXMjy+7I/+J1SH5ZzengnFe4NMifmxOUc8W0GAhJCudADf+dQpu37dFbEDq69TRtpQpWfajHmz8MyCdDqMlRozHaUhKJF4ia0UjQ/XwZFaSxVmrqHFZtYyLkXQO6m2/82LLSA6GXR69g3gMH0MF8Y2q5lv2YVY0sUk8efWwpVUkl3b9/DWM94nFGMLtkiy1vOzZBC9zVb7LPdnAz2N5LDWQRoTzO0VuI7rLOMv9ezQTApq5YwM+JhMLlyJRS59cFCexQfG/nyRIczMnn41tFQgq4jRKCdtLrQ0H8dcDTcA0wWT3O5jdPA72mnobd1Gi8OBImHpQk9nXPMF9hyh9dPRVQfqJ5jEZp8fXDGQPsAH1ht59b9uRRUC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(376002)(346002)(366004)(66476007)(83380400001)(8936002)(186003)(66946007)(16526019)(8676002)(956004)(36756003)(38100700002)(66556008)(4326008)(2616005)(6512007)(478600001)(52116002)(26005)(86362001)(6486002)(6916009)(1076003)(2906002)(6506007)(5660300002)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?whX0hLFLMbbw3TzXa4uCrYwwg+Z0hsH+VSN8p7zmue9vu3c1DOkjM+rlAtGR?=
 =?us-ascii?Q?VIPDbN00AAss822ZSGarDKnCrh7hK86mnsJb/TdQ53lBYfDcklBdDgoGDlRD?=
 =?us-ascii?Q?tYeZUnpo30TLM3lLq9zgSiiGsYgtVj9B6Tohwa3clA9CxJY5vPY1ohU0kdpH?=
 =?us-ascii?Q?nWYpYidTyG9mf8KuqPH3JvPUC5Pd5ncnb6WInSTStHYslQbsDTeX1k29PYCj?=
 =?us-ascii?Q?ZumgFINzmTDu5Ko2djVKhfQKAJoKwSW2MsVcNgEcdaCtyvbyyPHLHdTqggkn?=
 =?us-ascii?Q?WOG3Aw3joGECZX7dED5BfPsRZ557FqSOoNFBbWFC8rg5flMw5HeeTC+dHkbz?=
 =?us-ascii?Q?iIwP7rvhalvQWV6HDC7UcorJ3Z5m9VzI1h2vYOeJScmA3jZJ3G+1Nw93GTQe?=
 =?us-ascii?Q?OouTJWrMvWGkCa0HRifyIW4orl+4aZVEAQO4hWl7zgv9gtANroya7wPyuVs+?=
 =?us-ascii?Q?Gcgjtj0BWTmRG3XqAsO6TkRRi+Rj7jNCMriAuXrT/zzOwjXnyebS0PzKuifj?=
 =?us-ascii?Q?WEQjKm6l2IxsnxrbOcfy+IZe+1eqp9uPAcR8XWYZxFDrkTCSyyCFDofntsqP?=
 =?us-ascii?Q?a9bgA9auGO4R8F7ZPQKzEA1cwXFVcMQ/EtQ+wo5GrrVDO0fniqNqb2tJA0gu?=
 =?us-ascii?Q?jcZ1HOjLW43UOboYzNv4pFpT99hO92wKr/ImXmQRxRXMbAZm74s9xQA+w5ty?=
 =?us-ascii?Q?1n/4UvZZTWBzs3jZ6yI+vSyIxEVhHSyZk7rCfY/zluoHkKEAIKl6KyWlFB9I?=
 =?us-ascii?Q?WMhmGRmPMqOd/l0U0iee3wcD8qZOxrCkbXPKTUE6WGkn59MiJVHNX1qvKF77?=
 =?us-ascii?Q?ZdG/CH1JbpqsoeLlGs24CenoQmNMLJOQmx9xkK0tr0l9R0WADB8iL5A0+OTJ?=
 =?us-ascii?Q?svJgxvLQWMxnN2ZkfmidHYxIs14Gtv5uuspg0Doh6lchDFyAO3v1Yh0RJjlJ?=
 =?us-ascii?Q?2B7/Z+zccsv0Ph2l5gMag8A1p2QrclXuycRWIu0EYvF5AzfoJ3qbRDbzxTMR?=
 =?us-ascii?Q?rLzyCqy+fJ1bYdPo3QF+4ZoBvoVvgY8uhTNMdRgixNr1kLvnpp0T3xCqn1cf?=
 =?us-ascii?Q?gfR4erZKfxRGJrwHbALtUsni3h8JKYOIZ1UlyGKKXPTXhybWAr/iJLhz/shJ?=
 =?us-ascii?Q?uu/XihLgodh3Ov0RYXcMQBE6+MQpxCnjS+3aYk7+QNUhl05urG7Y2r4zwmn3?=
 =?us-ascii?Q?MkNNe0RmeFni6E40KTuL1KtBh1bP6Vgf6bFoJktVRiGNrvSAnL4BXUBGQkm7?=
 =?us-ascii?Q?ZIY1/Y0ED+am+pwNRXM2Ex3Yh4JdiDpMxE3mMOkrFL+fDhEDCJkgVO26eRFx?=
 =?us-ascii?Q?ueoES1kR69211LAxo8upSdU4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c07587-962a-48fd-fcc6-08d90a58f4fa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:19:03.4678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88KYEw0ggAPqP94FyCU26Ed1tcsUdKgT8UDMCISVB015DwdoTZvKV8VByrIRI+O1EccNIA2CRmfJ80+pFDGX10wcAkQ7gs/pZ1gA2rDcIC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2419
Received-SPF: pass client-ip=40.107.8.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Now, bdrv_node_check_perm() is called only with fresh cumulative
permissions, so its actually "refresh_perm".

Move permission calculation to the function. Also, drop unreachable
error message and rewrite the remaining one to be more generic (as now
we don't know which node is added and which was already here).

Add also Virtuozzo copyright, as big work is done at this point.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                | 38 +++++++++++---------------------------
 tests/qemu-iotests/245 |  2 +-
 2 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/block.c b/block.c
index df8fa6003c..874c22c43e 100644
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
@@ -2270,22 +2271,18 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
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
@@ -2294,15 +2291,8 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
@@ -2358,7 +2348,6 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
                                    Transaction *tran, Error **errp)
 {
     int ret;
-    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriverState *bs;
 
     for ( ; list; list = list->next) {
@@ -2368,12 +2357,7 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
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


