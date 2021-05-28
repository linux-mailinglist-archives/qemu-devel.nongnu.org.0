Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C9D394412
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 16:19:43 +0200 (CEST)
Received: from localhost ([::1]:33384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmdKw-0002Ml-LX
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 10:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmdIE-0005Jw-PC; Fri, 28 May 2021 10:16:54 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:43062 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmdIB-0006WH-Tp; Fri, 28 May 2021 10:16:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbkBxjcBxNPNVwbW+jSN7YwHJPdHwIk2eqXVmfpbeYJSD/cxhZbhIzZw2pRMpOZo+fkFPTeS8fg1TmAnKxbxpwbKOfizSxMAStlQelzVriNjgFGuwmecFyp2XIR4ES0OMu502pAYMHCbHbOJyNtcZNgFDeE1E5e08j3Y7/QATknt6tKnIk45F16Zu+U3O3EPYWQdAtbcWneJYUTgypmP2OtAdQaQxKUqDb1c78yQVtC8MvRGqS6Zdb24To17aIjYNNn+PQyyx8Q+jlejjQ4dZ+WkvlaLjr4Eq9mWpUBrU7yxnPtv84kGKZza5kFZRjkJM5kx+0uQDx35KL7I07oDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYnXKS68d4SeBzXBRmrPeY/1AYKZQsgQQY8HcFnJD8M=;
 b=LpdIVEcJdZg8kuuYbFx4JRDMyPubzsX0cpH4jOOrJSLwSpYtl+gR6ZzviKhtg+dpyMdl6+O/8AcvfPI2HxHgrO71BJwUC57gfsKq7wMxhbsGOl3zPsmPUehul3g0c5X/WUE+KnIY2fpc6hVZMpxGLDXYG6J8joi+Lsjnwe1mHbizIUby5Kfi/3xYmxDSYrMuD1eKBdiKGOR8mmmzQuukbpuVj2nX6rKLSicjrkPweKlZntjZGP1SNAYmqd3EdeD7yataEdVvY0+vQIuBtO+f1dQRmoxoT8nasM+roWA5fTBf5jgmJHfS3e16OmnMFAhxe4buZAZLE4l3CgmvFeQgMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYnXKS68d4SeBzXBRmrPeY/1AYKZQsgQQY8HcFnJD8M=;
 b=IAaBJXcx8m9WpeSYhDRB+fcaTrjBnKJGJ1sgA1j/FUjSB9QwKB5FcOTM0/LPEd3G/cweirQYXsnvUhu6RIniuYCb9uz4fTanInQlb3kaSK+V+4RYLACxwsJerRMbPfs/lavyNveg96NghQU8A+AHTY2hhQbRLKL1ERB9rMxSpFA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3893.eurprd08.prod.outlook.com (2603:10a6:20b:8d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Fri, 28 May
 2021 14:16:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 14:16:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com
Subject: [PATCH 1/2] block-copy: fix block_copy_task_entry() progress update
Date: Fri, 28 May 2021 17:16:27 +0300
Message-Id: <20210528141628.44287-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210528141628.44287-1-vsementsov@virtuozzo.com>
References: <20210528141628.44287-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: HE1PR0701CA0048.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.226) by
 HE1PR0701CA0048.eurprd07.prod.outlook.com (2603:10a6:3:9e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.11 via Frontend Transport; Fri, 28 May 2021 14:16:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89d55c9f-d056-490c-2f4c-08d921e339fc
X-MS-TrafficTypeDiagnostic: AM6PR08MB3893:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38936DA85A165CD7DF1ED7E0C1229@AM6PR08MB3893.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:33;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SP3bhMw9rkzbHGT/UpGK9tKsvDZd4Q5bdOt2AKeJz7GLy2wk5joEQ5R+XZ4rsZFFyKnJCVbEItoyecr8kYWjQmmUnGsXMEQs2c2fvfAJNFZxN7Y4xhbKDA4CsndGmSuO+eTEJk3sIpsTlt9V5xUk07v6QioE6Qbv3A5JKgCk2IHZs5Ix9qR9iZAxJ5QiM6qpZddq7tEQYoOOE5h1mkKieuZqeFwTcNJrUb71TnEe59bhpoFWGsp2vyyG3X8++tOm7JdDnjZSL/cjJT4gRIdshnRGLnulB03GmFBqMh7bVdXrAd8C15fDuXAhMiNmjd0tAfaekOiPrwJEAqrxki/CSc8sE8TrAakWNlleU0gS6NQDl1JFDoNucLwHgA/yOaz3ZOBcsXEmVl4T/xoQBbcywRAE949jA5gu4RgxHcb+l4z9QOOyXJIlnI7WbmwdstR63BtoTH91LCAih9W3DmBaV15+QechFEw+nlJUrSClzTdZDVg0M0ru+T7kjES4E7+3meH23u+bMAqqXXC1Vn98jrOfg/vfvo6zCY8enAjOYkLXQmDo9nVGA2DuxoYUWDkKCNl3tyiyaWjYYZ90O4N9tgAbuQuXlevdtEot3HA6dNodcuHlNEq5VEAarTBQFXD135QIer2Vc1/gjqncSCa9Ej8VVFcf5+ROuDZkn2z5l9S93KDhIaETAWjjGLO/unZu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39830400003)(396003)(136003)(346002)(366004)(26005)(6512007)(2906002)(83380400001)(38350700002)(186003)(16526019)(86362001)(38100700002)(8936002)(8676002)(4326008)(6506007)(6486002)(6666004)(52116002)(66556008)(66476007)(4744005)(316002)(1076003)(66946007)(2616005)(956004)(6916009)(5660300002)(36756003)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?e5qVQNK3UiFZ/8Hbh1oHbNLG+gqa2msmTrn6YZMJcWz3N0q87PR0bOPZRM2e?=
 =?us-ascii?Q?79BKt76w9YsTnbIcl2jOCWThzm1T9sdXXIWkyFHVccbZ4ETuwwh7meoXQxWV?=
 =?us-ascii?Q?a0Pb6TtJswdvlFQ6ZIu9+9rQ9CizAfxmERhGD6q5S+LMxZqQe2j+BIeq7mEs?=
 =?us-ascii?Q?bgv3KzNUF3zzzriIzumusM8040J53RjvRCA0ukSIRG/TZQ4kAXho6xW36iBH?=
 =?us-ascii?Q?JRlWLXUyQL9b5MRThUiN7lza7jOmZ59DB/4179/Jy+GnV2kxNOO4sP6hMgNH?=
 =?us-ascii?Q?srRXT4QfX1/ggNM4dPX0JivuY5H2ti0TG+bnU5kkupxonVbqe3Z5Z8VaowjI?=
 =?us-ascii?Q?FVF3yk4HlDPJA6kq8S7KsqggKqDgrLTMcCd3Qj/dOjAxPGV2Wl4qEVg0jgpc?=
 =?us-ascii?Q?tWRiHmVjEwzcWpVG0VqBcr0zjnP8g6LZhSNTNef73ofIWC3gCLoK9JU7ywG5?=
 =?us-ascii?Q?pdRjBrg/XU2rmqR8/4GDF0iVFNOguOLqo6JrXS65R50HcWnHqGgqCY044//v?=
 =?us-ascii?Q?ZAFFYFdMsOqQ2grNsX/u/Q84NLirlUlgFq1FGLCv0niKQOZFhh5shJMfINxk?=
 =?us-ascii?Q?1wnP05aMpWNY16KqGQzmTJ+EnJ5Q75rdklwA3e1PYvi/Ku8fr+BzcwZKAIn/?=
 =?us-ascii?Q?aS0HOi1li57FPGlSPg78ndbtUxtVedffDtLOn3VmoMBcsEB91XQr5mgF3gHc?=
 =?us-ascii?Q?nFpNIeXH2BU9wshUz3EIeIQvA63vQN89/f/zc1XN08d7ysOlFShASRQrb2xs?=
 =?us-ascii?Q?Q2wBCnKXquM+Poam/D7m8DLe1OAMWZ6kk03rYr4o4fsddt/wOQVbydy+Bz45?=
 =?us-ascii?Q?UfiOKC3eBC53lVcgTIJaVBNhs+luSKeZY0XVdLyG/neI3ib0DYqB3aWVp5HP?=
 =?us-ascii?Q?wdYPimGUAsIf0SnTsNJdBkbE70MZ4AOLhBjbt+uKca0K7aUAVc+6+mLY/M4O?=
 =?us-ascii?Q?YXAF2FXnjcJhpzvJZ5uHjKSkglMNZIbsaIL3q6DnywvANLnbG4ZztwqRA1Bf?=
 =?us-ascii?Q?VFjLjWlyKImYhPSzFn3le1f7soxCmJrb6ybn0WiSjVBRsq4guRFOQL9YWUVx?=
 =?us-ascii?Q?B1MAneVbFnb7RBfXsLID4FCDw00W7pMATKspKJTcSLV4VSQ6eqhvSJVSisF5?=
 =?us-ascii?Q?HsGxLW+XbtPInrJqt7LLSWIDrLiyUdqp6SKvlJZiZGrh9DBoqoDI/21TEwGB?=
 =?us-ascii?Q?Hn+VWQaXXuenxanrH5tDN1SLRI0Q7eD2AD5VJ6VD7WYhSpIYFdrFBjMwQNCk?=
 =?us-ascii?Q?NCPcWoyGqmsxFwSiKhDYu+c3ec3d1EsAWgeKzGWkCbHlRgYYcVMK/0KbTxrY?=
 =?us-ascii?Q?NHERurwNWrGz+9OuTUAiaC1b?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d55c9f-d056-490c-2f4c-08d921e339fc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 14:16:46.4464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUeirj4dRzQesLFhr5GID7+2wC3HsEC0m4FL7iJBX9VON2dfvECBYM087HEwgCMChuN82AzErQ+rQZjUQ6387k9gGxD5ePYmJktEJYrR8WY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3893
Received-SPF: pass client-ip=40.107.8.111;
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

Don't report successful progress on failure, when call_state->ret is
set.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index c2e5090412..f9e871b64f 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -439,9 +439,11 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
 
     ret = block_copy_do_copy(t->s, t->offset, t->bytes, t->zeroes,
                              &error_is_read);
-    if (ret < 0 && !t->call_state->ret) {
-        t->call_state->ret = ret;
-        t->call_state->error_is_read = error_is_read;
+    if (ret < 0) {
+        if (!t->call_state->ret) {
+            t->call_state->ret = ret;
+            t->call_state->error_is_read = error_is_read;
+        }
     } else {
         progress_work_done(t->s->progress, t->bytes);
     }
-- 
2.29.2


