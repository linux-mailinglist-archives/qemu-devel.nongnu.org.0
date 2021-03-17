Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5A333F3BC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:55:27 +0100 (CET)
Received: from localhost ([::1]:55918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXa2-0008N3-1D
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI3-0004ra-9G; Wed, 17 Mar 2021 10:36:51 -0400
Received: from mail-eopbgr10137.outbound.protection.outlook.com
 ([40.107.1.137]:61154 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHw-0006nM-8N; Wed, 17 Mar 2021 10:36:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNVnpoCoNm7vPZYIYgW+VVgWVnYruT0L2V4z7YmiVOYcITjUu4KLFv0PGLAPRtI8fr5eKMsgZjbNuv3Gope2ju0Z3Tw7gLXph7BrdzlKdi1ZuNjc7UE6csjyQ5R/FlYFtf38QI/8MlLscausKu4coZGdB7axf3UCgwvFHaWDgQBXex6KlMTQjkGHOQwDefi5Ql/fhKGQYve0CvdQx34txGhmcnD9ofBQXXh/FZQCpOIhItfIMD4+8XjpnANdrUB4zMLBfRY6p+j2Hp5IUpjYAzvrJ8xZ7AELBpYPl+UyO8tK/ueARlHGB8EK4IzEkxUPn9XOoiToqVTp02hxxvuFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5XINqXI0m8IfRRoWav02IEV/fJDZufvrklOwknbNDU=;
 b=kxP8faNO66UUCp0OskMkJPoIJILjLrzlCod2JyfMK1ZipaxuXIJR+Bnxib3ZIeqtTzbx5coSJ5OzERaXbLC77pa4suZFBkX8H3s7/Rs7UtUb+ro93I4EG/Oz718lSAftVmgNFicCmlmvfh5FHuN0PlYzE+5fwx5YKm6U6oK3k8/HsxDtFtQURLPVXeN5MEy1FfEjV/O3hxlFts9aQzTHzmCROZL6pjBQJSfHLuRDQNv+9zfgNtCcqcuxT8eVXYzyLFssDXJnsoxmYIbEtGYbGGcKsiJmwjSwlw6Xa2477qINoS0Fz6rpVHZ4WUAFHhYnqLsULoRyCJxtoEM4f9d0+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5XINqXI0m8IfRRoWav02IEV/fJDZufvrklOwknbNDU=;
 b=nX6RdGWX1m/fXC8Ckw4LUiylwccuTbxYuyNH2ruIowRcigsONI8THMQ2Ibt5/yfKiO/FnubWp54a5KyqrzWy4IvCDQk6OqI8Ncet1ftt0qXG89SOZgfHaFIr/M9A9mSVLXOJ4MoKNWX96Wp7wuLLUJ5CPxV1MpCGhwLl2qpGxuk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 14/36] block: add bdrv_drv_set_perm transaction action
Date: Wed, 17 Mar 2021 17:35:07 +0300
Message-Id: <20210317143529.615584-15-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53421a98-1ed7-498b-c45e-08d8e95209aa
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16507CE081077BFCDC319974C16A9@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZKd47m5Lz/3f1mCfsKZhuXLSIfj4+udtH9hmKsroOQtul/aYODGL9N2vg1f8CyqPyQf6rp99iyetzVKM0Z2BcR5ez1YuVz0chdkuJt1TmImpab4GNWSBQ2mxqFzuQ5EGps42ofgIldjyk8LPRZcw6N/eT+/iStnvaxfrgOvWA4a9rChsaLlumZKUM3O/PAUFgMwoDNou5rTWNIDj5lXqKOIqvQIm32QRct/P40LXpIorXBe64gyh0IEGLcyijd9zeGLM2wTN1qzRa0FX0C9/hIU/Z0xPQj+5u/qo0ZyLKrgF8FhPRsba35gpSqXabh+SNHIBIFIGfKT/HfJqoRwzmX8hS0sZBaaMQF5nx3DAF0Q8Yiz06644cV4d8imtaBjMd2D5CUbC9Fcjp04k+xGXrOH+VSChflHpJSI88GWCW8lhvtHKIjYehVAPhk00CWNQ0nDcfLOd0l+YG5cDY+XCfsDEjqc+WT0kaYelp7cpbEV2qqjyBPIOIRVPcPXRK5XfliNDaIaLtwZ5oM+95IS140ETFT264JhmQW5nEouGD5DQYolCe6W4SpYOnAUChjlOuV+c7zEOICYY2Y6BdAB4t6bAzQvDEtx42e7FjmhaoYfce6/IKkar0AhqQ5FOuBPx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(376002)(136003)(366004)(316002)(1076003)(956004)(6916009)(6506007)(69590400012)(66556008)(66476007)(6512007)(26005)(4326008)(5660300002)(83380400001)(8676002)(52116002)(2616005)(66946007)(6486002)(6666004)(186003)(36756003)(16526019)(2906002)(86362001)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KRyEOteaS9f6sUwh8+ZXmbCo6/iTwbWKM6/ZYjAnaXNGqtzMri8Snuyml8CC?=
 =?us-ascii?Q?PFAWfk/+Pum9+reddsQ1NFQ1t2VH+l28RIswi8dXuDtOqPuJOmR+QBXggqlj?=
 =?us-ascii?Q?oPDhiejcX0/Jzpr1IxCcu1+0Hc5pkbenhgT55oVywarG4mxY2dUgJwWhPtci?=
 =?us-ascii?Q?NgNTOG3As47Vpipy5Lh+M9ASL3lByJiL3wrX/5ivAeDzW0foqKNIPeQSTLV1?=
 =?us-ascii?Q?eW+9js0OMBVG7J3dr+O/Hkx1IWqY5lmXmvPtX7NqzqcmQxiy4xPhCGRUawXL?=
 =?us-ascii?Q?HTCP3CaO6MYEw8RqPIST+fiFPEfbutKV+Nv8WGteaq2PuBcLyIiGGjaQkAA5?=
 =?us-ascii?Q?OzzIR5JRa0N/PYo2S3VgpGDDqx3JOwm8uYIvX4IzliOlA8Pt/PWq6M75JqFt?=
 =?us-ascii?Q?t361mhmWNHefQWfY27hl0i2Cybr661ecoczUcFMmxPqqt/pZRGLaZovGxJUv?=
 =?us-ascii?Q?3b2gwp2s1qm+JVLtVb5FptQq4LzHtQSjCCT8EPoRi28HptXjkYybFjWehQFY?=
 =?us-ascii?Q?gUvvykRZMECz/tlicJG0kFtSPBVPd+3WNiyXjPtLV4Rl4yb8mNSyOkuE+moH?=
 =?us-ascii?Q?v0plVrWufnc/Zo59djtA4CEVyrRMQsRBte1DF8ilC2v/dXsYFYOC3Tmbydyt?=
 =?us-ascii?Q?sCS86N8X7KWnoD089A8T93W1Z9q9pPO/p+eVHm+pVVKeqDpmUU6YGQaMK4ND?=
 =?us-ascii?Q?gAghZsOEznt30iKwj2GqJi30KG9pUbGfzc66JF4AITZpVjd2rvy2V8IcjI4b?=
 =?us-ascii?Q?NfUB6LF6jPoVurYHtOUIahoLghPH4vTogwNLByBy+Mw1BSAhsjESSzUo8iL3?=
 =?us-ascii?Q?TjubNiauBpJA5uLUnWeRV7GIbqs65TXRYDfxICSH0DqSKWMJZPPmVTSz5fnj?=
 =?us-ascii?Q?BlGs16ysby8bEVxJGKCwB6S6aeMIhSxsUgp8nH2/L6Cmb5VgE/sCVve5vjHP?=
 =?us-ascii?Q?i5r7uZ1C5VmIjoj2YLCOJ8y0xueffbt9aHJpzM7Vl8K8Z/qDKK9g73i9AYui?=
 =?us-ascii?Q?x9Zn/3TJQgCIFBBllp5j86i86YXkDEvWQdCgseaUWiP5ixq+wdZbc4OFKAxy?=
 =?us-ascii?Q?vsabAVq3wHuQuOz1Zc54qxcexHCtoqVJZjhZVwpFhuDLLlHuxAPWfch9wdkJ?=
 =?us-ascii?Q?Y7lpk1eEqC/7jyWUQfTNetOoXphPjbjX4f+BsgfY/yZyljQ2gDOtWLuglQFq?=
 =?us-ascii?Q?59H0TbfGOmYjAXDhFW/D51BcHB08XtcSjn9hN4GedeOc2ceIvi8JoTSMs8Mj?=
 =?us-ascii?Q?5/bq8bTlgOCiHoVfIIkpcYZn/PNjprXlICN9xTpFIXkRstBvpKYBQwJ808Z+?=
 =?us-ascii?Q?/QN9rsy6XaBu7fbWJfr3zR5M?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53421a98-1ed7-498b-c45e-08d8e95209aa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:23.4917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjzktO6d1VOGVJlg+7zklZvEpPT7LcLwt3NNZ6JekxOJk7Z0uXpPmHM1CxqdZk58tcnNwJI4NAmPNapbToaVTjM6voVPra3iPZxCIT5A09Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.1.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

Refactor calling driver callbacks to a separate transaction action to
be used later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 70 ++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 16 deletions(-)

diff --git a/block.c b/block.c
index 14363dc550..337b515034 100644
--- a/block.c
+++ b/block.c
@@ -2155,6 +2155,54 @@ static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
     }
 }
 
