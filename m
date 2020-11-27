Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794822C6858
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:00:30 +0100 (CET)
Received: from localhost ([::1]:51818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifEb-0001jj-I5
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif12-0001DV-6P; Fri, 27 Nov 2020 09:46:33 -0500
Received: from mail-eopbgr60102.outbound.protection.outlook.com
 ([40.107.6.102]:38277 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0x-0003GS-IO; Fri, 27 Nov 2020 09:46:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1haa2QcVXtOGwZLaLQJbWmSe+o39OnXhfztnEpX3eUcq/dEmG7uEFnjGM4bX8eba4/mMXseQZ08RGiEtIxilmAySjKpj8fn6RVrjdk22T4i3AC0L6BIEZTmX7FJV2gXC4BPKX30rdfYb3e/ZNrmMjW7pVRnZkF0QVl2CAJ9jVdq3LE4Pq4epyOKZIioopsN7nPXWyVFODPsXRaZLPH8Qawq+SDAKxeiC2jtSDDCpiky13kD4CJiKRBaXeTkU0XCWgCKpPpmzZbFQAJ/PgoMy2Xe51A21c9+E2CkPTmyiqm4cJoFJT4w6F2wIJKt11G4b2YHDFpkP9VipgPI81RU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=US44vB8xt3a2G4nMinisET1trchEoLVh4ULYPHbN4Fo=;
 b=dun4w7hX4cez6sxxfGpN6vRBMkHNeY58JoxP2Ip/1cay3CbVMZ4DeIwPuJK5HYqwUmoYeGnyZe7D/HUVdO8I288Otl7G+dUpgXJIqYwX8imDrqBDTQ8wMYxCJ1MvR8MNGgnVy7gvC+O84xfGaGq+t48xu/csPuAwi/Y/EE48oFjJZcsRcX6dZBCdhtFnWkmV2A0QLICJJNTp4DFiMYWRXvVnTVZcGYlDqAGOaNzsuuquf5iLy4W5GncLAMdpjBzBeRTAaF02BWM1m9kp8MYkml4ZdoskFDLVD7AzHGPTN7CzfRL4nJ9dWNIVZduCDR0fXzuWFMcZYGGCoLWVg2uOfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=US44vB8xt3a2G4nMinisET1trchEoLVh4ULYPHbN4Fo=;
 b=LHz1rXuhTNwPpWrILSDfB6k0Hkx/w8HKKtRU93/WurPZH0me3RqaOBpENMZYO1qYkJxKIGWZymvNCKkRzxjprmE21ZL0RCvkUcazSikVAJlUP9DcfWhcjtTfUE3IO1DN2L3x35m2EbInxwxZmyhBKAFZnVD7Viu0c9Ac0AVzqh4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 16/36] block: add bdrv_drv_set_perm transaction action
Date: Fri, 27 Nov 2020 17:45:02 +0300
Message-Id: <20201127144522.29991-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e0743f2-bc2b-4649-6d34-08d892e32182
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB507810DE7078E450D3F7F753C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4DM2Z6GrwKkxrEQvwOSQkhxjaK/Y9zEHwS4Llj+XTzXxtia+16KLxu1+mt184VznEQyItHg1yt3UBWgvXcWhxskHlVt4wdV0FJxqF5dy03F2Sjbp7IYgQja+SYWWtrlGPccTSGjNnXfcBh4CCnzKCOXZyImpkJv5kxJoCdAPnFX0VCk2Up/SCYMeK3yp5Or2l8NsvmAa/8hiR4HAjRyKcSpnugAvZviqSrb3WZ90sUcle4w/ULBTejCGpQMdSf2QXUKkjE4qnalLlZ+6DfqEw/LdIUG0cQmZmMoSU7WdllU4knKhDSPU6eGjZxMjCpyzeML0DDilmWvhFh8/82cYOigpaRoNFJptbEwcG+vqW8r1jY//PsY+VBa5iAMdfiMw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?R1Tc4De3oHSZkHTxlu/sRxlR5MW+UCRdqQt3AYRY4kTCeNehgeIJuARncctg?=
 =?us-ascii?Q?kxn/CW/QinNPCJFJ3a1tfe5LiXMVunXwc28xorhtHiiRUlspQzmxb3JnItdx?=
 =?us-ascii?Q?Uwf7j3smER+QImhM+mAJ1QDoPSXEh+vMx15mzQiH0jtJabPbFl+NB21Ihzvj?=
 =?us-ascii?Q?Jkt36UZ1aoDpv5hpyjOyQaxmUlnfbwDbSYfTseJgn5ZhsfRwkqpblrAcslC5?=
 =?us-ascii?Q?yaTNoSK1Z6k747IPmAkEm/F8ZiZj6Q+hA22ykUqw6VhbalpG/kCd/uMcS+F/?=
 =?us-ascii?Q?cV25nKFukXWnhL/R3mL5ddDqV2ACHavnHeDoIEjB0aAyhWQxvb/40CHz5QqC?=
 =?us-ascii?Q?TmR2tsZZ+UUQLsKvxJmIWM+5GC4kB27hkDzTuL12In33V4Iw7qQkQTvLKeQv?=
 =?us-ascii?Q?0K7Sc0XK2+2VnrsEe6OysMUdSEGO2CVmqHip5X8Xq8C1590UF49O2oFoyBsC?=
 =?us-ascii?Q?haRmJN2raq6pRWgCpEWgDBHGV+9LwraIM1sHRjoGRF0WdjqTeAjxQZ5INcnE?=
 =?us-ascii?Q?CN8C4u7qU0qtgpA6Y9YIUqgN6+qmaePYY+DVetB2DUuLSyLuH4ZkAP39uueX?=
 =?us-ascii?Q?MCo8HdlUWl4t3P1rgUQkZW6F1ZVjXFefioCfbialY4nWIv+Dt8/lY5f+SoMM?=
 =?us-ascii?Q?Wd7tkxcSsErjw2sBuV1A0pUligHHnRrY+SqefTpmgrptGIYyVnEmyQRbWd87?=
 =?us-ascii?Q?oREKfH5WcYjHg02HmMWrfXI0QEHYVVVZQqEdYIT5hH9hKqnidpMkvWIeklv+?=
 =?us-ascii?Q?Ej/3bgKWAjq0UZQHF8R3jobsQKk05bAmDix4f4vy4hQwsC9/AHCvCcEIMjKN?=
 =?us-ascii?Q?YToWzcI/OkIH+2aHeVO3VnTQr2wNV9LpFuGZrKT+C7hBqTRDB3UQqg8/x0Cl?=
 =?us-ascii?Q?vDa+PmPbB/VXIpUb6svP4S3sfyh94OGO98Vkp/Jb9hI7zaSc0Vbl4MQ1Tk2g?=
 =?us-ascii?Q?LALtF88yvReLw67zGMZ1Y0JcCnSw7CFQOoJTtN2DydHEby4o2xF9zaX+tKbN?=
 =?us-ascii?Q?CZOy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0743f2-bc2b-4649-6d34-08d892e32182
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:49.1995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4nprg2HyLEvwzB7RigxTMXhLPFUIq8PbpweBx5eYJXA6cq4hc07ja1xT4gyGUQRv5VA1XNdav/RaSL4FrVKVXv4qJ8BQX6Ruwn/OJmvN6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.6.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Refactor calling driver callbacks to a separate transaction action to
be used later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 70 ++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 16 deletions(-)

diff --git a/block.c b/block.c
index 81ccf51605..4a43a33401 100644
--- a/block.c
+++ b/block.c
@@ -2116,6 +2116,54 @@ static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
     }
 }
 
