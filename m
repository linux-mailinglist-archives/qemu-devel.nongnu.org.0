Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98415375150
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:12:49 +0200 (CEST)
Received: from localhost ([::1]:36308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lea3s-0008As-Lo
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZyF-0002JU-A7; Thu, 06 May 2021 05:06:59 -0400
Received: from mail-eopbgr60093.outbound.protection.outlook.com
 ([40.107.6.93]:50670 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZyA-0002tO-0W; Thu, 06 May 2021 05:06:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7euIPuIg8TNArmgLbQmfXqw76tB4GNf5sOE/gEOnzTgmDPP9bKmCoHCnnaJqi8RS2GahFY/J9XCWQN1HVmx4bCrgoGGL+tT92tHDdjpcceDMbcO4blwffVs9LxmfERaUyoMcQSS40HCDZwJMgbK2RhocPvSTfxZ8fUoAgD9642N6iICs6jBDlaAOTbZsmu17ZkZZBEsyH1M/uykbBXXCZ04iXwioYjwFrQlJgDYTpZNBDFTYHZsjyZ6AohQ7kDnlymUAPsQ/ztJhKTit2ymu1+SivDrUixx9O6WeNasOpmasjp3WIOsJ/euwYIYrHQ5nInRZMCWGZXMX4twHy13Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FvT0LdMwFqZ+YvLnNkb76dJG95GnOtmrxKV6bx2BlU=;
 b=gXTu70KgfafHUBXyIZJjJ9wf4ulPZbXtWRhPz8Ycb5JyGXfKm8viTUJWwyfYun6iA2pR5JxNPD47S0bTxY1NhbjVsBpf1n5RHsg59sEmYlZzReGlxclzO2Vo/NSfn9NqdIl+VHyBTtYooPPvqfZAGATVqwHZQDE3tz/UF2YX2clhCyLoi1RHAF7ybf/3bpIJGDsqu6UZykaJMARfCMy8owErHJDYURpQTBOZbEU/4tkJnOXsfV3BL0QAqBtWgN4soDkYZy+I4rahWBaMx5oHSHgcTJgGdgqEq8+7DrGNf0dOBmFm64FGaDEUGckx7gmKuzWXEvGo9qBOX0i3Go78ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FvT0LdMwFqZ+YvLnNkb76dJG95GnOtmrxKV6bx2BlU=;
 b=m/CmO9BmEiB65YrHGZmTmKPYKIvFLlnk3RdbDbnU+e4soy0xgq6yIkSrYz/o6nczFWFjMIWcuUOm3cFy0B7Jfj3sggU30W9ttHRgmBPUTCar3sQfx3cjHkHcWcwMzuzASQAOeIp+atf5/nM9SV9why17Mf91/j2H06VtLtpCCnY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4166.eurprd08.prod.outlook.com (2603:10a6:20b:a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 09:06:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 09:06:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v3 3/8] test-write-threshold: rewrite
 test_threshold_(not_)trigger tests
Date: Thu,  6 May 2021 12:06:16 +0300
Message-Id: <20210506090621.11848-4-vsementsov@virtuozzo.com>
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
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 09:06:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f9d02bf-5bda-49d0-a8a9-08d9106e43ed
X-MS-TrafficTypeDiagnostic: AM6PR08MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB41663103ACEF755CB92B8379C1589@AM6PR08MB4166.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSjSLXZjp7L60lTeUmwl83pkF0JvEZPhWhPdFJrb8qwSGNGK997H6rtYRkqete6H01VMPSdly82tWKRcYh4wzUCAITOI2emcqdUd2NFb8vhn/bAnhT8MasOa3Iyt64mxa8gc6HcLk9rrQmyH6QUVs1LRu9GLJ+5DpynGneRXvCyDOcnZPsaqSYeKKE23tV8j7gMMcxMi1wyYk3BPDRT+1Pk47F2SXRbFQi798ExUdkeuKxxldAaljjqQfYHI1Nb0BQy9b4PJZkvgcZyvoddVaezspGprGqOHmcjN33Dcj38EYn8U2HrTQUljGIdYvxhiL+cEgF60C8IcDpdYwVFkISA/jeRXg99JsjHxwn6FY5ZZz0wNsCrTTtcewCFxKVEvXSeyXQ3KrIZXmSrb6R4wLDRwtwGxmWfPd3FZx7BWE5WlQjwc0Uf0D7kULuQazO3JHzEuS+8XlESL5bGDrO7qKmoesa0HQXa1wlS08SSTHR+kyGEx9/yjJMI9bgMQQshmi5arD09A7pqZCsj7Zmf1R5N7L2QqGc02qTVCnak+Ohu+Y73S/7wfRT12ylDZCT5HImNsxRSMQE41rP5guvmQH9qxJ1CHlO+luo0cQ2Rz+2jHvElv5HfPMifWK5XJMTwJ1bgU4X+ABxQtgO7K/fOZacR0q0mxzV7zJ/aNW+mmec8lc6pgzrZ8F4Hy1X87Uzja
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(366004)(376002)(136003)(86362001)(66556008)(6512007)(8936002)(66476007)(66946007)(316002)(6666004)(8676002)(36756003)(6486002)(1076003)(52116002)(4326008)(478600001)(2906002)(956004)(186003)(83380400001)(6916009)(6506007)(38350700002)(2616005)(38100700002)(26005)(16526019)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?A5Lo6eXNtfMD70TtbHUGH05uEy/Lzyg2HtCfrYKyeD1YDAAfLpeB804gSMDQ?=
 =?us-ascii?Q?xUys27hlKagtH0K/71pwgbrOyxSPPMvBj3RM0N/9cOa5X78V7lrK7e5TyZLT?=
 =?us-ascii?Q?P2wZyqNznTf0zWEOUV9U07hSFKakoyQd9vd/Im3itShX2cAA1RR5vBdmAs8q?=
 =?us-ascii?Q?kIs5wg0nAVk2ZO4TFCBXHf61mdRf+/zZSsZLg/U9s67VqmSt9ylhrsJjRtR9?=
 =?us-ascii?Q?f5GsLyEkG5z/VGxWj3f6+hMiyl6UZL5CDXd5vEZyYWxxibVh4wOzeBsZQcOo?=
 =?us-ascii?Q?sa+EhcEbMygcm9bhIwDxhnbschFmBzxrZG7SNPuOkHBA/exh6bTtVE8lrzm2?=
 =?us-ascii?Q?MawcFQxYwlqmnCqAwQKRd457KoEI1z4vloPZM8YBA/782/WZRJw5eQcT9162?=
 =?us-ascii?Q?EgsXYBywg6/BSEVZv0YcKzOKRWTPvkQaj4vI80bFUjr/RNCVDKajZXHxfVQ2?=
 =?us-ascii?Q?S58cAbxEo2qEx6mHQ/Qi1NpuNCgu2C+1Ewu0ZErz6Z2jnX3BgxDaDMlY+UrB?=
 =?us-ascii?Q?k4R0TCv6h/4EsjznSUatn21h9ktHB9lypsot+at40QxeEq2puArvDai8vShC?=
 =?us-ascii?Q?u9lbiLLkC7FcHkx3xvrprl6gGE0ebBbmatDNo1ph5NZJoYKPd2Hy/8aRKn2a?=
 =?us-ascii?Q?rTTHJJ1usEwqebwBm4tEhGgN1boMi1T+hWcxTfONEVhbsb55r/tMnMfm2jrA?=
 =?us-ascii?Q?hrd1Vsz9KSUcCg02BZf59OlQAHOwaZ/TY8c73uyG/wm8sHclRD7AXAQI20BT?=
 =?us-ascii?Q?QwE0QKFS/C0NmcGIrEGGy3XtIogZFovw801ejfQkNhNVJX8h76+1ukJsikiD?=
 =?us-ascii?Q?wYpxpADUNNjHba9Zwfl8FED6tRGQtwvQnu9zpgEhFPF3fJFA+mbVw5M/AYFb?=
 =?us-ascii?Q?rHAheM5SFeAHDiTJYGRM0Sedt7Er+DfWZVNrBarWkdzJEaSC8FsRf2KYaJSQ?=
 =?us-ascii?Q?D+UNpp0O5wahL59+5lE4NhqQBNWMpcAbM16HB10LTn93QULPQekw/AoebX3f?=
 =?us-ascii?Q?Hn58ipRTO6fyrmFcoGKlD/6kL1i2wjeulBKtIxx0c7++CLPdFcmp8rHmBbo2?=
 =?us-ascii?Q?tQJfYnoZirWGdohMYIalzunBAPqLkeOyoEJgjkYVlSj32MJD4jHQK/iHZDri?=
 =?us-ascii?Q?WvQQIi023j5aei2oZTVVWBGtrrn6dTQfwANRK1fxx86pSd2g8DaEYO00tWU2?=
 =?us-ascii?Q?Jcz8FKugqCQSfIumnRSri2igcYIORgFksnuofbH1IpZA/a1dGW86hbHlBRQJ?=
 =?us-ascii?Q?ZBt94/ENLEOb50B6ZdfzcZclU/Iaz0w2EFlUrYPXxD6hwWUprgro6JfI706s?=
 =?us-ascii?Q?bOSgbRQtfZC2AODrA5GGAHvB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9d02bf-5bda-49d0-a8a9-08d9106e43ed
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 09:06:42.3414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l75Bg/dNax/uCTAB8sOjlapicsFby9AFFREYaGT0Eoczm13NiOTalN+07aNg2W45MlnG4SVc7JRhaDZ5q9CRzkmxRTd3imXKJNm7DegOcOo=
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

These tests use bdrv_write_threshold_exceeded() API, which is used only
for test (since pre-previous commit). Better is testing real API, which
is used in block.c as well.

So, let's call bdrv_write_threshold_check_write(), and check is
bs->write_threshold_offset cleared or not (it's cleared iff threshold
triggered).

Also we get rid of BdrvTrackedRequest use here. Note, that paranoiac
bdrv_check_request() calls were added in 8b1170012b1 to protect
BdrvTrackedRequest. Drop them now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
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


