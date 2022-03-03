Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EB14CC697
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:53:17 +0100 (CET)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrVk-00036L-P4
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:53:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNE-00045q-PN; Thu, 03 Mar 2022 14:44:29 -0500
Received: from [2a01:111:f400:7d00::701] (port=54113
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNB-0004Yn-Ja; Thu, 03 Mar 2022 14:44:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cajdnQR14wHtWv8XE9DjS+g3QMIvp2gJD5U70PQfaSK3jJfqNjAZYS3M2I6sNnghZyrBXeOpLB+yZu24HuZQWra5Yd+qdPaEPRWoznjA5VW3I+n5fVP7aMPComCTDls6Gb8mrxss6qGzZYF06QPBwv74bWj+SEibVLdqALGVI2knjDEhnyAZihpjpFYAKD+huJSCzzHr+zi+q5iO4OMUZJXR5U81/BXKg8MO544ab32P/3Hllh/vfDyy6lzSc46eDIXLqOJHdp+qv0er2ETRei2Hl/FME9RQcNR27AAA/Cx+4pcflcpspXVtum7htPLBHLefedgjh+L2ihWL4F4dDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8qT6l4df7zH8Odw5sbvg5lpWLiA1hTk9zOAAnhZZLA=;
 b=TPkbPQ0fcZc6Y078vRGxZ7ZBALYDCUx2PMr4vIjqV7HzfcEg8Srj9wezi7grGJS38Com8Aq8541J3Cdcg6j4uYLS+K8YW+9LtTFfayUwq0RWilP30t5KSEgAFJF43yXj1mJgTCSISpU6VF7XqWVNKWlUhFs6IJNBJ6/cIxCH5RgjTb4ZeAjMbfse4hiXmKtkby5wDiU3BEHbFaUJSWtZIwouG7T65uG56P5PfPjGrurPS18O84Di6pDcjJQ/a7A6Zjq5rS7PzkUXXnPpqJkV3aCRdcd2d9YvRXrKbYlrgSkdH/XCgxUcHuQ5QYeTXYjp/jdC93Ojry1P6mWaNcbf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8qT6l4df7zH8Odw5sbvg5lpWLiA1hTk9zOAAnhZZLA=;
 b=VCm4DuXE0DWn4tIgB229t9kX8t1BFtHOXIf8oLGj3cpiJyCc/C+rTt9WbKeb2P0cEl9FKo+o0JE0D55vuf4+kpTI7DpcR3K3LsO/5oG+rs6HTIY4qnsGcC9daSfc4bP9ddLkzlgLsbiuHy2ksDVDRAYF/OFdpTN2yVRJsQfyo6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:14 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 12/16] block: copy-before-write: realize snapshot-access API
