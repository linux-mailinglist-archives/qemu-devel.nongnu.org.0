Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6723D3F59FC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:45:00 +0200 (CEST)
Received: from localhost ([::1]:36538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS3H-0004sZ-9o
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyF-0002dO-4T; Tue, 24 Aug 2021 04:39:47 -0400
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:13121 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy9-0007US-8g; Tue, 24 Aug 2021 04:39:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsaZg3t+B398tfCi+/4p7ygIIgKv1m1Wcd0uoGXvMuFGyyIGGUWevQAi70wM+6ZR+un8xwmyfNfCeNzZ/1tTlulMpa/fPJgkW0BZo+DF4k9MbzCMVbaniVg7NDr5BVcK+FKp19mAU+FzUg0lDXkcwmE+u411xCk2JhErFbeIuJDBfcYIPglgfKMzO+yQCRUnme5KbFrJ7MZso3DtJGljil8IxAM6Jkw8dhF4hK0A7ZibIW2f6PJtapnvhs0w/9SejtZZ4iHt+w8MJSOVwDeVV+pYc6xBp0PdyeWCToq4SnwH8v5OWZs0YKwGN1QVft5ZZJxMiYlVi0edfxrR1rBpaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y9zwZ4FG3jmKMdQhuvSmetg9/t2U2WeUmbUBzVXQuA=;
 b=H7N1rdJBat2VC1z4tqDEhKipEHQ3+jp45JJdaiH6E3Tw+rtgyhFyP1LxZqg4eN2WeXec1zQMEmKef4Hu3jZQoxC6T8i7MsdzTIOyMyuUCp+/mnyoV+iR/+jypMQnFXQPVfAC0pKgIUwuEIBMb+B3fRPZLX0ad/GvJhsP9LJahCz51YchWlu/Sg0QDb5dyWvhd/MXxwxr9FYDbJ+fCocyIrvo0LYTMT75IB0BbBPjjIM+5oftv78tpUn/j5YVeLj1mVtHsOz0bp9DA0g+yqsXXTCKZoJimC6lCk2w5M4ucsH8TmdR42WCrbzihawEWH3sI0OYrLL+0SrjDkipqS2LBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y9zwZ4FG3jmKMdQhuvSmetg9/t2U2WeUmbUBzVXQuA=;
 b=BbrvYLHTgzHjp9CMYstjDFFNgO9TkDAXKnmgW+a86pNU1TQpMM0M3p69e1cYrShMetgm6M2DCPFAgPKitVE2Ljo/s5Dv66FIYUb48NlMAilhlFcY0QK6UtsqxuByaS28d+SA6t4zrF1HXBsHjlk3FTVsvY66obxVw5MV57nb6fM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 13/34] block/copy-before-write: bdrv_cbw_append(): replace
 child at last
