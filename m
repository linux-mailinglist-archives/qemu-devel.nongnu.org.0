Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96AE397880
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:54:56 +0200 (CEST)
Received: from localhost ([::1]:33876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7fL-0003Kz-QI
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bn-0002NJ-RK; Tue, 01 Jun 2021 12:51:15 -0400
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:14240 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bl-0002Cd-MA; Tue, 01 Jun 2021 12:51:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=US7PFjkV2yc9in9OuJlNlPyOzxVcNxWhvvu8Rp7OHB92yi5TA0AjMysP/uRa4X5nFE05yIEalcBrqJHg6z2IbLARr2Zq/PscSB/h8ntqIcWnQ4YI05QEg7wHw6ch/LlkCnNP0EfCcsT7cNlFxMSwziQRvGEePxijG2/qZY78Vx4rTfbG4gonkwLB5FIWVAjYy4pc6Lqg6P4RLMTvOCNecNbh6EjNEtnpL1Oawgm3AuWmnsCSDvELx5uvknQH96Hp8Y4qiDq7QGu7rM0coI+UYQehF1O+snzeIs/dHKuNDFZzSNWdDT5EvoxiymHYYRRKCQcyJi5miNcL2CHZQYxycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZ8w5qdaPUsW8UWJ6qFAmiuctXcyXUw7XJ0bYfnYHg=;
 b=BJ6HNvznsnvcEWpQvCAKWs5obMiRMEZGOK9SOlh2bEGsMX+4PiSE0iH4159/12cSjWpgOv5OfIk25N2bZhxCiaYgHMDbpXi1mzqXLZ2S5UFcGyRKYKfJOuoCmuEjShkaOEMZuOc9nzd2PB1sZgZe/DcLeFed6JTH/iAjdrh2nGh7oKnzdUQKOhDG7ziSObgVqLdje7Wkee4YR/uWtRGmUe4+o0n52IlDK7cRczmUCkpEKNGpyHPbfT09RGpXh9UZ01kwXFAhloIqOJfXah278baANBIGWGFpGK+br5b+bEUjWdJxm7crUEOZzcrUdG6ef83yZZ3R4IvlRHF/ToGWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZ8w5qdaPUsW8UWJ6qFAmiuctXcyXUw7XJ0bYfnYHg=;
 b=ok41TfVpX0Ir5rcyLmxgkbeq6jB7OLoGM6eSG2cGQq58himKUWGnOLvtbIA9XNbk7bqKALbWEuqUri1FzFLGFI64uKm5yGpvODljFx5bb8ZPC9LvxhiW1B4H+LSGJNC6hV0N4B7r2APW5yQLgwzhmT4wy+V3VtjCqtSPmDiCPPE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 14/35] block/copy-before-write: use file child instead of
 backing
