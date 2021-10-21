Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1D8435ED8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:17:20 +0200 (CEST)
Received: from localhost ([::1]:33986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdV8R-00050B-KO
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mdV4P-0001XX-2P; Thu, 21 Oct 2021 06:13:10 -0400
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:9813 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mdV4M-0004tm-O0; Thu, 21 Oct 2021 06:13:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcdX+UUwcAiDlimL/BCmkuaiVTIj6yX5Nbn6/Mv7NYbAMVR4sCVBa7A3w82ZuIUBK7cxFA/HpyW8JnRdfTlTnElaJihhXc/HPuS92Bj1pqgMKd2kHKJEgaYQgUhHd1eKLB0nE6sB53QQKdZLgr+p6fA3+b6jrdImnp1qzmuG/BzvLB4aDgWHc2YPGboL1EoSWlosSpL+YNa85N/I1qUFJfBBJVYD5ZM5IrSmDpmzD/bPJ9PwrXVfZ5FZs+jY80D45UQSwBnDNHgj+ejA++UBtHHaAc3eEIcQ+rOKOm7dOOw0ArTvSg7Y8iW5+ilUDtBcC0lhKp3ZGI96HqwGj+tP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxcqpGkAZQMpZfKI8f7xdBHinwErsewxy6gc2qoDeLY=;
 b=Hmw4A2C7MUi3mm/mEVbEkDWvyoCKBEq6poTiLDuTO/CLeVu4ZkxG8HQORS/4eq6GY4xOSkZ2dknWDk7Vk26nOg950wWpa/KAI4F3kJ0iknrpNmO5lptNNn2QYXnbAOCkAkoYH7tARG/DGLVYKLiu05tLm+q+ocUTAeImBzrkpKQsjlVOaKzIQgfxqPhG9qM/ziLGEYV5gRPAtREuIXzAjpOXwinB1eZWxfKM3A3t/I9u1UGuUOnBk8jFkTOlKx6CYbgywl+YjQY67KVUUbNXwN75pJW7PEZmnPSDjmjZr1Pb3EfLbCT0vV5dA5ROuNqnYIladNWGlJDtdJF0AuFmRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxcqpGkAZQMpZfKI8f7xdBHinwErsewxy6gc2qoDeLY=;
 b=imPOyBfYQw2XpywkdC6cNeWn1nDvLDM0WNMDXySlsZ1z+8gxmRSPEGSfscu/dKAHYXIEhmidG2GLCurz7o2RYpt8S7EkvdGtReZypvVntq4w00SjPPHoK2DJcZ2V6KQjjbW2xHTb6unYlv9HiVLWUb82SGr/ylkep9ryVZKyBfo=
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
Subject: [PATCH v2 3/4] qemu-img: add --shallow option for qemu-img compare
Date: Thu, 21 Oct 2021 12:12:35 +0200
Message-Id: <20211021101236.1144824-4-vsementsov@virtuozzo.com>
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
 Transport; Thu, 21 Oct 2021 10:12:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0d4e362-0d36-4dde-ff79-08d9947b5579
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-Microsoft-Antispam-PRVS: <AM6PR08MB507841818870F2C279A93808C1BF9@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 04Qo/xtfo2+CyJwcdtRF62dZdPBdO0NdKOw/6e3DhXCicYUQd7zmVIhZmgNTRbbVuEuwr9uK9vgwN/gJR+F9D1dQ/M64BeQTMf6gRl1G2Y7dMynjQks91RYK9YcSnCcijpNDLTuyVwaM8V5PW5O0IpTBLeLVaWI3OKQi1Rbdr44wS8FZdIMflRk+TpGc8se14gtd780Nszaarq5r0C2mwONKtadGoreLtCBmng2hc1EUOKcVGhTB003mZkOqCq0RQ7IsQOYpXtB+0zqUoDeYae+esKYDTkPWIVh6EX6vr8VN+/B6LwjiwfI1wkWH7Dab0OSsaOKIFZIza9qLjrSj020FrYb2qWDhBM1EFCU55yVyNqiZxsnI6r0nBrBMWGKr1/2S14r6rmOoT6JkgJb/qmZkMsQtFQqW1W+M6T8JrRK6vB0THjihk7yYhrt99+BG6lUIAOA2E/+rB9+pUQIAW0aMgGjqQorpLjcDqDvW83qGJvWsGG9MyEVbacrx8h4rAe/NjUgHAmGLKFBraB+UJjPT/WnZVFso7PjHrIjedDK0lNf7DwrZpf8uoXVJ5pschyQXPHixkF+BK3YmZ/KWPWBfwR7QH6ohwk229Afo0Z8ZHjg/2A4pUdAEM7yGQ+i93daEJQVelM37E/SA1eC94FFKED+B+mB//0nsMk42bmDweUCM2wgiO/rMmw2QyYqiQ0LkNlirj8N5LFe+06p+WA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(107886003)(956004)(66556008)(508600001)(83380400001)(66476007)(6486002)(66946007)(4326008)(86362001)(6512007)(6666004)(6506007)(52116002)(36756003)(316002)(5660300002)(8676002)(186003)(38100700002)(1076003)(2616005)(26005)(38350700002)(6916009)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?upXA9Hzxzhduhy+AMU5P1itv4pLInBsOTe9hJBUNODqEeVjlGFYeWAMnl4O2?=
 =?us-ascii?Q?BNqj2zqehaULSqJ8+L1QKCIExHkrhfpn+hpBQtbtE+B6HXYmdrlvpmhxLnk0?=
 =?us-ascii?Q?KPgoy2x1vP0HbI3vTIGU/dysQzS+W7Eg8Pj7CBL2HMw9CFxjb7pvEVN+iAo6?=
 =?us-ascii?Q?VuSZgofKisCGQpwtmZlastpbizF2rJKunnmeREJPEJ9wZzhQK3COuuw4tt9V?=
 =?us-ascii?Q?82fIZrFbNpJbTyJ+Lpsj1+ejMarBSjfosbx+CvEBlFdE33aQR/qRsSmO0XAq?=
 =?us-ascii?Q?xHKX3p76hpKTfdw0w6PGjGFEN6qZzxa+8AYBrDy183H69O1TyTTc2YvTdCJJ?=
 =?us-ascii?Q?j2fwVLQTLN4k3vXWLSnh1wZiJ1nk3XBHsngLm1kmdlw2SKUfNwxObMnTJY33?=
 =?us-ascii?Q?y2PPl+I9u7DrTxboIlt399qK5ur3Ib+y2orgeQM3IDtn1zW2z6vpH4eBTjE0?=
 =?us-ascii?Q?q0vGjCMVw8j+ghNtKBPbxxUKL/Ux6ZwMGvVdJxm3vsyLj/C/eB2bJRynpZIJ?=
 =?us-ascii?Q?kT8ubiax0LkXY3HGGYwvC5088hnrjx8sr0ImiUT0w+c1p37GKI4NwAIY8goy?=
 =?us-ascii?Q?MFHQjCEkyiKAmw4SVQmLdlu9mZn7kGnmsytGQdMgVeVvjJc8PJ+aNWn39SjC?=
 =?us-ascii?Q?Jw9RNpqWpKqzkmhESvTG1nNTpF5EB4pgjKIHL0FKsz7AlL4WFdvlOm0V7y8D?=
 =?us-ascii?Q?T08gpdIT59qo3NVKxq3fFCSbhiEYyR2/Lu0j8iJRzSuQwFzQMUX9psJRcmq/?=
 =?us-ascii?Q?zV24py8682FrxVvBZJmdNh2M4rdhL+zWSw6rmBathvRdOvY64KxFgmfpZOri?=
 =?us-ascii?Q?ru7AK4WI6k66xHSMuV1kGOxW2BkHkLYsecJafkA9LDmOLg3FxxKXXBF5v+kR?=
 =?us-ascii?Q?06kckeFOSUm5+o1Riutpf4p0yUII5Kml/Bzgl/Fau+8ED2J/qsH0sTgmrZ7/?=
 =?us-ascii?Q?Bi4/p1xyo1XI34ClotMTPUS+saCJlfWHj7xlqm7JjkSApE2iFvrP8DRZ7voe?=
 =?us-ascii?Q?3cyglsxqd/T5fxUAIXqbkkPx0rYAQCUaZmuBmmGjTYnJ7kYH07wI+G/2DkHO?=
 =?us-ascii?Q?v2oDYpkaN+M2g/I0F45tBrHF9XU5ViEUh53s/TevZDttB+CcYpvd33WxvxRS?=
 =?us-ascii?Q?8IyYF7Xp9nvALBFTb4Y/WNpd89enceUzSMjc2SIuhEWTV1M/5sqRNvaT3aXb?=
 =?us-ascii?Q?JFDjTPpPy7zyWRxybteekyo/8Jmk0iJ1iguxAWlF5krtarhlvLeIE1Bq7CeS?=
 =?us-ascii?Q?TPALLVfDDKy3cY/IKz/rqA+JsSlpD7zfpsNrJD2QJXGEnA2Md6LH2I9khVIm?=
 =?us-ascii?Q?PeSYi7E2fNNKKiV4vrZB7PDmSy3AZ7uEIoz3hze10nvabvEE38Cfy1gFrYp0?=
 =?us-ascii?Q?sojDWx2zVVXA3RvuOTSXM/T0bijVRabM9D1K/BFjERbLuc4LRXmHfgo7Z5qY?=
 =?us-ascii?Q?YILEfbqoSvT2aRC83Cj7DiZxpfYSvMA5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d4e362-0d36-4dde-ff79-08d9947b5579
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 10:12:48.6797 (UTC)
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

Allow compare only top images of backing chains. This is useful to
compare images with same backing file or to compare incremental images
from the chain of incremental backups with "--stat" option.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/tools/qemu-img.rst | 9 ++++++++-
 qemu-img.c              | 8 ++++++--
 qemu-img-cmds.hx        | 4 ++--
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 4b382ca2b0..4ae9543472 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -176,6 +176,13 @@ Parameters to compare subcommand:
     - If both files don't specify cluster-size, use default of 64K
     - If only one file specify cluster-size, just use it.
 
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
index 61e7f470bb..c9b5067353 100644
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
 
@@ -1593,7 +1598,6 @@ static int img_compare(int argc, char **argv)
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


