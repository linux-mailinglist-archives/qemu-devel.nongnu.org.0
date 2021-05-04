Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC49137274A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:34:43 +0200 (CEST)
Received: from localhost ([::1]:38114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqVu-0005Jb-Sx
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqNw-0007ze-AO; Tue, 04 May 2021 04:26:28 -0400
Received: from mail-db8eur05on2118.outbound.protection.outlook.com
 ([40.107.20.118]:10464 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqNs-0007EP-Vl; Tue, 04 May 2021 04:26:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ef/dR4DzpUgYyMNbPRdFLaxdWLmbwSqDkHWX80fymYbD7ZLkxlX09kzXfeENBQFZuXV+M4uRCM7belYGXwmYOK6EsOw/DWHKdxTw/UmT12ETVrFj5gX0APGPNm15CG5RD+dA4GnRsRnhKOloKjKit6CTEH3Vb2t/WKAuei878A+Owk7TMfa1mW5RlbNUo22yAIqxN8DiwNe3C1FvZEqzSt9kZMA4hI3qPGG/J6ooFRhiEzdIuqg4CWSocCmX7axAV72QU5+8mHdUppxPxirGofTOk4EA739ZaOLssGDjvuFb9ESaSkK/qaKPiFLTFGehu/T80k/wiE6cPM8yq0Gzag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNfYhsFm/ch6xJUl6uIIpImvw3uBZcm5EC4dzHctZiU=;
 b=ZDbA+d+InFeQdE1vK7tbDkjsD3JdQ9RdNLF1rjBFKThyoiW3ERlz2NyN7hcMeTHyORpZ7T61LFjQ/u8Xh+RvhP7JbZrkegeZELI46LZshCPR5rypoawbludeZgU/fTfiVNkIFPzzYJBUAwgbXINUnVlFvEPa74rb9NusQ1FYApUFaVaBu2/0uYLZYnmuFJeIntvUQTZX2KUPvWE6EH4NJhplBIpjzSWUmL8XRQq/2suROE9KvI6aWWnYITSvGaNnYRc/U0oWdlcQeQguCugiL0gKYKchmTQsYY/vOT/FeZz8nq83Na2xtujt0ZFepJnqoryv8xCvkEfoj97NU8/RHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNfYhsFm/ch6xJUl6uIIpImvw3uBZcm5EC4dzHctZiU=;
 b=b46sOU/IE92XQx+cpadgPutqItPIAZ4P/VfVuLyYN8DrZQ4ndByjyAILPwDpXO8XtsogUkczCir+Sf2mP6hGD8Bmi6SpJUUcEVR166xXPHIiFHZIl4Bn/zQthKtjvOBZIbWLd4ZfxQYHtvx1oxReLEayhpY46Q2C8osQpFUKsFw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Tue, 4 May
 2021 08:26:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 08:26:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 3/9] test-write-threshold: rewrite
 test_threshold_(not_)trigger tests
Date: Tue,  4 May 2021 11:25:47 +0300
Message-Id: <20210504082553.20377-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504082553.20377-1-vsementsov@virtuozzo.com>
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 08:26:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cc5b946-4019-499e-5c78-08d90ed64619
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381F03D7AC3C4A1C3D54EE8C15A9@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TGaLL+fNqfchdweR+E1e1hnvl8XF+IQsYivoCd5dCCWVCtdQorO5srcOVfujq6wibBZt0b4oH+O+Rbr1b7F3ccMLUb/ziBHLdIcByywrp+2JNOdjYTnGDLSg/c1ll9Qz9qag1jcG7sg1Rv1R8dkNXtn22Kr+z6v7VEdHH4nWZtU2qpfaLzQMXjR8rmBKrIxr8AHbyyipRQoFI2pmgRu05Nn3CP7/cAMPJ+8OzBAfVf9y0l7KGLnn1aYxljAsA+eGh2CP0rkYoxOBV/qrYGFek4QS/EWnKyyTCXi3Ltq5chz/7opoklfJ8/59zBkNpphDj7LrA69L0bHC2bjDNMAigzvIEM+5gKml4EXtdYD5Be3WEhcSchvKTO+eL0EDmrEmTZWMymbiNvJi+3eptEJjNG4aiQu3NCzrWxTbmO112NExkBtmWjVIIDn1A44RlA6ShHIcwYTwtPyA1ZaDfl0EShpq5lR8beFxIRClmyK0WK9pr0I5NHfgSPD5iqg+mTawQmmY5NcRw18Ow83g5qZ0OPxZ8UqxOFZHIHEyppaX/MSbYGy0BjlCgwc4OSO6ZumzsOwpKlJmB8yVXeCLwu1RGkvvt4JJumYQMf+Ov49YiKcPpgFaj+N5QaHKoPhbGjYGccMTR0TswVtzApLwt9iXNvT7LV3j8t80TesyTeRK2kX3QOHzz49oi2Pqk3lW4K78
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(376002)(346002)(366004)(396003)(6666004)(83380400001)(38350700002)(38100700002)(5660300002)(8676002)(36756003)(16526019)(2616005)(186003)(956004)(1076003)(2906002)(316002)(4326008)(6506007)(478600001)(6486002)(26005)(8936002)(6916009)(6512007)(86362001)(66946007)(52116002)(66556008)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+NU2tP2OEbpJ9La8vFkq2VXGUEGuUkzHgGGYogElCNOnJ7IJfU4CdFFjuGAY?=
 =?us-ascii?Q?Aw3LyEfcmDDGCBCc3TUOLpHJxq2bUEVqEP77v9VzQEm2iqINzrTrxJwgUBRx?=
 =?us-ascii?Q?lKYpa754j+sGkvwl2igO617Ghe2mTzONt9kV4vQFt8yqlUQh10Vtn3jA9VgV?=
 =?us-ascii?Q?C0UEfBSraOJ+0xPSrU03t4bt1HbwtFpfBN2UySo1v8uBggll5oNoVV0T5QU+?=
 =?us-ascii?Q?Z/ZOqJeIUAQiYsPDWMIbkw4cHNY+S/2LuZWz8WzD/Kld1iXbNm9Ev6PBye8R?=
 =?us-ascii?Q?RkTqngZW9gDt4V+FN5fstm0EIIwPZIcvjREwHkxCn2+6Nz6UDiU/G+Wwyz0t?=
 =?us-ascii?Q?OZx2GGNJNDU+NIJHOgvt7qcnh9zrgn6GqwFwQND13RyR16XsF0PqaWbC1CDh?=
 =?us-ascii?Q?jOPlAYRxkNseSDdo6MydHArxurKzBYeW1ypbrfRA4cWX4ss5mOL7BK3+f/pk?=
 =?us-ascii?Q?Y/JRAeGwKDKapQ+a/sFid9O32lGT04OgAWzNjer5249kSDkB2EQz2Vjyzu5M?=
 =?us-ascii?Q?cyxEUK936JGgemc+v6QzWLArXFOeydE6RHTOGDHncfyKYhgu/NdcGfhFJ/sq?=
 =?us-ascii?Q?eQAWLf9PGotFAVEtHhMvmm6xxp0F1lOU4wpEIg2emg/iGhIsKUW+Y7ooe0z8?=
 =?us-ascii?Q?AdwOvwpyZ0iJUTrULjsZZe3W+odV014Hy33ntIDyD1TqA5yA6J8qLOHur3kd?=
 =?us-ascii?Q?idSY7tD9j8XDl76CzS0x0CuGoP3HggYgqMuukkCXnZQqgJfpYLi4Wsp+BDiq?=
 =?us-ascii?Q?gEPZn1knhhMLxtN6cdK3LlrYey95ICH/+MKZuZUjklVpnOKwwbdkyB3mjx9W?=
 =?us-ascii?Q?eKN+Q4K9lZHSYGJkumc/pwJLvB03Bmb35EAzyP7z6cCSQEQQmIomBskF1MHU?=
 =?us-ascii?Q?j2nzbtffcaVKnW0VXb1DIsSKIUwmjHWzTOOdTznnDmzoa73hR7gZXvB261Ga?=
 =?us-ascii?Q?SydJiYjfEsA85VzrPv+I6GlOMqnuP9Tt7PjkX4pRbxd+pExag6T5tPMErkx9?=
 =?us-ascii?Q?/3jGk6+5MmU3l8lJ0U5XgvnrSw5DROTYsSWvpYZP54GlbuLdyyrDRhRu4qAR?=
 =?us-ascii?Q?ryLeU1kqGBKPZ/UJTv/5a/ZvipQlrU+3x120nWIwv1BzlorJTqoNu6nP0CM6?=
 =?us-ascii?Q?hOB+SjbQEzu1rbKWxIarlkbJBpATs/9NuiNCTfyxxYJv+ScmUtpsDj1llSbE?=
 =?us-ascii?Q?c1R29loplL8kwFFU5ITqsCEk2LJ7jZUVIaOEv1zCdyos2zr3P8junnQIQdCo?=
 =?us-ascii?Q?47hiAFdRZdRENGG+B/SS6rpWTNl0glFMfDpbpSrwOuGKPPxg+h6KK7runScz?=
 =?us-ascii?Q?gjDJRP32JMLn2vzPCNQ1amc+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc5b946-4019-499e-5c78-08d90ed64619
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 08:26:11.2847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beE+6+6oa1KUuR2r9c8u4yml1IE0FXoLoSoJOf/QNR3ZOLUporcmVtLjX0xWinVa6qbfGyTfEv8ZYm5HY5T6OrsQ2GL1B/ww/3IuG1UNa7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.20.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

These tests use bdrv_write_threshold_exceeded() API, which is used only
for test. Better is testing real API, which is used in block.c as well.

So, let's call bdrv_write_threshold_check_write(), and check is
bs->write_threshold_offset cleared or not (it's cleared iff threshold
triggered).

Also we get rid of BdrvTrackedRequest use here. Tracked requests are
unrelated to write-threshold since we get rid of write notifiers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/unit/test-write-threshold.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index fc1c45a2eb..fd40a815b8 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -55,41 +55,27 @@ static void test_threshold_multi_set_get(void)
 
 static void test_threshold_not_trigger(void)
 {
-    uint64_t amount = 0;
     uint64_t threshold = 4 * 1024 * 1024;
     BlockDriverState bs;
-    BdrvTrackedRequest req;
 
     memset(&bs, 0, sizeof(bs));
-    memset(&req, 0, sizeof(req));
-    req.offset = 1024;
-    req.bytes = 1024;
-
-    bdrv_check_request(req.offset, req.bytes, &error_abort);
 
     bdrv_write_threshold_set(&bs, threshold);
-    amount = bdrv_write_threshold_exceeded(&bs, &req);
-    g_assert_cmpuint(amount, ==, 0);
+    bdrv_write_threshold_check_write(&bs, 1024, 1024);
+    g_assert_cmpuint(bdrv_write_threshold_get(&bs), ==, threshold);
 }
 
 
 static void test_threshold_trigger(void)
 {
-    uint64_t amount = 0;
     uint64_t threshold = 4 * 1024 * 1024;
     BlockDriverState bs;
-    BdrvTrackedRequest req;
 
     memset(&bs, 0, sizeof(bs));
-    memset(&req, 0, sizeof(req));
-    req.offset = (4 * 1024 * 1024) - 1024;
-    req.bytes = 2 * 1024;
-
-    bdrv_check_request(req.offset, req.bytes, &error_abort);
 
     bdrv_write_threshold_set(&bs, threshold);
-    amount = bdrv_write_threshold_exceeded(&bs, &req);
-    g_assert_cmpuint(amount, >=, 1024);
+    bdrv_write_threshold_check_write(&bs, threshold - 1024, 2 * 1024);
+    g_assert_cmpuint(bdrv_write_threshold_get(&bs), ==, 0);
 }
 
 typedef struct TestStruct {
-- 
2.29.2


