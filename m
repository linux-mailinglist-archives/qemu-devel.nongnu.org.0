Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938043A2B23
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:09:33 +0200 (CEST)
Received: from localhost ([::1]:53250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJV6-0001ZR-LK
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRk-00026h-GU; Thu, 10 Jun 2021 08:06:04 -0400
Received: from mail-eopbgr80125.outbound.protection.outlook.com
 ([40.107.8.125]:56129 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRi-0004D6-RQ; Thu, 10 Jun 2021 08:06:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQFF7EU3Tb/mZYWWUU+Q215DO6dzJzkfEkqummKvYRopwLZ4sLEZ47m6oTEf404wlCatOIZ7s+tb1I+EO/33j5JqSj2ze4oFydg8qbwfi4cIkREDOXM7WRy2m4+9gFqDGsAfX9/KXSoNiTlOIKf/NM7IxmPW2M5s1p5tKYDe88EhUMrzrQvc4NUESNtjAWW5IAXUeZdJA/OxxFQvptgji0EGHjn5NIVVSSclcKywMLdqDcDCRqhpLwOsN9g/taXlJIpeVoTUSh5x4H24Mls9BZ3gEoEqDtQpmLtpom59ZsxyQ/oBzBTgDOyuYwrCmRjfBMc2JI8FyaY+QTRBzUdkFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msJTkS3JEFSqI2vjJG7PxI6OCjazUBWikpBftL78WGI=;
 b=HMO2ZN8N4ndNiPD+HANv1uACv/JIOjF3v0RpmfCXpRtEmxbINYMsFLJHXs/7NGYoQClKMvbRigSnRNtJJTq4BiPr5RnOylgR+FfxrGsSh0sexcRBd456Zk7mvtbeJsGlek4rvOG2rVMjoLUeT3aIfwBniW2Ribejlh8NXLGveS0ELoSyp8JWKEIjLydsewUxz3hccYCFcT20uoPg5b+Dum2RiaEXLej+GyxZLEcY9e4wa+GitG28NGfxdAptP/DGvu5gbkaHmVTfNjK6WU4UQt6nG2qG78c/5hu+KDNmlo9LsRvluy9knyG0vb0q2Xb8LFqV+N8MpAHJGYl89hTuKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msJTkS3JEFSqI2vjJG7PxI6OCjazUBWikpBftL78WGI=;
 b=c/JlTE/MjgSPV7600RRChzhBZLxLiInOklCf1/cn1bOZyXy9FnZz1+7aMsLZPJ1Tfw80wn6J0TFeMUqG3HTLApWArunTjCnAdHrciQ0JonfyRmv/ZpeoTAkw3HyfCnzGZZMTQiP+jOa/ZRB3eyNOo1/BY/SGhBVG+nCbXupP9JQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4277.eurprd08.prod.outlook.com (2603:10a6:20b:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 12:05:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:05:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v6 1/9] block: introduce bdrv_remove_file_or_backing_child()
Date: Thu, 10 Jun 2021 15:05:29 +0300
Message-Id: <20210610120537.196183-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610120537.196183-1-vsementsov@virtuozzo.com>
References: <20210610120537.196183-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0802CA0005.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0802CA0005.eurprd08.prod.outlook.com (2603:10a6:3:bd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 12:05:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bd5d838-941f-4d69-1c47-08d92c0818ce
X-MS-TrafficTypeDiagnostic: AM6PR08MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB427764BAE40508F2BB9B92F0C1359@AM6PR08MB4277.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:76;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NUiJYsLUdecav3/feAfpr62pai2GqrpGomz/+PLNnfnU31Uthg1giQRyywKVAqPDOpftNMC0wP633njFOdPnnqFMHPISMbCMu7P1hPOuLhS6m3NvmY4NpW7kNg2YfyTe0V1IzgQICkqjyve5gs1TyXww407IEeTnNlGm7dgpNOgcn3U1EOJM1C/vqH6O7AltMiEnXjY7Dz9ekB5ayG39TStNXhE/wgd+XNvYsQ/HEMj2uf1hzxhZ0Nu5uyamyfpudchaaDPhTnf0p/0sES5fWfL0IQCiK/lCaLN/yK/obdgwDrJg6syxDRz2qPskI2al6fpdzRF+jBS+j/NlZUvaq0X2fhAGqfhiIUVRt/pUJEeEJNhvS22eKRu3qoYIEelDKkdJy/m3q2dbYP6bwXli/Lq277G2eba7afgqd9LpSdIPDbffj/SeTq4DdKeDL3/ab3cbu05nY82TLqVPJyIAl58N4bhgvyBAfqxi5syFOgGxuOIUjV9f7K1PnKNlCwqxHQbFcPFv00hlw4Y3fStMydA8nG2GPZXXH2tJeLPI39oZAyLXDKjn69NqHnVESiBMcQk9Nvul0m8YXG/6Ilok7XwqsP4WNhiDIiX43x3Ho7imyMlKRwvhuWbFtcMS4SeU5FA+6OgZssUQAW847q5HGZiNyuGwc5DKwfUXEB7WvX5gwT6zvkOem1eZvVNqgYfs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(956004)(6486002)(2616005)(6916009)(6666004)(186003)(478600001)(2906002)(5660300002)(38100700002)(36756003)(107886003)(8936002)(26005)(16526019)(6512007)(38350700002)(86362001)(1076003)(6506007)(66556008)(66476007)(66946007)(316002)(8676002)(52116002)(4326008)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6MfevXdsDe+nNznrE/cba91lF0odpRfF6OtW1llE5eUoiN1RrPmdbHl/QShc?=
 =?us-ascii?Q?bR2/z1XMkIQuq1z+QZ0QFN31fV04spG+X9RJc+suiI9EwV4iGJZ4t+rHthmc?=
 =?us-ascii?Q?rOwNzLnumiraGibg1P1ZnFh8bfq9auFPsS2pvNJ0L3JjglJyyQRK6a2LVirp?=
 =?us-ascii?Q?SuRjHviwPiNEvKMPLJHC9r91xirMbl/E9mKPc6w6IsZW42dY4PxNXhrpbPQk?=
 =?us-ascii?Q?KdBmovECLbmWpS+vWeZDC5nfb+V4tUi1X+UdOgZQwCUmc9UNgTjmMfl85n4F?=
 =?us-ascii?Q?oyxvv7zmMavPxV9Rf7MxbV5TVXlzQyJZvXyJL1E6MvD6olyPsIyF6vIjM9Si?=
 =?us-ascii?Q?J7Jl9dXefA75EdVs0Uy/n/GUfNUX/3CBNcDuW/g/GAts6o/A3vObeMEbjE2U?=
 =?us-ascii?Q?P/E0ZxPZyBEElXUuKBqDP2vQ99SjS35HDzKc5HnNCr1DT1r66AMl6jWaqnJz?=
 =?us-ascii?Q?oYjZSaGrSKhpjPigzKSVH3jUPcOI9YxpkN0229VVCs86hPOniSkYfXvytKzl?=
 =?us-ascii?Q?yy8168YP/goV66ren1gWXYh2vvuvGpRldczTNEfysuuwGaRx2y0C24h51zIF?=
 =?us-ascii?Q?ciC9qxXQD+sFBh/YsccAopzxZwOkjr8KbhjfiVL4A8TAYONz9rSbqXwAY4TE?=
 =?us-ascii?Q?WitDh3ttN2OMDlL2E/s+EIvaOy69JTbEJA7v884PkKRlWtjxckreL9ncRRZZ?=
 =?us-ascii?Q?QeIBQIVDK33f4ESZVuJn/Rl4oLHY/tC/6gvOz0EygC1hF+EV8eNERQzSSi5t?=
 =?us-ascii?Q?eBPMawqYfPMHKmq/OBB6CLlUxfEvJ95zGiOmmS81pvR3aHooFlbf0PqmrNJ2?=
 =?us-ascii?Q?JbdeKHT1eTfeJXk8dR2Cm22QxyfKAxK9GYcZ/z9laFiFrd0rYcxfMH/cyo9N?=
 =?us-ascii?Q?UM+YTwL/SEiVTsveddCWuGDFfEwkkvJjMCDgrfhAC1ZQs4d0dwj83IN6AuoX?=
 =?us-ascii?Q?WRHLLiDhdgA5tJ0ksKg1GPDosExmtsrgOQ3lzaWmsoJWZ2GVIxpPUni8btlf?=
 =?us-ascii?Q?nv9HYCxMQdyPEcVib18eSllsOJUdmLdAoMi4Wf6Uco5HOzMlT4+W71bF5Krw?=
 =?us-ascii?Q?bAcBLJsNx6qzA0NqFLGGN9BjSJ+9R8CuCU5JrxhibVXuJKkBfU6+ht66xUmv?=
 =?us-ascii?Q?yNAGi79ks6Etem5eB48VnyVyhVCN4czYdm8IhWIXKVdcpS+SOc474sc2XDQs?=
 =?us-ascii?Q?MwOK7R0lhnUTIQyugxmhbsGmHCU1as2UV41eu/hKLB6CEQPhJJjWthvAe2+3?=
 =?us-ascii?Q?GeslVPfby/DHPhDJNYcTXsRMGANuZoguZL6C75qmbd0tQ54PIoHCNyTur2gp?=
 =?us-ascii?Q?/fjZ2Zpfa7fCPjBCto+ewd0y?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd5d838-941f-4d69-1c47-08d92c0818ce
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:05:53.8710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEpvQs5lSwm8xR1l4/dHXJhRH2X8zV3mZS1ArXiYkFwjhranvQR8uRsfNNYgmUozM8JNWQV+QrmZkoKZbEPCtMnm74K47o3DJktMLIlwC6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4277
Received-SPF: pass client-ip=40.107.8.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

To be used for reopen in future commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/block.c b/block.c
index 98673e788a..d21c9e4316 100644
--- a/block.c
+++ b/block.c
@@ -4795,17 +4795,16 @@ static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
 };
 
 /*
- * A function to remove backing-chain child of @bs if exists: cow child for
- * format nodes (always .backing) and filter child for filters (may be .file or
- * .backing)
- *
+ * A function to remove backing or file child of @bs.
  * Function doesn't update permissions, caller is responsible for this.
  */
-static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
-                                            Transaction *tran)
+static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
+                                              BdrvChild *child,
+                                              Transaction *tran)
 {
     BdrvRemoveFilterOrCowChild *s;
-    BdrvChild *child = bdrv_filter_or_cow_child(bs);
+
+    assert(child == bs->backing || child == bs->file);
 
     if (!child) {
         return;
@@ -4830,6 +4829,17 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
     }
 }
 
+/*
+ * A function to remove backing-chain child of @bs if exists: cow child for
+ * format nodes (always .backing) and filter child for filters (may be .file or
+ * .backing)
+ */
+static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
+                                            Transaction *tran)
+{
+    bdrv_remove_file_or_backing_child(bs, bdrv_filter_or_cow_child(bs), tran);
+}
+
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, Transaction *tran,
-- 
2.29.2


