Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2354C3D0C71
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:30:17 +0200 (CEST)
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69UW-0004Tt-24
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697n-0007w3-KO; Wed, 21 Jul 2021 06:06:47 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:21413 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697l-00027t-Qz; Wed, 21 Jul 2021 06:06:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwKuacA3Elh177l1wWDrvLQYN+3uAJMygsPb7Eh8j1x5n6Qi4h4eiRcmlsMyCk+IfiwZDw8AfafP2haPZSfWoKz9l4KYIxyCdl4Nui8HpwtmbKBn3qdvlFoyz3eW3+9TNg1LEqLnFoVh62JQhwSXLTYZM161s/vXxIoOlgpecQJ2GxKpxDQw/qcgPoZJVvEOJiDVxBit+cngOGgZlsz9RDK2iioepLoGK/Lypa+o7JX/IttWRdwc7G4EZUcLSU3L+2fOen5L5tXeQKRps55liDB7PTta07AE52bMQWAe3Hs2Gsk86tVFol6gLkDAGzfo6n+eAXN3MlZSmjuHaa49AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VWPGr4lmt5yparOCsgTgvaAP77d+6ckGATrDpZzck4=;
 b=VY7cjUTtwWS4+F7eo7RELMrM0HHt4ULAsLFayiDO89WuirOChrTVgeAeb5SAwiRHf55L6Cbpx6rHIJKuWUFEZO8DxcncLmlkD1wD4zgaA9nOUN+mNMl25JYhCeqb/UszK2Hw4vTPZSH30af+LH7pT/QQKwfppkAorVWHHdUC/d46NeLXHk+HPiCVq+GkRKLt7BkXXSiJolKgY/Oh/NQo9k2p1d6eSRsb72S460jpKwgyhw9nxKpOxWr+yUNf5DluUrIxaiVfRvE/yQ9QKGvBGQ9eqDzAx9XCC2NciJ1xWCGUMffoREqUB8DK24nf9vdHAY5kg3h67zwOaT3i0DEzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VWPGr4lmt5yparOCsgTgvaAP77d+6ckGATrDpZzck4=;
 b=QFioRBNGvbVU7Lp1mEza3j9pVtjWvGNpo8Zj16Hk7sPQkgXM8+fi+6Z3SM1SoB6Gn/DKiMca3J5jPjYURPAG/+ZgasSGz1hj1YHI8xLbzJrC3r3HJSn16i85+97eEvYYEuHW/4GMbX9Bghfm5m7YQxrapOL+jBgZ1oU+QZ5o/do=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 20/33] block/block-copy: make setting progress optional
