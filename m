Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BE92C6888
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:15:36 +0100 (CET)
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifTD-0002q1-Es
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1U-0001if-4p; Fri, 27 Nov 2020 09:46:57 -0500
Received: from mail-db8eur05on2099.outbound.protection.outlook.com
 ([40.107.20.99]:45281 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1R-0003QT-Vq; Fri, 27 Nov 2020 09:46:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYQMyjOA/25+PE5n7kV6f9+Xov/25SaN6imJEVtKUQTI3/DABlGVfFfMcV8ct0Tyb54UtVkO1CZ9o2gp0SOXk7EVhULLN59hsk54FqNdjzwLmR7VOi8kWdPnbfLhxgUZPO0/C+DdlEYa+e2baFGn+qEbjP03kCOg5Qd9x+x/UDNAJY2XxsNOvoBCS2tKADOi5XkafNuO4un3sPdNOf/Qke1qfF42Q8Zgm2GUhRgLtN75v0z7wUbPj2GqJ/n4O02JsaqfTc8TDgIHx72oXeIFPWMNOJ76WhxrojmPzbTjGor4ob9b6HbXXiV24Raenyp1fu+YEVT2pKOzKhGxACAihA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMcuknVbKw3kNTGWPyaqfp/oGc87QtBtSY3NYoK/T1k=;
 b=kWR1oAitYjJXYH8M/BA1G2deuj8K5uZuP5CcjN5RCOVKQoW2c6UcDgTmFkMTF9r5HQ0aY2elYdxRFgV/Q7MJRW7LyRroJxrM2G5CB6ZF4pyr+wKKIvhqfxPBaG0eYL2PuuZg+2l2K+kVJKYiq4Yy4LW3RYoHitZMvVv/sBgHl/m5TPzEM8y1OGyu5EY0vNlDSc5XPpL2dHHUi7bY67xUHELpOwzi2IbdS3dpXGXTB4TFnu0r855NmnqcqsyXF60p4WIZR04D1EKdrqYtED72dxkySjeCkBtUfutd1RyM91ZyXxdH6NsEFvtv1aYZyimk1VxH4c80aMZyE55gi7qf/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMcuknVbKw3kNTGWPyaqfp/oGc87QtBtSY3NYoK/T1k=;
 b=Lb2CubDudcHMvgLasjKaOpLLZzwGgPQUStBIPE+6kPfdiugvW6ECUdseqTr8/Ep2VgeHUULJfL06QTajC7kl9KF+wqxhqaqn4ilFR+VgqbeASEg6ZcHYoRLYTQ/msnQzowtc97H5WLeSijVDURFaqENY1HApqYjExPrbOt8VH9U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Fri, 27 Nov
 2020 14:46:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 32/36] block: inline bdrv_check_perm_common()
