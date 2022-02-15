Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E414B743A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:56:50 +0100 (CET)
Received: from localhost ([::1]:36238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK24G-0001G2-LM
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:56:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nK216-0006I7-7H; Tue, 15 Feb 2022 12:53:32 -0500
Received: from [2a01:111:f400:fe0c::71d] (port=64834
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nK213-0007aW-Vj; Tue, 15 Feb 2022 12:53:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgFWvCwbUZbNpZcXiitZTb7qKEY36PW3TWM1OAqnwJCD2n5JqTWw7hOG5aRuFMCr2bo2lJUmdG44e5Dcq7sBw62QI3xqcncxiIx5UpqujNqtoBINzgV4kTIGMqpei4/AvQmCJkL4/KcDMgN7DNog+Vhr6RVWsMY1flXYP971hVZDXcP/n3/LIPGX4LAlFqc80WEv580tICLx1fbjZ5oA37S0vCsW8XqdyNiW9izNkR0FNVnejcK7RWSbLSwv4kir9V7hPjNKuxrnczu9W5IFo6M5knCTXG4vRrXaZ/bjuEwNaO+x9LaT4+lGkJKJAIItAXtfbvDWqKt5JkUKCuAiHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxU3LhKvBse0KPOF2r/W5QyGfMZLXkFjUbyGmf4t1Rc=;
 b=C+G9RH2TnrRRX8oNb/+/29coBS77zMSTSZ+A1VrdlBKBUwOGr8zw7fKgsRScUADDzB+iPHHrXLEzXVr72+3iRWgjVI42QYw2K9O+k+adeD41Suw01fsAvIp/pjtmnxiTJExsUSq1JDpEvpqESPbyupO2sAmvikH55W9CzussgWBh/gVF/Jo2L0bru2jM5DnLUYJP1mfbM2drZ8QoQYHMVJPeHseGxw4ZH45yz1TfP4hDMBJSg9JUU6OwLT5xAxPT9ySA5g31CsqHokatQEbmylAwxFQ/IVPHFBmGVYpFHLCyHHPyTTjjKOKPtAoy9VELJU3XGaRevHsz110iICn8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxU3LhKvBse0KPOF2r/W5QyGfMZLXkFjUbyGmf4t1Rc=;
 b=YKQYnqKR+7qrY5T+WOqGw2iV2e3d3T04FpnHkuKBHvDG5tr+IosMwiLPJBC2bZimuq/R88vz61Eh2OPEy2IOAbFrSmAnARletjfNpwkQ/4QmbuKgfqvD0tDeSZVz7brIZxvGVtAeX4TXmTIgFbQKBCQcYdr93JxMGQi0grd3joc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by HE1PR0802MB2235.eurprd08.prod.outlook.com (2603:10a6:3:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 17:53:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.014; Tue, 15 Feb 2022
 17:53:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 2/4] block: block_dirty_bitmap_merge(): fix error path
Date: Tue, 15 Feb 2022 18:53:08 +0100
Message-Id: <20220215175310.68058-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220215175310.68058-1-vsementsov@virtuozzo.com>
References: <20220215175310.68058-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0013.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::25) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea521568-c819-4972-667c-08d9f0ac0dc1
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2235:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2235FDBE67E41099F7B1AC11C1349@HE1PR0802MB2235.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:91;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2pnYiZ+1DVkSWRwQBCnvXTENj1W4sc/cPi80+EWwjPEjczGrOnsr3L/jbhXOtW8xXoiPTEGhbEV44EcHMt/eXQbq1RWGrO2BsT1xC+GLLhDwEYWJrHc8mQo068RTdOLTWTQIMwADW/26P4RQ7m9IwNWYMyexvQZ9BfXBsqpf1GxS9TXzP6nyoQIWk1+7PyBZQSyFnMuyTz6wbQY2RbsyWnWirlFwKDCLd4x3aU9KlzSrvT0jxd9B2hVNnkmLmx3jcIjmTviuwL9cvuZnODFZej6NRgv6G5pjkVE45iH/EVlzV/AumsQ7JO6XJzld1mOCS1uuxuKwjot1E7p0e7Q6i8hb1UIttYfdtuUWC4G0Xannd0/WvwMAtyOgNt+5A2dbzWZiSFYnZ2K/lexzrEeR0O65oJT/oSoipR31v3cb8C/LGvvJxQsTOHLSTgaYSq6lNPufe9KcfJzG9yYdXpxeURtGhhYgqK2dDeN7iyMgIbvQyIn6HHOhX11O+eR1Mtu8isb2x3BM8yWNU6apztoa2bxxNVroa8Sx5v7A/8r8swXX/h4tPGaCxIdnMO1ERtXWz2YFOBJWQ3cQHqd/TSyLTdwTMHxmePsTJBW0bH4O5HqJZCMfdDCdiP3dHKn2NOaEm3RVV1+g5DwaGRgidC4xNMGn634kwGXQTb6Z6etzsJPDda0KE+00bwNgqvx8PiocgdXKs7EaZHhRoqNv5kbGUrteGzDRY6WIzMdrFbZRXdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(6512007)(66946007)(4326008)(8676002)(66476007)(6666004)(6916009)(66556008)(38350700002)(86362001)(38100700002)(26005)(1076003)(36756003)(5660300002)(4744005)(6486002)(316002)(508600001)(52116002)(6506007)(8936002)(186003)(2906002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kucS5FmRIc+qk6N4raTBh2j29cMrt8xBDk4VBT0bH7VdTQ/9gORKT0qIc68+?=
 =?us-ascii?Q?MxDAt4t4VBrTV6oD8tvJ90+4DW1ohZPv6UzDnO6xgDNGgmrbZ0ITiP9L5SwF?=
 =?us-ascii?Q?TVXJA/f7/Rg41d7hdv/x2qdLVwNCViNEquOrsrnkR6r3oMcTToWWpT+4nRth?=
 =?us-ascii?Q?ZQObCSNAHL+SzbUVVQLPFCrRtYl5PhvN+ynA5ImraOwaDs2AvSwYZtqZse+A?=
 =?us-ascii?Q?TS6JDqELDEBhF/ws6VzSrekHu5RXjBVmxCa7xqMxqBqQ4S7ygnsT9TmTs+Pi?=
 =?us-ascii?Q?heesrBWqwy0DpurTthQsK3gk1q9ITyHP1DrNnfPpqmDC46jM1ClBGmp7hR2J?=
 =?us-ascii?Q?aVr19fjfBmZRhd3OteQQD1NsCnbGBitkyJ/r+f2v842gukaJx3bUw/Zqn6sT?=
 =?us-ascii?Q?zUufa/TvqUBLn4QKRoGoSGcklD3LD9zeO7Y4vUqJILmsTyDI1+WHJGi9/M/h?=
 =?us-ascii?Q?HG1q9ZTirtD1tHKYg6aQ7YlwQLylsU8Qec2xbRKwcon/u4GleLxla1MlJFr8?=
 =?us-ascii?Q?/Rwjut/jVl401DT8yNMFfBTAnjDUJNkl8OcaUJ1AhWiPWgD87tDYy8XKAk8E?=
 =?us-ascii?Q?iaXu7ZIsa4WpBXAeGPk+LoyvAyfwhdcz5yGa03qxzNOVWKL5QriInK2up2ep?=
 =?us-ascii?Q?cfwvBnb+N05EVKkBUr5UVEXdUDJLDQX8tob4w1ESFU/aUOPvVCY64yjapqI1?=
 =?us-ascii?Q?iYsti25X/ML3NaFVMy0aRatM28TLP3e0VvJayhWGOc3DVRdAIxs2moXnVXfl?=
 =?us-ascii?Q?usiaHJocHi2isg9KpBnQSg87LRcUxzB2jooYqbbVUevVhq+Ck8jZQgDz/JiV?=
 =?us-ascii?Q?hRr/QuExvj47WAIVEhpDhC3H0XcfUH4EVLlVF0zH1vTs+524vP5e776oLruV?=
 =?us-ascii?Q?iIaQmqpnZJr6UUe00qLmF0g5WRbUGyblMzYgltbTU/W/hG2tbvS66Oihw71p?=
 =?us-ascii?Q?Oj83QdCnVfEW6ulMqGB9tx3RndQTUGtE45n5VIOVuFazUenwJvvCmL4JLcN7?=
 =?us-ascii?Q?tDh1cRC1Ib7xvwu8Dma00EFgS9CpCozZM1ZVC6BoHIEsGWkjdoRjJddd/8bl?=
 =?us-ascii?Q?Ggm+szlkMUpovipKq1ItG6ILlT5RKfhLQUZ37wurCUQBg0bIQQw3M45rC0x/?=
 =?us-ascii?Q?SyixxAclV9yZhlFUth0Esu8XjFJ63NQeew4znb/XgPYNig9MTyrPm2Xcbtjn?=
 =?us-ascii?Q?B+RiKXTrhyEYQQpF2kEG6BRNXDVpgdXKYl+g1+/+jTNpm7oz0Meai95OF38D?=
 =?us-ascii?Q?ZxsLleDZU4LE2NZEfSacCd/1aZ0bo62CKDowXHIC51m8eezxnxFPHml3ObQ5?=
 =?us-ascii?Q?ksXAxGqjGaPPiToRKYuJZAmZSlaUiQktm70BVCfOupwPDblhqtn4aIFtsy26?=
 =?us-ascii?Q?rI2WVfguNdDU/Sj8qKffkyD0F5G+kNANahjwBlp7rbuhSndZ1rvAqm6YLGUn?=
 =?us-ascii?Q?G8xJ758i0cIWdG7+vgfHxdXVkfp9LSUXYhhfhEzyufx211goA/CNM8Mxzg6V?=
 =?us-ascii?Q?wjAdCyZjLLbP4Wr32XTZR3f9yDUOrA/J6bM+wDKjn/YHJxtHfjx8MWxpgjFq?=
 =?us-ascii?Q?4xEnCDQkU0Wd1DaSEqhTwAXbmucvTdEJtbJGZ6UmuiyR9tkwVpP9SmFNKYI3?=
 =?us-ascii?Q?x0+0vOjrzNzFszRWjUkWdsIui5jYDSVV7577uh2o0oPlGuR70tTR95QbTmir?=
 =?us-ascii?Q?bU/wJDxifwrg9mQ9ZBp3JZ3yGHQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea521568-c819-4972-667c-08d9f0ac0dc1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 17:53:20.6704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMoocFyoM3P5mTjzLCAdWDJwQmmupviF2usTeTuiS0vZNDruIX0uJNKVDZZNiOAyYkz0cLinHUg4xSmuHtgS+/2gTQIUSBXo7YaPYhxrdzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2235
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::71d
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::71d;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

At the end we ignore failure of bdrv_merge_dirty_bitmap() and report
success. And still set errp. That's wrong.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/monitor/bitmap-qmp-cmds.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 83970b22fa..a94aaa9fb3 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -303,7 +303,10 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     }
 
     /* Merge into dst; dst is unchanged on failure. */
-    bdrv_merge_dirty_bitmap(dst, anon, backup, errp);
+    if (!bdrv_merge_dirty_bitmap(dst, anon, backup, errp)) {
+        dst = NULL;
+        goto out;
+    }
 
  out:
     bdrv_release_dirty_bitmap(anon);
-- 
2.31.1