Date: Tue, 24 Aug 2021 11:38:35 +0300
Message-Id: <20210824083856.17408-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d947d736-f8c4-4a10-b24e-08d966dab3b8
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5333EE26775059F523759212C1C59@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h0pS1bzV4dsXj66Xfg3jWRYXmY3swgL/4AvzVzOZ9+nP414AKfm13i+EwX1oLfC/BqeApJiJdM/1tBbb0b5s3FFvXUXgQbxAFeHdAR/MRCmD2Gu9kvt4nqbagEqPwYDJqmw08LVWjV7sbiSUxXH37mZwxXELillX7Vd92hK4MNHKuH5snWS4IDIcovecTMlk+qEM3nr6UqxogeMpoxwWqD3oEfSEG91xMUoWRKwUn4hTBswh8zfOtduigwG6Kk0FlUv8jw21fuZRU/gJDkGccWGe2Rxw7MaLQLrmVTJ7/q7DFx4nM0WFAiw+is3Qfd8pCRJU2E6crfONI8lW044qvrsm4HTZ0IPvbIkVePS3qyuqB7E6Hb3WTdVoTAI3VNJ2RlSOat+ayFPgYrwTN67muHn3OcXLHpcVsDeX6/TkyZeV4kWaQxbOGh3eq/ZdwF8MuYl4D5uxVnpHEVNJhHMLFe9wO6XxT33IdRz5Wgds4tlgnrxCpWugycbhRenzQNQewJEevw4zb+j3l7GFTQ1dPqF1ddhP4G6GA8ezn5gi678lrxCYWd+gCdBuNqkAAerAssI4BpRMRYfcb8O7IdlyOl+Hpz6QjFaSs1017tv1dqTxex3kdXE4vaW9jNslOKPostMYDGyjIhbnYzCZqFaAK2hVXA+0Tja32DOir4kmgQWe+eKSt/QE9OzCysW9e1OYhzIZQ9chswblt9VE/i+a/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(38100700002)(8676002)(4326008)(86362001)(52116002)(38350700002)(83380400001)(7416002)(8936002)(6916009)(5660300002)(478600001)(26005)(1076003)(6506007)(6512007)(186003)(2616005)(66556008)(36756003)(66476007)(66946007)(956004)(316002)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x3PzPwI1wQZ/1SrJ/+EWmtUOKTZckz454Ie7588rATQ/zzDbqR7ANM/IP5HO?=
 =?us-ascii?Q?S+HEVnYaf6gHwfx7tikiquQXKeOV6/EGZaZhpPWN6NpFg0JMpsfY/4piouXq?=
 =?us-ascii?Q?1j2cOGN1KjE8fkwPbRm54jr2Tx5LdsNDzhP2u7zsqfGK1EZNMp1tIokn40L8?=
 =?us-ascii?Q?Bx1f56IJ/mWcJ6CEya9WZouw8j+/Wn9Q59soR3UaBFGnZL4+gzAZyrWPpFzW?=
 =?us-ascii?Q?6GM66/60MsrReYXwlXlvbcy+ANYcorHeBFTXFqWDxr5qzsJau1Rchh4Jaibh?=
 =?us-ascii?Q?cOz7Ak5tPa3gf7ju5BxjchcXH9A4LcmDXEYhdIK1XenSZJIvcz5rg9W+nNUZ?=
 =?us-ascii?Q?aNOvNgvMsQuCciwbIxsRnsJvcIUr5hwYHaI/uuS3kYqnW16Svo3HNeYP99lq?=
 =?us-ascii?Q?/ttAQ+Xcv7Sdt5d94dPDLMiKeueDRD+J+oRAdC+OlyZqorekbUvgvWCJ1Ujr?=
 =?us-ascii?Q?JCN9ux5AzwKMJdcpWiux5i3+0lDRS42PVRE98f72cEQIatGyS2fM+eyek8eM?=
 =?us-ascii?Q?liHJd41kCbRgKKauaIpMSWA4p18iZLVp3ZMAbj/YRBJppJHiBRtm4MnrmJaM?=
 =?us-ascii?Q?tdWmaT9y/FF0FVMZJCXMTY7DrbzC2Q1PkTy53nt4Pkz0IM5nIC2lm3xerQdT?=
 =?us-ascii?Q?TjIjZqGHmy06U+yV1Ig/OqgmCPoepbDRlQiEv9GMOD/5V3vZjhmYmud4bBXw?=
 =?us-ascii?Q?Gc0Tykdm8ToxWC/61GTudXzMAwCdbnD9yKWe/RMRJc/DmAEkZ3h1d1lfzwx0?=
 =?us-ascii?Q?kozZd+E8Rlnu+RGzfUPmTWYI49aN+H59r8JHUua2Mqj7Xp0F+aIcNC+nkhZi?=
 =?us-ascii?Q?+c7nl0kDyyL2MVnSBfr9OyTgm0bORSRMsMkmfM8BcfhRzErUfLgP34oGRpMm?=
 =?us-ascii?Q?EemKxd4w6GpbA6vhLrSUPE7RUzG6qkvGssqbJRQcUvK/RFGGCa790NrIejyM?=
 =?us-ascii?Q?zrP0tp9IFc+mAKsX8YrJJncyMQcCxuz9kuePp1NxD3JG811o2T5/qZHWbnnB?=
 =?us-ascii?Q?hxep1nlf5zfHWlkyBVO9uizWpoT8Py07ym1VK8TPJBUienm9G40qFYyNY/J3?=
 =?us-ascii?Q?drul2ntoNAyj94NsaH1SqCf7hAEx1gxFd+nZ4Br2WK/5BwbwH86cSj0k3UZP?=
 =?us-ascii?Q?0kKa7Fq/nqw8UhUZ3LFLdjAaBCZDY8IEyt829TlVEWLe2EOdtZD1j1E+KRDA?=
 =?us-ascii?Q?oz4dwXKEL1v4lqrLTP61ZADhc5HS5dM+x1iA3l/HuX8lKMLF1fFBpgqLVk14?=
 =?us-ascii?Q?fY2pe2P75naElcGmLLBVViSuW3NME3S29eRqANer/7iYvmizgBGss+zPUeDM?=
 =?us-ascii?Q?uNsXhCaTgv5vVlVM8TBVfb/E?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d947d736-f8c4-4a10-b24e-08d966dab3b8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:35.5248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvb8/XkE70Y6mN0WdoEBk56k1bYfPi4D6z78rw3sktCMbJTU/nAWVPFXJoZGgR5jQFbzV1Gfqr+m1e+R6Zh0e017PWd1whUg1VqoDeSYJ48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.20.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


