Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C997A3B43FC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:03:40 +0200 (CEST)
Received: from localhost ([::1]:42406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlUh-0003f2-Q9
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRg-0000cj-Ae; Fri, 25 Jun 2021 09:00:33 -0400
Received: from mail-vi1eur05on2100.outbound.protection.outlook.com
 ([40.107.21.100]:13120 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRb-0006Cd-C6; Fri, 25 Jun 2021 09:00:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYLjxDkwZ3VW3AIXE8zQw4yL5768twiBO8GFqtOxyfAH/ozJfL/jMkySKlRGhYq8Lye3mH0M0RXUG0nnZlnR13Q35AnfsoGO6M4nDwJEmJr2a59VnhyGGWwpG+CfZjzF6bmYiLn6RJ+DbmzVoJ0N4zP8hc8qYouo5FFMV8fAc1g+NJqC4C5SnfSmvgdoGQsHrh71QrBQ7+aLAia1iy4KsksgRE8NzSngYqSqhhrAAVIjAKcjGeR6KDzGgWtHRESWlAEVc5n5DiiPfZMmOylOjLYi97rMvXHPdJKVqNDbXAtld05MB+l79jlU1WJ2BgIDjj4AiCsTzWIHfhZFuKR31A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA3COITSVeE0ZDC6pPMu1nkj+OmAtnJSASxa5Ml65SY=;
 b=RPiKxNx0G7SIp8AdoDTjCBB8gbS7Vcb6U5jCBkKJm9A6WA2iy07EgGCB+gum2NbE0Ao9EOSroSeGxpJ4CZ0OWISG/Ci3mn+V7e/EasgV1aV0OiG/VVPSMfgTzCe0yneiyPxBg+lZV/bZ1d2lQXkFnzlj1nwmPzlYHbqeq1XPu8gimlvKURRRFQMw9enB57NGl2yuL71/RMdfBhPmsUeQr4ODqOrhRzOlxBZ+/crzCahsRhogtqpvbhSuHRSdJIJ+lbdlzJmFriBWg4pY6Wwh8Rq+YVfdx8g510Z8LmjhQMe2XIuzJ4/TNOkENxN+h+lOgwP7HQqOw9IO8Fk379LovA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA3COITSVeE0ZDC6pPMu1nkj+OmAtnJSASxa5Ml65SY=;
 b=oQ3Wh6j4wfoHdxbP3GKgTugWA4hoNzDPhnS2VI4Bh8XYuRn4eFirdm3gEYg5KtxpsKslHWp0OupmldBv5UsS8uLMi/iD2J3exWiEP9klFQAWdxj0IaNJ7qiF+HtC6w1Q1UT0Zv+OHJ2kFLpEL7wBJwufHdSm+aa49AODqgWoteo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 13:00:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 13:00:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com, peter.maydell@linaro.org
Subject: [PULL 01/10] ratelimit: treat zero speed as unlimited
Date: Fri, 25 Jun 2021 15:59:57 +0300
Message-Id: <20210625130006.276511-2-vsementsov@virtuozzo.com>
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
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:00:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 652c2d7f-c11a-4f41-2fe7-08d937d9314a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16520A4424410468E3011593C1069@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5FjyWbX5/x553u8V+bi2fYn18QINuUNFSGJbt2C+Gvuyd3U3/xnNQbRQFDaln4numzwGpUdHdvEn4qxMw/KqL4k5yakkWqUR8Q5OYagfvBNj6fWixsLQs+Nz3EYWGz4rYvSiSA1dqPlICCyuOL/0h3Cy+oM4DzcZ3gdEeWJpP8omm7in9jJTxY5kkBbmXllQfrSDVnH4LWiwC3O62vmHsshTlA7SXbG6I0IVpMGeuTVbprJ6NXHXBFDhTcIu8UOWjjPb9CHNorTd7SERq6wbf7nssihve8qycqp6YheFSRxXGbaQq/4E+vquWKtdSCHlw4+/JM4zdVOFemm1bkxLF5O/X3dm0CL/TFoGoygocQ6dOLBvmDBwIUWTUvL3Yqdli8FvpEUs3oCOmUIP+iLUac1yXCjVw720nOYkGmfRZ+GRAEdB7y8hOolCtWzN/3q9Cofb/d+XpEHZUNitIlMdQxevfahfg2GaaKjvV+z1AsCKNKEAGh8V72lUugUOwvlYv8SUq9bD8vOjDG2uiYwl5VcvoZyrxzPgTzxUJXxXdLd1sKKBpIxpLcaVerCH2OQrtx4RYStpf1oljXr0PQ1gHfbP5wLVi3vtRnydo2T3Gpi9W8nz9zTnvBeYhJRknIwp4YpVLsq2/egHvhROWVKk0rh3dKfyAVqtQ6ujMAoJr4JiQdAi9hls4DyQRmlUx5Siu6qZiZBQD/h/KWyNngkoqeJoqnBhv+YR1I1RprbN8nV868opwfBiQtFSDyD/xrQM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(396003)(136003)(366004)(376002)(38100700002)(38350700002)(52116002)(956004)(8676002)(66556008)(2616005)(66476007)(6666004)(2906002)(316002)(8936002)(66946007)(186003)(6506007)(16526019)(26005)(4326008)(478600001)(1076003)(6916009)(6486002)(5660300002)(6512007)(83380400001)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5AnX5pHWH8oZijInHdZVdGGNC55DH79Ny/JAMH9lcQXKd4dNdqtXLDV/XIMU?=
 =?us-ascii?Q?1T/ITrxxY99ni0C/4hf+2W8XJdQ3zIoSHYdjItjiEsyMmG8G3jFqTsg9bMUR?=
 =?us-ascii?Q?H/a6bgtf6R9RZor5sMcO8/injne+Nvp1yRaNzhyUhzZ1FPfwYNeU0IYjhey9?=
 =?us-ascii?Q?JS6O4JvySwXSN9KP4F7Tt83oBl2/VVvqE2VyY6FKAZAUJ0kB0c4ygsI2960E?=
 =?us-ascii?Q?b70sO/SgYg0TgNCq69jRq/QM1ioGwJAjtmOcTB0SbQ7kNeFEW45uqJ+JzS3p?=
 =?us-ascii?Q?EbgsPzf6oJoDzhMxzx7UUcIMTGuKiAfrJkduJcqVODSyMRFAqUL7MlRvMRuR?=
 =?us-ascii?Q?zRvl9Lexlbg2ADSAzZpi/LOr8Wyp378xpBwpYzBjkjjP1PGBdqptby+ojxEu?=
 =?us-ascii?Q?bW7UYUCf/ytm3SVCcxPLF2lsaj42mVfLLmG3UHNyWB250X9agAv+CJL1SvBx?=
 =?us-ascii?Q?NTDwktRb15DmVwtLkmdOj0g5K/fSwS/m8zXKwB8eU3Ypwys+E1Qr+AakK0bF?=
 =?us-ascii?Q?ne8MZSV0ZEftSuNZ/9d8ktt2rTAOoB1oYbOYKXGO969+4Us27g8EwqIuRPjg?=
 =?us-ascii?Q?LSYQ2tUynFYwdHWvOJ5nZxBEXuafXWIS+rDCwgvGwzKE1P3UYDsA75fSP7ZO?=
 =?us-ascii?Q?/X8rcWvQ6kKmOxcJzVWLvDsKeVKfmlw86f/QaCIxQghZ8+9b/Xu+/7tViIdr?=
 =?us-ascii?Q?WviPUTQ0pQtJLje9c52aowT4IjSvU5AC1pBYVoswq4EErjDQu9um1QUyluh3?=
 =?us-ascii?Q?2g/bBhajlNszvEkNMh2iOpTxn7nqBmpriRWNYyDRKetQJriVlfc/UZgYIAiJ?=
 =?us-ascii?Q?YJJ7/cJ8yzcJwlR0Kd/cQzBggTRHoFR/FrFkxOPHKHhXrvMA8ZUoX0FuHlBy?=
 =?us-ascii?Q?+eGlSbetYurdYcwfOyAeu7ImjNG81RgOtxCx9jdIJEHih8X7ECGkEagRuT5J?=
 =?us-ascii?Q?RZKD/C2dZkOEBybj9A/aW/m9cMCeeBEi3hDpEp3SYuDF04GHkCO69UM/ztzx?=
 =?us-ascii?Q?Mf06tLojwaLxQvUNKbLbNOZGn49UsSKshGnit1Xl5l5PtqYgFxLBUxCWByul?=
 =?us-ascii?Q?QLlruFtqMmBMSEL/dHPlbGg65imwj7p0htIIEbvQ+ARb0hJHb2o5lpGhhhPw?=
 =?us-ascii?Q?NTv88MBKIlk7UvkYumVJkeKvNRMBo49hxwwk6WU3OOzfa18IE/jMKgHDtOJC?=
 =?us-ascii?Q?gEKsb4g/YHSeVxNgBceTN/u2KzBgLvkJNIOv0Q+KH6U7oF2ClegB2V3izHKe?=
 =?us-ascii?Q?5lRbwsH7XkbI9EuZwB29SOQXMpTFaCC7QobmdOf1iYtJOjBRQjzcIUFslPUI?=
 =?us-ascii?Q?eC/bXJrKP2Xnce/Ypc/ZqFvu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652c2d7f-c11a-4f41-2fe7-08d937d9314a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:00:22.5445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8CNm6+nMTvYK2Ko8pTNzCqgGHja+aawrFUtJoyNAhmRtuAtjCd/Eg+451bgB/zl9unIwqudL8tYjF3p2e4kOM/FgJKRpAbMbP3GTxgv1Ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.21.100;
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

From: Paolo Bonzini <pbonzini@redhat.com>

Both users of RateLimit, block-copy.c and blockjob.c, treat
a speed of zero as unlimited, while RateLimit treats it as
"as slow as possible".  The latter is nicer from the code
point of view but pretty useless, so disable rate limiting
if a speed of zero is provided.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210614081130.22134-2-eesposit@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/ratelimit.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/qemu/ratelimit.h b/include/qemu/ratelimit.h
index 003ea6d5a3..48bf59e857 100644
--- a/include/qemu/ratelimit.h
+++ b/include/qemu/ratelimit.h
@@ -43,7 +43,11 @@ static inline int64_t ratelimit_calculate_delay(RateLimit *limit, uint64_t n)
     double delay_slices;
 
     QEMU_LOCK_GUARD(&limit->lock);
-    assert(limit->slice_quota && limit->slice_ns);
+    if (!limit->slice_quota) {
+        /* Throttling disabled.  */
+        return 0;
+    }
+    assert(limit->slice_ns);
 
     if (limit->slice_end_time < now) {
         /* Previous, possibly extended, time slice finished; reset the
@@ -83,7 +87,11 @@ static inline void ratelimit_set_speed(RateLimit *limit, uint64_t speed,
 {
     QEMU_LOCK_GUARD(&limit->lock);
     limit->slice_ns = slice_ns;
-    limit->slice_quota = MAX(((double)speed * slice_ns) / 1000000000ULL, 1);
+    if (speed == 0) {
+        limit->slice_quota = 0;
+    } else {
+        limit->slice_quota = MAX(((double)speed * slice_ns) / 1000000000ULL, 1);
+    }
 }
 
 #endif
-- 
2.29.2


