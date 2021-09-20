Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D24113ED
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 14:02:23 +0200 (CEST)
Received: from localhost ([::1]:54580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSI06-0005eN-Lz
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 08:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHu9-0007WN-Tf; Mon, 20 Sep 2021 07:56:14 -0400
Received: from mail-am6eur05on2112.outbound.protection.outlook.com
 ([40.107.22.112]:8080 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHu7-0005GQ-5o; Mon, 20 Sep 2021 07:56:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRkZdLKftm0spJh8buLS4L5zwKu18n81YFdrNw6e5XIeiiIVPb2XSoRmPOorY+Q+XatXdOTj4k/j0LPZdywmsgDTGlXtsTefIAEeIWyMuKnaw/74RQd/SMm5453Vr0hWozioCJNEVTYG7zKToU8vNbmrsuYpkozd+mJ0Jy9sldJm6GtQS/vK6fb5oVED57wnc5mN/01TbC61K59emFZob7sh93Vw7Q9oMtznhxKrI/yr4zgXxBYLS23Lo6UXvOXNl81ZwqpMXilPwfbUZKgNsOkJwnyVQcW0iAxskPQMJZC7Qt9m15JSntpOH1tqh6dkk0v2VmraHzssZUBmhRNsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=KtsD+OeC5pdqaRsDVU/GhxH5Rd8yIrBRwUOMpYgOIqo=;
 b=eFWotGrot2VrcjQ2yawSvLLpv0pnXiu+lnz9WRqyEyQmiuuGbMuHdCj687ywO+nG8YOtJSk/ZbyvdPhhbrEpKNmPyCCuoe2ooJ0sjXpyufXSMk9r6CUawIEn4QDO4mnAdTtdeHUBSKfzhli+wm8pu2I4dgw3/jZ5kCj8Bi9Es/pvpbJvzjACG8714iVdi1jFzFdTUKFuSoAFJKeCI9Q04ShcUlsuY0FGzXbCtuTblTk+NEcf0sUDHn0H89kzd82XrHX33hMzKNcqSdTeB4ZIcJVWHXsDKOPmoQPQz+qzWoYJYQXKItQbQ1F7tjXpAtQiVN7Kxh2Us6MeGy+gR9F04w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtsD+OeC5pdqaRsDVU/GhxH5Rd8yIrBRwUOMpYgOIqo=;
 b=fhy2vCbIuvYmIVYoxyOT4Fdu01jfosAYbJveJqxS+JuTPBcKWfX4bjs5E3+VdWR23mtHzhikiC8Wu9rZSI1TKN0BcAiUWHGXRF8xyssZvgOfrw7Uy+Lwyjo47Ny4UX58R9IUECDYxaPHIyN3UAQ82xkPDR1sBiqM8Np+RDEoT1Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 11:55:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 11:55:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 3/5] block: bdrv_insert_node(): doc and style
Date: Mon, 20 Sep 2021 14:55:36 +0300
Message-Id: <20210920115538.264372-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210920115538.264372-1-vsementsov@virtuozzo.com>
References: <20210920115538.264372-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR09CA0082.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.205) by
 HE1PR09CA0082.eurprd09.prod.outlook.com (2603:10a6:7:3d::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 11:55:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7684017d-f296-41bc-5476-08d97c2d9c0e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB66319A5F2ACC12D661D2F9DEC1A09@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4n/yo5xquhuHkFMopMdLM54vbm/+LuuXok0R+Sog+nVDKSSrG2tzVb1Dg8sAEK3ylxaRxWG9JqN6DvLYtQ8ZSiIoht/1F9hFWU+G2+6tc4qWTgUGJvWtWVlhQWBbH2yffoKV0dxXBkm4bwevimQP0HR9mVWGxhpoG57fxkqSzGvzdGCeDBZ5KLAauxSUlrTkc7076HDVZF76kLZEP7lY6sq0qnOVaGOGQcuLkJnxhIEoGn5mSq6Q8yy77rGkV9aqvXdZO57/nwzSnpTEsvEpA3XYZ+SJX3t/5svf7SGrKkRNVASQBrBAzJutA1+KrU101wz77QLkile2mFyu2tcYZ8nZ7Ryas6AWAQQuVMGM3CTpN0Ol27WFySxqWhkwHd46EjdjOQFxVOQfLfZvGZBn+AbZAO0KkF5sMf1atax2ZITIhqWQS1F+UxwdRqlVm/8SeJVc1Hqsj7hz28aTMHKHhMIdu2axdFsMVKYako/UazOqEdWEyAsRfL4ujpKp70mbtAz2T+tQkZ03sjlszMQji3hbjQaREb6b4PSco9CHKvzzy9pnL5jxy1Rf0bxQO0ApODVoadd0Rq+IWfRwTZ/NmR9WbTTqW1G808n4m+pHHW6RM/KGhsrzZPRIvw9I3YTJ+UT8qtaJvmNaM0rpBg/cwNwABFLe5hFQ34Io3oN0fshrk+hnTueh0I5JqQDNdaNopAZ1jWRhPI/EOghmyX1qkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(346002)(366004)(2616005)(956004)(66476007)(478600001)(66946007)(4326008)(83380400001)(66556008)(36756003)(107886003)(8676002)(8936002)(6506007)(316002)(6666004)(5660300002)(2906002)(52116002)(1076003)(38100700002)(86362001)(186003)(38350700002)(6486002)(6916009)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JRcK+5rw+wuylsgn4upNNzezOsa51HsjXW+aPBUjSeu+ImkHM2uXE+rG/PUD?=
 =?us-ascii?Q?Mulf9VM4/1A+kX0ib/R+XVrRMv5dII43O716DoBYlE0X0VVttwRZuF6b8QoO?=
 =?us-ascii?Q?fGAj043N6lTdSUf86gzfSyGZYGudc5WSg03u2nOvJX7Vn5C+mEoCS/uaXiHD?=
 =?us-ascii?Q?xpbB8Vuj7AtWWyQm2WjbK2H4+M8PvERZzRbqzRcP9ikcvxszm8ePsShIreSh?=
 =?us-ascii?Q?6hnVcFq0N+pOp0eAHNOBjnSfFtAC8GM4WmSDn1qn/zAZwOfqxkRjd9ttgF91?=
 =?us-ascii?Q?C6FAHkWVg+FrRo4jXtLGfq41RBtCd4OB9XiPJyNJTajK3ewaDtm43RjnATZN?=
 =?us-ascii?Q?WzBwSqIDw7XrHIrDqg2q+AZhwHMCerYqgWsN1QuyyyMdCyKs8ZL6QV/OOsHk?=
 =?us-ascii?Q?tpMsXYvTgSh+PrduKDKxMnmdnRYHxoyA0EO36Q8zPUsvLpib9Tt7MNOak+Fv?=
 =?us-ascii?Q?kZKB8+NTiaVXe7jUTMQxLob9rcGlY6a0pAOaQPj4VcfM1odScyN1vrjgkxjy?=
 =?us-ascii?Q?AE/k84wAt6qveVcW/5SkGibszwShMjmi19Z5AVrwgMxgEuT7F+V3cOoNQT0C?=
 =?us-ascii?Q?0IR5ybzTrXyo3aByQ9ReHh0p25Hl/1B20nf0BTq4XlW+/ZqhTVPk5uiDlhPG?=
 =?us-ascii?Q?4A9lhDNHM25VFHXEC8MxCzEUSH9t7cruEkF5585bXaXif+DFR7RB41E6vrbG?=
 =?us-ascii?Q?PXlD70BElg2y5hGVvAA9EpvAnjQaiNzhuUf/Euqu77SZBuEh7xM8NsD2capd?=
 =?us-ascii?Q?4r6pl1HvQgMAjrhhb2+EGjEmnXMWEB/WKhbti47GVdsbAxBDa1LdPUZqlKhN?=
 =?us-ascii?Q?iVRYtuxvpBFxjptqe06aeSF57YgJzK1nBNSpGKKVMN27e67zz6Z4Z6IdCgqY?=
 =?us-ascii?Q?6xLkFpT0QtnSLnT4CNwv+URc2QLq4A3KxlR4Hq4tCoq1eF2QijUt7t7BQKks?=
 =?us-ascii?Q?gBSsDWqKdPg/RTN7rTEK3AXiHonckNqJpa3mUZYqwyw94AwEEmyNxIOHhXq1?=
 =?us-ascii?Q?MJ0itIWK4j4k7QeZSDmNx/tdDJwPpfvSV/PtFsIUseD2jmEsc1UdsVryGQem?=
 =?us-ascii?Q?UosROf39oFYO6n3YQz3obuDn0AWi4o0py0WBR7E88JS33rR0XWx5ZmUC0QAH?=
 =?us-ascii?Q?4NGFOPaf2vz24SuojI47gyCmR649I6AwKI0eEyk8aAdGm3UKdiRFvo35IdNr?=
 =?us-ascii?Q?yHg/FjTpqS89hPwRWM4uOeJUzzGSu+tULDPXE6xW7vDaL4jk6po0Txm4DXya?=
 =?us-ascii?Q?MdMyAAuJ4liyuZBw1SBtUfeCK4VdSHBRMexc89beWwy+NoTze1/uqaElsqru?=
 =?us-ascii?Q?MXHRWNdRDRH/KYsUTehPS4+z?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7684017d-f296-41bc-5476-08d97c2d9c0e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 11:55:58.5517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOQnNGCjMTSP+jMlU3L6VCbRk/K9a8YG0nqlLFwqECwwrFBrTW18CTsH86E0haM6ImqKE/v4HxXv30CZ9xJ+B/oJ8Tq6fmlo4sMRejf9nCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.22.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

 - options & flags is common pair for open-like functions, let's use it
 - add a comment that specifies use of @options

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 5d49188073..3a90407b83 100644
--- a/block.c
+++ b/block.c
@@ -5119,14 +5119,23 @@ static void bdrv_delete(BlockDriverState *bs)
     g_free(bs);
 }
 
-BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
+
+/*
+ * Replace @bs by newly created block node.
+ *
+ * @options is a QDict of options to pass to the block drivers, or NULL for an
+ * empty set of options. The reference to the QDict belongs to the block layer
+ * after the call (even on failure), so if the caller intends to reuse the
+ * dictionary, it needs to use qobject_ref() before calling bdrv_open.
+ */
+BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
                                    int flags, Error **errp)
 {
     ERRP_GUARD();
     int ret;
     BlockDriverState *new_node_bs;
 
-    new_node_bs = bdrv_open(NULL, NULL, node_options, flags, errp);
+    new_node_bs = bdrv_open(NULL, NULL, options, flags, errp);
     if (new_node_bs == NULL) {
         error_prepend(errp, "Could not create node: ");
         return NULL;
-- 
2.29.2


