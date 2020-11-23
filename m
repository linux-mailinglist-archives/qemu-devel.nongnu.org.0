Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86572C1698
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:38:20 +0100 (CET)
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIbL-00020L-MX
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICz-0004Ad-Uq; Mon, 23 Nov 2020 15:13:09 -0500
Received: from mail-am6eur05on2111.outbound.protection.outlook.com
 ([40.107.22.111]:23809 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICx-0007Ry-5q; Mon, 23 Nov 2020 15:13:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAeuxAGtVWH8tnO1E1UjULUAufgK/AQYJtc8d3TiI0dlFCsd9l7GBA+BRKAHMa1qXroEuqEsJGEwOmoeLmFLeOYLlt1tvgei/LsZ0x1NDHIszBgN91th7HPfWHyF2nCDdrgz6co6PAF5UoMsp3qDKgjMNLS6imr6KCXRC6PazKTX2jbUHZlgNotyETCjTdo5j/cIb4DJxuXrjwzoOCdAPGXSe1nbXm7EM1uTMmWDF19BD/dSheFF3Crju0NbX5KAPXU86JXe5hwwOWVNQMWWXDOjB74Qb3we6hyjsnvSoE2WK5JD4Ik51rTn6DwsX7uqwg6ckdbgFbh81yfm98OpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E39AdESKaVJgCcNKxM07XQTAAzrGJOqgSHyxU2eTy28=;
 b=cxTxgpfYmhgIljYpjbRIzRqztcmpSDKoF6/a4h/OvLT5njDh5lIHZbLfCuMKXqfsnmpmA/eiT4sLDYQGUAvEcVucBTA9h+dbMNgRetJrW4x9Ia9oLkMJ9Xu6snNM9lBjUXlRiWNSklRBHQmwVP01KY18US4WUDXt4Tj6RdGjCiCYptF6gmuf5Bva1xys96P5ZX/jJbHDnV+w9s+WM+ODL5LkHhR1bjfrgLexJ5eOxGNGiE0AA4EBQKQ+//OnW4VTYYbFLZZB0BamA2mmTRSNIlnkJ7foT9Wiz11ZE4mjwfVVOezeGb3rdzg4HoGB5y94CAmVvHdg2Z2kNWscwTG4wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E39AdESKaVJgCcNKxM07XQTAAzrGJOqgSHyxU2eTy28=;
 b=l26LnOFl6TnSK5uGPYOBTH8kIUrh7nxPC6HrsuXJkJ6kryTR1HbGoVRpofVuLQ18AnDt87NPEYRHuDfhKuTfzqaLxTHa5YjqNVI3XeVW3LNhlkbgziRh4i3iN2OOLnnRhBZUHo16NQuSob4e2iRsnqJDDCdinaURjsFsvzETxds=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:12:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:12:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 05/21] block: refactor bdrv_child* permission functions
Date: Mon, 23 Nov 2020 23:12:17 +0300
Message-Id: <20201123201233.9534-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:12:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3922d055-88ca-4037-6c91-08d88fec29e6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4690D9D50378C79127A04C49C1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w1MS8TgDwUhjwhM4W2mJUUFh5w8rlsHIGOEuvDpS1GgfG6EF9RqiqhfQagnQup/EjYZJtm+7Hcs95FCJQKPH2kpjuXqsZZkqeB9lfhvU25bV0SBtGmN8lUTE+tSIB82Czi2KUCnRhuC0y5Rn41q/T2m1aiEehjBXJyRpFOEg/Mj35ot9LGjRtsVOw4/d6l1i8UqDp2UQ/1HX+IM0PlyZnmwyB8JY1V+wJ9S3+HimayB8V6XgN41HH1OnUzImrfo1EurYZ4gTCk0e1LRFNy//crkzmxVwURuhaRFqg2B/4h8Rf2VJ+UoX0Q2ols6Nm6TizLUORoYjaIdUA7zoeGD65Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 4Zo2OhT/LyA0T05TgC74jOFBLOUGC/Ymw/XeerrngJGsRIR1KZyxZYelo3lUwPTd15o/x9XTst92H/husV0wx2ptC5mRFs2VJFdSJ20VvIcpbW5LeQ9N/RWgUB5/UCVem7KEEeL3ca4OdR4eehtakPgddtI4sYKXV34lDmOfZO7EIuW97Dqt6t2yEKynUI21AJiwnaiqa7eZWCA+SGkAO54OSX6HSODKOtz49Yh5oaTdH+ARP7/onba1RI45IOUZo1pP5DTi8gnLAitiFRSOn39WUnBXMLGXvrKu66EqRBxdROjF4wJpmYUYKB3oZTIjN8HJRjZOqJdzmUNaNXMzJV18uoHlmuumbCIoM/LQjlar+rTSUnohgSWIBSNIDDeezk6bbJZACiVDWs+buZNZYDiCZCKKh/2UGlBITcN9s/A3rwWztgESA3+oAArn5rms1gp6Q6UiZpVnWaiwB5nDbmc4rFw0pQMf7vQGPZG9BV2YnebrYu5Xs+Atx3ELxxIuk5HbJ1rHw2CtyhLBHQP349m/6T+OPeCQxBtUlM7PKY8QPvj2neWqA4JyS5MEd2YPh54JVMUWrMF8nrhZaWycD3iqzIK3x96cq6k7E2DCR1IGk9jFMdZ/D7oTL4LTab3H8OPBrSpKcIHyPPKTQ9s3EG3WY1smarJxmiMDOl114yVsVMp+bOvzzNHnEuYEQ+ZLpZIx+WypaClpRIRZUY2Kcn1Nlj5TKYrO/ywDfVr1Mo1i+/4cDgZQBNfc55PR8JmJR9ttZ07MKOCDPwQ9qYgfJyPntRFhfV4jbyCy0mC3Q7NGXI9UEx5cU6Fa5wMP/0uoquRjaKKIb1sZ4BgXsWOo2hShUCn2c/D2Mf57WuufR8erQwfLHuFxl1ceKBBJ7i7/4D7F7yl1D7Gu/ZumavPCiQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3922d055-88ca-4037-6c91-08d88fec29e6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:12:55.3245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4c8YZr+KMhaco/YuBLks7xmULMAXAv00+W5vNEUhUWLUU02jzMIajKMzst2uNci/OCicQu88tLvZ8vUgi5idA6sfYkeIbBlNbxXl5M2tdKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Split out non-recursive parts, and refactor as block graph transaction
action.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 79 ++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 59 insertions(+), 20 deletions(-)

