Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244973F5A5E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:02:31 +0200 (CEST)
Received: from localhost ([::1]:43760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISKD-00064r-Mg
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyS-0003BL-3p; Tue, 24 Aug 2021 04:40:00 -0400
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:13121 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyP-0007US-VQ; Tue, 24 Aug 2021 04:39:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACF44KXw5GFw+5uE0Yv7juRzZsK4UHRi8Qf7EIvVrIw48LNYGoP6tZlI9r7opOFlNhv/0ub/5klqKfUxg1WvC5643oXR0eqd9/Qo72Jhtast5HlsQIG7cgwQ0/6U0nkVR0+I/T/7zukrylOupBGUzbvqZBMAvJceBgK/pW1KvKG1gGkR47U7YABb6YHek6K09HZAzcI2x2WVWLy5DkUOfKEKGdQVHzgrY5cdW1ZQya+1VcWYl2Ec8pZ2LUs89xNVw3RNOetD8pU0p6eFWNamCFCaLSNvJacyt+AFo4TE/2yGCe7vxPdUzP353IiaAawDda+tm0NlB3UTk5BVQBHuxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXigi/tQA/aROejty86++dzFmTjAgfO+1VHtp2LnyHY=;
 b=MKboW5GE6eFCBJGAXVW7xjNhATH51sIapcHx5hQO79RzTEtf5rZOzrI8wpSHYanEgRaXSkucZTcghoefjtRNc2fwJMZX1uZRaIMtCWjkI0c/JfOizKVCTcXl4QPAsIv9yHod8ysDZAQ/BZZJ1aGrcVfFp26YbpXxKVbQdYDbi82YdZB3iCE0GPNtMMMyzkVXEwcp8mjydgiAQj9ybwYZj519i9qgMANlNQkF9bv1GE2Hd5nVq3YMin9pjhUi7Rj2ENi+0v8ikWsuFvj1aPRuug/o+juin82k56slQUlYiVYJrIeaAhV9GFBW5zU2oAjGvMPODYXbVaCHx5rK79bTVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXigi/tQA/aROejty86++dzFmTjAgfO+1VHtp2LnyHY=;
 b=f3vWb+SSJp9Mw3Q2gS8nMFuVxMS3df4adAfS++M9wKSIz4zwrrymWt+7RfolWvWlcx6E/mEVH3+krrh4a5RD4mKYu2ZWzi7Zl28U1XgLrP6EBL2Y+d/MbUcvU0ONChph4p44NAbJ87lwP+kc+CnoznE4crkNb/oVdtqXTzkFWxE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 20/34] block/block-copy: make setting progress optional