Date: Thu,  3 Mar 2022 20:43:45 +0100
Message-Id: <20220303194349.2304213-13-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: e55ae214-7262-45c7-3c87-08d9fd4e320c
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB47364FD4383DADB69D287591C1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Db5YMJ2JMNpuUGn5IruDDCNmGgu/j6Xy4za2RmTuZ7u6CUgre6VnamdnOc8ZNEWRHUeXs3dxYg9nqrlJuQR/13+gMezhAqtSdJEmQrLKqFWGIq1Cw/4IVVh1h68ArUqQG+ieNCTCA6qQWPMXbdDOJt0p74wmaUzVaI2IdtutewSbgNe+nOROT0P2nn3cyY9hgIft+c+zg34uG2NL5Dqt/wh7f/uf9o2yFyojalZEP88a/7hm1qASlXrT7qSGp2YvxH4DRH0Cy2PxNd5+9sedj0SiSJtVDfDoZaRmiE/RVHw9Plavhy2QiHIxO88t5atXbGyTCGyWHuml/4KagOfDAWURsszeckhuju+qbITrX5T+Q734vECI7hk038ySeayJPry+j9vGdB+hO3EzPb8wHQ2fdZCEt8xRc77QWXkWnLqcniv/pCmrYFZMe/PzCCYR9PGaqggPxEHUZhy+IkvRYCfBb08cnJLDZ9j1v6+ffF5Gu5E2Ljn9EQ01nNiQ2C8ne9dxL4Ze4u2M33mItPVESLzlj2yshV1gq764NvnJ9Zp6JXQLKyDnJJfQTij8MtMXrkF4PMXlOTrzufox1SETvK0fDgx9l8HE4a8WYgX5j4zuZ9M/FN2iWY4RBF3ccRBQspfK0z3HXGP6DjHvXAF06mIDvSx3xKnKoF+iTYW4BIqYMjB/S5GzP73O4BAH/dM4Gju63a9+xMd8sAbzEM7CPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(30864003)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5KK//0amId0oY5/IjcxAJV413c7r1hy+UwhnyUQj06+25mLXixcnAOVNGEoK?=
 =?us-ascii?Q?aM8oyrbN0zu3uO+JTwk4O+7AHgLn718UAkp8deVI76fFxPTNL/Ct8EL17uDL?=
 =?us-ascii?Q?XePiYZGeRpdS/4cvqXQ56xig/9FtCRvyHEr6MAg/JvJto+xi0lXblBfJSIxf?=
 =?us-ascii?Q?bfFsdp4Dk8VfapUBJm0JyZ3I7iNYci/WkSB+rekwyq7G63ZKuTi5XbifZf6+?=
 =?us-ascii?Q?//ogAsKgLkwn/cTDnePgYQmw0jAzboAYKyI6wlqioE2BYwl47KF5zUl7QAOj?=
 =?us-ascii?Q?98r3k/nfhea/UwNxeqL52cgRwHnb7rY1QD0JJNSGL+yEFw2PcEGoDKen5VJs?=
 =?us-ascii?Q?bHvAg1BSKoj0UUMoOVw/W5xZi5mVY9HbF6j44zpAv2Iz+QrvCihVgoTVOPwf?=
 =?us-ascii?Q?aV9dvxERzHMZI3ZG7nUVci2MaBlME/iyisYMkFiBqjaHH9UDPkI5We/KFkiU?=
 =?us-ascii?Q?VekY5zhMizWBHyhBVa0TBmJH7zjJRX+jgWhr85qc1gU8VZmEGpQMRYhxErjt?=
 =?us-ascii?Q?yeRVGtag0jxfh5P/DBEuO0Jr2hSQsPyRqBDdCerKvTVl1pFlFwrqGrbW1klv?=
 =?us-ascii?Q?S8RBbH5AsjEIRs1IEGDVG60ezzQ8Rxe6Hct5GZFlhi+7EkebIgsXt7v2femU?=
 =?us-ascii?Q?D+H/Rtp/3gXxgEes44TmgD/D9RsWHaw+xFuOhdU+aGl1w+IqGTOU3RQkVein?=
 =?us-ascii?Q?tJ84iKAYkg/5bFyDoZsO0rIdG0OOJ618Tu534pg6n+CdUdpS7s0cZt9F+yf3?=
 =?us-ascii?Q?xIyMiAIQRYrUSWOD+595Z33FIHcGwouCpBwXeifWR9S3JpukuAH5iqC5Pu9H?=
 =?us-ascii?Q?bh7CCYsKyTeQotmfqq3tz7zJROKvmxmLFBVP3ca4crn+SB1cy17Tkw1mwrfB?=
 =?us-ascii?Q?TVAKUyNTmcULt0K2quWCkvg8HCpxcxvUAUrqofLLZcLA7kaAM0g8yYUZxQph?=
 =?us-ascii?Q?D/hp/lOIRuZiyI59zhRGeRD3xo7EgJQGAvgLh+HV9LUXJ6KA8fo/nnIB+DQc?=
 =?us-ascii?Q?PhFi83CaZDyo/NqP7icF+mG+ZQGmGDx84jlCdfGy/1lc4iRhPqBuq0ybXqYy?=
 =?us-ascii?Q?/FN3QslwutRRFSU8735JYwFEri7jkmeRp63Xzgo2l4Oiy5mr+74YTPRiND4s?=
 =?us-ascii?Q?nzdsCJFldQRlIONUj8GhbkuGT8Hp5Iad128KhqHYYkhIVi4OvP+e/4w2fA91?=
 =?us-ascii?Q?bEjmPlKUj6xIU5j1GQaILpLBxx9xNdu5viBBpbbHSNQBLsQo3FkkLU/OJsaQ?=
 =?us-ascii?Q?BQQ1R6JiSJnFrlVjD+Jv9wwS/SBPMGQqApC0B+PDah6He1FcQ7JDNC63ADyC?=
 =?us-ascii?Q?YaVF3DkOHB9busKoz0VORccz6RvNou2a2uzYaHG9LbJInfyN7Afs6lmFfdAV?=
 =?us-ascii?Q?tgW4H7nFLCBywykFtv+LVsd3NTxXz1/Bjtqdd0eA38dc7Sp8ZiISRFMOGLel?=
 =?us-ascii?Q?ByEAcNXPbLcaSwyVoSdJ4SRZaWJYb/OYGot52s4L5Ffm6/YtOrYwqOfNOtKH?=
 =?us-ascii?Q?EkPNpl/t0snX4TxB6AtXJwDv0kUDUQgEJJ8twOqfneU1CZj4ZwIQ8PqRcY+8?=
 =?us-ascii?Q?6Wl4VjW8y6UuQuVf40pVuNzNn+d4ezb/2q58eJFRRaxMmkQYjqz7J0JkEn4U?=
 =?us-ascii?Q?yXTEA0AM6vwYv0shml3PgBDUVItpkJGEdFQa9Uw2Cs4BaW3Y7OoeJA5qxY6G?=
 =?us-ascii?Q?564yXw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e55ae214-7262-45c7-3c87-08d9fd4e320c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:13.9824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCWGf6gxP0vM/r04XpfhmFc4TWK48o2UiPdZr7tdP3YgjSSHg/d/DmyagGmaG7p3t8ZQftlVyJgFqXIvj4gpqBqFZrc1S8brQAmtDL96IrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::701
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::701;
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