Date: Wed, 21 Jul 2021 13:05:42 +0300
Message-Id: <20210721100555.45594-21-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49420541-c2d9-4de5-13c6-08d94c2f3ab0
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494F58173F9F493B0CECA3DC1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WtD6EUFX/GhOnV0rAu2nEHsmkfmnL4mgGCHoWrsofx6+Npk0kE6v9YgDwna3zDCq8K+z9q3X+TSC6MySsOVTr2Ymr3DgSDnf+CGwAEBDrLjTNd4Zm6fxBHlwi0xo+g1gKOogqAVMwsE4aRrrZxPVkVALvp0sqbAkAfj/XVI2ZKdfUNpOmUrB9kP3XXghqc5LozIUejFH0Rdm/iAb0xiAS101oSNVgVRCRkK7+yyEeOSzp12pcGbyYgmXEkcvvaDG+06eukdYh7+XLfobcs8//V13gSYa1jz4ANwdKbzzfaR2BTl6UXsmv5T15R2HVt1FLFc1FtD8zedxpfHRenGWSxCLXwlhSFe+DwNU66eyV89bmjbQGxEvKcdlzWdiACZk/VscgLO37jECGqY/2ycBxITGRu6noscTYUpqxom1/RMsTkmTrtnwkJlHxB+GyjuW4e+VczqkyCiMzQVowiKaT7vxRSq5jnxTGY6bfbUv2i8/75PvyrjMMfrf5DQbUqVSF+E7rYecsi8grSCkyQLZSt3i547N4chHLdj7fWy+pyXeZgEstmm6HEtVujYnT01ELFBKvYS5zINx+fbaEaZnc0f9eMaW+jBNlvrrs97KWLMyAh1Quym4L+DEZYss0bnDbW7l2A2Pdkf0/Yik5O9Nh8E+r/Eg5JRs9C+790+U5JFn8V4d9PTbS20BRXORrmj9tlP6g+Y1z/zzl1D4uxHgaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(6666004)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r9G053NElrJnm1d4WBx0mApki9KYD7iDfxBFeyWVs5xEwd4gE+1/13jskjFs?=
 =?us-ascii?Q?H/jeK2ubKW1h015OcwuvnCfbN2cHh+oZVwnjB+UIWSgjdpYAWfnFVrKW3KBk?=
 =?us-ascii?Q?BZNgeW3KfL+FHgLBwi1roupa8QbfxxCV0XK0nqTjBKoz3kB+w/IKGgVzuXfm?=
 =?us-ascii?Q?OzEJs8R9VKCFAo5ge6qN705XjVLKaxDOCKYaXZ94ZjChRh2Pif/o/t6DugaS?=
 =?us-ascii?Q?8+5lGfMMUmAhrRk73GpZl31SwnSHeGQGpkdJIAjJYBS6iTB+sjH4R8UT5/O1?=
 =?us-ascii?Q?E3FzyTkoHM9SCo7cBMjHSIVjCese6KFWgiBkBg6twvLQWY0tRE3E1gPD+HW/?=
 =?us-ascii?Q?06tXPquBfeg193TBLXTm3mfchs8HDNtfjLRzcubzyJDdK9hQVy9NGnPwQXbv?=
 =?us-ascii?Q?8yZ6G8HaNrwPdrKIeH2k/hTIF2emMhfPepyaQG7GgFKpW4hVmn7RbZWZAJ7K?=
 =?us-ascii?Q?HIWijvn/5cflJ+wD0mzQzWrdGLDI7m5pI9veU5cUS8GXCVA0Qs6FZ7s5+xnh?=
 =?us-ascii?Q?psrmXR3aI6vrAnvfBCRJOekRMoGIIanaXjY5IE7jtazRLl0Nkjr1gCsfWxWN?=
 =?us-ascii?Q?85jZgHP6a7fK30owkpS/8e5Ez+//cA7FbLT3PJOx4MmiKfmuq5O2RQjohxlo?=
 =?us-ascii?Q?UBkf5Zy5sUu6AiTrZ+FtRXmiwm3b5XPW1M5lKYMK6hlMbJd9noopvDqwLSHn?=
 =?us-ascii?Q?3oqQSHDbLqnszmfCrDc8d3QNG11JFwagylT4ACnKlkc4sH+x7dBiOAyzU+a5?=
 =?us-ascii?Q?/QyocJew4+mDaMdTusRb0FuafU3QyxsMgcTyd4sg7dm729wzKvRW20gb27R5?=
 =?us-ascii?Q?fW0z2qzHe6fxct8X89d/D0HEwY9lRMMArM8rctTapRf6AZ0NhbadvfNeoX0P?=
 =?us-ascii?Q?0SlVFkR9c+ww3np+zdzQeaZa+LAH4AQj3bkRnL8VQDRB+Nr3TFVwQzLINPMt?=
 =?us-ascii?Q?HUTy32zqwetAuzAVI03G+OXCNHOhkAltHRUouoIe6HzQuI++hmLq1bt3jGni?=
 =?us-ascii?Q?RmOrt7E6T044KTuCZj3YVHD97r/HmQsRtthpauh5NJIfVN3bf13d/r/JQayL?=
 =?us-ascii?Q?V42W66LfpQVCj11ZFBWP6O9BAMTFEjLtFyGLEnXvgDN0/4RehzUNdgvToFbl?=
 =?us-ascii?Q?5MRezyfoWwnuGvgNqOKlI7i1s1sd90Kc6h2VSKv7UWJuP0y6jfdjnJOP1lFD?=
 =?us-ascii?Q?qMuwjvF9fM31v287w/NeGmU61ac/JzLFbUI1CDm7Nf26YmMdxgDBPvmHnH0p?=
 =?us-ascii?Q?1eSJjWHW8HGYaG91QSYGsuGZ+DPyeVPFwKuXzR/t+jbHVy+r+ic6gpjBMkIj?=
 =?us-ascii?Q?CNFHSfcWBLc2wUMPaZ5DBkp3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49420541-c2d9-4de5-13c6-08d94c2f3ab0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:38.2612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIJX4OK47kSAC9nA8Gb3/U8pyi8ZtdJbiB/HcEyHQW+j3CSIAeHT9QeKrB6jkbSeRq5+xJSujZGmNGA42r1eWhFBvw4tplJ+STCyjBA95YY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.8.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Now block-copy will crash if user don't set progress meter by
block_copy_set_progress_meter(). copy-before-write filter will be used
in separate of backup job, and it doesn't want any progress meter (for
now). So, allow not setting it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/block-copy.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 40c4803033..020c8d7126 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -291,9 +291,11 @@ static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
         bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
     }
     QLIST_REMOVE(task, list);
-    progress_set_remaining(task->s->progress,
-                           bdrv_get_dirty_count(task->s->copy_bitmap) +
-                           task->s->in_flight_bytes);
+    if (task->s->progress) {
+        progress_set_remaining(task->s->progress,
+                               bdrv_get_dirty_count(task->s->copy_bitmap) +
+                               task->s->in_flight_bytes);
+    }
     qemu_co_queue_restart_all(&task->wait_queue);
 }
 
@@ -599,7 +601,7 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
                 t->call_state->ret = ret;
                 t->call_state->error_is_read = error_is_read;
             }
-        } else {
+        } else if (s->progress) {
             progress_work_done(s->progress, t->bytes);
         }
     }
@@ -705,9 +707,11 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
     if (!ret) {
         qemu_co_mutex_lock(&s->lock);
         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-        progress_set_remaining(s->progress,
-                               bdrv_get_dirty_count(s->copy_bitmap) +
-                               s->in_flight_bytes);
+        if (s->progress) {
+            progress_set_remaining(s->progress,
+                                   bdrv_get_dirty_count(s->copy_bitmap) +
+                                   s->in_flight_bytes);
+        }
         qemu_co_mutex_unlock(&s->lock);
     }
 
-- 
2.29.2