+static void bdrv_drv_set_perm_commit(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+    uint64_t cumulative_perms, cumulative_shared_perms;
+
+    if (bs->drv->bdrv_set_perm) {
+        bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                                 &cumulative_shared_perms);
+        bs->drv->bdrv_set_perm(bs, cumulative_perms, cumulative_shared_perms);
+    }
+}
+
+static void bdrv_drv_set_perm_abort(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    if (bs->drv->bdrv_abort_perm_update) {
+        bs->drv->bdrv_abort_perm_update(bs);
+    }
+}
+
+TransactionActionDrv bdrv_drv_set_perm_drv = {
+    .abort = bdrv_drv_set_perm_abort,
+    .commit = bdrv_drv_set_perm_commit,
+};
+
+static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
+                             uint64_t shared_perm, Transaction *tran,
+                             Error **errp)
+{
+    if (!bs->drv) {
+        return 0;
+    }
+
+    if (bs->drv->bdrv_check_perm) {
+        int ret = bs->drv->bdrv_check_perm(bs, perm, shared_perm, errp);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    if (tran) {
+        tran_add(tran, &bdrv_drv_set_perm_drv, bs);
+    }
+
+    return 0;
+}
+
 /*
  * Check whether permissions on this node can be changed in a way that
  * @cumulative_perms and @cumulative_shared_perms are the new cumulative
@@ -2215,12 +2263,10 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         return 0;
     }
 
-    if (drv->bdrv_check_perm) {
-        ret = drv->bdrv_check_perm(bs, cumulative_perms,
-                                   cumulative_shared_perms, errp);
-        if (ret < 0) {
-            return ret;
-        }
+    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, NULL,
+                            errp);
+    if (ret < 0) {
+        return ret;
     }
 
     /* Drivers that never have children can omit .bdrv_child_perm() */
@@ -2288,9 +2334,7 @@ static void bdrv_node_abort_perm_update(BlockDriverState *bs)
         return;
     }
 
-    if (drv->bdrv_abort_perm_update) {
-        drv->bdrv_abort_perm_update(bs);
-    }
+    bdrv_drv_set_perm_abort(bs);
 
     QLIST_FOREACH(c, &bs->children, next) {
         bdrv_child_set_perm_abort(c);
@@ -2308,7 +2352,6 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
 
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
-    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
 
@@ -2316,12 +2359,7 @@ static void bdrv_node_set_perm(BlockDriverState *bs)
         return;
     }
 
-    bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
-
-    /* Update this node */
-    if (drv->bdrv_set_perm) {
-        drv->bdrv_set_perm(bs, cumulative_perms, cumulative_shared_perms);
-    }
+    bdrv_drv_set_perm_commit(bs);
 
     /* Drivers that never have children can omit .bdrv_child_perm() */
     if (!drv->bdrv_child_perm) {
-- 
2.29.2