Current scheme of image fleecing looks like this:

[guest]                    [NBD export]
  |                              |
  |root                          | root
  v                              v
[copy-before-write] -----> [temp.qcow2]
  |                 target  |
  |file                     |backing
  v                         |
[active disk] <-------------+

 - On guest writes copy-before-write filter copies old data from active
   disk to temp.qcow2. So fleecing client (NBD export) when reads
   changed regions from temp.qcow2 image and unchanged from active disk
   through backing link.

This patch makes possible new image fleecing scheme:

[guest]                   [NBD export]
   |                            |
   | root                       | root
   v                 file       v
[copy-before-write]<------[snapshot-access]
   |           |
   | file      | target
   v           v
[active-disk] [temp.img]

 - copy-before-write does CBW operations and also provides
   snapshot-access API. The API may be accessed through
   snapshot-access driver.

Benefits of new scheme:

1. Access control: if remote client try to read data that not covered
   by original dirty bitmap used on copy-before-write open, client gets
   -EACCES.

2. Discard support: if remote client do DISCARD, this additionally to
   discarding data in temp.img informs block-copy process to not copy
   these clusters. Next read from discarded area will return -EACCES.
   This is significant thing: when fleecing user reads data that was
   not yet copied to temp.img, we can avoid copying it on further guest
   write.

3. Synchronisation between client reads and block-copy write is more
   efficient. In old scheme we just rely on BDRV_REQ_SERIALISING flag
   used for writes to temp.qcow2. New scheme is less blocking:
     - fleecing reads are never blocked: if data region is untouched or
       in-flight, we just read from active-disk, otherwise we read from
       temp.img
     - writes to temp.img are not blocked by fleecing reads
     - still, guest writes of-course are blocked by in-flight fleecing
       reads, that currently read from active-disk - it's the minimum
       necessary blocking

4. Temporary image may be of any format, as we don't rely on backing
   feature.

5. Permission relation are simplified. With old scheme we have to share
   write permission on target child of copy-before-write, otherwise
   backing link conflicts with copy-before-write file child write
   permissions. With new scheme we don't have backing link, and
   copy-before-write node may have unshared access to temporary node.
   (Not realized in this commit, will be in future).

6. Having control on fleecing reads we'll be able to implement
   alternative behavior on failed copy-before-write operations.
   Currently we just break guest request (that's a historical behavior
   of backup). But in some scenarios it's a bad behavior: better
   is to drop the backup as failed but don't break guest request.
   With new scheme we can simply unset some bits in a bitmap on CBW
   failure and further fleecing reads will -EACCES, or something like
   this. (Not implemented in this commit, will be in future)
   Additional application for this is implementing timeout for CBW
   operations.

Iotest 257 output is updated, as two more bitmaps now live in
copy-before-write filter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c  | 212 ++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/257.out | 224 +++++++++++++++++++++++++++++++++++++
 2 files changed, 435 insertions(+), 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 91a2288b66..0b6d26605c 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -33,12 +33,37 @@
 #include "block/block-copy.h"
 
 #include "block/copy-before-write.h"
