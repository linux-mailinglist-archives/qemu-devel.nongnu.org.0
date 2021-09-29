Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBB641C5CB
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:37:53 +0200 (CEST)
Received: from localhost ([::1]:46046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZmS-00054g-71
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVZjZ-0000HT-1h; Wed, 29 Sep 2021 09:34:53 -0400
Received: from mail-vi1eur05on2104.outbound.protection.outlook.com
 ([40.107.21.104]:35945 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVZjV-0008EY-M2; Wed, 29 Sep 2021 09:34:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWfXDogsslugaHSvt/lFoKXlqtiuvIqHkC2SWIc+oY2hg8HBwErOe3i4Onl6Dyqh9yCqI3gOzUqNNWCD+2s22gV78NkPuKb7ezjZuhmvIbtm9OSvYEJDcgxGsWJfqRwJd0LTN1/I8vMxIMSKJfDkd2F63QtrkOFWrBmRuoYPuDiX3tnk4ovvIFTwDtiWHY3SC5TjPptiAi1/yybqDJddMtSLLtmvFMEa4KyAnRBZXU0HglyIupDkepaN/K723ZdrooMXhd4PvP7NzRySM/1ZHS5UkIRz+wnQbz/04e346Tgg91PfbPoLj7mmG+s0vXrgbF+WQNzup0SglBOUuptGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=rbz6ENvj34pAPMv7ddq2MpoNBnQ19P0MNVEPjQQsj28=;
 b=bQMujVfbGZmYMJ1GzeLmsRzXQjnVuEfj/6wIpG8hqsVriLexbBeEip9qfn8m+ibd46waBDZtavb1Ci4k5fpFPrsvTjFdudtVe+xX5CZKKc9IVrLOUO/fxrMiA52qv0XzTn8meMXhtaYKUzYeTCaGwihjUdbTZRN41lazDy7FS038D5zyviIfF4Jozd0ibTuJiyrQ3GSE24yAC0gbgX4nPGnM3Su6RYoF54dzww4JjkynTMgIP5upcJWcKGOYcBLL9k4J0mnViADnLjQeiXyX8O7X9Yz3eGSuG14TyjHmxrjSHdOcf5RtyF3mm0/1g+9gFQQ6/GmD3EsE+WYQKZwp6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbz6ENvj34pAPMv7ddq2MpoNBnQ19P0MNVEPjQQsj28=;
 b=klGAcDLXH7JNdBvqhZbCaenauGU2LSrGONJ3Lgyo02hqdJ/d4NnJnEMUsHTxPvg/ThvmGU8TG4devczOmLgdi2q3N5VhzeTqUMGg2byqtsjL3X+0621QyEF2fDDL/wL4izU0lTTvfo5ULFEDZWbG3MBIkTTDoM8e6sfj4EPPuEM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4022.eurprd08.prod.outlook.com (2603:10a6:20b:b0::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 13:34:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 13:34:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 3/4] qemu-img: add --shallow option for qemu-img compare --stat
Date: Wed, 29 Sep 2021 16:34:26 +0300
Message-Id: <20210929133427.44923-4-vsementsov@virtuozzo.com>
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
 Transport; Wed, 29 Sep 2021 13:34:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13854b9d-d2c8-4e86-e5d0-08d9834de5f7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4022:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40225C4A653EB0FB007B1B37C1A99@AM6PR08MB4022.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:154;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: asaJZq2eaoGfpz/W1be/rOMpzjACzJ8+GkM9uANpKY3O7H6AiHlwEQWoHvQYS7iEgKLg6u6QHbR5QlnDEr0R+2KE+t7WDAArXVT5LwtTXRbSJZMl6oRg4NVQvxmwAhAdwKZC96/5fYdv+5+JmpkQMsMdzI/fXU6mvq9RHq8muAwCJrbMeEEcj1XXy1oJJCB2kGJlp02s76bKO3BshIt4n01GlSVDYhIugomENJ8G7MOt5sXkgUXYz5WhI258Zve6jn/1EIDBXEqJYU6HWs+7SCriqqzAqCWY2MiHbcabgITLuU6eL3OScwIOKwKmd+/iBjF+oi+5IhMMt3k9RbOj1IAlO+o5O9xoVr90WufRAxTeEUKra1n0xRkb8R95QWiabnDEouG4FXqSbbrFHcemtVDceoJK1hW9kWDjHSB2AGA55gYIEqKZm8ZioS9bBwgPTfLPTh0z4/2dOGL8CD8PBzJrGeuRkp2k2oL0By9H0wjRBZsd86LAOiWVwE9CjagU73+BlwEEBDxTV/qgWPSm9zZFWJKNT1OniMMm/tkXNMAOevWNQrVdK4AiKnZZ7XQ8N2c7XQMqNek+mue7h/RbFUYxME++qIzmN/PItGNFxT9u4siALBGY9T1tbbKDyJdQ/d3KWntsbd6xDEiTZ/hCMG4qVPhRjdsAzheC1ooesJMB6J5kP7nhIBxc559iFT7dbnjdX3DsP+p5X4MZple8Ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(38350700002)(38100700002)(8936002)(956004)(52116002)(6916009)(8676002)(6666004)(6512007)(26005)(6486002)(2616005)(1076003)(107886003)(2906002)(83380400001)(4326008)(508600001)(36756003)(66946007)(6506007)(316002)(66556008)(66476007)(186003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1P8+eSnlUubLYrHMQ6b1w/Y4O5/NUQhUcn/ZxQ5xzSwVY7E2vLMqhROjLijs?=
 =?us-ascii?Q?fUNMZ6N3FORsOk4PO3FrD3UigxfFciWyA10LYfDaony87V1u2BYTGIPl43UQ?=
 =?us-ascii?Q?rX/ubX+xd6UlwhxZ6yphmoCpx2wWcmRSUp6diH/AYmrCjSNazX8rmGthvA1c?=
 =?us-ascii?Q?4TN0JxxdelOtUF6jZxIhaVYu7shtVsWAQub0D9HoP5dK5BSjLw1LQIf7u8Xr?=
 =?us-ascii?Q?6o4nvw+WPeULi2zFV1ce/lzb4BGi4jsheF+KE4xF2kV+aJMYrqRJgZfP3vKR?=
 =?us-ascii?Q?E97fAX5TBSdjGsEHbYGMG9uJOXSdnRz4HRV3tv1ROc67eULjDAluyJPeFvjw?=
 =?us-ascii?Q?US449v45aX5UN6R6jbGloGoNZ1pk9hqmF0p0C0Nr+ejedAfnrgtFFBq0zu/+?=
 =?us-ascii?Q?Fb9oDIBVH3R4DRMSFVxE6y7TRxAHL2q5MWFratqXBfJYzRmKeF4ASAJLsXtC?=
 =?us-ascii?Q?KRKn2ufbu97mHhbELs0e2vGd3/O+LqoN2qYUQRkfr6C0w4CVdElFl/vCgRBs?=
 =?us-ascii?Q?gs25aI6EzsWYdtITe5SO4FaruxL+d+gKnBGdvnOdqmBpIlDE5RWprkypng1D?=
 =?us-ascii?Q?Eu0E0s0pzygf4LVCGVI1fn12aI4mKKQjRh0ojmezTIcttoIUHGp9SsoLE/h/?=
 =?us-ascii?Q?YuNrG3WUlPg+Yo59KNRjfWOfubWXdH0ccbgVsM0iiY8T27X/+rCVA9eRyoV4?=
 =?us-ascii?Q?3PSNrqySoGeWooVoU9ClRWeTqfQU2Rkpp84GdYGwhQjNtF2FOY6pYLfU59cz?=
 =?us-ascii?Q?7NUMG2Q80Hg3hADjBB2Hg/T/P/MWMlTjF0La1Xt74xsPUGT+ycZseWNxGUsy?=
 =?us-ascii?Q?Ns3jym4PdzT4kG36R3S4TdnSMvLcJJe46J2xa3/tle+b0lHAkOHLNMJYv4VG?=
 =?us-ascii?Q?1R4HLcp4rhB66qqCJgL1iGlhb+Jtr7wXx38+lwO9NLO6srhTdbx3/jI/fL9N?=
 =?us-ascii?Q?ovVt47B3Q8mBPlrunhXxzXP4FM6gvd+RDJ0pWCC8p+iU/JQUR9OVOMyH7bls?=
 =?us-ascii?Q?wfj3zf8InzESE2LdwnjjEyaS1V8lE1ZmQEKqXK4ryN2pQ6kB/GPDuWo2yl4q?=
 =?us-ascii?Q?gdegiGql6EWDkvWw/GkP/Y6gKcQQec3q55zmm07jILiQaiEvc7rfE8KNgNav?=
 =?us-ascii?Q?rF4gKlqixi5rhxdY+eHKQZnGNKgM4Vp/Jwp4ml5OH82mQOfGo/sB9oG/eBdn?=
 =?us-ascii?Q?i8XC+SNPlmZlnhtt1+2m4lTNVkqH0JCAW72ECvzFR68VtkNcMhkSmL1ztiwX?=
 =?us-ascii?Q?xIX6EBO3l5Y/+J4mcsxXf/P7CJt3wZY245slweRvzFH+O2TtAZ5XKS1yuudU?=
 =?us-ascii?Q?KT/s+EHkaKmALx5mo2P9feUc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13854b9d-d2c8-4e86-e5d0-08d9834de5f7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:34:44.5496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXXDQH3Cb7QWhmNWEMnOgRxLMG9Eri7qKhiLhCLXpp4bh2Sdxgf2zLvgicnSVQ0ggRo0ahAm7OZ5FHhiK6913KjDLKFjxdUkBxmW0ywUNIg=
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

Allow compare only top images of backing chains. That's useful for
comparing two increments from the same chain of incremental backups.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/tools/qemu-img.rst |  8 +++++++-
 qemu-img.c              | 14 ++++++++++++--
 qemu-img-cmds.hx        |  4 ++--
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 4b382ca2b0..c8ae96be6a 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -176,6 +176,12 @@ Parameters to compare subcommand:
     - If both files don't specify cluster-size, use default of 64K
     - If only one file specify cluster-size, just use it.
 
+.. option:: --shallow
+
+  Only allowed with ``--stat``. This option prevents opening and comparing
+  any backing files. This is useful to compare incremental images from
+  the chain of incremental backups.
+
 Parameters to convert subcommand:
 
 .. program:: qemu-img-convert
@@ -395,7 +401,7 @@ Command description:
 
   The rate limit for the commit process is specified by ``-r``.
 
-.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] FILENAME1 FILENAME2
+.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE] [--shallow]] FILENAME1 FILENAME2
 
   Check if two images have the same content. You can compare images with
   different format or settings.
