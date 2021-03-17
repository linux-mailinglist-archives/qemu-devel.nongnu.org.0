Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBDF33F3D6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:09:16 +0100 (CET)
Received: from localhost ([::1]:60498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXnP-0006BG-Jb
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIL-0005Tv-UH; Wed, 17 Mar 2021 10:37:09 -0400
Received: from mail-db8eur05on2106.outbound.protection.outlook.com
 ([40.107.20.106]:39072 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIK-0007Ew-52; Wed, 17 Mar 2021 10:37:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqci2ePgushn6xM9d1V/NmV36wMJ8ZEsT/NxK/puaErSccBmb4S6ZUSwwihuy6tjmqQuYJ4bxkx1Yiol/4iE/W+TinG3L6dgUqxr/wSRjY9K6qb2pKD/Y3SEyE3Jf2v/7GZpjhqoeVxJgxxnOYwog5RHKXdc8PadV6fsQmOHzW9Wl+EAvrt1cDlZjxLNT5yxqZw5u/UCQyGX4M1BnIs09g+AMkIxV6yRNoZ+4Oki3VXJtTmWMBAFd3CcXwqO2NnOOsJgw81njng4fRTcg8M1nrqQQitXc0uyOdTvLnzZ3rWE2H+4M6mPGICfkO/TEwrPKd4XTmX5Vc0rsuVtvVVLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPUokNKOKbWECSPxb1qlUyjrs24bumzgZlODWy5G3T4=;
 b=D6RBozW0SRPLR0aBuLl2he7l7AckLjuzDQUI3fp0C4NAEPZkTSkhmzggdBnBVzZjPSDM5qhpyZD31oy7AigzPPWdMWA0iTLYU4d1tG0bqHUbW16LQgopuUi+xXJy6w2BAjhUpPccMlpNFHFHHnfxpRtjLZ8VV83yq3q89ce06NhHYsiy3EF9BMSDVrbIHkuplxIFN1X1VORxRwFF6CqC10ZV5/XxioccD4RRbE65chgFIgWPFJiFALs9j7gwRU6ndqt3BNP1d3G+cZnzlypzvEEKcULbv8stJMgBhaXJJYk7DRYsrC9cjPnI5hCpDvupkaOtXEJT0Uqz9sRfw3W4sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPUokNKOKbWECSPxb1qlUyjrs24bumzgZlODWy5G3T4=;
 b=tKANK6MwbscHxBpNIp1oF4j+0h+fNHDWaHTOM5lPHhdLS9tFnoZFOjSzK+EdBEe080x7upEglapYnX0RnCSO99qdhYbYuZX5yqZNtEyAPVb+KGnUIox4jDMf4YbH4mhoU6Q6w+h5KuNbst2oSvLy8PkoSRnoUx6VwPI3V5X7A+I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 35/36] block: rename bdrv_replace_child_safe() to
 bdrv_replace_child()
Date: Wed, 17 Mar 2021 17:35:28 +0300
Message-Id: <20210317143529.615584-36-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd9562b9-3bfe-4ec7-8228-08d8e9521b75
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62168CB97C737060AD157996C16A9@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:24;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mb+ra+P87ctFRcz+bAgFrTHW7VJxdt+AS+nDgaWyOntkNjaee/hOCaq+IUtD/35KwllSP0/gBzkkTzu4ve81XzbgcpVZU03X378GWb0hBAVdPfor2h0qo9dh7SUHf6OQknzfzNIe5WJdwXEBB2Fiy9cmXBIpk/UMelrtlJzpL36PdXFKrvOa+Ti4AOR+riop6vGOltccf395mz0jqIo+nwQA/yvZKL3v5VfKYeNhtRdxkgNyUbznDhsE0nY3BGHF4P0ST0P0ySfwJip5cgfDoEYbz240P3TxrLjPinfWBPUgcBKZfyWT2s/3f/QbjYh3FBdQky7n1FosyoV/hJk6NV4vGQ6R35THhL3qdGD9pfBHSXdliCS+6C5D3z8TfFKkGsaZYQpS2Zd8IkMXDrXROA+kL+pMKjokjO2y47sNsoAgsycGILbfNHqLavixllgeFtPb3uF1BcVxWQs26RvGFmYvsYO0I39B8nZLLmo7TbtuJ1553E9yr1vdKocIDYzE5w646wLNP0LgnzE/Wp4m2EGpNIC43Qolq9GN5LpxaxjDV2QifSxp7STKoIZ3xpf71obeC339zGV1u/hdHhmk7T01JTt3ZeFByBk0j5ZlgDMrQ+81ZPWYTQtmTwxh/9Za
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39840400004)(136003)(6916009)(83380400001)(316002)(2616005)(66946007)(6512007)(66556008)(8676002)(956004)(26005)(1076003)(16526019)(6486002)(186003)(4326008)(36756003)(8936002)(2906002)(6666004)(5660300002)(478600001)(86362001)(66476007)(6506007)(52116002)(69590400012);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tQZ6azNc6qo1HQTTsT/In3i7sLB43TqiriuVHQcjx4AbuTW1Z1RUF47Xj4WR?=
 =?us-ascii?Q?POC+H9lkI+PefwdduBNaFBOkXUOq8i08GtPp4ESItOxjPxQv2x1kUIqDOyHo?=
 =?us-ascii?Q?lAEOazQABPye9hTWW/CAsaTpLX1rRDkdKKjF2k6y6+jxuK1i9P8OlONjjO1/?=
 =?us-ascii?Q?A2X8BuEgu2MenKeIlzOVOqcK+mT4IXDL3gad4EA+5Bau7GclF+Ctn/a5o27U?=
 =?us-ascii?Q?7epuf2mUkD1MsyBl8csw6oeJhR30Hvre59t0+rD4RcpYkioUgjC/V3jXxFKk?=
 =?us-ascii?Q?0Kwppm8+zz2R1QZP9bwBjsi+ysesdwB2Wem2LT07rL217kowqmoRovpSxlCh?=
 =?us-ascii?Q?yiSeH5dh25ms2kt1dVi0Ie+rAuQKbQZXi0ygzBOpMXzNGBhOuUHPhnul8dnc?=
 =?us-ascii?Q?gqWGVxCjtc7+QSB/ewHRpU5Unxn/mQbRQBXeoBnxFsCjLGV7J18k6Eaco3zV?=
 =?us-ascii?Q?bwjcLJb80syzq09grQK6TOu4YeGFv7HIxv1agNT+N/wcokNGey3+uRURHMk7?=
 =?us-ascii?Q?HDNV9s/bZyblgf1J8ZKfZuTjyhBtOWqXUzeP/EKIaLaXU0qXXezK0ZtS00OE?=
 =?us-ascii?Q?Eeq8rVe44DJ6WO0ctB8o/StROAjx9XYkXnaUmnFE98fQp4FGSFjlH+Cfqg+c?=
 =?us-ascii?Q?KB7mX02j1VfHOv8fbs1iftD6ELFD4bOQgbyzOxqIKp3+jj9FhFS0ATXHPMYp?=
 =?us-ascii?Q?Pu6BwOOf/PAH9LllQQhkuhP3shahIL3cyEt/oZbYDYB6DDTA3oFlZCxpCahe?=
 =?us-ascii?Q?+xiVfq79Qu1jQyA74DzS3xn4RTr6EUu9RtRqGhn8V3tOXGsWH4LO9waSk9WS?=
 =?us-ascii?Q?pb0jLYd+gi/E9TvxSUx5JBIYSWUhpjz1JnJwbnKlzilCvSp7t5ABnMDRHKWI?=
 =?us-ascii?Q?foSgzaNGqByhlWUGXDSCFgUKRJur/PfSCwFrRFY5nQ8yrryFcG/r6bBFnERb?=
 =?us-ascii?Q?h5Nk4zHC9gQwjTi7NK/XY+uAmlnX6H6Ru6qDxbEmC/h78NE1pvclWR3yvryT?=
 =?us-ascii?Q?YblOOKzI7f9zd0YyZFtOurlVOx06VGeKRsgZkjkJPbLGddRoHDV77OLXup9v?=
 =?us-ascii?Q?8ceaobnodth49DbF34lc/ARAmb+j8RGz9qWfPRdy1LvjMRK5tzd16FT3QJEP?=
 =?us-ascii?Q?upf7ntFJKvOKJEaISLxvS0ykSF46IIVWBpzfDKvArWG/ZMHBVgFNGrKT95/l?=
 =?us-ascii?Q?1vbX/+sY11BnJE+f+/TJJMCuOXoB2w1Cx6rlDei79uMuY/GrLWJxVR7O74Zw?=
 =?us-ascii?Q?N9zx0YBad5VVYGeZxYG9Ys+6zZVDkYUEfLaTXjB5B75xVKTEFAdjwMs7CKRe?=
 =?us-ascii?Q?gCQK4x+GcN3b17ggFd6B+flU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9562b9-3bfe-4ec7-8228-08d8e9521b75
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:53.1963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkWo3mGI81Rldx9aE3uzM79YjcPhS1XN4W63xyoLn9xEnzZhWHlpz2sFLsAPx7Ds7S3NbOutD21Cqg+RUsOvHfWI3R/k/hU7r0GVgqluhXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.20.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We don't have bdrv_replace_child(), so it's time for
bdrv_replace_child_safe() to take its place.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index b7cded9826..b61ac9ff19 100644
--- a/block.c
+++ b/block.c
@@ -2214,12 +2214,12 @@ static TransactionActionDrv bdrv_replace_child_drv = {
 };
 
 /*
- * bdrv_replace_child_safe
+ * bdrv_replace_child
  *
  * Note: real unref of old_bs is done only on commit.
  */
-static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
-                                    Transaction *tran)
+static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
+                               Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
@@ -4762,7 +4762,7 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        bdrv_replace_child_safe(child, NULL, tran);
+        bdrv_replace_child(child, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
@@ -4802,7 +4802,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-        bdrv_replace_child_safe(c, to, tran);
+        bdrv_replace_child(c, to, tran);
     }
 
     return 0;
-- 
2.29.2