+#include "block/reqlist.h"
 
 #include "qapi/qapi-visit-block-core.h"
 
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
+
+    /*
+     * @lock: protects access to @access_bitmap, @done_bitmap and
+     * @frozen_read_reqs
+     */
+    CoMutex lock;
+
+    /*
+     * @access_bitmap: represents areas allowed for reading by fleecing user.
+     * Reading from non-dirty areas leads to -EACCES.
+     */
+    BdrvDirtyBitmap *access_bitmap;
+
+    /*
+     * @done_bitmap: represents areas that was successfully copied to @target by
+     * copy-before-write operations.
+     */
+    BdrvDirtyBitmap *done_bitmap;
+
+    /*
+     * @frozen_read_reqs: current read requests for fleecing user in bs->file
+     * node. These areas must not be rewritten by guest.
+     */
+    BlockReqList frozen_read_reqs;
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
@@ -48,10 +73,20 @@ static coroutine_fn int cbw_co_preadv(
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
+/*
+ * Do copy-before-write operation.
+ *
+ * On failure guest request must be failed too.
+ *
+ * On success, we also wait for all in-flight fleecing read requests in source
+ * node, and it's guaranteed that after cbw_do_copy_before_write() successful
+ * return there are no such requests and they will never appear.
+ */
 static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
         uint64_t offset, uint64_t bytes, BdrvRequestFlags flags)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    int ret;
     uint64_t off, end;
     int64_t cluster_size = block_copy_cluster_size(s->bcs);
 
@@ -62,7 +97,17 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
-    return block_copy(s->bcs, off, end - off, true);
+    ret = block_copy(s->bcs, off, end - off, true);
+    if (ret < 0) {
+        return ret;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        bdrv_set_dirty_bitmap(s->done_bitmap, off, end - off);
+        reqlist_wait_all(&s->frozen_read_reqs, off, end - off, &s->lock);
+    }
+
+    return 0;
 }
 
 static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
@@ -110,6 +155,142 @@ static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
     return bdrv_co_flush(bs->file->bs);
 }
 
