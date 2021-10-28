Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0488743DF09
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:37:24 +0200 (CEST)
Received: from localhost ([::1]:34918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg2mh-0002Yb-31
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mg2as-000721-R7; Thu, 28 Oct 2021 06:25:16 -0400
Received: from mail-vi1eur05on2139.outbound.protection.outlook.com
 ([40.107.21.139]:54305 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mg2am-00020f-SX; Thu, 28 Oct 2021 06:25:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbNuKxfUU3LbVkpC3eqqyk+j5erIcC602+F4MxOyMnzVQNDc6VVcPXSbq/PZQ4vZgt5kC3ALJBo3BwljWmh7WwNbeRCiaeRKzq/s50mfhqLmWmYnMRdl0fK0HaCNRaS62hIEVPJqvlcEcJG3p1peIyx8bidv7eLHu+xcsRhYPTyOs1ElEQ6TVE7sFL8LUDaI7q2SZOZ0cU1JvsfRkQixazlf0h2qRKAyq1leliN7/mISAlDZG/xzPIXTovfmdscA1Xc2r4x2/ISz92sGq9rys1JsjOCYdJReGlXloHB57MAdKmMgrL8fNvVK2h22Whn7q4FKRbAS6niYjdf2hoXFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnB1bIphaGE6FXQ0hk4cpNOhmYChYbfnUuTfLP2usYU=;
 b=RaVgxsO/dngDPAyP3m6ewn1bqmx5C722oISSM6fSPUqRwhtGBgwEw8Ze/w7bPfHbAAqH3ZV77aSvXKrSH2PtUVhOeBngsfOX/BVmx0Vn1n8VFfDPk1yrT84FcRw6sKDqGDuT3X1iRCbRKWieAtFDRSuj/f5oeO4jiInu+8cR5XMsb65p7MlidBKKto9oxvXgG2lGRotpQq8SJYn532n/qy7x39S2YO+ikGQZ/ojphTDWTG35kDpT8O/3whJJou9xDM1jU9g01k92lF6Wl5y2Kngld+tqYdyEDSz6KZx6Grb28gztTaEARzGPti24ittxDPGKfDb/4/WGDMuBpBa+hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnB1bIphaGE6FXQ0hk4cpNOhmYChYbfnUuTfLP2usYU=;
 b=vlJkM50if9rCyCa1MXErkjFrfaJxzduVicHqS4sKZ+HGOsnB8fcW7bgK8ZcihvAxsjboxrSnmR8/zrCo9aXJp7rml2VA0cK3E4c4z+0EgJwDkG3Szgckflnkjw9VT4wTIHS4rwugkST9Do2EYMarITlKYviyv/vBwwUI9edDFIw=
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
Subject: [PATCH v3 2/4] qemu-img: make --block-size optional for compare --stat
Date: Thu, 28 Oct 2021 12:24:39 +0200
Message-Id: <20211028102441.1878668-3-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 496c5c3c-a5cf-424c-07d4-08d999fd2e58
X-MS-TrafficTypeDiagnostic: AM6PR08MB4535:
X-Microsoft-Antispam-PRVS: <AM6PR08MB45353D4EBBF29BFF1AB1CC13C1869@AM6PR08MB4535.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +J2EJqYXcRBlNySSHwXBJF0NJU/wUMgOqaO1g3AkYHuHSw7lhCwY0tVtkvpgUhSX4OVRzmrv6nOygOffthK1UqF/nP4dDZMSC+bIz0H8qV8SQdWlRAdRd8dL0R7CtacO4ptEmGp2AXtkYPNaItmEdrNb58Vpks3ut6/ELKVrrfz5axWuWDG5IahareUG5/xX4NHBLmjXOs52Fuku2quCWf84MGRIYo5KMbgtPSgGb3nbcQuIxegCaIYeHCR/YxToRHU2ZeuLQRjF7adnrhGJs0mnDn6JMOQU6nd3lI3pMYR3JhkZDq91qybfjjzoNSHnQ84Ow2+aQekeDlXO4rohhZUFA/+nK1EHlHXE2qNkV+4xQKJ6CAbgaGlXdlVNI2FXQ1+++gbyjgFThzbbOKqes9bbRosD3nX+Uw6ouSpvI0xc4uq8s3UggI7HHDQu4PC81QRjJ9xLnm2hC7cLg6lSaBvJ5T4xizY2KMEQsY8tsfLFtmMLavVC+Qn709lapQRzqGLWtCqZ90iqcj9r8qzyNLBsc93OvYa1L1F2GVckJeEOMGQw6maEQ7kq22pEYL0wyF0r91oVr4z8zVy3ODuTcaozS81B1E8FzrntzokVavNs/7IPpKAOHBn7uiv3lmr6hZp+6VZjIYD9iaNoVMg65NnjdTxhXCfCJu941TGNoy25niAq28zRR1TBMGWDZe3ZWtRPsTKvnPMSLjplIezaew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(508600001)(66476007)(66946007)(52116002)(83380400001)(107886003)(66556008)(6486002)(8936002)(316002)(36756003)(6512007)(5660300002)(86362001)(186003)(38350700002)(38100700002)(4326008)(26005)(956004)(2616005)(6916009)(2906002)(8676002)(1076003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yj9Vur/YLYHQ4+DgMoMvF+jm0/YyNZ3M4BGrzDBPWt9KsO5BbiQJxrhA/VoJ?=
 =?us-ascii?Q?oTB8RO7iFqOSV8EJwrHEc2Ba66ms3yNgGyGQ4kkhDawD81AjDxN31JwesuGQ?=
 =?us-ascii?Q?CGAH1R+DMvgBLu+xepO5tDt9MYwwnPiIzE715FGD8g7NcutcCmay/Psd3m0b?=
 =?us-ascii?Q?k/UBlbKa6ELHAI765Kq6dTQPcC7H9SWsHCbkELB9+WP0uqo0skIhGf79ZaAX?=
 =?us-ascii?Q?/+TVSPf+wm4jAcIypX/PSYqlFIr7FLELvKhSQ3ukW88sZOZTFvyH8pZsWs1W?=
 =?us-ascii?Q?ln8/p2ni/KFKQe6p6VNskD7Dr0u3xyzCuOVJktVRjW+ezKhpRnM9voIR38ej?=
 =?us-ascii?Q?xzei6BIo1Ux+SNw9PIEemmeut7IhNAifiHid4IJl0FZUYQgUC2q82wyXeUae?=
 =?us-ascii?Q?JCqXGhmmVW1pFUqX/qQu/z6y8zJaDTxVcBxn71F29VwCb4GIDzYWr2u+ykxv?=
 =?us-ascii?Q?6xkM652xzuoB+vQXVYKDNS3jkmSuWu/ISlBJSdls/mYUi996w+ts6lUYpkiI?=
 =?us-ascii?Q?A7rzJKKs6iueWWHrLZvBkbjynV1uUdlIApD5IVuY31gLUodzqPd9BUb3wPDK?=
 =?us-ascii?Q?Bkf3bOhbiQGQP+VdNHluN/01ik6hUp8eF5GI341x6m9jegPR8Nr+ZiaB7HKl?=
 =?us-ascii?Q?EmL5AuXq32WQ2xrNBHJXm2qZNxgPDVzh8OTpmPnja/2WY6kl58CRu3I9wHSN?=
 =?us-ascii?Q?q+gnEx54I53xYhe+t+yemitDQ9akmioMJ7Pc7GEPEcFnEeRx7b5gZLaaqyGs?=
 =?us-ascii?Q?zUzihvtrcyX46bKE+8vipwGCi4h6pJLuxYAsOTpVhALZ4nX1VAHsEruUXAXz?=
 =?us-ascii?Q?lDkGpIPmiRloLpCtK0F4GO914Z1YUDhj0TQ9AyLxeBorTLrpU2mqOhwGcI48?=
 =?us-ascii?Q?RPYrx5Ti0kZAABqEScU85f3DbfwTtI9MCfZOg0ViKpXxG11yC3s4MAQL8m85?=
 =?us-ascii?Q?aWhucJ/XdlTbYC4JLqhrKRHFIYykTZh9jGTxUxE1vYBAuTI8UXnvFxokr7sH?=
 =?us-ascii?Q?7hWBwzjpG4Uf7yPVo24nQS8IykTHRprpj2Jexo10CNDjTscxdBkpvhkAHKjC?=
 =?us-ascii?Q?tRSMWXr3y8QfQBPSaU6qC8qHfokGtRFI7QSoVjdmO2Dspkgi1wrpdG6H5R+6?=
 =?us-ascii?Q?v7e8bwYcZE/Unn1wDp7UyhYuDoFYof8+phoxyQYVhKQlu5D60JPrYtir4ROT?=
 =?us-ascii?Q?+m54PlxJtlQg5Q6ZyFz4859R5rdKU6D6FGy22dPDSAYF8WUV4XiXC7Q9Iqrt?=
 =?us-ascii?Q?xxE60wfkzydZBPA7xss43pPy8inhzEZCzqpR/zKvMHf+tNSRSY/Bb1pGRRV1?=
 =?us-ascii?Q?mJJc6f0qPPOhxYogHx5h5laR2hRrLoL9NHMKQQjUKAVQyPFmwAIbktzp+PBh?=
 =?us-ascii?Q?Z5OtaOeQUTOpJMbCOWKd4uU2lWi/1binsiaScu7I4bqBk7Jv42iBM94hbV+r?=
 =?us-ascii?Q?zPwdNoeVcEPMDn/WMQG+cFHDLPxZJJ5EGla65+v42Ljsk98M574cyMSxQT7J?=
 =?us-ascii?Q?vIe5k8Pnhiy0MtBAhLvu8RaYJCV1BQ3Lak4xbdZ5fxZ6Kkh1sBYJLJUE36Hq?=
 =?us-ascii?Q?lGJvOtZ6FtuwFdocMXZSY0sTb4gfTDegwlviYWGQQPElSHCjy5fZVqee7VxG?=
 =?us-ascii?Q?NQlMeZ8P820zc2hNC4aSOfEc+3W6G/XP4MmuzayB/S9MxTTRCYPYEyrzofls?=
 =?us-ascii?Q?tQVU6g=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496c5c3c-a5cf-424c-07d4-08d999fd2e58
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 10:24:53.4585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FnwdzR68jpBYlbDzlF0OZWA7pxclHSBBEyFkxrdpNo6fvawS2jZKEQeQySrUlJEOKK4NUedELksVGLWiZf2VR28gtUSKJSGlgt8rOES3wgg=
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

Let's detect block-size automatically if not specified by user:

 If both files define cluster-size, use minimum to be more precise.
 If both files don't specify cluster-size, use default of 64K
 If only one file specify cluster-size, just use it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/tools/qemu-img.rst |  7 +++-
 qemu-img.c              | 71 +++++++++++++++++++++++++++++++++++++----
 qemu-img-cmds.hx        |  4 +--
 3 files changed, 72 insertions(+), 10 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 8b6b799dd4..9bfdd93d6c 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -170,6 +170,11 @@ Parameters to compare subcommand:
   Block size for comparing with ``--stat``. This doesn't guarantee an
   exact size for comparing chunks, but it does guarantee that those
   chunks will never cross a block-size-aligned boundary.
+  When unspecified the following logic is used:
+
+    - If both files define cluster-size, use minimum to be more precise.
+    - If both files don't specify cluster-size, use default of 64K
+    - If only one file specifies cluster-size, just use that.
 
 Parameters to convert subcommand:
 
@@ -390,7 +395,7 @@ Command description:
 
   The rate limit for the commit process is specified by ``-r``.
 
-.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat --block-size BLOCK_SIZE] FILENAME1 FILENAME2
+.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] FILENAME1 FILENAME2
 
   Check if two images have the same content. You can compare images with
   different format or settings.
diff --git a/qemu-img.c b/qemu-img.c
index 0cb7cebe91..905150671f 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1407,6 +1407,62 @@ static void cmp_stat_print(ImgCmpStat *stat, int64_t total_bytes)
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
+            qprintf(quiet, "%s and %s have different cluster sizes: %d and %d "
+                    "respectively. Using minimum as block-size for "
+                    "accuracy: %d. %s\n",
+                    fname1, fname2, cluster_size1,
+                    cluster_size2, block_size, note);
+        }
+    } else if (cluster_size1 == 0 && cluster_size2 == 0) {
+        block_size = default_block_size;
+        qprintf(quiet, "Neither of %s and %s have an explicit cluster size. "
+                "Using default of %d bytes. %s\n", fname1, fname2, block_size,
+                note);
+    } else {
+        block_size = MAX(cluster_size1, cluster_size2);
+        qprintf(quiet, "%s has an explicit cluster size of %d and %s "
+                "doesn't have one. Using %d as block-size. %s\n",
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
@@ -1534,13 +1590,6 @@ static int img_compare(int argc, char **argv)
         goto out3;
     }
 
-    if (stat && !block_size) {
-        /* TODO: make block-size optional */
-        error_report("You must specify --block-size together with --stat");
-        ret = 2;
-        goto out3;
-    }
-
     if (stat && strict) {
         error_report("--stat can't be used together with -s");
         ret = 2;
@@ -1593,6 +1642,14 @@ static int img_compare(int argc, char **argv)
     total_size = MIN(total_size1, total_size2);
     progress_base = MAX(total_size1, total_size2);
 
+    if (stat && !block_size) {
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


