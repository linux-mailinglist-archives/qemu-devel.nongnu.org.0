Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40D42F8F81
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:55:32 +0100 (CET)
Received: from localhost ([::1]:52058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tXf-000723-Vs
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQS-0005Jy-Dh; Sat, 16 Jan 2021 16:48:05 -0500
Received: from mail-am6eur05on2132.outbound.protection.outlook.com
 ([40.107.22.132]:15968 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQP-00078U-Q0; Sat, 16 Jan 2021 16:48:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSjkM9qVc9J568BvTC3AHADec7zZTEVuXtqaI+r9ZnR3llbVmlx5AgZ1GHsiDJNU9n3CMv47cf/G9WOFAoDN0dttqJne9EBEnQPp8avb0EzkczX6UH0QUUMuGQShRBwV3M6Tzosc8HvDs/P5KyRklhWFBINP7pmLd9Eabib8RC8o6Yo3TdkakNlEqgUUk42ev+xTE7tUXzMqKVR0Ran7SQw4uqI+0Zq/PwEYuiAko4of5/mNTBb9z/4SZ7NVJWSsvRxkpRsV0sk9pjw1dJIN3e/3SrZiHj6ONbgeC5sxkcSu3EJl3z0X+KDQoXf4hB64Og+fGb9P9kt1G+nzC5oYBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVsZ8HB6jkB4ldbGfg/aqZOqlMQRd/T6ytQS0Oglzo0=;
 b=IHGpdnsmd+Hes8YfsdRaUpRCT/NDhADAsTXKd8NHThTnib5y1wIbCjeyDnnKJCmSi6wC07z0VwwZJgVNIx7zcx0c+QS8HSF7v/Hq9h+D5mwI9qFPGJyjO2d0Zrny8y9upwMNNCCorkm6uYpX+jvfcmdhex/ZoSBBADzQ2WJxlUaDD+WyAr0crcB1GhBTDYR1qq+hmLAEylzfKLZztF54uiJ0PtWivEdhEKSfgoMk6tgddcnVBtV9QoiYC7RGnBjZ5LXHBSm0T+ct0UCCvtQJYI6Ic4kfOa3c9Abbb55CMt2u5pTH5Xj5Ss6RjAK4ozMnpY9dABibdGEjBOif/dRYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVsZ8HB6jkB4ldbGfg/aqZOqlMQRd/T6ytQS0Oglzo0=;
 b=FrsS2JjGWvNjci8A4p5ODmYQuitQSVL8lCEY8yG98ychQBlV9wVmEwBTIndSTJ0lHwIrAVTjnk98zsrYGTShI3MPqaOkN1Uchw6skuBzhpXRD8teSJQXsy+omogB/4sWMAwgHkKGoMNyMKqDjb2YQbfyyq7lW34t+P7ZlQKDiQc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 08/23] blockjob: add set_speed to BlockJobDriver
Date: Sun, 17 Jan 2021 00:46:50 +0300
Message-Id: <20210116214705.822267-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2de0fc0-0624-4b6d-0cf8-08d8ba685dee
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB203368701A3AEEAF373B52FCC1A60@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MwubURSmq1X8NKABfo98vR14VJpG/53mlXor+ePu32Z1PHIzLIzz24/dNvnAvbdLAwccJluFud4n5sGiyr36gyDS23c5BEZbaquBjSMeZhGKfhaZqnEWdB/us7vATQ+46itulaS+0FZQbwSQQUp8K5Q4i9XJorGYDBFSWG88uujUycPAiitY59CaF8cbIa6RiGMQhOAEeT0tYpjSyVpfNuRPR/puH3907WZjwS4QOo0IMZEIPFTbVQq5Ef04Ur2lleqXaVgX9NM47ZtEtfCPomwTbnigMz9dmNh/YHtHUO2C7miro5bkYjEReEA+R0wLMy9fNGdDMkvi+7kRMnQhb7+wfwXZ8RxbAZ9F+L8GDUdrHTRMvIH3Ld+Ws2lgjV9nM5tUxKesgMgmgVTFMBYcKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6506007)(8676002)(1076003)(186003)(16526019)(5660300002)(6486002)(6916009)(36756003)(6666004)(316002)(8936002)(107886003)(4326008)(478600001)(86362001)(6512007)(2616005)(956004)(2906002)(26005)(66476007)(66556008)(66946007)(83380400001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?43Twas6dC4yOgLt5mWVgvPCj8H9Te2KGiscPHRbaJDi4G/wS5vPE4Ympapes?=
 =?us-ascii?Q?TKBUAQHE1yoE/a70/A320XjWg/zUpRUAesB53jgukIQgNn+dxihNhjOEYzD5?=
 =?us-ascii?Q?ooTA+b80RaAFeocqpqADes+BRxY2iNBq6aFWjtsJDfaIXOm2TV5iUOSgeSOh?=
 =?us-ascii?Q?ghd0zbgp6lIAcTi6gQNFKt12xrYhnRu8OmMwWoezgufJ9Can6K+hp/Viso32?=
 =?us-ascii?Q?lxHC6dct2tyO0qJgPJM55Vgpm55myQoPSo2gQwpcdosdMaASyG09KiE1SJP4?=
 =?us-ascii?Q?yaM6zVwk9Ehhzh7Mj6YcfKS41YuShu8w0MXxrB3MTizNUHn+7uElqNdzBl7p?=
 =?us-ascii?Q?PRhFScloXmV0QEd/r/ahG1Y288/V8rZcGpX3+0N1z6vsvrg3nYr1LGoMpshj?=
 =?us-ascii?Q?J6akPmT8tgPk3XiOWXmbXj6NwsC7EuCsApFBZizIP7wR4rKL7JPPjsJlfaZA?=
 =?us-ascii?Q?HXrhNyOCFKdzM9JNfgzzr5dkPT4beVmG0pK6+AFAzBIVTu/QlPBfU+vaCrzv?=
 =?us-ascii?Q?5zjKnOJaNqvOIoZzUa/Xy1XtjNjNmcLlGJRBj6A3yHn/RtUQPyJY0RB9PB1C?=
 =?us-ascii?Q?el8RBcB67We3++fVzH5tzgfZ5W5t4cNZD1WnBhGtXwm+/BwXuO9CNXwRs/rx?=
 =?us-ascii?Q?Njj9iafKnSnCsF19UlvYC6DohOsN6R5FvJd4hC38NSNPoapZyyei+PjPxoEZ?=
 =?us-ascii?Q?pZS0ZLOLLTp66d4vpnNqHJopeAsJNhPTbYLiGH7o++kXZXzRAmXZbBGWrQZp?=
 =?us-ascii?Q?CKsJYrm5/TnnEZhq48sWr+Nq5qc9VJzGY1d2NfiQoDCZRRWJkUjUZJfD+FR8?=
 =?us-ascii?Q?JJbFq17db0B4I/GHLhhnYAGOA2GDKr4+pu9u+ExMiSg/RgHxjuQs9qjWpTOF?=
 =?us-ascii?Q?DY4//4SIcYhhD0sG/2EiOoOe5vkCyDgpTWbYWwpySIEeioLHyFJvhjgolz3H?=
 =?us-ascii?Q?syMbRIGuYPtni9HTzibYDFAY6z0C2xtcI0dtKPpDbdPlzpq+mmFt5pNHGIHe?=
 =?us-ascii?Q?RIrh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2de0fc0-0624-4b6d-0cf8-08d8ba685dee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:49.0726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4+//gkDK+SAdJgxx6eg02LLZHo93yg040a9o5GnRuT39RQCwjD5tnvFhdwcYeEz5WJ9Mi12ZB0vVsYr4EmZKxtLTFdl5x6kNh23qr6+b54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.22.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to use async block-copy call in backup, so we'll need to
passthrough setting backup speed to block-copy call.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/blockjob_int.h | 2 ++
 blockjob.c                   | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
index e2824a36a8..6633d83da2 100644
--- a/include/block/blockjob_int.h
+++ b/include/block/blockjob_int.h
@@ -52,6 +52,8 @@ struct BlockJobDriver {
      * besides job->blk to the new AioContext.
      */
     void (*attached_aio_context)(BlockJob *job, AioContext *new_context);
+
+    void (*set_speed)(BlockJob *job, int64_t speed);
 };
 
 /**
diff --git a/blockjob.c b/blockjob.c
index 98ac8af982..db3a21699c 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -256,6 +256,7 @@ static bool job_timer_pending(Job *job)
 
 void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 {
+    const BlockJobDriver *drv = block_job_driver(job);
     int64_t old_speed = job->speed;
 
     if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp)) {
@@ -270,6 +271,11 @@ void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     ratelimit_set_speed(&job->limit, speed, BLOCK_JOB_SLICE_TIME);
 
     job->speed = speed;
+
+    if (drv->set_speed) {
+        drv->set_speed(job, speed);
+    }
+
     if (speed && speed <= old_speed) {
         return;
     }
-- 
2.29.2


