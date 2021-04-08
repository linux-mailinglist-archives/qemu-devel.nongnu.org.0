Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0457B358673
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:12:25 +0200 (CEST)
Received: from localhost ([::1]:47022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVOS-0000LI-1p
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVMg-00071O-8K; Thu, 08 Apr 2021 10:10:34 -0400
Received: from mail-eopbgr50100.outbound.protection.outlook.com
 ([40.107.5.100]:41486 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVMW-0001oo-Rv; Thu, 08 Apr 2021 10:10:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EH2ux9dfB4Bbp3w/YAn5QF0FQ9MWLyKC6u7ds+OkMpj6dYPuQ9dOjCr+RXzyuD5muJzZkvAcWzL+hxXOQxuPpxPFf28Z0Cr7O8jMWp5OK9vE5bXNa/j9jXJz4Q7zDwZ75CnGbHXTmHkQeWnhhNC+dvNM+7yzBqj49ns5rdQop9mcirdrNqTp2fQXm06AObWQviLmoGMERkmOE/4af2CXNI7Vn/MJsEAnZljQ9NCexgVsSa6WTFCQtx8hE6WKy8Wk8kNDOhzXbKxVC2rE26u7rs5cxS5FTaS8Cnkc3G9xC4iUwywpk/2kCBbJMr9cPWUhjkk8DGj7uU9LhhZO+y5iDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OI2tDnUOEYeKwOSdAUYDGXSZQuRM/wZd9aQxJtkirI=;
 b=ce0+fWdd4Rj9R1DuipNzEKVj+th189soFnM93I3OBfO03KO8vzEHzxEnz/CtIF7oaZCc23zaS8VChsJB0ryZZDwP0RMkNsUhiASQoWuRo4H/vZSAuS5kg57YMPt9xhXia1EkQFNyTR1c0FuUjBiO1VMy6RSDKPNgyucbKjARBbbdUpN/kwPrVcjP1m3zhfo4tdA+zp+Wd2B9acHTZbrrA3nQI4ntFDnZOwz0ih0FFu9q/Csd4A8BcAmfT1nYficqV9lR4M7H0UIdYjOQd+UEWjASgczjU8aLI1L2jlYIb1Muwf8crS6rz20mJBtY7o3bwUNmDR9k+OWNrmPfyZnYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OI2tDnUOEYeKwOSdAUYDGXSZQuRM/wZd9aQxJtkirI=;
 b=Iqy4JgXMWZxYk1yX/8/bCqQIh5awIVfeGXFQr/hkNb4Fhp2VyBU9/kVW6I7kVjjCUhbi7E8GKwaf66UxdCwv5avHcoBJxFJb3mVIrqPQchoBk5LZ0ZvtM1q2xJRM2Jlzf1lPvwlzmti2HsSp4i7VFKcmhRp38QdL9Dj7PrfQXKY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5127.eurprd08.prod.outlook.com (2603:10a6:20b:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 14:08:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 14:08:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, rvkagan@yandex-team.ru
Subject: [PATCH v2 07/10] block/nbd: make nbd_co_establish_connection_cancel()
 bs-independent
Date: Thu,  8 Apr 2021 17:08:24 +0300
Message-Id: <20210408140827.332915-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408140827.332915-1-vsementsov@virtuozzo.com>
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0701CA0052.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0701CA0052.eurprd07.prod.outlook.com (2603:10a6:3:9e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 14:08:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3933d71d-b2c1-4138-4d6d-08d8fa97d6b1
X-MS-TrafficTypeDiagnostic: AM6PR08MB5127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5127858B77C70E08008D0EA1C1749@AM6PR08MB5127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NZ9B3KexZWuTWp8vxmmB1TDgSNCjtFX+X6bP256+dkZpNYWurmisTw8Bwl2/CcFYGXb3I+vh2RhMQloHOE1Ht/VoL+xpFW0ClBYh2217gMMsix8sr2Lk5MIufQkMQK+VEZk5kTHeyEyJnBjcoC4q4IrISR4+cOY5ZoZQZuD7WVCJquvH+Q5yPjm0SFqxCG9YwnYROiXOtEj+hDKdkFTDJhk7mO33tLC7bwJAK7d8RdJzPj3F9IQA/80qtaaQoWHexs8620Vs74Vo+Ou1b7E01aHVzUtZYbXFH7qZPCiq4khgwm5Lcupip85CPfGZkAVu+WNAVdpLLtoNEmth7Nbyy70If7Yjl+YCKpocl1wsRlmm4ar+cSDhlQ6nyvVQKjQQCvIZcs1StuyfnORSnXljpVq6R8xtdnIsj+PAS1ycpC3QzkpK6SOwh7lHJKO43p3scGoJZuighQ4YV6usfda1eEBvwVX1jvhDdPcdH3naPuZd8msy2Ee2yFOZT1OVW5L7L0DE0jUZy26PM/LNeCjT9eILChvXS8URdDCJLvt2FP1nF27s5Bl60sBdVfay/TkF2YDXvZK3edUzL73uXfx8zitblxar7+hA+dhONDYfPqOLgfkCK8alkjpTQTTHF+/HpErZ8JehK7tQuA5JyXwQNAzWUPw8tm/kVEljHqYjmArMBd2e+zoVUtmlIzjyG1iCqMxpfCmIiq2jtKquFzBbn3iPKYizLoS4IkBZh+NujGE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39840400004)(366004)(346002)(136003)(6916009)(2906002)(38350700001)(86362001)(83380400001)(8936002)(6486002)(52116002)(5660300002)(4326008)(66946007)(66556008)(66476007)(69590400012)(36756003)(38100700001)(6666004)(6506007)(1076003)(6512007)(2616005)(8676002)(186003)(16526019)(316002)(956004)(478600001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yQydcdhVX8zKwCksHEjzx+5u7GPJpIy6mNHq4np0tvRFk97mZK4UVNJg0Itm?=
 =?us-ascii?Q?OwGQkg1SaQaHnCXY4INvBeBS2UINlDbJJnUgoMZgA677Tw7N22/WsydM21+i?=
 =?us-ascii?Q?xGM4o/YeZhhjTLBtFJfmMGrJD3PPNBn4qLewGRyiEKXMc2gjlxbGkfsY1iqx?=
 =?us-ascii?Q?ctDOlI3KHel9M51uLxwHqBqEqmV2RZ+TrJ4sLneB3J/VDlfAbQutabaQw/ZE?=
 =?us-ascii?Q?WeqZyDttMxN1SaypneeW0wYz2GjVCF8STg0Cpg2hKmugK/iUh72RmpnQvX4H?=
 =?us-ascii?Q?BY9d4htrcLDSql4UjM42l3YhNwTIsz89D2F33B6R1wFSmDRIwLcNMLJGXWwA?=
 =?us-ascii?Q?xVqnU9LhZCdXBgaC/46f9tEkfhejQTgH/kDZ2EF8zKyIyvRf99I3sH/twupI?=
 =?us-ascii?Q?/Rzhph5F6iyMBGtBRAWoKVC3EZowC5rCdeloBbDMntWdaZFAtsALAUwSKx7K?=
 =?us-ascii?Q?s4mlEwiDRP389xN3TDbvnpzLWY1xxGvB2e8G8plQZPVsW5LZ00ZQCyzyoHfp?=
 =?us-ascii?Q?mgKxjkk7w6U0LjjV9IJJoSOMrGIaVxEDMfZ5zkpF6s5Hj28X79rjA4G4DqoQ?=
 =?us-ascii?Q?glfmLrb+WwosEtayg0qLLOk8eI2Sic6cndhLuoaRwiGI5qyrsk7d0/pesfG4?=
 =?us-ascii?Q?dmjLpukBAl4nhId6k+X8XklRMZm9gfDW3DMTpNBhBiiZmHxGvrX5dwNP7dAo?=
 =?us-ascii?Q?yk5hFGhxDJJDzyTb3peJb46rDjAUyGb8z3sh4qHdjcYzscLVuHXUIwwSsS/P?=
 =?us-ascii?Q?JiWbrtX5UmneVT7b1QFvAjAAGoqsiGjzuazkzh5mVK+3dmDgHcLpvMZIx/u6?=
 =?us-ascii?Q?PtnAUEzlvkQ5b4z0ttK24vKNUzUoskA62UbAHh4xaJlqVKbuoy2WNsP5il8D?=
 =?us-ascii?Q?T8ISlxIoP10YHlShRS98zY2P/FVfeR8bv+VJU65Gcik+4ZXEQFF3r78F1fw5?=
 =?us-ascii?Q?0O30II6MlUaFHKZLtbDyalhMB+AmoL/KLAaFkYnvxOHVARDH9u/TWSJbVT1Z?=
 =?us-ascii?Q?TiMwKEAIlV2D8OnlqAcl7WVRMqeN6Jg+MvrY0Qmyy5v+Twww0+7GAVCQKaIN?=
 =?us-ascii?Q?7rPHcfKUjpGbH6Fe1Dpa9JBE5BMvkEFu1SooIw8/8dUSZuLNAcnC4TZRIQGW?=
 =?us-ascii?Q?ozVq7ZzJsmuli9wfJc3Wk6smc9ODWPLPAXYzyZRV6vvDpegkRmIpJ71DtCq0?=
 =?us-ascii?Q?vEgFhlHnAwA7arKCDcI7Jlnmng2bvrrqZ3nPPdUx4alMo2lhhd+yEQRs6m/7?=
 =?us-ascii?Q?YqZj5cXsKsBgL2pE9WS+RrmNn1RG8dAuWZ/Rjj1sxXZoIksGqETi91qiiFBI?=
 =?us-ascii?Q?a7l0Etim60tYX8LXeNFjEkES?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3933d71d-b2c1-4138-4d6d-08d8fa97d6b1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:08:52.3686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tucu7xAbywD/bZC3RYKTFBIELri+/KcSYbkfshTmGm/NZ1GJUoEWEwrERDruiImFDOvv6AK3RK3kP8YTePsHcfo76b7wbm32Ts+wYSek8UY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5127
Received-SPF: pass client-ip=40.107.5.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

nbd_co_establish_connection_cancel() actually needs only pointer to
NBDConnectThread. So, make it clean.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index a487fd1e68..ebbb0bec6a 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -124,7 +124,7 @@ static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
 static coroutine_fn QIOChannelSocket *
 nbd_co_establish_connection(NBDConnectThread *thr, Error **errp);
-static void nbd_co_establish_connection_cancel(BlockDriverState *bs);
+static void nbd_co_establish_connection_cancel(NBDConnectThread *thr);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
 
@@ -271,7 +271,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
         qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
     }
 
-    nbd_co_establish_connection_cancel(bs);
+    nbd_co_establish_connection_cancel(s->connect_thread);
 
     reconnect_delay_timer_del(s);
 
@@ -311,7 +311,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
         if (s->connection_co_sleep_ns_state) {
             qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
         }
-        nbd_co_establish_connection_cancel(bs);
+        nbd_co_establish_connection_cancel(s->connect_thread);
     }
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
@@ -461,14 +461,12 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
 
 /*
  * nbd_co_establish_connection_cancel
- * Cancel nbd_co_establish_connection asynchronously: it will finish soon, to
- * allow drained section to begin.
+ * Cancel nbd_co_establish_connection() asynchronously. Note, that it doesn't
+ * stop the thread itself neither close the socket. It just safely wakes
+ * nbd_co_establish_connection() sleeping in the yield().
  */
-static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
+static void nbd_co_establish_connection_cancel(NBDConnectThread *thr)
 {
-    BDRVNBDState *s = bs->opaque;
-    NBDConnectThread *thr = s->connect_thread;
-
     qemu_mutex_lock(&thr->mutex);
 
     if (thr->wait_co) {
-- 
2.29.2


