Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E312C687C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:11:33 +0100 (CET)
Received: from localhost ([::1]:55836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifPI-00071s-4p
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1C-0001Mn-TU; Fri, 27 Nov 2020 09:46:38 -0500
Received: from mail-eopbgr60102.outbound.protection.outlook.com
 ([40.107.6.102]:38277 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1B-0003GS-3O; Fri, 27 Nov 2020 09:46:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3ucvFxpXt4OzW1ovEK2U4NSPruVEHoI+jFoLL7dPp+cUnTam8x2u1c8S9ASuZaAnyi2B/yC044sQR27sYhpOLBTmZ0nwvixXxhBZxvLyslj9ZjQXb7/gwt1hIYpU0qgxM4IPYsuhMWQA9aaCz3dPNV1lxEAyMUmdGLwGXIcC71OtQeyPbzVobDdHzznZfQYb7kiNyHQBFBG9uV4BzhC6294Joos2uEpksJ4OYc8mSoY32kk0cgyQcpMvXKHQJzriGguIAF4Ks/ynpx1Df8WpilrT2LCWyU7j1GhsqDXFcnojQLwEfEunzXKiiHHwo20Wo8+VAfwPyP6OiDdOu27sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wfp+z6AnITN1J6/qdtxxEdYSQyioquExT3C4KlKuSd0=;
 b=JbAh9qBn1ngZL2WnvV/1HXYcRA35hViuAO3i/xj/x8oEtks+HK0y22e5F0dXBI6mJyH7MLm3D69XzsLZWsxl3ByacJWNK6HiTJtkuFUrOsUQt3R48/JE1wh9+4Las/Z+yavxuVKyz3plZZdUSIrQMRx/0grJEZRlvepLPXsYOsDycReelMigQA443Pa03puMGjBYrOaZPgZN0Gj0CK9cQzW/FBSdG5uugHHRhzNrAQukgAuojQaFWp0sewEzMUgl4MjhWtng3GkQtRmFcAzMSIE3plwhdjQyxkcnmyMV8odojlhjbpAk5MrWPuFpwkHd0JUf9KllfGdfuq+08fJhvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wfp+z6AnITN1J6/qdtxxEdYSQyioquExT3C4KlKuSd0=;
 b=wIyTZCXeLZ5A0KEhevzNZv62XA4j8woyR/fGyCCIaeyG/Dy1wAcqwAYQU7A+Ynr6qXlu91i1IEK6ielFVxQLaWy4tG8kDWH5ic+MxWY00kVyzlYKI0+SYq4zcpuQAYNpSIJtpwsS0D5EvboQk1zJ782iudtfa8pV5WGsQa+ZkLg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 24/36] block: add bdrv_remove_backing transaction action
Date: Fri, 27 Nov 2020 17:45:10 +0300
Message-Id: <20201127144522.29991-25-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aef80d8e-cd88-4ee5-cff4-08d892e32535
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5078F6495AB22DE576B792B4C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:81;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sobKziAFOvRgbFm00KATuQ3izMPJkbIJbMzExgA4fOl0y6U/+eifTkIsbrcXxwOzM+pmlUFY12sR3DNkBDis9bB4z/+TTBQ86vKHcNW6Hx3jKYyGg6HTQDgHv7HKAyCP7UhI45I3uFmZMznPPHaV2G3kB1b53kbefgRDXzY6kJFr02SS/GSRRAy7Qh8eac9/qhOSUvJfqapcFgo2o8TmIuDL9mqtn2WEEF0cJKry1BdkNwRzGZxbVfQPWJMfP/kHm4MAylty6jJQc0vsNrpNtrMtk0vrbd4zpwgfEx5At932gzFnWN05H0Q/GEtkwQbpKSttdDGe1+3V9vPkYR963HUJKjlwcInTMc+aT9BYOL4GeLZiyS32LyKr92HpZshT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jTzY3TL+c7nJUo8rvawic0YZLupQo9yMwkPixSqMJWfd3oOTPHx5hCtB+2Yp?=
 =?us-ascii?Q?OVEG3eFbPNJl6+HVQdic6U2u6V3WcD1dGsWt6/pe2/eS4e0LWnyz0eITeSAv?=
 =?us-ascii?Q?TaEZWyw1xlHY/AI5qfqxNMRUq7ven+j6xLqElV+/zsB4ORp5ZD/UcVb1tT66?=
 =?us-ascii?Q?jQXSRa8P374IxFCEd2I1SNTIVEw3ZuwZ63y0k1OH+B4Ooahhc6xfZ85mWz4g?=
 =?us-ascii?Q?n0TnP/AelC6Cswfn83TPZVXsD0mpLfuIpkISd3UEFN3SRX0eNiatINbEGfoC?=
 =?us-ascii?Q?d0IBwMndDywDkxWRb+P4ib4PnJxaazf1OtEGcc1paMfhlEJe6b/aljPqBSfi?=
 =?us-ascii?Q?uGVfBDIMSnNWOLPxhGpBJNEMHzVSvBQofOC9edBNP0xpD0G3SL4ER8EgMX2B?=
 =?us-ascii?Q?zbWDC2rElpqC/35vdh2QKAucyTGHtP7EhKHK6oKAuLEKi/6cYKuRTX5OLbvJ?=
 =?us-ascii?Q?zwe2p5LEkPMxHb16gD++35JQkjO6XaG9CvfohvGBcB2JlIyCihIE7RzSFbUP?=
 =?us-ascii?Q?FapJbSN3/N4+/6He76P5spWOViK+n2bzK+Z4s93/CFv2F+kj6QJ24SnfHhmd?=
 =?us-ascii?Q?63BdlVwfqmSAvyk7YvV3XGXXAU9FrYs81+v0ExC/Zan6rVrYrhCxKAtMefoX?=
 =?us-ascii?Q?e1QyvjLqaUAPqg006w5jsBZKnDY79nDD3UYJ/4mPggTB12dnw1tzZ40a98Pq?=
 =?us-ascii?Q?FraVbsFbB5johc8u+fspSgCeHD8JhVQDwZiKVe7ZnbXAq9mxYKSX4u9AGzYb?=
 =?us-ascii?Q?tSlN9MRW8jJ5r/YN0BeH0PckTXzjYMqT4HWR0Ad/iJhb/t8HEMobOdbg9Izp?=
 =?us-ascii?Q?W1Zuo4kdeXd+rBhr1Jqy/9cu7mjyjMJgl7zBsHQisc1cdqjqMqeUXh85bA8K?=
 =?us-ascii?Q?k31Hp/h+TUHc0dB9/VrLOo7bL/ZSn0xbKxOA9kcGSUWotPbUDl/x5YjO5Wna?=
 =?us-ascii?Q?uyJ08mxYhLrNMH1iEZiATBMF6PTIqiHkXXhcqU7siAK4wO9mVd3e02hUZvk6?=
 =?us-ascii?Q?m8+G?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef80d8e-cd88-4ee5-cff4-08d892e32535
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:55.4093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0QYl6VOCCSPmKI6eSA4ds36QyFXFx67kbQUlq/ivJsRyz6wsnvVSsZKgW+fxt6PPN7bqqLbbHa/NuSGNr5jEScCJrz93WCyltlALXGrvWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.6.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 7094922509..b1394b721c 100644
--- a/block.c
+++ b/block.c
@@ -2973,12 +2973,19 @@ out:
     return child;
 }
 
