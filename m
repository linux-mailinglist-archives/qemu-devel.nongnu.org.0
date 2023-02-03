Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721CD689372
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:20:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsE0-0007A9-Q9; Fri, 03 Feb 2023 04:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsDu-00079i-20; Fri, 03 Feb 2023 04:19:10 -0500
Received: from mail-dbaeur03on2071d.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::71d]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsDs-0000ne-1l; Fri, 03 Feb 2023 04:19:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SH1uClgif8YqtBumg/4/Mqvck9iMKzEl6Ki12zS909th/epMC8SClzweMudxrGTO6p0kcO6pWWCdJeO/Qz/2uLTi2+ygoWL8G/1wZH0U8LBfYkFshYKmDbPmYFGzwHbrTXnmTsnvsIMimBKBzK590G5UFsNmPMdg8Vmc8qOzUJ+XHObCPKzTolDbgncyAV2KbdEFpst+dTdX5u5PMrIK9Kfetnpe50kiWvpy2ajHUIfaAc1N0lXFUpwRqPXK/uCWycxu7YYTWYUU+LQheQRS2vson3d6Ym3XnrsVJ4kKXV4GK8qvLDOblU5oDzq3rOvgRZ5mZOXeDDCrgOWmmtgQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qF3NOVPO0k3//yRzQXkyNI1yCckXNC+VUzpe20je6FQ=;
 b=gNmRZ8DL9Sugyi6RJIv8ebx2gmITHaPXD2KIH7VfmwrCgGz2P6axJY7qsaapD6pW4xPh8E0s5QVRoN4qr4xDTlvrokCJNgI/0/PH7TY3KjeXLXA8Xc55rON83PiyWI/BA69I6+aVb4jP667yRDvdfmKl2q87igduzgS6btnEohjT2JoJTUM6ri4XOaHdK9ELIf1wKXrC7YSdrmhxlNF16g903bQj/165iVGm0BgtTeSYQYRnvALwF6FZJLjI6hB+MGWK4BLkzlyv743AImLmdkIZEqQSB1x1cnhT+0L6v4i0mRnLQuonPMa65vw36ONHh5RH1TadCd75usMt6gkyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qF3NOVPO0k3//yRzQXkyNI1yCckXNC+VUzpe20je6FQ=;
 b=aQLYcqvwd7fn6tHQobWS/4hADPOXzhz2hn0k7B9EH92FkGMklfaVQ5pH1bPxfjvDObg36IvEZ9239DWdPOC9xgfJxZe/3YGY6r4SeBEWCBP7aKQb9VQk0SgmBKQq47Foj1Ud9MaDJgzGmelYuBWRedYRwI/sD8Qmkch5OWiGkpq1O5ffamUDj8ZxYvfC2qlkn+Ou92Gyx5NHAwoW1mp/lNk2xBZYRYDUdTQnmvI/VjW9FAEFbTFRQ8EResV+bHkcgZxBHDpz6L/+dsKKsBzqLakHn4sDxZWZodz7WARbnGsPeMbpW1qbrmWdn8Z8IPyicxMiUWIhWdWaQXWtwkHoTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB7721.eurprd08.prod.outlook.com (2603:10a6:10:390::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 09:19:03 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:19:03 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v10 02/12] parallels: Fix high_off calculation in
 parallels_co_check()
