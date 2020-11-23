Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317C22C1583
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:20:00 +0100 (CET)
Received: from localhost ([::1]:58152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIJb-0000Zy-43
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICy-00047w-T2; Mon, 23 Nov 2020 15:13:08 -0500
Received: from mail-am6eur05on2106.outbound.protection.outlook.com
 ([40.107.22.106]:21121 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICx-0007NS-8q; Mon, 23 Nov 2020 15:13:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ka96NW2vt0GFYkgxEIyKeTuKaNFNKjx6qSsJhJEe12jyo6/MoJejKHlgSs1JLL06SJwt6wys6opDusKTp4Tqu/8ScilVt0hGRyODecNuCrz3WNpVnjRanO1MVNZeIa3nY27ELOdsTLcRrYVSw2t/hmiydmiBXSTSyC+CRFrg4+9mfyqY8OVi4mP+j0oIH3FkfwCad1PIXYO+8tztp+f7tAdWLV2dGY184Sx9uMvwcPWubn3oHhIl0LG4bvAwnCureEGxNwfAk9wOvKL6gVl/vo1a1QX9XPYGK3UfO+BGaIeJC3lFoDJgptG6BDBAkkeCleeB9mdOFVrTc8uVXSKefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgNMRIdVZo0C7muMANm8EVXSSryH6Ha4YtaaP7/967Q=;
 b=SCs56DxJGPqTtCegXtJ9CcNezQCLhMN0c/qeoBsH0k6G8yxQFx4Ut3dr1mwxWf+9h1A/xs+p2bNZd9WHSXScZ8lrgmDH8kNvs/cao6AhtLgwg9X46FFVeu8lqRcPYjl2mZeVmg8aBt1FjEx7gRVpSFyTyVYZYQa5G+DJYA0iVRqOzJ/fXaB+2zW20gyxlTE86TyewnPMf7oWTKShWdilT2XPB0i73X6Sdrx/2/zYqWVLT2dJoYbDCbgUy05VqXPM/6UgIV9ur9j+CJIsiR7zHqmAXKy5MdJJe4w+xvTtZA/GNtihlHu8navpSoH/LytsZ93Go4oC2u73E1BCMlT6wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgNMRIdVZo0C7muMANm8EVXSSryH6Ha4YtaaP7/967Q=;
 b=DJwVTZQATg7AJ146czVlL6tYUQPX8vFAFMIGoWjdQVlHwR0asgWsWssVjLDG0A7dMxqqUYOaqKD3O5rRFBNu2hOzZr9bfpiGuCsRuD/yJCmNd14bDgUj+iHl2qaiv0n40OKhYZwxywmfnLflQ5YGJncZVjvY2lnrPtGr5cJwfk8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:12:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:12:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 06/21] block: rewrite bdrv_child_try_set_perm() using
 bdrv_refresh_perms()
Date: Mon, 23 Nov 2020 23:12:18 +0300
Message-Id: <20201123201233.9534-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:12:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8b533cb-6344-41a3-fe97-08d88fec2a81
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46907F636F7177224EC5A2B8C1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QHbXixcm+KR/0XAs6/Qhhgy+aknkWkvARdsvOp76W+VP8C6a0RjianlUu8wbeZC5tW/bfJvOT2XLxfVNZTjhT4c28taAkfBLWWd1F5qK7ZVifD06ju5XSrUy2deALEGKLz4Kp4lsnraCiG+eacRifIJFvH/4VzQZTbvIWC20c8dP2W48BlzGO3QBAEWUSdCCY9sI4X8H7/rH6vOD42Y51T3kw+WuJM6ZuRmVmoTsv417pgYrgC4/mLVixEXFNC4vKDtjRPuOA/h5nognQfQHaOZG53C5FcOQMKhHbtTHw503KcKTpDVKwi0KRT1vlMfYKd16gQBE7t0ddZzpeJlmFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: epkJTFZGzU+V/OAYE3lJ8X4ikoZaBw09bRzlzBz2YWqTaxloH1o8/vhBXR23VklVgkwgQlctzP2L/tbHJ8rRiIhXCdoHMv3Roc38j/VnbjprRjx5wMvZu8OrpPx8VWXbL3qdhZpUPBvzC3A9PsDxh97j6TScY38ZAptpWqw3EC3BNQ4e0wTjTbEr5qiE/ElgmzqxbEz1lxHnmk/r/GV4td/C2sASrpGlKquHQ2sxW6yBum9CVbYfOLXV+9/RmS4bp5j3Q/VhwPVz7nS3uDEe8u4kvQxcrZKTaweFhZI0JKjzVtimFJ9SQJBR74Etz3qVWCaUsXlXPtIQ2qoE2jkfnpH5qLfYmfi0j78w3SVcidCb/j9qffyCx5zcAiwo4/unJq+3ovPSpe01HlUz6uA8z0wXJ0o2Im3/H8S9DX+BaYKXBCb8Xx3zjzPcIQtZfr4gRlUGQStGd1iMoWFWqxyF57MGE9JT/GGIKgBV9FV8BT4n6c74jL6V/W8JzngqyV1dwSmX/21t+eHLSOZldrnPD8zmhKFCMlKAt8cp56mFYSdZCLPlu0dVdjKeOiorwl8PdRV7D5NF91LeAzYUpH8vHBeBVUwp31RlPiJG1Ag8WNnz54Pl4m5yHBg1utri6i2FznkggFw5jur0Nl7raFZXsSk0XacmqCUUA2pwpqQRyQMwQuYpWlJObB/GXEJ3QDz8VG5TOFU3/dMkUuln5BX8M4V3f6Y7BtbCWgfz4aVP1wXfR/y8UrFL+s8T2p9/hQR3YaOW+jKQ30/i3Uqj5EcIJzzdl9EyPKMP87S3jAgDYn5CrbqmlHwbOlmdvj7uwGInqQRsux/nBEXU/T6MP8aQvipwCwO0qDBEYVaA+MaMHP46im9921LTXwmDrh97vWatFbvq67Fxc3vM6HoSfwUszQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b533cb-6344-41a3-fe97-08d88fec2a81
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:12:56.3182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tzk9d0hvRe9NUktvEUIubtLQUD0th5Pv3fJwbdHQif2D8XbIF08LqkiEiypcGW5IKbxHXuF7abLMlr01A7U8oGJ/+R1cFyj21DYNYu6foPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

We are going to drop recursive bdrv_child_* functions, so stop use them
in bdrv_child_try_set_perm() as a first step.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index e12acd5029..a9e4d2b57c 100644
--- a/block.c
+++ b/block.c
@@ -2372,11 +2372,16 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
                             Error **errp)
 {
     Error *local_err = NULL;
+    GSList *tran = NULL;
     int ret;
 
-    ret = bdrv_child_check_perm(c, NULL, perm, shared, NULL, &local_err);
+    bdrv_child_set_perm_safe(c, perm, shared, &tran);
+
+    ret = bdrv_refresh_perms(c->bs, &local_err);
+
+    tran_finalize(tran, ret);
+
     if (ret < 0) {
-        bdrv_child_abort_perm_update(c);
         if ((perm & ~c->perm) || (c->shared_perm & ~shared)) {
             /* tighten permissions */
             error_propagate(errp, local_err);
@@ -2390,12 +2395,9 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
             error_free(local_err);
             ret = 0;
         }
-        return ret;
     }
 
-    bdrv_child_set_perm(c);
-
-    return 0;
+    return ret;
 }
 
 int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error **errp)
-- 
2.21.3


