Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74C8372849
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:49:56 +0200 (CEST)
Received: from localhost ([::1]:44468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrgh-0002mS-P6
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldrd5-0007So-QX; Tue, 04 May 2021 05:46:13 -0400
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:63329 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldrd1-0001jr-BS; Tue, 04 May 2021 05:46:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfI/O5s2/UlINwM7FCG3vXRJSIPcEwioe+hA67XmO0CO+lEma0Ju8oWbD0OM0EAhNeRNbuFbbHVOYImUnC1gm371EKoKhpSi2mx7vGyG8YC+TWBgzVEzFy6dyt2xWP8vybzr6+9mDyH7hcmOu5/BzQkLCl2BR5SYLzYp/aZH8mlCka3jEhgRDH9GJbZf9jLW1KS6M6ypcDlCkyhqoTJAwHBYQv1QaM+FeN6r1Vuy3bK2bgdMZwFhxNExJAWkS/HdXEyqxTjuYJNeMNNn342vG4qm6zPIScUowXRNn8OpT7DS7RSzn+yfiC4TlG2VhgaawLtPfQxR9DBQvfCnmzTrPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSN/kJlrkZVbL67g+PWHPKfNTKWkIBebr4QNs1KP4aI=;
 b=PSWQ7VEtEVsIslgGEegIHGSOAqkHcMZzHFrOJ64YGNebC9w41rh+P8rfzO0JNBhLzz1gj+nuLY0V6tL1GEq7DrWWiRt59+SgplOfgxuHpXC1w7nS34Gwaau0x8DL4DAbcrKMY5iTx3DjsLrrvkbaWixuyfYEwJQuXQWLMZgwwriiIJRe4liZGnilbTxaQYaQoUHk4uV1GqZyKOuGQfpMUTc0ZfFpsyYhDTNsXoPfuHvUhFAKqtwj+AadG4QZSjpF10dvurVfg3qtK2nk0BkvTvIFAdxUCaoO4TwFEVa1IzxiZ6I8//iBUgq5KspSvctJFVysuvW3rLk4++4dZZ2YWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSN/kJlrkZVbL67g+PWHPKfNTKWkIBebr4QNs1KP4aI=;
 b=iR1IVjgxJPELlAV6J4F6qG6FZfl7hGLCsOB2lG2UJTTNMX0oKjPACh1xyIpO7/S2loGKul46P8IQrw1ZK7RjWD8QcBOgSUYBrKk923RqdvK02lgiVPS6EfDhVbUPlKi9uaq8sjtGsjyO9KXhbgcKZaT/6uOt5cwodniX5a9vI5w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6152.eurprd08.prod.outlook.com (2603:10a6:20b:298::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Tue, 4 May
 2021 09:45:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:45:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, berto@igalia.com
Subject: [PATCH v2 2/5] block-backend: improve blk_root_get_parent_desc()
Date: Tue,  4 May 2021 12:45:07 +0300
Message-Id: <20210504094510.25032-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504094510.25032-1-vsementsov@virtuozzo.com>
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR02CA0107.eurprd02.prod.outlook.com
 (2603:10a6:7:29::36) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR02CA0107.eurprd02.prod.outlook.com (2603:10a6:7:29::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Tue, 4 May 2021 09:45:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e1104eb-64ed-43fc-91f5-08d90ee15877
X-MS-TrafficTypeDiagnostic: AS8PR08MB6152:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61524D8E0694C8572C4B3983C15A9@AS8PR08MB6152.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r24/Tc23+WUR8gAV0IZfh3hmTjB2w957dPgDAiviYkxU2cmFrsuYDUYvVSndvoXEiyAe4Cf5eLpqYGgtLrx6LjfW4T4EEzuxfqoC+zV8JUouFM7ydN0sI+mhaeXJ3Hwg2ZAd8wY3LhMBXwAXg40pSOT7vZNr3MG5bPlDnYBlIfbtymwA74RURFxtvglSlEPQm19I0BEMyWigvDE03T5sehJfYYEkvP1TTrmvubF1NpuTIfUrzpwGjWgVAS3Cn2spev2aGdfyGwPMOS08jU8l626oCN7ieoVgxjRnsoTKYpgmQ2Y6112FyOlmFPWQqkibhnkLezef+ImLLKgEyvYQQiFXbj0HPJXQRrCrRV7M1SN/zJKG6SiY2WZ520rr1ZDWtZKNlYrSp7fyAVqUwJQUxdRsZJe4VrbBjIvbKVfGYTmrejnh25BI3GUWw7Swm6w9OfnBhKRpw16J8T77leospSxMTf1BRVEKaz2xXFO93YG92Jfqasm4kPAWFC0s6pa3BBiKmgxeXmVWopVs2+Np/wHn6R2PX0ROknPHmf5igOFx3hLJb8pxTn7t54Tdh8rFMeoD2+0k/6vc43n75oDesaqiA7zCQLv4bRagp5zPnTaHAJohQhFoQu1q25DTWSxXUN6N779RcWD6quDuD2/R8nWUCpUJMyyggrnYKiNB0MP8QJ6rhgbVRbgSMh88BfTN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(376002)(396003)(366004)(136003)(6512007)(52116002)(2616005)(4326008)(8936002)(2906002)(86362001)(6506007)(5660300002)(6486002)(38100700002)(38350700002)(316002)(956004)(478600001)(16526019)(186003)(6916009)(8676002)(1076003)(66556008)(6666004)(66476007)(66946007)(83380400001)(36756003)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lm4lJxOneKA99eoyLuYTO8wRtQAFFF4b3NujpyfacO6MPUBqgVWiiCwh8uZ6?=
 =?us-ascii?Q?yLedcwrw4yuh8bBbXvwPjlvT/dZGVKQV+1e2FTO1fnkNyglaMqAa2uTqOeGE?=
 =?us-ascii?Q?eVZX7KuJNPGebocrOn5+G719uYBR9x3ST7LMnR1TAEefAf73/9XsthlN0u+u?=
 =?us-ascii?Q?urTFLafNy/LM+pfLeDJ7756Qm0wJZxfCms9ymZ1rFzfTO69vzRhK3T7UOmSl?=
 =?us-ascii?Q?LvUQc0bRIkPJyS2ldBn/Mv7AeN2Dm5adUIggA9O42BrMDvErssXANpo1IYJh?=
 =?us-ascii?Q?HL4Ilh61dOOnFrTmrtQLOjlfUImXfYrpeKeE0d7pagpevWwLgWhsCzUg4KqN?=
 =?us-ascii?Q?Asojy7E2PLbpmY8jHZNdnDfzIkmXZfz3ld8hA6cVZKQ7HtjdL7Yb5u9De/Br?=
 =?us-ascii?Q?wcRwOEUBLyr5RHZDmNwTJYtIYZCiZBwjHlSiX88pM2xZIFyRcSPK6ZfgNpE7?=
 =?us-ascii?Q?p1TROL36kTs31U0kZj6KkHemKNVmDaKZiSmXvC8uSpfkQZenXUAZJOo4yYz3?=
 =?us-ascii?Q?GSx5KJ5I3IEeB1UqIguB3UHCyvLYEN0izWm1f6Q8erRZkzxwjoZAc879grLD?=
 =?us-ascii?Q?huBDWWaUV/V6TcgxdSZXE8KHir6RgtClnOWf04hgXFfXYMfM5G8FEHgHWChy?=
 =?us-ascii?Q?8Tskk/dd9Kp98i+mArPqy4KLpFgj6l0wD1uPard0I8Ho5TjGMpo5lNZejOmT?=
 =?us-ascii?Q?yPw2BuRzZj57Sufg2zOuCxWpZg/XlJvIlkdM+ltvfnj2KiPxCZhP0Ttb1MMA?=
 =?us-ascii?Q?m+PEqROL2wcDeJDfDRwZXuutbSanfuUyugNbrDs2rL+G1ZaC3corMEbR8d8y?=
 =?us-ascii?Q?ZwctKDF4Tzkmw5f6S6+9KSTVCcetS3QA837LYMuqtzGGnkaUxb9+cUHiOA5H?=
 =?us-ascii?Q?nzHPE815oN65jkx3FbJ+8EOdfzrG+2TR7TQI9WkgcxCPC7jndVfZyweJhogQ?=
 =?us-ascii?Q?GDgtsuYrqfFh0KQfvVlImkS2v5s1Dm2eDI40zeR9S8MYKaqg3vuD1pLRkJ0o?=
 =?us-ascii?Q?19D9CdIoeiG1u7W0dfsO+tTRwvfygTjKTw5UViyr+CXFO3IlKl5yoACiGlJK?=
 =?us-ascii?Q?i0W9lGv6vXWAA9CA1UFd1r8nZY3B5rTnMdqeVl4aaCY/YvjEUQGFgQMPGRRM?=
 =?us-ascii?Q?Eo0SUjpHk3UdnnkeZZ7cqrg/tZDukaGIQBHYTg6uIeCXbHqshkvgjtMmFG61?=
 =?us-ascii?Q?l1cFAE/QJPkIH8R4dRkM4+M6Jo2EQcwsBcJXDjqRbHhqPrZfWFGUycno106l?=
 =?us-ascii?Q?dd8QjxNsh8MOaKpyT3U2L7pyGIJtg9llDSqpevzyQp8BUspWkMO1UtgU6kWg?=
 =?us-ascii?Q?I4x6u0zEMj7lqHMOddrX4cfg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1104eb-64ed-43fc-91f5-08d90ee15877
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:45:26.5571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVOo3wRTzUkhvli3P3FELEvmktuusw21yjF9M8DhCp5nw8EetioXmpMpg04KoRtauoF25Lx9yZGk1vAQx8+j/WX3NH+YP7v1DYiQliOgBI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6152
Received-SPF: pass client-ip=40.107.21.137;
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

We have different types of parents: block nodes, block backends and
jobs. So, it makes sense to specify type together with name.

While being here also use g_autofree.

iotest 307 output is updated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/block-backend.c      | 9 ++++-----
 tests/qemu-iotests/307.out | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 6fca9853e1..2b7e9b5192 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -142,19 +142,18 @@ static void blk_root_set_aio_ctx(BdrvChild *child, AioContext *ctx,
 static char *blk_root_get_parent_desc(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
-    char *dev_id;
+    g_autofree char *dev_id = NULL;
 
     if (blk->name) {
-        return g_strdup(blk->name);
+        return g_strdup_printf("block device '%s'", blk->name);
     }
 
     dev_id = blk_get_attached_dev_id(blk);
     if (*dev_id) {
-        return dev_id;
+        return g_strdup_printf("block device '%s'", dev_id);
     } else {
         /* TODO Callback into the BB owner for something more detailed */
-        g_free(dev_id);
-        return g_strdup("a block device");
+        return g_strdup("unnamed block device");
     }
 }
 
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index daa8ad2da0..66bf2ddb74 100644
--- a/tests/qemu-iotests/307.out
+++ b/tests/qemu-iotests/307.out
@@ -53,7 +53,7 @@ exports available: 1
 
 === Add a writable export ===
 {"execute": "block-export-add", "arguments": {"description": "This is the writable second export", "id": "export1", "name": "export1", "node-name": "fmt", "type": "nbd", "writable": true, "writethrough": true}}
-{"error": {"class": "GenericError", "desc": "Conflicts with use by sda as 'root', which does not allow 'write' on fmt"}}
+{"error": {"class": "GenericError", "desc": "Conflicts with use by block device 'sda' as 'root', which does not allow 'write' on fmt"}}
 {"execute": "device_del", "arguments": {"id": "sda"}}
 {"return": {}}
 {"data": {"device": "sda", "path": "/machine/peripheral/sda"}, "event": "DEVICE_DELETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-- 
2.29.2


