Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891CE2F8FA8
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:16:12 +0100 (CET)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0trf-0008L8-Jv
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:16:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVM-0004nN-UZ; Sat, 16 Jan 2021 16:53:08 -0500
Received: from mail-vi1eur05on2126.outbound.protection.outlook.com
 ([40.107.21.126]:26209 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVL-0000WU-25; Sat, 16 Jan 2021 16:53:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJ8G3+zOBA9uMGOcBURU+xcNDS42Gd8GiVM8dsJDwqJNI7ZaZkAW7MYTKs60tenYqeuAhXM3AL8kiIKIkgA6M86JO4GKSADTqzP767zTTqZ3GSSeC8aYvHimoI/hpnwZKelYNRpAe/o05WchWkiNEWFa/LE+c64JAGb+ynj1CTG50s7VDkyspBokP/PehHgVjdNZDxgk7w4QPHqqGo37seOjyLhE2AGWGni1GIwIT7j3rNDiPCbINM7R4aVkZlH2ZiibNnqhhKKTJN6OfkuZJqLVaFQ/aVyGJcPANTpJ1vEvUxyI+ECypogTXuNfdCYkAqcxt4VIues/FyH5PSu9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83GlCXkaxacMXgNIB425cxfYzkCiaetQsIeCxDT5l3w=;
 b=lL59+MYUXutURY+PXIXVNPsLlwkFt4yyT7Jn6UrnzBE4OyIXDCVk0gdlulqx24RA0ip7RbI9JV9rYd/nNqTUt8GMAu43AFgyOrQtlOSQU0Vbu8vHT1glQAfOn/wEIJ1bSVZ16SUiZfVeb2tcS7R1MJl2xidsOICydExEFRf8TvZzB3Zztpv42lUkdMe6p8aBVd3+gV/QkRjgNCgEsnZB2Z4L2GgkS7CpliirfcL7ONW1edxtWVAHkTWVa/aWBJQK868dU1TfB4ncukVkKAEmlCtAR0Sw/kjtMAAxBUloVBV5CKQZNTPDH9wS1xod3f1zMI0kYdCeZq50LPTg/5wfZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83GlCXkaxacMXgNIB425cxfYzkCiaetQsIeCxDT5l3w=;
 b=TmzSkbG5mIpGs9aT39LMZY8kg6B6PTUNhaIlAMBOoEIF2pIJsCDp9jqPwfwkqSKC0/XrnLK7wwwS39H6fhZRCbiCbXXvpEIxulfurwJVCdrthx6R/JcpvcxVg2iinUFQSf4awyJPAoxIEtwz4OLDAeaW6fU/pK15wM3Xx8tBu+s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:52:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:52:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 11/14] block/qcow2: read_cache_sizes: return status value
