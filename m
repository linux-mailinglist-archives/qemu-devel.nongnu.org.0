Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEAA41C5EE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:46:23 +0200 (CEST)
Received: from localhost ([::1]:36824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZuf-00022n-F1
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVZjU-00004z-V8; Wed, 29 Sep 2021 09:34:48 -0400
Received: from mail-vi1eur05on2104.outbound.protection.outlook.com
 ([40.107.21.104]:35945 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVZjS-0008EY-VO; Wed, 29 Sep 2021 09:34:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jW5+rbZIwwB8xufXCrWOgO2zERp2ZIfJKcIwWWy5GPo01mckSLEvYLkUpZ0yNAJPOkxKv1SoeNOcMMWT5NQDAVqddzwebr3BtSHy8H9UFM1GIYPjnC2x09o7nhG++KDOmecspA08HwA7TvnWoZZhgm3yaQOdwtRoFANfgOoolRQLVwMcJEIOlteVQBWKgyJfmZdlSyVpmF9UIub2LGbwlIkD1ethWHfASFseTweMk0fBl3IlZl1j6ySneB6VrgQhve7UH9HPd81AvAJ+jrfDEGUXDOuAL7+9vl8HsGXQTiKiQc+eAfgwMxqpJGeLILVbt/fGvYF0ahno12ZwCsBUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ofK9n7wceR2lRv4RZvMxDbJkr64kGmBq2vHXJBgUstI=;
 b=ALTUJ4rD2BapB+jVbJ5v9em30cjtolkuGNcI6S+HbdA1dzIhbcZuhgnADJyj7v076KtQHhpWG7NZLVTOJZbO8pj9AnboZC/2XMBsm3nKXZnS/C7VOxTEO8AiKItHi3OkxQlKZ+IIB/zp0tjm+3+Fam+pGnk1WGDJAXuhicO/do46Co+PwvWRKmPwe8eNOFDF3kQEAYtjm4zFPaZGqFW7JrMBxKV4RafPd+ZsrKA5HAfyV5lOkyaVj56AS3VAEV3XSJV0Prj3kk5Q0WYKaPMUhUTT/LTl2fxOehAU3K+JaeaNRm5Gw3QN9XBlw+H9qZOHmjyKitBD/lAOwXTeNG1DrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofK9n7wceR2lRv4RZvMxDbJkr64kGmBq2vHXJBgUstI=;
 b=XBiZajDCFKJzxyKAItqkWtEmhxIUZZgbvmFZmEknZxFmUL0YD6XDMc1KeQldOZOxQo5egKWHztreypCpq/Aq55Xsjp7GOgFdT1VuYX7A3Jie0OneTEpGi4jT4PYm57SPhRgsMDKiQNrOlyOBUvgTWJjws7dY/COWn/jKqZYnQvY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4022.eurprd08.prod.outlook.com (2603:10a6:20b:b0::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 13:34:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 13:34:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 2/4] qemu-img: make --block-size optional for compare --stat
Date: Wed, 29 Sep 2021 16:34:25 +0300
Message-Id: <20210929133427.44923-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210929133427.44923-1-vsementsov@virtuozzo.com>
References: <20210929133427.44923-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0102CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.227) by
 HE1PR0102CA0012.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 13:34:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7f9c64b-428f-48be-4084-08d9834de54a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4022:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40225872E1474908AD540A52C1A99@AM6PR08MB4022.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ICLMOct1s5tKWFvE2sZ0w6gVvbsDrcwQMqcH3CchS97aUBXTIE1XPS6L5GUrSawyAM8SUR4ydULaiSS198zH39WoJsSyszKsZ04AjFqh6Cqzwb0U+VGjMQYKTktj4W+7Wmjy6hGLp7svK1yi6S/iuwq3IpGPoHAls+wepL8g6YYhs6GSuEGSa2OZ/mvpX0quYAmUgHdbOkrA199R8eUcKOo2GEN43/aL/taxIb3buMZbnUjYAXNsYwRPrLADqVortMM8Sz01yrXoWgWPeKoGHBxPrdMehEdOHJm8XBEQQHur2aF0FeaXFYbduH9Ui1TVWY5UMj00Qk9ZXjz1OkpjFEPds2oJDmLOCA1RVn9i+RhpiEz0dF4JAfDvKAQiC5L0lCT3zdlwmnRpZgVMHkT24Du17tP0+zBR04JMhIPLfvgREw2yQXPgZd+uCEcvpH4y2wJMv6klc/ifn5gIEWjWlB4PngdUbJ6aJTiDOJlqwqtHySQhsXdhm0C2lc43bwJ1BCG7H3TWCAXMnZPUxe2TmI7h46sUySIthRlw2Ef1tKc+sU9ghEUc5m21tcR6jHJDDX2LwkYN+8/v2EUF/4d4tzF1rnEaNMkCcJdI90uxS8Cvl4tfNdoYYQJg7CSBqITliriFR6kIM/BQS/47ZPEHlZzsSqULc8dlCygM9dw+6rzfIIqo/vCPZiTmRhbWxRt/um2AVfihg/2XfLbhQpvyWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(38350700002)(38100700002)(8936002)(956004)(52116002)(6916009)(8676002)(6666004)(6512007)(26005)(6486002)(2616005)(1076003)(107886003)(2906002)(83380400001)(4326008)(508600001)(36756003)(66946007)(6506007)(316002)(66556008)(66476007)(186003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hk9AnSQiuGGFHQ4Tuh18nrGZpH9ZxHcNcO6ehKtO4ltZN47t6wIPBXe/AhbO?=
 =?us-ascii?Q?ytKvf4U1GlBlDokQSgj8m7MYVCo8glzTC4pMr1tBgUjE+9JwU/C1+qSNlN4r?=
 =?us-ascii?Q?WBXccWT+61JTIrEqGTeREoOuvpkHdLpaeMcsVVki9hhHDsrRekbXxmxesyeV?=
 =?us-ascii?Q?IxQlSfB9I+w7ODzJ2/bNvehuN4mal2Hd26ROIie1vkJW79bvF4W48btmwUQQ?=
 =?us-ascii?Q?jiqLSQ3pmZ0k052tTBieDjv4QfgkI4fgCC9M4OoWAMpVARlLpfmQXTQHtYJ8?=
 =?us-ascii?Q?zGBRjdGgEko1ut8L2yaTNYTro8J8f9NpfbGnvWjo2W9SXmQ6SqPamJMwS6XV?=
 =?us-ascii?Q?7UcHdyfJwSbZDKCRjACzicNYd4Ftr90SF+vDAVCfJUSwqM8Qz7kZK1TZssuR?=
 =?us-ascii?Q?XBm3486PYyrObGtporI2mJ35z1eHNpns0MvGb5N6A4jDa4cdNfwttSvXiuUV?=
 =?us-ascii?Q?isSNauGRR7sGMvzfE2Np7jzD4UgET8vY5gqpx3qMKS1AJT5bWolyX5fJTe5x?=
 =?us-ascii?Q?L6dmBg+/73adLF+qGIO2tOP4NTgorh6c+xQKiVTahiin0VninleTnz/Q7AqY?=
 =?us-ascii?Q?HHDeaMLJB2j2HD/sp+IjU24UEwDHMtjfJyXeGRPx605LDF9/JTTgVUHQ1oW7?=
 =?us-ascii?Q?hXb3jhigAoqgoN0TYTTxduxypcgcDi0VOatKvQ1rqXSgtwztMdOvEjVXM0iW?=
 =?us-ascii?Q?vdEhhqGoCikTrM/9LbJDDtFZfIfOsU4dhHrpDf9lHVwgV/p24rbnzcy/uUPG?=
 =?us-ascii?Q?YBq39UGih4FKHACcQQ68xOvMEduMkBJ7wNgkIb4WcR3yiR6fZ/TwMeQsnkgL?=
 =?us-ascii?Q?LMQ7hlsXOl8Q8o+mxaJicrbooOENlusCo997FfTx7/0hc9mhbsKw+GLIPoDj?=
 =?us-ascii?Q?7oq29ujSiSAdBnJh6xf0rcPo4gFlxLuuymr2rFevJgwjuBPnNirq4j/+jWN8?=
 =?us-ascii?Q?bgbNwrAG1Ls61mp7ev/VujV1H1+kbOzpsIQcen3tsafDr04P4yr6eDUJFbs9?=
 =?us-ascii?Q?QdOaNQrijaykOOsr//c5Mdcm0ZmQXzDM9IdhDvphEK2l7S/VxAooDaVyoe1O?=
 =?us-ascii?Q?LVkc+wuHCni7+ZXQOqjH47utpQfbUMht054FSHSdw1ECqerlBW4ZKYkSyySk?=
 =?us-ascii?Q?l/YTIt7JhyIn39qb732rRGD5hfaqCs6uuYnSFNPyDTHj/MvdR/V1B4Nz9BqU?=
 =?us-ascii?Q?8gYIeipw4/4UpgALXenIJfEIdisYUQuz0296gLd958CLoVrmEtmcOee7N5mf?=
 =?us-ascii?Q?aUl7IoNDd765Nw8LiEK6f927UqjRSVxzTVzppRnCt9dUQjPgFmAHzEdb5n8M?=
 =?us-ascii?Q?x+1vroJqISfX7nwEpEu9+DSU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f9c64b-428f-48be-4084-08d9834de54a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:34:43.3529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1CGxsVegO3Z3I+WMycMnpkdyU1kFAkYBU6DHRqj8tjXas4dUMAMZyIam/JsQbvqdE6SNIzZsKe411YqKk6v2WJrLBZuJPPp0Cq41T1mnuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4022
Received-SPF: pass client-ip=40.107.21.104;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's detect block-size automatically if not specified by user:

 If both files define cluster-size, use minimum to be more precise.
 If both files don't specify cluster-size, use default of 64K
 If only one file specify cluster-size, just use it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/tools/qemu-img.rst |  7 +++-
 qemu-img.c              | 71 ++++++++++++++++++++++++++++++++++++-----
 qemu-img-cmds.hx        |  4 +--
 3 files changed, 71 insertions(+), 11 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 21164253d4..4b382ca2b0 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -170,6 +170,11 @@ Parameters to compare subcommand:
   Block size for comparing with ``--stat``. This doesn't guarantee exact
   size of comparing chunks, but that guarantee that data chunks being
   compared will never cross aligned block-size boundary.
+  When unspecified the following logic is used:
+
+    - If both files define cluster-size, use minimum to be more precise.
+    - If both files don't specify cluster-size, use default of 64K
+    - If only one file specify cluster-size, just use it.
 
 Parameters to convert subcommand:
 
@@ -390,7 +395,7 @@ Command description:
 
   The rate limit for the commit process is specified by ``-r``.
 
-.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat --block-size BLOCK_SIZE] FILENAME1 FILENAME2
+.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] FILENAME1 FILENAME2
 
   Check if two images have the same content. You can compare images with
   different format or settings.
