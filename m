Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A11B43DED7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:28:59 +0200 (CEST)
Received: from localhost ([::1]:49748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg2eX-0001eG-Dy
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mg2ai-0006wA-Hk; Thu, 28 Oct 2021 06:25:00 -0400
Received: from mail-eopbgr70130.outbound.protection.outlook.com
 ([40.107.7.130]:16025 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mg2af-00027d-VE; Thu, 28 Oct 2021 06:25:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRBN1VU6dV6NUD02N/EiXTtKIePnkNZLD5mbkICMmLyzQxnOLgy1V3kPZ5IsWGnBLs+DoHR+vtwxhyCVQ3FYMY+bDrOdMF5eRDmLANMfpmBST3+mXq1ljZe1cSLb61iPqai3iZccsGyYGDcegofF2HlYiJB5D3cc0fO3yiGuNgGQInk+2BbpiOnucne5Xgg4lpgtBy610JPnbjrf7z/9AtVKBIY9aTiWYDkD8cEO09G6rdZuJUdCFL0k+HBlq+l5nSoPek5Rdbaetq9S3rmPmUm60BW+XpqccjjZQMKOwfNB/uJmGiesoSnVuculuDZEHM44/tED8cGjEC5kmpaFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXW36Zdt1G1RrU1iIkcGRhCs4i2tjSjk1WR0y2JI76I=;
 b=DyK+4abTOEiOoLsJswfW7qAMFGgy1O3jnrQywanTemSoi4TaJTKrmhudAzYp3soLmVOPBRKUlZr56hjBlM654+0DUlp/QTAhd+bY/Tte/2zbGZ+nCLTN6xdhXUTlH4io8Cbp+W+xAtIuoVfLEdsgTinUI+xXap4hB9qdZ+KWavv/AV79MfsZ+oyuHukskN2SW7ua85Hsr0w1KntH3XFAzg7NMAwyFenIPAfIynHFB7fFZJqtG1s69LC8SACsTXz4PHAs/CBHnlMgUbztLpkEhSKSJekyl4XHuKiJyES8AyU4gxyk5EEWLbKX5faoVWgZQGda3yx4ZTZ1wv1YydEMaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXW36Zdt1G1RrU1iIkcGRhCs4i2tjSjk1WR0y2JI76I=;
 b=v9BspaSeRyu63tRfH7jtbPTdwHjkIRcS7j0ufjbFnXdO+LUDKz6AqFgaEgOB5fyatofDANQ6KkiMi+00p1K/n/rtxo5Fj39xw04N8QVRIG5wql4DhCa7EtULeehMyuXF8F9F79u1ICzchNz2utsZCpTX8goB1AflEJRqafjc6og=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2419.eurprd08.prod.outlook.com (2603:10a6:203:a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 10:24:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 10:24:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 nsoffer@redhat.com, eblake@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 3/4] qemu-img: add --shallow option for qemu-img compare
Date: Thu, 28 Oct 2021 12:24:40 +0200
Message-Id: <20211028102441.1878668-4-vsementsov@virtuozzo.com>
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
 Transport; Thu, 28 Oct 2021 10:24:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4970497e-d4e4-4fae-1b12-08d999fd2ead
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2419:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2419A8D1EA9BC790B689094EC1869@AM5PR0802MB2419.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Stu7/4uoBsfoSHJwcU/y1OMA9t5qebxbC5i+WjUp/qqFLBGKnFqafHpwBjiBw4nKRZoTL0kT3BlZZXEfsSFYwPJltgkUUiT2UX4RgL/sVpe9+6snfsDEA7QZbJ9cbion6DXQAhlfvmxjgvRNcmZ4thAdJ1MQl+msNcDSc2wNGg8ZjTvcF7r1ag/4ycpP6ODYqoNLt2CnbXmTXbHVHHT+1gOuNZumRfiGLNpQcSYcYvvB9WYEP7X/rWtTIVa+MoC194zzYGiozcdMLCAtwExvQ+XUPP/Nw7uzfyhjYIC4zpbT0AjhrNVE2NXXFmb3SyB5IId93uj2RWd5gqe3sK2Uq+1zI+s9suKUS9aBfu+4QcR2cWf7rSE4WkeyDgz8+3/wYZH5fy40ltfhBDuEC2hSb06uFykbjxCQQInDNSptW2SU0ZL3+SveydgxJcqvXs3H/oKMrRd4NB+KkmyAWre5b3uA25yVpnzt7NZp0vpsyykcVfFAhyvS5PVK9i5HfIsd1CMY0zWzB/xSAFJEtI+kMziqbbB7EVeWcAZ8m8WALmFeXKigsTfQexRYKuodgK/vspbfIjkWDMoVd6oP0B8VCcebAv0nYvRsc5WGDbLYhlw7z6NDJE0ie36mdZxVNJW5x18HslFC7FJs6VB0a/UrkKXvpkENPnqO4NHJp7tMhNyEnhIJZRDnn43U642U7udg1cLbb2bYjOHrSJjTmNNtDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8676002)(107886003)(6512007)(66476007)(83380400001)(66556008)(86362001)(8936002)(6486002)(36756003)(66946007)(1076003)(26005)(52116002)(38100700002)(5660300002)(2906002)(38350700002)(6916009)(4326008)(6506007)(6666004)(186003)(508600001)(956004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a7SYT8NBeRB4TzIHzzd0YzLx8d1kfGV+Zfe1skzaMZtt+jnkjhuETYSbGZKe?=
 =?us-ascii?Q?so49E+rizw3XguN5p+FaAFUEWXybjMeW8CvAAkpk+7gZbKrOsV/kfbFRJoQJ?=
 =?us-ascii?Q?SpPR/ERRHElyN+rb/zhUvv3VoZR/n10+c7r5fElqwYqHhpU/uEC7zIh85VXi?=
 =?us-ascii?Q?QNiRv0lj/FjsQJ7LBhs1C6o12RAErz5PgI7FP18jz6nQnql819YM928ZrKPl?=
 =?us-ascii?Q?gQjp+4X/7FGg/zGwA43OJmkTje4AED3gBmTW1qmZDN6w+ZwE7CdWfYB+pzno?=
 =?us-ascii?Q?gDvTY0VrtqFGClMzydK3NtFyr6qtgSGACqrq6/TpDjYMpSYIJBfbutA65D+1?=
 =?us-ascii?Q?QO1/TffH7ltk6snXo8NEomhMveCYvs7LqHIbt4g/5BN1U0E4Wfr4pJ14Wftk?=
 =?us-ascii?Q?tzwDXHnSbVfnP+zS2ZKPen79RYzSfiOo83fdmgMac/wPyOLZDLkyIYNl1aHQ?=
 =?us-ascii?Q?YELBfk+TUYo4RVo9KQxOVs4W9JwdMDEVV+UZadD/wDGW4IKC2BdLP7CmIL9a?=
 =?us-ascii?Q?PcZ9+HMnIQN22twX7sJY0DxqcRRZmZ2SQzF/qmzmPLvAbm+78YhNpPtLGtpz?=
 =?us-ascii?Q?4SU98fXe2H1iyQlKFYasbl/JITIF6Q6197nXTdZfxQeElRD5veNA2AVc0pn+?=
 =?us-ascii?Q?XasdDNIMpFHukbsZn39SoYyJLAvlUsTmYPLgZN9G6wohfDq29MlekVjoWJJl?=
 =?us-ascii?Q?eYRZTVpxLJXtkrBHZQo2Y+vfeXW0GRwlseuXomW4PUJLnzizQRUW6nQ6Ya1f?=
 =?us-ascii?Q?5o4gs16OyOXIvyBrTxC+NQVYJqI0emhW8c9NuUBB2spaHuGMWOFO9LiuxovB?=
 =?us-ascii?Q?NPmajcFhLB6xr0BqJPgfe4HgdqYi2b2iofM0agTphXDgkSiDjFgXoNtgO5ny?=
 =?us-ascii?Q?LzyolYMxxoh4yd0oYzWl3I14pJSxn3yVFgUeedKvcvEwc5gRU9SJm+zs5p2u?=
 =?us-ascii?Q?QwFmkoBwbBS850GYsf9hpiQkMlMt7taYkoBSkoZ2pHSil0RuPrDE9ZcxhqEb?=
 =?us-ascii?Q?eHs/KHyJYGlyS1LiQQsgsZO6KJmmWlrHGqh59WPN5vrZqPVRc2dxjF7BlIXk?=
 =?us-ascii?Q?+8Q/RcvQI40DSUMXoj+Buxol990tqBeJ6faizuRhF85Xmrj54noNTIdzk2NI?=
 =?us-ascii?Q?JiZynFnwNT5BRFK2gvKn7MGxo47kQFctApcKxXeWgpjfJBHZxIa82/YMRH5A?=
 =?us-ascii?Q?kY3cJST1mZblKO7oCuwkb9modGa58F70zy64ksSydh8PPWUM5kPKw7rmWAWk?=
 =?us-ascii?Q?es25O2WrPqJl4SAFfsg9jXvWxeUXeaxHwlYT3F7Du+5mbkgnEgJiXbNoh2KA?=
 =?us-ascii?Q?5qQtgH2Yna4Rk3UOdnH4jRWxL1WqV+MT4G+O9DFsTEGuBJS3qxzB5rW5zvb1?=
 =?us-ascii?Q?0GPTWzv75+RJaWnTeAbu4wgprcITjYszySZrFgaaVmw2X3Uvq7MhdzXD7h8J?=
 =?us-ascii?Q?pUETlRxmGsjkDDFPoXjLEasjNNtecIo1eS+9LIVI41Me9FF9ZZb1s/7Qn6jx?=
 =?us-ascii?Q?X0H1Dr/XbzphtQ+/s8VHIwYRae6wndE3sNM873HPFXxJWrWszk535WixLEhE?=
 =?us-ascii?Q?rccyHDhi1KDkqu6JOIgMq9rNTBPxSYUdq60n2Ll2g4+Nk4jcSBSfAJ0pfpXO?=
 =?us-ascii?Q?wYPcYczlDTm+7E5bbzsUW58PYm+HMUrrdZPgtCc4ilaVeMfExV1oRGXPBuaG?=
 =?us-ascii?Q?N1NdwA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4970497e-d4e4-4fae-1b12-08d999fd2ead
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 10:24:53.9613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+3+cM8ULyENhDi3XEB/lHgBgndPhq4aTqN5T8jktwacLcqcNMxsIPmfcJGxR2aa92//V9O9ovQAygnOsD7d3LMooMwSWak8UOxZFXJdIIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2419
Received-SPF: pass client-ip=40.107.7.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Allow compare only top images of backing chains. This is useful to
compare images with same backing file or to compare incremental images
from the chain of incremental backups with "--stat" option.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 docs/tools/qemu-img.rst | 9 ++++++++-
 qemu-img.c              | 8 ++++++--
 qemu-img-cmds.hx        | 4 ++--
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 9bfdd93d6c..c6e9306c70 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -176,6 +176,13 @@ Parameters to compare subcommand:
     - If both files don't specify cluster-size, use default of 64K
     - If only one file specifies cluster-size, just use that.
 
+.. option:: --shallow
+
+  This option prevents opening and comparing any backing files.
+  This is useful to compare images with same backing file or to compare
+  incremental images from the chain of incremental backups with
+  ``--stat`` option.
+
 Parameters to convert subcommand:
 
 .. program:: qemu-img-convert
@@ -395,7 +402,7 @@ Command description:
 
   The rate limit for the commit process is specified by ``-r``.
 
-.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] FILENAME1 FILENAME2
+.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] [--shallow] FILENAME1 FILENAME2
 
   Check if two images have the same content. You can compare images with
   different format or settings.
