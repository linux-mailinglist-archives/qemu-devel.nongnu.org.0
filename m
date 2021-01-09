Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0882EFFC0
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:14:52 +0100 (CET)
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyE4x-0004JT-PM
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpf-0006Wx-TN; Sat, 09 Jan 2021 07:59:03 -0500
Received: from mail-am6eur05on2129.outbound.protection.outlook.com
 ([40.107.22.129]:46432 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpe-0003fN-48; Sat, 09 Jan 2021 07:59:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7BUpe9nJdpJ0uDN1WDjh8SE+5XIFSF0Gdg40ArnTPWAN4vosI8+oAxv90hJLChHUHeiyZpmn8fmotLsS+ZOZJ+lzgmoFHJA+NHGwKpCz9Xhd1FUu+mHgPsNc66UK2RNXsu3DGm9nOqlZ807AVZM81rafmN+aLNvRwgKOvXeNQhbrKHGLcIKxUEFVb4uNEakiopeNbffKzVFnY/IVpLRpghOBGtWS148JA+KrPcf+pBeU7R+SRVEEGuU2RZJK10Vftd9HiPppKq0MCEWnYAsMuPwDXmaeuweJbVRi6dTIx5/Fb8Qs79+F7zApuKL4xBDoMA0xDLZyNkea9pwW+nI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruW3MvB1R2DDEHV/DdJHcY9oGj/RsSlhNyxfOvw8t9s=;
 b=RGt3HwmoDqoB/XUoCIyJRUhj3KsQttDorspI3VBZflCfRvU+Xl7ohPMFbjXzTPtF/kHi5l+8PkCyOH2ZQmK5FP0Q8MIIwmmTzU0DUgSdz4XzXdp0DfE00+94F5eWryCkvQz8JXfY0JHip3lXeCcH2kTD5iOhIm1Fv852IZEdoxfiMHiWDljfYCa3VSXLMTGx+IneguslMxQI6kgEJvUqUKWzp+gTcsoP6QOCxwqwZf9oH0Hsp3QkRJOYiJCACBWqtS+Nuu3doLXkAIH45RW0iaSe7V8Er8h2Vb9zm+huKUvxZ5OERzYrYEyVC7WpGaju/X7yIbu727Mul9tZM6ixcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruW3MvB1R2DDEHV/DdJHcY9oGj/RsSlhNyxfOvw8t9s=;
 b=dboxVRGnx8I1eI8TEMlhsSYwNwvLyJHZN0xhxSrW9YbeBHPdZaGVlrHaV14LxNeTHbjBM02fh0Tx+4QgDfbzd5x93J/6LxopzDeKQ60Zj5+lgj2KdNAkYrqambas/Oao8lrou6SDcQoiAX9+Ia1QljApp8V4pNpnllclB1MCcPE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 10/14] block/qcow2-bitmap: return status from
 qcow2_store_persistent_dirty_bitmaps
