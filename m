Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36E375580
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:19:44 +0200 (CEST)
Received: from localhost ([::1]:49366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeqt-00014T-Gz
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leelo-0003Tz-Rm; Thu, 06 May 2021 10:14:28 -0400
Received: from mail-db8eur05on2110.outbound.protection.outlook.com
 ([40.107.20.110]:13665 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leeln-0004Fk-04; Thu, 06 May 2021 10:14:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGKOE2P4kSm64YNs/4lhlUt+ATkieHaWnAKBPNb2u8qUi/CX9WGFVI0otB+96QgipeUxLziNcYycbeJ77iuY06fBee/dM0lWEsKE7ydU2hWgoBzkaYZIy5F8j9jE7lF7HzPEoq3waN82hcKPYxdWWzT217OVRs3tAsVQJsaXTX2UaKqP8c1X8g0nVxkg9j8KDbH3x7O3xleHUJcZvTal2EA8k8uICB6fyZ9ZVjihkwKqpTdKM01dcYi0HXCtXIHZT7dH9E6794EBYsS8vmnMls20RYTTIITZQZ3sLroIYeRUk7KlgK0Qu/nrI3SELPGxoh6ztKRKZEj0MjaNPHkILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9gasYSoTFXfN8wbh0Bf33uwzVfDQpDZQbG8MtPq9kc=;
 b=ju08zqoMngnybBpvDEvcqcYzmIZnz0HzjfXo4ZjlT6LZU2wTz5w5kj4b93AB/V+u6Y3Z+F7Ro9+wd+jITJzXABjZpm48JDW3TByDepyjbBJ16R3vgRu333uexyq6tBVGaTX/mnVBg5pmjGxpp8ccVUW8iXOswU/3D+R94rDlvXAqEc2mw7K++AF7iuyNSPKVDscwt3IoygU7xWafyVoeITrcdT9tDnwZ3k4jw9Dh9QFLIqgbC393yIx9RIvCQGInwLZz5CrtAELrmvLOD+WC734h68cTrWG3QCnKGsW9CvEApqBen5V1A76i5r1OJy29J1Sw91LdMTieax5RDinxqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9gasYSoTFXfN8wbh0Bf33uwzVfDQpDZQbG8MtPq9kc=;
 b=ETgqqFIW8K2fyxJe50bt6tkJPZ+hOeSYNQS/tUbpRHFcZtBEgE/Q/flSpaxBIYTUTgUg3sCfkOuZSFvuG8B4hFyMhg4FscKZEUztmloddnRScHupAPaXjV6vOSaW55cIJbN/5WWv9+CIdGmYTI7A68D3sClrQcHPjhqwEq86ud0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5205.eurprd08.prod.outlook.com (2603:10a6:20b:ee::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 14:14:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 14:14:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 2/5] test-blockjob-txn: don't abuse job->blk
Date: Thu,  6 May 2021 17:13:54 +0300
Message-Id: <20210506141357.314257-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210506141357.314257-1-vsementsov@virtuozzo.com>
References: <20210506141357.314257-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1PR0501CA0037.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1PR0501CA0037.eurprd05.prod.outlook.com (2603:10a6:3:1a::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 14:14:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10b674e1-8c8e-497c-c6ef-08d910993961
X-MS-TrafficTypeDiagnostic: AM6PR08MB5205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB520577BCB7AD96A6B41CEA58C1589@AM6PR08MB5205.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:164;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01mYbNDUsug77MPQ4WPBAi+6xt+6jMbvApKbI7rW4IC7C/wieBosqKDnjSeSJpqOvANf8V+lXM9lD0Vn5KOA3OaknUUC2OEbeANSIt2Y2Q+b2pP0/TnIE0rt6ccDsFCy8yQBLYsUdduOPqsMsBiPgDd9SWLZetf1iFMaFmU3g+eNKq7R/JGGm7+afSFdpsgvD5jjQoP4znOzMbFrfWrl7D+ASRrF8Hz6h4cQhD5HydLUDAf2D2iBkMlKcI18k90jF6eSvq4V3+sARJcRYURHMf1NVxcpnGWqQfOmak6MEtX34U1tcoW0sBD5SK10nv9issg38tfudY+ROZ/m1+SPYPWRcv8C8nbv5oVmg7MVXOERvSqDpJy5IOtQ7eeNoF2z3vkY2IF1bmQOmFjIT5lAKOSnL0TnMk69fyJuHm1NSCePSYUZLQi31c/v+6oSKt7VlhwM/HipxQgRg0evyGm5ezI04YUZ4UfE1ft9qga/Ebq9r0XMFg6ZcR4alT4wwGHOKUk1RWsYKtWY2i4verimrpNeI1Sv6pn4S0pjxDXZA+WyPqThhxmYpaTdFIiDScVX/z6zSSN8EYLadgoBfVrdMxUWOXOCATnEXmxteoQW3/MboAgM4ENu+EuAa965l8mwAc2QYKdk69mCwK4TYQXs3XOKZbt/HnXAW03Mfg0tpfkBbvInBCmf/OVFgA4G7xPA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(396003)(376002)(136003)(366004)(66476007)(6666004)(38350700002)(1076003)(16526019)(6512007)(66946007)(478600001)(38100700002)(2616005)(6916009)(956004)(36756003)(2906002)(186003)(4326008)(316002)(86362001)(83380400001)(8676002)(6506007)(5660300002)(8936002)(66556008)(26005)(52116002)(6486002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1M5Bc8PEbOGG2sJp+ZsO2gkLacuOdcD5Ih9DKLgdMBWFm4w48mpODFzX/YzZ?=
 =?us-ascii?Q?MWt0MUkolTDvnUG48u7s2c3KSoSgs2yW3D0wRDqNvClh4kB0XU6BeeD1+ssy?=
 =?us-ascii?Q?AY1M54wxPpHu0bQuEYmvWppaIa3RQvX6n6+lWzfy+uooQcoJf26wG2Jtypho?=
 =?us-ascii?Q?tennsCYhChCGmjKU/o4hE4o6eANqEhOCuAxoYvui/Kl08OCHeGQ/yQFhrD9W?=
 =?us-ascii?Q?N6g9cMS/aMjuv82OQzCpNgffttMgU9NGzXG5pj5MHpICH8WV+RPqncY1tX4O?=
 =?us-ascii?Q?r1fQWyYL840P2B1QnZ2a5bZaEY4w/t3rRPFon95ytOMDxwdqb2Dgwk9kDl5N?=
 =?us-ascii?Q?KM0z4jRhJWhKW8ikJ75zOip6+1+HZYfHtinu3nHnJlKgTdvdBvqyhsKLdSbZ?=
 =?us-ascii?Q?FlhXLNJ+st/9Uc3D3wRC4+dRnVwyGfz+IVWFHxCKjkb817ZXljE/7kL9bOR+?=
 =?us-ascii?Q?y2Xi3Wz/NlMxpjjoi5Q0C4Wy4SVexqwPD4GJZfjoCFsVuavdCpviSwr8zVhy?=
 =?us-ascii?Q?3bmUcRuSUtIve/fkFMvpkWg9LgWzR2jP/GsmxBrIfNhCon3gnp5EQjfnxOUY?=
 =?us-ascii?Q?6DnBMbbrauxSgbe7iV9ke4VWKXAqIsPZPte+eu1VqRS0MqYan6fF5gLGVFiZ?=
 =?us-ascii?Q?Bh8IbbGAhSD1AuJL6mWcQiq9fT4FXfVtEoErN9diCJsdfVs1sbUF+MwWO5dn?=
 =?us-ascii?Q?44bjAX27Yw3LqYbzZUYPJY9/4qBet+PZFuRZL01CXEhQbKljCwZAhhaCdD4R?=
 =?us-ascii?Q?EfQwvhIflU3cxBgjmcWrpskHsLGrCucRroFiu+zeNz3igilDdwo44lOh+jEI?=
 =?us-ascii?Q?L3za70Dwc8Sml/GErb7IaH6eTM/k9YwF9TAw2NuB917jBAmb7iWYrJaA1Ed7?=
 =?us-ascii?Q?HRqdgJhDwCnNYjHb2I2vDNjCbgozFXyufd6D9aEGELVOsxOBrTgoNV2hmdkS?=
 =?us-ascii?Q?yGCRCZoKvTJBsf/yQ4hWDfL5UoQ+2+uZ9T8mUi4dgDAoEk2Kd6ASBLbzHDL7?=
 =?us-ascii?Q?lrJo035hgFiLY5r2qAwyctOmVH8zu+MoycAPnSBRIuVM0jfLlBvQy3H7H4e1?=
 =?us-ascii?Q?kIESiO9tUlulBV/YH6w8AfTVZVoAx2DAW/v8PiVzGNLj/0S/jOBn2j9W6CZE?=
 =?us-ascii?Q?nWD0Xv6s5sM8Q61q6bv5pfUe772qR77IqesU7WuamRBcksiTUgzQ80xJtnpN?=
 =?us-ascii?Q?HqI7R+TP7ikemrZx0EFDJ/BJssfjoLGqcZVzvjwQRh0k/B87YYTRzVk4ze0n?=
 =?us-ascii?Q?ZztduOXC/+kHkipuwh62v4e0bFhMHnOurXROBGQtc+AFsOmFwcaV8mHG4o1J?=
 =?us-ascii?Q?Fk/8f42AB+Gb8G/f72t7iQp2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b674e1-8c8e-497c-c6ef-08d910993961
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 14:14:12.9719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ss3ENdzeMW0pXVmVZFSU6mJ4hclmrsVwgZVG54dQCT5Vo8aJSpAfHViqvraUmH9rhmv2DDFMojkIVcIzSZYS7SDL8tkuFGMUz8pTZ9xsmo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5205
Received-SPF: pass client-ip=40.107.20.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Here we use job->blk to drop our own reference in job cleanup. Let's do
simpler: drop our reference immediately after job creation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/unit/test-blockjob-txn.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tests/unit/test-blockjob-txn.c b/tests/unit/test-blockjob-txn.c
index 8bd13b9949..c69028b450 100644
--- a/tests/unit/test-blockjob-txn.c
+++ b/tests/unit/test-blockjob-txn.c
@@ -25,14 +25,6 @@ typedef struct {
     int *result;
 } TestBlockJob;
 
-static void test_block_job_clean(Job *job)
-{
-    BlockJob *bjob = container_of(job, BlockJob, job);
-    BlockDriverState *bs = blk_bs(bjob->blk);
-
-    bdrv_unref(bs);
-}
-
 static int coroutine_fn test_block_job_run(Job *job, Error **errp)
 {
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
@@ -73,7 +65,6 @@ static const BlockJobDriver test_block_job_driver = {
         .free          = block_job_free,
         .user_resume   = block_job_user_resume,
         .run           = test_block_job_run,
-        .clean         = test_block_job_clean,
     },
 };
 
@@ -105,6 +96,7 @@ static BlockJob *test_block_job_start(unsigned int iterations,
     s = block_job_create(job_id, &test_block_job_driver, txn, bs,
                          0, BLK_PERM_ALL, 0, JOB_DEFAULT,
                          test_block_job_cb, data, &error_abort);
+    bdrv_unref(bs); /* referenced by job now */
     s->iterations = iterations;
     s->use_timer = use_timer;
     s->rc = rc;
-- 
2.29.2