Date: Fri, 27 Nov 2020 17:45:18 +0300
Message-Id: <20201127144522.29991-33-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:46:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f284125-0810-4bad-3c79-08d892e328ec
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5990BFAE834DCB2CA330DC5AC1F80@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MR9s69ePN47xUaQQYXPK96F2FTWksly+HcTvDn3XCBJYZUajU7qYp3Yw+uM+XgNz1L2OP6hBZY9Nd9pQ58aVmYSc+6Qh4lihBD0HGlnaV5ww/rRnlwOpYcjkaUqgZdeHE9cNpSs2o3a0oEs2bkRe2pGCUC6VrhT8v8Q3h2yo0DEXCp039bi2IdASwKn0udMAgU64W3zmxvcrYtNHTf5/+HT8B4/7r06U+t5rpPQzA0qnjTXDgekPlvUEEiC5hhSSxLbVDJlGePnrzYsG6ElO6neu/qtMTwcFgeJ4Gw3R+J9qUDDTB0dJPGXm6+1Jf6ga0cEcg3ZCHr2tnXqv/YEOZi2cP/X8FTmEoV5VZec/aC45Z50tni0tXszAWdSS/Uh6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(83380400001)(26005)(956004)(6512007)(52116002)(2616005)(66556008)(2906002)(6666004)(8936002)(66476007)(186003)(5660300002)(6506007)(107886003)(316002)(6916009)(1076003)(66946007)(4326008)(86362001)(16526019)(36756003)(478600001)(6486002)(69590400008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Cx59FXvEgVcg7aahLS0MScxSckKObrK8P9d80O3c42hZVAI9Lc7UsNHAIBvw?=
 =?us-ascii?Q?y8JxNb3lYBCsVnH2u1ZDxGzQqpVt30j23dhwWpjpkNeWW8Nt+YTE1pNGbWpq?=
 =?us-ascii?Q?plPjiFmJ90MUKgcSdqF0LNNXhAluSKCNl9x8lQc1zukoASw7pu+KnWczfPZA?=
 =?us-ascii?Q?UAX+3Nm4LSTfVGpT+EZ0QLci+RKb1ELRx5du5HgasGjq+J1v1KDXTxJo90tT?=
 =?us-ascii?Q?4FHFTqsEXyRs2ThmvHR+syySQSk8EaYqJ0bljUl6ucymRLvuvBkz5pBmf2gs?=
 =?us-ascii?Q?COIaWz5CC7wg+hvSM2uhTc8PRvbKGI+nwWEKl1e6CgCqmcAcjV3lOVPruyma?=
 =?us-ascii?Q?4P197OU03/1EnXstuFoBGkGoTeicQjSdYjASky4F3eq0FFMhrEJe94qayiVz?=
 =?us-ascii?Q?6QiEAEHTp/93P2k2pltzZ8t5mpq2WHvE0yh/8sCkDX1zVGwiF7WODYaAdk19?=
 =?us-ascii?Q?U15zAmvwJxZlYWYZKX9J456ZgZaKNSX2ge5NmZDToiGEPk2MalRrNEIfyHvd?=
 =?us-ascii?Q?kNMFnY8htVQqEeq3+yRJ6IIj8hq/+Vi3XHDqWtSw6zl92mSw/XqwWQh3POW0?=
 =?us-ascii?Q?3xZpH1+GrVnyUHJo0btM9PZN4zimcn692IX4eO7+vwukn2w22M+DLXhKCdwY?=
 =?us-ascii?Q?UB3UifGGz19wNOiynJe5+TGbngR5bTD/WKpRcmQZDEJRnV5uyIh0BibBo1Kc?=
 =?us-ascii?Q?ldSgJ3YxN7WiYkY0NJxjrpI+cXjcmbDPEvJOk68nGcGWwyOWw8stclyhKa/R?=
 =?us-ascii?Q?Hh3R7+4gRsGU8+EpGRwWxZTKDfduWtowpWi61tvKgXRNSvoze9hYldgkLbZV?=
 =?us-ascii?Q?hXej315ymRF+r3hdQRYZWMYxMZOVc6fr8+OCp+tcs33SoA8pcXbQDganAGTR?=
 =?us-ascii?Q?buLwGcgV/FQXrgRqc69SsQIgIdjTVOOvE3DGpah3RhQUhJ3tvD2AXcyfLysG?=
 =?us-ascii?Q?62+UeStxOVWtP3Vq1rCnIob53zr/ZlZgpf8kuBhuFfrftlP9N5dLMIWDKV8H?=
 =?us-ascii?Q?tc6F?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f284125-0810-4bad-3c79-08d892e328ec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:46:01.6370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3EGV/pbOlWDM4xTv8H6/s8BUVBamIyYrvLZk1mkvt2FGY9cdrPNHu9/+udp59AX+pxKATBYnUYtoYIm2ELfo5nIIUkTBkzbd1KNmW0D50/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990
Received-SPF: pass client-ip=40.107.20.99;
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

bdrv_check_perm_common() has only one caller, so no more sense in
"common".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/block.c b/block.c
index 3ea04bbd8f..6c87ad0287 100644
--- a/block.c
+++ b/block.c
@@ -2308,33 +2308,13 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     return 0;
 }
 
-/*
- * If use_cumulative_perms is true, use cumulative_perms and
- * cumulative_shared_perms for first element of the list. Otherwise just refresh
- * all permissions.
- */
-static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
-                                  bool use_cumulative_perms,
-                                  uint64_t cumulative_perms,
-                                  uint64_t cumulative_shared_perms,
-                                  GSList **tran, Error **errp)
+static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
+                                   GSList **tran, Error **errp)
 {
     int ret;
+    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriverState *bs;
 
-    if (use_cumulative_perms) {
-        bs = list->data;
-
-        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
-                                   cumulative_shared_perms,
-                                   tran, errp);
-        if (ret < 0) {
-            return ret;
-        }
-
-        list = list->next;
-    }
-
     for ( ; list; list = list->next) {
         bs = list->data;
 
@@ -2356,12 +2336,6 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
     return 0;
 }
 
-static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
-                                   GSList **tran, Error **errp)
-{
-    return bdrv_check_perm_common(list, q, false, 0, 0, tran, errp);
-}
-
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
-- 
2.21.3