Date: Sun, 17 Jan 2021 00:52:06 +0300
Message-Id: <20210116215209.823266-12-vsementsov@virtuozzo.com>
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
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ca18e18-7649-4e87-ec8e-08d8ba6915e6
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35426DC581B284A2841D02ADC1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AMKbvDrKNx42UgqBLHr84vOuYhPod5xZUN9JqEnR0JvrP25piCFwq+MMBBxI8z9wt4Zl9GCb12P4J7Yi1jT2iakqQEWSWTmcBIZDX1+XbtUzFysWRsYyq5kYGX4YUFPvC6TO46sJ7djrjD0evBynXYx32CUFhhHpero8Y4/ZxixYWO+P6QZG63ynkfLMULdT29GonYyfX3etIovq0PtIDrIDNG9PiaexFuOMt3UKotBIDAlnhscIMF6YrNtgcZuj09vNZAp5cjwIaXcK+oX2KWPP2f1kPHROrVFhoZIckobMSZN+I8QWsEE5phOVlo72httd12gnyrVVfmqh2XeoDzkAhJqdT4ptqCWBK8EcHaKzJpP3B+x5C+FG51fjqfWGyQObVRzAJdFeKAoUb+2kWQIqRCEHC32dU4M4BMYO5135ouZhSjKh1zSK/qsxDCUqibCo3CSt0Yf/uX0xF9b/rjtH724H1faNZIlTsEMtzWwr5eX8eWo6sAiJJUrnPozyGJcIrlWwMglPETOF5jIpJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jSy+PiYyouOIx5ENItHc8d0q9TRZM0pR42jB0p9KYZHnap36S85SLj2DjWJN?=
 =?us-ascii?Q?xvfb23hRAe+a/9hQPRyzGTjhgAXiwXgG7At93g/ICzDCZXV0BFUOHCddf4rn?=
 =?us-ascii?Q?dsKmRS9mDA0UigvOu9Aga00AkhttSiIWzzigoC/7hi+Cx/PNpSpU7Z8l1UrQ?=
 =?us-ascii?Q?BiPBjTUzkkBH32jGuISq2Zuy8h5ZCBGxivGHTyJRz3vbY8MYySB+Q7Ns/c4C?=
 =?us-ascii?Q?xbcarIwGv2tldZ4eiUVE98ZWH5rzSldMA6kbgWILQlvXJerab+s+vtAUmvCT?=
 =?us-ascii?Q?gskiAQBJt7ozFLiBpjTDqb8j3Q7ZH72AGwB4q1u4/M4uRai+UQZy4X3DeX1E?=
 =?us-ascii?Q?ylM++5HZb4rsv+E7ikTpMHH6+kfqiN/T0TqZVRme7rAHC5Ozfzzm5Nsc/15y?=
 =?us-ascii?Q?lr3OVgzq7BWiLqQvDCnsOKmgtzZ3KV+1xZZBnbxsyqzJDPhgpoWbOAAkCzRC?=
 =?us-ascii?Q?CflsVxciqWwxWFFst4/MMQq0jTRIRnSt4gJLaY4wOj0BI2HgG3/5kZqbkRTS?=
 =?us-ascii?Q?X7qgo+ZJsmxSkOvBXCBIqXXKb7ZVY8HlMbsIIV0Q5zB75bmUJqFwtHonSPr1?=
 =?us-ascii?Q?rhpriMW3Mpfp+B+JNdEzotrGXgdq0w5iTnuc34M6xm/bGChyVlpi27HvaKvX?=
 =?us-ascii?Q?x1rU9TyRcCpKRneDKi/qb1Lxyig+7gOg3THJiz0eR6ixw22Wo4SuTet2PaxQ?=
 =?us-ascii?Q?HhSMpE4VTDnk0JYnCieynBTrY9FIX2Fh90XxNbfKwN16BWx4ScmxrnUqBc5e?=
 =?us-ascii?Q?eFnRcDc7q1buf20+PYf3Et/b6FMo8LlRQWHTArLqrtASYzUxAMH1du1Zr90L?=
 =?us-ascii?Q?57AdJyp9ndp57SidfIWY2dIXDy4EknfkVl/teKNDdRd1QdJCAfq8lg2n+hTK?=
 =?us-ascii?Q?kk1yXJWWPIkl8MiPag1r5g4uPaYOLgsQcnPGQl5EXCrOnrkgYE/iOmqu6zlT?=
 =?us-ascii?Q?qNMgbzWwtBmo02/eJFdJSQKNNOnXsSoxImQp3VETlJWbmFpSH4zNwfwQxOhs?=
 =?us-ascii?Q?TzhW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca18e18-7649-4e87-ec8e-08d8ba6915e6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:57.6047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7X0dZ+KBbuj+ZVEA+MMcoFx3zNLe8FEx6xtEJAxO4OZ0lKot7O8dTviu3okfvzm4N5lGTehEZH68hEYRPqKGBanO9E/V6PG7Si8dZTeS04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

It's better to return status together with setting errp. It allows to
reduce error propagation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 20d67bd9c7..2e0e050997 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -868,7 +868,7 @@ static void qcow2_attach_aio_context(BlockDriverState *bs,
     cache_clean_timer_init(bs, new_context);
 }
 
-static void read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
+static bool read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
                              uint64_t *l2_cache_size,
                              uint64_t *l2_cache_entry_size,
                              uint64_t *refcount_cache_size, Error **errp)
@@ -906,16 +906,16 @@ static void read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
             error_setg(errp, QCOW2_OPT_CACHE_SIZE ", " QCOW2_OPT_L2_CACHE_SIZE
                        " and " QCOW2_OPT_REFCOUNT_CACHE_SIZE " may not be set "
                        "at the same time");
-            return;
+            return false;
         } else if (l2_cache_size_set &&
                    (l2_cache_max_setting > combined_cache_size)) {
             error_setg(errp, QCOW2_OPT_L2_CACHE_SIZE " may not exceed "
                        QCOW2_OPT_CACHE_SIZE);
-            return;
+            return false;
         } else if (*refcount_cache_size > combined_cache_size) {
             error_setg(errp, QCOW2_OPT_REFCOUNT_CACHE_SIZE " may not exceed "
                        QCOW2_OPT_CACHE_SIZE);
-            return;
+            return false;
         }
 
         if (l2_cache_size_set) {
@@ -954,8 +954,10 @@ static void read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
         error_setg(errp, "L2 cache entry size must be a power of two "
                    "between %d and the cluster size (%d)",
                    1 << MIN_CLUSTER_BITS, s->cluster_size);
-        return;
+        return false;
     }
+
+    return true;
 }
 
 typedef struct Qcow2ReopenState {
@@ -982,7 +984,6 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
     int i;
     const char *encryptfmt;
     QDict *encryptopts = NULL;
-    Error *local_err = NULL;
     int ret;
 
     qdict_extract_subqdict(options, &encryptopts, "encrypt.");
@@ -995,10 +996,8 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
     }
 
     /* get L2 table/refcount block cache size from command line options */
-    read_cache_sizes(bs, opts, &l2_cache_size, &l2_cache_entry_size,
-                     &refcount_cache_size, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!read_cache_sizes(bs, opts, &l2_cache_size, &l2_cache_entry_size,
+                          &refcount_cache_size, errp)) {
         ret = -EINVAL;
         goto fail;
     }
-- 
2.29.2


