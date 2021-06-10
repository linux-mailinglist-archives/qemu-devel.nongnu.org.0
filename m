Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641973A2A86
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:42:52 +0200 (CEST)
Received: from localhost ([::1]:38010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJ5H-0007oh-AO
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpy-0003rD-4A; Thu, 10 Jun 2021 07:27:03 -0400
Received: from mail-eopbgr40097.outbound.protection.outlook.com
 ([40.107.4.97]:58455 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpu-0004QC-Nj; Thu, 10 Jun 2021 07:27:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBtU9xDNDOC95Lrs8vPYcuYL/XX9ujhQTEiy4JEdw3DOuuzad9y7enObOE1+VfSxMhyM1zfAkUEusAu5yP90/6QIdD5wiLueU3kiSpi8JaV997CXSeh2hpNWOY09oHNqruIyinql9TTKD4ygRJaPW03Cb90VlpWZSeS0KqB5EGrCTfViLZkFTv08R+z63FrCAaF7tibdM14HtFYiy1S8Auc4ayeIPpzHuKmBuZyGxu/y5OtPVqbU9jZA6h8Qiwbf3HLJEUiCDBpAywD9M0MDIAJYn1kHgerrfMdAa0pQ2K98ew70yqEozkAa01Gs6ETONVmPOg/HMLN+6PAdABQE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y9zwZ4FG3jmKMdQhuvSmetg9/t2U2WeUmbUBzVXQuA=;
 b=FRp/4tCIagXD41dgaKCpwBzcUcXO92ENP1LE2qrUh4dkWvmilIBK0O5W6eKMw0+HUvq9jopUbZPoomR3KaO8iI7/wE3NeI73e4dWNo/UTSaaUyY1lJ8xhQEOFUF81bbiksAb1+UYNc8jjHeiQ2uSGR7tV5W4JwmHnqNaYQGHXd1HQTO8XtgZweQ+QBTp6Azi84tx5mnYohZvTwAAiiJoEpckaiOE8JSASZsTGqfP/gFYLsNi8p6tnnWw5ag4vKjWck7p5MMoeoENPNJl4cnkEWrrKAD+GDieqLO8pGvY5CAhVLmTy70nHKmP2gWWuIXrG1VgH5+1dbYQY4Ro+hB4Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y9zwZ4FG3jmKMdQhuvSmetg9/t2U2WeUmbUBzVXQuA=;
 b=h55R0aIuR6SAi1EJSAQpk3OgcCcSJkh8sQ3uWaa3i3cCBqhjqvP+AH0AuFwD3MFFJJNWKbeg1Vgo72llMUpbXGUivdPNMJ+51LeoXqR0opJRpdoh9dqNFD2y+Q0TonjnTSXlF+P/xRldSVKOALj0dSieGjzoja/r2LPc7jbts2A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 15/35] block/copy-before-write: bdrv_cbw_append(): replace
 child at last
Date: Thu, 10 Jun 2021 14:25:58 +0300
Message-Id: <20210610112618.127378-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9b8d7ad-95d0-4881-2a20-08d92c02a3a1
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33818D81DD872EA20221E2F2C1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sMMnoIghrVq6jRYpdPb6ZheNAwdzsGl81YsA5e2xKO42zM5nNK29UKwGSh5KAr5tgaaHQl29wUU+YWdKxEg5rIiwRAhwTdTpFAn7S3+T4zqwnwx0rgoUnPEGdIfzIL4lG71goVeUpwoApyT7xFSeyKUM8TrU5mfYKzfx5aVT4FNWDXxUyLGq/ZyqWtOd8RObCBhsLxB1pk923wxH5zLPpgOqn5n9JeWQ6rrUOSnO6ifcAzcgrxkkTPBUQK45LPnSbOwFvGcISxz+tfDQZWuTU+zWktKCKYwI8/Wx7KxV/YqbK/jCTxRWd2gPBE1eQcaIsmvuw9+aQ8eyvcwzxEX4oePlSGQzTPdU/PdNTM5+SS0sWbrKPpr6/np0WQ6OKuxagk8G4LAj56Q9uohlLo7ZpsOlppJWzmoblgimoP7sYGc2U3gQ1N+3ecHu4CFa+3UKWeR1joMcY/gh8eupwp89Y6Fmqp86IVM3f5wuN6Fxaowd5ZUvIgbXfv8qZ+wCwrsuu6DpJAvmeTqdgO2lYOjDiNaJ+WTaAUKciGt1/LtJAqD3SKJBaERa+JU4/6Yp3dPlkeywPiYFLUcg6lkhYkrhHTHURGB9HSFCJVflnzCxPPc0th21aShEVhOz2ijiS9FOrrDPGKSj2FKtqLZ27Z42taw3MU8Q6CtDpjgwoRLNCY/uyXTgnQSuFznmDDC/Yk3f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1jyEnm7wXs6IrJjA+EEe7rGnNvYm/8m6JEoSVtz7Nnov0mEJW3/YKY2RnnPA?=
 =?us-ascii?Q?1YnXup8EY+Z7hXYJ/hyd9XSyuygTpNOMl6XNUXw0Fq24MM4lJkWS78afMLXp?=
 =?us-ascii?Q?iVB8E5Xc6c2yxfXLwaaZuSMYgyTwENdfsjVhUTL+fqHsYemY29cyOWhvvcGm?=
 =?us-ascii?Q?TAI1ErHVJLErED59PF/2P33oj+iDk7E1HDR7U0Gav/jZWLN5T5AaB8SIl4Tq?=
 =?us-ascii?Q?CXT4cx7RE+BlTI2kZ0T0jiFHE7ZwL+26phR5DgI8fYzrS6TVGcQxJPXUMTWk?=
 =?us-ascii?Q?7ANb50cEV8SauM8NajMuCS88uh4FuuJd11la+dDfSSIa4dd07NbZGrljFGo1?=
 =?us-ascii?Q?offEcUNUHFssOiE5FicH+Fu/aDM1pTtgI0oebZgVUx9SBdxOvHfZ55J/ikA9?=
 =?us-ascii?Q?fMddFTxrkVU7q1PZ+om6gkdaqooL8Eb3Cdby5gBrfEarB68fP0v6Rk2+8Mza?=
 =?us-ascii?Q?gxMV08S9L09Lg+OauMP6VepNdbMRQTpk00UdS9Tf2/2LyKp1GCR1MlwUoiQ7?=
 =?us-ascii?Q?dAsmEqAi6El9m63yuji3yQ3VVqDtpFTg876MpHP8Ej9MFaNNhY0ZyZNp6O39?=
 =?us-ascii?Q?cvjnLwAiZXxXdF3wvjl4ypYFcE0XRKUWy4Sd5ttkfVy/qRiaJl/VyAb/1P3J?=
 =?us-ascii?Q?wH8E5HOw2a1SRFOoGDpwMskiiHlic/OuRnMxyfV0MPjM4S6/UMGfymMHMUZw?=
 =?us-ascii?Q?XqEQOjA/9zq0McDF8nXc5WXOSfH7Qqs7khAyt3i9HwTwzyXuGrjZamNttYDv?=
 =?us-ascii?Q?DiunlfU+uGIGn9rXPMZEgATyM9lF/gQ4qAbbIiN6Lfjhnkh1a7LsHn/dyG3Y?=
 =?us-ascii?Q?hoIw3fZw66lgA2XfbP4oqEaLS1gO1yr/mTDpqJrDS2SmoRvBL2sbQFy2oEjG?=
 =?us-ascii?Q?BoHNb9KkOw7KnPXVg/sir4x46s9/sCx1VRaqmBHGKu6q2KASN+3ZVl0Eqoq7?=
 =?us-ascii?Q?N8CGCiwt4tS4NG2gGYrv7CjOoeOZLrBV63m0je6el0iPCyLVQO2yPNxnPwaV?=
 =?us-ascii?Q?qIiiyIc4zodd6rLGocCuZMS9iWE6mR9KDUc2HcM3PsXAV5ZF10C0cT97Z58W?=
 =?us-ascii?Q?tut1bZYj+4ISlT7k6IlcGmRexy6CWtK+IjaE89AfPCPiY5hdzCAUG5IoUAiW?=
 =?us-ascii?Q?khIlv68yZFgss8xzoWTPKxos50/pTboZaappyp2jrsJBDN7i8ZhHdTQbTIeO?=
 =?us-ascii?Q?2onjmvK79LWKoKu/E6z2DGT3SLuVk57QKRkCgN2+jXT948DF9bnljIKaZeAA?=
 =?us-ascii?Q?1RUaq1kOOYXCu3/zUA5JBobo1UtzWHad52FytuX/TxFw/OwK6FtCwdHpDuv/?=
 =?us-ascii?Q?yzFxztwPm7Cukk/bmTIj4oqU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b8d7ad-95d0-4881-2a20-08d92c02a3a1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:49.7924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RA7xZSKAWN3Ofk/bvLBImRLIrAgrg5jkjPqZEIQMYQtN0juOReErtFV12YWFsFir3pjvn1Pai52ICea675YpvaUyyEI2UykwgG5CglMz+8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

Refactor the function to replace child at last. Thus we don't need to
revert it and code is simplified.

block-copy state initialization being done before replacing the child
doesn't need any drained section.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 7a6c15f141..adbbc64aa9 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -172,7 +172,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
-    bool appended = false;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -196,8 +195,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
         error_prepend(errp, "Cannot attach target child: ");
-        bdrv_unref(top);
-        return NULL;
+        goto fail;
     }
 
     bdrv_ref(source);
@@ -206,18 +204,8 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   errp);
     if (!top->file) {
         error_prepend(errp, "Cannot attach file child: ");
-        bdrv_unref(top);
-        return NULL;
-    }
-
-    bdrv_drained_begin(source);
-
-    ret = bdrv_replace_node(source, top, errp);
-    if (ret < 0) {
-        error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
-    appended = true;
 
     state->bcs = block_copy_state_new(top->file, state->target, false, compress,
                                       errp);
@@ -225,21 +213,22 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
     }
-    *bcs = state->bcs;
 
+    bdrv_drained_begin(source);
+    ret = bdrv_replace_node(source, top, errp);
     bdrv_drained_end(source);
+    if (ret < 0) {
+        error_prepend(errp, "Cannot append copy-before-write filter: ");
+        goto fail;
+    }
+
+    *bcs = state->bcs;
 
     return top;
 
 fail:
-    if (appended) {
-        bdrv_cbw_drop(top);
-    } else {
-        bdrv_unref(top);
-    }
-
-    bdrv_drained_end(source);
-
+    block_copy_state_free(state->bcs);
+    bdrv_unref(top);
     return NULL;
 }
 
-- 
2.29.2


