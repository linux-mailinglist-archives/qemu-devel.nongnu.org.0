Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9523A2A37
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:30:48 +0200 (CEST)
Received: from localhost ([::1]:58594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrItb-0008LO-4O
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpj-00030M-BD; Thu, 10 Jun 2021 07:26:47 -0400
Received: from mail-am6eur05on2118.outbound.protection.outlook.com
 ([40.107.22.118]:26592 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpg-0004Ko-3r; Thu, 10 Jun 2021 07:26:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONzZN1SFJ97Xs9k60Ge/Y2aXyNM8Ekgh15Iy+el7fq7m2T3FE6uYceO0/z/80NAfp5aHwNTQKdUveVEekh0ubY0bzGwYa67vfY0rUFPZd2Rq10SyqqNt18qnEtxgwQo14aSIGVfL63xyx+UWYGJGtv+RrRsCJDL5YWXYWmSpVdy5T2ycGvxGXNmWj9W8RZNIN8w2TYdgf9HYUd11Caev2ZKiAEOj7ESIs5FL11OUGyQOeHYSSpxsMa2U81zJlOuOCfC2uvE/SSHH1rTiOTaqqM6rRjOQBPLhS/N1kroTUmmMQKE7DmlmPGF7JkYt9umNG/xuBS/grQQR8Z6FxHtaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWZA8lIf/Bzl0KopEnik1m4ezjQSLXdF66EIX+PSFp0=;
 b=i/seAS1hjI7XIT0Bvqqwz/5vXB/lOGvBPapYuFKkGpZtEubznhJUHu/UPMNwGKo/LBSpekbSROsZnn/r5gtUOu95IdImpLxxH0AyC2qcaqsPBOlFzQ0mDV/TpScW/NW6lV0uMPmo7dMEThaUx/Smo2n/BTkeJivmtsE6QiO2u3D57sBZcpwB33T7NN55bom7H3iX6Ybr7DkACHweTWj6OtvfEF/sY7ubuTxRwKVIVdpJf2jZRVoleuw4sRC1zs6Ji0fXy5nLbsnsFca46P3Jt65yuWJ1MP4xU00yD4QfpNFHpuH3SK+9HWR/ehoevNAcjkMk8eVM5hZtUu/lwItIuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWZA8lIf/Bzl0KopEnik1m4ezjQSLXdF66EIX+PSFp0=;
 b=Gd47vGP4oDYHtxji2JVry47CNfvaiC4oDdOlAeI1T5Wzzsm01Qjh4yxO9vrKdFpjX37PY624rEuuWIZrzdT0sDthXTF1cgZnTXpnu75vcpd9scTUYZwbCeOAbFBSP+65LlhoBs2h0csqhR6ycVWTuRMx4zHhJUUXfPxbTFbuWFk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3960.eurprd08.prod.outlook.com (2603:10a6:20b:ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 11:26:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 02/35] block: comment graph-modifying function not updating
 permissions
Date: Thu, 10 Jun 2021 14:25:45 +0300
Message-Id: <20210610112618.127378-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb5214a4-ea29-4272-cbdd-08d92c029b5f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB39608264E076541A4CF7A004C1359@AM6PR08MB3960.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhngnwDjM/4AUL6yXwALi91QdCgYM5AvqtIcGQZCXk/sGxleZolg5QEx4D1iIvkEfTCo5kfWh4fNv3P/B8fRYSHkm/n9BdsOQrCrx48CT7qMop9oi+mVI9E54e/FAXuDl0C2Yz+8Nk4wmjBimNcd9EB4YiNDcdHJ5+x6N7lQCMx90lOxxbwLapKmvGdXDdVEi+1klxRN6XXLcsOySsOFkEpaNy8oIdtUr8EHPwr2zrNQ4NC9Qbhfnnoz/tkNV/IJ8m7/BXDOp/64bOpv/KYHraFG2QtWs5awRdL7KhHur01R/wja/qWp5NCLagP1Eca0/JH/d6VsXlM+j0JpON/lJ47DsIiHJdVIh3PyHWaFyD9++lYeJZW0ZtdltvaOltsxK8lY/nbGgHhKqO5pshP7l9MDaSZVeJ5SOpipRzyJs9U0z6NeHEwMl552xaJiAcTLwV6VgVXXnEnMnvwKgipWxkmdmktx1ABOxddextseYWk26tFEc8WsPYKWuFi0riduVVHQrj0vB+4xnV4GngtGjnIpVjkrXER4EMjr7qKO2BNaJDchwptofHwtaLs9R1wvNRlo8sckoU+sMvs5nWwbgDKvYDAUmC8ZJkD1F02b2yA1i+Ex3F2b5R7pu2da0w3y4rUcPdrnXoVHdG1tzaT8FpsBivwK36DJo4/04taqpu92PzQLsdR1zu7wM8APfCze
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(346002)(366004)(396003)(2906002)(8936002)(2616005)(86362001)(316002)(478600001)(6486002)(16526019)(4326008)(36756003)(8676002)(66556008)(66946007)(66476007)(83380400001)(38100700002)(52116002)(38350700002)(6666004)(26005)(1076003)(956004)(6916009)(6512007)(186003)(6506007)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IcKo6NNluXaQ8khpKeHDyAl5oNWbpxw9fR4gi207KtSncHg1GtFftTwxp88q?=
 =?us-ascii?Q?VVSgZzK2nz8q1rC7iGqPdcxCvDECc9yfz4T/+WmuiU4wtLB2+Si3oo4A8O8u?=
 =?us-ascii?Q?RSO9NRyQCUcNRYCy5l74LbiEV7QpHqxe/f6U/O/PaHq1qa8EmV55yPq21Q+6?=
 =?us-ascii?Q?pqOTvW/aUqDLxhJTMA67kZhen/SDETQN+0AOX/3wet1nY6qhd6YLWA+V9BsR?=
 =?us-ascii?Q?dgvshEEVCrbYPh3rHdBsOEs7qKtdfKLywMw+XDx56nFQ1U9ZuFcmgVZN/onJ?=
 =?us-ascii?Q?nWQpaX/Nj1KOYXjOT+lcX3/G6hKNRPgRM6Zz7UrdnF3nVW3gA41tVcMB/lIu?=
 =?us-ascii?Q?sgMS7Y8ATPq8ME9e1lR8WgqOGnETK0j/gaoYpxAmyndX5zlE52RBWs3/jVPc?=
 =?us-ascii?Q?g4+M2sWerOv64rjp9N75ARqAqNhe0NzEo82Fnw3bbw1HrQyzggelyeolizyI?=
 =?us-ascii?Q?XguTQ8OGqezP+Xav9yBF1fZNfQyRPfdue3BFBXeajUXKqC7mcWfpQLBD2srF?=
 =?us-ascii?Q?c8wIxJlISErvQyXxctMjhKfFLri9Pqe4mjt6KbqTy0vANikqDQ759Hw5VqEp?=
 =?us-ascii?Q?+YScLJMqo5bdqr6XdEtKwFB2LL0mFoEpV9O2P8oTCEYYdORs+qQ3+hUrMEns?=
 =?us-ascii?Q?cKaoDWb9h5w09dB8bg+uI3Vry7ZXcKhlD1+Y6q+GQg+8dpyNmtQY2xTWZO/r?=
 =?us-ascii?Q?6HsZLKXVCAhkY/UUDKxKBUuj+gIySmdskK+NA0m1viOsMCdmqiXKP9ODHntw?=
 =?us-ascii?Q?Tzf+9rve9hnkwJuhErf4tHMIjrMHMyfAeT2Ifzl2q7wm9+pl1ltY+8qkXygZ?=
 =?us-ascii?Q?Z8HskX6z3NmCXqDuoReQ4UAK7FLCNU60ov+PkCs9fNoYYrfcB7syZuXWG6tn?=
 =?us-ascii?Q?PtjRfvsWots4uql/+ewlr4P8Pm9AGVSK7mm8azF9aZo7svseMd93OoXemnN1?=
 =?us-ascii?Q?i2FGjNi3htIS1UiJippKxZhLzUC7rS06Qt3ncIMhKcqOOlXI5BGu4CwMisrQ?=
 =?us-ascii?Q?LQDoQW4BdJkw++fIz5ljC/DD1ClQNehVIggJnD+z1a2EYjtzLozdrWenLbI8?=
 =?us-ascii?Q?qfYoAGIACuS/79TLv7JfD9gQS5HH/Mv+XwSXJPjRuOi4XEGt1my59Z9O9F6A?=
 =?us-ascii?Q?D1IvlQ5w2Xo7eNA70gBH+LT95LPNLgVo8y7GUUumr89Eqzojnp93y6itW1et?=
 =?us-ascii?Q?OkIwYWaISXWYapNWZ4Jwgew2acXbr3c4p3+QmAGc6mRkCKxMwqI7MvQ0MMwc?=
 =?us-ascii?Q?HgvD294+8Tw6Nxkz/6dpnwyou6VREX0Qpha5tqW9Kh6FIplPUOas8CcdjfVv?=
 =?us-ascii?Q?d5fec4okiwolUT8jbIR1Nxff?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5214a4-ea29-4272-cbdd-08d92c029b5f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:35.9482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyvdzboAu03p5KYhghNeGADfmziI9kMQGLN1o1ce0c8PH4+EG1qNtzJT/Zifr/eQ3BxUcFqFE3Ta8UQsEg+HPwzzgUQgliYRIVwzWR+8ih0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3960
Received-SPF: pass client-ip=40.107.22.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block.c b/block.c
index 34bfe4ffe8..98673e788a 100644
--- a/block.c
+++ b/block.c
@@ -2770,6 +2770,8 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
  * @child is saved to a new entry of @tran, so that *@child could be reverted to
  * NULL on abort(). So referenced variable must live at least until transaction
  * end.
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static int bdrv_attach_child_common(BlockDriverState *child_bs,
                                     const char *child_name,
@@ -2848,6 +2850,8 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
 /*
  * Variable referenced by @child must live at least until transaction end.
  * (see bdrv_attach_child_common() doc for details)
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     BlockDriverState *child_bs,
@@ -3115,6 +3119,8 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
 /*
  * Sets the bs->backing link of a BDS. A new reference is created; callers
  * which don't need their own reference any more must call bdrv_unref().
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static int bdrv_set_backing_noperm(BlockDriverState *bs,
                                    BlockDriverState *backing_hd,
@@ -4792,6 +4798,8 @@ static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
  * A function to remove backing-chain child of @bs if exists: cow child for
  * format nodes (always .backing) and filter child for filters (may be .file or
  * .backing)
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran)
-- 
2.29.2


