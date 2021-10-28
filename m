Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DD943DEED
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:32:51 +0200 (CEST)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg2iI-0006U0-7A
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mg2al-00070W-Al; Thu, 28 Oct 2021 06:25:04 -0400
Received: from mail-vi1eur05on2139.outbound.protection.outlook.com
 ([40.107.21.139]:54305 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mg2ah-00020f-GB; Thu, 28 Oct 2021 06:25:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMrfsmVSJKFJwJgvZXTDmQWI9SGvnFW2ZXb9c9mbpgyWtUfkX/N10RKt44b4ZBtNe7s6uQ5JIBAUsSRlR3Ju7MgfqZrcKOefTcGHCJOjm8XDHv7EybEo9Kq5BxE/mC/tmBwjuIAIljsjxLxUNS6QQofK/oLJCg3CHfCMW/sZCrXkxNmfX+275sk+axxAko/KrDSxhiACIHZA0fw7nGO7yE+6EMw2DmYP+RxZWa1Am3zEZL2jX08gsmpxgAiTYSpNpHwf7TZ6e2cvkwHDwiEo0H7H31+faZFNQz1K7tr6ZJVXL0+2E0Hv61uHBrsObKP0Ctkof6uL8i2x4OBOv5QpSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKlnb3WejXs3v7erbph9w/xwd0NGzspMe3y50V1kA70=;
 b=Doy4lFy0ghEzsgDPEuVCfBkgxrg9DmR3rVe9ZghTQGJdDLQ7fc6jyPV7YPE0k2tFWrwIYsceonESLXAQrvGilNgNwbsgyJsEK8u+mP0ur4PG/Ywj4+bIIhxDTjraNePBvE5CKEQ7Gk6f8p9HjzJKgo2PFKg9a4HZkAho4pQqCzYlEGZ7UOk6N7RxfOQDJGfH+M5NvxKm7icMczsnoIFp+VjGMsHvtvPsPpxdCKfdMs6+DAc2hf+XgR5tUpPVh6DGl2cSTW3ClJPdrogIxdcDTRoWPY3G1yEF5phYeur1odiO8PKN0Y9JhkInKSdyIapUYCgrx/thRsMT0CH1MnU14Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKlnb3WejXs3v7erbph9w/xwd0NGzspMe3y50V1kA70=;
 b=WorzS4Hcl83+DvfQ3+YVCfQhKjXphCAyQOZnOhwumGssOrhaXxHlqZ262pjkvMdjwzwtamn9C9t3wV+y32ZM9Fat15vFaX6a0SuF0sh68Cq4rkNmihYYf0ug742loY7f3SqszEGlScGVpYVrP375zLRDu49I5fqMiOKcZkQNPgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4535.eurprd08.prod.outlook.com (2603:10a6:20b:74::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Thu, 28 Oct
 2021 10:24:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 10:24:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 nsoffer@redhat.com, eblake@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 1/4] qemu-img: implement compare --stat
Date: Thu, 28 Oct 2021 12:24:38 +0200
Message-Id: <20211028102441.1878668-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028102441.1878668-1-vsementsov@virtuozzo.com>
References: <20211028102441.1878668-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0701CA0053.eurprd07.prod.outlook.com
 (2603:10a6:203:2::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM5PR0701CA0053.eurprd07.prod.outlook.com (2603:10a6:203:2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Thu, 28 Oct 2021 10:24:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b8d21a8-7081-4c24-ca9f-08d999fd2e09
X-MS-TrafficTypeDiagnostic: AM6PR08MB4535:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4535D612D7516BCF96CB3953C1869@AM6PR08MB4535.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:134;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sQcW0K2cmV4fiOYBzCzyxdhM3+tCyEzbmBANFctqKmlCQEMy4rvA14CMnVn/2ADw8uaJPDDf/XhnkwOf3VPFMtgH4eCZ2kwKpQ+3pBolSWrA63178oPruS6GIR+jIPzFsgteaJPut1ZlxapN0hikr6Yo6RG355bf5xiATPcVYeMByfE8tN3yq8QM4l/jlVBSmiz354DePyW8lLtzeAdGizkbcttMpgjHtqjtjckvQj+8EiJhhpzoaTqhSRgGIDTwsqTF2Q1NnDSM/9FTNUOxlu3jcaVgLnzDuGalseVrwEdEg8Vq8mMmVGkktoSfi8Hzeviz39LQXtCAehb6ydd+afqfUHPX1Ju6iDMUaQ0t59I3QYduDFjbgpUed/xXEWVEgvPA/93qpbXtVJSF5j32JB+Qv5N2Rxa/GhYWY+UOBqV/CBSNGXVeP7va1GApRH6qxLNw8ex8AwGujFO1PIJtGktF3Egv81UTqY3VZl5zQs1C+U4r3IQ2b8kbNG+f52WKc8pNdSJd85X7Rj+shCX/W9glIX0bwOhG62NwQTGbsQ9Nb+xRYkemUXWLAtVaLyxqZln7w859ylFn8tJ/595ENqE1r46BxJi+0xJMqEBJ6a9Cp2fBoOezfW53Bf0h3QIHxwXZ949cDKlQTRJG4KJkgWMP+zEWJ/gTkLPiSC7pc2jg03X5qIPv07tVc8rKzprRE4E8ve12MprHXnLX9Pv9Dg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(30864003)(6506007)(508600001)(66476007)(66946007)(40140700001)(52116002)(83380400001)(107886003)(66556008)(6486002)(8936002)(316002)(36756003)(6512007)(5660300002)(86362001)(186003)(38350700002)(38100700002)(4326008)(26005)(956004)(2616005)(6916009)(2906002)(8676002)(1076003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LNOfKNrPXLcmnfmmN7Xq17o0P4+fAXV8RS+dFAqg+jogQQeVG/x0AztLiazI?=
 =?us-ascii?Q?nE4Oxjtshko3uD9msSsTC/eVOQCH7FOZ2uL1odocaJCwx3YYHzrwMIMfi699?=
 =?us-ascii?Q?VMT/RuV/jZ0LqsCGA8MprSCpYK1Ph5H5NiDpPA30zDqSg8nfjorz0cVAXHTN?=
 =?us-ascii?Q?xRwNfc4lWRrk3hNyjIjb/zTT/wafXLZR0OclrutuTfdRWTn06B44MiYgNiYr?=
 =?us-ascii?Q?tm5DSpEsG26EvuVl+LonxDgJMppd6VmJ1ExDmpY7rz8dysAYv4hzuKu9NnLq?=
 =?us-ascii?Q?F8TV0thsyc49avAkdLCF/Cuv/sEMI/vyVVocRHKHKpVLyVaRFV2GjXhsdfbn?=
 =?us-ascii?Q?k0esirqAEVbqYBK6RqcJDChGR7voBKL/ZGrZhq6vOv1NtuNTOAlbM7NYAg3k?=
 =?us-ascii?Q?Gef1U5E8AAbUivBfXhoqapC8rtj7TNYFEHVOai24LCtWln0EFL0y4Co1F1HR?=
 =?us-ascii?Q?qkRVkDQZrJWpPrf3/RuJw6RgFSSNTVORmcsLfDoi26hXqh792336VFHXMsWl?=
 =?us-ascii?Q?HIKA0hieqgfaaC+bxNfYIf8FS3V71Uj1qD5M9s8vKQp1i6h4htRQ68iU3ErD?=
 =?us-ascii?Q?H+LwKR7p5t7B2p5Ts7Ed41Nt2GfqY53A3/1TBwYlgVWv4uZT4ExnR9xxkDrW?=
 =?us-ascii?Q?sBPDQOeaGdxseJ/7A/pQTE1MZvn6KNIDPah/W796Rmbus1io9d259CgUkof4?=
 =?us-ascii?Q?FRCXYnX04c4ph5yeVkfubRH5Prh85DqyVkzNQzcLRSD9y1XmEshaU0DUI0S7?=
 =?us-ascii?Q?hTjhxO+g92rdQvrc9QhSfbDD2ZKralVtwxrD4IBBzgRQtJxL8UqDscwM4WM8?=
 =?us-ascii?Q?u1uTnqwxMvMOoOQynjKBCl8XLByt9G01nn1DXLnm2SerapIcNQfjqCga6fEC?=
 =?us-ascii?Q?LFTTjKI91OEu0L4f/nz8/GTcytlQfWU7GWnSs6l3vWDshLQ/pp3AmGqy0f0x?=
 =?us-ascii?Q?Orb8fche6hzTxrccaMgrwau6oq8l+XKQxSki1a6IJCII59AJx/A/cxugl/Y7?=
 =?us-ascii?Q?CVcz3UNgfMKl3jCGYtt1/F0EGjqatF96uBSb4F5n+QMakjec/M1BUOMza4Wo?=
 =?us-ascii?Q?amn/rDd5yAnqb4F+21aLQL5ESCIjloY2wIqJynBhyGSoJckR0wKRdsSSiPoM?=
 =?us-ascii?Q?knW2bwdB9jGjn7HRJYDEB0Dr9C4T0l23IZ0PbycemkoABir+/6b8BZ22o0Qa?=
 =?us-ascii?Q?E1YOys+wfnpZsSA5hWVX2aHSd6aA2tq2uB2M0YEporXcp8o52q8ndijfk8oM?=
 =?us-ascii?Q?516p9F25AYlL19T9BMy1+HZ10eEasVRhflIcxz2yMJpNpxii/LGsaHsM99/Q?=
 =?us-ascii?Q?/ZoUrvpWcnpDzX0I3c/cC0nsgHjQyWUjlG3TMlBPf28sHwL3IIorX/7WfLs8?=
 =?us-ascii?Q?ZzKEuG4wEMM7/HwDpMi8yGFt10ipwaL7UqQOlG2uzjT3V28TCxLIoXOMtrBQ?=
 =?us-ascii?Q?OSx2VSx/U+M3nweNzSS4eySH1u11jvVlpJN4gd6TbiUlbqxuQb/s1OOuCdgQ?=
 =?us-ascii?Q?imsJHnV/45O4zr/k1TpdqPsNG92KqcZtOSKajryt0K6SxfH4gDSDcxrMMSDW?=
 =?us-ascii?Q?TiMdzVBc90QShWiphOZt7Osqe/Jk5993RFMuiJ1SdFmZxGhpB5aqj7itTvBb?=
 =?us-ascii?Q?2Y89XcE3fmDMcN1BlINYcRccpELZLfa9uznepQmwqYWw+P4wj41/Bvya11Ko?=
 =?us-ascii?Q?t+2law=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8d21a8-7081-4c24-ca9f-08d999fd2e09
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 10:24:52.9218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRmHtBh6ftJwHakcpwS7cotvEASdgd4sWJeV1yKbp593+IRIpfTEUXGnQo5+9ncaOa8FWRLfQM+iMXRB+dXaeO+OVLL0Em5b8IhMkAAb4aM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4535
Received-SPF: pass client-ip=40.107.21.139;
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

With new option qemu-img compare will not stop at first mismatch, but
instead calculate statistics: how many clusters with different data,
how many clusters with equal data, how many clusters were unallocated
but become data and so on.

We compare images chunk by chunk. Chunk size depends on what
block_status returns for both images. It may return less than cluster
(remember about qcow2 subclusters), it may return more than cluster (if
several consecutive clusters share same status). Finally images may
have different cluster sizes. This all leads to ambiguity in how to
finally compare the data.

What we can say for sure is that, when we compare two qcow2 images with
same cluster size, we should compare clusters with data separately.
Otherwise, if we for example compare 10 consecutive clusters of data
where only one byte differs we'll report 10 different clusters.
Expected result in this case is 1 different cluster and 9 equal ones.

So, to serve this case and just to have some defined rule let's do the
following:

1. Select some block-size for compare procedure. In this commit it must
   be specified by user, next commit will add some automatic logic and
   make --block-size optional.

2. Go chunk-by-chunk using block_status as we do now with only one
   differency:
   If block_status() returns DATA region that intersects block-size
   aligned boundary, crop this region at this boundary.

This way it's still possible to compare less than cluster and report
subcluster-level accuracy, but we newer compare more than one cluster
of data.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/tools/qemu-img.rst |  18 +++-
 qemu-img.c              | 210 +++++++++++++++++++++++++++++++++++++---
 qemu-img-cmds.hx        |   4 +-
 3 files changed, 216 insertions(+), 16 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index d58980aef8..8b6b799dd4 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -159,6 +159,18 @@ Parameters to compare subcommand:
 
   Strict mode - fail on different image size or sector allocation
 
+.. option:: --stat
+
+  Instead of exiting on the first mismatch, compare the whole images
+  and print statistics on the amount of different pairs of blocks,
+  based on their block status and whether they are equal or not.
+
+.. option:: --block-size BLOCK_SIZE
+
+  Block size for comparing with ``--stat``. This doesn't guarantee an
+  exact size for comparing chunks, but it does guarantee that those
+  chunks will never cross a block-size-aligned boundary.
+
 Parameters to convert subcommand:
 
 .. program:: qemu-img-convert
@@ -378,7 +390,7 @@ Command description:
 
   The rate limit for the commit process is specified by ``-r``.
 
-.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] FILENAME1 FILENAME2
+.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat --block-size BLOCK_SIZE] FILENAME1 FILENAME2
 
   Check if two images have the same content. You can compare images with
   different format or settings.
@@ -405,9 +417,9 @@ Command description:
   The following table sumarizes all exit codes of the compare subcommand:
 
   0
-    Images are identical (or requested help was printed)
+    Images are identical (or requested help was printed, or ``--stat`` was used)
   1
-    Images differ
+    Images differ (1 is never returned when ``--stat`` option specified)
   2
     Error on opening an image
   3
diff --git a/qemu-img.c b/qemu-img.c
index f036a1d428..0cb7cebe91 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -83,6 +83,8 @@ enum {
     OPTION_BITMAPS = 275,
     OPTION_FORCE = 276,
     OPTION_SKIP_BROKEN = 277,
+    OPTION_STAT = 278,
+    OPTION_BLOCK_SIZE = 279,
 };
 
 typedef enum OutputFormat {
@@ -1304,6 +1306,107 @@ static int check_empty_sectors(BlockBackend *blk, int64_t offset,
     return 0;
 }
 
+#define IMG_CMP_STATUS_MASK (BDRV_BLOCK_DATA | BDRV_BLOCK_ZERO | \
+                             BDRV_BLOCK_ALLOCATED)
+#define IMG_CMP_STATUS_MAX (IMG_CMP_STATUS_MASK | BDRV_BLOCK_EOF)
+
+typedef struct ImgCmpStat {
+    /* stat: [ret: 0 is equal, 1 is not][status1][status2] -> n_bytes */
+    uint64_t stat[2][IMG_CMP_STATUS_MAX + 1][IMG_CMP_STATUS_MAX + 1];
+} ImgCmpStat;
+
+/*
+ * To denote chunks after EOF when compared files are of different size, use
+ * corresponding status = -1
+ */
+static void cmp_stat_account(ImgCmpStat *stat, bool differs,
+                             int status1, int status2, int64_t bytes)
+{
+    assert(status1 >= -1);
+    if (status1 == -1) {
+        /*
+         * Note BDRV_BLOCK_EOF: we abuse it here a bit. User is not interested
+         * in EOF flag in the last chunk of file (especially when we trim the
+         * chunk and EOF becomes incorrect), so BDRV_BLOCK_EOF is not in
+         * IMG_CMP_STATUS_MASK. We instead use BDRV_BLOCK_EOF to illustrate
+         * chunks after-end-of-file in shorter file.
+         */
+        status1 = BDRV_BLOCK_EOF | BDRV_BLOCK_ZERO;
+    } else {
+        status1 &= IMG_CMP_STATUS_MASK;
+    }
+
+    assert(status2 >= -1);
+    if (status2 == -1) {
+        status2 = BDRV_BLOCK_EOF | BDRV_BLOCK_ZERO;
+    } else {
+        status2 &= IMG_CMP_STATUS_MASK;
+    }
+
+    stat->stat[differs][status1][status2] += bytes;
+}
+
+static void cmp_stat_print_agenda(void)
+{
+    printf("Compare stats:\n"
+           "Key\n"
+           "D: DATA\n"
+           "Z: ZERO\n"
+           "A: ALLOCATED\n"
+           "E: after end of file\n\n");
+}
+
+static void cmp_stat_print_status(int status)
+{
+    printf("%s%s%s%s",
+           status & BDRV_BLOCK_DATA ? "D" : "_",
+           status & BDRV_BLOCK_ZERO ? "Z" : "_",
+           status & BDRV_BLOCK_ALLOCATED ? "A" : "_",
+           status & BDRV_BLOCK_EOF ? "E" : "_");
+}
+
+static void cmp_stat_print(ImgCmpStat *stat, int64_t total_bytes)
+{
+    int ret, status1, status2;
+
+    cmp_stat_print_agenda();
+
+    for (ret = 0; ret <= 1; ret++) {
+        uint64_t total_in_group = 0;
+
+        if (ret == 0) {
+            printf("Equal:\n");
+        } else {
+            printf("\nUnequal:\n");
+        }
+
+        for (status1 = 0; status1 <= IMG_CMP_STATUS_MAX; status1++) {
+            for (status2 = 0; status2 <= IMG_CMP_STATUS_MAX; status2++) {
+                uint64_t bytes = stat->stat[ret][status1][status2];
+                g_autofree char *bytes_str = NULL;
+
+                if (!bytes) {
+                    continue;
+                }
+
+                total_in_group += bytes;
+
+                cmp_stat_print_status(status1);
+                printf(" -> ");
+                cmp_stat_print_status(status2);
+
+                bytes_str = size_to_str(bytes);
+                printf(" %" PRIu64 " bytes (%s) %.1f%%\n", bytes, bytes_str,
+                       100.0 * bytes / total_bytes);
+            }
+        }
+
+        if (!total_in_group) {
+            printf("<nothing>\n");
+        }
+    }
+}
+
 /*
  * Compares two images. Exit codes:
  *
@@ -1320,6 +1423,8 @@ static int img_compare(int argc, char **argv)
     uint8_t *buf1 = NULL, *buf2 = NULL;
     int64_t pnum1, pnum2;
     int allocated1, allocated2;
+    int status1, status2;
+    int64_t block_end;
     int ret = 0; /* return value - 0 Ident, 1 Different, >1 Error */
     bool progress = false, quiet = false, strict = false;
     int flags;
@@ -1331,6 +1436,8 @@ static int img_compare(int argc, char **argv)
     uint64_t progress_base;
     bool image_opts = false;
     bool force_share = false;
+    g_autofree ImgCmpStat *stat = NULL;
+    int64_t block_size = 0;
 
     cache = BDRV_DEFAULT_CACHE;
     for (;;) {
@@ -1339,6 +1446,8 @@ static int img_compare(int argc, char **argv)
             {"object", required_argument, 0, OPTION_OBJECT},
             {"image-opts", no_argument, 0, OPTION_IMAGE_OPTS},
             {"force-share", no_argument, 0, 'U'},
+            {"stat", no_argument, 0, OPTION_STAT},
+            {"block-size", required_argument, 0, OPTION_BLOCK_SIZE},
             {0, 0, 0, 0}
         };
         c = getopt_long(argc, argv, ":hf:F:T:pqsU",
@@ -1395,6 +1504,15 @@ static int img_compare(int argc, char **argv)
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
+        case OPTION_STAT:
+            stat = g_new0(ImgCmpStat, 1);
+            break;
+        case OPTION_BLOCK_SIZE:
+            block_size = cvtnum_full("block size", optarg, 1, INT64_MAX);
+            if (block_size < 0) {
+                exit(2);
+            }
+            break;
         }
     }
 
@@ -1410,6 +1528,25 @@ static int img_compare(int argc, char **argv)
     filename1 = argv[optind++];
     filename2 = argv[optind++];
 
+    if (!stat && block_size) {
+        error_report("--block-size can be used only together with --stat");
+        ret = 2;
+        goto out3;
+    }
+
+    if (stat && !block_size) {
+        /* TODO: make block-size optional */
+        error_report("You must specify --block-size together with --stat");
+        ret = 2;
+        goto out3;
+    }
+
+    if (stat && strict) {
+        error_report("--stat can't be used together with -s");
+        ret = 2;
+        goto out3;
+    }
+
     /* Initialize before goto out */
     qemu_progress_init(progress, 2.0);
 
@@ -1465,7 +1602,7 @@ static int img_compare(int argc, char **argv)
     }
 
     while (offset < total_size) {
-        int status1, status2;
+        block_end = QEMU_ALIGN_UP(offset + 1, block_size);
 
         status1 = bdrv_block_status_above(bs1, NULL, offset,
                                           total_size1 - offset, &pnum1, NULL,
@@ -1476,6 +1613,10 @@ static int img_compare(int argc, char **argv)
             goto out;
         }
         allocated1 = status1 & BDRV_BLOCK_ALLOCATED;
+        if (stat && (status1 & BDRV_BLOCK_DATA)) {
+            /* Don't compare cross-block data */
+            pnum1 = MIN(block_end, offset + pnum1) - offset;
+        }
 
         status2 = bdrv_block_status_above(bs2, NULL, offset,
                                           total_size2 - offset, &pnum2, NULL,
@@ -1486,11 +1627,15 @@ static int img_compare(int argc, char **argv)
             goto out;
         }
         allocated2 = status2 & BDRV_BLOCK_ALLOCATED;
+        if (stat && (status2 & BDRV_BLOCK_DATA)) {
+            /* Don't compare cross-block data */
+            pnum2 = MIN(block_end, offset + pnum2) - offset;
+        }
 
         assert(pnum1 && pnum2);
         chunk = MIN(pnum1, pnum2);
 
-        if (strict) {
+        if (strict && !stat) {
             if (status1 != status2) {
                 ret = 1;
                 qprintf(quiet, "Strict mode: Offset %" PRId64
@@ -1499,7 +1644,8 @@ static int img_compare(int argc, char **argv)
             }
         }
         if ((status1 & BDRV_BLOCK_ZERO) && (status2 & BDRV_BLOCK_ZERO)) {
-            /* nothing to do */
+            /* nothing to do, equal: */
+            ret = 0;
         } else if (allocated1 == allocated2) {
             if (allocated1) {
                 int64_t pnum;
@@ -1523,25 +1669,37 @@ static int img_compare(int argc, char **argv)
                 }
                 ret = compare_buffers(buf1, buf2, chunk, &pnum);
                 if (ret || pnum != chunk) {
-                    qprintf(quiet, "Content mismatch at offset %" PRId64 "!\n",
+                    qprintf(quiet || stat,
+                            "Content mismatch at offset %" PRId64 "!\n",
                             offset + (ret ? 0 : pnum));
                     ret = 1;
-                    goto out;
                 }
+            } else {
+                /* Consider unallocated areas equal. */
+                ret = 0;
             }
         } else {
             chunk = MIN(chunk, IO_BUF_SIZE);
             if (allocated1) {
                 ret = check_empty_sectors(blk1, offset, chunk,
-                                          filename1, buf1, quiet);
+                                          filename1, buf1, quiet || stat);
             } else {
                 ret = check_empty_sectors(blk2, offset, chunk,
-                                          filename2, buf1, quiet);
+                                          filename2, buf1, quiet || stat);
             }
-            if (ret) {
+            assert(ret == 0 || ret == 1 || ret == 4);
+            if (ret == 4) {
                 goto out;
             }
         }
+        assert(ret == 0 || ret == 1);
+
+        if (stat) {
+            cmp_stat_account(stat, ret, status1, status2, chunk);
+        } else if (ret) {
+            goto out;
+        }
+
         offset += chunk;
         qemu_progress_print(((float) chunk / progress_base) * 100, 100);
     }
@@ -1549,17 +1707,24 @@ static int img_compare(int argc, char **argv)
     if (total_size1 != total_size2) {
         BlockBackend *blk_over;
         const char *filename_over;
+        int *status_over;
 
         qprintf(quiet, "Warning: Image size mismatch!\n");
         if (total_size1 > total_size2) {
             blk_over = blk1;
             filename_over = filename1;
+            status_over = &status1;
+            status2 = -1; /* Denote after-EOF for cmp_stat_account() */
         } else {
             blk_over = blk2;
             filename_over = filename2;
+            status1 = -1; /* Denote after-EOF for cmp_stat_account() */
+            status_over = &status2;
         }
 
         while (offset < progress_base) {
+            block_end = QEMU_ALIGN_UP(offset + 1, block_size);
+
             ret = bdrv_block_status_above(blk_bs(blk_over), NULL, offset,
                                           progress_base - offset, &chunk,
                                           NULL, NULL);
@@ -1570,20 +1735,43 @@ static int img_compare(int argc, char **argv)
                 goto out;
 
             }
+            if (stat && (ret & BDRV_BLOCK_DATA)) {
+                /* Don't compare cross-block data */
+                chunk = MIN(block_end, offset + chunk) - offset;
+            }
+            *status_over = ret;
+
             if (ret & BDRV_BLOCK_ALLOCATED && !(ret & BDRV_BLOCK_ZERO)) {
                 chunk = MIN(chunk, IO_BUF_SIZE);
                 ret = check_empty_sectors(blk_over, offset, chunk,
-                                          filename_over, buf1, quiet);
-                if (ret) {
+                                          filename_over, buf1,
+                                          quiet || stat);
+                assert(ret == 0 || ret == 1 || ret == 4);
+                if (ret == 4) {
                     goto out;
                 }
+            } else {
+                ret = 0;
             }
+            assert(ret == 0 || ret == 1);
+
+            if (stat) {
+                cmp_stat_account(stat, ret, status1, status2, chunk);
+            } else if (ret) {
+                goto out;
+            }
+
             offset += chunk;
             qemu_progress_print(((float) chunk / progress_base) * 100, 100);
         }
     }
 
-    qprintf(quiet, "Images are identical.\n");
+    if (stat) {
+        cmp_stat_print(stat, progress_base);
+    } else {
+        qprintf(quiet, "Images are identical.\n");
+    }
+
     ret = 0;
 
 out:
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 4c4d94ab22..0b2d63ca5f 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -40,9 +40,9 @@ SRST
 ERST
 
 DEF("compare", img_compare,
-    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] filename1 filename2")
+    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] [--stat --block-size BLOCK_SIZE] filename1 filename2")
 SRST
-.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] FILENAME1 FILENAME2
+.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat --block-size BLOCK_SIZE] FILENAME1 FILENAME2
 ERST
 
 DEF("convert", img_convert,
-- 
2.31.1


