Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C50F361B31
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:14:54 +0200 (CEST)
Received: from localhost ([::1]:48674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJcr-0006Rm-7i
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXm-00011F-Hc; Fri, 16 Apr 2021 04:09:38 -0400
Received: from mail-eopbgr80134.outbound.protection.outlook.com
 ([40.107.8.134]:28800 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXk-0007vT-Pa; Fri, 16 Apr 2021 04:09:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zv23kGYzoGwf58FdLmLeEephLbBlITfSTqzDP6jvpDIqAaapkV5WgDVI2pLXimAlJFB+NyQt0rM03c5nYD1SLt27R97Pp+i3uKexOgNZjn7tqJz0hlgBQ21bfZs+9g064/hG4ook5uHXQrloBQBAO7yyOOevyDxxqLOgR8tt4SYtBWunoxFq3wzJ+vl7pAtKO8UABYfBiVkyz/smPslWdbRUoeHL+Ep0XGyY8rg6RlPNGNhgIHULnQfjRtB0WRTyUPEe5W8g+phkXklyuwtOXfRZYz/mRcfUB2xIQcuU3VQlxGzw/8lr8bMkawhtmEpu+Z3TtiQYYaoveVfFguDlLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jU09PGIUfiPs5pgcLw7Sg/FG4Akd8NODqwTKNuMbBns=;
 b=Tfjbdu/TdiWm/V2Xkj+mdeiMWYv+v2wmaPMChzBSuFyGU7F8poxJgBxXJ2cfMmuS2H6YZdnRgrGvmSbKi82PG0k4j3PDJWQ8+CyX0RwSYwJz29H+uWn7kx6qyeNldc73oA9lzgXfAMiLl/QszNZY8Sv1+4graAYPAVklTq5z2wS/lxc3lsRWk0e5jc92+i2yVWdQJ4eM/ROxw5lzoPfr+R0tvyie+F0LKHMOOfhLB6vV7ZPO5lXmBmCsubo95zWtABmf947pQAkSTldBP3/nNw9o37eP3rSnV+WOyPfGhA/3TOtzYdvklgxgtu6dzXOScbkSeZ84fY0IVaQlZMgsjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jU09PGIUfiPs5pgcLw7Sg/FG4Akd8NODqwTKNuMbBns=;
 b=mGE18bJXjXKHaWIKaBXRsDZqRLfCvoBC4dmvrT7MYmGmotydfRn36GAWJ3vCIIWGKF6v4BU6/xJGo5r+hgVNXXJ/Wr7ec+NdEIinlXMFlhItBszYG5hHluFhEkuVMnudgztE4YpUIR6eU5YekPgsupJP4sMHlmhYsUMhWhhhprw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3717.eurprd08.prod.outlook.com (2603:10a6:20b:8e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 08:09:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 05/33] block/nbd: BDRVNBDState: drop unused connect_err and
 connect_status
Date: Fri, 16 Apr 2021 11:08:43 +0300
Message-Id: <20210416080911.83197-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416080911.83197-1-vsementsov@virtuozzo.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d24d243-c016-4d4b-5df2-08d900aef784
X-MS-TrafficTypeDiagnostic: AM6PR08MB3717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3717BBF38E6782C7F959E52EC14C9@AM6PR08MB3717.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:109;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BmO5gZmD1SEHQz7cZgupeJY/e5TJJnHg8+L+hFTRQw7WCCWKG8ArJAXd/IK9k2OrFOSOHuUBN+95X1m+VNoDVxouhlQZq1+ZR4vopo22k9/2FhuOTddUE/JuOS3G75vZ1s/QQVkZmHaegXzS6sf3clftM2IowLK4p40F0bngi4xlMRHWYRRafpUoAto3lpJRNyViGv1OpW3AntZ12l5SZTSIZCnA1v2joCtggJM18Hswh9+uvfqz7azOoKQJ0ZgIey7id89zl4KEwLr6iPI+/cfWwOdVhtDDkol7YGJBykw/sIYY3hqUaEe6zajWSXDn4gp1nqQhFt8RjddadcrbKgzhMktSLWLAecpACqeoTm2SZvGstW4pXBWFVvEh1jSJHDbr4mRuexa6sf82Yh8hDElNGGu33hy3slvRtW/lqLa7YThffOzwlotItQebASAB2OCdR5mH+MYaeovmD//2e4rD4XYdpHAPwWUxixJaMrBwQINyNM3wCxWG2A0CtwWg0BdpmHNj/rh2pOGB51NFRJ+XErsmN6k/Y50RaC0+Hcul5ZSyH5v1W3nSJxwUfCEbYVFzCjV/sucWlGy4PnExXM8nN8yR1hDv0CJBXMhne5ANnvs9FfUBKmbJeSFC7jLOkyiDiHzcFv/UQ1vl7WkS1BJaYHVgcvYS73c7G8EPa5v67TwKbOzZsDkfrMBQC/a7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39840400004)(366004)(86362001)(36756003)(66556008)(2616005)(66476007)(186003)(6666004)(66946007)(6916009)(107886003)(2906002)(26005)(6506007)(69590400012)(16526019)(5660300002)(4326008)(52116002)(478600001)(8676002)(8936002)(1076003)(38350700002)(956004)(38100700002)(83380400001)(6486002)(316002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eroPa8PDFOZupEJrddrjvvYvbEUPceKyhV1y+SXA6d2KHj5uEiMJ3CI1zXVV?=
 =?us-ascii?Q?8kr9D3xXQSAYaobFum0TrQmDbtf8GqFLOZEU17aSom1ZIHIsLXYL3rMC+dSO?=
 =?us-ascii?Q?NvMt0pDzg+l+N1hz4gIKNtSAMs5SMz+C5FoUGJQgZtHF87DsyiaEWt4T5ySR?=
 =?us-ascii?Q?7+D/dDSxfrFYkHc98ecVdeETf0eKwG7al89Q+txBtyCRc9mWD0scwtkgK/zc?=
 =?us-ascii?Q?4akZ1gLdtY0d24Yn/5K5JoiCvwoZEQh/59WqaXRFdoj+OTij6FT8iCNZyv1g?=
 =?us-ascii?Q?OeevQl6AHySJlrxjhA0Ua/1tn049h28VYRFFJz/L5eCTzlO31JcbNK/O5gN1?=
 =?us-ascii?Q?O46sr1C94aYGA7qd4UVJ89tEWvI1KyH2WywIZDXaeqCCBJZ5Nh9KDCY8ON/u?=
 =?us-ascii?Q?kEvY5yDeA0jb0EUsYM3wb6KM2NIbYAL7JUddgKlMkeP33NKzfLKh114wqfgY?=
 =?us-ascii?Q?LBRhzaOwO2lgNo45CTYcY1SuAjcuVOZBLDEuqBcmE2TSddhBx+6tqTXcYf5m?=
 =?us-ascii?Q?odhOM8eAIDPAl3nlFGLXK7MqGIRiDlhat+Qr2MHjlw0ZtJ4GtBNC6tCL0ryQ?=
 =?us-ascii?Q?ufcuT/nOeGpRgIc+EB5w3VTgObj4nGCpXiVw36B/ZM7WoocNbJaNF5DEEnIc?=
 =?us-ascii?Q?IBJT1ukzFvK8P065n9qfRLeO7eS6O7+HD3RO3tQggyGxWYHzAkfYytgZ3E8D?=
 =?us-ascii?Q?0kamLShauibjDbOFf3ucpep9n4RoNHaaJ5cxFOiVBbaN7QFCxhX3VQE+HAN8?=
 =?us-ascii?Q?6d3EQQZ3wVLlz4C+uDKZB9H+N0FCba9n8V//Y+3V5zVmWmyi0NXrguuP66f2?=
 =?us-ascii?Q?4AwDLVwqq9lXzPgF/3qIM05OStGkc6b9LlJXUbGLZ52NFUXle2FkIeFxqRAk?=
 =?us-ascii?Q?+zCBOv+VLTBGgYJxPMj1NcUaku3bFgfM3sI17GBLF/skRPvDBZjXYlXSpQwH?=
 =?us-ascii?Q?zmCKnNJg+eyb4kKaa6R2Hm7tr7cf8KwfGTHMRIcawrrAW1H8Q/uS+8RpCt6i?=
 =?us-ascii?Q?7G59xkegGn+3I407Ai8xc94/eJremh0UZL4s6UHGwsCRb0XZdgvWEuWsC9lu?=
 =?us-ascii?Q?9i+jKse2jAJnsY4C0zrkNTsFgUP7uciJSBJxgZg/i5RurYSfZlelPJSSSYn5?=
 =?us-ascii?Q?PgOS9QW0ux31FM6difP2HlFmEAkxNZSBKawfp4XrXVtPF0trK4bZQtqgyfEW?=
 =?us-ascii?Q?nZvaS12jE1ebUMObNreKrmb9O3wb07gCGKlrCSKbp73dxPzrJ+cJasJDEqkw?=
 =?us-ascii?Q?qAIws1wfIwDC8GkRd4jQNKqkjTjso9/mFnl1/xuS9pIZHyIMMuzPO/y6k5RT?=
 =?us-ascii?Q?JxFYwQBRCKxYLo0cIGSKgss1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d24d243-c016-4d4b-5df2-08d900aef784
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:32.8354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GE4b/ZUHlnISmJhgFEKfG9lbET8vzGYtheNFvcPG2jfb27Xr99WSu7QZWbiufZzPXfK5AtXJ+QQXR+gdP4FpTNPpkgi9fu3vEqZAANfH/CI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3717
Received-SPF: pass client-ip=40.107.8.134;
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

These fields are write-only. Drop them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 6efa11a185..d67556c7ee 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -121,8 +121,6 @@ typedef struct BDRVNBDState {
     bool wait_drained_end;
     int in_flight;
     NBDClientState state;
-    int connect_status;
-    Error *connect_err;
     bool wait_in_flight;
 
     QEMUTimer *reconnect_delay_timer;
@@ -580,7 +578,6 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
-    Error *local_err = NULL;
 
     if (!nbd_client_connecting(s)) {
         return;
@@ -621,14 +618,14 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    if (nbd_co_establish_connection(s->bs, &local_err) < 0) {
+    if (nbd_co_establish_connection(s->bs, NULL) < 0) {
         ret = -ECONNREFUSED;
         goto out;
     }
 
     bdrv_dec_in_flight(s->bs);
 
-    ret = nbd_client_handshake(s->bs, &local_err);
+    ret = nbd_client_handshake(s->bs, NULL);
 
     if (s->drained) {
         s->wait_drained_end = true;
@@ -643,11 +640,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     bdrv_inc_in_flight(s->bs);
 
 out:
-    s->connect_status = ret;
-    error_free(s->connect_err);
-    s->connect_err = NULL;
-    error_propagate(&s->connect_err, local_err);
-
     if (ret >= 0) {
         /* successfully connected */
         s->state = NBD_CLIENT_CONNECTED;
-- 
2.29.2


