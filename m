Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA06388A2C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 11:07:46 +0200 (CEST)
Received: from localhost ([::1]:57392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljIB7-0002ER-CR
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 05:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljI9L-0001Lj-IE; Wed, 19 May 2021 05:05:56 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:23783 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljI9I-0006KO-K3; Wed, 19 May 2021 05:05:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiViEv+8e2c65rDxG/QWWRwj9EHUZJPdea/GKn1dn25KewoeOFRSWVYeeO7LdyaE65qH4PlJjT5hDgOkjakJZPKkwYZsQzVWf7LjO2xjqhbbpfpn/NWwe0FdSLFJ9dSjj9BtkVmrFcE9F2X1l8fqIJnXUY/nd5eCKSLpdoQ+fUY6OFK+obFREUDLJcbf5la2Hr+U7quoDEJ0TVJnY3GbqearErOxPg3ZxYFwEJj7zOlaJT8EEF/rAC8p99ILohtM+jJLvV4v8VA7lH5MgsxtkZ8h/N2qo59BcTRLB/LDQgIUqYwT2el9RzKMqVJM8fOACEl15M2Q0+/8Bf7C7+JW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jABq1thuZxGXeO5ZIWPblyNZEwo3AJF0vKMPdUDV/Q=;
 b=ZSHQ28RHYOgByTf0hf8jNF/RhVGaD4tzQeGZi9X63Dj5Pyyi8DOhK2Af8iwTrVbrqH1qT6Ey1f2V0d+QPInH3tnaC0VwSMVxF6i4fBbRI/RDONsoi3ZhP1jhvxvngFlSTa97ijBqRqWNDyl60z4f8wUa8h3eKXFy053yn2C/BSwF1BPIkKoGO4TCw2JK6wUYElhVlwh2pOTFlkixqcl5z6GQqOUKUJbNpyCH7mEGY0xcyG3rci8UTSSiC+hBb2G6OqAWggktZ63D0Mq3jhHdzr604uij806HQf7CYUWUdaDobmK5nWUJiAC1StIojkObbuYtZ3n/i0FyBq1fQ3vgyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jABq1thuZxGXeO5ZIWPblyNZEwo3AJF0vKMPdUDV/Q=;
 b=iMwJJUi4Zcbe4bgiI8JF1Rooifg0HFrIB8QOwNhH8dvdbaMmu2WOeCKGnveY4xC51KNpNCXwMr1ZJXiKm0pwBfBIiSvh7UUM1sdImWTwPdi/TPIn+Z31N+0I8qVk6nH5wuR8+728/u/xtILpVYHuGRvLoN8kUjViKfHrR99Av/0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1841.eurprd08.prod.outlook.com (2603:10a6:203:2e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 09:05:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 09:05:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 stefanha@gmail.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH] qemu-io-cmds: assert that we don't have .perm requested in
 no-blk case
Date: Wed, 19 May 2021 12:05:32 +0300
Message-Id: <20210519090532.3753-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.218]
X-ClientProxiedBy: HE1PR06CA0140.eurprd06.prod.outlook.com
 (2603:10a6:7:16::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.218) by
 HE1PR06CA0140.eurprd06.prod.outlook.com (2603:10a6:7:16::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.33 via Frontend Transport; Wed, 19 May 2021 09:05:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5ace4a2-b1b7-449a-24eb-08d91aa54a55
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB18410095AC3DA0E45CB73E0DC12B9@AM5PR0801MB1841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7r20neFLqB/eU8QNjCPqox3MaypCGes8SONtJmvggXKzkMO30TMytxkHP2/bB0fdHs8clRvE3vjpLh5FFDWSY3SxPs2/okL9Pw0W6hBm8REiJo7E2+KobdqRNJi1WcBaNEJMLK+vM5wbc47/W8nJFh3vz82fHgR+2uYrwy344v1s2SI0LTlsmJAQBZJheQTcPRGjd7UukP0FBrEQoE25YTnSBpfZEsciO1PAIApzJFACARzXlWFx5fSRDpg5ThvigSUpmTZeZsbRrlHrXazwyoR+eoBw93yiWRyCum9W/TCDpvdbXUURonCW+h+hb2QlJtDRUWchB/QhaBnCBGkinGuy1rOnVLjIjkaDYx86qcskfMF0x2osLR8li/KJ4avUEKcNEvx3Dyr4CJVW1HvfuAjsEBaHD0o72IkR4tNsJs5ygnsQMe6F11Do9L3te2CcaHq6QTtTTjwAGhhyAs4l+ysSY/rMmA74oUlyw4MtY25yK0XJSC//0d9PjRyueMZh+yjszyNlD8z3O4ggdFCIsEMf7Ja+hptR/CMfRTWnhhZQoXbOPZNgZQFMrgDxGzDwvEPjQYalBrJTW9nOUNjVB+xa/SfMceRLZSad3NmbMOQlaDztYkQrY7GBSOyxrjzclgzZjgh4gefWPX+Pr12gy2L7JLG0cEs0vaPahlvTDKcokUNfG+GLhnCLSccWyEcjk3tLGRjdkRxV9d+OTZUMZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39830400003)(346002)(136003)(376002)(8936002)(4326008)(6916009)(36756003)(86362001)(6666004)(38100700002)(38350700002)(5660300002)(6486002)(83380400001)(107886003)(6512007)(6506007)(66946007)(16526019)(26005)(478600001)(316002)(186003)(52116002)(66476007)(2906002)(66556008)(1076003)(2616005)(8676002)(956004)(69590400013)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iVn8glBoAMczVX+kg2wItWm/VdezNtjGFunHpn+Chp70M3q8o+rubJdiRLfU?=
 =?us-ascii?Q?1X6SivpLjt4V5toznYbJpasyyK2tdKk6yO2RIEcZYIad7tNNVw/3CCk0TmyR?=
 =?us-ascii?Q?eSVgb5M0xGxzKO68CzeoZN8sZQPfyk9PZaZFJCzPqOEZL2kuxf1xzAaxui+z?=
 =?us-ascii?Q?BEB29Oq71BO49oGEgn1cJzZ9e2phG73YwgPJXLrnwVS3+sbxwiJGIR7wVVsI?=
 =?us-ascii?Q?Z+YvomGqoW3FKbHfz+qHm7hO4Aei1Xd/FZ827zf72uUjjW4S3gcDyfwyAQWh?=
 =?us-ascii?Q?70DGnwyyli1a3L2yjDWaxl8xhoFO37R4gr56U3iVbkaPHIVAcuXLBpRx9uOA?=
 =?us-ascii?Q?HnnEUnte39TxjMMPMXPKLRGObAOMjH0da17uj0xUxaXlDV+RgslMrdbf3BQI?=
 =?us-ascii?Q?X2WPyLV26HL6VDXObAMCJSxGVohYhw0NJOitkOle1zjWS+tNtzaXP3GkdGvb?=
 =?us-ascii?Q?2SEjeyQcspLB0umcIgLKEynMRNFd+zj3ywwltNuUuQ/CUBCQKAEs733P+r6g?=
 =?us-ascii?Q?xxzrPAARbVVEi3nqdnsKB2nw7KNa8MlZAK/73cv9gzY1NWI3NZt1OzRZLtAK?=
 =?us-ascii?Q?OarZeJgs2lclqBTbvVn0rYkJfns/dMYXFp1+/erWJONVjP/3vs1jZAJDPUBM?=
 =?us-ascii?Q?zbYIkMSa4Tq1Gg36u3Y5NHztUr6zNI9/qyyxKsSs7ZUBA9ftRluF8c0tA10u?=
 =?us-ascii?Q?FwsHkZQA/RZM0n2QhB/d2R3zqZs2vXDif/Y06k762eCMwoj6JyOySsBXh72G?=
 =?us-ascii?Q?aKX19QDpU73RBgE0dU8RPkLpJTsmz5RAooOaSqlUKkAtA0McK11VN4IDhxkY?=
 =?us-ascii?Q?cqHQ9qT7KYMvYM1VeApoDqaQaGAqAbnoDa5mMBIKLm4HxrAACb1v8TsSkjEx?=
 =?us-ascii?Q?AP6q1NJdXJlJ9vKnkiWypGLHliB/ldwLTEBAEsbO6zlA9UIF/ADzrrmF2Ih2?=
 =?us-ascii?Q?sxZwiY4Mu666/vrjmVjZaZk3r4Ws/ySj6UQE0NLlXkbpviZlLy4V6rM+1TMc?=
 =?us-ascii?Q?KoY/MkPLilNcQxP8k1Qn7S8AJv7p92FctrwTXQgZ+waST3rjRNkHUSMieF92?=
 =?us-ascii?Q?4Jf594ubLQZ3WOEtdimHQzduCUI6aSW7x5tgE3/aEsgd1nkVQOHoLTpc04BU?=
 =?us-ascii?Q?zS4L+lQlHruvvHmpkZfwSUM/iZwwSndtSld82SwSp9eP/nP0WDUZsAoeWkts?=
 =?us-ascii?Q?ldMjhh1bQ2QdRQlrwG2doTooOO0gg1rHSSbP1WYSQG0HSTwjM8o+VYrMtcWg?=
 =?us-ascii?Q?rFAJC0m01JiP4b7yO3b2DMpiAWZUAbUWtjOMPiNqe6MOZ6lge0prH7GD8Wi0?=
 =?us-ascii?Q?xcmUlPn3JihCywUs3eByWk0d?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ace4a2-b1b7-449a-24eb-08d91aa54a55
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 09:05:47.1483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2GnOa3G+JPVxLv+aBLtbfK1ICETZ3kjyz3pjeQRLFkB7NqoXvuOZ6/VlYAIgCwpqkIKoCuNz+ZD1xvpHGVTby6+z014W6IAWe4ageSDRbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1841
Received-SPF: pass client-ip=40.107.7.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Coverity things blk may be NULL. It's a false-positive, as described in
a new comment.

Fixes: Coverity CID 1453194
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qemu-io-cmds.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 998b67186d..3b7cceecbf 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -92,9 +92,19 @@ static int command(BlockBackend *blk, const cmdinfo_t *ct, int argc,
         return -EINVAL;
     }
 
-    /* Request additional permissions if necessary for this command. The caller
+    /*
+     * Request additional permissions if necessary for this command. The caller
      * is responsible for restoring the original permissions afterwards if this
-     * is what it wants. */
+     * is what it wants.
+     *
+     * Coverity things that blk may be NULL in the following if condition. It's
+     * not so: in init_check_command() we fail if blk is NULL for command with
+     * both CMD_FLAG_GLOBAL and CMD_NOFILE_OK flags unset. And in
+     * qemuio_add_command() we assert that command with non-zero .perm field
+     * doesn't set this flags. So, the following assertion is to silence
+     * Coverity:
+     */
+    assert(blk || !ct->perm);
     if (ct->perm && blk_is_available(blk)) {
         uint64_t orig_perm, orig_shared_perm;
         blk_get_perm(blk, &orig_perm, &orig_shared_perm);
-- 
2.29.2


