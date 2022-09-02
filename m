Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AD35AAB42
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 11:21:31 +0200 (CEST)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU2rc-0001TI-5E
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 05:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2Qn-0000gl-NR; Fri, 02 Sep 2022 04:53:42 -0400
Received: from mail-am7eur03on2104.outbound.protection.outlook.com
 ([40.107.105.104]:14977 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2Qm-0006VE-0M; Fri, 02 Sep 2022 04:53:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xil9RVmI/dgFhg+MKrLhp5gQH4EVCnpWu+XUmbkC4wVCSCMbr3itNS5hBXtAC44DjJIkUH8S6djaCT7fgYq2CLhtaLAW8nOiv21zj1ycTQb/8e4pIpZxgD99N1wie0DNbvO7/i3oq1RCONZfxnlHlimWYpZeL0T5/7DLUIMrAOnVFx/0Ie2Y+xw50F4jxDeVpl9PzVdTvkkBQ7MKhMsksYO4MtE9ofq3z/fKVpDjPlFP3mVJhmeTMyO+AI1nZCdkzQIi2tHST8VLgKK4dj/yJaMolaGJ4cKqy2FIP83tVnD1t6zoqa9mSuYA29+KXE8ocNp8f23JD4L3hNMLXi8jJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fladCdfwZIj90/fs39Ct60M/8B1zqXP4qJbYHh/hVNU=;
 b=lF52Wq0lReLaEa3MsZgg3+bG67pxcYXTucjIYU2lV1W7q7sJmZ7lo/M3Wck5n1b/wTSXjPu7v1FoNCPKWIOxAlsw95CiYWaDcnLgQOZV/H+1NT9infSBcWbUknT/3sipUt/kfrkWeNCaV4E6gDt9wuxJBLllG7p5xbkZRP4SNRrcPi9Ka0eoZRYH507QdTVRn1K8doQ0FKj+oq+OdB4WC3lTZ6urxyeNutXHqb1UP3Kj5Tbv/hv0zpa7Fs4+/IfVgyCNDIFIt5OnP6HwBE4+KMOmlRq31XwA+vLYSkoLRUTHuUy6+qN+gdZl9F7ZoF+7xz5BkZ5WYonghXPg2Zt/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fladCdfwZIj90/fs39Ct60M/8B1zqXP4qJbYHh/hVNU=;
 b=Ld8SXVh/kqOZDA3mrdTWWKJoCAVZafJmpnLjCZukJYZl3DXiQCJketMK2HTsDzWOxunaw0Be98TVdo11CutIYNGFPAptt/cFhT4M+Z6g7g5g3K/O2wkr4WylWMi8KSmah6GCAoZooY2/JkcCGO9pQdn11PhIzm0Vdm+rjndTwJb86Ke7X1guAXRdXNKCg2nqfhAPXOl63NsEKTEggZzOpcKEC9WLKRlb9ajyMb80xjq/fZRSdrZiTcev9Nn9nPDPRyEjH3H5JKdDyA0uj9h3iBlRF9+5aEATxzD2v1XwBusux63+pslwPmC3QqAzWg5kQeBTZ8WJIkIfax3BVYuXsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB5619.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 08:53:13 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 08:53:13 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 6/6] parallels: Image repairing in parallels_open()