Date: Fri,  3 Feb 2023 10:18:44 +0100
Message-Id: <20230203091854.2221397-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::33) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: ead09da4-561d-4678-74e4-08db05c7b119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dtlwPoYzYq6NjZ8ZLTcIzqwx5qOOkv5YY9KagbGe0wYPRueNnpauOxuA8zg5TH8FT6D+kwjYRN2ghi/ggOD1A1g9NRM0RSeNooQmiX7pRP0A8tKJ8nL8guIU2IjH/xfcePac8wvPsN+hxzHJvBy8LLbg2sDfIWUWcjuELsxZbx9kCs1Ox6uCNf4KY8m7qLXRgUOwXvzPjiEc2YOgmXQgC7qk/0OuEBGtJ25ipMPq8oNIATqMMJiR6ue3A22QDoF15P/A9ykc98QAf25eP021AwO4pu2N130L4sHLcaXIC/xGm9DveZjZVja1IGTNBK43EZBqYXyS+/CCl/hQhwRO5Scnuc2scGUB+AWgjDTkFIhabfdQzMlqKKof2DUTHafAbYh24qwQMJx3TtraW703PF8Sr8yopp3lSGeex0+jdkwWFH2zSvoODFHEMvv6OwtxdzoRZSNIXL0xdsbyJ12yPkfV/jwaGY9pszCg5e6MwogL9BEwUfyA1U7NllS4d8DUza0CNS7APri1zLqhgPQRRw/B9CfmK39ZAfjOpOemojj3eRUZMjHJBBI3NCvo0Pld1aoyC6uUu0y/KCC0F4lvOJpmHOIwW7UUfHoIAwydxAF8WavxhO7/iwRQ3TCpcTTsrIN35NqtWCgVA9gIZI6WvBi3eRicCVMJVAq0QtBU+ztY6HyuVkjnEe9oT1qyPc762IldSLpFFMUQY5gVPNPZHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199018)(316002)(478600001)(44832011)(186003)(6512007)(38100700002)(38350700002)(2616005)(36756003)(86362001)(8676002)(6916009)(66946007)(4326008)(66556008)(66476007)(83380400001)(2906002)(6486002)(6666004)(41300700001)(52116002)(4744005)(6506007)(8936002)(26005)(5660300002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gJ5Y1dJFCNmGIvGgkwZjJtrr25nOOEKRMLJkD+O2QY5DMcodOVCf5YhdnzjR?=
 =?us-ascii?Q?HXGzbwNndwd4qVSzRtQmRmQFNruNwNJbcDMgpVvFNYqheVHpOPCB98PecyHD?=
 =?us-ascii?Q?kbLu0UPNh74xBTSnEP2B8Z8A7vZXYGMl6G8TiTH1rQn/OdTGXT3zpEMUVxD9?=
 =?us-ascii?Q?+AC74Zt7luOaUtoXX5GtRB9/UlSQUzKYkDbXCbminp3/+JtuYvr/7JtdpI4w?=
 =?us-ascii?Q?lhPjTO/cG5UnrHkEInw/cqOP9Tm9NykkH4WaQtKqFk8IppzExCglQDCbGS1A?=
 =?us-ascii?Q?mLqPDjJYfnTqXmtW7FU1kRUItQ0/xev+6JUAF0NPAFiCOO4E14MWRK9xOyk5?=
 =?us-ascii?Q?+y4iLna57e81Hw42Ux6wChQh1wOvUoJHFHEaZ4yTEBj+A7EuY25iRUnxMBez?=
 =?us-ascii?Q?PwVclQ5JwldXn4DkXoLcvI0OnX8/pYH3OSoH5Vx7IRf4O4sIyArLG/Le/e80?=
 =?us-ascii?Q?WCti6siEK0xvn4T0i5H0YFOx5SNL25nHVAyLAFAs3pzMzMgV8q9u7HlGFpd5?=
 =?us-ascii?Q?RicGGXpStdVYPsrLSEPLd0LHQHBco+1A8IyjF0OV+JvNjmrREHBRA95Dpiay?=
 =?us-ascii?Q?jteo0xTXxGWTlLZu2RK29Pb5yYiSbteml/LL3aMcXFG4YQpSjm7D2w3jKHxx?=
 =?us-ascii?Q?FCxog/BM8KeW0tu9O2vX6io3sMD/DU8HkQkzF8lmd/zgT3RAJ0PwZWH21Xa8?=
 =?us-ascii?Q?QxxUY73VxeBTg1mF9Ge9IpwV4W9gu8Uwj7FMLC5QerHL1AmiXVWigGpMN5Uz?=
 =?us-ascii?Q?qpAEAZamjHPrewZ2s9lAZW2HaLd42O9g4FLlylE/BbtSEQAipKAmSA+hvojY?=
 =?us-ascii?Q?qph4Imkb/5f1tpXX7AFzD/yf/R44/1wHjLqMfCIBP5snsA7vnYMwzKMP5Jg7?=
 =?us-ascii?Q?QaY1Dp40sS+rwqJlBfBFhWgHtE283VC6jKYY05ShyGpsaTwYcl6TivnGcIjs?=
 =?us-ascii?Q?sjhDycRdvRVqkaCg/C0wTYuy3FRnbJ5mOnfcmFsPVX8akEXzxvfRzYUwwthp?=
 =?us-ascii?Q?GRb0MhwSHjIry/L1BE8dl3swpRJpOvVZI2ej5NZh5osB/johKfSQSHsC/wkW?=
 =?us-ascii?Q?3wzgGtRL8UZ1N4wX5Nna8JplL+C0Y2raxP+2wiToywBAYZyjxeMXAvxRboT6?=
 =?us-ascii?Q?1f3+/k/Gw+G0eSOl+EDK4jzNB1EIypDjQyQhtT2VnXnR3WQMOXFpg4JEUzov?=
 =?us-ascii?Q?7EwygYo7Ynae2KyI1NEgsWnjglNf3xe+Wft1GBp+G0WKUJeQ3/qbeesV+gIV?=
 =?us-ascii?Q?7Sx06g68YePMEIJoPLQkqOkZogyari89HBKj+HrMEHZLb2yIwRYG8xHy85pl?=
 =?us-ascii?Q?hRISK7MO+cwehI0+wT3qYaLrKYozF8S1qTPtOyAImc9caodSNcTTedyr5d1d?=
 =?us-ascii?Q?fDluH02tRlGkIRMnKg6rxGvRL0vaVHcjHj3g2G+V1GEX+wd/hfEVHhr3Im+V?=
 =?us-ascii?Q?1j/Xb0zuQUdwFndXJCpCCmkXu1+Wwju1eVQaEt9AWwArV3g2zmc9E3PECfmd?=
 =?us-ascii?Q?9UyNPzFUb3ErIADStq8ualwR1/UtREzI0wvmBRAS6lxCsEIHDqke7nDyCnU7?=
 =?us-ascii?Q?mVR4gLFcxp2lSDAdiRgniEbubrQeNZOnQXfs9FrcOQPko/WJgSvFXvUQ8EZf?=
 =?us-ascii?Q?obV5U4gsWSW4ujDtr8RL/sI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead09da4-561d-4678-74e4-08db05c7b119
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:19:03.2485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upjSgXhl5xyKDb0nUz/6gEV7UoxjN57L0LrMCPjb/Q2Gx5Goe5E6/wZ4aWIFL06mlx39S5cVRtWxN4PmxHpzPd/ejuLUXCpaYNdEu1PTANE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7721
Received-SPF: pass client-ip=2a01:111:f400:fe1a::71d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Don't let high_off be more than the file size even if we don't fix the
image.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 4af68adc61..436b36bbd9 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -460,12 +460,12 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
-                prev_off = 0;
                 s->bat_bitmap[i] = 0;
                 res->corruptions_fixed++;
                 flush_bat = true;
-                continue;
             }
+            prev_off = 0;
+            continue;
         }
 
         res->bfi.allocated_clusters++;
-- 
2.34.1


