Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B495A4614
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:30:07 +0200 (CEST)
Received: from localhost ([::1]:40192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSb5q-0003gM-HV
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0m-00065W-Gi; Mon, 29 Aug 2022 05:24:52 -0400
Received: from mail-db8eur05on2109.outbound.protection.outlook.com
 ([40.107.20.109]:39455 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0k-0006h6-Tu; Mon, 29 Aug 2022 05:24:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=da0tjhFo4wxf5lCQIfPYwdhFMz8k7kqKllXuuylk3M7okRJM11wVi5HZ+uwFtOwnlQEDAUJ89+HJTCS3yx9qu5OUFKG3/SUSL/cQM5tZhtOc5UHz/uxqqdQgp6DcvbXiXJ6ZRhxS1DJX51s+nLVmmXChSBjscW8RKB2sy1143lb05q5H4tnU11uoUq8vHbFQwOh30DCaoiUNgFIxsYTPS3EYV/b5C9tXj51BJaMjZh6p8ROJU+FhT2j8JesfArG43YGokrE1tLWaDYuJPD8NnwshKCbvbvIjvhS6rLohZkei3XdLV8fyFV1A+tWc0z7fmSZhzLAXkQTcRvDpG0AjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muZhga5Mtg2pyW235XbttJqM6vST9qzQe7PQGZbXvSg=;
 b=AHmPUPUVm+rhv7B4K28fYdzu9/ytP2a9hdfhAjI4qVWZ7/Ur+VfI6pAI6HSoxTyXXajvkibvUlgOp0vUXnXMaZMvLI25Qy2XaM3wJsOyTlUIfWsLC52EUH8AsMWuE4pNUEXJIrQyTNOOAu9jiY5UAELGt0DMyGXIyLtEQN6PjqaX8nBL6f3UUPtFaqGkj8/F32phDwytltP7VH8CXe7dRfp50zXi17rEKdOVhEDDf8Gj5CiOSEV1FlVolK8pqnqOglZNLEUIYmi1MoQf4rpFNbzc8n7uDt5LXoQ+QwPLPobliTsoAKOWvjlDC70ZeGfa1OHwP0t16WSo2w8LImSgPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muZhga5Mtg2pyW235XbttJqM6vST9qzQe7PQGZbXvSg=;
 b=Kb2K+Rtv8UcAGpf36HQnYD2ET/RTsZkSFxEsLdQU3RuXZ17sv7rvaNsr1V1C3T2yPnjCscTnPgmuhFF+9PrkLMXWMG0ratcFr9IVT281ve2TaenaOyyq7OZbIU/1FToSmeseM4flyB4+zQgYa2D00LC+VRcInFV+GOs/6GqllkQaPbhCfqFS5WFlpTUdqT7s4VDAosBLXexof47wwhzliGOrnaGplC5x0dntGV47jW/NDxiUUoeGhtp2scCmewXreWTByo5rSuC7FsQcgIX+aPI50sIYEHnVSi0PNiL3xlqy4noRTds+3F32Z/rc7ZT5wIZjQ8Gnve1pEj3xiFaVcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB4447.eurprd08.prod.outlook.com (2603:10a6:803:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 09:24:35 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 09:24:35 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 10/10] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Date: Mon, 29 Aug 2022 11:24:19 +0200
Message-Id: <20220829092420.341050-9-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe46e345-acd8-45ef-419a-08da89a049ed
X-MS-TrafficTypeDiagnostic: VI1PR08MB4447:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7VWfv3nvCSWPpRjt7CJRojFmFltSGz/KXTXFudkLKX/VhSLPUAzLPpabVJRLNXTQNuVm0Q+ZTkM9mSlrTOqukNsGXPO3FhTfMtQXPUZcVg45rhoCCEgN4mOH5uCKoaJCACXDMyo3oPBVbzdJe5HKI6lzpWim/D8w0fuAPArioyucINg7aAvn2UHEeosoANmwKlp1yo+1KDWX8YKLAXn4JDAr0DJwu1axZ3i+CaabwpJ1A2d5tRfxZk/Ci0fsu94OAT52h9UTctzynMY0ME5DkEDGTSQ4Um0Flg2mfbfYlY20O3bImX69DXuB/XpjLczJTqLTNKYYP/F58JkQrDdEJ6dvnpx8foaUoR3zghJwYCgtmDRuaaeVZ/f2wAZbdIgPkAoVlT9WXbwLkFGI88YM9eyAJYpJViQVGewIWOA4gvV8qS8JceJ1v6OVArwoqbgiKbuXtL9LRR4mY/Y/ei4k0JxiprLE/vfuelSFdPxRgNfOSFG2lsDx9nTVVV4QTkqyb86luk8yQSIkHnqtMkWX/fPWlyslKqCpoeTxYOluWV8yaUQELQ5YOgO70IRluxXRnEHhOmuTCwVlqPDjTB1RudPQy/gQMSyPShaLKkIp1i9YFStAjnUkPbAfIDqyiMTyhxs9PUJSd2nsyQ16lYFP8TCBZRVviNKdFD9keBxU8COrT17ykhQAi2VhHNWBbkYyX90VoIw0YqVBuXhJiX17s8eEzB+s3bLLr3d7nZg+ajHcZVY1/GT0mxc3jTdXmZYRxpQJDrcjl3G5+tSD5XcrUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(39840400004)(136003)(1076003)(316002)(6916009)(8676002)(86362001)(6486002)(4326008)(66946007)(66476007)(66556008)(5660300002)(478600001)(36756003)(8936002)(41300700001)(38350700002)(44832011)(2616005)(6666004)(6506007)(2906002)(52116002)(38100700002)(83380400001)(26005)(6512007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z8Wui2aDSr5QvRH1EuC5BNMc+PNBv74hkJYBNQXldRG6JFagOkufLn7z5KLV?=
 =?us-ascii?Q?YZNk4W0Mvj4ie3k+/Woq09t32eYLUhS/V5IR8XQ1hBWdWoFk4bbuaZcHQ5Wq?=
 =?us-ascii?Q?0a+DK633oPKv+k1nm7QCT/hAjGshK06DdHLnlnf4XQggYbAmzKWVlMAhZ2GP?=
 =?us-ascii?Q?vcGFlc2JyX08NQuxEP1PuVrV675GcXIEhZwxwOFY2y7Jv4rLARCTSeJSWnIC?=
 =?us-ascii?Q?Sw8ha83/tOrj7yS64wA7AkmXh4LgZjnFSgLBRVfx/qY7GyQPYxWlZT9Thf7j?=
 =?us-ascii?Q?X4w+7X/fphW2k17I8/7ie1VUSToDGEbQ8cMrNzt2l8dRLbFAEIuv65qtM6hb?=
 =?us-ascii?Q?IR8LZmG1cDpSJ3uM7Y15ktDPMrSSWxwVJwo9u1YBapUuTeOkdiF+PSt/L/Qn?=
 =?us-ascii?Q?lRlDO6yDPTOxjBbZIuJZzmMvgg0Sg4pw4vrqDY/SSr1Ukc9/R/FQj1mvyymN?=
 =?us-ascii?Q?j32ezvQ0vtzkhLUVePMdhDCBZGu5tWcIJpzlm/Fr6cMqHuBJWQEqVp/cayPU?=
 =?us-ascii?Q?eN0IYmjNPhgJCTz8OfQQHVJ77/Glyvq0o06JINarjwGthDQCIsf41wjDuhE1?=
 =?us-ascii?Q?/0oCBrTNvhgbhL0xec/T1g5soZpIvbNJTgGDkO0PDkFzvX++1p8SqKtSaFOF?=
 =?us-ascii?Q?KQi92jEKIRUl3lThYgDZNT6l6dOkHHWs7mqfZKNlgig5E+nxnnwwvKa1+Mjt?=
 =?us-ascii?Q?rZTsl3liqT2PTpi7HjAfyfgkVJvPtN9c2Tld3ceX9zAMQ6Wznq9/0RSMmXmB?=
 =?us-ascii?Q?MxNF03QRTcg6ddOSs0ZZVJ6ApS92xPKqFRgi5P0mkxa7XyiIUxF03V36yv3G?=
 =?us-ascii?Q?vVGTkLDGfcAW37QlgM2Rxhvm0ZUjj4PQzU+aQU0ZvU0pusEKCBQfKKU7jJBw?=
 =?us-ascii?Q?H/WiPVdNUFq5DlfjLpAE0JiaDqTOrqqXYl9sawWams+eY5emWd39RtS6Iujp?=
 =?us-ascii?Q?UVFcVJROBF9uBF7djARG+ZQP87gV/OCPk6VEgzaGCTiIhTf3XmQ5dmqLFF4q?=
 =?us-ascii?Q?GyNj3HCHyB+6xc3snh+OpjVsGHlLMZK+8HCglUlvkk5MqBoMFFUcafloMB2V?=
 =?us-ascii?Q?6FFi5kGOdKWAd7lIaIX1c87iIgLdZNfQxV5NxzNwwG/KqNDQnPc/lhS2DpL3?=
 =?us-ascii?Q?x1dO5jLRJFrXpOo5S7o68Usuf5nuVIoKI9+nfmA9dWwDwfOnCKasqSuZtpVR?=
 =?us-ascii?Q?XE4vNT7nqIuSqrzVnKbtoM/u+wPE2i2LNB+waIPg4hykBbqNrt14LCKbEFgy?=
 =?us-ascii?Q?ftCyz5TMlScFvJkq8Dh4qHz3qSBbMKAa6hS9sgBX8WGwKVKhtaRztuB4NRRH?=
 =?us-ascii?Q?v8mi/xlwwDcIvwzYFXTe1gwmtBJLBwBZyTMNfcCPahsBAPPJdANUKk1RJFoO?=
 =?us-ascii?Q?8XOjjKQ/XkuglvhqxKXUrFYqte64ZuwF0bry2xuMDkdWUZPrYZznHgpUdjXK?=
 =?us-ascii?Q?XxQ1bOoqcZ2w4tgkuNOz+EnYfc1SXFNLybs9JZB53jG9miL2wAyAZ035w+7y?=
 =?us-ascii?Q?Px/SeJysp6iDkU7CvaOPRasbaczc7YGsC2t/G2KmMvXhkD+Xk8uR5KQvsCZv?=
 =?us-ascii?Q?cgKVJlAVI9RJyzTVsbZZP8x4RxHru5/+9lh1xVRhFsTePgaRORvAb1AiTYDC?=
 =?us-ascii?Q?Iddyn1Ngl0gF/RUhXXVa3UY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe46e345-acd8-45ef-419a-08da89a049ed
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 09:24:35.5342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxcEPEf9Ywxr6RDxJsznM6gssLqltPr42JTuTffm5gG4rHusEMxAreTH4KHJzqWTeC0DIeGhwWkqRYY5yi6zwZoRgHz0U/eTjIh7mGkA6Uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4447
Received-SPF: pass client-ip=40.107.20.109;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Replace the way we use mutex in parallels_co_check() for simplier
and less error prone code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index eacfdea4b6..8943eccbf5 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -561,30 +561,25 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     BDRVParallelsState *s = bs->opaque;
     int ret;
 
-    qemu_co_mutex_lock(&s->lock);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        parallels_check_unclean(bs, res, fix);
 
-    parallels_check_unclean(bs, res, fix);
+        ret = parallels_check_outside_image(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
+        ret = parallels_check_leak(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
+        parallels_collect_statistics(bs, res, fix);
     }
 
-    parallels_collect_statistics(bs, res, fix);
-
-out:
-    qemu_co_mutex_unlock(&s->lock);
-
-    if (ret == 0) {
-        ret = bdrv_co_flush(bs);
-        if (ret < 0) {
-            res->check_errors++;
-        }
+    ret = bdrv_co_flush(bs);
+    if (ret < 0) {
+        res->check_errors++;
     }
 
     return ret;
-- 
2.34.1