Date: Fri,  2 Sep 2022 10:53:00 +0200
Message-Id: <20220902085300.508078-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26be4d30-45c7-4b2e-2aa5-08da8cc091ee
X-MS-TrafficTypeDiagnostic: AM8PR08MB5619:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4d8dr2GpVxALKS6klh2lZpHCju5Zfkip188rH6Wld4lOU5ao8ypxPe8gIJelJQMCfZZb0NfED1FteSvSY49MTxVySigf5QZ+Ig18AbjKXiAH8E4aHi8n3FsJhW0hr9h9nPSkPgoY4oVglMFiHf1+gi6VdaePfGpBN19+fu2U3Gs/w5x+tc5371CldutXfUrG6AeJ34amzet6+0xO34RAzLDbvkMtT2HqXbqiB2gDB7X61LIpWdNC0aoto2V1iAjzMFQun2fqWgirh1s5wpZxNEmorFbDyuoo4N138wRgK+UvE04rWY6G9fZOi700pa93SJPD/go6XJfq8UuqcL+Nf16qoEDqZ8Lx1Zn0gh39+FyKOeNMemMK4r8nrivZ8A7x6FOu1IwBrbDuRE6/J9aKmxiIPqVjzaPLnI9bXrOAFjGXgm1TybIsJkojoh3Q+CBe5AQWlgeCG2/axOc2RQf9zwa+SUhehRf0s9NdI10VeMDisPkRb0pzOdWt6G3UK8PTXSC83nQDkljFQjfw2zFS52P2czl7+Yh8NbNpGNKvOhTLJku02q8gA1TRkgXMDVcIFvQ+tVWEg7DBlXn1D+wiDJLxEp/AWSLU2zryrqM3hsETueQLoXzgfi+1jAbzmWvSWW+GKtFfQbvEenBld38yQtYvNCVLVCLzuS+4oZziTZ8ezfH29ZwMKokaDtBOw7ZHzZh/tqHozGARFHCLolyfP7irDH8GYU1I5/8KDe8PiMzajfv3rxoF9DGIKjBw29Hi7C3RHwlKOlowG/QORvhH2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(366004)(39850400004)(8936002)(6916009)(8676002)(86362001)(66556008)(66476007)(4326008)(66946007)(316002)(6512007)(26005)(2616005)(83380400001)(1076003)(186003)(478600001)(6486002)(6506007)(52116002)(6666004)(38350700002)(41300700001)(38100700002)(36756003)(44832011)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GnbvaJkJTuSgKVFwMxY4zsm0zL+ByPEj1ua+VnXuEtViFjz0GjwOJAohzcsX?=
 =?us-ascii?Q?EdQEsBUrfeizKpXbEnxt2VbZtHjuAw+rSrKxiZ6kwQNjROWCwPuO1Y8EoZzu?=
 =?us-ascii?Q?9mGCMyl8NcgtlP+TzOFxVe72aNxoNkhVbw2A0eG9xhPt1MURWJd/qslUUge0?=
 =?us-ascii?Q?a3nPvXAERVopTneOeXX00lYiPWmS+myLwzlS0SauRO9DRGTZiLEu8nZJLB2P?=
 =?us-ascii?Q?E/xYIUqXNK7qFBI4dhLlcX0bmBjuAx1NMCGexIKxUoqAtuhsiCEh9UIGD0jd?=
 =?us-ascii?Q?/xPTZMSacTj0FU2JI8fnD6X+xxcrCVUexLBYfwirC81RGCpeqgmMtTPL2rDP?=
 =?us-ascii?Q?qe+9RIHfKmFgcpuNxSdyzmEDZASL0hLluchw65Z7eAw/hP7XlyIHXZE6oSx5?=
 =?us-ascii?Q?z/CUXML1kyqDWHZA4mwho3FlPVkShAaZi1FmcHYnfvkE4S/ToJLNSKSJ1JEo?=
 =?us-ascii?Q?sU2hlMBeYawaUtdohW8lBKMyKI13mXcHpceTO6egQSvFzmKSLkY26U+OjQqO?=
 =?us-ascii?Q?Wm5l57xdAxJzRM55OT/mqP5zaUqkWyRpoFuzUtXhsr4TRHdyXUFW/X5wfk+N?=
 =?us-ascii?Q?exKIQF4pr5ufha/MsriAdjsbkCTKPFFhVoxKOhE+/W7RaoL0Ue+Q7x81XLPA?=
 =?us-ascii?Q?JueDvmZby6M/PVnVDPl7c8K3aYXRA0/tRkN2DFnASyRs6fLcBAjZbdu/6uQs?=
 =?us-ascii?Q?C98G4t4Mj2/eZV3tKHQKzLaxYloZkg0H48PJn7vq6PVYBHZ/1csyr95PtlHs?=
 =?us-ascii?Q?M9hJgZr4kkxHS3SMLoOgqHjgxdmRIgig5jfpYKHEUxrVHsDG3JE27BWFpxaJ?=
 =?us-ascii?Q?ChYfnlnSWh7b0w8rkzXF7jEnx7jOVZUxL8XnyO2zdKlTwYZB4h1Z49ZU5Wiq?=
 =?us-ascii?Q?YIQ5rddLKPIZhnFlBxUjjZFLbdRIBt/ZLFp4FENfBhXY+DCEmcVQmNHECBbn?=
 =?us-ascii?Q?ItOmFUmuAHOtpq6UT9h1sYqFMhbAHKc+07Xauv1hzVSl+rciuIb3QAiwSDGG?=
 =?us-ascii?Q?Bq4oyNnG+t2hzIzW3WMZqxF43/JTln3KdI5BDrsn/fgMDYTBaTTxdhAyCryy?=
 =?us-ascii?Q?y/TMd1Pjv1xpUWrkp/Sfo3C4BbeSmIuA3gDxL6DpJign25p5W3dLCHBdTAfw?=
 =?us-ascii?Q?IrEsNTs0YisE2MrsVmtOZn/YjMOVFYpq+/n9kCd5ENzeV6pcAwzoD3Fk9tJ5?=
 =?us-ascii?Q?XIb2CXyoPuN5DTFaIb+lq1P8M2AkVgFPp6pufHzUVnaDleSg1v2iJIhpcOAa?=
 =?us-ascii?Q?wh+zgf2lFyVjbBoT30gtUr/cQ4qg7blMJP5ze6AB1oJi79RYNjHd4Rq40DTg?=
 =?us-ascii?Q?+vHE4YqV+pTY8rcO4LhsaVZ/0IKnol4YiWex7hCTpenE46NElKV7mwr0ik8P?=
 =?us-ascii?Q?fC0yGjcjbea0tJilOl8LLsfcenOITuPH25WImm4CXpATc70AkGD82NtQ97RC?=
 =?us-ascii?Q?iEIDswoHstJMj7EhWci2a6xl4mkAM9QODDsO0v0oppBG5/3bQE55646Xybtv?=
 =?us-ascii?Q?uA2BH8vJ8NUhNQVXA5kVu/I7HHAZrq4Qt8NVP66CkxxIiIJQ/6cpoTEqI8KR?=
 =?us-ascii?Q?pSzEJWAA0LmMT0vtPdxnm+F4ndXoCpLfxtkN+Om8f+RJxb85AQ0AzjLZYA5d?=
 =?us-ascii?Q?GoEMEkyQfIY2sNefO+1IGQo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26be4d30-45c7-4b2e-2aa5-08da8cc091ee
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 08:53:13.7510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLNvXWkFSE3JwpQR/v5Q5Y5V4/1vXByBjgMDoriZbbox/2ZCN/MuidLqcGSjVlPYflFXFANYA8m9k9zfzL4Qv29+sUz8RhbshhKud4ImyZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5619
Received-SPF: pass client-ip=40.107.105.104;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Repair an image at opening if the image is unclean or
out-of-image corruption was detected.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 95 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 65 insertions(+), 30 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 08526196da..a7c3af4ef2 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -735,6 +735,18 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     return ret;
 }
 