+static void bdrv_child_free(void *opaque)
+{
+    BdrvChild *c = opaque;
+
+    g_free(c->name);
+    g_free(c);
+}
+
 static void bdrv_remove_empty_child(BdrvChild *child)
 {
     assert(!child->bs);
     QLIST_SAFE_REMOVE(child, next);
-    g_free(child->name);
-    g_free(child);
+    bdrv_child_free(child);
 }
 
 typedef struct BdrvAttachChildCommonState {
@@ -4897,6 +4904,37 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
+/* this doesn't restore original child bs, only the child itself */
+static void bdrv_remove_backing_abort(void *opaque)
+{
+    BdrvChild *c = opaque;
+    BlockDriverState *parent_bs = c->opaque;
+
+    QLIST_INSERT_HEAD(&parent_bs->children, c, next);
+    parent_bs->backing = c;
+}
+
+static TransactionActionDrv bdrv_remove_backing_drv = {
+    .abort = bdrv_remove_backing_abort,
+    .commit = bdrv_child_free,
+};
+
+__attribute__((unused))
+static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran)
+{
+    if (!bs->backing) {
+        return;
+    }
+
+    if (bs->backing->bs) {
+        bdrv_replace_child_safe(bs->backing, NULL, tran);
+    }
+
+    tran_prepend(tran, &bdrv_remove_backing_drv, bs->backing);
+    QLIST_SAFE_REMOVE(bs->backing, next);
+    bs->backing = NULL;
+}
+
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, GSList **tran, Error **errp)
-- 
2.21.3


