Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDD22F8FAA
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:17:51 +0100 (CET)
Received: from localhost ([::1]:33832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0ttG-000103-PY
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVI-0004ag-6a; Sat, 16 Jan 2021 16:53:04 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:35449 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVG-0000ae-Am; Sat, 16 Jan 2021 16:53:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIv+LCadgMI/wyaB6QfZ7B5u47KjlpIPmZ8M922gwTSt8SuC6jGWkpPc6nia1DhAzB/kRREp3FUaDVZBj9f3yjSUqmmq9ViWaGzRNPORgAloI9Htp/Dc5KmMiejb4CTEs+nYUGM3YOFdJeZSCEXP+QoLdFaJarvk6o9/9EyzjKY/C1oEXY/+NfFDGmoxuJQwZw/862G10lCKZGZlFpMgXD5lyURK+sddjZIwW04RELm26N1liVUXfw+LQs0AcbLaZzzAd1UBVkKXrxHjp0sQ4eczPs1aqqcEEJYob0BAYwnDD9UKfYZUPYjGZJIStvVaKg+NfiEWoodVTXhDfHiqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtXtmU3gsHioLdQCRsEBvSafeoo8uPxfzTrrrmdARlU=;
 b=SYGQ4L4tncmNBhm70vHj88aQ61P/BdB+4e4L/TIoZt0JpcaFquJwEKkdBTwCaC7r8B5m6tf+WLIAQ/ujKz9JdW2oubdPyckiCQdnmvuHlOE/+SCsb+gVjPZ73/yNgs3oGOLMN2DPppPwEAvWpyJ8+4lb2q1ZAYLPNmH9tOQi8e5arNfLuNFK7RPaz/Htzv+q55AZhR2PfIhMkBn+4fVPJMmGGCwK9NsGngFhcGRvTiYjDqiQP+eSMTREwaRu9TyOCyEoStnLDsCz7RUG9w37vhslasiFyLXc9W2PgVVM7JJbd//8BtbbsuvEfqv+KdntVdJ/l+cEyNiIWcIwXGfF3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtXtmU3gsHioLdQCRsEBvSafeoo8uPxfzTrrrmdARlU=;
 b=Vx/1mI5zE8KVB7gk/8/QhbdPX3oPu6J7WZ/SABMTpzys99nB0jxUH3nNIpm+Mv3pU5ndky/qkWKw5dveuMn7KxOICTX1UBftkLPWhbDjtqqfVwmTpP9ElZJpZGfIGCLwuznaHvPM2ewub0RQe7QmIC5RhqNiObAlrJF+syJc8pY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:52:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:52:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 08/14] block/qcow2: qcow2_get_specific_info(): drop error
 propagation
