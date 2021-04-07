Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16FA356A50
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:52:21 +0200 (CEST)
Received: from localhost ([::1]:58754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5nI-00018y-NW
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iT-0005wK-Ua; Wed, 07 Apr 2021 06:47:21 -0400
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:20888 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iS-0001Tc-8n; Wed, 07 Apr 2021 06:47:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDd2X3C0+YoNXH0sH6sXF8Qkqmyt/j9f1GO07xNX2z3P6a9qXi8vXrhlrudt6ScqJjfrEIHEvB3Pd8jmhByeTNHxqoBG4A2Qq3DBGa7zXvVIXmApo3FU2POuYX77A4M1L2rncgd3f3r+xUIgHdJGE+PtjXKZXvzhCZXeH9YAVHbNIPUm0EQXc3YDB8uAYYfRLTnMDXHS0XSjtIbqPS0yMT+Sy8jqGkws/+1/HWFxYrFeu2C0bl4xw+VqtGuW12ZBPms0NZuZeDqECjTdtOehcRq8Ybmsc9wL3sd7S6Lznuel2LEGNOdb5h01lJLATjL3LAuzwbzAqVC7qE5qI1MvOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eU/P9Zj5zvgSHWtZWTSvtBIZ+PMmL7Rq/NUQRvVDfxs=;
 b=d6BYQTKz7cXPZftHo11M55m4w2hj2KJBLIxc6+42nGv+Q4SqS+sv6GRQU1k3fr+f/Hea44HqszzPDyggHe3GtnPrHzXz2eS2NeT2V/XdgPWlKx4/OpOACATmwfjCv0iGkaw46QhFQvRTdDMOID4YEqXwC0W+2yrf7jiBvvtd5ZEVh+tPtwZprWgFqu132ohOyk7GDEvwGypNYUBTmufMHsRolTC2IgQroqcfJtq2HVmtPUfzGzfeA4GtYMRCJ3QbRwkXE9UyOJLQ6ahgdVgBZJNFHnhviRX2J/ykUFMGW4GwX+OUA77zW9ceMFNHs/69CRVnP3AjQUkKVxzSIYSJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eU/P9Zj5zvgSHWtZWTSvtBIZ+PMmL7Rq/NUQRvVDfxs=;
 b=EOpwpJ3ZyhmQWV9WM6bkBCdFsU790FOK8eNborZYAOw2rlgTEmM1OUqUqEbpDzxB2yPyIpNFjQimhAHfi1uOUPQ3Y//Rs8HS/a1t2lU8dk0u6R1T7eLx9UJYSS8rf8f4qtK5w4B5rdgYqAut44lqNMI33Q3tZD4jaUX2MWR0AZo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2452.eurprd08.prod.outlook.com (2603:10a6:203:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 10:47:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:47:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 11/14] block/nbd: refactor connect_bh()
Date: Wed,  7 Apr 2021 13:46:34 +0300
Message-Id: <20210407104637.36033-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407104637.36033-1-vsementsov@virtuozzo.com>
References: <20210407104637.36033-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:3:e5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:47:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c07b696-4227-4a63-687b-08d8f9b28032
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2452:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24526CA486554F05C45E2416C1759@AM5PR0802MB2452.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uv2hoAMTOa8gqHT0kvqeI5E2Vnc6H0Voiu38x99cPD6YXxIvKJtMa9twkRoFt01blVKMt4/kaQXgkq9+r8FThZCRqwCjDAcSBdTLy1Ie6ePYs57cJWPhIqIybTb76CvqEW4stawH67UY3JIK8CFo7RkQ7G9nYGU63X/0la3CRoA/CQhTXIrHnNpTLa2vA17N2ZIcwPzvCbQ9ZJ4ms6hxtPz6FX88CnZXLpvsaRMB+Kb+SCiZv+Av8s/9z+aE3gVqAIAXOLMz6b1gI7VEdZ6gXFm2Qs0vXaYAfxATvq22C0M9akzDSOzTpwPimVj0wZbdJV7LdgPKBwsUgprSgtE298eg8sYevRW9D5uW9NwpTrT+89C6I4tqUupkG/BvpVk4xjb01Xu6HwF3zObh0PbHAyzcI109ebUkxE3EjI4qaDTMkhG6hRKw4IDzelvkrOxzUhy/WDzYeSZ9/tw6eFTKehoRoj/YdTQs6C6t5WiSMdAau0hQYE4ZQvPIJvBNmnFrOg0WuwmbNRqcxnQqaqY+WdiekYsHzFQkzAiUWENKz37FsDW8MnJ9lc5Y7p58CHBXHHeM1/3v3l5R4n7XtPBbjPTvU+1kOttTfjenFj6drHnuJjWh0WC//OQvNLYDb3K5744mZjOXCDhlSUY0+2V1/NQUbuJRk7d6KTB6wBb7pwghrIRf4exswv857pchyTKlvDnbM6qLm/akR25Z6AVZ3D4yf9LsYVRc+yVWFQCCleM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(396003)(346002)(376002)(8936002)(66476007)(38350700001)(36756003)(5660300002)(6506007)(4326008)(69590400012)(956004)(66556008)(2616005)(478600001)(83380400001)(8676002)(316002)(6512007)(1076003)(186003)(66946007)(16526019)(107886003)(38100700001)(6486002)(6916009)(52116002)(86362001)(2906002)(6666004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WlQtfTli0GPaS9ai66Tl96g2O6IIyg503T1Glz62+CmGEubvf+loRxt3JUJi?=
 =?us-ascii?Q?0rg11k72p3kN8WUrHu+XbSrKFNh/R0ESqRbSU8LqsGgO4vgrH1IrlgTaLNXq?=
 =?us-ascii?Q?bUpAtpjCB0f6DW037s7CyyFkINsciwyCnBtVDMz2F60u+a43XRpVnwkEeQyT?=
 =?us-ascii?Q?wFxdNqu5YcN6u+/XXRGMJKWw+gxoI6A1HUwkkP8Tj3co+TzJHrEQvrdGH5fJ?=
 =?us-ascii?Q?L3mxpq2zXG3UhX3Jlqyi4Vll4U6VuI+1DvnYHIuuwctQBOBqwZtkML1W7uJI?=
 =?us-ascii?Q?XayJeBglyME6Q6dFGX5LIwtMtEu1/Xyb4tVVUGNYYs5l7QIIuWqacgmUlTip?=
 =?us-ascii?Q?KFQrjpdRzf2TErLvyWj/89KTTU4zmteuR563H/92KaQVMw5X5RYqeorG2RaZ?=
 =?us-ascii?Q?7KKAWykqpzgLB5zxayrO+So2CHsr835ygeKjhcv95o6wBqCKdirx3Nud+vC6?=
 =?us-ascii?Q?NJWYLUTGa8M45wEelVj9gxdsSnHvAAW5uWg+hDL2LlQO7jfKKmLRNDuMKMCc?=
 =?us-ascii?Q?JdqpKlU/fWADbQAf90gzjys1EC+HNWsDXg1vEjXCvZrGZRDPhkr7A4gnhIeF?=
 =?us-ascii?Q?mKoxMJ4o4q5J6i5vSEO0x49H6xrizXv0crRkB1A2cSaEj9HF3AM5Vd6yF/vT?=
 =?us-ascii?Q?vuFpStzhI7XXx6diI597aIQVyFmR6OUQFJMLRXdQmDb+CbSrC5ZVpBeirWUI?=
 =?us-ascii?Q?RKM/nCl7daLYnBTRwgeDxHoDWawrCzwJ4+e/0w2osZlH6RuRZTq3zu+yC8fu?=
 =?us-ascii?Q?/CmA1d8dYBVUJ/uuMrm+WXtY93DfIpsU6TT5MWC71yt1/r7To5YBvpiWNor8?=
 =?us-ascii?Q?jNG/PV5Qj/F3sFHr1BBLNp9hYu2p4MA/zkcXLHsSNes9y6b4g2gGd0aihoUL?=
 =?us-ascii?Q?0gjzX7i/ksBmWKpAik7JbB3cFul5kRVofagrbHq0clbZRs9r2zjJnmm498Ch?=
 =?us-ascii?Q?JbUQMuTlyna/ICLW7auXkqy+mMwArT1YgtspCzvA1UexqzJjCdaQdq2BCJJO?=
 =?us-ascii?Q?lErArSn9QYoNunpJ4/ucB2nc5QLbK4o4ud3cCAn0R29+tCxaETzk1su/wn7E?=
 =?us-ascii?Q?hHHkLs48de3SnlyCywdj4o5vZQNiCgBWx/Kt2/xopxgS8yX51kjLiLWrfPnH?=
 =?us-ascii?Q?hCVpaJIUryZ307Q6iWOZDcX9dynfWf2qwRJ8FVHsh2aBQGSCaO+KCuKlUuPS?=
 =?us-ascii?Q?N3cZV60kMpmzUcspToHDLZf/s5AdTnIlEPYQ563tAIhhIRcEcACG8BIUvyRr?=
 =?us-ascii?Q?1wN5GeN+tpbjpzQxhStt2VsOIivmhd32ku5+lPfUzALR1Q4SkCZoqCD9MGx+?=
 =?us-ascii?Q?1gAsb8mUVEYs525xgp+aIapy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c07b696-4227-4a63-687b-08d8f9b28032
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:47:12.5397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCCPihBk7EfTb4ijpphmFS9G7PkycbLN+FBTNaY9jSyVdsFyzgHYD3dfe+L3xv9QWniWJLpj52hYK5C/VA1rXaq4EKdVuUpSs/uLq15r+3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2452
Received-SPF: pass client-ip=40.107.21.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Now it's just a wrapper for aio_co_wake(). Make it more obvious.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 29bdbd38b6..6729561935 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -362,11 +362,9 @@ static void nbd_init_connect_thread(BlockDriverState *bs)
     qemu_mutex_init(&s->connect_thread->mutex);
 }
 
-static void connect_bh(void *opaque)
+static void coroutine_wake_bh(void *opaque)
 {
-    BDRVNBDState *state = opaque;
-
-    aio_co_wake(state->connection_co);
+    aio_co_wake(opaque);
 }
 
 static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
@@ -403,7 +401,8 @@ static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
          * Direct call to aio_co_wake() from thread context works bad. So use
          * aio_bh_schedule_oneshot() as a mediator.
          */
-        aio_bh_schedule_oneshot(bdrv_get_aio_context(thr->bs), connect_bh, s);
+        aio_bh_schedule_oneshot(bdrv_get_aio_context(thr->bs),
+                                coroutine_wake_bh, s->connection_co);
     }
 
     if (do_free) {
-- 
2.29.2


