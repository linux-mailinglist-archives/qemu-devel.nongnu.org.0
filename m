Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F16435EE6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:19:34 +0200 (CEST)
Received: from localhost ([::1]:39632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVAb-0000Vb-U1
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mdV4M-0001WT-32; Thu, 21 Oct 2021 06:13:07 -0400
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:9813 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mdV4K-0004tm-97; Thu, 21 Oct 2021 06:13:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+netkgJSzQ9ABt/lbhi+hsDL5wHQzgjlZIgoHQfSJgExIa3uwYxv2ELRfAeUOM0HoMW4r8ZA5Ws8GuhK7EhRNbX/h1zwtJEkpaeJcvpSDi60GTHMTEXRV0snaZb0VwMjUSCUCH07qbTvSAMtusfhiNWp1Dy1L6o0VSS5izb0Sfxfx+v2hfwpg5rIxsjPO8iWi/yzQMb6WH3HbsHdpKMhvBMaJmBn9DsExTpbqRRmIrbW1VcN5F8uIlHNCE7+/PS9O3eay7ab139caarsy8hrmhsUQ4sium6AgLATIjbazeQyU9Qp9PCk3YMMBzBH6ORrgnDeQvClThfSEaVRQIXlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZES3V0I3qH+wY8LA5Lyg4RbD+pwh+emf+WvSTn97TAk=;
 b=OuOnDfx5f1SoN7KAPwYR9hQ6mxyZZpOPdcD91bvaTmj2ngQV9qtrmyrrg6gC6aw9HNQ/ZVfTzro86ScUQ7lz7yZlWBGskWlDMcehPqs8P6ZSGPlA99H4n/fMd8FPIRyTjBxULXNNV4A93eMcM83S0ZCWCFyTke3hfUE1qtwNtpx2go/en5ZCoXXrbQuk21CLZFmFHPlUMxFJdoMHh5LoHTUVcV4Mmy3qQ0SppGKxwlG87oroRT5hEKOy07A49If7in4aExnhuUKfPZX21pzT1GuPEZzW9HcUQSBNaMclxxQJ+kdvmf8Pr7M1vrTLX0scR7YkDvJgAD0D0t+STCGAGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZES3V0I3qH+wY8LA5Lyg4RbD+pwh+emf+WvSTn97TAk=;
 b=BwEYU5VC2ZV6p0dvX6gHSb33bOExCzW4yTbGsq7Axpq5xcKE1QbX9lXRvmkuhcwluuYgc5lMdLbMqEzVMq2FMy3zphFjsoDEQIA9Qb49vAOQcf70qoQ+eGIj6APtODZAYRXVATEzd9ZWklR7v+80XBI8zmeXLj2LjIGqpYF320U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 10:12:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4608.018; Thu, 21 Oct 2021
 10:12:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 nsoffer@redhat.com, eblake@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 2/4] qemu-img: make --block-size optional for compare --stat