Date: Sun, 17 Jan 2021 00:52:03 +0300
Message-Id: <20210116215209.823266-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116215209.823266-1-vsementsov@virtuozzo.com>
References: <20210116215209.823266-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c122fa1-8cdd-42d6-32e3-08d8ba6913c7
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35429F33BE6861692D5AE1EEC1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EDCgLml9AeqO/11AFtG0+bb3aUl1WxV0wbnCyv+BxPv7es5fMODpvMwvIEGA7XYmruUwJh9WCsWtohuYpa5QFK5G/C4Hq1LFdfAmP5w6Z5i0iCnjn6cWHCPiXkCGK5rQiqcZ62mEpnAaB2KiUFQmr9Hv0gt+JiOoiBlAnS8MYmBTC7FEzHk54Xh5X5hkinGvMLs0B7c4BANF8fOJdtlXudPxPCvC4o7P4fqnCoFjM+mDwuiE+jKYeBo+hQfrsnzLah4o7wHg25Du58Ib6IMbqZnpFJzReU0FeXCpXTHNOpntmoqMSu3lcZghGkkDM7WJhWGgTEfKeIVxdsVg+rDa/89ueciVfBtl8iBOrNssyR9nA+IHd3Rg4dHbrEolRrVlqc83YWrSWG7KvlK953+Wscm0f+iuRtw86hFrwaNYUn9bt8YARRH2li3fXhiOGIX4uLYcWSq5n+OHDJ7O7xL+cxbFYllXWhUcCBteOboCyqmEe4b063RR/kRj+SaQPf/7Q1hui/YvaoXJW6uUHN+NRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(19627235002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iw41JSy3zYhskSuGLpdB7l6rtWZUkcFLcBq5AVZVcmNORMm5oBFDJ/YPEDAW?=
 =?us-ascii?Q?eA+Ny2MeM+pKiY1oV1TS1M/fICAQjasjHwC/z8+thP10+98wqz/X/NK5h2+i?=
 =?us-ascii?Q?/5eCZJWerxlNnSwILuj0MU+qNqQoLeEbjGeg9BqC7cQDEj7sYikviDt7t5f9?=
 =?us-ascii?Q?bYsR7s74DP+gl16qsXSXXV+/xLyAF6Nz9OwRVmMCEM3KNy58ZqAIL568zprd?=
 =?us-ascii?Q?6nsO3TwbSWl+dwQOSS9oegvcMYbeglkCOabKTsV6NVkLoqCxrgnZXl1VpUto?=
 =?us-ascii?Q?MpvvW1KrjCq3AiTZXWaX1xfMZVHSiF+qnCYa8CSNm3b7Ryo4guMS1UJN/UWI?=
 =?us-ascii?Q?D5cSNo8PNjbJTsmCGtpj0QbhwI2iuUfftbKOsdtscdLbDEzTHUWsvNd/lSPZ?=
 =?us-ascii?Q?HSpJ2r980At3djpNT50lEyMecds/4cHh4Y+r/GQD6WrrEkk0eIf1mbQJOag0?=
 =?us-ascii?Q?Jc+HHRG+vxOvw50sIcskExz7FJ0j7kjw/gxo9b9oMkty0ZGA0FM9IFM7ISH0?=
 =?us-ascii?Q?f7tU48C2blI4er3jon8neV8+++bpY47Mu6MW5N8YS8Ri+Mfid/OesqPeOeti?=
 =?us-ascii?Q?UyqPomyaz7Jb+1r8Q6qoB7/9wV7QAJj9aRaRX9mufaPFV1PXTcRB2RXd5gx8?=
 =?us-ascii?Q?DdCGvElKEQUix+wtVw5yd/Fv4pl+bhvWId0G5kzMDnnl2jiAjQ999di0evW/?=
 =?us-ascii?Q?qTZJBLyfYXlFtmA1K6wghJbR2H9yEYWWeMn8EQNcNGruepuwioW2Kxar9KaN?=
 =?us-ascii?Q?6QjhzoINNElCqFeDd3wx9sgORSvBNtXDy2AzmRxdyHNr8ZKd9s1MDmId/Um4?=
 =?us-ascii?Q?1h61gcC7IcecaKsLndOVwysYfjDsE/OZ8Qe5ynA9GJK7hIrn2q6oTs7rozfn?=
 =?us-ascii?Q?g3zkAG0eKPjHtMeD3qqLRKgfN7bkEDM+8diuuPABYODgml7op/zFeLV6fcDM?=
 =?us-ascii?Q?DJHohY60j/8VIkCimX/sWmZPnCpv4wdbbbCJyDLFt/j8viJEZa/jXlXeXLks?=
 =?us-ascii?Q?6P0y?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c122fa1-8cdd-42d6-32e3-08d8ba6913c7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:54.0732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdKDn7DaKbX7nqgZCSNKG3HPqzN3OTAd+y8+zWShOcwdaWgL19+p5BSm5paTGNo4Qk7Lql3PfbypKM6VtQWmYmn0qWIk8w1zxAhK3TamEYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't use error propagation in qcow2_get_specific_info(). For this
refactor qcow2_get_bitmap_info_list, its current interface is rather
weird.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.h        |  4 ++--
 block/qcow2-bitmap.c | 28 ++++++++++++++--------------
 block/qcow2.c        | 10 +++-------
 3 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 0678073b74..a6bf2881bb 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -979,8 +979,8 @@ int qcow2_check_bitmaps_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                                   void **refcount_table,
                                   int64_t *refcount_table_size);
 bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp);