diff --git a/block.c b/block.c
index 0d0f065db4..e12acd5029 100644
--- a/block.c
+++ b/block.c
@@ -48,6 +48,7 @@
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
 #include "qemu/id.h"
+#include "qemu/transactions.h"
 #include "block/coroutines.h"
 
 #ifdef CONFIG_BSD
@@ -2011,6 +2012,61 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
     }
 }
 
+static void bdrv_child_set_perm_commit(void *opaque)
+{
+    BdrvChild *c = opaque;
+
+    c->has_backup_perm = false;
+}
+
+static void bdrv_child_set_perm_abort(void *opaque)
+{
+    BdrvChild *c = opaque;
+    /*
+     * We may have child->has_backup_perm unset at this point, as in case of
+     * _check_ stage of permission update failure we may _check_ not the whole
+     * subtree.  Still, _abort_ is called on the whole subtree anyway.
+     */
+    if (c->has_backup_perm) {
+        c->perm = c->backup_perm;
+        c->shared_perm = c->backup_shared_perm;
+        c->has_backup_perm = false;
+    }
+}
+
+static BdrvActionDrv bdrv_child_set_pem_drv = {
+    .abort = bdrv_child_set_perm_abort,
+    .commit = bdrv_child_set_perm_commit,
+};
+
+/*
+ * With tran=NULL needs to be followed by direct call to either
+ * bdrv_child_set_perm_commit() or bdrv_child_set_perm_abort().
+ *
+ * With non-NUll tran needs to be followed by tran_abort() or tran_commit()
+ * instead.
+ */
+static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
+                                     uint64_t shared, GSList **tran)
+{
+    if (!c->has_backup_perm) {
+        c->has_backup_perm = true;
+        c->backup_perm = c->perm;
+        c->backup_shared_perm = c->shared_perm;
+    }
+    /*
+     * Note: it's OK if c->has_backup_perm was already set, as we can find the
+     * same c twice during check_perm procedure
+     */
+
+    c->perm = perm;
+    c->shared_perm = shared;
+
+    if (tran) {
+        tran_prepend(tran, &bdrv_child_set_pem_drv, c);
+    }
+}
+
 /*
  * Check whether permissions on this node can be changed in a way that
  * @cumulative_perms and @cumulative_shared_perms are the new cumulative
@@ -2276,37 +2332,20 @@ static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
         return ret;
     }
 
-    if (!c->has_backup_perm) {
-        c->has_backup_perm = true;
-        c->backup_perm = c->perm;
-        c->backup_shared_perm = c->shared_perm;
-    }
-    /*
-     * Note: it's OK if c->has_backup_perm was already set, as we can find the
-     * same child twice during check_perm procedure
-     */
-
-    c->perm = perm;
-    c->shared_perm = shared;
+    bdrv_child_set_perm_safe(c, perm, shared, NULL);
 
     return 0;
 }
 
 static void bdrv_child_set_perm(BdrvChild *c)
 {
-    c->has_backup_perm = false;
-
+    bdrv_child_set_perm_commit(c);
     bdrv_set_perm(c->bs);
 }
 
 static void bdrv_child_abort_perm_update(BdrvChild *c)
 {
-    if (c->has_backup_perm) {
-        c->perm = c->backup_perm;
-        c->shared_perm = c->backup_shared_perm;
-        c->has_backup_perm = false;
-    }
-
+    bdrv_child_set_perm_abort(c);
     bdrv_abort_perm_update(c->bs);
 }
 
-- 
2.21.3


