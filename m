Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA812C6877
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:10:16 +0100 (CET)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifO3-0005Kp-82
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1Y-0001mE-QI; Fri, 27 Nov 2020 09:47:00 -0500
Received: from mail-db8eur05on2103.outbound.protection.outlook.com
 ([40.107.20.103]:20897 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1W-0003RM-Mt; Fri, 27 Nov 2020 09:47:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ug19V9Wrb3EMQRCP0kV+CXNpXoJAYohoNP+XuJyrcUt0L2QC5UasLF6HVagD4dfw+Ftd2hBcSOHh60Hax1ADQ4Zb67UjJJvD4U/QaJie0eAkuUeyyDQXxnILYMrVHasyNaGWW5VcfV6lvbAIQU2J/BQcqnOwmzXCTIT8TjJ/63BIJ1gtTiHx41jmDqLY+Wtlg3seFVIX4F6JDOwcMye1Us4Csmq+Z1DeWG1GbkshwkK1F69fWdlpIXMae6iawLpj2SVDwJDgTmkZf2NNwfHKTBG6vC4XGYu7MVbY6hkHUT22wQWGUhbiv16qhhezNc04AQiAnCWw1kY7ZVai8BIOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5vhHNC0SzknuMB21V7D/0Q2Rwinu0Pe2SDsP/ILyNo=;
 b=m8ZY5to4a6C/CcWJ7vLtl2Qb098Uk9A9z5aqxE9fCYSvoN7P+ZtC8x2vZdaUdAAHZ8eV642RfKfM/SodjUd4lC6arYAtVWcRCaA0OgQj1YBgkTqM44VWm+Qofu1ZFdOEn9Y/+RASnWFKmysPPzyz66OfyjI7NFmenw4uSU01eMGRP95ns3V1c/VRu6mPAJhQEh1SqtTxl5f/8/07OUY35UiO4aujmdzrZTF9rBs4NbrfUr1kukqk1C703ElfxUNo6DwSj6lS8NFqy7fHzZ8Qs/XYTwm5OWNaV5WdI9t5UwJrw6XlFgsz9oBUM62UAam4dSrc/hhkoEIekRw9jeuciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5vhHNC0SzknuMB21V7D/0Q2Rwinu0Pe2SDsP/ILyNo=;
 b=nkh/wXG3HqkRpdrllf/Ut7Xia3Wc7cE67+vlCbKPvyFLVSDCTFMYZ1Bb/vQgI2x09UQbCN76RUPk1kpN2HFP45ZeON6Cd8JvFGeOMIPHcBOB9W/rrZNhe2IExbVXrYZLVixXkGVgscYycyqXYoYnmrniWo8TRF5NhGJRtGFMuQM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Fri, 27 Nov
 2020 14:46:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 35/36] block: rename bdrv_replace_child_safe() to
 bdrv_replace_child()
