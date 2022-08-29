Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294635A4613
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:29:58 +0200 (CEST)
Received: from localhost ([::1]:39550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSb5c-0003CB-6m
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0Y-0005vU-SK; Mon, 29 Aug 2022 05:24:38 -0400
Received: from mail-db8eur05on2097.outbound.protection.outlook.com
 ([40.107.20.97]:38848 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0V-0006gk-On; Mon, 29 Aug 2022 05:24:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjpBfJOiPkGw8l5lLfdnzI7t6uF40Z6zeR6l6ovyblbm/6qYkPCT5vw1p8XOPKrFyLSX1ZIpJCmMbQXvhM0PKFzxmG70MFyR0jpc9+MxGOXFMXn7iFu9sqrqPdnLMxCzGIXPQo9ypJx/YdyjLGtZozLx822OrY9iWPM5mxAomKCWC5fPkDFlcgspBPw6cl1cvbeydSHAu9iI3afn6+yPXAwPax+DiKB9xBFIc7j1A3/7ElYzi8TizQlAiZbX3cg7nVR+Tuawa6jjBZYS1SORru+emEtkIGJwfChOIbV/9bkURqvk0h7UiFNxp8x7CfcYZO+5r5KmoXohC99kHAUF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGP3DBjWL1JXmKfgIkKAcZVSum3f8b5ClOKzvr9OcT0=;
 b=hkscSiWBAF8JM6Zk2PNCRoc3H457oAV7BJ10BBWDGE10wBXDKEKheoRyZyg5PenukBiAJYFaiQiaEm67ROuBKkBCJcneD3EWtSDNgK5d5jpdkmkvI9qOsWPGa+xXG4LrdzmgWRlxbWgKvyK5ZZMoTiHZq6Ene3Fhrpw//krUp3rA3iut1VYSVulixVUnWuAwOMZK9H00EyPRqcwGwtftkIQxqN+mF/08cvVVT6nI8Tlcoz4DYtOzEvNN9hEgQ+kKoOF6YHrhmxAviuPSTI1mBHBqf6DiJPzh/afTVs2QouSSAEWFlD9/FG3nj8oBLLafqK4RwR8Wy7y+xx199Abm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGP3DBjWL1JXmKfgIkKAcZVSum3f8b5ClOKzvr9OcT0=;
 b=oNs4czi+SnRYguzwnUnhMQgJ08Li3NopZ7kRAIMrUP2XpRIIu+tu+T2UWV5/uYrjsCEkoe5Skz/eaYm8AhBeJX76HXwLtfuLkz3Wx5/QCAit8l99dTYSQjGgV3wNcrAoqzqGHoWHr/bu0iMbFQSs4Bk9/zekQRh5KGh5SIAA/QN1MrxMBCxFXT6nU0QOurXwTAb8d+hDaolmMR7ePBcBL0JdQWx8OWzgDnhoj/zHow+88Ff1AlwWIQv2z4dL+dz2pQhmomQXP97MZRf7QHfUSgTPPiifGzTpMC2TQN2o5NXeUghlzWJRdvw1Vpe88X9JMJHyQ1RA/bnn1HLoL4VFaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB4447.eurprd08.prod.outlook.com (2603:10a6:803:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 09:24:29 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 09:24:29 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 02/10] parallels: Fix high_off calculation in
 parallels_co_check()
Date: Mon, 29 Aug 2022 11:24:11 +0200
Message-Id: <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d83a961d-29a7-4d6f-b9a5-08da89a0460a
X-MS-TrafficTypeDiagnostic: VI1PR08MB4447:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nrMa5Fm3xrKNLEDKcG/Bod9gMn/iQuQdLZVHp6zfqF0UkXO8jYNhaF6MaFNh0uDm56tJvwKylu2pWspiYCaITTJtQkPG6XGCVuAdc+FNsx24MQJ5RlC5PQh3jMPH2cWlS3iGY0aHfZkc0F5VIOPiDKDNa6VeeIsYQ/ySc0lLFKJqnyrIOxJCrWgOaYDXv3a2zHoCrtbvRLR0NYKsaqN49Ukn3HTgfVVslQZY7ibJH/HvKhIH9eUXgra6jNSLK7fBK6uvYBjG2Ib+sw15ewO/ZloUVF8XYyUHnvegWd8NqoAAE5AbEqRQ8dbnrTDCr+w2v8rV+84oEj4UjnT/xT8cDLZz27Sf2gkAh3dGydc/TqXtyOMAf3cwCOaOreLvN+PIzRLM5bHloADSVB3sZ2cBViBptdG3kRUgFzUVaeLY8YLkt7sOtUutjk81MPQgSVvmF1BSFeRDyabWOASDMh1Jx2ZtJfWpq6HLverbLzx/HlP81TT4gtRg7ns4iV76hnrwfL/QJlQ0pvXcgbCFKOMjWrXPFSjILlZ/uRhjaIDjK62aAtpA1iy0U3QrT/mbzPOuG5AtL4UeLiXwzvT2fW+OeKaXlTBhxbwHwRjEE/5Nl+z7NreoQCPjFcOS42QnCuO3hugxM07iL3ldrUw50WNveAx166opfqttDtC12ytl4NT82GLn79pBCCOneBN3gxN3RBvnKA6/f4eKZZ1gklSD5lDhEGo3/HUJ8yKcsiNPOOFg6IUefDvIp9FegS0jPPnk4FNMurlLqWoBOCGD2SWy4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(39840400004)(136003)(1076003)(316002)(6916009)(8676002)(86362001)(6486002)(4326008)(66946007)(66476007)(66556008)(5660300002)(478600001)(36756003)(8936002)(41300700001)(4744005)(38350700002)(44832011)(2616005)(6666004)(6506007)(2906002)(52116002)(38100700002)(83380400001)(26005)(6512007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QUrbKM5CucLgHmxC9Hr87wQ2rdfiZgd8erCFQOGvX6sGvVeN83+TazYgGJB7?=
 =?us-ascii?Q?sRc7c3RKB/tXUIrSJJ/5R9WwCq9UCB4Oh145jsYBJTBuQtGSiPLSnzZl/HSM?=
 =?us-ascii?Q?ng8gVw31qVrB13VNA7TqHQl/chGg9DIz1MBUrrL2YdA9lf2bX660k7aNYB0z?=
 =?us-ascii?Q?VtJmhi5z33k42XeBTPi1skS4z4V0xqXDQpHNNoFOgdVUn3fDYHvnedgpjHWX?=
 =?us-ascii?Q?OfSwtH7odeNfCWvqgZa0VT18MfsCZmUw/J+09ryiIOD5yZ6lCHyzD/YK2lSI?=
 =?us-ascii?Q?lcKcYZjvDLp2L/GeIayRwQ8S4BdMIZH5kBeJlgo+0MtT8Mt/yKCzBXMlA4/K?=
 =?us-ascii?Q?6QaoNv1Ru/tB07FhYwPsES18MuP9Mzyv9/Fe7t7Md73V0xnpMj/NMjCvB4ag?=
 =?us-ascii?Q?MOdKPvoscjBIeXgAdB9Xthta9nVCzkcGJXZN85iYFKJas3OM+oh5gAeqpnLN?=
 =?us-ascii?Q?bcVIbIeMWe4l+iaXgv7unMpkCgr7THJkv+GzlWG0M/lEVNhFJRzhnXefP9I8?=
 =?us-ascii?Q?XEhdqnaUe9t48q2AS1nVXIDCbIX9/t5Lkx/r7brr6MGyLc8lLq3BXopAuGgT?=
 =?us-ascii?Q?S45WuBPJb4cBsVOzR2x9mP3tzMfq3RCdt44t9pp4ckTcCUylVq9xVPfKC+4x?=
 =?us-ascii?Q?QDEc+9zBbG2n/6UGleJVd0RbCDPbzpawSurKNFWqGP7FW9VeEVpRlP7BGd/A?=
 =?us-ascii?Q?GktFmavyX3Y6kGibuXnuYHE63Us0RyreLQaX0t9sRrA4OGEUttdCiwQ3PB9D?=
 =?us-ascii?Q?QlPtK7pOA8qgB0WwTwWuPMZQ2ZOvSTg3x4Eclk6+hDsHl2BEnTpdVM083dEX?=
 =?us-ascii?Q?hJqJD6jZnUCVOBz3P0x37/nvY/oabICTvlZsLO0rhEX5nhRwIN/pjUPNo3wB?=
 =?us-ascii?Q?Ta4WKaeIMHSFehZYIfBClXbemHKeky31/j35GKUUFomu+RpFnQxqYtIVuHtf?=
 =?us-ascii?Q?9eCYMnCJySojdYY4s9KOunCOJoz2zINBF90vmjWZqE7MLO+GxQCvhJ8/3Z6Q?=
 =?us-ascii?Q?7iWJyzgthMogp7Q67ghuAOlqfKb+9uDpE3i8pwTtOu3stS88soP7UdGhlyB8?=
 =?us-ascii?Q?2Cio64khF3ssvJiAlXWG5HuHbOvk95rN+qw1un/CevxaNlbsInykgTWDIol4?=
 =?us-ascii?Q?kxwGhm9wfJpkpf/PzIB/mP3BhHN2K33COqmE0lTkEuR66P6AfP5i189MeJ2H?=
 =?us-ascii?Q?z/1XC2+NaW8AbTEPqCs3DSlS9OqwY403HfY1e/uz1uBALZcBDXrQbGkNJVmh?=
 =?us-ascii?Q?+mUdnByvKZ2tNOgDYMy3o0uCA3RAJAR09PeKgoiG8XvwvrIjfActJCq2SD4O?=
 =?us-ascii?Q?bPd70rrR9TC0QkzljNkO/1bdZDUIhd7x/dP+SN2bs6oPkS7UiPCLgamEDs5G?=
 =?us-ascii?Q?3jLORWLPYDL9CZvBzm7mxtSQCxBkD1uUR9xb55aDKzV3K9Flx+i8iJMs6IhE?=
 =?us-ascii?Q?STvuNitJXrEI6E9OOHRGPpV32U3+Kp5LGoFHCI1u4oAdC4sfBOcbBrdIeb9v?=
 =?us-ascii?Q?v/GDu/+7o17RS+vtn2NhgbQy9hCEPxdhfgYNihbUCUhxGYFGlVoEoxCgee8M?=
 =?us-ascii?Q?eCeN0zsky6anMJIbiqxewizDJw9xC8cDit3eSWsRYf25tVs0ZtnkFKatnaPl?=
 =?us-ascii?Q?V8WDOkJhnsO17F5IaHmMFsY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83a961d-29a7-4d6f-b9a5-08da89a0460a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 09:24:29.1570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k96I452buBAyo9F8SFR1XwRgfcbcGF1tzS7vePPv+EW17lmAOQYq8WHevU2vXDfMdC/zqF8uuWmwrQH5k5+P4Ed29BF+Fc4+8iWl3HiZo14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4447
Received-SPF: pass client-ip=40.107.20.97;
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

Don't let high_off be more than the file size
even if we don't fix the image.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 93bc2750ef..7e8cdbbc3a 100644
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


