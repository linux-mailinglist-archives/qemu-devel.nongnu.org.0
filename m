Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CB7397878
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:52:48 +0200 (CEST)
Received: from localhost ([::1]:51456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7dH-0004Vb-BS
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bS-0001L9-N8; Tue, 01 Jun 2021 12:50:54 -0400
Received: from mail-eopbgr50117.outbound.protection.outlook.com
 ([40.107.5.117]:4526 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bQ-0001yq-HX; Tue, 01 Jun 2021 12:50:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNQNQ3St7zFkjFKEKNkpFUJkPjnJpmv71acGyayq/k2mW4AFnAarQDMpd0d6wdNXvHXQXkq1v/hQmiuHF6pUJmtUwNeW/0t743Ebdh+cjx/t9hACWbc3kcmn75/gdUqbUQiNFOfZmt4c6rc1MnrixR9aSNOc0SFE86fACKx4EWAqG20eLfMs8wprRuuTQp+vih2+hg5u6Ud78ZhX9fQzt9WPQP8fB9/1u+vT/k0OGWfe+hr0378ITKukVl2LNw0oDR3XECYAKNc5WLkVwmnbzrD+KLw8TXk0YWoUO+CyyWp74pzzVS0jK04/qwEqzGpylHq+SGMwcyrDXcb1Ttj46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/he3+yLH7EELkKCcptgAj8DbU/a4bD/LB20NBYFi8U=;
 b=E8EH6FRtoFNSR3cyrGWCAUrObt4uzTPkbJx/ul0IX7blRNy8pDa78FMkN4ZC1LbODZ+2xd4fKF/InVDhxv3e3nGZja0QRTkYazl/bqmwVFlkUHNsxtW/qI1DUElxX8q8stV9AsSuz/z8bDzvs0kFyJrn9fkKaYmnfGpEwTHnj7Bz91g4XdxiTltZX/p9929IUHoeVlz68jbwVOmmjyc3MWMb9JQ0PQYsLMXBWAd0Vl5p/3y9in3dI67WoL3NQ/aMI9NH1QsIydim7wjJtmaDufWcPHtAOYNtU0L6TiawFfwBH+8x2pahVchFFd/gVf2cxVyui2jVgkdmKP1qzMU/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/he3+yLH7EELkKCcptgAj8DbU/a4bD/LB20NBYFi8U=;
 b=TSXj04G70/8k0sHZlA2nmhrTPz8swbVmDA87tmv5o6acI4SBDtPjsIbVnbLsekVBcI+yaTqATfdHWr27Ue+wgligZuFTIxXmnamiI7vPyWUjbZBRRbECRtmSuvDv1tjCvTuHOgrYfF7Nxpfs45OSDv+VM6tJyfjJ1Dmnw9uCvQQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 16:50:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:50:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 01/35] block: rename bdrv_replace_child to
 bdrv_replace_child_tran
Date: Tue,  1 Jun 2021 19:49:52 +0300
Message-Id: <20210601165026.326877-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1aed3e03-e5a3-4488-aa03-08d9251d65cb
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB447118F1D28A372614C89FCCC13E9@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IHJE2PlWb7ZIlcbHsR23sXnYR1VqU+HAyYn5CJRfh7D2wyDwnLJrBqGVJ4r2TsWnYQvwa/tMlFSx7elQIVOtWN8lU8DMcqAk0BSRCo4h+IsT+nzKKHR2y+v+nhj+bDiCrZqDvPuwKIRDhcI0kspR81FVO48aXhh+yiJGZesMRxUh/6a/8NXkatvstl+FOZ9v3X6nQxxt5MR8hf946tDZd4mVFeaLFUC+op74GG3jOdGa2U4fGibh8SfX25lfZrAqVZGgUyFolPAMYThm9DVJIBDhr2UEv5iaynLzrf2RM2ibDK+LRVefTWeXuMxtIMiTdo4Nul+DFtMDdqO2rdJ8sc0O/YgdBY7WEw11ZEqajkGxZ3sjaGu9LggFjNGbedT5f9ttAx5N+Qz+bKHPnRglf1Svt4gZ7NbMWEDLznXGkpVtXBhqF8TxFrxz488ZDh7FGC4+/MKkg8PgKkUREdYiesQ8gdZVy31WDx6kJEmoZSarh1a9/8pudKeYaQvLGcv0ovflM1Ca9/yKyGNIJBe6KsAwb5wR4oQadPbERIjKjPy4wn1pO2fAsMPqvMzeY54kBBuK5DDq19LSVpTJ1FJ4zRYq7FZOCTYqUd8u15FTUcXF/c5zjJrFemAZvyyNcY/l/Lhu9tSejiU7w7bJpC61eJ/5WFzk77AEkHvJdV0zk4c3IiF8qc7DjIQf+Gz9yvim
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(83380400001)(186003)(6916009)(16526019)(4326008)(26005)(8676002)(2906002)(8936002)(7416002)(38350700002)(38100700002)(478600001)(36756003)(6486002)(316002)(5660300002)(6666004)(6512007)(52116002)(66946007)(6506007)(2616005)(956004)(66556008)(86362001)(1076003)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4AFqmOAEGS7yILJmsbsZvsmCS5+K1zlsCEGQupDXEMitGTheajjZ6PLBhX+u?=
 =?us-ascii?Q?SZfsdwX+JCcIQwE22dUCAtdVW1WgfQ+Bglt6yVbWC5bqKuV+xslRLCww9c0T?=
 =?us-ascii?Q?ARYn8VXc4stuy1NYAIj2fxaFKiJKl+V0wvEZq7Ph7+Nb4yNiKThfu56OfIp4?=
 =?us-ascii?Q?hb+x2XQJZ5HZsWx4LAKPiLjQs3OOivK6P5oKT7ncniJN2tx/xbOFjo4oWL8B?=
 =?us-ascii?Q?F7LIsCJnbB7afFOXTpeZY57JUP6E9c0i9k9t+hq4+UqZR0/+rvsyBglETyMQ?=
 =?us-ascii?Q?bTGlYltWWUIgHSb+SU9ONGkQcdbeSXPiOjcWQUb5pesJlkvEryzPGwHtuRQr?=
 =?us-ascii?Q?MOWk3N0r2eL0Bt5kGFWYyhPIG5IQMMt7yRPFaQCML8OojYC25zvAhBt2tERj?=
 =?us-ascii?Q?HH2fVOYHCny8ieOf1sOCvCqa6LpeePyrq+8gmUQ0+n2CPflz2CL/0pidt0Rx?=
 =?us-ascii?Q?UonMbgIrpjCAFCVQAyw/I1zSGV8xYYjocydFB2/47Y5yNPqbpk001Q8YFMoL?=
 =?us-ascii?Q?759ruz/TTPwqPtj443pH8N8eaYTcHNTKApa/j0Ln0uxqQgkNfrgU8xdN8spH?=
 =?us-ascii?Q?yjsi2eslyKpIuTnSoItQ7+UaoFYN0V6dd058cDA4Bji7eGO/ndw//oYzBXzp?=
 =?us-ascii?Q?rghuMECJvnK2Ez7xwD41CZvWUzMN9yoVbhs+gEYyMDgeVfojbMC4OjZ7TdZa?=
 =?us-ascii?Q?9sqtKGJxjSwgmSkAOGI/ZX68tVFRBNZCFJDDkIhJkc6DVQMyN8AdiXpmLDSL?=
 =?us-ascii?Q?nu4oAXdHOdja7XQOxYPGdA2OE4cBj3dwp//T0wOsqbSxQqtb6TGrLwvVWCBk?=
 =?us-ascii?Q?60FWRwahDjc2euge8kt7geNOv+dvIvByxo7FxGTBruc5G26H/ZTCRTLfyuX0?=
 =?us-ascii?Q?KBZoKcB74B89wdlDtcPiBIZ/DTFp8x+q9/gfjJuPAtMTiBCmoVpH2t825cfW?=
 =?us-ascii?Q?xuFU9WfXurF6HSq/M1A0wxuijfVFyLsz7HCO4EjMS31LK6P/cb7/OPfSElCc?=
 =?us-ascii?Q?UpKY4ZnfBlRLtTDJvkXQmhOZmvwkXvtS3tiMe1h4WWFcfMNts6xh8UDA1176?=
 =?us-ascii?Q?ofPPPJZD5WSrY/zhOVCyXis3MtNCOYv5OQVzk3gzJBcdCUNjXZFRFqv5qd41?=
 =?us-ascii?Q?Yur3jbl7LmenvDJu8XoDxablRsPqsM64UTGEMEIp2ifHCLIyMQjH5pK1JNao?=
 =?us-ascii?Q?MceeN5PH30KlC/Cm3HBVIVz2BdsNaAbx8g5gfsjgLq++uIQVWBVVt+uZheEW?=
 =?us-ascii?Q?7wkEu9xrpVB2MaEx2TT1C1QS4MtkOb5P6qB8Ekgq4p5DQ4xgLyw8GZ7lPbzT?=
 =?us-ascii?Q?t/zAxUawTFOMyYqUC15AvRa0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aed3e03-e5a3-4488-aa03-08d9251d65cb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:50:44.3125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExxNp9k3xrYzf/Cl+swiUFcdnDy4IE0vlBXjVqJgPV7+EYRAD0Zg+S7iWv1WOnN11gx4EBcURAfOd9pB/A+Uaxn+8WrjRUwzGW2v7sqNamg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.5.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

We have bdrv_replace_child() wrapper on bdrv_replace_child_noperm().
But bdrv_replace_child() doesn't update permissions. It's rather
strange, as normally it's expected that foo() should call foo_noperm()
and update permissions.

Let's rename and add comment.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index 0dc97281dc..3033c90666 100644
--- a/block.c
+++ b/block.c
@@ -2247,12 +2247,14 @@ static TransactionActionDrv bdrv_replace_child_drv = {
 };
 
 /*
- * bdrv_replace_child
+ * bdrv_replace_child_tran
  *
  * Note: real unref of old_bs is done only on commit.
+ *
+ * The function doesn't update permissions, caller is responsible for this.
  */
-static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
-                               Transaction *tran)
+static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
+                                    Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
@@ -4750,7 +4752,7 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
     }
 
     /*
-     * We don't have to restore child->bs here to undo bdrv_replace_child()
+     * We don't have to restore child->bs here to undo bdrv_replace_child_tran()
      * because that function is transactionable and it registered own completion
      * entries in @tran, so .abort() for bdrv_replace_child_safe() will be
      * called automatically.
@@ -4786,7 +4788,7 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        bdrv_replace_child(child, NULL, tran);
+        bdrv_replace_child_tran(child, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
@@ -4826,7 +4828,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-        bdrv_replace_child(c, to, tran);
+        bdrv_replace_child_tran(c, to, tran);
     }
 
     return 0;
-- 
2.29.2


