Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1367C375168
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:19:40 +0200 (CEST)
Received: from localhost ([::1]:47202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaAV-0004dc-4K
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZyK-0002X8-LB; Thu, 06 May 2021 05:07:05 -0400
Received: from mail-eopbgr60093.outbound.protection.outlook.com
 ([40.107.6.93]:50670 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZyI-0002tO-PG; Thu, 06 May 2021 05:07:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duCv+mJfmvmPpR3x8qUyZ/rUbIAiep97EyGUidUUAzH2G9hdQcH5BPmVQOI+1D1FjzB0Uh7e0O+ITv5DyGT03ZHUKjHr/weXz0nHPibtKYxm5cm+m7wR9ej7SEAtw5NJ8A/6cp5s9vV5vNJPiO3HbstmJh5VgRlh/Nf5y6fxZqzSnfNknpcNUq1BpkAh/0AuVcK6/KjAVxwdrWY4aSMz9cE9XlkD//BFEFBxqritsMtcAstdKjeLN94x0QJOWl9eGCEg3dJjv12EN0UGB9/SU4CZi5THA9Rh3ZF1/iNxjpzGOTmbpWK2iqjCHWNmYiCz7EKdiMSuaPym60Wenbwh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMUyUN2/eQUPFpuUX66SjXb7kxCCrp3O/d4hQr0QRU4=;
 b=oRi7LV9bWVdKtDRheAxisVrY9F+lQWYqF6xIKsyM7C9rlkHUavWl5LzEMjVXQVC/y0D5MEoceDSrvLlVphpt4H6ghNewWkkPH2e6M/fguuF/t0XoVncNyqC+1a0vF8O7T7roRAjvs7DDcIM43ad6csBVgNq4NMR2EffQJEazr+eTb7t/VfYsFylxwRB7wiA6ubbFm/sY2yS28/KqE3DiZSyG38WrTQcUoj16QqNsQtNn+lZg76DpBhzn6xFy7aZgj5+A/a1eNoemWjwXyqifv+HKtpo/PoOSIMFct9y5t7HOG6UuGQclTflN6uyJEIxcR9UmAhspOPiDTTy+Ndb5Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMUyUN2/eQUPFpuUX66SjXb7kxCCrp3O/d4hQr0QRU4=;
 b=W8WZOswJTy7nKGWe8s7w5RP/klixx3bwAidjfgWkYqt2RURHPPXxLcfryyXFd7GUkcTEXR45Zy0KlKzD/fLlXsvl4VH7y6WTGWCElxAPp7r+x1O71EOSSrDWZP9rJQrBpUmzuY1JXb6ncYwm5DSWnzwzvXtAVkiHgMfP4SiiC6A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4166.eurprd08.prod.outlook.com (2603:10a6:20b:a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 09:06:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 09:06:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v3 6/8] test-write-threshold: drop extra tests
Date: Thu,  6 May 2021 12:06:19 +0300
Message-Id: <20210506090621.11848-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210506090621.11848-1-vsementsov@virtuozzo.com>
References: <20210506090621.11848-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 09:06:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 187e6bfa-b642-46be-3aae-08d9106e45f5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4166322A60A7548F10B1BE1BC1589@AM6PR08MB4166.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IxFe95mOt0l9GzS7GX7tXwcu9NDNC37gQsgWqAM/NW23FH8dTdbqmwA1h4/NrVOtnmWfi/MGhRWO9elROFJ/kCXuppPO58DTqV85qxrCXjCk1dbxSQ/v1/4wVySBDGpP4F1iQMA6MdYlW5EMstEbaChfnortga89x6lO4Kg2iVL5cCbQoHPclTlR4Wn/jVhe6PqtxRrdw1PXABEznxxRZ6iuGC1ebogp8fVZxchTtkEja2yy9W52fuU5Kyex0LSMWkh0Oop4RKCHOHF7owcwRvzb0FrYpD74YdrUYngo7+e8YSSPx3t5sSQA1z9dPqzPKtYkl6XD0QomDWE/KKzcjS4Nn0pQi6n69chM7PQZraT4R/Au1lXwAsm1YzVKS+MNZUF0sD0fi+0PGjNpa7h6wNPyEf1flRcPi1a6Ma5Ll36m0iCpuarOdC7Jr5r+gTAUcnkLwp/5DpUIXpIvbbfQBj5CDRHt92pYd9kxJHhqBkusZ6pp73RS5JEa9LUUyW1xLq2yoEkb7dgqJQ1oDKBhbGUQnhNlKVzAHcQgMbKcH4qXCwGsGmijSPZa1xkiiepFkTPA4RuTahZ+ZOqGxOYOWuA1VXaaaeckoTy9LvME6+YgNKBrN5OGdTbUK7vhtv9BMYvePhWD/G4nNFETpD1MEFyDFFfay+aLbMw2hgSSycvaW348H+1tRERLOTiwcZcP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(366004)(376002)(136003)(86362001)(66556008)(6512007)(8936002)(66476007)(66946007)(316002)(6666004)(8676002)(36756003)(6486002)(1076003)(52116002)(4326008)(478600001)(2906002)(956004)(186003)(83380400001)(6916009)(6506007)(38350700002)(2616005)(38100700002)(26005)(16526019)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hbYMkJe/VMJLOd8T3C6Wz0V9eMqzg5twCIi8MDbydgTYZfEj2X4/qj2K4fq5?=
 =?us-ascii?Q?gY4XC8UCW2AJZbH3GhXtt2imYqECW/6iGtI52HiC68tpJsLMd36BDL8G8gTr?=
 =?us-ascii?Q?VTdBM3yXKmM88FiM5ooplCNtFOSXoFCe8lmIfTu6eWtMyHq7knjlrFw2FvLA?=
 =?us-ascii?Q?sEZCBm0CmU//fF/0Pnw5UhEku7oX60jfnT+Ie/CZt24kf1zqbK9Ekj+vrTSk?=
 =?us-ascii?Q?IBym1OUYybBTOjr/OKW3NC6S5yF8NnOPSXQLtUEYsiho3ucDFW295gq2hWp5?=
 =?us-ascii?Q?rjFNEYB4wTGbPFBbt9iJzZGxQ+Y76gryFIszZevNarGLG5xcm/uxVbsYxk6P?=
 =?us-ascii?Q?Ksdtk02K3FpR5kutxOKyi9Mxmk6Mdm4lY7XRzJrOSfm1TQTB8QHLVIJLjPKf?=
 =?us-ascii?Q?FyJ0kHhyFROWR3ON/jbu26y9kxlaWxB2HM2eYFQ6+pE5ApXLsvAUS6DypyMI?=
 =?us-ascii?Q?RIs7S+XB9MUQmDTfIuMzOqnvBoNMlav13XHYj8qmScNJ/nXpGEmClUwTBU29?=
 =?us-ascii?Q?F/r/CNVfjlPb6W58TGA2MfIjoTB0oePkeDhO4NniPv0q5ACWe67FBvu7vVjG?=
 =?us-ascii?Q?RgMsB8yMCnoYivDb1jY3+weKGa/6XZIzpy2T7GYs+vusSgJfrXoSe+Bih3N4?=
 =?us-ascii?Q?ClM4i2WlHuabykGr5ggMqt9Z/1/DCPjZntGgcy1ZAfS3ZFuX5HpeDTlko1wo?=
 =?us-ascii?Q?kV8znwOZKBInSEm8FmWV9kfEdP/asxeQRLi1vH5X3NkVHURu6gwviKjhY7ey?=
 =?us-ascii?Q?uOG5pmo+3SOaYA/h1PxXGeCV4O+lsF3WGwWOL12ez8COu9JKkiLYBjHkMwXo?=
 =?us-ascii?Q?mQP9ELPjYL22zEwoqHAh71mfPMq+Pw2VyFMP4DzI0Mrzm007ZhfixSaOLh6u?=
 =?us-ascii?Q?leziZsS2bmVVupz2CdchI1rl3g9Vt+gDIJQYtGYzsJjLItgtN8UfGoN4UCb1?=
 =?us-ascii?Q?3/KycwRswqjxE+tWRC6RVtRmPQ6yZVxaNf5e5nL4f8n/hP7qkuYJ14iU5kcB?=
 =?us-ascii?Q?OQwrvSZ9OI+7vclw/BzfCRzbaUaRTyv22axHgDZO3K40D2lgFVaYvsmo42l9?=
 =?us-ascii?Q?sGOkFY2ZLic58pcYNDJAXRy+SHFd91CprKU9WhT2klo/Y26heYqkBYJHlCVM?=
 =?us-ascii?Q?3oG1PFwNJDm1WF0ZUhW1FLXpSqsocY34S+DnLI69qLMy/VoZLMrHm/3a6Utn?=
 =?us-ascii?Q?PsjwuMU+Z+0hxL+3XHm1cYqJtgNJoqU1H8stQcl1wDAnFoCGxzyWlju9wgS6?=
 =?us-ascii?Q?3uNg1HVXuEXVv3R7e8EEY9Xt2O68IQVLroSHlUDY++olBtM8uIc5O1ggL9lc?=
 =?us-ascii?Q?ECxZw9TIZSCMSOhvegl9541s?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187e6bfa-b642-46be-3aae-08d9106e45f5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 09:06:45.7036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbCLDlcE5LgDrs1HaEvADEi92ffE0CmRDiYiA8TToKcc4ZzbCBQq1uyGyuGX0btAbxYKKl6touA1k5wbpBJeux0XgsjWlnNctE+d3Qmn1X8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4166
Received-SPF: pass client-ip=40.107.6.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Testing set/get of one 64bit variable doesn't seem necessary. We have a
lot of such variables. Also remaining tests do test set/get anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/unit/test-write-threshold.c | 43 -------------------------------
 1 file changed, 43 deletions(-)

diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index bb5c1a5217..9e9986aefc 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -12,43 +12,6 @@
 #include "block/write-threshold.h"
 
 
-static void test_threshold_not_set_on_init(void)
-{
-    uint64_t res;
-    BlockDriverState bs;
-    memset(&bs, 0, sizeof(bs));
-
-    res = bdrv_write_threshold_get(&bs);
-    g_assert_cmpint(res, ==, 0);
-}
-
-static void test_threshold_set_get(void)
-{
-    uint64_t threshold = 4 * 1024 * 1024;
-    uint64_t res;
-    BlockDriverState bs;
-    memset(&bs, 0, sizeof(bs));
-
-    bdrv_write_threshold_set(&bs, threshold);
-
-    res = bdrv_write_threshold_get(&bs);
-    g_assert_cmpint(res, ==, threshold);
-}
-
-static void test_threshold_multi_set_get(void)
-{
-    uint64_t threshold1 = 4 * 1024 * 1024;
-    uint64_t threshold2 = 15 * 1024 * 1024;
-    uint64_t res;
-    BlockDriverState bs;
-    memset(&bs, 0, sizeof(bs));
-
-    bdrv_write_threshold_set(&bs, threshold1);
-    bdrv_write_threshold_set(&bs, threshold2);
-    res = bdrv_write_threshold_get(&bs);
-    g_assert_cmpint(res, ==, threshold2);
-}
-
 static void test_threshold_not_trigger(void)
 {
     uint64_t threshold = 4 * 1024 * 1024;
@@ -84,12 +47,6 @@ int main(int argc, char **argv)
 {
     size_t i;
     TestStruct tests[] = {
-        { "/write-threshold/not-set-on-init",
-          test_threshold_not_set_on_init },
-        { "/write-threshold/set-get",
-          test_threshold_set_get },
-        { "/write-threshold/multi-set-get",
-          test_threshold_multi_set_get },
         { "/write-threshold/not-trigger",
           test_threshold_not_trigger },
         { "/write-threshold/trigger",
-- 
2.29.2


