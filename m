Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD55B4B9219
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:09:12 +0100 (CET)
Received: from localhost ([::1]:44242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQbv-0004AS-7l
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:09:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGm-0004PX-Nx; Wed, 16 Feb 2022 14:47:20 -0500
Received: from [2a01:111:f400:fe08::723] (port=55682
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGb-0006EC-AM; Wed, 16 Feb 2022 14:47:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9j0zAYm6iPV6uogsmeN2mj9knPg0Sd4DOATfidFJJP0i4GlgcFUxt2PTFSyoHRmTrZ833nmT63EdkivhYWULuo+fBJnws/UydjIO3zGXgki4TZGw/fU4DQ10WlT6ZOYziNX4stjXC6Szldc6ZrSuw5y9scXekc3xodjtg1tfgdOw/w+lcSPgJzqDafMev7Zv/bcrtroOmeXBVoME9Ufg8qGXoclEXKF9uTPnLhf06+rQP6+r//cNrL4UimX8ZlrRUtfZOTgOREG3XTK9z6ybxgI20eIKw4l2adu3YeOQIxWEwJfqo7AzFN+xIuPf+w1rx8kLba9U2UrqnYQU7WawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFmFtwmfjB62d+1WGO9GnDc3H6KS+9ooj7oKcSw5TDk=;
 b=ZvANLgTXB0MdGd5fUML4u2vbPSuFNBySYH1HvVKyVvea4UJ0PLnv/bqPpWFnaLXAo9+wMv21ul9IcRHa4clalL2cbrgFKNHcwoZOcMTVqtYhUwxfuFZd6t5JHpWjM37x9ELChD11HGrdK6ARH5IVg00CisenS6Z17LAFhPUe5m22eobKHo0yBrHpNbBkYsNkTNd55qdTu3AFPAEe1XAEAxTVTbi8eHw6K7UIUlr4u9ZTUEGRUEvEx3hc56ZuoF2Wf5GoYfIuPaB3DrONCoU9i372f9s9W/FOcySrsgxtJMPJcf8wBcZSo+CirFvunC1Iyhn21/mdMM6pAwtAV7yQZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFmFtwmfjB62d+1WGO9GnDc3H6KS+9ooj7oKcSw5TDk=;
 b=wpKjn93dj4sH+hQmPH5SAg3nIu1o38Y6KRl+p8aQN2D+q+fh4yOduEhWamOJmC7v1iLNgjnSkoBKiIvE/SThOs0kf71bHt/bxLGEbHp8PG3g+75DZn9IjnmByMuR7GHXAmG3K29eC1ZttiMUhwD22HpkYoehkuEniBbk0Usdm0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:40 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 12/18] block: copy-before-write: realize snapshot-access API
Date: Wed, 16 Feb 2022 20:46:11 +0100
Message-Id: <20220216194617.126484-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03c63704-4bd9-43ed-254b-08d9f1850d4b
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB28511EDB8BA4E8999660F00EC1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:190;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ytztWuzuLMWy0pi21uQPSvQ4XvNxYIN2HSEKtGUpo4ByCs1h+DCf9B4I+S0/LRrOhHoJPP4zeZO2DBmdbra00BTlFlwcoSZKB3ethxaMqv+DdomAYqVrxjBQ2YL+Vyl1tDWQiDJZ0qIARgQ00PEO0NhwcxAraVVzwXUdi9iuYD4Sr4DU5znmuAExIHDNlWt0s+V9gZy8FZ1xR726kc/RJd76TO3AgCt3s+kg4QuBtlKDCra7jO58jXZ0V/Uiq+BiNBY/wNMw19FgnUKCWfH/drcjlHIp+ItlMIYzRKX8Y/lH6xJquVDdVn/MyN0CnKafO305vRHTN/ehCUqcbdYN0gcqYi7cRJdD/2lpZTzcymws1r5bhUZBKp7rrGEGD6VdeAl9Lmd7zJB4V/O9/S6PZLCkexssoFyRoRuRItb/ITbaCHHPd4+cAC8BAaMxculkBMxn16XTOytvWUDmTyFsblY4pN27Jewo+5s98UArQso921maAb9dnoDz+uPLw0sqU/xF6/30UdIzwV9uIcMtioZHt4AD7L9uKQWTl5gdMSu+QmnUVtGhid5xgMI4vCjPOkOhPfsHX0OQiZtpqfG1mSILX7gVjlMJ7jyS3RX8+PGYpKIbH8gpuG4mYksAZcuZapFJK1mnxmnvRsASzmXRZjXOzEBj7v2c1+aTlc4rMadDL2k0scYB3ncAk+b/tzuKrY0VvOgifvJx0f5366KGog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(30864003)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jwVXFVWGmj2pHzzJTL2pgED1ZOdZ/3BHWQ5MLR7RI6gZn9m/9YZo9DXp5Cra?=
 =?us-ascii?Q?FJYKt6ARUMDKeHARjwrlv2MMdbvSXIczP1i3svLnvpdu3d2p1s6epnod3/fc?=
 =?us-ascii?Q?RJ8dhRuXV7SyFCoqMh1MpVcbLGTtitqjq9Qret6kN8dHdRvuiwer1Rr9gDQ3?=
 =?us-ascii?Q?/yATOGBK+5l5SWxHOzclfYnqFTZUMGgv3CfJtTHJ/YcqAffFtnswyZ6HTNkO?=
 =?us-ascii?Q?W2JtCjBy3hzKnFX10RnAUfVEisNrJmhQHWpGhVTeZxJ4rHR7H4Sg2OyNB3FQ?=
 =?us-ascii?Q?WoprsrzyFO34EATZ/EGYLDCN+GgjBOKxkZJfHjPcPuArI74XjTSKmL6bYdnQ?=
 =?us-ascii?Q?DzSlOrGPOkLtlv3mpUaNjQRsZrzsIup1Vl1/GTzFkGZBQSuqT4kjrWklFD+E?=
 =?us-ascii?Q?5QK2oBfDlly13dXXZ7rpOSQ288l5dAGDyZ4CynvnhWCuzpYAm1xWj1Zd3O4F?=
 =?us-ascii?Q?K4Bsd7k84UAJ3t1OgmTVDiYR02wDyxPpPi0VmfLhCjweVc6w/r+6Z+pbhTJZ?=
 =?us-ascii?Q?cMXIIs1kMRg/u3UUZZkb2ZJkaYo3knTW9zTWsaw4sbBYEucuIb4LQuvyRxyu?=
 =?us-ascii?Q?uy07wuOQQriPvZykQJ/B3rxO9nWak8IF0Yzo9FxWD9iNZROwamxRzy5XtQAt?=
 =?us-ascii?Q?r+z4cIH8dLoFikL+ho9q27J6DC8kEa+5uGLl/Y47WTNTQDz9F2bwI5jWv3ad?=
 =?us-ascii?Q?Uj6dWJJGUENoiK6ou8bGydN6rlcwznHVnBcgxbD8O9qq8AkY243d9wzR6GLY?=
 =?us-ascii?Q?kJ9kN5WyBh2XYK+mteTcpTYbEcYKwiiW+nXG1U/hTIWOW5kWwMVHue/gg28Q?=
 =?us-ascii?Q?1sZ69JkstKbu+3TfglqiUn2EfT+HiuRoR244Ryfik5XbjXV2HGrUketwjhpi?=
 =?us-ascii?Q?TPDX35Cj904fss3ajDQiCFVqlEja++MxPgL7hLGzTsmoi2hf83/ygkcnq/Jd?=
 =?us-ascii?Q?98kWUYhQk8aGOOsXCflPz72lUbCfqK9xnjULOg9ldvLbKMnbtYHgFyTBzVmu?=
 =?us-ascii?Q?8Xamzs7PbOLCNVx2cT5whW5WYzhchX/V9u7Btdh3wzKMzq6nAUaKyaRCdOwZ?=
 =?us-ascii?Q?KNkUK1D/WccqgK3Zd2FRX1qJZGzL55P5Zf37UJV0k7cnonYgWwoD2LryCzPs?=
 =?us-ascii?Q?9V6Q+pUHNNtstwuSZ5yjtnyRp/QxWQY18R4kL4Jt95gTSYsLbrYRRNjdNGiH?=
 =?us-ascii?Q?WrODTohed7NHJJ21ixxfwjcbYghMdqkq5hR00/WeghisWZtzpDXqhBI2r9zN?=
 =?us-ascii?Q?wa3Yf86FDKP9yKJJ5LR0wx0S382oHLlCg79vTVAFYQzT3h3hC04+0O8YoNxM?=
 =?us-ascii?Q?h/nSw54nZ0o2S/lKTfsQMGIUlk9BzceBC54MrZuawY68lioFq7MSZ5zerzRO?=
 =?us-ascii?Q?QCk1p5e0O5X8L/8umbGEy4wxzKIYzLrVrnfBcEjLAWYQ+v7mQh8qFxpUZYiu?=
 =?us-ascii?Q?c1KKmx3jDna/uCpDAIwFOt93hj1lZwuHfvTxO76V9imKz19rhp/Wovyjlwwe?=
 =?us-ascii?Q?Q8s+pSVScX3J0gjSzLParDC+IiwhtGvaVGJRwZlzFiJm1CnwMDQVsm5aFC5x?=
 =?us-ascii?Q?oDL6nzwHXY62dasm4TXxg9BBf+30fM701ylNEoCOLnWhO1iG+kAnjFqOmfnt?=
 =?us-ascii?Q?fOZGXYo9181e8ANeH0c1MuRjgAXCYd5J3jybc07DgC3VSsY1mVeGqIU7kv7z?=
 =?us-ascii?Q?+8ZUtg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c63704-4bd9-43ed-254b-08d9f1850d4b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:40.8108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VhqK73dgZG3al+OKFP6cZaRBgq6YM82V+Ta240IddvGxqvHsntFgzrpf/pGJPbWU1qN1soMVtqGw5B4rz2PrQgvD1dI2R05tQUeEvtGMOCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe08::723
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe08::723;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
[copy-before-write]<------[x-snapshot-access]
   |           |
   | file      | target
   v           v
[active-disk] [temp.img]

 - copy-before-write does CBW operations and also provides
   snapshot-access API. The API may be accessed through
   x-snapshot-access driver.

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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 212 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 211 insertions(+), 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 91a2288b66..a8c88f64eb 100644
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
+    ret = bdrv_block_status(bs, offset, cur_bytes, pnum, map, file);
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
-- 
2.31.1