Date: Sat,  9 Jan 2021 15:58:07 +0300
Message-Id: <20210109125811.209870-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109125811.209870-1-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7801ee92-7c3f-4366-4fee-08d8b49e50fc
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24187630E0C28163863C75FCC1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:246;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qfq/dYl1EqRkFj0RnX0outnHsQ83rYOVhC+bsYGgeG5bpS3uZ4s7huL19ZIopxTUt59im+slo+hAddRLacQDUJe2JwVSMaZ3P06RMtTK/FizinKZHUq/yEKUV3SG0stHcFVlsbuJaUvyLxNT2IQAaLutRev57r9nCjm5xTM95n6txwQVnSWvumSUgURzOLiGbF3trsrvFLe88obdh7auRkX1VVzd2ugyrrRI5JsmTAx/R0KxVHIpp1gb0RjDLK6GZHGbav8q4qeqemczIhhhq7gQLg4j9zLogT43gYTxwI2niZ/HUbZoHVYrsJFYO5eeGqwiqRALAvrFfGA0I71r7vC2l/gDLmrlAZVsN0WXjurNSe/fuaZiBZznM73tYyAxeO/MB44+Rapj+4GRPowyED1IrGawh1tgbqiPgal98uENuGzLfrVyBPV9ou3usNzf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(19627235002)(36756003)(6512007)(6486002)(86362001)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MYxhgXuqd8aymdD1yp2LyGG8KYn5Z9YNJFUtzDUcrMxAURAXe/9OJy+UIdew?=
 =?us-ascii?Q?Shv/JKGiBimdPlEnJnj+v0BRx79FlO1oQa5r69UTH5D5cG3vQmkqhDZSoFhy?=
 =?us-ascii?Q?hIeOHe6sNFQtx8BKezoK3rtMBevAOLS5MQMh9gkuG/8Wki+auAao5FhRSBra?=
 =?us-ascii?Q?CWMGvTb2UT3YQDQJPnU8D5QLvNQ3UgsBQpBuuUMOio1xLfrlf/auhH5BD+Lw?=
 =?us-ascii?Q?crDf+59sTLuBlaQsN8jeH3YXX2y2LZNDkNQQVUupv2MJxH6dPLOrNk5QAvaN?=
 =?us-ascii?Q?Z3/AoznV68hIZWXf3d7kPTBbowdkCIUi9Jqe9mQxlWB/b2WyDJSEFoAEBZ8m?=
 =?us-ascii?Q?OugjDyzh6yKUJ6Jcd1wubLbHx2sCfb8z3F3bSAGWIDh6bcidTL4pS8VFbGaF?=
 =?us-ascii?Q?qtP9jdjS86OsL0acdSC+GfCWQ7wzwruYtmbqt6RHDSqKejCeEnlYv5QIHDhj?=
 =?us-ascii?Q?OTzG2ysfqgbUgXS73kQToHfiz/qBZKf0eQOSVSIqE+bnbmutQXeLhOLJj4Xm?=
 =?us-ascii?Q?QywOoJJtFzith/IBp/J+O9QnGrOr0jQLfwlT/K8SaHEPIZ+OwkukNoJuDbzg?=
 =?us-ascii?Q?fo3E4IaQMQBh9C2Fr81jSyjgh7gonR3Fqvo4JjXiVdcZsF3aZ2DtBOY8SlhQ?=
 =?us-ascii?Q?XM5pk742X+coVMgGjyAG8xvgXILDJwE+b7ncpvLdraa8oons3To4iSOVmm6S?=
 =?us-ascii?Q?ZfG88xQB3zLnxMcK2diSpJupVTsXn43nFTgV5kX9u5SyU+ICa92mkS5L9GvU?=
 =?us-ascii?Q?QHzQUu2pjmxxtfjHCDntCyTgOKTpNMxxMMNMILoa6txZbdh6w0JNqN/difz/?=
 =?us-ascii?Q?sSc/1RydWh+kXULYFE159bf5i7sYAF1qlF66XBIoZj9uwqtCrePJR2UEh84M?=
 =?us-ascii?Q?Uyh7DuGqCiH0QF24xTKpfYFx0yQbDGhAgwFz0KVuhE1S9SgGnralPZ5lcVME?=
 =?us-ascii?Q?ozoik7CCgSpOE4u410eFbh95fZJvgKTqn7i+E/Wzohxvjp5QH5qF3nr8ql7t?=
 =?us-ascii?Q?zbjV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:52.8892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 7801ee92-7c3f-4366-4fee-08d8b49e50fc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwI2+48nSmyB3FMcwb+ID2QKC8IGlLmg6Rk+tyovh1+ljaTsDfFZh9kMAhQdE40XHokZlNt7FHSuUMELZpY/7QWCM0GYCcGManP4qm5IrpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.22.129;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's better to return status together with setting errp. It makes
possible to avoid error propagation.

While being here, put ERRP_GUARD() to fix error_prepend(errp, ...)
usage inside qcow2_store_persistent_dirty_bitmaps() (see the comment
above ERRP_GUARD() definition in include/qapi/error.h)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.h        |  2 +-
 block/qcow2-bitmap.c | 13 ++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index d19c883206..0fe5f74ed3 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -984,7 +984,7 @@ bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
                                 Qcow2BitmapInfoList **info_list, Error **errp);
 int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp);
 int qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp);
-void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
+bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                                           bool release_stored, Error **errp);
 int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp);
 bool qcow2_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index ca01f08bac..9eccaab7f8 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1536,9 +1536,10 @@ out:
  * readonly to begin with, and whether we opened directly or reopened to that
  * state shouldn't matter for the state we get afterward.
  */
-void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
+bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                                           bool release_stored, Error **errp)
 {
+    ERRP_GUARD();
     BdrvDirtyBitmap *bitmap;
     BDRVQcow2State *s = bs->opaque;
     uint32_t new_nb_bitmaps = s->nb_bitmaps;
@@ -1558,7 +1559,7 @@ void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
         bm_list = bitmap_list_load(bs, s->bitmap_directory_offset,
                                    s->bitmap_directory_size, errp);
         if (bm_list == NULL) {
-            return;
+            return false;
         }
     }
 
@@ -1673,7 +1674,7 @@ success:
     }
 
     bitmap_list_free(bm_list);
-    return;
+    return true;
 
 fail:
     QSIMPLEQ_FOREACH(bm, bm_list, entry) {
@@ -1691,16 +1692,14 @@ fail:
     }
 
     bitmap_list_free(bm_list);
+    return false;
 }
 
 int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp)
 {
     BdrvDirtyBitmap *bitmap;
-    Error *local_err = NULL;
 
-    qcow2_store_persistent_dirty_bitmaps(bs, false, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
+    if (!qcow2_store_persistent_dirty_bitmaps(bs, false, errp)) {
         return -EINVAL;
     }
 
-- 
2.29.2


