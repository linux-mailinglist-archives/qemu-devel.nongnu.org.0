Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557294CC696
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:52:56 +0100 (CET)
Received: from localhost ([::1]:60476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrVP-0001pQ-Et
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:52:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrN6-00040O-Fr; Thu, 03 Mar 2022 14:44:22 -0500
Received: from [2a01:111:f400:7d00::72c] (port=28672
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrN1-0004Wu-3H; Thu, 03 Mar 2022 14:44:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cE+bC0DrmokZu0vp3f2Y3bCovjh8B2QVWQ14wAyVYEIzRfxODlgPb7Vy3u1f2b1bUzuFVKqGkIFSwtTf8W+8uQWM+Lyk8tjVDQEP0SBP3NGUqGfaJrcjv+r6P6iw61UaD57V8cPqJSla8MiNthg1SFEOA5sXwpB3sDbg3fQ35aOI5X0WJp1sMKkCn4XYiWYKwyi6MgH8cuZF40MoWci6qlUg021Y0VC0EW3zpom8Y3+N47yUgAkyeFMsSbXIjsHoIn6Nmv+idVEVPzIKsh+BAB0PCKGftXAb6L5aBAsxVJPZpWuKUfAxvYdCeNLg6jN10eWLl2N3+rn68mzGcj62ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQJuR97fa6FiCUtWQahNlOBLFee18TTvSO1rbHVvPVw=;
 b=LTkPpqqPhw9dsqsk0MCyuubyKQ1k5RLrooqBs2KwPqTYtNdo+3WJ3en2cPuFFTtwxN03dayfb//XD0Pj07oy2Dy6KWOBL4msHA8LFode18ocDOrQ89mpGamDcANPiiE2IoMuhAF8iWRHWS41a9PW78Zteg/rMKr+HIvjJd5xM/cZPOlnne0+VOGdP7b/F3puxaNyvD1XxUn0iVWhHOuoafFDbvXSh6G83vj+QuCElbzfs24KcgDth4thXqE5CMFJ3OM0LQfmENxEq4EkBSa+MlePIqsX8LhDEjc5A+oqlW+W5Ptjky/AVtiE57aaegrcWpw9cHBcqQ89+bdcummpFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQJuR97fa6FiCUtWQahNlOBLFee18TTvSO1rbHVvPVw=;
 b=RHfiSe8Mql1Ii1l2HFlhdn2tWsRrcdtY9uWJiitMR+sbP9+q8Eqa/5CrjDXqVaWnZEEX4S1kTDyME9DFd/YpBc00ymP9Il/cGmqTn5OkPBbe6boT1mxCn3XW+LJZf6HeQ8oNMFqtkwY4tnlfq1IXcRZjOla+a03ygPZnqTs90lE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:07 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 04/16] block/copy-before-write: add bitmap open parameter
Date: Thu,  3 Mar 2022 20:43:37 +0100
Message-Id: <20220303194349.2304213-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2090d477-ed9c-4ed1-4f21-08d9fd4e2e3a
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB47368D3A90102915EA6ACD71C1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CdIXyrhOQmu46KojViB/oDt5Qn2KuFin5+rIpQKhvSmy0+lRF5gsGOY1O8kcBEiAPOQ92uFdulAqnZfr9Ij4RU+3xmROKGOHO6qhUJ+4RX0pP485STEXDxTYKnpZSpyqfrbxuiFnYXQ3fGELwZ7hMDxy8SRzNQ+4DNCf5eglhFTKhh4jV4dOE0ydYIeMU8gZVfeQbjNutY5K10c2bHEbsl3rtLn58n94QtYADh9lWwoSxO01Ymc3AfGHKa2zetSiVVQs9sPCtMBSvYBdAyKtsIuyt6pluD6vzMx4YQUrBE5cmZFCubnLPItWDE/QNQtcp6U0l6TK9k7Ab5T5Uh/0C0zzTtUWr1G39Ak1OI96p1usCDiczJ3KsfbVlurOVp4qPAmGoB6ZcKNIw7SJOIb6JKxAtTSpMd8osMDRqvcosA7y0+7nnOJNllCVqcPcUTAc91a5OeWLoBYWecY8uHhzfFSKXykW/oeCtCU6Uo/sG/8TBjYMOGZwC8rhkyNiARCs4jks7UXSOsLKCLT1xTCVp+n9qGLx+X7JOv7bzYRwIGwtEjUe1nc5qJeFArgTNSTRr7w8/f4Hwi6IcpoATUs8lhBVK3eKeC/rMmrIbSiW5WvoZS/ajMvu7JJ320eVDjxQfc+keCpN30B6bcjnWHEU7lC4fOxrQJSm36sXFpu35LjKRAuhzpyA2ls1oiSqL5gfUyFqfztA8QqSZJ54y30s5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uwILKC7dfUfb6WP/WYQpx+3WkuqR6SQRAzKwQHgae5aI2ryz2T2NsF0Mstak?=
 =?us-ascii?Q?gDspKnjMa9WGaDERMU6VToCz1feFCU8KtZPxhfO4IEgis5Kst4UwdkSHapoW?=
 =?us-ascii?Q?hRP8UtEucgJaBLRbXmcMFy1ho6S5/o4oMsLPpimmQRvn9zT7Se9BxJrfE3sT?=
 =?us-ascii?Q?HJicGRG7nMSibFMjA3yT1yxYCgExKc5grMuj+VdQWU2oN+umR6xaxgOX0ixN?=
 =?us-ascii?Q?PEO6NEIyfXdGXdZPynx5eU/sO7O9ScN+DlMIyF55NMaYUlv0HV01NS8omBri?=
 =?us-ascii?Q?U2Rmj/l1pyc/Rr6L77GYqHJd3ka2qm+QWyq8wzW18wdaOnIyHlAXCuQdDS99?=
 =?us-ascii?Q?cD3cZgmxudVC7iyLH+/GmuKOM90QnZ76UMDQJ7WOEBdN3U7qEd5e94yYRByX?=
 =?us-ascii?Q?gLgOXqACgrwqte9JP8ipPMeSSx2RIKxVUfpLHIsj4kBUPHjAC+q0OOy8w2vw?=
 =?us-ascii?Q?a8faIHeEhCD9ARJn4DI6rryydU63OR7OIFSebydmMHfVFwIDy2plXKSy2nkC?=
 =?us-ascii?Q?4LFeZ4pDjDOtlt0KqhqgIuPH8wKZWmAfKP1JOI65W3lnnOCiduwWgLEn/79m?=
 =?us-ascii?Q?xk8320XtP1gMr4i21Vhlg6bICaKTBrO/BgVo00Yslucl8YgpSYRjs5LIDMYt?=
 =?us-ascii?Q?csWeRYZayVWfcp5XIv7C+OZanuds5INv+ExIRTxrzIjCIh3uEbLqx7vu3/ug?=
 =?us-ascii?Q?VlldYcUaKfdHe8wShR6MTMDq4hfsMc9gP/zsVdD2u78VXBZ+ZMQKHvc3fBuG?=
 =?us-ascii?Q?sgZCsRc3RYu0nM0VqjisKW1Rce6IHf/Ko3GHO1L1ekEv1R50AIe6kMSA8XZf?=
 =?us-ascii?Q?P5WS4OHbRR5VHycPkTwDp6WfnozHZFNwtylmJaX4T+4IrulFf9UCKClUPFvF?=
 =?us-ascii?Q?S0SgsMRrcSxxY4Ik/nca6xEoIHa/UCyYZ3gdPVS5khY9BydqaRV/TsI8po31?=
 =?us-ascii?Q?b57QRWZOAr/SJk515LYXwNGk0hiPeV6VPK5W/wXMJgfRaFsDD/Qn/rXe32IW?=
 =?us-ascii?Q?6ksrYA9NAybjsj2twZPRB1mOhw7BxgvTGof7vc2VraXiO9VX0VyENQ0oRsFn?=
 =?us-ascii?Q?YNsFM+y/6Hp67OKChleLRhLdTqBfBnAXWi0yUBknTZRySjG9kRSKogvVTNPu?=
 =?us-ascii?Q?64oQkwJWL2BxgR7ytkwMjodo7eoIdqywcsfFG+HR6G0xf2n1qKdgobWSz6HF?=
 =?us-ascii?Q?u3HXjZlYU9D1oGRr21IZiNeDwl+Les0HJPvzrteEcEdzt4XVNtKaFNCRR9/K?=
 =?us-ascii?Q?amSnU9uclZbqN6TQsPGP7UUQ+SM09E0n3lVPcrZwZApRhJ4vaEtGpDsA5JVm?=
 =?us-ascii?Q?tTP9k56QQd14R7TaWv5ic8k8uehzExAzD3LThRQovDM1/0hoeuhOszwghKua?=
 =?us-ascii?Q?2zdEWZldBNBhGqKXOV/6/bbtC4l+BlKlkZw/xBebFf0/DA3ochh4lSZZrN2S?=
 =?us-ascii?Q?0NZ2R7XXdLVFPfLemDSNJ2W9At81GHpRVYgO3KhTHxjO8+9GDTERkcZ2y8Bn?=
 =?us-ascii?Q?QXPRzUBiWlK8iiwrWXC5Q3ViDxvr+sRuaO5wvo5OmWnPVvI98ap3ynVQQp7x?=
 =?us-ascii?Q?S0BD/RKrl+l92fhPXMz7ACGoIK8Gb6Zx8YLCWWvJzGeFEs7x1YgimbaM0MpX?=
 =?us-ascii?Q?A9PTQjw4HhD4ad+zjol8bxVPPV5NH5wTxkPfpao309sH0pT4WG3mC/rxTVi5?=
 =?us-ascii?Q?KZruvw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2090d477-ed9c-4ed1-4f21-08d9fd4e2e3a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:07.5891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: norE0Ur1O5xDyaPXHDFe/py1KGO6kNNZwdrQlzWP7dVN0mcVXDxC9stLoVfoTOOLsNkG1W7kHeNvhxG506KxJBN79FW6EXv8e2+vsvZOVi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

This brings "incremental" mode to copy-before-write filter: user can
specify bitmap so that filter will copy only "dirty" areas.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json      | 10 +++++++-
 block/copy-before-write.c | 51 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9a5a3641d0..ffb7aea2a5 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4171,11 +4171,19 @@
 #
 # @target: The target for copy-before-write operations.
 #
+# @bitmap: If specified, copy-before-write filter will do
+#          copy-before-write operations only for dirty regions of the
+#          bitmap. Bitmap size must be equal to length of file and
+#          target child of the filter. Note also, that bitmap is used
+#          only to initialize internal bitmap of the process, so further
+#          modifications (or removing) of specified bitmap doesn't
+#          influence the filter. (Since 7.0)
+#
 # Since: 6.2
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
-  'data': { 'target': 'BlockdevRef' } }
+  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
 
 ##
 # @BlockdevOptions:
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 799223e3fb..91a2288b66 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -34,6 +34,8 @@
 
 #include "block/copy-before-write.h"
 