-Qcow2BitmapInfoList *qcow2_get_bitmap_info_list(BlockDriverState *bs,
-                                                Error **errp);
+bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
+                                Qcow2BitmapInfoList **info_list, Error **errp);
 int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp);
 int qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp);
 void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index d7a31a8ddc..55cd52ab96 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1093,30 +1093,30 @@ static Qcow2BitmapInfoFlagsList *get_bitmap_info_flags(uint32_t flags)
 /*
  * qcow2_get_bitmap_info_list()
  * Returns a list of QCOW2 bitmap details.
- * In case of no bitmaps, the function returns NULL and
- * the @errp parameter is not set.
- * When bitmap information can not be obtained, the function returns
- * NULL and the @errp parameter is set.
+ * On success return true with info_list set (note, that if there are no
+ * bitmaps, info_list is set to NULL).
+ * On failure return false with errp set.
  */
-Qcow2BitmapInfoList *qcow2_get_bitmap_info_list(BlockDriverState *bs,
-                                                Error **errp)
+bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
+                                Qcow2BitmapInfoList **info_list, Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2BitmapList *bm_list;
     Qcow2Bitmap *bm;
-    Qcow2BitmapInfoList *list = NULL;
-    Qcow2BitmapInfoList **plist = &list;
 
     if (s->nb_bitmaps == 0) {
-        return NULL;
+        *info_list = NULL;
+        return true;
     }
 
     bm_list = bitmap_list_load(bs, s->bitmap_directory_offset,
                                s->bitmap_directory_size, errp);
-    if (bm_list == NULL) {
-        return NULL;
+    if (!bm_list) {
+        return false;
     }
 
+    *info_list = NULL;
+
     QSIMPLEQ_FOREACH(bm, bm_list, entry) {
         Qcow2BitmapInfo *info = g_new0(Qcow2BitmapInfo, 1);
         Qcow2BitmapInfoList *obj = g_new0(Qcow2BitmapInfoList, 1);
@@ -1124,13 +1124,13 @@ Qcow2BitmapInfoList *qcow2_get_bitmap_info_list(BlockDriverState *bs,
         info->name = g_strdup(bm->name);
         info->flags = get_bitmap_info_flags(bm->flags & ~BME_RESERVED_FLAGS);
         obj->value = info;
-        *plist = obj;
-        plist = &obj->next;
+        *info_list = obj;
+        info_list = &obj->next;
     }
 
     bitmap_list_free(bm_list);
 
-    return list;
+    return true;
 }
 
 int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp)
diff --git a/block/qcow2.c b/block/qcow2.c
index e8dd42d73b..1e83c6cebe 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5063,12 +5063,10 @@ static ImageInfoSpecific *qcow2_get_specific_info(BlockDriverState *bs,
     BDRVQcow2State *s = bs->opaque;
     ImageInfoSpecific *spec_info;
     QCryptoBlockInfo *encrypt_info = NULL;
-    Error *local_err = NULL;
 
     if (s->crypto != NULL) {
-        encrypt_info = qcrypto_block_get_info(s->crypto, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        encrypt_info = qcrypto_block_get_info(s->crypto, errp);
+        if (!encrypt_info) {
             return NULL;
         }
     }
@@ -5085,9 +5083,7 @@ static ImageInfoSpecific *qcow2_get_specific_info(BlockDriverState *bs,
         };
     } else if (s->qcow_version == 3) {
         Qcow2BitmapInfoList *bitmaps;
-        bitmaps = qcow2_get_bitmap_info_list(bs, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (!qcow2_get_bitmap_info_list(bs, &bitmaps, errp)) {
             qapi_free_ImageInfoSpecific(spec_info);
             qapi_free_QCryptoBlockInfo(encrypt_info);
             return NULL;
-- 
2.29.2


