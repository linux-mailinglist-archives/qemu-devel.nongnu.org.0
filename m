Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07514113FC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 14:06:50 +0200 (CEST)
Received: from localhost ([::1]:33022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSI4P-00026A-Od
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 08:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHuE-0007jP-LA; Mon, 20 Sep 2021 07:56:18 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:7297 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHu9-0005GK-AL; Mon, 20 Sep 2021 07:56:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/QhwBhmF+jR8y2SlHX7HLvTveMrAWRkfh3520czTn55UuzrGYHNevjpSJjMWhHamXBVaawg/IEuewaDStWUXStZWXAfOJP8w9HcCdo5Y6CALWyPcoXjL9lJOUgvUabJ0YPJ7RCdWUHOwau0uL1S8k1SEgQiXpx5xpf8FA+838r85Z2DW0te9o/vm9dCQvdF3X5IDr5LyP3fkH8OW5fbYEBUecNaCtyFEX5cdxO8gc7+SQL3zMP/HJEbO8TXRgRSCSHzz8YsCdBYpnzD79VE55wCUBAUojM03WhLnh/N11EtCafjq/TDnT220kPNnmwjJMxkpoMO+4MH4eFYwMbmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Opi7CqaIDbgxGWTirAD7huBVH9yT68sPOI7/5/1eeDQ=;
 b=QohnS20MeivtwgzMKt727jVHvFOTXoOwO2yjtsdWXSOpE+rziuyNnS9cID6V0V60P63OUlOZcdlMN6nV/3Mh0Ef+Tk63IE+mT9iqNHiTLGTwtTCWOdun0pZB+q9epuDTykRIFbWBMnLHLMV01dK2bdmuBKXTWAv4qLKcIlS7dngFIiQHqZ/JD1VBeeB3VVfGQNvJc9MOpNrsbU6x4afpTwRoLQvSLeiYMT0Fk0ljN3H60/TF0Z4HiE1wrZpfszntTzGNSDsaQXumzc4RnxiljcuYFPa9ITh5umTzEltEkwu5wCaswLItCEBCGH+IO7ZelRVQ8wXTIaX62vol+UynTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Opi7CqaIDbgxGWTirAD7huBVH9yT68sPOI7/5/1eeDQ=;
 b=IFzIU9+APi9vkyEO7lJ99attucc90WLT0lpsXqFucYmDeqKCIJ5+GMyCQSISY4HO4yYcwTSoJ9caac1D7k03T5Zkg2hMOiXnoVyfxssFLpXiQcRzqpwYF7WrV9DPYG+9ZOpK/1OKXMgBIpvujOEezZoeM+Xpu/bOvMZ9m7tEtoc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 11:55:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 11:55:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 4/5] block: bdrv_insert_node(): don't use bdrv_open()
