Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D3E4131BF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:38:49 +0200 (CEST)
Received: from localhost ([::1]:42388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSdAm-0007ml-N9
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctY-0001Y7-1L; Tue, 21 Sep 2021 06:21:00 -0400
Received: from mail-eopbgr150090.outbound.protection.outlook.com
 ([40.107.15.90]:45198 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctV-0002Rp-RJ; Tue, 21 Sep 2021 06:20:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4w1OZKMrpXCmk0QXUaptm9mx7OaEjmZBlcBmMHNI/LNFV3140Z3sDW1tNbzRLT9q6c/HUGZWiDtTYHrGgrss1pF6UOA27leTVLYoMWNU5x19A/xjGX3X7Lmxkl7W0YPlnoyYkkxA6FdILxKBdqSlM7eG/kxUoJ6YsH45b/dB0xNrEMsF70miY3BJAqJ54h0aCip5kiUdluaRlpBlg0qUekGe/q6gGdUbVMceWPC9k7LtgjhAlU2Ub2MGlqmA6D6VkSEAtNnSitT82O6XnqFBdsvxfQuZ5+TjVnxaldZ+ulketu7glEheHFSSJVM9inHaLa4uniK5d2NhNnUpc2jEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yMlHwE4hBTnh9KPOMXc/DRBB9UYTvR7FJguw5SZSMto=;
 b=PpDolLY/iWS1oXXgzdBs/up9Rp5jXErh/feO83kq4DpsAxmXFFs5w0kTjHTWE0fOCvJQFKA07ZbKyhEMOYtW6fX5OhpR3jHZth7V6J3AEirqRVPz3kRAUNQ/XRiD3qPV10lign9VlKsl5zwhhbLEZV85lnb9xxReyoEXCcKrwbSmB/r9upfX7iS6apCO/IBJ5GiKtorf56GHWmxoSe8sA5y+nCu09wCzOaRCfFdnFG8F4J4sp9tXGToPG4PcvbMCaMnsfnbbuyJYSf2clN4m33mnyABNGYFfXyWKY6bgWKsYqA00uc4+4WicQB4XCkUZvdxg+07ldGvXS/mAZI0IDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMlHwE4hBTnh9KPOMXc/DRBB9UYTvR7FJguw5SZSMto=;
 b=Pz2hIwL09Zy13/sKSykJ1PLNk0XK8/YDC4W42domrEsExxxvmFdLTIoLtnez4+tMeaF8JqzZQZdqiFFJGWb7FJBkTfj6NmRxEKnpKDIHW3TQSxYQagsr6ST3zoQRR399QucOQCQQy2QLmtU2Bv4fa05Zf/pwdVPfdWVLMN6Kwhk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 10:20:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 10:20:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 08/12] mirror: Use job_is_cancelled()
Date: Tue, 21 Sep 2021 13:20:13 +0300
Message-Id: <20210921102017.273679-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210921102017.273679-1-vsementsov@virtuozzo.com>
References: <20210921102017.273679-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR06CA0127.eurprd06.prod.outlook.com
 (2603:10a6:7:16::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.205) by
 HE1PR06CA0127.eurprd06.prod.outlook.com (2603:10a6:7:16::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:20:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55a384b5-63c2-4c2f-d1ec-08d97ce977ef
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5944353F4B176ED354FE12A3C1A19@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F6lJy4nF2WjfsihAERS5YEefMrjdx5nQhMbJcf0UHz71TLO36uWIXIY+9HRNp0ZjcqC9p+jI4KlCaZ2SWN+GZUrBx+49eWCkRJ3yqaMXhpDf11m6iCQWyMoS7bgMxd8qJI3CS+HNGS+fe+qipKQDvXBO6w4Na+wI+V8oMohOkcZIwT7w/c6V5AcbJM80HeA/cQyxUWrs0Z6qwDrDDvzlNb4xvP1nJWuFTHeotE2asaKlp5Ghfvh6pPE5L2WZCqwEYwgLskd6gBi3gB3VAZJu9ud/wmM5zUjd4N2C3IrMbSrCGKAyZ9k7mQG+fP37GT4w/Q3VEgXpKJ3eLHizMi1ZURSPUEkoBGlMNXgk2tzKdc4V/WP/uK4OaATN/vtZgcEQ0UDNJey88O81I2bEHnT9H0UF69szYoI9g8REKCIWkvVwe/lS5QhStzy0nybPsRqTLChmz8xezX1sEuP+OTHxWcZ/5/a3l0HACl6M/5SkRFauKp3QLLqeQyZS4U6FYJtO6f6m6je3w/YBeUx9yQ4ART5QY0RM8ILsEAPqCMGHQVxHh5MJ1rsTwOYg6/ObFOpcsmmhX42roB9a6w0tLZgZnIpk/tkKDmA8nuwIr7dHD0Xda4YdA0Ua4G4s+cC0DSHTOzgOgb3KzVfwfAn9y5yINhB0ESardRYYaJemeofbZRSmVGn7AXOkU/DI0qFXN4jzZ3r+1zA7FdZaDO/dNp+Zvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6512007)(83380400001)(86362001)(1076003)(8936002)(6916009)(186003)(38350700002)(316002)(52116002)(508600001)(66476007)(6666004)(66556008)(6506007)(2906002)(26005)(36756003)(66946007)(4326008)(6486002)(2616005)(956004)(38100700002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UeZ+uZGfCQbhDOOh9N5yzATGLanX9sk2u7xhHnKgxXjj6NNose2lHc24A4TF?=
 =?us-ascii?Q?Q37kJg0SkTeeN4ikdYmi2BFho4XOo8zRkQlfVG5HJLKqAqB2KV92Z7n73bhx?=
 =?us-ascii?Q?Jfr8Xl69sJC9lolkgUHAIE5SxEuPMFONkTb9XvlO9B1BiCJ1tAWvCHWHFpUe?=
 =?us-ascii?Q?PHQ+p6aNfDmylexvBY0HflcwZQJ8EmEuJ9uV1fv4PyeSSpcUS8HTjE1ngrx+?=
 =?us-ascii?Q?ahwNKPZnnUUyDZz4ZS5YzGyCNhxck/1nRBSkPr18z0NE8jRL9sACFdl5BFlr?=
 =?us-ascii?Q?RyvRqiQHM3Xehg8vKWZgQj10i4spPTNUTYBmaYHFpCq2Wv6eQP48KUbJEQmS?=
 =?us-ascii?Q?ek5INA3p7fBQFhRCOMrMU6Kiqv3Y3vO45xYkuN5N9SCv8LEzRsSbOmYj3xMu?=
 =?us-ascii?Q?+PkeXct6+rM7NPtgpqLnuoJXiatERtbyP32+ST49LM+hxBmW/IobviOfpHdK?=
 =?us-ascii?Q?n+K99JUs3wyD781nFJp8pmq9QAZSafhAuaoBTo1lp5BmHeCAP/87bUHLQfg6?=
 =?us-ascii?Q?WrIhfm2aaeSNy7bvvFHd7CGnNrOhnZbBD/MCwpJaQaAQ7JH6tV8MvstnFFnY?=
 =?us-ascii?Q?fv4cjZHg9+4hRLDoMCtkro+d5/LMjEciL7GSJRXrW9GQUROgGJQAj1raSW5N?=
 =?us-ascii?Q?ztUhHla2VKlk8lgVL/oErugYLe0Uba64CpJrWpI0NCpqEfoMnt8vGypnNxu9?=
 =?us-ascii?Q?mF3Zbu9FipAJjIX+h3nBC+0xbwIL7lSeV77gRtz3QmfHSC9guMP79tQE/iNo?=
 =?us-ascii?Q?ru9ZSXGtmNDf2ox0+ddx+Ai4INxeyhzRub/DIAkvrlYv/tnWSKt6fxVlTGCa?=
 =?us-ascii?Q?+H5pWmTCBBdWN7hk9oSH/9mBFGhOnUi7p+PD9fJGJB6YYOd1hBrPEugxCAo4?=
 =?us-ascii?Q?IOiwgj7HoffYI6tiuKrLf3W5dEqjxgSci9UtZRNVtinbfx5B7Qw7lj23Xq8e?=
 =?us-ascii?Q?RiDpvtwlgXetCsMYnwcyZYkFqEbfu7Yt8LnNldMNL6lIu/nXPqJcmlHGNVHa?=
 =?us-ascii?Q?rMINh1jufkFy1GLGDGpITyy3U+ONy6C95i8ajyG4vYKcI2OyZD6AsiHtTzh+?=
 =?us-ascii?Q?24otXLvFp9EwWWQEGJSWDgpvkSvzB8SY3engPkD3PhcUn1XBddzHyzpGE8G4?=
 =?us-ascii?Q?SuLS7i7D5bHxOB1U9vD0yPlM1JcyzVxXDoPcKxnr9vLtTMDoTit0GrEc0nBf?=
 =?us-ascii?Q?Xfeihv6eyBEIhkmN57JuLuKgjit0AFnGNbKHLEQQvMk/RAlh/QTZsYpLaIGN?=
 =?us-ascii?Q?yTavn8pqosnIUtvx7LTYzhLHPscwxXlhKJcvw6HSJDrQiJHQ9wpeWj9tX1vC?=
 =?us-ascii?Q?TYjm7ki2u9+m30bz7rJjbqcC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a384b5-63c2-4c2f-d1ec-08d97ce977ef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:20:43.2499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5fB5M7gtqehd9FaICgbPfuTsJXDLJv0RaSH+Fsw6zB5q2LPNNgb77rQZDZISkbRBuuyUbffh4YK6o/XSc5WDlgnunOe/qtlsIg7fZziD/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
Received-SPF: pass client-ip=40.107.15.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

From: Hanna Reitz <hreitz@redhat.com>

mirror_drained_poll() returns true whenever the job is cancelled,
because "we [can] be sure that it won't issue more requests".  However,
this is only true for force-cancelled jobs, so use job_is_cancelled().

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210907124245.143492-9-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/mirror.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/mirror.c b/block/mirror.c
index 6c3d8379f8..cfebe50845 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1184,7 +1184,7 @@ static bool mirror_drained_poll(BlockJob *job)
      * from one of our own drain sections, to avoid a deadlock waiting for
      * ourselves.
      */
-    if (!s->common.job.paused && !s->common.job.cancelled && !s->in_drain) {
+    if (!s->common.job.paused && !job_is_cancelled(&job->job) && !s->in_drain) {
         return true;
     }
 
-- 
2.29.2