+typedef struct ParallelsOpenCheckCo {
+    BlockDriverState *bs;
+    BdrvCheckResult *res;
+    BdrvCheckMode fix;
+    int ret;
+} ParallelsOpenCheckCo;
+
+static void coroutine_fn parallels_co_open_check(void *opaque)
+{
+    ParallelsOpenCheckCo *poc = opaque;
+    poc->ret = parallels_co_check(poc->bs, poc->res, poc->fix);
+}
 
 static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
                                             Error **errp)
@@ -947,8 +959,8 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
 {
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
-    int ret, size, i;
-    int64_t file_size;
+    int ret, size;
+    int64_t file_size, high_off;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -1027,34 +1039,6 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->bat_bitmap = (uint32_t *)(s->header + 1);
 
-    for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i);
-        if (off >= file_size) {
-            if (flags & BDRV_O_CHECK) {
-                continue;
-            }
-            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
-                       "is larger than file size (%" PRIi64 ")",
-                       off, i, file_size);
-            ret = -EINVAL;
-            goto fail;
-        }
-        if (off >= s->data_end) {
-            s->data_end = off + s->tracks;
-        }
-    }
-
-    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
-        /* Image was not closed correctly. The check is mandatory */
-        s->header_unclean = true;
-        if ((flags & BDRV_O_RDWR) && !(flags & BDRV_O_CHECK)) {
-            error_setg(errp, "parallels: Image was not closed correctly; "
-                       "cannot be opened read/write");
-            ret = -EACCES;
-            goto fail;
-        }
-    }
-
     opts = qemu_opts_create(&parallels_runtime_opts, NULL, 0, errp);
     if (!opts) {
         goto fail_options;
@@ -1116,7 +1100,58 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         error_free(s->migration_blocker);
         goto fail;
     }
+
     qemu_co_mutex_init(&s->lock);
+
+    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
+        s->header_unclean = true;
+    }
+
+    high_off = highest_offset(s) >> BDRV_SECTOR_BITS;
+    if (high_off >= s->data_end) {
+        s->data_end = high_off + s->tracks;
+    }
+
+    /*
+     * We don't repair the image here if it is opened for checks.
+     * Also let to work with images in RO mode.
+     */
+    if ((flags & BDRV_O_CHECK) || !(flags & BDRV_O_RDWR)) {
+        return 0;
+    }
+
+    /*
+     * Repair the image if it's dirty or
+     * out-of-image corruption was detected.
+     */
+    if (s->data_end > file_size ||
+        le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
+        BdrvCheckResult res = {0};
+        Coroutine *co;
+        ParallelsOpenCheckCo poc = {
+            .bs = bs,
+            .res = &res,
+            .fix = BDRV_FIX_ERRORS | BDRV_FIX_LEAKS,
+            .ret = -EINPROGRESS
+        };
+
+        if (qemu_in_coroutine()) {
+            /* From bdrv_co_create.  */
+            parallels_co_open_check(&poc);
+        } else {
+            assert(qemu_get_current_aio_context() == qemu_get_aio_context());
+            co = qemu_coroutine_create(parallels_co_open_check, &poc);
+            qemu_coroutine_enter(co);
+            BDRV_POLL_WHILE(bs, poc.ret == -EINPROGRESS);
+        }
+
+        if (poc.ret < 0) {
+            error_setg_errno(errp, -poc.ret,
+                             "Could not repair corrupted image");
+            goto fail;
+        }
+    }
+
     return 0;
 
 fail_format:
-- 
2.34.1