Date: Mon, 20 Sep 2021 14:55:37 +0300
Message-Id: <20210920115538.264372-5-vsementsov@virtuozzo.com>
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
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 11:55:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 374c63a2-5a49-4b06-f572-08d97c2d9c9e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB66311CADA9CC7FC0455CC400C1A09@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KUSG8/30UtMAzkvbCwCHh6jpNekz2gH7Dj05iMQUVLS5hTfBgkOGqn2o4oGU/JM9Gjve9xCKUqSxZfZvFTbMTiub3/V98Eetuh9bcIK7E8MW5zzHaE9CdeR75OCWRMKqS2/CbTs1SwEMMCCgvDWtUGiYf9BzUTD+PQdD4ccpcqVdMERGea+q1htk8jXy9GVplhwos7vCjL0rojC6v54fkBBf7iNE0OXHmEqxih/yXIM3M3O9k5gFwB9uGrNmY97rxBUVic6E4OHUCvCR5uneer+Qrxft8lXUPnmRSZNZ9B1TV1gw/FeKpnKqihAzdqWk/iQ2y3/IvcdeohPfwkiHDa3+hAjf71qsKR95Zt0V9Xh5VkfNxN5iyvMvQaWJ4TnzGginUh+jQ0qiuYKskelm7DVtYwHHi4VQK//jeHlluPhlinoEhBir1yPKrsgIV9w5aOG1h2/fMI43xzpA7uOSBnaOR8PDIfaE28bJ4BAFNE9LEkUYRCJWT5A/qrEh1FHtTwe+CZRJ6/e+5+mSvigd1kArY4VXh/O/jlExldsFyUp4FHOQFFmqI5olXDSL7AWPcrg22ZzDychkA+QnCCev6Na7+PpdUR0SxUgqkpoHX047eyKDSD6nkY59Q0lMDLlrvogWLQYafmUDKtnEcJT0W4pD3yOD9ZQr2Iv+kOJ2PUpdGoak0Q7qFwu3FNu978+5gK4whNq2aFqO8DpZkM/zg5Vvvy/kwOxuHuyPWu+bIG3fAg9uvXoxTOPKhunKu1caCJzFJLwNU43UK8V2bDtUysmZ8npa8yYN+LKHOpzr0jg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(346002)(366004)(2616005)(956004)(66476007)(478600001)(66946007)(4326008)(83380400001)(66556008)(36756003)(107886003)(8676002)(8936002)(6506007)(316002)(6666004)(5660300002)(2906002)(52116002)(1076003)(38100700002)(86362001)(186003)(966005)(38350700002)(6486002)(6916009)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7VWL+xgyx9OdNBylr0ovnD3//vLdPcfaHQvVp+pSlTKxw+WLUp2QdVA3GfQU?=
 =?us-ascii?Q?e5KX2/FLAa6/TIfABnwQC5KMK5pvFiH6QT5P0Wd3m0BkKNcEtH0DTEAHaKps?=
 =?us-ascii?Q?ghrnyOU8ylj1jwo0bkR5F6nPDFlhVgbCG8w/QhVCJcx1LxjE0acxRFq7X/LH?=
 =?us-ascii?Q?wGs7mklVZhPmxve3sRbhiozqQQpDQ9bhFH8y0tPybWR1cvXoGjf7X0Et36Xb?=
 =?us-ascii?Q?q+7N0Qiou6cjYFgpeUSx8EcX6mzbTSrO8UrLC7kbQsgAhNA+QSt/NbPso1Wx?=
 =?us-ascii?Q?WDsYJbY8AvpeAty5whQ2EQr/DxLYekP205fUZHMc1yVy+dZhz5g2aVT9mrCF?=
 =?us-ascii?Q?N16ic99AAPleG5bctDd6JvvxSteR6Mk5wkQbCase5uTCrcptNjTXMnS/1aSK?=
 =?us-ascii?Q?INiCS8axJSfgzYDKt9nipN/rfgbPwY5Va+3tK830t8dW28tOCFEOGMdM5OUw?=
 =?us-ascii?Q?sZAAkd5Qj6VVxy9SDgc3gumispnMli7UuiqVQhJehvs6o8Hfbz6d2OkU6s9a?=
 =?us-ascii?Q?zIXIYD4dWQd8lKsZBHl7us3MlIqI27i4vVxBpEYMMIpm6tTgL4lM19u/ttDO?=
 =?us-ascii?Q?2X0YMNSlw8ZZmDFFh98X3UTmwfdhAbB5VlvWXZnstIiarhzBKag0yggKpdeg?=
 =?us-ascii?Q?L0ubsicNlN7byM9GS3dZ2EkMFeeqZYGlxJARpMCMPs7C6XKwaxNLINET6nX8?=
 =?us-ascii?Q?erf6ceQDq6VUA3BcRxwlvjAcy2m1Z93zMb+gh4zzfw+MIg9a50fV7uTRUOqh?=
 =?us-ascii?Q?d2JjhebwvwCY2zJpqxq0Ho7EcqzKqyGjpJuJ3No7tIHaFNRTt/4RUmUXY+rb?=
 =?us-ascii?Q?pRi41QTmZJiDera0tevRzPrI7fiEhWAD2Y0IoXZ3MymZRh3q7Zs725tCgeNC?=
 =?us-ascii?Q?XHxQYKBEkKD40Q2ZzxoDBeieDKK9l2YmrpCqDVCAXdTFSsVamZ6yahqLXp8V?=
 =?us-ascii?Q?t52c1EIIm3bygFG7ahdt/DycZWgHBeyatFGwD/oFmX+Q3uqWE+9nFznSlxbq?=
 =?us-ascii?Q?gM69/75XItCzk3P+uBgzRaAQ20J96jKU50+oxG8o+S3iTgwnakeKGsj5FRvp?=
 =?us-ascii?Q?6BJzNv4ATJ47tbVj5bXxy0Sua+pw1ELXB0hVm9W0Zb18KTA2ggdvdWvNOS1X?=
 =?us-ascii?Q?NajNRQTX3FYsOUt4YyI+5Sv/n1k1eP++EePWda+xv/D3BYOCeqkalmt4GfBY?=
 =?us-ascii?Q?YHXgcX99ivMzPlxUkgaoaOz8ZySerzK2VJVFnpHttqoc8aR4b3enbjY2diJJ?=
 =?us-ascii?Q?Y+Gn7AKLlS0qkZ8gTbT3SNo3bLo0ATKPrD9yO8ijgbFB2Jh6l8SKCpJ3u7Vo?=
 =?us-ascii?Q?pNVPdlwMBPoWg64K1G1YRFIp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374c63a2-5a49-4b06-f572-08d97c2d9c9e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 11:55:59.4254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cpffOfKT+8/Zm76+B1YrUCRRsAtT97YJo9oUhPKeUA0pJG13Zw6tr0XGsNSHg3oYJl4WfGBpYrRT/lbpV3Br7RyaW6GLXrRKxWfeAZgDD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.22.122;
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

