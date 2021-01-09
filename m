Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A782EFFBD
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:10:26 +0100 (CET)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyE0f-0001tx-Ap
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpd-0006Q8-DX; Sat, 09 Jan 2021 07:59:01 -0500
Received: from mail-am6eur05on2129.outbound.protection.outlook.com
 ([40.107.22.129]:46432 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpb-0003fN-IK; Sat, 09 Jan 2021 07:59:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhXIkpAQApGBe3+Bo8BkowCrj9ha8a3KKHYNZj+Qta9CrKN0KAnEh3WrQmlCu7ksWsAAPAsZeyPvAOpk5jVKwLQ/WW2eMxZjbxNECPLXZyVuqmTveBXy27Abj/GoAKoGJfGQZPIufWdr4pQxNpyu6UIetatkTR6dg0rTp9hF6LA2QtPSXJesvhhOxGSPQBIv9yuL9FgHeVk5n3rjDQk3T5yYol6UAWfrVW/8DWkLsweeA8ulmU5T7wbk35oNpZDZ6wRI96i2owXmA4JpCGMyqKLWcDOP/suCpzNw6zWTqgdnpJqFdJR7/VW4ISyjOAWnhAeoyPTwXCN2vcwCZVp9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtXtmU3gsHioLdQCRsEBvSafeoo8uPxfzTrrrmdARlU=;
 b=YKTWejemtiriqfqIkfac4s+S3qZGUwOVjV19zjP0wtmgAsyWaDBNVRmHlO9E8MsEZBPJkO/89Exfv9Q72FCgY5T8xvr9O4FC0ODMf/Vl+SKEo4jVB/heRWmljPD38Qefu/HHc0sB+m9nhATCZF+Gvzy4N3GFpQR20iyox7OYzhJ4z8m3I++7xACqVbcORwi1MzwzxxCoXz18vVTGy4sJC+ZevwaEm/Io9DQjZA0/eU9f9kwuVFEhbxC5EG7sUuUusOlOuRZmX5ZEzGvYuc6j9d+XpoVxzua8fkOHxxSet0CTeA+442h6k7sEyUE2jySG+gBOi28SJ6okFuz9jWXOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtXtmU3gsHioLdQCRsEBvSafeoo8uPxfzTrrrmdARlU=;
 b=jH22kF4vgalIj/t86eu0MCjdemjQRifEJ8aZpWNhG2MW2LhUkGEtzV0znLMF8es91upAWc+IF4L3a7o2U7nuHdkySaoZkdymXS0QjITk9bD+RjUwQBj98hGPp4cF7M7m9TouwgVL/E33WWRYVgZz7InhqVrfURtU+UVZGhZmIKI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 08/14] block/qcow2: qcow2_get_specific_info(): drop error
 propagation
Date: Sat,  9 Jan 2021 15:58:05 +0300
Message-Id: <20210109125811.209870-9-vsementsov@virtuozzo.com>
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
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2c5fa29-2bac-4a46-e3f4-08d8b49e4f86
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB241815D3CC3DDBDE410CF478C1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8N9ItBW1oz/8/xWn/hVFlDj4yghUPrkhhnMoK9HJyIGLahj8PVvLRTG9O0XZDGQkSHIdZ2BnB6y3b4eGBBjnHcKpChYAhNWi+yoFt7Nfwq7P9kWJ9nPOlcqV8oEePgkFPeYS6nf8qOsOq3fis6r/XJ452WeLLnbHO9nTgKu+uq0W293+vW1eDeuhrf64GXy8lnxZDzSMX3xNLytyh+L1KYt4LxZuG2BbiWIOe8bl1ELcnLZ+EVt1VpV+B08Pl6YbVkO+3s3zg1wTQuGJamv12521A7dcmHMZGiLJ1zjlCXcDPCQdRFzfSsWeAHr3CVNWqKSLgMeddFghrZUvvtRC+TrneEEJ0jRw05kBORIq94J93ddtwYnwf3NSsIhVM7EpFPohfk8W1+gnbsQ9lXSBBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(19627235002)(36756003)(6512007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?a82F2RWSp3ZDlJYzT4aYmqTBQuhoYsKe+dFr717WAv5IQDPLh4Zii41vabKQ?=
 =?us-ascii?Q?Wc9YEbgV/9eDcoBNTKyAHf8SWJ+ZmVcRR1mcpdW6KdVJDnE/JCvdE7n/hCF7?=
 =?us-ascii?Q?juUjbNrHiN/wFmvP9MsE2F6g72TZZfvK+Hm8gvdd4Tw7GBZn2o8Vm+eQqPvb?=
 =?us-ascii?Q?lWV3yUDqk7U9gXfvS5TIxP0LW5kCXmRB60UAAosS/9nKStSjdyWjxx5E+nUV?=
 =?us-ascii?Q?1G0bGCY7I5zDgMKsUGqPxl5RIaYFJsnlsiasLiso/b8C+h0l1Nvvn8BA+n/M?=
 =?us-ascii?Q?WxsLN2LFyaFitYOZCOmZ+ZQWV+KAJ5NyawnS+66w0IZDAq0S2KJ2yIU4nKwm?=
 =?us-ascii?Q?uMJMMgWR2TdlJ6bPHGE6GsUJZLfPWiSwFIp5LeMfRHGp7t9/sC6tfwc7hsxn?=
 =?us-ascii?Q?KhheNTxDWqw6su5zqE1KNPO5m/XaIGTB/Q9DbAo+e8fL9kwMQg2vZQSrmguL?=
 =?us-ascii?Q?Olws4pBUplE3rr3ObD9pNgTbS0vqddBJX3J4WD7jbVa7lDNpDyJgRU1YUUSO?=
 =?us-ascii?Q?1jZWoPNCNoob2qqpvGYTsbrircvSifi1I23c6AMm+CLH/4MFp0Cv3DiWlaZt?=
 =?us-ascii?Q?zKnrMJ6dUCSgyefG3GYs4EqahhoyN/ZaKZDNs/QThS5oXRR/yNZ7vXGSvPZu?=
 =?us-ascii?Q?5xVczY2+NfS91RnHAQ9zgwyt6maG9ZfgHPWywL3EFH6uDI7RGsKHIHbq7nae?=
 =?us-ascii?Q?TTIh1PwwJTYz6y8//vxkmvPLe11nP7Z5F886YZnThkBLrm/xW8rDeuf2Ukqs?=
 =?us-ascii?Q?nBxwluLUpvIEqvQEeDqp7f85QwuUkw0NJFfOLVD/dMQwewFIlbzrFAitryem?=
 =?us-ascii?Q?SBCKAws2ruy5bury4EnKthiy6uUVtP+PCU7cl662RawFiILjHkSeAn97Upjn?=
 =?us-ascii?Q?DKqhr3o30pZ57uLLIhj3HcT587HK5oTm3nqVrWc3Ff3XDWtQZ2EpV0wDaxe5?=
 =?us-ascii?Q?Lj+wfeDN2e35qiSrASZYKSWibechKFagyHhreASUZAnzjQ9eFdOjXNoI1BQM?=
 =?us-ascii?Q?Hn/3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:50.4709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c5fa29-2bac-4a46-e3f4-08d8b49e4f86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiA5Kt/c+eX8eIBcgtZaAvFPVRuzP3xIZfEzJItEtJp62U00RcNcPWfwwmhwJ6PpKB03/TPCLcIhEvUMcaJ/lWO2Q/fzkZC9k2qnTKy4iss=
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


