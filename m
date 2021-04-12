Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7141535C61D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 14:22:01 +0200 (CEST)
Received: from localhost ([::1]:45902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVvZo-0004P1-HQ
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 08:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lVvX8-00037M-OP; Mon, 12 Apr 2021 08:19:14 -0400
Received: from mail-eopbgr60097.outbound.protection.outlook.com
 ([40.107.6.97]:50176 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lVvX7-0003uC-5p; Mon, 12 Apr 2021 08:19:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GusDd2uLf/GDtXzyfs6nHlO/pgjWZDu17Z/Bclc1P+V4uzwwn0YWRuJUyCDbGTxNy82ffHWNt1a+XhfVNj8di4FNZws3NZHr5Gj6enf270cEI2ugfqQG9EQoFb8nTO4Zy8P3brE+wBibK6nna4yRqJOsYnyCs64+hpytEmNmgzx8P/snv1CqHypW50ddAEsYctD9H64GgseBfpKl9ho3XyIBpcNFj+8vjfdxjhczCtOJ/uzeyUlMzrU/T1DBt3sDIK1FWR+8K2Bf/FMcNs4iLga2b+eFKn7IhQL0iLKljZudAnme9mDfY3hIcpsTmNgGl/pOm51FGvj9NBtqdHNvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f29qRhkPO795PFwQjp4VHMyFbgXmsou+mEEk9dalqA=;
 b=HeeY3FZdk1Sa5Nlily1TtChuyLGGAwYeTBTRKmDqI2HrRTaYQMmU2NQGQ4CARVHvGRdibSEftFCrgtnIFQ9dKwLh6ww7y8VpzHuoCcEhaxNb7k9jifc4GhXVHjXcBOgNq9dBg5htk1cLnVqMMDiFNbbH/tC2gIlY7zQ28t0owMFbYjgquzSMLoFXCTngJY08boSxVhXkoBOlXTlzBlQNboR7szGGyY1VyNTXbaj89u2H8dJO4tOuXHTQyhhqKgOL8Rp0pT+UPBIEBbl1Xu7+a3ttusfKgUfSUiMnY7WRtWC0RAbwxJpbSUedw9IwN5rTdocGc/bgUh1o/yGnfoJIyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f29qRhkPO795PFwQjp4VHMyFbgXmsou+mEEk9dalqA=;
 b=EuYrBYTSfU3/uBIUS9a5NGmvVtmQEDmgwfz7qGF5Tmo0PW/Mji+QGMW4v6mZxWj4KKqqAKV4GgFXKcSlxBCJr7/qxrkOhLZ15FKnCpiFK63drgDVS1Bh6eH3s1EJgiypgivpZZlIXu4wK/PksU4sivFSpNm7HoBbqTC64oz9Kdo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1907.eurprd08.prod.outlook.com (2603:10a6:203:4a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Mon, 12 Apr
 2021 12:19:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 12:19:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, vsementsov@virtuozzo.com,
 peter.maydell@linaro.org, rvkagan@yandex-team.ru
Subject: [PULL 1/1] block/nbd: fix possible use after free of s->connect_thread
Date: Mon, 12 Apr 2021 15:18:46 +0300
Message-Id: <20210412121846.144565-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210412121846.144565-1-vsementsov@virtuozzo.com>
References: <20210412121846.144565-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.212]
X-ClientProxiedBy: ZR0P278CA0153.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.212) by
 ZR0P278CA0153.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Mon, 12 Apr 2021 12:19:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7d599b4-b284-46f8-d37e-08d8fdad2b7a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1907:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB190722828BFED3EFEFC9C266C1709@AM5PR0801MB1907.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QN5JzkpRusU17smzGcNAnd0R2cYQeH1u0jf7yLYQGqQPllRDPKt5+qdd3c3Z/Vo1eIsALTKkLBlkcLcvsMPa/QzkCkGEmZAh2uxtwj5NUrRT+f7Htd3BQDJkkH2iTo+7gEWx5hf2qiLCuuygd1J1K9dm5uSh8UGYc4Qp+vb2HZpog5xzIys3ZCO6BBLe6FWSYxfRcXFn0JVFW1kqFtFHL92rzqXiGMRJajqFn1Fh6M/ySH/14A3pcPx02CQD+BwRpP0d5a62c/73judJoRH6/xrJ04lExbjJo1QgI0leqVcK/QKzQuYhKzAezVbaAnZWSXacvRpuDPVlP2FKzgszQtClr8uR5h/+wrm+181c4oPq/YK5GlaYXwpJIiJeRWJHqY49WUU+YupnfPgFWZDOrrk8ogO0TCODtcE52rWqaIjHVOegY7ujaeBhiCv9SXyxxgJvO5ei1NoptWIFlWnVxRF7r+kRo9JIcIPut15njvYEQ9NmdZDkVgg541tzmWOy11RWFmEh0x/8PVtvVFzpQMSbbS4f7EjvxNrX2btqfH2YJbm1vg6lwinnrgW99y9mi2Zjb9Wn+CxqKgmI7rmFQemimkyxSkdYYeaAZJXqvzBfifD+mrOi6mIBoGd8utS8fMxQzYgB/Wqbr6AuGNsL6IdxmqhhTG05FWaydnroJadVjuXJjHRH4A7RF2/106Vh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(396003)(346002)(376002)(136003)(1076003)(186003)(2906002)(2616005)(83380400001)(4326008)(16526019)(8676002)(5660300002)(956004)(6506007)(36756003)(52116002)(86362001)(6666004)(38350700002)(8936002)(6916009)(69590400012)(66556008)(6512007)(26005)(66476007)(38100700002)(6486002)(478600001)(316002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tgWy3Jpmk/G1ZBkfj4hjFvM7ncPQwedtBXyMLcYc7bz9kmP9H6HrDScZVQ0b?=
 =?us-ascii?Q?bXkDOV6FC44bcsZ4MXOpear6m1Pzb88pvYTVO/sUkeytocSkH4IHYpYe2rVO?=
 =?us-ascii?Q?l2q5y8KbkVdQJUKomyc/bu2sgu5i3JljAeeEN8RCzB7P6YGwFAC9qKRPkzZ3?=
 =?us-ascii?Q?oBIsRaFUJ6JyVfOAUeXRYtX5GfSzJSCVfyes4YyalfzDXsxvuhbMW7OjxkkZ?=
 =?us-ascii?Q?/fhlj9gYzZM/VkpPFG08h3IeII+oXk/CUsQpBXdaKGPEGJ6RK9ljsDgwnyYx?=
 =?us-ascii?Q?CqU5MuX2uakOE8OiQpYcHegEUQNriYRLggwFKUEk1uEMLxDNrp+UEmQm7dxl?=
 =?us-ascii?Q?q4q1Ed/ybFZVazw1Mv3I+ibRK9Odu5iu4PjHShlVhslMNRKeIGwcVqGk+5Wh?=
 =?us-ascii?Q?P7DQIyDBfRE2bmZ+2/EXDgQLsdZfsMzwbDgzshHEQr+1sxc9INNkcvE7HVpv?=
 =?us-ascii?Q?Dol8yyqGQbJu5uwHMvO6zHZ6iiday9pWSGBN01KEXmD8EyrDqM3VkNhCDDpn?=
 =?us-ascii?Q?vHKIy9ZBA8bBY4qnrdMOeShPoqcMmgl08dXPE9j/B1NqQUjMJhtOZUxX8Wwp?=
 =?us-ascii?Q?Eq9fc1zgz2mlEomTZKijWm9+HlrSpUz8v16ETrbdIy/KwSNBqHNHroreHW/n?=
 =?us-ascii?Q?vp23tAQvEDouO46fSmGZou/0C3xEbqS5vSp3Nv7RXVgFIJfFgmwwejpeECe5?=
 =?us-ascii?Q?VDlUpsylKjWFBMeaBxxKy7mkUHdt+wARtIZXL0i0udBPK+U94EbGjtrTPW7M?=
 =?us-ascii?Q?QBPyBeKdMTViP/7uIIgEiq/Rk/i1VQ1k1+TBOYPQE5+AB/VRHmLh8unuPZbF?=
 =?us-ascii?Q?jk7iHl6AsRV8sAmMyZ46fOJD5sbrbE4x0uxZGzc9hoIsbfWUd6xKcUhxcwG2?=
 =?us-ascii?Q?MiLatWc3HbQZHVouCVQ52mpUdL0Tf+rzKDcrjAT9QoccsSlXqwcCI1UWuMwl?=
 =?us-ascii?Q?xghZA7KuGKmUcke3iFvdhfPvd15htwcAxqinvzF++m3KM5VqIVM3bF4iiDDp?=
 =?us-ascii?Q?CG3WWHEwMUDZqIl8yD//bklJYqgCrGbmobxQQw3s1e5DygXirYH0CXATg4xm?=
 =?us-ascii?Q?8TMoJ2UFpepXws2JEzbWAD52AYcBxAyM1GYdmedg+Pnn2Fcc5cHCSygcuJI1?=
 =?us-ascii?Q?z3Wp0V5xfs5SGeFToJo84+zXRI6HGXBU42ekJfLSZ2NOccwrFAsOavl2k6XJ?=
 =?us-ascii?Q?OVse1s59NXJHVeD+iajdkUsocKtPW2AHigKqY/DPKAN3V8qTCh9bRnjSSSQ6?=
 =?us-ascii?Q?2WcyeYaUiASc78n9+JOiSFjFvB2tc1JrYnZmigZFrZxKOUZWlX2FM8LM6W9B?=
 =?us-ascii?Q?el1ZMRh3C+SirAplc+8o7uKs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d599b4-b284-46f8-d37e-08d8fdad2b7a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 12:19:07.5924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWcl1je0BtBZ9GTIQWdcMmTowkNFy5fo+AtZDra3i9Iznutti9Qwz1MFPqfNgvG9Ar53h5FoPmYCRPlksyuQO/hcOWW2MiDTLXl7tl1QIPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1907
Received-SPF: pass client-ip=40.107.6.97;
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
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
---
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