Date: Tue, 24 Aug 2021 11:38:42 +0300
Message-Id: <20210824083856.17408-21-vsementsov@virtuozzo.com>
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
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dc94285-957f-49d3-2fca-08d966dab9aa
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB533367F9FC3A4F5086991B7DC1C59@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sRFlo6l9qZ1gThJc3hHTK7z8951Q6xScT6FYjlYhdrdCwrmF6+AinqYyeRrnrUssklE6deeres1Vjt2uCO377j4RorhLzMCLb5fSMK3bo17uGQ6MR512WMy5fviW/lP/L+p2OZ5/nDBUGiTVHXmgmPQCbxBmqz3JTmmbzA3ElxlELHTcw8wf/BTwrgmH9uonFIgEZg23jwq9fp64+erfEz0nxkk7imuG2hgSvUODY4HvhzYVRLJL87tX4yFB7C1/i2qvC8L4hiK0aBumHpsTx0iIRdwQYAv3sLUENyk5YS6dIojPvb3XFp/Mk9gqpVZHBUEbW6MxsNsOa6RF977Lsq9q4h4FWe5OZ/OncJ5b0iGumyHk0W4y+S60BY6SGTnHcyrS8UhXB5743S7LO5arcfl1TuIf/qlhp9BpmST7X2fuB7WAfDqsl+E2Xpk8rqXNLdO/6BXhzJy5INFPcULLW9BUKBoNO93TIHaS0B1hvYIl2E4P+slw3m6RnJDOjjM1X6jmgYQ0e0rhAewzjXHrdrhLp01O7gLMX8D/TtGvSExE0KbvL1lBJgEJ15GQySIZP8siwu7kGDWbBtFedonTJGy1j0FKUv2419M9TbagVhXAYq3X6n8WNLAJciWyKHxF2PwsHGbrmK4e5oegkAAlJuTQXm8YAtj2dTcPGYFlRd3HVU0NGc8HfaLTqZN5zFu52wsxqs/xufF+DCKdciaptg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(38100700002)(8676002)(4326008)(86362001)(52116002)(38350700002)(83380400001)(7416002)(8936002)(6916009)(5660300002)(478600001)(26005)(1076003)(6506007)(6512007)(186003)(2616005)(66556008)(36756003)(66476007)(66946007)(956004)(316002)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CmGY31Akye3P4Yq41O9D1azLis39aHOg+F0UgWCLSh83o295aF195BIN3FZy?=
 =?us-ascii?Q?7h+s4GRMiPDTr5yGXv90N3vbycBhuThVvz4kN7+by2pAuxrLbiykmKBVBiIy?=
 =?us-ascii?Q?rADRUY/UxaIsjaKRYlcQ6egn8rc19UYiPLFYUL9SE0XHMmxhWCjPUZDaPeMY?=
 =?us-ascii?Q?653WKK0lP/qHdhokWysnTHYjITwIiWTiM+D2gKlMndE0hniYAplFYnVmxCW0?=
 =?us-ascii?Q?51y+A/bkYSmfATgm+fzQzA4TRNvgw27hMOmJqIkOSB8ZAeHedACj41cEOdCd?=
 =?us-ascii?Q?ybCvxeD9r05SL1gSiTPvEWfNgJdBLvHYG0RX2wBiFmqhiilVriRC1fIac9XN?=
 =?us-ascii?Q?s4aUPg1xvl2+dlUEeFj417I/y9wGXN4r25bNfqUs4d45kb4AwJtJG2wM1FqI?=
 =?us-ascii?Q?JWTiz7DM1ai+A2ON40XOrauXThxduowafcI7PF2CRgfUxxHGTTOIBlNIRSUL?=
 =?us-ascii?Q?Gt4+OoBg3InElj1VynoITdmXzdhAphhJA20iHKUBuNDB2qG6MrfkybNQrqmJ?=
 =?us-ascii?Q?+9nS7rqPDMyabs5QZzM/KXWo69wzIGaHkjAiC5McDu++YDDHTo5m0QcvC7rm?=
 =?us-ascii?Q?mgm2cwa6BRkjJQ9nyayHwJFxqRcyoZwbLBm/uxp7Tt5n7bGBPi3+DPa9lg5d?=
 =?us-ascii?Q?hK5iiZDxfye9cSoleFPwlpmKjyGZqvOUbtQByNFtiDhjBSmo3+HZZ4t2OGVm?=
 =?us-ascii?Q?j1otQw7ZUTb/vM195r1pxBCqnnTji+gV6aXNhymm6/lJA7Wx0aGTTxMsP4CH?=
 =?us-ascii?Q?wb71ALCPqC8BGLKWoDNSNscIgb/NDn3a1TApgY/SsupqCx7GMNZOnjcmmbZf?=
 =?us-ascii?Q?TrnfDqXAwR1i3GPE1rARDeZ8GerZJ6W3j53XbspKrnRUJSAyPGqHY5m0tlfA?=
 =?us-ascii?Q?bTgt6FQiMaMvqZdiZP+yPD/j+idEzrUlf/4+w6HPVrhv7uIBCGeymtoVnZWo?=
 =?us-ascii?Q?rHIVUobRuRb8lhPJ1CDu/UULIx+VJu/bcjcCg9/bkTZJNvnCgJPLgyiWQglr?=
 =?us-ascii?Q?V/zdfzdEyCKh6HHQJ9Vpnf+b/S8BeHJ1uzNvMCFn11S5R9bsgoXlgHyBDjdV?=
 =?us-ascii?Q?6edleoSB4zTxFa0qKtqdOwp68ysvl7LFSjzr9XwEcjwX4k75v1/g1Pn2lFQi?=
 =?us-ascii?Q?PfHE9wTwLURmBH0XO3PCy8k8Izffud4+cLyl2fs1yrgg6qWy5hz6kZDmkiie?=
 =?us-ascii?Q?HoUKrsWRmgILJ/lShfO/5J+3N3D0HMjcY+dZ92l49WA5AOS7ICDuLvb/Yj+j?=
 =?us-ascii?Q?Hrz9Ak8N9UBiHCtnURe9Q5HyZKNnVLQsTFP0ep30IR7Mu8WGRTGREo9editp?=
 =?us-ascii?Q?Ht/NWI0+YlKt1NYABwotXLHo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc94285-957f-49d3-2fca-08d966dab9aa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:45.4891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9SO54zGbLp2/4IkH5aDl5/yanImJJ6NEGd3yzkDVkWIOKBmcWGUndNGbHL7WSiNoEaBPA8CFLNtL4i0LGIqmexEadbk7k4jTQTD5siKMDo=
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
index b0e0a38330..975f9986a4 100644
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
 
@@ -593,7 +595,7 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
                 t->call_state->ret = ret;
                 t->call_state->error_is_read = error_is_read;
             }
-        } else {
+        } else if (s->progress) {
             progress_work_done(s->progress, t->bytes);
         }
     }
@@ -699,9 +701,11 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
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


