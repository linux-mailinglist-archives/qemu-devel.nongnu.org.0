Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3743F5A23
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:49:48 +0200 (CEST)
Received: from localhost ([::1]:52312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS7q-00073x-6J
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy8-0002WM-K1; Tue, 24 Aug 2021 04:39:42 -0400
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:13121 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy5-0007US-FJ; Tue, 24 Aug 2021 04:39:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z40Yvm6YvhNkdjej+Sg3NkxzdWvzScd85f26qZM+NPuIF9esUVBVcN2UBVYrU7F6HvKtPI7tmNLw7jGbjuMpvIroDucmHTS7gDdDAYHLhdgmueC26lOC4ju5HyeBaHxrFonvElKVvpFuLC4ydLlcHCXqDeE+4GAYlqy8me4PSJrvxTw1QoMcwT6v7y1CMagL+K9pAqOXyyIwq4pmR3vgLvSQJXmI6vNP4sd4hzSp4pBTmmR4sAXXOw9AZ+ta7vXD2Sc3LvWVSZnIi4LhpapO/F1i08icPybGuMq/Dd1G4W+y2X4VGw1f3lcGEIgsb9I2DYHBXEZcLnInjn0gmow7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZ8w5qdaPUsW8UWJ6qFAmiuctXcyXUw7XJ0bYfnYHg=;
 b=TkErza99WMaJi7hbmrFJ4SMo0PidZqYg15eMNt9hzsHTQY8zTCpreO7GoO6OAh/rNyFBGSUQE2++w6IR2Dco4WtaCsgIH214x24zb5ys9ICe6tf6X6gJr7NFPvygVRs5Ibdog42JVHTzPhIK/676uHtRRZBE3XLtOKgNlylJRTIoF+klJTAr2de+mVJdMHAMJL3X2xJKM4OIBoEfs/8R3h61y+cyREX56XGXNf5RHZvVJ6/GOXuJq4bgoRKMqW5A///nNc0uJ3EKGD1eOQJzEm7YgOBjF90eBLoAtuV51VuIhk72otnF8K4VAmzrNcFkmIYBoATd6AmdZl4JjO4P5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZ8w5qdaPUsW8UWJ6qFAmiuctXcyXUw7XJ0bYfnYHg=;
 b=eN6FBRaMdpjkZ3BUk8xV4+9QXd24OVNBmX9QkwIKVIKYTw5ehSMEU+d7jB91n3nfFl7RXS8nf59Cw7Etgzf4xF/E3jr28MO3YIE5mvuSHdBA+WBt6S2ue5fl/7P8oX1q/LG9QhYSswQlz9MMPJQBF7O2/YBwghkQDqfxkXD26pA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 12/34] block/copy-before-write: use file child instead of
 backing