+#include "qapi/qapi-visit-block-core.h"
+
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
@@ -145,10 +147,53 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
+static bool cbw_parse_bitmap_option(QDict *options, BdrvDirtyBitmap **bitmap,
+                                    Error **errp)
+{
+    QDict *bitmap_qdict = NULL;
+    BlockDirtyBitmap *bmp_param = NULL;
+    Visitor *v = NULL;
+    bool ret = false;
+
+    *bitmap = NULL;
+
+    qdict_extract_subqdict(options, &bitmap_qdict, "bitmap.");
+    if (!qdict_size(bitmap_qdict)) {
+        ret = true;
+        goto out;
+    }
+
+    v = qobject_input_visitor_new_flat_confused(bitmap_qdict, errp);
+    if (!v) {
+        goto out;
+    }
+
+    visit_type_BlockDirtyBitmap(v, NULL, &bmp_param, errp);
+    if (!bmp_param) {
+        goto out;
+    }
+
+    *bitmap = block_dirty_bitmap_lookup(bmp_param->node, bmp_param->name, NULL,
+                                        errp);
+    if (!*bitmap) {
+        goto out;
+    }
+
+    ret = true;
+
+out:
+    qapi_free_BlockDirtyBitmap(bmp_param);
+    visit_free(v);
+    qobject_unref(bitmap_qdict);
+
+    return ret;
+}
+
 static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    BdrvDirtyBitmap *bitmap = NULL;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -163,6 +208,10 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    if (!cbw_parse_bitmap_option(options, &bitmap, errp)) {
+        return -EINVAL;
+    }
+
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
             (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
@@ -170,7 +219,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.31.1


