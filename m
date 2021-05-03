Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2564437146D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:39:34 +0200 (CEST)
Received: from localhost ([::1]:41564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWvF-0004d2-7W
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqI-0008GO-KS; Mon, 03 May 2021 07:34:26 -0400
Received: from mail-db8eur05on2096.outbound.protection.outlook.com
 ([40.107.20.96]:36951 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqG-000054-RB; Mon, 03 May 2021 07:34:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThyOYQull4oKnwdn67fmZ1eapKvi1aZdkwSvcHHOflDengwGHeLZbVHOCtKdmwuPilD32j0DYGDnQUC8Ier6O3A16yFZtui40+sRBm5o0VNsXVgr1fGbaR3Og6hDzfNDtNb/7UXx3AdSkt4MvcwiqjVE8EyuYt+YpsssLjIV/d1kAsWO9yZNrxjjGFYzr+fl88zAvkkiK3WdOmGx8EUcvGfljST43mO75WjBoSomziv24PYAQZJEUV1z7e7nKfSz0UINk2/0tC375giI7TFGftRHRj+9doJIIyuC29Nmdx4U54Pwdk5c6kLVks6hh7VrjnNVwuRmEr1zJepWHVFr7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXSYnboAysDqfIG3CiM3ME5AKy9pwoJBAJzNwZNLXZM=;
 b=ftr8JdLVsdC5jWY3xG7Me44YO4g4k69YY4kSt1sK5yWZb66QnBdz41jroacv2CtCuznjIDvnLFbKBK6Xjig141raxD/AKVqD8t8T4vmgtGzH4WdygFSAps6EZcSNApSzBD3ZDxA0HwsyjcwE62cLRglIQ4o2FTxO7aJJzx1M+heA020lm1Y/PCAWJtd4DJzT62tLvl5WtffdLt64wEkNreqMHmiM/EpvX6rPTbNJAQma/gLlgcdVNQLGgxa2oVVSfG14uAAK5bS9vNLcSvy0P43U7lGOjHd+IgXSiAf1Gxo08aIb/RwiLVZvvE/YWW9h5AvGdi/vFrvhBAjLkAaOvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXSYnboAysDqfIG3CiM3ME5AKy9pwoJBAJzNwZNLXZM=;
 b=j8aswrSDi2QOzGyTGW0lriXiuEzhJfE2Q8qDSGgumNgxRw+rkcRPToqI4i1ktf8YXkjWBoDxpkyIrfqlhEAK8JBGqfJzlNfLIjVdq/H2PyqjCyyuBvWTqawE/S6Go5E6GG9jZTNS17/OofupaXQFJXJ+SJXIlhbacUqqHKoh+/Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Mon, 3 May
 2021 11:34:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 11:34:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/6] block: bdrv_reopen_multiple(): fix leak of tran object
Date: Mon,  3 May 2021 14:33:58 +0300
Message-Id: <20210503113402.185852-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210503113402.185852-1-vsementsov@virtuozzo.com>
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR05CA0255.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR05CA0255.eurprd05.prod.outlook.com (2603:10a6:3:fb::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 11:34:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4762189d-6ded-4312-6fc9-08d90e276308
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1713E986066BCFC2667B11D1C15B9@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtZI5Acqzc2GtJmDgvSkU3Ez8R4r6yt3dAErWr68O27INvO0FmZoNg5LwdQS4ko4J1aXvcZNlsfPWGXzk26PcX48PLq/Hp+qGeCwN3A8GePFzAYdokEhIVNtG4qRfOzMUieySCarjfOOT5lvj6OJX5icFg3tU504XXz2/ynf3EWKnnj45xGQoBw6sCyUel19IiPjONMM6W5byuP7l939NYOsJGe3ZVlYxDwB6V3uhHcMMx87uQDqIWEIBpeRjmQ2OZ14hGaDVNyyf2F4/Oc1yjYKmcBfk4TnW9GesDlHouucCby8nMjMSWtcWLs+OFX27Bz6q0oTVhJ2GJ0hRyLDN+P+e+VKvtnT03bGEQz+hkzhTjF7/oUWMYk1Tatxg1lRpNJQpDkxRYCcsKRvkOHyd2cu3dSInjofqK3O/zB/X69pWDWGPApjcwrFlOzDjiNwZYSZPZwzXHPIi1OX+k1wlXW/STaVpF9d3um6h+Go90Wrny9vHwiGE5gWyDwPdCnyMV8qIWwPj/q1dUYVtiBunlRHKzYMm9Mtmy8wOIZQWqtals1Nl1kY71gzn1rE6LHVRIUmXC0NU/SrU0oRMtpW3v0jIVM9FiBIxzo25BYwY1DlL9k5AaT/qD+zO+gXvxIXSPqQcShof82ugYHtMY7KLvoerjmWNsx/6b3Ow96Lrxhens63FMwgMfNeEDx530w3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39830400003)(346002)(396003)(5660300002)(6506007)(956004)(1076003)(2616005)(6916009)(6512007)(52116002)(4326008)(16526019)(2906002)(186003)(36756003)(38100700002)(83380400001)(66556008)(66946007)(66476007)(86362001)(6486002)(8676002)(8936002)(478600001)(26005)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?McFJXC/rlPWnW7uga7ohkW8j0wPmfHMOG62k3oXOLglCXcKuJXCtQiSCV419?=
 =?us-ascii?Q?GW20EDTQcDxq8wfp9g4wNYU6RSxIt4q/5Ji/Bauxbsd1sD7CpuGwXSeS/YjN?=
 =?us-ascii?Q?6cXo0kyMBYpzzMpZIEy7mdUVtp8PLgcqX3r2Nqfu+gW3PcSMycIr6734UtX3?=
 =?us-ascii?Q?lo9xGHXLoucHBQp3DD2dSVFOkc+5MVOEWCcaQT/80pBLZ+l5HdUZdzkzHcwa?=
 =?us-ascii?Q?sMPsygoKhcO85EUoG5ohZn0v7bBytbNRtcuT6I/KwFGWINYe9Yf5wyeq0RP+?=
 =?us-ascii?Q?7G+2EHs8AqnIgGIYgwspD0CahhHzBZU8FfcnzZO3oTuT7JYaHDj7BsRZI3F1?=
 =?us-ascii?Q?F6ynlaTp6hzOxHl6v2Wp/qP+LslZvIpnufksR3dCEHcG4BtBaMBMlb4Cab7+?=
 =?us-ascii?Q?9VKkZBoOfqpmcnlXCVYelAJ1hUVVWJprgqHrtyH8Kiq22cRHDU1FWl3Y2y/C?=
 =?us-ascii?Q?9SIQLsCDHhnr//JlUA51mvB7hV5PxBogri9r4HLrKbQqeF6udK79qZJf1tfU?=
 =?us-ascii?Q?miNszySGu1QRJPAC4pseURb725OVjHzaEE+hGF6gKaUzdAGtA2X/uNiiflio?=
 =?us-ascii?Q?y6gn4cdnhniyc22g1NV3y6B7wYvJE2YZnul4coujf9pbvgk4OCesRBosLXXm?=
 =?us-ascii?Q?w9qxcL/sFL8dLvaLkuqPB4dwU8UpElM3MCOdgwPfsn1ZdXtN8Er32AQpYHrM?=
 =?us-ascii?Q?98sY9i9g0XVaJ0KIrVWKUL4uwNiJub3S7Rdr977B48xQc7JCs/3Vxl1GBkuS?=
 =?us-ascii?Q?q4L7fg5z5UObC5Aib/8ul2gjVDHwOCXGDwHfzyhHoQ/X39XSnZdXvPD1t70A?=
 =?us-ascii?Q?c92zazZQj2BRTMjJ9gdfZGWUb1UACrLQWEiWyHNwKurVd1lxl0am5EWSekPf?=
 =?us-ascii?Q?gkn+/l8DKZdc/sIq2Fxn+BZiZwQWe2BrbegP1WTvk830GcPkW/97VpOArWor?=
 =?us-ascii?Q?sKv3artxq1JIeIgOV1CfMv8jPTlTAa1ukhZCrscrEUkMruPQJypwnWiWm73B?=
 =?us-ascii?Q?v0+0wDTSCHpJcEyj4bwf8QQNu6gxXfNe9QaYDTCzaiUrY6TKFwmupU0o9qlG?=
 =?us-ascii?Q?J/R4qN8HzgqkKsvKon0xEmy7HHLVU6Nx+Ba5bVaZM/6M/VZ9hT8s82Ue3J4i?=
 =?us-ascii?Q?JxwxlccWnLt3kTzuQGBbd8QQ4/85Si04/JYBXTGBfCOQfxCIgbr8VrPqyP28?=
 =?us-ascii?Q?R3j8fwRAFu3aH83Hmo8lyIn3t1aZejKdwhVR+aO5VwbqLncN5fIKimBc9KJh?=
 =?us-ascii?Q?L+BWNIT2D/pSUCgPGeq85pE9oZLDv71PESwfjTwC1Xbb/587R+OReYeLyUam?=
 =?us-ascii?Q?t3fJ1l1GTvb4WxmmPy/hstU0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4762189d-6ded-4312-6fc9-08d90e276308
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 11:34:17.9229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34WLjYlxEacjPSWS4jhodnWcTxUorzQ5gP5vzPa5V0LPQFdnkueuw5ZYTCBqCC83lNebV0EvHRR38J/ZAafdjNT/A5Hq6Q456nutH8a0W58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.20.96;
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

We have one path, where tran object is created, but we don't touch and
don't free it in any way: "goto cleanup" in first loop with calls to
bdrv_flush().

Fix it simply moving tran_new() call below that loop.

Reported-by: Coverity (CID 1452772)
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 72373e40fbc7e4218061a8211384db362d3e7348
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 728aa34b2f..c4023ab4f4 100644
--- a/block.c
+++ b/block.c
@@ -4047,7 +4047,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 {
     int ret = -1;
     BlockReopenQueueEntry *bs_entry, *next;
-    Transaction *tran = tran_new();
+    Transaction *tran;
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
 
@@ -4061,6 +4061,8 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         }
     }
 
+    tran = tran_new();
+
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         assert(bs_entry->state.bs->quiesce_counter > 0);
         ret = bdrv_reopen_prepare(&bs_entry->state, bs_queue, tran, errp);
-- 
2.29.2


