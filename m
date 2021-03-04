Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E103632D023
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 10:53:40 +0100 (CET)
Received: from localhost ([::1]:33762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHkfr-0001EJ-Ut
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 04:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHkeh-0000hM-Rw; Thu, 04 Mar 2021 04:52:27 -0500
Received: from mail-eopbgr30122.outbound.protection.outlook.com
 ([40.107.3.122]:30789 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHkee-0007Uf-FW; Thu, 04 Mar 2021 04:52:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVLVnH1X6cp1oFT0aBclluHZ6phvSsx7rk+mBUlD/0a6AIoSHwqOV3C11Z0sgtkyWmjUgnDpogG+3b9iegcfCugTkPc5T/KEBQMQVfDSPFKsLgf43hogyapWTSIjlmRcQWzvVW2PxEHyuOe1Y/hCHeQcz/JXNTQzg1yVBNKMIpD645UeuwJbCjZlIqEcMUQ1t+Y2RKJ+mw9/BoT8yT1dTa10Te+MZAabpP1OyJj7xg5UcwQ1IC2kSaXeyPcGynrMeNxh/8m9cHvddAM2sOQvVT66YB/0mx5pErluEdH44QTOWOPNE001hA93OIjUkz9GY8T958lYfm7yp+sBGRWTKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTWSwr1n5M1aZh7ONN/LXT9KOYx/2MlAdhSbOzcF4HU=;
 b=kSz6t8YWBArLjpEDegCkUIu5TOmvt9A3/arhTc5DtHc3lnCUVenAqFZIIcJcDq7ER85+HicVaikHmlE69wmv+OOjFJRBho78wtF6mLZ4yKMoAnM8Rfh9HfsZhX7KrCP7u4EWDKHfYkhvq1iXCrDKPFvw5HCjv4L5m7eec519nxkkAkQEZTCP7bqsiDRUejpgwhe1/8JRAeI03DGFNvypWHrvrTAb16ci3X3QUA6SsHPj4LVfJofjIKL/ajnQfcSWfyfoqVyJkZR7rDaL0WEOKIDFXLo3m1An+2qUngRxUmFK0qiXB2km1KVUtdeaLnKC90RZ+4gtFkQbFNJkiGbHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTWSwr1n5M1aZh7ONN/LXT9KOYx/2MlAdhSbOzcF4HU=;
 b=oArCcGEpxlx7t93EWpRTK/WWucgkzQSL2b6oT71uLquYH0w+CfzP17UxR0/NeVPtJZlBqgjHO8Bayzy4pEVRV0bf3R7b4cJ/wfm03Ux31PbJwLKXC/hqSR5wOBsNdJ3Gncan7eNI6aJri+51wYHjrdqCq3KTmNZl406+eLT7mtM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3720.eurprd08.prod.outlook.com (2603:10a6:20b:8f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Thu, 4 Mar
 2021 09:52:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 09:52:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v2 7/6] MAINTAINERS: update parallels block driver
Date: Thu,  4 Mar 2021 12:51:51 +0300
Message-Id: <20210304095151.19358-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224104707.88430-1-vsementsov@virtuozzo.com>
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.246]
X-ClientProxiedBy: HE1PR0502CA0015.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.246) by
 HE1PR0502CA0015.eurprd05.prod.outlook.com (2603:10a6:3:e3::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 09:52:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 187c4d2c-7545-49f5-c403-08d8def3335c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3720045C031DD6F32ABB99EEC1979@AM6PR08MB3720.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wx97PtA2oNrfrZqM7wfENuS5AeyrCB3QFHt6zoAppxw3c3NRoO9VdKYPHTFExr5lPKgyuODjFKTtcO0OGX8l/BbklteQ4Cu+pmZlO81cSAQcwWG5qLZgkCpDPzIMdv0JHAxySx5MPDhwBcjPIqIxRHSg1DEwLZm2qRGV68HIcnqZXRHVy7PVsFmf4XQ/8XgNtvo521F/b1pWFh0XuV6u/6PK308+8f9kdcZD7Kayf3PFd5G7eQfSkacxyI86PXzkS0I7LDY+GVmg1ezxHa03MbVMz0PKapo5maE8f17kfzNeEYq/DSc2ubwM3R5lqzz/OyUe8DaRJGCe5ghZyiu7N/OEGqX8Jcps03PpISPeLVEiEWKejDFcrh0Vf0d7DcZVH+S6PHqTJ46o/8toMy3ibwYgdEWCdWdF4WgRCGGi6Zo9nxTboKOkwAAsElmj7NPZl0ekngEV1c3OetsY1x2P231Wm/fHrX994HLFJPOsrGH1JfDYh98O2n9FDqvNwcXHds52xZys++bX+Zpdfpvfl7b4v1BtleTnW77OjAcuufbgEbRtHrpaaxhq44lm6hbV8hEgDMFQFRO638INg1FF0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39840400004)(376002)(366004)(66946007)(66556008)(2906002)(66476007)(52116002)(8936002)(478600001)(69590400012)(6506007)(83380400001)(316002)(8676002)(1076003)(6666004)(6486002)(6916009)(36756003)(26005)(2616005)(186003)(5660300002)(956004)(4744005)(4326008)(16526019)(6512007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZimVaQZQJheyNZf7eyrHshygY1jkhv3yOfcIE0N17PAK+MMvuwq2NaT12/ey?=
 =?us-ascii?Q?ppuXV5enUzhUiebOq+KPn/yNTjjIc5hosi4abcVkOrCuBYNqDwHybNbLHNyz?=
 =?us-ascii?Q?KyzBR4NNri+RVoC6MTkmb6VG3DPABX/XPKSle3dT+PXz/iTN9fC/BjZwaUke?=
 =?us-ascii?Q?7jToVDB2AvkN3UR5B/bAINTvBv0j5+QTTQBDm+uDDpi3pfXw0ZU1kK0XIYao?=
 =?us-ascii?Q?I6mDHrcnjoo8YZhkbwzJIT7w8K+Qq4m9yu1ffdTlBLaJYLXssbK6hpyIYk5d?=
 =?us-ascii?Q?iUbivgcZGkOKkFj36DWB7LufBlffjX6d53NAPIEvIgIWp6HyF7V6hMEhgQ1l?=
 =?us-ascii?Q?p+y3ANgX8YYB7IN6Xd7ePP3zVHII6RkV7PXplMzMvJ40TPNmpOI5wTGdeDV8?=
 =?us-ascii?Q?GYQ2i4B4UC6a9vI+zPjNSLzTxHMztjSwBwvjOuIOiD9naTPaJ60QYqfYcH20?=
 =?us-ascii?Q?i4vkQ60VbsZG4OByqW/E+oCdsPpkkrUk7wRSR2EWzqYgt5GDHd6fmhWEN1sN?=
 =?us-ascii?Q?/tb/GtfB13owsx1XvATrxwC2Ns0H8/geuBkTYmSYEmUHl7tIIaBFIS1MktFS?=
 =?us-ascii?Q?c0x4n2bH7XHdhmDVR7LI/Zgzrgef43pxGAIRBN+oSgO3XdFvKWqcvOSAmKeY?=
 =?us-ascii?Q?0OKjkWr7T/NRndwVdx5VYrDo8JWW+1b5X353F/Sbkfbo5LpZD4afqgUz3c9I?=
 =?us-ascii?Q?XXJtAOmvsMhy6arbmHwxnRMRoUg7f9qvfTfI6f9V+NQm7QGkeAL3ryTscueU?=
 =?us-ascii?Q?Y1IGpiao2NQJzOttXRxlxbTFQwNi1bmbToTGnd0ykPu5jvwayr8cMb0Zb6mS?=
 =?us-ascii?Q?B/xL6RN8xmg6R+Dr1jdbu5fYBnhmoKsbAMzNhTT6xVObXBirCpvIIy6MS52Q?=
 =?us-ascii?Q?kq8Llxf+WDVSa3fDi0oayiaebsytfGIQhTvqY0f+jSTa/EMo3zk+xGv8BQVK?=
 =?us-ascii?Q?62/0xdCwBa5Ir8cmHtzGC9kYXMUkiY5hXkqCfqLCAZ9K2tt5XhwkqX63QPrd?=
 =?us-ascii?Q?2mhOsHclKM7PRmp5P0ABsxiZrlesfCMFMfsOg7U90B/gWKabc5+hjW7O8/EP?=
 =?us-ascii?Q?Er/f5q53AIKJ0VWxy40BB8IzzFdmFAOskve26aEo7H1qtTn4tNTsVSkt9Cbg?=
 =?us-ascii?Q?SSyQAAYplwuZibliS2fKQw/GgHOYI0cnLiPaABJNoe5LW0aVeSqcdpbKhHYO?=
 =?us-ascii?Q?jOC8jEsPI8PcaPnZttTfX5AtYbZpuiFhpMGD7R3IfjIv2rXbVkvmm/mSGVvv?=
 =?us-ascii?Q?4v2kKrh0hjBGVbQqCfi42QVd504yyNWF4+7RnujtGc2xGoOe/KmI0HoPi/ac?=
 =?us-ascii?Q?TUdax5azXCTJCIDC6kePrZrr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187c4d2c-7545-49f5-c403-08d8def3335c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 09:52:19.6287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZV2zMLd+4P/wmuIKadoi9Zx4cUqkT9FrBFCdXMtIrKckyum+q+/eWdhd7bIUbujzAGdDV3qdTxjV06/SzMeR+MoYiaZHrPCtjYYorIbAsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3720
Received-SPF: pass client-ip=40.107.3.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

Add new parallels-ext.c and myself as co-maintainer.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b2aa18e1f..92ba1fce5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3117,9 +3117,11 @@ F: block/dmg.c
 parallels
 M: Stefan Hajnoczi <stefanha@redhat.com>
 M: Denis V. Lunev <den@openvz.org>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/parallels.c
+F: block/parallels-ext.c
 F: docs/interop/parallels.txt
 
 qed
-- 
2.29.2