diff --git a/qemu-img.c b/qemu-img.c
index 61e7f470bb..e8ae412c38 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -85,6 +85,7 @@ enum {
     OPTION_SKIP_BROKEN = 277,
     OPTION_STAT = 277,
     OPTION_BLOCK_SIZE = 278,
+    OPTION_SHALLOW = 279,
 };
 
 typedef enum OutputFormat {
@@ -1482,7 +1483,7 @@ static int img_compare(int argc, char **argv)
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
                 exit(EXIT_SUCCESS);
             }
             break;
+        case OPTION_SHALLOW:
+            flags |= BDRV_O_NO_BACKING;
+            break;
         }
     }
 
@@ -1590,10 +1595,15 @@ static int img_compare(int argc, char **argv)
         goto out;
     }
 
+    if (!do_stat && (flags & BDRV_O_NO_BACKING)) {
+        error_report("--shallow can be used only together with --stat");
+        ret = 1;
+        goto out;
+    }
+
     /* Initialize before goto out */
     qemu_progress_init(progress, 2.0);
 
-    flags = 0;
     ret = bdrv_parse_cache_mode(cache, &flags, &writethrough);
     if (ret < 0) {
         error_report("Invalid source cache option: %s", cache);
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 96a193eea8..a295bc6860 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -40,9 +40,9 @@ SRST
 ERST
 
 DEF("compare", img_compare,
-    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] filename1 filename2")
+    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE] [--shallow]] filename1 filename2")
 SRST
-.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] FILENAME1 FILENAME2
+.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE] [--shallow]] FILENAME1 FILENAME2
 ERST
 
 DEF("convert", img_convert,
-- 
2.29.2