+/*
+ * If @offset not accessible - return NULL.
+ *
+ * Otherwise, set @pnum to some bytes that accessible from @file (@file is set
+ * to bs->file or to s->target). Return newly allocated BlockReq object that
+ * should be than passed to cbw_snapshot_read_unlock().
+ *
+ * It's guaranteed that guest writes will not interact in the region until
+ * cbw_snapshot_read_unlock() called.
+ */
+static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
+                                        int64_t offset, int64_t bytes,
+                                        int64_t *pnum, BdrvChild **file)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+    BlockReq *req = g_new(BlockReq, 1);
+    bool done;
+
+    QEMU_LOCK_GUARD(&s->lock);
+
+    if (bdrv_dirty_bitmap_next_zero(s->access_bitmap, offset, bytes) != -1) {
+        g_free(req);
+        return NULL;
+    }
+
+    done = bdrv_dirty_bitmap_status(s->done_bitmap, offset, bytes, pnum);
+    if (done) {
+        /*
+         * Special invalid BlockReq, that is handled in
+         * cbw_snapshot_read_unlock(). We don't need to lock something to read
+         * from s->target.
+         */
+        *req = (BlockReq) {.offset = -1, .bytes = -1};
+        *file = s->target;
+    } else {
+        reqlist_init_req(&s->frozen_read_reqs, req, offset, bytes);
+        *file = bs->file;
+    }
+
+    return req;
+}
+
+static void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
+    if (req->offset == -1 && req->bytes == -1) {
+        g_free(req);
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&s->lock);
+
+    reqlist_remove_req(req);
+    g_free(req);
+}
+
+static coroutine_fn int
+cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                       QEMUIOVector *qiov, size_t qiov_offset)
+{
+    BlockReq *req;
+    BdrvChild *file;
+    int ret;
+
+    /* TODO: upgrade to async loop using AioTask */
+    while (bytes) {
+        int64_t cur_bytes;
+
+        req = cbw_snapshot_read_lock(bs, offset, bytes, &cur_bytes, &file);
+        if (!req) {
+            return -EACCES;
+        }
+
+        ret = bdrv_co_preadv_part(file, offset, cur_bytes,
+                                  qiov, qiov_offset, 0);
+        cbw_snapshot_read_unlock(bs, req);
+        if (ret < 0) {
+            return ret;
+        }
+
+        bytes -= cur_bytes;
+        offset += cur_bytes;
+        qiov_offset += cur_bytes;
+    }
+
+    return 0;
+}
+
+static int coroutine_fn
+cbw_co_snapshot_block_status(BlockDriverState *bs,
+                             bool want_zero, int64_t offset, int64_t bytes,
+                             int64_t *pnum, int64_t *map,
+                             BlockDriverState **file)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+    BlockReq *req;
+    int ret;
+    int64_t cur_bytes;
+    BdrvChild *child;
+
+    req = cbw_snapshot_read_lock(bs, offset, bytes, &cur_bytes, &child);
+    if (!req) {
+        return -EACCES;
+    }
+
+    ret = bdrv_block_status(child->bs, offset, cur_bytes, pnum, map, file);
+    if (child == s->target) {
+        /*
+         * We refer to s->target only for areas that we've written to it.
+         * And we can not report unallocated blocks in s->target: this will
+         * break generic block-status-above logic, that will go to
+         * copy-before-write filtered child in this case.
+         */
+        assert(ret & BDRV_BLOCK_ALLOCATED);
+    }
+
+    cbw_snapshot_read_unlock(bs, req);
+
+    return ret;
+}
+
+static int coroutine_fn cbw_co_pdiscard_snapshot(BlockDriverState *bs,
+                                                 int64_t offset, int64_t bytes)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        bdrv_reset_dirty_bitmap(s->access_bitmap, offset, bytes);
+    }
+
+    block_copy_reset(s->bcs, offset, bytes);
+
+    return bdrv_co_pdiscard(s->target, offset, bytes);
+}
+
 static void cbw_refresh_filename(BlockDriverState *bs)
 {
     pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
@@ -194,6 +375,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *bitmap = NULL;
+    int64_t cluster_size;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -225,6 +407,27 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    cluster_size = block_copy_cluster_size(s->bcs);
+
+    s->done_bitmap = bdrv_create_dirty_bitmap(bs, cluster_size, NULL, errp);
+    if (!s->done_bitmap) {
+        return -EINVAL;
+    }
+    bdrv_disable_dirty_bitmap(s->done_bitmap);
+
+    /* s->access_bitmap starts equal to bcs bitmap */
+    s->access_bitmap = bdrv_create_dirty_bitmap(bs, cluster_size, NULL, errp);
+    if (!s->access_bitmap) {
+        return -EINVAL;
+    }
+    bdrv_disable_dirty_bitmap(s->access_bitmap);
+    bdrv_dirty_bitmap_merge_internal(s->access_bitmap,
+                                     block_copy_dirty_bitmap(s->bcs), NULL,
+                                     true);
+
+    qemu_co_mutex_init(&s->lock);
+    QLIST_INIT(&s->frozen_read_reqs);
+
     return 0;
 }
 
@@ -232,6 +435,9 @@ static void cbw_close(BlockDriverState *bs)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
+    bdrv_release_dirty_bitmap(s->access_bitmap);
+    bdrv_release_dirty_bitmap(s->done_bitmap);
+
     block_copy_state_free(s->bcs);
     s->bcs = NULL;
 }
@@ -249,6 +455,10 @@ BlockDriver bdrv_cbw_filter = {
     .bdrv_co_pdiscard           = cbw_co_pdiscard,
     .bdrv_co_flush              = cbw_co_flush,
 
+    .bdrv_co_preadv_snapshot       = cbw_co_preadv_snapshot,
+    .bdrv_co_pdiscard_snapshot     = cbw_co_pdiscard_snapshot,
+    .bdrv_co_snapshot_block_status = cbw_co_snapshot_block_status,
+
     .bdrv_refresh_filename      = cbw_refresh_filename,
 
     .bdrv_child_perm            = cbw_child_perm,
diff --git a/tests/qemu-iotests/257.out b/tests/qemu-iotests/257.out
index 50cbd8e882..aa76131ca9 100644
--- a/tests/qemu-iotests/257.out
+++ b/tests/qemu-iotests/257.out
@@ -106,6 +106,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -566,6 +582,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -819,6 +851,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -1279,6 +1327,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -1532,6 +1596,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -1992,6 +2072,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -2245,6 +2341,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -2705,6 +2817,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -2958,6 +3086,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -3418,6 +3562,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -3671,6 +3831,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -4131,6 +4307,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -4384,6 +4576,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -4844,6 +5052,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
-- 
2.31.1