diff --git a/qemu-img.c b/qemu-img.c
index 79a0589167..61e7f470bb 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1407,6 +1407,61 @@ static void cmp_stat_print(ImgCmpStat *stat, int64_t total_bytes)
     }
 }
 
+/* Get default value for qemu-img compare --block-size option. */
+static int img_compare_block_size(BlockDriverState *bs1,
+                                  BlockDriverState *bs2,
+                                  bool quiet)
+{
+    const int default_block_size = 64 * 1024; /* 64K */
+
+    int ret;
+    BlockDriverInfo bdi;
+    int cluster_size1, cluster_size2, block_size;
+    const char *note = "Note: to alter it, set --block-size option.";
+    const char *fname1 = bs1->filename;
+    const char *fname2 = bs2->filename;
+
+    ret = bdrv_get_info(bs1, &bdi);
+    if (ret < 0 && ret != -ENOTSUP) {
+        error_report("Failed to get info of %s: %s", fname1, strerror(-ret));
+        return ret;
+    }
+    cluster_size1 = ret < 0 ? 0 : bdi.cluster_size;
+
+    ret = bdrv_get_info(bs2, &bdi);
+    if (ret < 0 && ret != -ENOTSUP) {
+        error_report("Failed to get info of %s: %s", fname2, strerror(-ret));
+        return ret;
+    }
+    cluster_size2 = ret < 0 ? 0 : bdi.cluster_size;
+
+    if (cluster_size1 > 0 && cluster_size2 > 0) {
+        if (cluster_size1 == cluster_size2) {
+            block_size = cluster_size1;
+        } else {
+            block_size = MIN(cluster_size1, cluster_size2);
+            qprintf(quiet, "%s and %s has different cluster sizes: %d and %d "
+                    "correspondingly. Use minimum as block-size for "
+                    "accuracy: %d. %s\n",
+                    fname1, fname2, cluster_size1,
+                    cluster_size2, block_size, note);
+        }
+    } else if (cluster_size1 == 0 && cluster_size2 == 0) {
+        block_size = default_block_size;
+        qprintf(quiet, "Neither of %s and %s has explicit cluster size. Use "
+                "default of %d bytes. %s\n", fname1, fname2, block_size, note);
+    } else {
+        block_size = MAX(cluster_size1, cluster_size2);
+        qprintf(quiet, "%s has explicit cluster size of %d and %s "
+                "doesn't have one. Use %d as block-size. %s\n",
+                cluster_size1 ? fname1 : fname2, block_size,
+                cluster_size1 ? fname2 : fname1,
+                block_size, note);
+    }
+
+    return block_size;
+}
+
 /*
  * Compares two images. Exit codes:
  *
@@ -1535,14 +1590,6 @@ static int img_compare(int argc, char **argv)
         goto out;
     }
 
-    if (do_stat && !block_size) {
-        /* TODO: make block-size optional */
-        error_report("You must specify --block-size together with --stat");
-        ret = 1;
-        goto out;
-    }
-
-
     /* Initialize before goto out */
     qemu_progress_init(progress, 2.0);
 
@@ -1589,6 +1636,14 @@ static int img_compare(int argc, char **argv)
     total_size = MIN(total_size1, total_size2);
     progress_base = MAX(total_size1, total_size2);
 
+    if (do_stat && !block_size) {
+        block_size = img_compare_block_size(bs1, bs2, quiet);
+        if (block_size <= 0) {
+            ret = 4;
+            goto out;
+        }
+    }
+
     qemu_progress_print(0, 100);
 
     if (strict && total_size1 != total_size2) {
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 0b2d63ca5f..96a193eea8 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -40,9 +40,9 @@ SRST
 ERST
 
 DEF("compare", img_compare,
-    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] [--stat --block-size BLOCK_SIZE] filename1 filename2")
+    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] filename1 filename2")
 SRST
-.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat --block-size BLOCK_SIZE] FILENAME1 FILENAME2
+.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] FILENAME1 FILENAME2
 ERST
 
 DEF("convert", img_convert,
-- 
2.29.2


