Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60643A2917
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:12:50 +0200 (CEST)
Received: from localhost ([::1]:46832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHg9-0005BP-Qa
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcM-0004tb-Tf; Thu, 10 Jun 2021 06:08:54 -0400
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:8008 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcL-0004uY-DM; Thu, 10 Jun 2021 06:08:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JO/mYaA0U0ir5URSV74vD7mR4OOzF3kRugRWAv3xlPX5QzMH1WCFHL6Twhy8Zj259NvGEmq2T9SpB8/TjtOUonv+63DsQIUsmGqypRN98mh0vT0kMD9qPOLS0hcEcUvsxZWADmy6GlB7ba9oUXjWlbgh96K0qmZfoFPTU+IHka5UCqXRv6faULqByvlDUR1i5J32Vk3jIAaYYZdQmEDmD1gmJyuLYylzOaVidsKB2cF664slaYH0MI7lyWThLlupzhVlcT0jA1nnS47em1kb3LNUmh6a4e0WcDHDWxdZ/YugmYA++D7Gv9TzE8ThJY+pC90ti3evTULLiPbBZNQlfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5a6EarqizbCqCeN2ClhTnD5xiA1lwXazAKZduVgOz0=;
 b=D7XgbNcE/W9kAiPNo5L8qMlcBM5BK41m6id2tj54r1Bt3xB1CaHPu7lZUT42RP837i6SthZkgjtciuVzwf+tqLPFuu0ILAeciW8IdlbSlGfHU/35GxIQE0QCPCkEefPNPqbBAHZpFMmBP/A7WLRTARxFssHZ8m+rVWcF0wf/ih53tK+P8yUj637qyZnD1Bz0cwUBIcMuik44XkvTDvPMXbdcTHSYAR9PQToiVVKz9M0Cd9GlVspDOTtOzFNY4U3CXDY1Ig0GZwZP27mhVeSi5rUQZ25Nt5fAevs2TNZat5NcjfUW0a1/0RnK4R9+Z2i/YU2vreYlsZW86VrBseXYMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5a6EarqizbCqCeN2ClhTnD5xiA1lwXazAKZduVgOz0=;
 b=UE8g4JqfDe4/pIvuZQjxFOEuQhGY9rBlA1d8XOjvTtfOvHadbjTWdsy4HUZSy97UafS6kDmxTGYn1/fcKAty5RhHq1vy5lA9MRlsg+t5AZDKC8syN3W4uN4Dlrqgkx2Fgqvxp5vovHCrL57r2kF/jxmReWFaWoADILWZHmIaFlQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2035.eurprd08.prod.outlook.com (2603:10a6:203:4a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 10:08:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:08:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v4 01/32] co-queue: drop extra coroutine_fn marks
Date: Thu, 10 Jun 2021 13:07:31 +0300
Message-Id: <20210610100802.5888-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610100802.5888-1-vsementsov@virtuozzo.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae9fdc76-6796-4fdf-c6ba-08d92bf7bc1a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2035:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20351C123C66B936E7692C04C1359@AM5PR0801MB2035.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ctdgWaelx/TV908B7mfnvMKCWs0jEE76NwJgkoSbzHxJO9wSOYYJKTEdqmnCosq132dzXk7SAmz2vpuARo/xyF+vop8lbJ8rgaDv7oDNQfQRGVWYFrihYhmYfPmo48tQtuK6drHfqHYQeJNMznizfGKN/8mW0wKkg9ydN5y66nultiy5XC3TC9xwf5Jfu2y9sGIdK1gLLFWgWMMWzl8yj+t55HdmOJcjIjpTwIGFRuHZOc786LMkzXhhg01+EPkOuYwkGwQjTYw+dwSCxLpYO2F1Inu++3I0/l/KiE6nnPst04a/HuatcNR67wOoSWQ5qF89XHCOYR1USG0vAiR1dna5huMVo3GmreFIhEnf649aXyi1Cv8wr6Ia+3iKTuNyAYKtTCSWguhc1ZilDcsVXyhjSU88tv146TlHCoMrLlxb6zUhJG3F+4Psjj6oGO9zFeqDnhUTV5k3vI8lSUMDaoXJRyXW1fYIsM/yZnonpMizK183Qv5LFLcXb75Sf/snc2xJcL5ei7TuAVRRw5pEPt6IUqIsbgD7Um41bhNvR6MnHMm34jNXpI0mTBLxUQakohDC6/3dcrQfEDQ+yuVAPI9wCKlRGl40BHboOuKqZzDYT6oUHCCdntGxv6b0+mmXptHUgpctZ5hhTyfsPHcFtvgHPAG14Js9QrBczP+cLfo43XoLa1bpEx3aNR6lKmOv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(39840400004)(136003)(26005)(5660300002)(86362001)(8936002)(6506007)(2616005)(38350700002)(1076003)(38100700002)(956004)(316002)(83380400001)(66476007)(8676002)(66556008)(36756003)(66946007)(4326008)(478600001)(6916009)(6666004)(2906002)(52116002)(16526019)(6512007)(6486002)(186003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AY3uotRMv0bIk/Paox3RGRIExNeywmXL3/jXOMB01y4f8xndcEluvgN4hCsU?=
 =?us-ascii?Q?MhYNmq5aY+dg9LSoFsa8mzv445Mrpr+zbHz+K4te3gLlgCmy/RIXhrEyRWpj?=
 =?us-ascii?Q?yv3AcG1MLpTTbVodL8bTXKYsPQdfzSNOoEuCFdMrAeUhnWNWOGwMXrRLB/ct?=
 =?us-ascii?Q?f5tZHF5rjmqGoqvNhy/pq4YwgngAqNozT3LQWq6BVNktvPixoAx3MnQjcBDM?=
 =?us-ascii?Q?+ZpkTKtjFhGzI3ZZRes02mewrNmlZPrPs3dlDe+eRDPP0OYcBr1/eo5bi6nS?=
 =?us-ascii?Q?D5lfXV6uv9CjC4LBnub1ZvcBk5Pidsa5wd9fx20BYHGxsnm8G+aCy+zRg4m7?=
 =?us-ascii?Q?wbfu8bMIzovHgh2Vni5UzUjoqQ5O9QDezlQUoGXjragttoJv0reac6M8ENPh?=
 =?us-ascii?Q?tz5uaSGshppkfXzli0ohj/DJCHMOQ1KJnuQEKnuo6gbhK8ff8gBze+Mb48Mg?=
 =?us-ascii?Q?hJws29rNV1+MVyaZ1oRwidIDZjBGYHCn4fpjKn4RYZ+uETg7h2d4epkuEDvb?=
 =?us-ascii?Q?6EjsmeD5Yo2896kMuQPzQZn7L6BbsVbTHWIfUw9o1IslDf3afeWPoaJrQgoW?=
 =?us-ascii?Q?WA+38OapD/xrbNXEGqbyN9xFtuZPp2ZQghUztz00nhEHOMcifkMCmlJ/X3Fv?=
 =?us-ascii?Q?l6e4YnEFg1rnxZOMY/IOjst2UiHqx5VeiXUUOzYuBE6J5rNwoizzcgkOuNNL?=
 =?us-ascii?Q?NkvPd69n9HnUdrcJ1cY/UdcFiKpZiHw9ltffjabKUDSeUQqo7qyJvrYyzA9g?=
 =?us-ascii?Q?fTFB1fhQqFKgr/U0nuYLOvQWfJewFraWeDOsmFnTvH4/toO6rYjRlCBh+J54?=
 =?us-ascii?Q?f+PhfubiBneSt5NYX2SF3W+CDSgp3DpvFUEfyGmlmdoN6K9Z28N2E6tnCeFP?=
 =?us-ascii?Q?jQDimxl43sC9N0NIsCvL0D86vnazwSBrNmy2/U302Av8EdJRWXe5pnlUrrV9?=
 =?us-ascii?Q?X1e6p4MqOwY2Q1FAlEPcPmO3VDPTZ1A60CdKp5KVnT4YpMubd7iVh3U//c+d?=
 =?us-ascii?Q?TpwVZT1KFPHUPqLjl7QqYH3aiPmECIikXwDSvtFfLbJGJSIqzkKbqAvkUcxJ?=
 =?us-ascii?Q?XteBrnHwucCFh9C78IPFRV+qy1cDG4GuvlIoCZD7vp3J03E5DXUWtQARKr02?=
 =?us-ascii?Q?Asj8zqd8Q2a2qxLEXUVvXvvb6iHkoSvweLQt9Cf+hxd85ukZBdKEf//u5U5I?=
 =?us-ascii?Q?0u5EQ3Nr4mRZajS49A3ilvjPGSxdNF1ozrkZvj0AUed8gxUAtyloLrvX3Aol?=
 =?us-ascii?Q?yynOexWbyLYU9Qn4nQJdPSD7UMV5C1eB7zasnzcXWVQj36PhRs/KJvBB5Hu6?=
 =?us-ascii?Q?AX+H3LCZahRURtE86rLphK20?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9fdc76-6796-4fdf-c6ba-08d92bf7bc1a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:08:46.4066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4IjVIoUJVi9ac7rR2QsAYXBMza9N753UuC0/Y875O1OOjEdwHCUNYu28DzStj31l9MWZAw+AdLxi+he47c0mVp34c2l14TGuu/NwaZDkx0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2035
Received-SPF: pass client-ip=40.107.21.90;
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

qemu_co_queue_next() and qemu_co_queue_restart_all() just call
aio_co_wake() which works well in non-coroutine context. So these
functions can be called from non-coroutine context as well. And
actually qemu_co_queue_restart_all() is called from
nbd_cancel_in_flight(), which is called from non-coroutine context.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/coroutine.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 292e61aef0..4829ff373d 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -210,13 +210,15 @@ void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock);
 /**
  * Removes the next coroutine from the CoQueue, and wake it up.
  * Returns true if a coroutine was removed, false if the queue is empty.
+ * OK to run from coroutine and non-coroutine context.
  */
-bool coroutine_fn qemu_co_queue_next(CoQueue *queue);
+bool qemu_co_queue_next(CoQueue *queue);
 
 /**
  * Empties the CoQueue; all coroutines are woken up.
+ * OK to run from coroutine and non-coroutine context.
  */
-void coroutine_fn qemu_co_queue_restart_all(CoQueue *queue);
+void qemu_co_queue_restart_all(CoQueue *queue);
 
 /**
  * Removes the next coroutine from the CoQueue, and wake it up.  Unlike
-- 
2.29.2


