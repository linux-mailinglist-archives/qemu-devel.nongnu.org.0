Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1492658C85C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:29:19 +0200 (CEST)
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1sk-0003Xq-5n
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1YA-0003Yu-P2; Mon, 08 Aug 2022 08:08:02 -0400
Received: from mail-eopbgr60132.outbound.protection.outlook.com
 ([40.107.6.132]:10881 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Y9-0001SH-2t; Mon, 08 Aug 2022 08:08:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bllFbtdUU1BziVv/n1aAPpXO77gtSjPRaBF/6dAhBrgUOArpM/skw70F0bHq5lXJT857RwRqkz/bFGnz5ON2Qz+zHCFNbuIPXgMuvnAKhfKudAxfGgPgUDuiHvps9arDYs3E6UA5ux4/7prFnIT0ocgzPVjisLgGm845Xghv5yTldE84BVJoX6mT0+Idn166RQoBZ00BmqAXv9/S/XvEbuIY2RciyggG8K75mEZK8YHLA9aCsabkYy7+k5yihmikoD5wedcuvBXZXqitDGp96JJZpJvf+m8JcpxNPNDM7FzuI8L3DcONI8rKao6iYJyhMD7KMi+2m/dCkAMalLmGvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lg3w4pQOvSjLZ+uKSta0My8qpBcODSKEG3aNIExn7XY=;
 b=CLnWu+n4jtAAyX/C8XmFY08eYV7dqCTBWtobo/jc0VBwqjpJDXk+hhHUzIXRL4M1VKkT9dQhmMOXCXz+zOQxxFah6hUOSIq6bksuPQPs44MfQkv6QTbIvn3mJHFJcox7vJxTryMn4Tz16R0v5f/UhQvGyo3PxV0JbAjyp+9YnajAdeOzfC7Pdv4JL48j6PMQmNo11lMoOyms8MBdH9Z5wvEM6KH9JTXILbhilKDulOePDOp4IJGfELM6u4Eza/jIhGSm2uAFsx1Em+wBMWqmqAqeLZc2eRV9bVZuouPOSufI1MzOO0VYvjrQ1kpdgbNB2COg7eXWhKJXeMxjnR5sBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lg3w4pQOvSjLZ+uKSta0My8qpBcODSKEG3aNIExn7XY=;
 b=qIZPZoMavMi21eIt3BTrF6bGfvuN8i7+hKRETwBRJAbN93xfir95SDHpz7lCKMWMtv6KqTeZuJOW2WbT56K6KAJcmNKRvFt1cQkBFb5zfeoC42XRq/gp24gJ+nWarN5fz091iXVUNeBpAWmts4RA4lIpgTh+ATq6latYlreCQQWPvb5y3KF+xxw5kLH2bCI8k9fjbtcUhk0KZtatB32FngRt4cjI7Mb/MIR80dLqwDxEt6BRGqkXmVgvMgWXJRI9Kpx/yTGlySUiKowcPiJzd5ho+CuCTWRUCKMoZHBN722oBhlxkOpslmn0wXEcjt2Up3AgH3oWRqJr3Ei12Kctwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB5360.eurprd08.prod.outlook.com (2603:10a6:803:132::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:07:47 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:07:47 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 6/9] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Date: Mon,  8 Aug 2022 14:07:31 +0200
Message-Id: <20220808120734.1168314-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
References: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b54ef5cb-8c72-4136-c6c5-08da79369bd8
X-MS-TrafficTypeDiagnostic: VI1PR08MB5360:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0f2vvqGIuNaTiZPgPQW36bz2OxU9nvzS78AL/Cw6BWGGNXxHdu1ipPMI4g24Bh+3tJe02PbntRwA8mbDTPJUR+siyuO8ZS6H6ZwLU228h0oQO9vdb3tTegEVlVFz/sQu1bLU3WnnkhiFs/iuUTaT9YKYioaySJ0fmUKHtOsI139KCS97eW9GjxQFEBTfRg3dj4G6bZJjSbVaEpaAeVOhY6HQj1VQMNKQoSZIwyXkFT4JQsYziZUjDz/y7cQwspeR0t40XHNIc9EvBcyVnJaNmIHkLtIQAvVVzVmrBiis37687tXtJ9H95abDK406d80Ae8r+8njLzjQTp2Kb+Dybbx2XysdoIfsEFMx/ifY0qEysh/WWeoTbRA9/Rq+D/xJQFGAOia0TRzO6EPdCn3rsvnmwG2VwTMMlXUsWljaFFEGLz2SZNjW13Xsyj/8DH/WoGZW9KS+6fzGZ48rvcaRjcdYYRvVEyn+zEJ+Kk9xwmtIMcPCTUxiBI/qenHJ+KbHpv7h1pvgjx6K8Eque9u/6ZulTSUD+WicwVXINs0FJPNDODF0BYSzDGzMGBT31S33H2rnuTVGxgpVutRVUQ9ubYvghDrSPQdCEKFCosN0citi9o6XuQuXNERCF5fsIpVtLFbKfJkmUqrDqitqN4vIJZggAN2lwZ96N8LXWMsaCD4bnl1TajBCh7RAqTLwomocFUJdhCMFdrMMncwyWeQFLHQvqUHTXrd5QHjQWpS9vlr21LFTJysYiazeiG7pIw2gISYGBavT8HLmqE37FUK5Ra+4qjRGy6Vs/7Ml+zXmqPJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(66556008)(66476007)(8676002)(36756003)(4326008)(8936002)(186003)(1076003)(478600001)(316002)(6916009)(5660300002)(86362001)(66946007)(6486002)(4744005)(41300700001)(52116002)(6512007)(26005)(83380400001)(6506007)(44832011)(2906002)(6666004)(38100700002)(2616005)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qJJdPc6VQf/VQZyM1w3kzvo1ZAXZ5QS28/Nk8hq2udMPCDC+aFpWJiKZ0NSk?=
 =?us-ascii?Q?YCO3TchXLRAI9JQh05fcQpqu8hpjsVTJfaxqVue4c3IKNYn5uVgp+AisII2h?=
 =?us-ascii?Q?dDQB9+AqgCtEajEcchwp61A9/5+mbEQ+JrHTo8di44zb9MjBc2u19jESgUuK?=
 =?us-ascii?Q?U9/oPdhrNCuWJfDQLw4IAxiE5NkZBCbUl2EJ1zdAPvC3J5IEMYbxnw1YVmIl?=
 =?us-ascii?Q?ir9Gtjmg0AZ5zHwJ8omr1Juz0AJDTd2pXyeaOjbLiksQaYLUFYGuq7h23ObL?=
 =?us-ascii?Q?t2c3n921Xscgze79vqA/35yo/Cb5wdAsPjYVHhATH4zSZOlejiF5dr1Q0Mua?=
 =?us-ascii?Q?YGgB5ECXk20O3s5lBeKa/Nse6rgnRwSpJ3w3DLragYAzYcgH7VOJS4QQ8MFV?=
 =?us-ascii?Q?FAFPemFAXcS7YFrS+EGZlL6a6LFOFA5av6wF81gKFrcSsDHZiTEFJkdAJUUS?=
 =?us-ascii?Q?M+GENavd/t4KAt+iLiPPBXd+bdPzGP3OGVKNAiUd1QaEc6g9r/r8fX4f4yM9?=
 =?us-ascii?Q?haWVtv/Q4aD2dCFrtFQFvXGDA4jbAoaYJyDhslGMqzwBMDJDsLXrXfcK1I3d?=
 =?us-ascii?Q?kVbo4s1oYl7VjpLRmHleML1sfeJzQGWMxpj8E6NyQk1zECn13DcDCh0saqVl?=
 =?us-ascii?Q?TfpcdA5eqoTghbsou4xzQxuekYfOefaH/dWpYlMhIgR0kmu4FmStbV8J0+bx?=
 =?us-ascii?Q?uD/ObskjTqmmpLOn6NYq+Q8yR/rHK1R5+X9ZX+R10rXRr1Uh1AHKVjYncRrn?=
 =?us-ascii?Q?Qq2B3EUHibsXb+8Me4mOtCpJ6lC7slUU02ehIt59Sj2lO+m//bM8nZHsynXq?=
 =?us-ascii?Q?U8GcK+rlqX0JaIwj0SLC/7MUi0s/kh4I50kmxCZpq/iHPcHk/PqBat4DXADo?=
 =?us-ascii?Q?kuMxNlSszX/khRJjhTTZU//xJQQhZmuFb+LPkinIu/HiuvKUTmbcqTX3XrpQ?=
 =?us-ascii?Q?cGULooz0WNJzgmRjbgbqpxguqIH5C9r9JAP2+BoqMS0NhjsMDZknjekDSLQf?=
 =?us-ascii?Q?eFjrl8VbYvTb5mRh6ovAl6O433fLjk9JgF6S45BRTGwKazDHk2tVGCfkJc3R?=
 =?us-ascii?Q?7+yWihCKHkX3cGOBJfu4VjNrQEODlZWUxWDiJ+PQoYKBPwqFWPAPXdEfrvTL?=
 =?us-ascii?Q?YBSR4V9Aysv7AxAy08eAAye/ecyhDyaDFK8hEfJ/UkUQ4Di/Q7mrzTpVVsNP?=
 =?us-ascii?Q?ha4NAbRy/VjXQeE866a3g/GQoA5IMW6YFFGQsp1x7V/9eeSJsIAnzCUsgdLm?=
 =?us-ascii?Q?6BoeVQ7ZyhgHZlK/mSeHW9Mfa0QkTDMBCUtYLGk3chh0SVX6rQ/h5WjAK20t?=
 =?us-ascii?Q?RUgYtO7BXCJMgyEkyqLNBYsab2b/W9yT2DlLva4agV4p76BJ2DnsAjxbdUi7?=
 =?us-ascii?Q?YWPkCBN/Ra7IhkZyQ3Mg1XbeDdMtO/6CWu5UWvr7AW0DkzG8yIdXT1Cpj6e7?=
 =?us-ascii?Q?3zfTnVCe6Fh36ScJvCZnxKGjFxoQH40n+x3ERmO9k3zeYV9rnG9XZDj6yd/Z?=
 =?us-ascii?Q?J+zjbnoXqzWPr7xj1Qh/Xc7xl+lSz06C31vGIfLh2ZOmugl16BFMu8gEuGIW?=
 =?us-ascii?Q?vgz9wbQpqhNxcakAkWMi+AMuK4r4IkXflEZVwvE91tyYnYiG4GdNoMjDJJr4?=
 =?us-ascii?Q?BPoXGW5ZPfZNjHaw+K0FPgo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b54ef5cb-8c72-4136-c6c5-08da79369bd8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:07:47.7635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUbKcqFmPKaJPILpL4sD3AUNJxGxNQM5aXKuAaUR+0LzkFGpB01R5cbX875Hw53NsoTwLCVpXz1WriFp8VGYi9AlasReag0BS2k2gWNY4pM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5360
Received-SPF: pass client-ip=40.107.6.132;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Replace the way that we use mutex in parallels_co_check() for more clean code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index b0982d60d0..3cb5452613 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -577,28 +577,25 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     BDRVParallelsState *s = bs->opaque;
     int ret;
 
-    qemu_co_mutex_lock(&s->lock);
+    WITH_QEMU_LOCK_GUARD(&s->lock);
 
     parallels_check_unclean(bs, res, fix);
 
     ret = parallels_check_outside_image(bs, res, fix);
     if (ret < 0) {
-        goto out;
+        return ret;
     }
 
     ret = parallels_check_leak(bs, res, fix);
     if (ret < 0) {
-        goto out;
+        return ret;
     }
 
     parallels_check_fragmentation(bs, res, fix);
 
     parallels_collect_statistics(bs, res, fix);
 
-    ret = 0;
-out:
-    qemu_co_mutex_unlock(&s->lock);
-    return ret;
+    return 0;
 }
 
 
-- 
2.34.1


