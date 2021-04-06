Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72F35588C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:54:12 +0200 (CEST)
Received: from localhost ([::1]:52332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTo1r-0000lD-B0
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lTnzg-0007su-Cq; Tue, 06 Apr 2021 11:51:56 -0400
Received: from mail-eopbgr150125.outbound.protection.outlook.com
 ([40.107.15.125]:48587 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lTnzd-0003MG-Mi; Tue, 06 Apr 2021 11:51:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXJaTZUajui2Au5kXSQ7thk6894Ko15v2FNhPUWLE2yXFj4jx5inFsRUk/rMLZ3rw0VkAghEbFBq/yWmSS14Qxw64qsFSPGqlzrjGAe48cQVmF4aFDLr7wCQYi7D60AW590t88jtyaEh1j4tprShX2bX0ZZrPd2ALJLrO/HNsebpmCR82V6SbPaN0j8cOGqo/0HAYKOWx8jel0UtuUR8Z81lmIXM+/lUFj4gTiUQZeVvz/unPWZC6QT17zt8G4ZcNhyEXL+Fbua8mrcWZ8D8ZCMQwzR/dRHZQiGd0+zJ2wbgS/JI7rIGoL8hf2QFf7ITMbmxUn2xSfhUdtKD9swLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1JWoyRsxpTCoMV+Peb02hC5oiS5imX2pWI906RZjZU=;
 b=DdrPmISIGqNTiO7e+VBsyTWkLYhDagnSxIO8EEQTW0AygnL7c0aZFoR+ERuzYso+7MSshNCCl/sJeNRBC7CkUO1lCYWwRcD3Hjx4RG+Q3y+opEPYkTqUOHDaYXGEh5cOEzVPkPaPh7kF4SyA5gZ0iVxchsj2MqOvD/SqAP4Oeq48xAboH6qBqPtKSOkyMCL62pynbwfbem5Hf1Up99exuodk8q31sU5TJbc4wee40tkvPxMmSlf3uJqxZ5lzbsIhqbnDi/2IuscU8NFdXSeyA38CVFzCod6syuwM+h6n8PLoRKX1+ETyDhJTIuYVXOHNgDuXY9jmvGYgkbNaQu913g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1JWoyRsxpTCoMV+Peb02hC5oiS5imX2pWI906RZjZU=;
 b=VKHN5R0iYx+V/Wa6gfnfqaoXNqZtjThoTX9L6m/+Nr30aNhjSu5pfB3qmjlwb1zirZcW6kWX4dp/z4D2/dvy6NNPz/PcWWOjGBlEaj2VeaNYqhWsG2LINp6PephlwP2A7ige5hcDlsSrAbGMfwBuNu646mRVPkCbp2TMdiJcrOU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6437.eurprd08.prod.outlook.com (2603:10a6:20b:33b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Tue, 6 Apr
 2021 15:51:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 15:51:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru
Subject: [PATCH for-6.0] block/nbd: fix possible use after free of
 s->connect_thread
Date: Tue,  6 Apr 2021 18:51:14 +0300
Message-Id: <20210406155114.1057355-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1P189CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::24)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1P189CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 15:51:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2d91e41-197b-43e4-a5f3-08d8f913e14e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6437:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB64373909B773B6A2485A8717C1769@AS8PR08MB6437.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uWmgr+Qa7YaKe/7Q+U3kgxppou2/qrYdyRf3LxddLpBlL+wUc4oTa09iVN4tTN9WQIQRr/p+QUWyDeMG1kj3F0xeo8KhIO4oyj0GJOQL4Bzr1SkJMNUvpQvrnUUyv7fK5ewSWgHUMJ9s3yX0ZIaPjlqKa0+NBaAWIK8DeNd40Nf675PVDjUpn3WG614cu4glrOpiqGyK40syudC5pRXfjVhTs2RrSWUZ08Rl9dxPmIYzvIcbzhMFonysriS0QaorlijgLS6vg8Qp2598zE5eZP/qkfZyj08AwauyTXiWYlaP1cIs9am2wcoeMUJArmKKaAJVfNLPoCE19ijegO2Xod32GhNg6Bqe0B1yj8dz19OrVWnCE7hu5gq3cAfBlhFPBuyJq7aYDTQDQ+3taV0QjWCfIHEvQgFX3lkoftvblIRxWhSnU3U67Dl3eeYsMMr/IRbXH5yAIOwFWA844ZBBKR/kWFxD1lpyv0y5Dkqd8wInbEbxyd09I3yy6U8S28jZ9G1328UOgiXpQiBCLEH/rb9Nmz/qCgItQizFoa4I8EbrCVqpAhFUVCH3HQoejSS9TwUSC7e+0qmY7JBLc71zY7y0rBLjRUav79Yt0XTO9svvRooz07zHJpFGVS77G7X+IFimBw6rj4jdCxXrSnhxDT65WF1DHk6AHj9lUFSuK5ksL9tsaS3gp71edplj2J9eiN2b/SWUn1JeVmWW5S9A39VxCyuDfwvkBAPDaG1aUQU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39840400004)(346002)(366004)(136003)(8936002)(6506007)(2906002)(16526019)(83380400001)(6512007)(38350700001)(38100700001)(86362001)(6916009)(5660300002)(69590400012)(26005)(4326008)(956004)(66556008)(66476007)(66946007)(2616005)(8676002)(6486002)(6666004)(186003)(1076003)(316002)(36756003)(52116002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qWmo6AM67pqw4Rh2wDJkyiSwK7oDajMI9Py9n/gYmTpzxw+xplCQY6AU9Fg8?=
 =?us-ascii?Q?nlIWyvAtJ5naUSeVp1KqIJwTjmxvC/Jpc47eHD9lGVQc9p1gXf0cq6D1Oj3g?=
 =?us-ascii?Q?EQdORfqqHGftaP7jt/Zgua1J3R0tVI1oVO49PN+qRV/OIx8ca3hHAJ4z/hvH?=
 =?us-ascii?Q?dRKfjon1EQE/ag0UdK/kQnE+f6OoDzbHmWSW52YApVCWoA2fVKcdFSQPzCBT?=
 =?us-ascii?Q?F/bJNLBqX5YoqnQWAYRL8cq8+0sty1IFTMoKwDNg749kEb0jqlRbqZvs3Mef?=
 =?us-ascii?Q?sgNNrqzpTKqfK94yNvUc0qaxi+Idd9oqDggI4hDpek7hoCezlqIyvgfl4waB?=
 =?us-ascii?Q?fDIZvTBd2zPDcYATI6hd/TLj2TAS6BecWTscMnLORLHZmEdXwXP3yp0+7Tk7?=
 =?us-ascii?Q?M4McgE9ArjXuMqgWXHVrV3Ht+mDLYwu1xNPAGNrkn2IP77Shvid4SJjUmJON?=
 =?us-ascii?Q?9htMvISD2QycQd+xl1J9zcQljlga/C8ZjcK4hKJVu9DYKy+FuTCBd8096I1Y?=
 =?us-ascii?Q?+rWTz6Fka85+qetbJ6sz16MTtm6RiVe98PSGPJIe6Wwy4B53kbkrwd2xH1yz?=
 =?us-ascii?Q?4GYB6KLpynleNUM2uzOoT0vmDBRbgdXehJ8p6p1Cr7OMg25PP2Q0GA7hcodp?=
 =?us-ascii?Q?bCDINp5ramc9O8cndl4R95SbyVFvrP7uGtl0c5dbqWyesPVnTbHmAqToQRE4?=
 =?us-ascii?Q?XrKjNd5WFcXSftSflFHsUb+UOHN5qptO1izYKIzQPYA6f/osyOvXEGGeKoE1?=
 =?us-ascii?Q?m+hpeN5ZG8RCwPtA9Sg7oj7v6H9hN8qxaxCSWfG7HeVvY/D3UAcEryM0NFA5?=
 =?us-ascii?Q?Hrdi4U66X6RYUGvbpPlBfKkyGpaGduIEgaTipVh32huSkp4KfhI+FMQRbWw2?=
 =?us-ascii?Q?aph3ckarJa5R7r63oa2Ef0bToMy5yWTpVov4cXIy7+RBBKnqBpFaLeN0TTZF?=
 =?us-ascii?Q?sUYnat6VzWOWFeoKPdx6otu9jrY42b+RNjgVISIVSmILzaPYK3WRy4ahXtin?=
 =?us-ascii?Q?qh2LbES+5hmiZkjLxTOpz9HwIU/GrOZoeGsRlB+AjJksUj213KLuHFopiVGd?=
 =?us-ascii?Q?GQuYH/8T+ahFfgj06idIqRnGUVPTwRT71s5J5AE5wfcfFPxC+fJSDX+mv1B7?=
 =?us-ascii?Q?IByn9u/OZKhv76kJ9afx3SmL2BgeHvWf3vx5MMmAgpYinhNi9Ovo/GVNY6d2?=
 =?us-ascii?Q?pmD3Rlw7tTk9PrE4/epH3ZqnZxkw5cPcaFsI+Uxyy7KOLBVErx+WVRmMCmku?=
 =?us-ascii?Q?vcgBWezWj/zi5C3vLIbrPFdtJBsNc39MO6E7stvl5Z9B6ZNSaSNXZNxmDNJa?=
 =?us-ascii?Q?2hgvQilusgg5zJwxsfn6uXoP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d91e41-197b-43e4-a5f3-08d8f913e14e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 15:51:45.5196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gk2duL1xGDakOtMwfFI4ktoJJzeeeAfJ9hWsalnUwIBeaLPsCYlPxbImjM/wjDVaApGpmhCx0VFr1KPo+IobMXbe6OYq/Rz4tmzqpq4CWJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6437
Received-SPF: pass client-ip=40.107.15.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

If on nbd_close() we detach the thread (in
nbd_co_establish_connection_cancel() thr->state becomes
CONNECT_THREAD_RUNNING_DETACHED), after that point we should not use
s->connect_thread (which is set to NULL), as running thread may free it
at any time.

Still nbd_co_establish_connection() does exactly this: it saves
s->connect_thread to local variable (just for better code style) and
use it even after yield point, when thread may be already detached.

Fix that. Also check thr to be non-NULL on
nbd_co_establish_connection() start for safety.

After this patch "case CONNECT_THREAD_RUNNING_DETACHED" becomes
impossible in the second switch in nbd_co_establish_connection().
Still, don't add extra abort() just before the release. If it somehow
possible to reach this "case:" it won't hurt. Anyway, good refactoring
of all this reconnect mess will come soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi all! I faced a crash, just running 277 iotest in a loop. I can't
reproduce it on master, it reproduces only on my branch with nbd
reconnect refactorings.

Still, it seems very possible that it may crash under some conditions.
So I propose this patch for 6.0. It's written so that it's obvious that
it will not hurt:

 pre-patch, on first hunk we'll just crash if thr is NULL,
 on second hunk it's safe to return -1, and using thr when
 s->connect_thread is already zeroed is obviously wrong.

 block/nbd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index c26dc5a54f..1d4668d42d 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -443,6 +443,11 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
 
+    if (!thr) {
+        /* detached */
+        return -1;
+    }
+
     qemu_mutex_lock(&thr->mutex);
 
     switch (thr->state) {
@@ -486,6 +491,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     s->wait_connect = true;
     qemu_coroutine_yield();
 
+    if (!s->connect_thread) {
+        /* detached */
+        return -1;
+    }
+    assert(thr == s->connect_thread);
+
     qemu_mutex_lock(&thr->mutex);
 
     switch (thr->state) {
-- 
2.29.2


