Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260D43824E9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:00:46 +0200 (CEST)
Received: from localhost ([::1]:41394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXF7-0004nf-4l
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0G-0003sm-4U; Mon, 17 May 2021 02:45:24 -0400
Received: from mail-eopbgr80092.outbound.protection.outlook.com
 ([40.107.8.92]:37028 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX06-0001yn-7e; Mon, 17 May 2021 02:45:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhmPPgi8jLliEUkIV/ign/Gkfxc1tkiAVqFRNu9azcdp3zJOBMcddW4UxYhSJduqNalHbYpJ+NQiF4szz5TlQmmT6pooQjsZ5BTtrvxQapnDAcBP96QrqD4NKPHZn+9rznpAYZFzWOALo+ls2GMVSIz3tL1GUDrPM3hUd17/K5cOUM2tus4hLTIUBgHUcpdfu9fX5hYJiOuIOrGMW0eexniLEsyGHb7guAXUr0ZwWReNpQcKhfLmYeE0tPPtzFFhG4kqb3Xm6+8B69Ml59XInSTpejnH21R+rJXwA141XFOHij6nujfezaYEqatRFjQay+iFLa3cVbyknZ411D1JjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiPY+Rd4RpK6iGr5H0/eE+1/QnUTpokTztSgMGdniGU=;
 b=BWQiam2UKCx/78XwmfZVBTTiJYyj15l6GZCtyfItgSDkQlESCcLNCrD8X6rH7hbb4ftxih/bcPmAKhMaLbcRxDgSDui443+WBB8gfcjp9gFPze3ylFR49PmG8+KTNK9kHwR4Y2I0b952qoUXW0fYWtet/zo45Z687GKNtL472+RbUgUeGfOeKZWnrm4GgMnQOQNLguvgRZJNGpRi0I8V9zUict3H+97VRsP4b/bTs+U71+DAAKDNwee8hptmS6MqtZdEdx5kY4jEFL9yPxS+cI3YFDctiUsf1bNwQfeXDOJ1GxMjnxqH3hKlpQcjIeTfNzOJqIwvmidC6pacfgWpqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiPY+Rd4RpK6iGr5H0/eE+1/QnUTpokTztSgMGdniGU=;
 b=JclQWcw6Q5PeFJARgPAAs1HWtdVoZJrwoAIDtElgVkeQrvihNlVn6e6KsQkyB/flafYwK0x/UptXkRhvyoCT++K7xtRjhkHiVgN3P9D/hFkIuqoYoysrR67c9Qb6/woWe1bSi1BBUSkkIVIBKyTWriArWccMy2P0UA6vdDkwlVo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 06:45:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:45:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 18/21] block/block-copy: make setting progress optional
Date: Mon, 17 May 2021 09:44:25 +0300
Message-Id: <20210517064428.16223-20-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:45:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bea55a7-8a71-441b-63a5-08d918ff50c4
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2033A2C4DC6CF481D2913871C12D9@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:76;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nsM7UjxAerigRScg3aBVCLhm8LVP1yimImBDrIbXHmqMU1aVWHzcSxgdXlAYIcRmBZ5wcK2lmn6gUSbPsiw8noTjVcE6dCFNIgr2ZbrpTlc27zvejG/RSChGgVsGHABQtGybosOAi+F37pL0mJsXQS3ztp7ZeDGc7sPzSjJU4a48OVKmmSnb/7wapYEto+isXvZyaf8MZM1vESIvqXkChdTlWNy4bymk5B4gSi1gsvMHhsl4/I3AUO/IEFgYr+SpU8yVlimNyYCkVNGIyUXmS7g/PrSlR4uhqLFsVJJoM+Sh2FUUEfNArvoZVThP530RVXKDS5ROvICrtuHC1DW93omixyjN8RqNIYot6/8LcspXWb1QuBskIRHn8QlUYGXfyDwx6BqCNDJxsweZTwRr/H4TuUOcwfQuny+sVEUadPCMUq6HYrzbbQrnSMGthtAYGQciHT9f5Du7spRzxzt/lRiAK9ONSR321OeLn0bo0S4U0NXMPqf+qKTuD9K6vyF7UFf7AfkORaebKg+FEvQP7DayQxaILHmheysGIyiV47EaHZCcEVr/qf2pUduaZJDmOIRBEqGdI0o3dk/jhR+h2Q7oWNrSacD11HLcETUqjgOVDm+hF6mw7U/bQLo7PMdQjY9oN6s+MB26bGZHs6tBtm9eMNRdJwZtFvWVzm5w49ZOgO1FC/D1i1rOnl9uuCr9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(107886003)(316002)(52116002)(38100700002)(38350700002)(36756003)(26005)(5660300002)(4326008)(1076003)(66556008)(6666004)(6512007)(7416002)(8676002)(16526019)(956004)(2616005)(6486002)(66476007)(6916009)(8936002)(66946007)(186003)(86362001)(83380400001)(6506007)(2906002)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lwAmvf/KXHsg39EqUOIfHyVQH5tJPe8KhcIda+pPHxebPavoQrbI4K6LCpT3?=
 =?us-ascii?Q?jS+t4FsQiO89Z0UE7uhnoQ1UCtprr37SmJ86eUHjGRnrYpnZZ3TuczCNKuf0?=
 =?us-ascii?Q?iRqmoMeD+SEyqTMswmbA2zt4XgmLM0s2BfK4eVtzRVIMEhl2BKJqyfQ07yRk?=
 =?us-ascii?Q?zpmIPngEH34TqG+aml3Z9jWXeqLsye/DFBLvNWU5wmr3FoGzGgzFYmHz3wUd?=
 =?us-ascii?Q?XRgznby4YtFi0v9NUJCUP3eO1nlH+LzBOrjhBtZDgeircEWfgvgamZ40A+df?=
 =?us-ascii?Q?la2q3dn8IDRtbB1+IZc3CjYGL1oXfq9INWbZliZt99g/39ymExwDU01CT676?=
 =?us-ascii?Q?pHlvxfa51+ehEb6HEWeknv73teC+k3WYw8YMgGcd58Y55gpPq6+r9SgDGaz+?=
 =?us-ascii?Q?RtqvvuJo1EVe1RzjI1xP3PlTqXj80Dsb545i7r+6yvs2AsEQNx68cLG8VvZE?=
 =?us-ascii?Q?SAD0lX4Dj96VNvh/QODzeYmOhllwFOFHut3qJbGkjDEIm4Wi3GQM+NauzqBl?=
 =?us-ascii?Q?SemKNLMEoGipLUFv8Nc/g95B8nvb9duOEatoOlGUXbANf0TN0LqCJVcfAlZZ?=
 =?us-ascii?Q?AM8ltE9V18Le/t6LLX7MaYAfCSLeuW66132B46rD0UuOLoyF/zpNDD2Vxd2Y?=
 =?us-ascii?Q?C4gC70hNZ2yGfPC0WRsrJwD5U5E9KmZd4TPt+qSH4XOqLYoYv7o/3sfGed7t?=
 =?us-ascii?Q?ePOvV2QDkHbk1sRztOyShseeHtBkGa5PlnYTodTMt+G8Nsglbygyfn/8jzgP?=
 =?us-ascii?Q?5f66ELkonNTMx/kZHOZ+u5lIYd0cIYsfAv1595L7lRzWvaIvO0DjXz5pdSVK?=
 =?us-ascii?Q?6KrRPDIE/yqEhsH42ZUF1a//lojn+IRPLyJuzaC8kLk1CK/Vcei2fWpmyJic?=
 =?us-ascii?Q?B5TW/+/rsd59tLoIhYVsaTvSbJW36yl8NfLz6LnKQfn0GBpBGc798DHEcDCa?=
 =?us-ascii?Q?Bnmw87uOqAAxuWeZoHlWkE+EC6iMyHnXjWESljFTqFia/8UR49ofl+7xKj3J?=
 =?us-ascii?Q?NcAMrC63dS0kGEn9Q/jHJazVc6b4a9s/UKJxNv4oDs55+fHm9lniOEdPB63h?=
 =?us-ascii?Q?XgUlJ0Ej5vUX8tUasYIh2GqmqsrHKsubeApLycCuj30eZFCn+pbwE8STaQuh?=
 =?us-ascii?Q?YMO+weUjcItEzobeQdAa9XuMIt4is6c/ZJ0U2rtuXKElMga5EpBL1YyTA3zL?=
 =?us-ascii?Q?QIhmyXU7ERtqhVsBPZuQ9kZmkVqXAIilpy68xVAvCrnmBmKMXWyAHHDwY/wj?=
 =?us-ascii?Q?pZMCAe4xh834i/JWRLaSD8dIOnRGc8F8i/xSTuXSbnqyODGnmNkF5GC9/1sA?=
 =?us-ascii?Q?fZ7NmMV6DmYkmznMUjPD89cZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bea55a7-8a71-441b-63a5-08d918ff50c4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:45:10.1764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCTvCVyp9dHpQQxUYSKnV5+Uefd1X88RbY9JGFSANC65/+hIfj0hp/5aBVVbpEkBPwb+Kpx8otWmZJBavEH/tX6mitDCrSW2YUhjKHwrlyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.8.92;
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

Now block-copy will crash if user don't set progress meter by
block_copy_set_progress_meter(). copy-before-write filter will be used
in separate of backup job, and it doesn't want any progress meter (for
now). So, allow not setting it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 4126f7e8cc..63ec5c41a2 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -506,7 +506,7 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     if (ret < 0 && !t->call_state->ret) {
         t->call_state->ret = ret;
         t->call_state->error_is_read = error_is_read;
-    } else {
+    } else if (t->s->progress) {
         progress_work_done(t->s->progress, t->bytes);
     }
     co_put_to_shres(t->s->mem, t->bytes);
@@ -610,9 +610,11 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
 
     if (!ret) {
         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-        progress_set_remaining(s->progress,
-                               bdrv_get_dirty_count(s->copy_bitmap) +
-                               s->in_flight_bytes);
+        if (s->progress) {
+            progress_set_remaining(s->progress,
+                                   bdrv_get_dirty_count(s->copy_bitmap) +
+                                   s->in_flight_bytes);
+        }
     }
 
     *count = bytes;
@@ -672,9 +674,11 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
         }
         if (s->skip_unallocated && !(ret & BDRV_BLOCK_ALLOCATED)) {
             block_copy_task_end(task, 0);
-            progress_set_remaining(s->progress,
-                                   bdrv_get_dirty_count(s->copy_bitmap) +
-                                   s->in_flight_bytes);
+            if (s->progress) {
+                progress_set_remaining(s->progress,
+                                       bdrv_get_dirty_count(s->copy_bitmap) +
+                                       s->in_flight_bytes);
+            }
             trace_block_copy_skip_range(s, task->offset, task->bytes);
             offset = task_end(task);
             bytes = end - offset;
-- 
2.29.2


