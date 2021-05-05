Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663FF3735F3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:00:33 +0200 (CEST)
Received: from localhost ([::1]:36306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCSO-0007xw-Eh
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCJ5-000639-0t; Wed, 05 May 2021 03:50:55 -0400
Received: from mail-db8eur05on2090.outbound.protection.outlook.com
 ([40.107.20.90]:42592 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCJ2-0002eS-Sy; Wed, 05 May 2021 03:50:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UP3wDthk9vfOI4p43Xr09OfiMcu/NZdSMmS3FRsO8gk8e4THIhcC0F+Pt7to12jDiMDSZoQEt1MWytwq8QQmes3IzEB/So03UDVcgHSpyxWC7/FPWjUNUZxMwrdm5SDiIuwGR9dRid6pUtSoRtmuPXvW9Ld+krCVAV0nVSHqvlOsSa0nlhKAXlMkmTwmsr9AG75EEbpjF+Ehxo48tszBPVFLM/ZHgqycfAZ1FK2D3wFmCJDfwBw1VhdDvQxjUw+UrNFLe/0zcsAs3zuoo75k7uTNVf+8wiP0Z+tmJ47NqS56Sbc6+6FfMFz81dk8WF/in6JVduQVmB0DJWsQus5tRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6mLkofIWm2Uvt7XQGokzAyAnODP0LsXy+zPcVOxcvI=;
 b=PXT1+dGzIjPUD7ykjTKd9RTFngS9csOkd2qrk4Bcbfl621FqTXy8RmreavJ3NmGnHK9utYpkTpviGZSJZEeAgYDMuOzZREAo8rv0pMiLR7ieOrvYB8UxDEOWuGgW9fGXqUuiEwm5AqmZc0tHA8Y+8IXh2+tRFztiqYv0j9pm07nyKFH/S2HUuDsSqZQYS4HhIuLN9sYER9XXb5jS7uNhOR21an3UrC1zDibH5kF3CKpwv+HruW1qN4n0FcIzmYmq3GjbceCZ+lSZE7W0g9UZrUGDbYM22gbuXRZEqj8y/hJxWta+s6bMWlfVtCLHsqE+dcEFH3klpXSVB1AmMkeioA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6mLkofIWm2Uvt7XQGokzAyAnODP0LsXy+zPcVOxcvI=;
 b=eBSgsBQ+P74HYUrKnOpcppXXmn/RAiaq/JQpN/EVJbWQe6I1d5ohiksL80TXIZ8G6h1OGCg76W/j0A+yCZv8+e9ff/6y/bvq3IU+xgE5VCgJBXKgEvhZUNfbul/sWSLCT/gZe1sbd9D1Gs+mTq7ACZCZvWOnhwdFVcxiXfT0QDU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.39; Wed, 5 May
 2021 07:50:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:50:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, vsementsov@virtuozzo.com,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v5 09/11] block: make BlockLimits::max_pdiscard 64bit
Date: Wed,  5 May 2021 10:49:59 +0300
Message-Id: <20210505075001.45041-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505075001.45041-1-vsementsov@virtuozzo.com>
References: <20210505075001.45041-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:50:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3463dfb1-2f27-4eb8-a87e-08d90f9a78ae
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB68394769AA1DAE2B33D33001C1599@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UKjQnU/MRCciPI6Vmn5FHg+7Xhk2DCKLkfRUNsJnbFZVYTxIYYhSuXXmTROqKlFrOcz+EmXbif+zlwDy/+upPDq5pfGakU9eXsEjXStmLo7Uolx8CEhWp8UP8GT3rlqXH6Oly61mg6KUAbl9ExU58fKEc5MtlFmsfSBS95nhckzxayBA+IO6k+WFB7ky5XJua3kC5YuTAJbkzo4Q3YFxfJU6ya6LbF7a3Cd2lYfIYLiQ+7gwY09DtuMg8OWZe5qmHgLgOw+qR5DfrmTiiYzJR2IFC0vviK57MyBQIqakLygv/N4C2fZjOR47C6sj4RHUd4Jc+X5Wuh7N1P9zcQkZH8sXI+L0wCI8+F/BogRF+QJbPhOuTWRNOKIWCmtX5d7NKOV+H/T8EGS61mveyRV+4ibqdiWGbdZ/lQ1HMTap2CX/AjHRSKLt1VUwOzL77eB9BfJuAVEHJrokd4XSOK2cs636rhceVfId4ePsWjr5fQ+8yIAWVHOh1kczW/X5Ep6zxGOTqfWQyg93ZyspcnP3j3773aeKmV+DDPWy9aBbEPHnGV28/W9UKIDFnlP9laGfwxfpMWg9cusDlKcYmNivQ6pOGIXZ39iyCKvv5xXI7iGKwy5710kdIZVao9joC3X0jMdZkezWotxQ8BhihG82k44hspbQCzwqmZwPx6a4210O2p5WTiCQjq9NbYtv0s0f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(366004)(136003)(38350700002)(38100700002)(66946007)(26005)(66556008)(6506007)(66476007)(86362001)(16526019)(83380400001)(6666004)(6916009)(4326008)(36756003)(478600001)(316002)(8676002)(6512007)(2616005)(2906002)(186003)(52116002)(956004)(6486002)(8936002)(5660300002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qbdkKghc6LlIMZ31ysHoeSfk7zgpsUPYSluh+oUAXBPTn2iCdv1uiht0X2bB?=
 =?us-ascii?Q?6bzXUrcKP5vVq5Og138vY98Tpk/ZB820/kmmzK2NJlixue3z/aWu8gOX1kLj?=
 =?us-ascii?Q?69CVXCx4xGuEVfyrV8ooHlR+jABQQ36EX8lhqNlTdCfQjW8H9boKo/oDHlVZ?=
 =?us-ascii?Q?kHiCYTtTY6iOBpORO84Ts8+kNFBXJAjot7eR1IJTEfz17N11rSKO8XMdchNE?=
 =?us-ascii?Q?RZvW7MZMoD6T0WCqv7xUlu884nPkC5ipXzol8bRQA26lghXYtDUnp6Zwwn/R?=
 =?us-ascii?Q?xS7Y6bGT91oB/YEbBiLDqY8c2+MKByXDbEV9DMqWsSfSBiC7DvWZ0rc9/f50?=
 =?us-ascii?Q?pCjMf2vttmc1IBnaXNbEZoNYK1qKEXtYLPc9GYz4amno1ey7v2gzCt6zcFZL?=
 =?us-ascii?Q?mhGfhYe/WrTp7jftzvN4S2i3SjzEsOd8E+YWckwQ7gsT5E2s9yNRuF55ypJO?=
 =?us-ascii?Q?52BxcK6+Br/4/l2nJouZljSKFHRaZy/MUQZxcKFE81v/mc3KMX8C3IDXoZ1W?=
 =?us-ascii?Q?O8PUEmEbpBXwPbkB0yOgKiQrLDNeuffuH20cZo+Fyn3AqyIPKQBgHmRXJk/J?=
 =?us-ascii?Q?WWk5UHmlCJG8P0VosdPAotsATfqx1e461AhB/V9fjLIy8z2M2P6UHX0/T/8o?=
 =?us-ascii?Q?kTOP0NYGbqobhBbj+XK7D6ygNJ7aDAdBfrLaxxFMbM0CngYbF3XJRa7HTSDd?=
 =?us-ascii?Q?WPxzkX0jHNu0oppnnLVJD/+/OOnWxb18k1C82RbED6axc/Itvnd2MMN/gJ0B?=
 =?us-ascii?Q?2ELO1IzagnKYcbQfWYoFE7ox2UUd4jSPQq+7lLmUywMZ+LqgKDany3kZrHoH?=
 =?us-ascii?Q?kTOtAxmWPVwbZr9GlCGUC6NaGldvBnGVhg1WwRD4GECXU2VbeyeQ98hVjf0W?=
 =?us-ascii?Q?AffuXWzr0bFKAr6VPWXiauzc+oCrtKcNjJXUBssETVVQKmDZPWQn5W80vqCY?=
 =?us-ascii?Q?76LfCUY3B2to1S/++h4MI+8u354hYePz5g1cIhVliTkz/0sbZU20r90cLOJ/?=
 =?us-ascii?Q?Aa/qlL44JPxAybl+QHnjMUp4uhMZcG8Xn0GkuGbe/yc9GeM2hms1HctYtmN3?=
 =?us-ascii?Q?S+TTFTKWJ/C9c975Bm9wOcZf1pG9Gs0H9HuC5GVVeeBE3kL4A5kygltnEX2t?=
 =?us-ascii?Q?yRBjqEkK1LWquCwSi1Rp+aprnqfZSJoTs/pASWBcA/UjVT9Dh0ZVPHMWHyqS?=
 =?us-ascii?Q?JkgAe5cApTD0UAjZM4gRNXH3grXI1s86MmxUt8JmpIXuidz7ds7HXglYZAbF?=
 =?us-ascii?Q?IbYpZrkHmE8J/FOA/iy9Am7Nb87hpyLwt5VXSY21+4O+Oo0HTTePIGRcgdHI?=
 =?us-ascii?Q?9+hJys8h1uxth1kns7v/cHel?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3463dfb1-2f27-4eb8-a87e-08d90f9a78ae
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:50:37.4843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2ioGtV3NSS0nvEYVixdY2TRhb5WDI3pWX2gISlPGpOrXRTdO24Emtj5bDNSpMg6hg8SeRSSSpRjvhtazubBVWZukx/g6XiFD1ypE03MtQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Received-SPF: pass client-ip=40.107.20.90;
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

We are going to support 64 bit discard requests. Now update the
limit variable. It's absolutely safe. The variable is set in some
drivers, and used in bdrv_co_pdiscard().

Update also max_pdiscard variable in bdrv_co_pdiscard(), so that
bdrv_co_pdiscard() is now prepared to 64bit requests. The remaining
logic including num, offset and bytes variables is already
supporting 64bit requests.

So the only thing that prevents 64 bit requests is limiting
max_pdiscard variable to INT_MAX in bdrv_co_pdiscard().
We'll drop this limitation after updating all block drivers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 11 ++++++-----
 block/io.c                |  3 ++-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 5734f44e59..cb36ba93a6 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -664,11 +664,12 @@ typedef struct BlockLimits {
      * otherwise. */
     uint32_t request_alignment;
 
-    /* Maximum number of bytes that can be discarded at once (since it
-     * is signed, it must be < 2G, if set). Must be multiple of
-     * pdiscard_alignment, but need not be power of 2. May be 0 if no
-     * inherent 32-bit limit */
-    int32_t max_pdiscard;
+    /*
+     * Maximum number of bytes that can be discarded at once. Must be multiple
+     * of pdiscard_alignment, but need not be power of 2. May be 0 if no
+     * inherent 64-bit limit.
+     */
+    int64_t max_pdiscard;
 
     /* Optimal alignment for discard requests in bytes. A power of 2
      * is best but not mandatory.  Must be a multiple of
diff --git a/block/io.c b/block/io.c
index 195b68b19e..a7edb1ef54 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2991,7 +2991,8 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
                                   int64_t bytes)
 {
     BdrvTrackedRequest req;
-    int max_pdiscard, ret;
+    int ret;
+    int64_t max_pdiscard;
     int head, tail, align;
     BlockDriverState *bs = child->bs;
 
-- 
2.29.2