Use bdrv_new_open_driver_opts() instead of complicated bdrv_open().

Among other extra things bdrv_open() also check for white-listed
formats, which we don't want for internal node creation: currently
backup doesn't work when copy-before-write filter is not white-listed.
As well block-stream doesn't work when copy-on-read is not
white-listed.

Fixes: 751cec7a261adaf1145dc7adf6de7c9c084e5a0b
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2004812
Reported-by: Yanan Fu
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 3a90407b83..a174801785 100644
--- a/block.c
+++ b/block.c
@@ -5134,11 +5134,29 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
     ERRP_GUARD();
     int ret;
     BlockDriverState *new_node_bs;
+    const char *drvname, *node_name;
+    BlockDriver *drv;
+
+    drvname = qdict_get_try_str(options, "driver");
+    if (!drvname) {
+        error_setg(errp, "driver is not specified");
+        goto fail;
+    }
+
+    drv = bdrv_find_format(drvname);
+    if (!drv) {
+        error_setg(errp, "Unknown driver: '%s'", drvname);
+        goto fail;
+    }
 
-    new_node_bs = bdrv_open(NULL, NULL, options, flags, errp);
-    if (new_node_bs == NULL) {
+    node_name = qdict_get_try_str(options, "node-name");
+
+    new_node_bs = bdrv_new_open_driver_opts(drv, node_name, options, flags,
+                                            errp);
+    options = NULL; /* bdrv_new_open_driver() eats options */
+    if (!new_node_bs) {
         error_prepend(errp, "Could not create node: ");
-        return NULL;
+        goto fail;
     }
 
     bdrv_drained_begin(bs);
@@ -5147,11 +5165,15 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
 
     if (ret < 0) {
         error_prepend(errp, "Could not replace node: ");
-        bdrv_unref(new_node_bs);
-        return NULL;
+        goto fail;
     }
 
     return new_node_bs;
+
+fail:
+    qobject_unref(options);
+    bdrv_unref(new_node_bs);
+    return NULL;
 }
 
 /*
-- 
2.29.2