Date: Fri, 27 Nov 2020 17:45:21 +0300
Message-Id: <20201127144522.29991-36-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:46:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fc86d2c-564f-432f-3dc0-08d892e32a58
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5990E78828CC64BEEA6F8525C1F80@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bZH2zg6pMp6cnSkzuHMJE7jaKLJjbi125LyJoUDMM8o3qzO6Pk/C4I6cCuJx6Qe7dTIxus90sP3E/4BDGjfrv3P7nPnx3NBZjnhVfcH8yTS55QG8vhwaHoENw1pu9fiINnwCsMQ1L6NQHWoXi536v6MGjjaY1ewMzbypxHJufFge3SQR5lgKpozZHYNBu93UWf3Bx64Ot5myTPMFX+oaf8/9R5NqymYvAVIALOA5AmKrAwCOhxNvc0hcLrWcmaHo5s9+/thRlqHlRUhzdxpC9YXoBxzIoYgXvzP/iIP2rOFsM0buDRFVV7FvM+q2/uxmk3Ln+adyqevbkDFfQwCPxwngMoKSB4Z2KD1XXHLfahPaTEOnPthCRtENlXCy+84Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(83380400001)(26005)(956004)(6512007)(52116002)(2616005)(66556008)(2906002)(6666004)(8936002)(66476007)(186003)(5660300002)(6506007)(107886003)(316002)(6916009)(1076003)(66946007)(4326008)(86362001)(16526019)(36756003)(478600001)(6486002)(69590400008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QcidW3k7ezAz2onITdrJSUa780LRE5LAlY0OgmErpOcN+tCzQWdGToLzqxpR?=
 =?us-ascii?Q?x1RR/prQWMs1/hyQt4YnKddnpYqghPaTr5MoP5ouJXd06Z7ur+RolFhtzTBt?=
 =?us-ascii?Q?Bfqy+pOPQt5HxGLhW6zUDacXHeaINSqInJqyey57ggygx9JzbrghRTKJThpD?=
 =?us-ascii?Q?C9kvpMYYj0U8G8cdZIkNobB6vrep3noRddrPvkiEXpo2gQdzan6pflK2Y096?=
 =?us-ascii?Q?Pj9lstkzE4KPicgvEHRG42pi5agdSU5wOcROELPNs12m6t8Oc2YP1WA/WbWA?=
 =?us-ascii?Q?Le3IPQHkhR4qfpimgfnekDt5Zt8j7icFSYku4A7NNPfrMAU6IgironBiBlqp?=
 =?us-ascii?Q?x/n51J4zXRlYI7ORY/cZQqRlBXgkeWUwa5sXxsyH+ktO3iHuB+tmebbmW9G8?=
 =?us-ascii?Q?isJdoYUC/ji9E5ZA7xKO4kKChT++GaWoWIxQq+P5M1AHlD3TQQIaGkNhMKCC?=
 =?us-ascii?Q?R6cgGQoHo/sdLcEhaspKpq8JVOPcNLPSY9EZpUa10Wsk4OhHJ/lc9vQ4FdWm?=
 =?us-ascii?Q?loB6BXHSE0Z8mp6tF/mvxMStjbYpc9EHNBrI8No3K6kYRaAW9zbgybhLGUaH?=
 =?us-ascii?Q?g0HsrMqlKB6xCx3miRD1qZ2OxJ0QpxK6N8amxZVc9VuD6uQ7pZvmZFzW2ZDO?=
 =?us-ascii?Q?uFJ0qG5cx1d8Nzj/5GX8+T33/5tfRiBa3uB5NAvZwPI3i/eWxB96Gi7muu4B?=
 =?us-ascii?Q?QQhUvr6E0wjAdgK+gDtm/KKpXBMaOZ+YW62vY7ZMVqx0s8TenRcKUkiuAJYy?=
 =?us-ascii?Q?sGUiN2FVkZ8pPUFngQgQuvfzrOu9wx1CCgltYuLYphGkCYgDPq/hOsXe8ZVX?=
 =?us-ascii?Q?RVP6qhhtHGlAOscXYynBXdqO0X6n+vVxeyWjxvgXe0OC/vIkTKzWcUeMfQ0I?=
 =?us-ascii?Q?LAKoNg+pnLgLdrSubudX3EOrEuI+Wr0ZMJTmrTmaVwuYY48IKBpa0zsgEPP8?=
 =?us-ascii?Q?qnPWX7eoVqRTcJ85IXFA16fylRqxnn0ZZBEDDEqYryJcPuFPAensfBkQEgqX?=
 =?us-ascii?Q?3jLr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc86d2c-564f-432f-3dc0-08d892e32a58
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:46:04.0056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeFy7Wfw6OQ+xZ33zZMnLkv92IS06nnd/PzrcarLCBqisK2rWG18sj2oYjCvUXfOR8NZ25jlhnOCLE+SZYCcuLJs5zUVtGr6gI9qx007V0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990
Received-SPF: pass client-ip=40.107.20.103;
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

We don't have bdrv_replace_child(), so it's time for
bdrv_replace_child_safe() to take its place.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 1fde22e4f4..20b1cf59f7 100644
--- a/block.c
+++ b/block.c
@@ -2183,11 +2183,11 @@ static TransactionActionDrv bdrv_replace_child_drv = {
 };
 
 /*
- * bdrv_replace_child_safe
+ * bdrv_replace_child
  *
  * Note: real unref of old_bs is done only on commit.
  */
-static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
+static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
                                     GSList **tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
@@ -3040,7 +3040,7 @@ static int bdrv_set_backing_noperm(BlockDriverState *bs,
     }
 
     if (bs->backing && backing_bs) {
-        bdrv_replace_child_safe(bs->backing, backing_bs, tran);
+        bdrv_replace_child(bs->backing, backing_bs, tran);
     } else if (bs->backing && !backing_bs) {
         bdrv_remove_backing(bs, tran);
     } else if (backing_bs) {
@@ -4679,7 +4679,7 @@ static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran)
     }
 
     if (bs->backing->bs) {
-        bdrv_replace_child_safe(bs->backing, NULL, tran);
+        bdrv_replace_child(bs->backing, NULL, tran);
     }
 
     tran_prepend(tran, &bdrv_remove_backing_drv, bs->backing);
@@ -4708,7 +4708,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-        bdrv_replace_child_safe(c, to, tran);
+        bdrv_replace_child(c, to, tran);
     }
 
     return 0;
-- 
2.21.3