diff --git a/qemu-img.c b/qemu-img.c
index 905150671f..b1cef4b7d1 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -85,6 +85,7 @@ enum {
     OPTION_SKIP_BROKEN = 277,
     OPTION_STAT = 278,
     OPTION_BLOCK_SIZE = 279,
+    OPTION_SHALLOW = 280,
 };
 
 typedef enum OutputFormat {
@@ -1483,7 +1484,7 @@ static int img_compare(int argc, char **argv)
     int64_t block_end;
     int ret = 0; /* return value - 0 Ident, 1 Different, >1 Error */
     bool progress = false, quiet = false, strict = false;
-    int flags;
+    int flags = 0;
     bool writethrough;
     int64_t total_size;
     int64_t offset = 0;
@@ -1504,6 +1505,7 @@ static int img_compare(int argc, char **argv)
             {"force-share", no_argument, 0, 'U'},
             {"stat", no_argument, 0, OPTION_STAT},
             {"block-size", required_argument, 0, OPTION_BLOCK_SIZE},
+            {"shallow", no_argument, 0, OPTION_SHALLOW},
             {0, 0, 0, 0}
         };
         c = getopt_long(argc, argv, ":hf:F:T:pqsU",
@@ -1569,6 +1571,9 @@ static int img_compare(int argc, char **argv)
                 exit(2);
             }
             break;
+        case OPTION_SHALLOW:
+            flags |= BDRV_O_NO_BACKING;
+            break;
         }
     }
 
@@ -1599,7 +1604,6 @@ static int img_compare(int argc, char **argv)
     /* Initialize before goto out */
     qemu_progress_init(progress, 2.0);
 
-    flags = 0;
     ret = bdrv_parse_cache_mode(cache, &flags, &writethrough);
     if (ret < 0) {
         error_report("Invalid source cache option: %s", cache);
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 96a193eea8..6b164767fd 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -40,9 +40,9 @@ SRST
 ERST
 
 DEF("compare", img_compare,
-    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] filename1 filename2")
+    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] [--shallow] filename1 filename2")
 SRST
-.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] FILENAME1 FILENAME2
+.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] [--shallow] FILENAME1 FILENAME2
 ERST
 
 DEF("convert", img_convert,
-- 
2.31.1


