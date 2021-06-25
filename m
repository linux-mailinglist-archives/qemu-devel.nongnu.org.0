Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A983B4426
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:11:41 +0200 (CEST)
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlcS-0002AZ-Fu
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlS0-0000uN-Du; Fri, 25 Jun 2021 09:00:58 -0400
Received: from mail-vi1eur05on2128.outbound.protection.outlook.com
 ([40.107.21.128]:11041 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRv-0006HJ-EC; Fri, 25 Jun 2021 09:00:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxeY1yrUG9gs852rp3eEGUZBpsvImGErx1FRzxIGDxuAuskhZnLU69hBi9PiKI7rj0hk2K1tdFpLu9cz+K3L65TfBHpXzDQvF42UlAgBvL6r41joASPwIroFEZo8HloKJ4mdxxiS5CKp3swuAgFdp9+BzxijXA+ps5yvN9qyGO1V7YMimT73q0IocV3vmGzj+GoK+aog41Dc6ZwjGyUO3m13SQzPzmlypvJwy+TSKh4//1aSAnTxMu7MciqfZ8nnbyDcz03hlUvx6bZwMx1+Sg/hotQM0DkUsRCeBmOF6zvVwEoRJtzIvQPSSYqGTmAfc3nObACIhE/QpIDiia8OpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkYn9crBhSRnh5jTex1jel3+18jnPEvrao3xXF+yg8I=;
 b=mIIUCwMVeYESmYhApTw9lpoSn2xcoX2n3bnrKjF3pEgOSO6sKVLGxp7Bov38XfceVzXO1p4XYPynjMaXZHts1YW4lkZYJqjUWun4RCd6vWGMGwg9OHc0dEdvnB+O3oO9vh8AJfyZzjD6BkL8RgIqGuKkYN3V/5lTtVM7evV9rBNtucZnb/Umh6uukEp+w4QAmnFS730Rc6cCjHzK7f9O1USx37Uo+7/ab+YuE8LeesItINzMk4d8OzMWrdhmRIgzVn+HCoZSAqsukOIM0fXdQ3VUfxVkZ3ANS2ukW4TXrIQpTd++k3PM4LB7fDAWVscf2x9cI+vsXMXaP+vWVvSvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkYn9crBhSRnh5jTex1jel3+18jnPEvrao3xXF+yg8I=;
 b=vDuYoCnkpmL0z45xBg1M1rBi7JBFoa0OnoJNE8q4CQvUimmTybaANF9IgfdDCtQvmUqtgHBUdrjaqs//iz9MrnKsykexqhInfp+Qf2j6JPc04WheP6RyaQoz73+fItWOV8Ds/Z11I+vPRX5Ft0ol4j5r4PwciFJnKKQJKZAtm/Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 13:00:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 13:00:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com, peter.maydell@linaro.org
Subject: [PULL 06/10] block-copy: small refactor in block_copy_task_entry and
 block_copy_common
Date: Fri, 25 Jun 2021 16:00:02 +0300
Message-Id: <20210625130006.276511-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210625130006.276511-1-vsementsov@virtuozzo.com>
References: <20210625130006.276511-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0202CA0024.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1PR0202CA0024.eurprd02.prod.outlook.com (2603:10a6:3:8c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:00:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bdfde4e-364b-48eb-4746-08d937d9351a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652CB59EBABA39C2F81B177C1069@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:20;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ETwjbZvlTCbRYxut8A5lp1hWjUZdqWU35Hcru/8exVZCXBIGf1s9fak4+624wk/WK0kle0IQp6UnEjfW5FF8CLZcZ2FKxwQd8f8ZZvVXXLBvJBmFF+Z3iYoKMAs9X53Zh0PN7u2a/h5NgFxsQVgAh4VNmOgnpiNi15kvc71B+Kb4ZeQcds0btP9kNzDMMGvQ7xKeHlIcMilPx1GwF8w04DzXPqnOVGXOS9sz7G0ss/D4j9dTyeHZAtvgdzxziwDThrYbUD+2LXIBHWJqSdNlO6AWz1qWejXEUxCbEbdOt5bIXgp9eKRO+hAwinpM87SKo2gfRIm0WmWOlsKdpiMwP6NFuyl/TAuHbCjtMFdVeke5Rpgh53ra37/TZjE6mFc6N/fOMQpBRI5fYDGA8t51oDEeoTVOuuwzhN5uPkeLAnBlSRsANEv+z9VD3224nQQ8SSFl++Y17Ht26lQVmJwIAY54LiPLPoepqjLitqQfWpGhqnjwidTi9p2j/RQdThlLGHf6kosraArnBj27gBvO8v1pHwPC7i+/XSS/UpkW3RRDmMQZhbs7RPMm5o7i7kX3txE3pr1sT7eNpw0WLU8uQIF0CLpLwZc8H4ra0h4ApqveB70cmzIbTU7NHr9T7PiMY9lkX0Ph5Bx0nGNAKv6ZzN2dXzlyTp2XBQvk3UChmeqX3Q45/L1eeykwzQI2robfRCljZqy1AI9DaKJYqNg31xtpPirVWcE1h4Fd87wBoTQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(396003)(136003)(366004)(376002)(38100700002)(38350700002)(52116002)(956004)(8676002)(66556008)(2616005)(66476007)(6666004)(2906002)(316002)(8936002)(66946007)(186003)(6506007)(16526019)(26005)(4326008)(478600001)(1076003)(6916009)(6486002)(5660300002)(6512007)(83380400001)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DnDewncP+u162K+OVBUWqvxSn2jZJj1yPReSshcH0uWD6JQ8PLySSYxgdkub?=
 =?us-ascii?Q?hRCV+D0dQWS4AJU5kjIYW6IJe8gycX6rKlBQGk8Y/9mEvwI6pW6XDOKXZ9Cl?=
 =?us-ascii?Q?DQ+ILIbeGdpAUAXHN/ncHaBEBa28f5QZxugfPbOLU6qh/MH39/3kA2mf+yfr?=
 =?us-ascii?Q?t3Pi/pt3Gntsd7rt1849E1ZHk3HLn2PWA324oScCDJeCdPL6TQZ58/Rlnw3D?=
 =?us-ascii?Q?tdxVO0LwJRFMRhuwTuOEgp2ic+XYonuyYmrVX0oSRSlez71X6oQ1iB9vlECk?=
 =?us-ascii?Q?i/vbF8KrLwr2btUtL/1Wx8dtbnQ7PSv7dmVU8yaW2TlQP5J3bicQFLaKR3sD?=
 =?us-ascii?Q?M9AIwXr7JJ7oYKXpSvUmHaWuXnqG1V83sOhpQhFClhc+44142CzcIRnmZkoh?=
 =?us-ascii?Q?3qmlnVfGSlD+MljU6hcXsw5TIUV1BU/oGKRpi6rWIZdX4aMAdNvHuLPMZc8z?=
 =?us-ascii?Q?51CRGj+j5073d5q96oaQsEbw3Iqu4cxAgd8+V+9jDnddIFKr/5ZBv45mssFy?=
 =?us-ascii?Q?diIZEgrmlysWM151vRcDrT25tyl1pbwgtcTTEv8aNs/G+OxnYdEXV4WsBHg4?=
 =?us-ascii?Q?WAviVdSwXiCbxYMgdOqzO7gLIiebW4LGeCcR/b32LtntTxUrTAsaP/Jy8nc3?=
 =?us-ascii?Q?FrhA5DCdq/5/z8LFYuU5u9J/9/+79ITWokqX+MQRUQc+Rc8yf8zYlxeagkm6?=
 =?us-ascii?Q?ntXLNfoRyCFcXEF3cBlIlUdNjF9ttoHFnsPMo21DcJm/9bMYPWok842L6GRs?=
 =?us-ascii?Q?hbgty0STozcT4Y+M30dqe2VuOtln/DqzFw0X+pmmMu6H+fqxSichz3musMqn?=
 =?us-ascii?Q?9Evb2/Iol2F1NiVIl/pFHSs4aBq7nkmYsvmda+vffzquKiQ0jUgm/0/1lVDN?=
 =?us-ascii?Q?trPOjLvGtUZ12hxJhx+XxYQwd1SlCqQKvLmh2xqItGFYvBI/zFLSgngZhJjz?=
 =?us-ascii?Q?yYfXcLTijzuFgxAs8Pua3rviuBfVTHZjfGVQ3HrJgqArVuOV/gcPYhet52m7?=
 =?us-ascii?Q?Tt64QHoW4g1dvuzX08s8SOW4V6Rg8QmcepLk7/bReoHaD6WVUJdkeCd0ag8a?=
 =?us-ascii?Q?iBpjxUaAfW1Ug/otpMk7Yo2K1SSeu58/9xw6xkO+jOQydaoa5chVEAfTSVU9?=
 =?us-ascii?Q?ktTfgMea/EDXw/VkcJVsBUCKaOUehyXz69/vO8JUzkEIX5GAtN4Zj4BKM0aT?=
 =?us-ascii?Q?AT1W/g1Ez61lqkpUhcsBVl5SPqya5XRoONK5+BUGtrACejkSkLf94zvk+5sC?=
 =?us-ascii?Q?PQNdQdB4xDOGx43Euj7t/78kf7jWDY5l7cQ/J8RBze5chPzbOTFTVAHYBHf0?=
 =?us-ascii?Q?Y9ZAWxjw6mhdJ3xkn3RHDYjX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdfde4e-364b-48eb-4746-08d937d9351a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:00:28.9106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4Mpz7thGvtifMB3sGEImMKi8mBR2k1a2/U7/BoJaeqr0y50gAQSrQLvttLI2KNgdJ4r/U5QrUkolrroa6xe6EhGGMVBxKTpzLoOoG4Hvwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.21.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Use a local variable instead of referencing BlockCopyState through a
BlockCopyCallState or BlockCopyTask every time.
This is in preparation for next patches.

No functional change intended.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210624072043.180494-2-eesposit@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 020f9846d8..a437978e35 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -452,14 +452,15 @@ static void block_copy_handle_copy_range_result(BlockCopyState *s,
 static coroutine_fn int block_copy_task_entry(AioTask *task)
 {
     BlockCopyTask *t = container_of(task, BlockCopyTask, task);
+    BlockCopyState *s = t->s;
     bool error_is_read = false;
     bool copy_range = t->copy_range;
     int ret;
 
-    ret = block_copy_do_copy(t->s, t->offset, t->bytes, t->zeroes,
+    ret = block_copy_do_copy(s, t->offset, t->bytes, t->zeroes,
                              &copy_range, &error_is_read);
     if (t->copy_range) {
-        block_copy_handle_copy_range_result(t->s, copy_range);
+        block_copy_handle_copy_range_result(s, copy_range);
     }
     if (ret < 0) {
         if (!t->call_state->ret) {
@@ -467,9 +468,9 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
             t->call_state->error_is_read = error_is_read;
         }
     } else {
-        progress_work_done(t->s->progress, t->bytes);
+        progress_work_done(s->progress, t->bytes);
     }
-    co_put_to_shres(t->s->mem, t->bytes);
+    co_put_to_shres(s->mem, t->bytes);
     block_copy_task_end(t, ret);
 
     return ret;
@@ -714,14 +715,15 @@ void block_copy_kick(BlockCopyCallState *call_state)
 static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 {
     int ret;
+    BlockCopyState *s = call_state->s;
 
-    QLIST_INSERT_HEAD(&call_state->s->calls, call_state, list);
+    QLIST_INSERT_HEAD(&s->calls, call_state, list);
 
     do {
         ret = block_copy_dirty_clusters(call_state);
 
         if (ret == 0 && !call_state->cancelled) {
-            ret = block_copy_wait_one(call_state->s, call_state->offset,
+            ret = block_copy_wait_one(s, call_state->offset,
                                       call_state->bytes);
         }
 
-- 
2.29.2