+static void bdrv_drv_set_perm_commit(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+    uint64_t cumulative_perms, cumulative_shared_perms;
+
+    if (bs->drv->bdrv_set_perm) {
+        bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                                 &cumulative_shared_perms);
+        bs->drv->bdrv_set_perm(bs, cumulative_perms, cumulative_shared_perms);
+    }
+}
+
+static void bdrv_drv_set_perm_abort(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    if (bs->drv->bdrv_abort_perm_update) {
+        bs->drv->bdrv_abort_perm_update(bs);
+    }
+}
+
+TransactionActionDrv bdrv_drv_set_perm_drv = {
+    .abort = bdrv_drv_set_perm_abort,
+    .commit = bdrv_drv_set_perm_commit,
+};
+
+static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
+                             uint64_t shared_perm, GSList **tran,
+                             Error **errp)
+{
+    if (!bs->drv) {
+        return 0;
+    }
+
+    if (bs->drv->bdrv_check_perm) {
+        int ret = bs->drv->bdrv_check_perm(bs, perm, shared_perm, errp);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    if (tran) {
+        tran_prepend(tran, &bdrv_drv_set_perm_drv, bs);
+    }
+
+    return 0;
+}
+
 /*
  * Check whether permissions on this node can be changed in a way that
  * @cumulative_perms and @cumulative_shared_perms are the new cumulative
@@ -2176,12 +2224,10 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         return 0;
     }
 
-    if (drv->bdrv_check_perm) {
-        ret = drv->bdrv_check_perm(bs, cumulative_perms,
-                                   cumulative_shared_perms, errp);
-        if (ret < 0) {
-            return ret;
-        }
+    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, NULL,
+                            errp);
+    if (ret < 0) {
+        return ret;
     }
 
     /* Drivers that never have children can omit .bdrv_child_perm() */
@@ -2249,9 +2295,7 @@ static void bdrv_node_abort_perm_update(BlockDriverState *bs)
         return;
     }
 
-    if (drv->bdrv_abort_perm_update) {
-        drv->bdrv_abort_perm_update(bs);
-    }
+    bdrv_drv_set_perm_abort(bs);
 
     QLIST_FOREACH(c, &bs->children, next) {
         bdrv_child_set_perm_abort(c);
@@ -2269,7 +2313,6 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
 
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
-    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
 
@@ -2277,12 +2320,7 @@ static void bdrv_node_set_perm(BlockDriverState *bs)
         return;
     }
 
-    bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
-
-    /* Update this node */
-    if (drv->bdrv_set_perm) {
-        drv->bdrv_set_perm(bs, cumulative_perms, cumulative_shared_perms);
-    }
+    bdrv_drv_set_perm_commit(bs);
 
     /* Drivers that never have children can omit .bdrv_child_perm() */
     if (!drv->bdrv_child_perm) {
-- 
2.21.3


