Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B2630BEE8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:59:36 +0100 (CET)
Received: from localhost ([::1]:44926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vHL-0006pp-Qk
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8w-0001S0-Bv; Tue, 02 Feb 2021 07:50:54 -0500
Received: from mail-db8eur05on2120.outbound.protection.outlook.com
 ([40.107.20.120]:42944 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8u-0001yT-7s; Tue, 02 Feb 2021 07:50:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkUEC9fwlLF8vHVjbW/Bk/wr617GJQSmKd1EyGrPt0VGn8iuFFnELAsgCAGXtbf5pt12lEsMIGv7RiiANzY4gNI8FtcP2EzNZ4JlH+n3t0F76AMFA+5CARLY4p6cWlEfZR2dYxuVJ0FYoEWQ3FPt8LacC++Kd5EbQlaCMuEKNqQfdM6ytVJ056aH5U2aG83p/3xM0xtuWtfKjsN2OQ28Jq+z6ZMRF74liKwncs/Bunq9ezqZVSrMsm71VjuZRVJ5FiA7GotMjbg7KJVW7b1mv1fSJxoUjH3+0SmGZMpJJ1SF9xikDFUmIltmQGnRpOcBEBUINPx0cJGMVnfLsLmqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eFvLAwF5g2CYHp9B+csauDSAaAHZNraAYAc+ODYdTc=;
 b=EGVoJX++QqbvU9Lz6PAxaWMSZ0DeZh/FZ6aj8TfL+43TiIb7I5x3UqnjJYY6xE+wqxDe/QQx+XRyoZOVYlWtxLW8rZs+ZP1dLi8W9zIHHMyt3lZTgJTntTd7dnUfi6bhqkJPvuWWaYEZTjiaaRmAhWm1VR6CByw+VpPBF+7iTsBc6zN1ZdiQfwcfIxGid0e790GScbFXWgBxlfjIMWCX8yBI0bEow8Y4oC0y06JJ30+vli2CcQnrVQhsABMCDEsONx384XVsTQXup6hL4s5aRlg3RQljefGIBlSyPcbNdx2LEFIQpgj+EicLp29Mm+YcWHOy24uaoUY4lW3n6VGz3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eFvLAwF5g2CYHp9B+csauDSAaAHZNraAYAc+ODYdTc=;
 b=Z8L4eLpjPEL9MP4It+IHDHUwuZllCFyVBOumzlq+gcH3hnNRgD43lnGXKSfKR+vjbaboEfBDXICIMnknIIj8NHZjWMBMqxotGTjbtxsz+oJwu+JW7rpqIO6xYCOgSrJZ+YvcFGVWoMSOaQrHlLXS2WTwBBWq4o67Oqq12f/pqX0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 12:50:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 08/14] block/qcow2: qcow2_get_specific_info(): drop error
 propagation
Date: Tue,  2 Feb 2021 15:49:50 +0300
Message-Id: <20210202124956.63146-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202124956.63146-1-vsementsov@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.137) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6484e066-0a25-4243-ed7d-08d8c779256d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35441E6FBF5D6893DE10B705C1B59@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W+O2Z73Ee6crwzcmPafx1WPxnybshq6Aws+urUyBS3NLPwFxxUxwjasxuIEqRuSQGyWJ68dw2IGl3yMk/hHzjJG8m2QUULfontE1UbHh4aJslX3R82eMM4ghs19PIXxGlXvfExbs5oH/eUhKvPFbsDyaoeetuHHXn2bDFtMJSeGNye4gAidKdVmFqjt6q6kFKuPBXhok+AK5s7BvFPogaW+b118Sx5wGVgpjH+ifpv9jrMFU19vvxt8AvRbrR5fNYKR2VNQ2jiyskpSxZ1rbnL6afIQdI2C+9/UI4gDzM4v8R94prrPELMZHsU78f8b0QYAGQqQ25ITZ3yPGj5pmCX4EUXsop1x2w2YmT1HMWR1zWxHLw06d3899J3bdveeIfylFNfH+QFpR82gvceESeIOjGz8KamYH4/izsaDdYf/2yoep3c64M5ALtp0u24p+n1auZcNzTud25JftJK50iVs0PgsgHRW5wrPzNJQ0BrciofffIzsXJ2QgERlj5l+Trr4/T3F3Y67ap5DBO7z5bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(478600001)(956004)(186003)(26005)(86362001)(4326008)(5660300002)(83380400001)(8936002)(6506007)(8676002)(66476007)(2906002)(6916009)(2616005)(1076003)(66946007)(66556008)(6666004)(316002)(19627235002)(36756003)(7416002)(52116002)(6486002)(16526019)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qLMKIXwVxoXhQ3ox+Bjt2mGvf2M2/0zcuxXfJu5r8PlFkY6Ees3byuMFID2r?=
 =?us-ascii?Q?fzNp8kPQSTTIWmL4JHypLJcUCFQ7YOZHjmSTD+6nwiOnhAg00jaT32QBOhrx?=
 =?us-ascii?Q?rCxs8k8R4nLlIDp4LLfzWZ9D68ePtWgEYE2rO718A9kKkEUVf3dKJNt4m+Bs?=
 =?us-ascii?Q?1EgeQjxHCjZtwqJZm9Ax+T7NMbEnghFFxZi7O4PQLfDUezfr42t3C508bZf9?=
 =?us-ascii?Q?67rYYWPYpvut1w/QAAwAHN+hh3/WelObroOm272ZNG6t2VRDA92BEWGNsxrZ?=
 =?us-ascii?Q?CzoT2C6hKgGr4qOchD8oaQO/eFnB0czbCFd5y3jZUT/uCd8Jvd2fwvS3/wpv?=
 =?us-ascii?Q?dCi80s/TD5s2lHSqKZg4fMQ9ZyTp6huMkX7pzotwxhx3poKGQbiXQaUveUJL?=
 =?us-ascii?Q?iPL6G+a05RQsv8wJGdP/Brh7JEpu8Gmzg7Xp8Gti688k/Cgjb3yEunSXbeha?=
 =?us-ascii?Q?26wT7qS69Hpn6fBE3M84PxUXWXczTqZc+0CbFk4rKO+qIGHNehI8gHNPG4JS?=
 =?us-ascii?Q?VJVHykPJAsTGToz2lFGMutxiDgKBb2cT0YA53SgJZtbepVrFngyfIILBeDXC?=
 =?us-ascii?Q?t3TLziC/TzNoStg3ZoWuvi8Uc0qK1R1Ikp/3EXFkYSHSXOv+TVIxuhun0Vaf?=
 =?us-ascii?Q?HQiLJJMluxWLEyqw5xmfElIcPIFg7ddYQWJAHxyRaLCDpRjtCXIn1J19na2Y?=
 =?us-ascii?Q?tXyzjzF5WzHn98cJ1wEnQ/3ArQHEJ7ix5FYDzfhBrPj8nChQ2H7QbCRcFJmy?=
 =?us-ascii?Q?FLkLR4uguPNhgrVEX6FhBqB9XoS+tdwHxRnPI1jUjQrYXC0QeamjdK5b8mvj?=
 =?us-ascii?Q?YVDQKBr63q318R10PnE2oo4IoRtWNYhBzNvFWWbx/ssvNxZgMDPBDPcVmmY2?=
 =?us-ascii?Q?9V+pWaKWKn8nyVG3fCwyGJyPlEvmIMqj/qICuymn+3XI6iPFnxeY0b7pik3F?=
 =?us-ascii?Q?fyMiCcQsv8+S7E3ukCA4L+x3n3CSIS9F0N2FDZpGxk3YiDEDir5T/o/hxO+8?=
 =?us-ascii?Q?BvHMgaBYGG84Hai2oM6oL6YROGkR6Z6LiDMakezHeiYj98Fh6xcj0+vQgrvY?=
 =?us-ascii?Q?QOdiE+P/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6484e066-0a25-4243-ed7d-08d8c779256d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:40.7061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mryzbo9XkNf5qncRgRNjymbDNVgq8DzKMC9V07KUHLR/oFTZntv6kVssEOj5QlAX1XB0MNYH6M6kRt6QA4tOK/XPSUvK+PpA2w3W6E54yXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.20.120;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't use error propagation in qcow2_get_specific_info(). For this
refactor qcow2_get_bitmap_info_list, its current interface is rather
weird.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h        |  4 ++--
 block/qcow2-bitmap.c | 26 +++++++++++++-------------
 block/qcow2.c        | 10 +++-------
 3 files changed, 18 insertions(+), 22 deletions(-)

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
index 5eef82fa55..c95d6e37e6 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1089,41 +1089,41 @@ static Qcow2BitmapInfoFlagsList *get_bitmap_info_flags(uint32_t flags)
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
-    Qcow2BitmapInfoList **tail = &list;
 
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
         info->granularity = 1U << bm->granularity_bits;
         info->name = g_strdup(bm->name);
         info->flags = get_bitmap_info_flags(bm->flags & ~BME_RESERVED_FLAGS);
-        QAPI_LIST_APPEND(tail, info);
+        QAPI_LIST_APPEND(info_list, info);
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