Date: Tue, 24 Aug 2021 11:38:34 +0300
Message-Id: <20210824083856.17408-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fd2a9f7-4230-4248-833f-08d966dab2e0
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5333F39DF840F0DCEBEE8943C1C59@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EQdIl8izL+ReFujLUTzZX0EXrGuM+H6Rrrlpd1H7Ux/cz0JjBx1nM0gLkY935X7fAn3UGZeJS6aLDlAgXcwYb9e9BqTKbt0Qh4T9w+esW8wUquWtwjND+gDHs4mjgoKJ3S9H5AuPJVDbF18lBVOLZmyNHX1xcOPcSMS9nDBvmLq6GbCa42AfhqeYqTsoDTVPMn5VmRZ388J/x7VSt6sLiyDh/Tnzw6aGXmrP2x9fBIXhRsaUKeYuKTSdQLWDI+Z/2iHMEXoa9a09mCAr0jcxxtoTRMirTSiGV/2XlaDvvcOyAWGV8to4B5f9OyOWBUFDaVaZ4CTXHvHAjXM9DixPywUuicsCAKfUDL/uT5mQIgmELs920mCfvqUlHEyZBgjw+y8QLD2Nm6DWY38n+fNUudeUeRITrDKIQ8VvGkqlT5fb+pKdCzM6Dj7JkYYZ9r+2FleN4jkq/nR+lM4W86IGKBuRRhI2VOZSk1FUGZX4gfIOEE1TqpixnSU730BndJb6CatdqgzSs0GgqeMst72+6Yld7kEieUOuHobXSlAQSdZRJqLLM9inl2sKILg7QjLH0vwimDB6IywTYnGWw3CYExJTBIwFbTEZPq8qu8/61yLybUaHEiJbVJQf/ZsnMhXk8PkgOMrHBNgA4Rp5lnnZhzA8OJ/GlpwO9pKhNx7JmT+766SZM78eAPioHRs+D5zswJn9VQRiLS5EPTfai4a6IA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(38100700002)(8676002)(4326008)(86362001)(52116002)(38350700002)(83380400001)(7416002)(8936002)(6916009)(5660300002)(478600001)(26005)(1076003)(6506007)(6512007)(186003)(2616005)(66556008)(36756003)(66476007)(66946007)(956004)(316002)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qcWN2IpJgaC6qeipCSXunwK8p20zTR804pfl8b3v9IVaD9JUS+GS1bR+Lx1t?=
 =?us-ascii?Q?oM1au8+4vzw9Ol3RTBWyWY1VlGQ5JET8Nr4UU107labjBcdQVT10u3Lm13Oi?=
 =?us-ascii?Q?q+CDNd797eIq1EhEjCu/uSzaHTgzxSdUddBMp34lJG6oIiemLsoNTvG14o/w?=
 =?us-ascii?Q?nhVEUs7Va1iSArXO+OJbrwJNsYevaVAOMjMYKbDuCM96RNo/RHCgqP9dbYO1?=
 =?us-ascii?Q?sQ9QGUkQopZTnEacMO+3lThrDyL/6VBWuOxlByIVE9nKYWZym/eFzCd7Fd0m?=
 =?us-ascii?Q?ghrSiBL+ZaEpSIeY6Mu+68pIhJMzUwJ4kn2xUBvH6PJcc/aLVx40ErJa+ONE?=
 =?us-ascii?Q?/mmaDe3+l0owCt7P5pfNih7T1+ZkwC0Kcr5wMcuOpsP0p1x2mbFBko9HDozh?=
 =?us-ascii?Q?zzy7qw6y2fWIuWL6+FmtL8JKW8lzYlNVJ6u3qLYQkFg8M5up53nsQCFsGuVM?=
 =?us-ascii?Q?laJ6QtWUHDNM/y2nvdfqGl+rZjaB4s8r1FM1KbFyFTvtp8ZtaccJAyGIaMbJ?=
 =?us-ascii?Q?LFRmFxPZzWEiZ8mHAxVLiDNBCgWif79TFUB1FNhTkPSSP74plK+rkFkIXvSs?=
 =?us-ascii?Q?xbOtAP0POgBWdfJE+RSSC1DNHKRLTmjZhn1ggV/zJHZkDJ9PpSNrQPKemC8V?=
 =?us-ascii?Q?UvyYAN0TYQ+Xh9jJmYeu4CfMQ2m+QzyNX3wmYISQNa5Dc5xfzS2+SdL8Kt1S?=
 =?us-ascii?Q?rOoO0yt87ekVXbUQhqvQiZio26N3rTux24TknDJWv7ehwPShjtirPIEzCFSX?=
 =?us-ascii?Q?6OyW2u4+JLGAvjQzFGj6MX93HPmNY2MUkQu/u4mFlajdrx8qIwTGHgabMUs7?=
 =?us-ascii?Q?pdqNVW+zGchSAFms8GqKqB7KLhY7oa7beaJ7CCy7/vWlYF5QrXQF+b3pGwNm?=
 =?us-ascii?Q?U98CUFjfiQq5YkvKvr0TyVV2Mm6jSOnkqlKWRcNYQQRDIOVibpuLxOpV1yNv?=
 =?us-ascii?Q?QhJaCL5bcYlFkBSZ9t6psjfwPe28MBN6y9Vms8e5UpaZtNW4Y1ivqoQk9WF7?=
 =?us-ascii?Q?R/WSxoOcTcadWPmjNNBxu4I0UIeW/J4H9GfTSdrOv+NdAwcGGfFhOQVdjIS6?=
 =?us-ascii?Q?NQD7nFX8TX0ScFSHPj5lODGLeGqzZW05jqNTGRmK+lYvpab67ugM3v7mRnHs?=
 =?us-ascii?Q?dQKILjb04YfTm8lDxXZWn7c1UAbdEnwfcy5D6G0LTXF6T9vISOew/bkZDQyT?=
 =?us-ascii?Q?wbgai3aIJc0uoy9KGu3J+2Nj0Ip467huQStl2RtjLjac3P4S/uqOxqWrecIM?=
 =?us-ascii?Q?5PqHxFLTYmYBGYEekgCW2Ua4p3vH0nXqMCywUNetDCK+FctuXcF3AZXDNTAk?=
 =?us-ascii?Q?ooLbMHcR91NIfM1peted0TdX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd2a9f7-4230-4248-833f-08d966dab2e0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:34.1011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgAi0Bu8TUCEyYrhZDwskfvJ9sBDUOHzhKM2ncPdJ65AeZCxgWFlj6MdX+tKzLo43BQjZ+lUKYDm0qkn5ZbOkxXVAlsu7M6BHGEwpRCif3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.20.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


