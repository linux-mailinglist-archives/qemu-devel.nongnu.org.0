Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD852D7EE2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:56:07 +0100 (CET)
Received: from localhost ([::1]:33358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnaI-00016x-Dl
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKp-0006e8-HO; Fri, 11 Dec 2020 13:40:07 -0500
Received: from mail-eopbgr70129.outbound.protection.outlook.com
 ([40.107.7.129]:29411 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKk-0008CX-Dp; Fri, 11 Dec 2020 13:40:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F55Wn6+r+ZDXfhcagQHhLCqvdtmsVZQjKbS3ungDwdihbpnj+Iq/oXwRYdPO2PFYg1iwoer3JUO1Me/EBa+hJY69O0oD8MyFCOKLkUrtZuLfImHB1W5Yq3Niv256EoDnUfdpgIQvkUjEn9i4QgvdcK375cBXFj2z/O7ksitZKdSMHJVpv6TEQS35eeAjCztxh7XcmcD3qfTzaRTTQ8STn2NJtZiP0q3UlgMPwZab+LS3jaF4FLctgmOBw5Zd5L77q81Z3PR/cmqd3QOPW6AsQolNxr462VJ2TCzyjm7Fn+7nnvpgQyaeKr+1BH37QeLlUAtDD97g/xctPPBdgb89zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GX/o/DN5UDKdrDpKGCI6wdyZToVOnCv/fPnvyuimykY=;
 b=A80skK2K1cdpEHf5GsG1nPt9lMsVeROGjGDXY+YwnvGsovxrVeQxaougNXWcGfHkFbQXB5ANgk33rOwpv1zpbztRA8BCiKd7or69gsfuMqFgtyGNLwgk8FAETP/GSfi1tbHptAurBxjtXJy0ypHxXOl7HUmnsQzIZgOYJB9wZi51UtFFUeQ8Tn788lQWW5QxEoALvLq9coXxyeC5PKWPaUx8bPcPhifIEwg1wg4WwEJdt/sYz/d0JKdreZOteBP7FXqUqm5x7gCspbosrCuSEmGdy6/rI/kJRoiLjFJqRTslYasoSN+BmCE/3OYA+ACs3dQHHo8bFxLDAy1iC7yJCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GX/o/DN5UDKdrDpKGCI6wdyZToVOnCv/fPnvyuimykY=;
 b=qE1gr9pKSf99X5hL1838kkh/89rR/+kCgYVQiiOfDMwvYU9Yu4jBYDdxtiRQ1Nm689GrojkU0xdXubTdBsEFV2LjfGQe0K44z6k3tLFy/4kkiYTvbarvDooh99n6rTCBqr6JGZJPz4G5E5FINavG0tz1+UGTx9AW/D/OscAv+BM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 03/16] block: fix theoretical overflow in
 bdrv_init_padding()
Date: Fri, 11 Dec 2020 21:39:21 +0300
Message-Id: <20201211183934.169161-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201211183934.169161-1-vsementsov@virtuozzo.com>
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:208:1::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:208:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0c93e3f-0985-46cc-0a80-08d89e04249c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4915267A4343A6233E05CA4DC1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IU0cDUjZcFtmLsJ9u6+jIheO7cXhRKWggnwVwEwj/ouBGa7LBoXYW1lUx35qhjS4b8x7TTNwE9Uf+pJzykMVFWweYHULvKv+y5+0V4SP9Rt2TEXeig3tmB3mBJCXfgX1r6/DGIM8/Eq428IAK2Ba4yOOMc0AVFwn7DXAjXMO4ad2KAKaNKl6R7k54HLyKtcet3cam1IzaqI9Z2XXpr7dPLOt12SDtsmUdotWsFH/TmlIMt2PwWJsUG4qDtC8ae9JwgPyNBdglDuFtx8AX9zQ6stnQknrSNL7vlbfY7jzAjlqe/X6jrW71oW6H72B1upYREZPxIGeLOYVgG413DrzkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(4744005)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tjKfgND3h/UqWnTnPvDtQiX/6YcsyzUVdhncbUFYriNxl5thHP8SfJ80CFiZ?=
 =?us-ascii?Q?vaeXJegIzsiPFTwYQAhis20XKESLeEEhr3sfCw/P8e1ipfWA0crqeYEUDXrI?=
 =?us-ascii?Q?EqXNuK6uQEUZK9LNC3iL6GY4W4PQsilpddx/Qot5S2aY58ClWTW7q04qgyTl?=
 =?us-ascii?Q?oV88wXmSCRa4XIpx1GHgOSfXGI7NuuZCscNAHXOSMHwD7h3kICA5BZoi1HvN?=
 =?us-ascii?Q?Tj8+90jPv/4jJXn9zso0t11KHP8UwD9tg3g8Zf4cZk8ysr0falX59C1IYttR?=
 =?us-ascii?Q?iPmXOYcBSZmYql7z+B8rFvAjhVXMW8bH12v6UVCghjveBQeVa3fu3qPMPSy5?=
 =?us-ascii?Q?kvA0Yrznb08S+RcZPMZRkyPf4ZxM+WpxCOaZeHFu/QGnaU44u7bcokuMBqPp?=
 =?us-ascii?Q?XS6gP8AA4uacD7vDcEB5DFoHwoIC4MQCijMmMz1xyuGDle8sXZ11spUjKNVx?=
 =?us-ascii?Q?kjRjkRZUSlOcWpZd/4YmrQIqDkX38ZtRM5F40SYmd8kiYJbqtAmXdCNM4v1p?=
 =?us-ascii?Q?RineKGCOuDmbmI5H7G69B2Jr0ykYdZ7w1HNmS8ZVwv/mbQSoQ+ryQKdfOhCh?=
 =?us-ascii?Q?o7R4amtoyx+oF/cLHJpgd/GwFwS5/8v7C81eXgSvrEH2ve9mCzjlMwML9/7C?=
 =?us-ascii?Q?Tn7sAGLXZGK/otByRTKhH6QuOLnBgKY45my1H+U6aoLbSRMguosTvUcgDldX?=
 =?us-ascii?Q?WKYV5QlIpE8Vmmr+irx/mjKScaqDRYQDHzflwQuU67GkU0lWBIyQlKagR5UJ?=
 =?us-ascii?Q?B5dXWJk+kfq+P15xH45mY5hBZh7i5TDEuDcYO6JNhM7+HaCeQwTcQECru34B?=
 =?us-ascii?Q?E47DlSepzMC4oXz3QB7jbcVr5TJj8CVcJ3fIuo+yKvknqInMD2t0i6JltWAS?=
 =?us-ascii?Q?/gJBznoGUrH9YMpL9ShswIUEIFPXKugcT/oO09BDwwD8u2pLYumS97EE9SmL?=
 =?us-ascii?Q?i5LidNlj3VVy1B/4PbJUaBibx8fyKNURNvx1Md8w+9LfLG2xBkLhHSE0JpCu?=
 =?us-ascii?Q?uC26?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:50.3621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c93e3f-0985-46cc-0a80-08d89e04249c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBPHFimVsIlusu8BMiNr5xuMdTbUFoKUC1oFfBeAmYnh4j/FdkE0+qi8QUrnlCnCCxPrUcTCInXedovQ0CHbAlYpMsL6sBbqZa4nFIAHjfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.7.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 berto@igalia.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Calculation of sum may theoretically overflow, so use 64bit type and
add some good assertions.

Use int64_t constantly.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/block/io.c b/block/io.c
index 21e8a50725..d9bc67f1b0 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1537,8 +1537,12 @@ static bool bdrv_init_padding(BlockDriverState *bs,
                               int64_t offset, int64_t bytes,
                               BdrvRequestPadding *pad)
 {
-    uint64_t align = bs->bl.request_alignment;
-    size_t sum;
+    int64_t align = bs->bl.request_alignment;
+    int64_t sum;
+
+    bdrv_check_request(offset, bytes, &error_abort);
+    assert(align <= INT_MAX); /* documented in block/block_int.h */
+    assert(align * 2 <= SIZE_MAX); /* so we can allocate the buffer */
 
     memset(pad, 0, sizeof(*pad));
 
-- 
2.25.4


