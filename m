Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C7266B23E
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 16:59:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5P9-0001i5-Ad; Sun, 15 Jan 2023 10:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P6-0001gb-CG; Sun, 15 Jan 2023 10:58:40 -0500
Received: from mail-vi1eur04on2133.outbound.protection.outlook.com
 ([40.107.8.133] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P4-0001KA-SF; Sun, 15 Jan 2023 10:58:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAqOkX9Y1NCSNgkZBPEXylSyOP6TGggL6JamH7Epw/HOz/yw2ADKMVdRQzf+qPj8oYvWhnmg7c9STVh8CSJb2HGuzSibl3AOOUY7v52JyfEIl3MeeiZPRkUPLC71WiNIu3fkOJbHfgyyThRPpkPDiBW4XMVrDzHGH+snipacMNK90gTemc3qRIfSSogknseIyvtYFY0U120IMI2T0LHIDITBWuJ7NLCMe+y81Cb04oBVDDXRViaN0t/7jHgRJk+KDi7UynpQ4r+VWk8R5l1tmgn0WnA1DmKyvsp4Znz73sPZ6BpI2d14/KoMLm0grkKZnW6JHHo7AmsEYCZ9GLIuIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZn5Unxv56NSlfaaVFjnpzpNdkR+46E0YNsC2j2vs/4=;
 b=BxJUOa6aO9mSPJBzG/0toJLZQeClgJZeTAsneRFtkJz9hqNQ7GEth2hsWb7ojbabNjuZdxOLgPn/SWPQ++EzSQlHwdqo0k4kmQC10esZE2DDrHtqBjaCvd0rD8qSz4sI9xAAacTXbmtTnctJqyPfAbc+TWHOMS1NPirC4+SxWwRQjJn+njPEg+g0clwmp+sWW3H9qPHpwZCVEaj6EnCCgLYBf0a7vhZZwgfvkWYeMUSjJwDchsbRbIFVyZXmT1Z+iC7dhUqs+7ELQCv+S5e2c83J6cRJK0neZF0A9G6YK7UjZeiZxylrIahuJ2r8xJIBhnRI38WGrHBlHADMzJNm3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZn5Unxv56NSlfaaVFjnpzpNdkR+46E0YNsC2j2vs/4=;
 b=cdIWThgXjjx0/9tfa74AqVCaXZ6ap/ZXIyu/B7zil1pv0kglwY0xDLVNGjBQDEEfndicyyt5niW8n+T/As/Hga/l50AMZTvZpbsx7kIQUZ4JIK6n2dstFqaJbzZqP+Pmf63xwvKJj1EEY5O02b5R9jl2lA5KDnVjCCgy2G5QUHKIrwwD4/7SqbdnqxZNzr0KI/Qw4+xIDP8blkcdSRH+s61VqDkvSt8LGPrhjRQ6CZ9tiyTU08ynMwMKxfIw1ydRwWrG30734y9wf4/hA//Tue5aEClPm6/+0AO1j9t0Iv6yrAINtYwKcXNBfA7v1dnh1EqxxBs1TEZsfMEBo2l5Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB7857.eurprd08.prod.outlook.com (2603:10a6:10:3b3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Sun, 15 Jan
 2023 15:58:29 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 15:58:29 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v8 02/11] parallels: Fix high_off calculation in
 parallels_co_check()