Date: Tue,  1 Jun 2021 19:50:05 +0300
Message-Id: <20210601165026.326877-15-vsementsov@virtuozzo.com>
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
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec29258d-6e9c-4f1f-9014-08d9251d703a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1972E28B5A6DCA1D3D3279B6C13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: whWLoRGRfYm+nF7oZcDTcg158JtddmvZzMwoI1L2iuNoNNiFz+oU2pRy1SAcKhnp/2/rgR+avDZMTNsHmoq/OOcm+6zgfe009A+dRx6IBabUkni1ou5RVqH9gjLuVNrErHMbc3neGcwtWyDpgQIEjM2e8mPRCsze8ibzKpBLgQRIDM+lszMADWNN8ezm5489cIjoD+D/gMqkd3OfWv1kH+TACHBdjntWMFWbh+9oJkxJhMkW9fxV1g/eQjPoGwQz40CLCwJF1dqsjoErkVuDuMOjszXN653de/70gZUei2QLHQoa7PIsaw25YttbAo/o1c2tVhZv5JL2aKhjw3ljNn6hX6aezFRp/skbwAlyCseDjmvLO62DmcIIU5v7Ekm9pSMXPAfT8ZY/tOMHyPd6Pw47oV1f7fTNTuT+eibaeFA39zhIPj2miC2CLEqRIQxsusf0TlygAGfYGfyM8JukFzXjcW3no1aDpIdCO2av6JI8yXRAtuiHDLG0CGvQm6htZIDE2PzWemSu38mfHQe5FXKS+56qqGn8C7ivEqIsvUnlvB6xT/Sev8Ifb+rOQIfseeF0mpZPpz+KxiZDo/iV8d4G10zF3KPfZ8cjuhXLnuH623lm7oVWsXzJvPaev9eQRPY07RUVD6bDWi5Tn0s4LvP9iIFUs9IPS3pKkvOGvScDdYAD1+jpywml2aETsQPc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?522KfHIlFbOz88YyfMGx9zACZu9MOWtqgUnbyOUUTaVd3AIXWc84SukqVmKj?=
 =?us-ascii?Q?3UTfQGAJG1rIY0tY9myxqKpqRAZF0P66uyMmnMKTrzIQ1QR2Qnqo4W0GO3eo?=
 =?us-ascii?Q?VFw9HoKDflSgp4UYP0zM9sITDZ0ZIlzRv3Pj5MpJOzawOjc/MkA+edC9blwT?=
 =?us-ascii?Q?sNjZX/FFA3XAM+7ugkhMQ4HR27kZ+8wrB3kIWCk9zWpjqzK654BG/tJXVixe?=
 =?us-ascii?Q?wEbMhP5iRYK5ayMONQq7/HsegAhn+6uueCqHGT3gN/xx227x3yLWKOiU2Iiv?=
 =?us-ascii?Q?V+swu4IxqWMtrJDE2o6GqPpomqXmpSx3DXjlQFB9CThbl8nqbgXFIG31zrIO?=
 =?us-ascii?Q?fqAA2VcofxExQSNVi31abZ6pxew7NpnwavOpYV97RcFhNzFEQpU5rXuQg8Pn?=
 =?us-ascii?Q?cpASzhX2WEPxvINbI6psBZZ4+BIldjlCeMXRuJN1HgD10EM4CdVMWMULn5RP?=
 =?us-ascii?Q?TWstHYtoaMSyMmBZEXg/AswzXBhWWXOPSViCHPJ5mo5fASaYvSyQLzFyB7go?=
 =?us-ascii?Q?R6Lzs02+y7RcMh485GmC6s6AFM07yVr1jnr3/1QmX5ElJVpNVLYtsY/S00eM?=
 =?us-ascii?Q?0b+T3kaBdImMyeC8wMD42BYqM8vc18fwlakKWKdCi2hXfv4XIiosD0pBSa3W?=
 =?us-ascii?Q?+vuRa2fB36kxzp6W8hcNdzrqW87fQqQ2wVVkYCizCw7lzTspLMZNiv2YK3/V?=
 =?us-ascii?Q?rRspV2/h3pThMb46W9xBZTUVCcuLNOuH7XgazXk/UQNB4L2NBc73LZWs0Qhk?=
 =?us-ascii?Q?HXv01uWsnhMmFvPhbBiR2AFxzpBP5gb8X04PFNUAX73aWIsjc7Q7b/54CeaQ?=
 =?us-ascii?Q?XYqV/FffY5taS2uWoTaZtEvGQyvcy3rSkqRd6Fj/oRUu4/TzR6wi2JJaeznj?=
 =?us-ascii?Q?zgI4wu0v+AeZxlZFfZ8Q4Hlp7wPtJZQ+d7Sc2heGNeDzmIgz7De8o8yNYgnU?=
 =?us-ascii?Q?zNvcza86ARlQKerAzygn2CcdIGvHEFOaBZo4071g8oR0LZcJI+1q1AYHOlk5?=
 =?us-ascii?Q?8OZPzsB5kyzAtidof6q7GHTgUn+TIvuBtBsg+jASh9KxXspfePp++607U02F?=
 =?us-ascii?Q?qJvlIbwX5Cq6TIPQKFzMhplzTceuyl7GECVP7EfWVooQ8IRUyF7ZBiMvk6AT?=
 =?us-ascii?Q?LWJJXc2HB09hm0/MsIS8Y7lPFjtlQ7pTTtN3rt070qcHOh/1UWGVj7TV0SjV?=
 =?us-ascii?Q?A7hi7zcLL91+jQXZ2lMYmoZ9drpUg/u0PTw9mBicCR0QmhrjmU8xiLCT1bvV?=
 =?us-ascii?Q?991HrxXYQ3LvzNVMTrGmshZvmzZ0pV/l7kMKI8QkhSyD+8PGekzJO5xsgELd?=
 =?us-ascii?Q?lFv4u/LiynEW6K/uMSUSQXMx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec29258d-6e9c-4f1f-9014-08d9251d703a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:01.8075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnum0ba8FAYtTaDBo54cW5k29TU28xfHf7Nj+3xNZPm+IZ0j3zKDBzBRsT2HXmWXSNx6juYgyIIY6zFHdi4O1d4wx1Y81rkHii+rbRdOBYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.22.127;
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

We are going to publish copy-before-write filter, and there no public
backing-child-based filter in Qemu. No reason to create a precedent, so
let's refactor copy-before-write filter instead.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 945d9340f4..7a6c15f141 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -43,7 +43,7 @@ static coroutine_fn int cbw_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
-    return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
 static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
@@ -71,7 +71,7 @@ static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pdiscard(bs->backing, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
 static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
@@ -82,7 +82,7 @@ static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwrite_zeroes(bs->backing, offset, bytes, flags);
+    return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
 
 static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
@@ -95,29 +95,22 @@ static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwritev(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
 static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
 {
-    if (!bs->backing) {
+    if (!bs->file) {
         return 0;
     }
 
-    return bdrv_co_flush(bs->backing->bs);
+    return bdrv_co_flush(bs->file->bs);
 }
 
 static void cbw_refresh_filename(BlockDriverState *bs)
 {
-    if (bs->backing == NULL) {
-        /*
-         * we can be here after failed bdrv_attach_child in
-         * bdrv_set_backing_hd
-         */
-        return;
-    }
     pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
-            bs->backing->bs->filename);
+            bs->file->bs->filename);
 }
 
 static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
@@ -186,6 +179,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
                                BDRV_O_RDWR, errp);
     if (!top) {
+        error_prepend(errp, "Cannot open driver: ");
         return NULL;
     }
 
@@ -201,21 +195,32 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
+        error_prepend(errp, "Cannot attach target child: ");
+        bdrv_unref(top);
+        return NULL;
+    }
+
+    bdrv_ref(source);
+    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
+                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                  errp);
+    if (!top->file) {
+        error_prepend(errp, "Cannot attach file child: ");
         bdrv_unref(top);
         return NULL;
     }
 
     bdrv_drained_begin(source);
 
-    ret = bdrv_append(top, source, errp);
+    ret = bdrv_replace_node(source, top, errp);
     if (ret < 0) {
         error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
     appended = true;
 
-    state->bcs = block_copy_state_new(top->backing, state->target,
-                                      false, compress, errp);
+    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
+                                      errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