Date: Thu, 21 Oct 2021 12:12:34 +0200
Message-Id: <20211021101236.1144824-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
References: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0080.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS8PR04CA0080.eurprd04.prod.outlook.com (2603:10a6:20b:313::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Thu, 21 Oct 2021 10:12:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ee069d0-7432-43c7-63bb-08d9947b551e
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-Microsoft-Antispam-PRVS: <AM6PR08MB50780309F0EBDB541BA373DFC1BF9@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ceoMOXzySKLU1gwWNOys0A0J9/UmdKUgEt+WNLVNoIoSSlD+wKiJTP8b7BLzY3lhTBiBfqQA5irumcUxTA/dascicbCv15sR7l1VAW6852qYt+EN9ntFkV5gn4dG4fprNEMKZs6pqZZk1g4s2F/Go1FeJ96mtqiAk3V4voSWczkkHx1hY87xcsyFEvWFRh9UG6OQFLhepEf1QJigHvTpW8h4nMDT6UzIZKhSsn9EdKRkhaiiJAJ1p4nZpghqRKPaDYQ1V1q0fWkvwHz8yqx7yd2WcM1XMSqcgMh1jrgFN73SOb/HM1o4uOsXL5zs+oZxMX6oNI2pFjLWFyPBGc2ZvbVoXFMmFC2EnHbP4V32QcH0cruXRH6xrydHQxOG4bsRTM28jnLbay8K3Gy1QptOJt0Go1o92TWqjjy81cWH8U7O/O33kPXXBHAsectS46YII1OQq4yGo6BidHttLlZDF2yfRAmcCoM7zBGdf2vty6QioUGPPyUFvUz4IRRLF+PPVWv9tnfy5b7VLgY0kSeIIZPlaOW1+gHXxAMprq0NBD6hkJcLCYH8oFUlXSVNbObJb26rZnQ2pPuVpalJ08B8CxBFeWFVFB8yelZnUQiuqbvgEcDPoDaRX1uzoKLOFbR4kB95+JyWbDtMkMOqnEo7h8izkj/UE5XYrMLwaS8B6/HpEF3KUcbmYJ6IO4TPHfluNdQyQNIGXNwZ9uKy9IuneA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(107886003)(956004)(66556008)(508600001)(83380400001)(66476007)(6486002)(66946007)(4326008)(86362001)(6512007)(6666004)(6506007)(52116002)(36756003)(316002)(5660300002)(8676002)(186003)(38100700002)(1076003)(2616005)(26005)(38350700002)(6916009)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XtwfxivBrqMWDgvTlvTR0i7tFFyg67vvY48XhWdBRRlDW7JvqLfsAyIKMheH?=
 =?us-ascii?Q?SiS74niLyTjwRKTxXM8Irlo+Mog92LieeO31oLF5ZpcG3JmGdwBXtjxSi7Qt?=
 =?us-ascii?Q?M35f20qkuh3duJv9vwp4L8qV1LTZVSKMw68PTSJ2KGNUo0b7MjuDOdI6zISJ?=
 =?us-ascii?Q?Mn2HQnO/M/VSV/uNKm3ngObFbS2BfWtcCEzI1cD+jWlZGMMu9uSwmgneiKEU?=
 =?us-ascii?Q?YgsaAzoHsWSMEO3C1kYPAUIaqEo9gnVxEFkaQ9FfLfCsx5tggjziNtv5yKff?=
 =?us-ascii?Q?8O4pSMGizwLpeDawdFHKy9XtfTkYm2vgZjsiFuxhGzPnTDMT3Zt1U8tsbAmR?=
 =?us-ascii?Q?egUwOTZoM/JpZaaP/gKFeFo9Mnupbq2spi0keRsv3mZ7t2Dge9MrVxFR/rpj?=
 =?us-ascii?Q?o07bExdk9tqD1aAwmImfLbSOcSbVT8+pppPoToBcyQ2jlB+TYZa34FCYHa4S?=
 =?us-ascii?Q?iiJOlU9AsARabCC1yN5981FxXzWFc5a8M8zDPmshCl71AnZJIl14GKrhsXQk?=
 =?us-ascii?Q?IyeLbAhw1mWNg3zv8ZJ4XG75cRDosWYbJ+7QdWKm3a4zH6vLazGU4wfX9MzK?=
 =?us-ascii?Q?RasiKhJqTyQIXU0p9ZtuZWdeEc4gaE1CctC16Cy5dDGLJCnoClGH8X87WoMO?=
 =?us-ascii?Q?pYxYdyQTGIvps/LKv8+H50mj5PIj2pMwO0mSgnW+EEUA+6hoePNGiOd0lryj?=
 =?us-ascii?Q?Ha/IpOSIm8Bm49k79Dv1+QbYqrI2xd0ODYqhIi9EmwFg1ukoiPh3LPA64YFY?=
 =?us-ascii?Q?clKArlisS693/87mMVz7V5OSxyELIUng6QF1Vg/AWAocbjEx6Iy/AHuzjtt3?=
 =?us-ascii?Q?LRQhAb8a6EtjX/kcHRCsscZ2Bbh3uEyJPfglG9a0KCkdD4PcfFE+QHtLPYnB?=
 =?us-ascii?Q?IclUSLhB1m0bdlbcQmC13/trTNpfGVF2UKmr/sL5STVXU0HmZ70Sp/rRCzPO?=
 =?us-ascii?Q?qIRvuI3yJ4ichIBpUhnmZo+OUAtvBn9gtFD5jbZ2eHHJZiiWxilYDn8IPj0G?=
 =?us-ascii?Q?NhXN1CxsCnidz2j1TC0ak/pWUrdny3ZsYdjMhOw3sg4wGt0HoNmE6+V1Qy/2?=
 =?us-ascii?Q?BCMQTMpXuakBgS8TYgO19fBr/ejayj+K5GzrlraKijkjzaVVY72J2Yp6jBAc?=
 =?us-ascii?Q?B9MNdadqmWwHSzDbrbgg2ipyFjZ6u/hNoHPjxWI/WBq6UzWMWfMbMS1P0azg?=
 =?us-ascii?Q?qiYlZKiHtQGIBzcMyr+DfLuGreYgjn6QpbjPTMuw+r8CAjtLdHSbDkG73iBD?=
 =?us-ascii?Q?nYEV1vZU8pgfzVGQgOy2/OMWfQhZR+OXXDn2xMDBfIg72YE1s+DNY5rcDegF?=
 =?us-ascii?Q?TifaXSeEM8Hsftr5cBkh5e38Cmu2F7Q61OsDZ14K3ucvsHPapQ4nvQEYKt9U?=
 =?us-ascii?Q?TVDJFMNFf39Fz3eJcLgzweaXZx9K6ur5X8+rsnipVNxZqvot9Clj/WXDBtMf?=
 =?us-ascii?Q?QF22rytQOXqrzrcXU7Q764a++13+MCcW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee069d0-7432-43c7-63bb-08d9947b551e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 10:12:48.1152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsementsov@virtuozzo.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.21.114;
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
2.31.1