Date: Sun, 15 Jan 2023 16:58:12 +0100
Message-Id: <20230115155821.1534598-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
References: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0312.eurprd07.prod.outlook.com
 (2603:10a6:800:130::40) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: 195000ad-346e-4b27-4d10-08daf7115864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BkJwDly2161/LfIamYWrEZiBGLW3Yrr7e/LJHygH55YTdnTPFFcyZl7QNl+uXmCBPq90u7NmVH25VWb4vdW7W+gqsTxIe+K0QK9YoQkiNYD/zSqtDPfOrnPmKkXkFH+whf1LQRB3vmxyb4mm9gqgU4qG2j3RjXIdZ0rzciwuNB4U7pPjGCxf2s6OkdFdj+MfIgk94M4f3xphe/57oJzOqKPzeK53bFfjrqIgxzUCaV6/1GEH/6dYPKvhWXKZ4oNSF/SOxaFECMKxuj6PEcO8mWrlYxRX6zAhYMxSXFYn9Xb8/8iseqMn2O34oKCsb5FbqDnJkx3AVIMSpetRjXYmTZN5ElvQPXSAAvUby5tkakDkqPr17VQaGE/SEj7WQ33qaP3q57qyEe9PPZ7iBEue7rQHYgmawP2EqAUumdWkvM0vPAmYhXWsBOCnkkjtRB+qum4CH9dYKbMdkCTGPNzCNGMP/aT3oyRzYGBGmILiDrXgceO7CGgGw7yREPwv7Kt9dsRUv1IhZb6wq1sZ1bnPVzb9AiXMtNzVIenRt3xOmmiD7m1osseS/5TSuSQZwTq3sWFkfqCD6G1idSgvdOzR2PTs64MFzRzYwa3BhWZ6y5nO4UoTL1Jw+3lu5qR2HgUCXji+oeXhcrPrcygULr240NwnMJu2lFMldnJN39vR3jUeEu7g40TyYVie3qPbhUBJHZJ63EGtkeJN8EzvjAI+TQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199015)(41300700001)(66946007)(66556008)(2616005)(186003)(4326008)(6512007)(8676002)(26005)(36756003)(86362001)(66476007)(8936002)(83380400001)(38350700002)(5660300002)(6916009)(478600001)(6506007)(52116002)(316002)(1076003)(4744005)(6486002)(44832011)(6666004)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?czuCqf9FpI5smWXK6gf2+c9ZfIPlK0KqBywYiF2eF9w80JmMkdzHgzyGsXEW?=
 =?us-ascii?Q?ycWCME7bDfv9AKeV03CWlKtQsayRq3pK3dJ/tcmUqpnbi6Hzs1JIchpx8d8a?=
 =?us-ascii?Q?INhg0330QszcF4UKN8e8M6LMoXBgUPNAhqyN9rZq/NimWidMfMZIFLoQHg84?=
 =?us-ascii?Q?lCNXriB3GZ5l/o9CocpqsVxbyw7UkVwBzCvzW/hB253VtCv0fPycynCiwQ7g?=
 =?us-ascii?Q?wS13+OgYacGu5vIT72aBKsPWFtwhhEQtDLvzEBS6cWzrhhe6vS+gkYt5bfrl?=
 =?us-ascii?Q?ed8c+LnwiJwL4b/PZ5nrtSF8SMIgk6wQrP7pc8xy0R3zBPj7acsYjgqi29sO?=
 =?us-ascii?Q?YnxIuZaREfr5YALftYK2oqHLoPPcwyU/qzr0h11XSTcNidNAkhZzQLNvJLl0?=
 =?us-ascii?Q?jJzXuBh0ycws/nujOsDpwfz90lFBExbvCzdUwbjcjEmqGXZPo3d3zoSvS43w?=
 =?us-ascii?Q?Ll+3r0DXgQVzlmpAsTNUMawVqzf910cXP+mxNZeTY9UeLeDQDB9ge5FdiwS4?=
 =?us-ascii?Q?Rr2cmOSToVUwEb7DR/xopvIP/jC4KPQ7Hm6LHhsybBFssz4l2V/jv/1kmYUh?=
 =?us-ascii?Q?Qx7FmDqw94f5xWLbWPQ0IINBEkdXDR5zd51fvNhMO8jgTlumACP2uP4dlOez?=
 =?us-ascii?Q?13931wxYh3xh99kVAfHKhOQCapwWYv2NJneRhx7/KWRc017lnEt9ZrSKxkKr?=
 =?us-ascii?Q?q4dQO9U9WIeBiBmQAo+utkCjdA5insKuD68EABIi9h/19pq4ojhROgXshKUv?=
 =?us-ascii?Q?6KQwLRMiI3DU8Tt30AWagqBTNGC3nrpuEwx6vrz8OHlTmrKphXrt8VPnZlOh?=
 =?us-ascii?Q?JE9UEZuIExNNEp6TCSxmWQ4P3UmiGyeH3eIPhHZgpQPRk60lVHKPL33rFTwl?=
 =?us-ascii?Q?xZWBq2gQmGjvenOlLs4uxVm7vRYc9QDys/3COFgJI5/ujx79DIit8uRcba3h?=
 =?us-ascii?Q?YnoSH4LyWySx+ZNC7aRyiFIUErZGDJ2VVsS2cfA+2HlbXkAfpHl2Rl0xCX8r?=
 =?us-ascii?Q?/mBZAVv5tr3VsPmlfnjyu/Hp0n8ibkCEI7qfN0DIHAwSCuYesO5ec6Kh/r6a?=
 =?us-ascii?Q?DJ21+Qt4LkgWTLpjOIQx9pB2gH9OoxGn8nbeSGcuXFRZgjEP26kneKYo/uVf?=
 =?us-ascii?Q?eZJGxx1tx7BZr8kGg+EzzKHagtrVNvr/rsutD1MsUlQxE1sUflQw2W4BFcRN?=
 =?us-ascii?Q?TFzf7AD57csD9SybtVtfGWk/IwndaZ8CxFPqnzZhgTaV66hgV0xGGO8C5jUE?=
 =?us-ascii?Q?fG6CA1b3jBqaI6vBjgtsyaYFmPQgtsab3r5RfXrt18AlrkDFSuY7krZP2dZS?=
 =?us-ascii?Q?MybqGCJmGEzatgyqvialxz/cET9zxgR7GZMsQcz4PinpBDdknDZGqiBpkEBc?=
 =?us-ascii?Q?Jr9qYlvzemxzcq+uEH5ZN9tCmVT/rSSBzscaEJ8MDyCYTpH9BB1wB9dZcw6t?=
 =?us-ascii?Q?CW7amBbdabGv4JeTLtpI3EF5WosxzLnNYaAzWiZ8vVwjygEhtyBjSjSS1COG?=
 =?us-ascii?Q?bAQoSbZqkrwDH+ALAlfPiwUuclKDTSNLOm6mIrlrPf5PZl7pWI76bKRTGvxt?=
 =?us-ascii?Q?kngDtnAy1W+rXKmX11HGFqHPqimrhHXsaQcmkXJs3hjBSUKTz73CoO0uAIXF?=
 =?us-ascii?Q?8XMGPLnm54II8IOx40hcSMs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195000ad-346e-4b27-4d10-08daf7115864
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 15:58:29.7393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PTkqtVH5KjPK2UYq10pDM3ntgtYNm8Z6Y19jQmOR3Nmyi0GgTNwBhW9s1fVepFek/IL58JXq1FEbLdpAejDEWCtRLxZ8i60iWzHkc23GZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7857
Received-SPF: pass client-ip=40.107.8.133;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Don't let high_off be more than the file size
even if we don't fix the image.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 4af68adc61..436b36bbd9 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -460,12 +460,12 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
-                prev_off = 0;
                 s->bat_bitmap[i] = 0;
                 res->corruptions_fixed++;
                 flush_bat = true;
-                continue;
             }
+            prev_off = 0;
+            continue;
         }
 
         res->bfi.allocated_clusters++;
-- 
2.34.1


