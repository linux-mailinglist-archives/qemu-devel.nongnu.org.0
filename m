Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6243735DC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:54:02 +0200 (CEST)
Received: from localhost ([::1]:47440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCM5-0000iz-87
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIv-0005hC-3l; Wed, 05 May 2021 03:50:45 -0400
Received: from mail-db8eur05on2090.outbound.protection.outlook.com
 ([40.107.20.90]:42592 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIq-0002eS-SS; Wed, 05 May 2021 03:50:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IphS6hs3bfF2u6JTYZKqwPcH3QxDaKMqGa1Vy3lbPPPNkg3Clyyjvc/lFpWrmkAec7wMau34oGUayi7+fzVafffGvYBoP/3C4U+skXSfMF1V2KOeCNuRXCB20ZmIbcXV7oLfTI+OIA8Kt2qBpE8FGrB5vWqBljeHQ/oOxjVu6hHRxXl7pPC1jWWpPsBOomVe92jgMXI9nWMEhIxKQUgYYJyN4r8ohm4EKfiEB7FKF1f75MQ6l1jtcGpZM1BoHorhPSGewGVDAxJEWXXMpdz/+uETawWkBmaxDi0R6XA50pHxrTrEcEXY6CNweVJAbUdqG4cInovd18cW6nrsP9PMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QBEzlNRBT4XnUuG4iLRTK0i15JXnj5g/1WR0ovpvsA=;
 b=nSTdjFPPVeIVSR+Buk1NyKNWmZVzTa/5NdX37OPr5V4aCYlzHbFsrgi/A+ScwGZ8VreCE6nfCAduIa0YM45ZcDrtpUyDx8ijNPFgumUK+BytV5GGnoRmGcoytjNyqWvLpeWMJn2UglMqo3gon781VUkm/RD9T6OIuiEsusndex19q6IQ1R3UrCDi0iJv6oo6dirbNt8z2dC2GBnynv8Et5ptIUxsAj7MaAZKIPxTloMOH3xXiaUD4ZV7IxJ2fAJyNlkQm/+H3j9Rdopa6N4TCU2ufX4bQIqX/+ey8HjyKfRggcJDSUm/YTnQy4xZ4Dwt5+BPKbPWx9+toIn/e2M12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QBEzlNRBT4XnUuG4iLRTK0i15JXnj5g/1WR0ovpvsA=;
 b=QMGmuRvsLj7sgmD3X/yQ1RNJRniIOY4T42n4TMHFqFE0xJ12sr0wFUnUbS/rOi98EXlbxlU6uYmvF0g5Tpf+2SRPeLxzEvwuQGV39mCYf5/1X1Vyhka8ZoiR5MxgysqVytzlXZ42KlZsygOhtYFgnfdZ3nGhEsTcJgYj0DLJJ1Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.39; Wed, 5 May
 2021 07:50:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:50:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, vsementsov@virtuozzo.com,
 John Snow <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, Peter Lieven <pl@kamp.de>,
 Alberto Garcia <berto@igalia.com>, Jason Dillaman <dillaman@redhat.com>
Subject: [PATCH v5 04/11] block: use int64_t instead of uint64_t in driver
 write handlers
Date: Wed,  5 May 2021 10:49:54 +0300
Message-Id: <20210505075001.45041-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505075001.45041-1-vsementsov@virtuozzo.com>
References: <20210505075001.45041-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:50:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 154cfd84-0213-417b-e467-08d90f9a7475
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB68390670E6D7D62669668E5EC1599@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8//RiKKH0fev3MDIztq4USKDB+z4fFfxQp6Tbye4SksklbX36Q40rOYZeiuV2zobD2cObtAr6QxKoV730xzRL0nMymqGLTKLhbZ4J9C/gq092C/jlgqVwglxg1H+QfE9jRuzcREXyCT3P4wQUAGj7r0qdyvl/fyYgH1/TbC3gyoBPrf6P63fDWN7mD+PpZqwZ4yzskDJeWQonUP8TfGGlasAoL25Ztxi1u/9IU6NPs5zI+MMVhte9EcLGBJjpcAdxeJKjPHphqrTNyRPzWdUVANpijlAmRCWgL5giGq1eoqvMmDIPRiCj0M49zdQwUYghrZbVRSC1VwZIx5V/e1YzTH95b8W9oApENYhtLs3OEZ+ZNQRvw4mz1nTdnLsDe5ZrvaxeA4GAElKCaScdAKImma3VL7whcMqWgjLO3vT9iinyxZeaPholaK7Ir3ZbmwIl/HEaU1PXjCuIOIrQp0sWBDr1iYfA28pUY4U7+jedQ9OPcr9oPi1Lw3HRWXX2lyfAuEtk1R+4CGU6Cshvoezlts9H5mNN77/kud4KFmIG4SLUBx4aU8QJci+yLiYHqcQn1oWMI4f+uCqGv774zomCLGaweN/xtd8XCZHyTOJ0IEFhSj+urz46zr7YHeoUg4Ze1ZPzXdX7Ia0qnet+/GVbfbX/LNV5HZdmCvcJkLyY3vWtewFfykMSGdHYpm8pMXEOiD3dwqKh+W/QxhVrLkGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(366004)(136003)(38350700002)(38100700002)(66946007)(26005)(66556008)(6506007)(66476007)(86362001)(16526019)(30864003)(83380400001)(6666004)(7416002)(54906003)(6916009)(4326008)(36756003)(478600001)(316002)(8676002)(6512007)(2616005)(2906002)(186003)(52116002)(956004)(6486002)(8936002)(5660300002)(1076003)(69590400013)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+n7T7WONZJ1dd2OtxCPyU4q9jLf/d0wrGLewnE7TYbh3qxVxVSXL9YDvtrO5?=
 =?us-ascii?Q?wv19lzJw9DWi0HJ93B8+A6fHloylHFEIlTqVA60K/ybDkGyhkLMTk6nVs+FV?=
 =?us-ascii?Q?Npk/OG9evNKM7ioS3W/KlY8EmK/l/UFiqozOTd5h+5THQizlqIIL1oveFK7f?=
 =?us-ascii?Q?ZsatJ+JPPaeIzYd89w7jZ8J8U6uF3MpRr50wrdzgkmWVmsD2T6x36+Jy1sQf?=
 =?us-ascii?Q?C91cp06SlP8VH/i1xmc7oZRW1rEOs8Nao72xmSqJNGe3v5R56nmGNuK8FR9Q?=
 =?us-ascii?Q?zY46gQS+7FHD2cr8I4kFcs8zC/y6skFFiiM5J9mxvAMl62NuEXGgTJmyzn2f?=
 =?us-ascii?Q?bt8yAHbF2gFyKncp3lF10lh7tvQT0RA+4G83fj3JlvIIefMCnxFXxBvE2liT?=
 =?us-ascii?Q?o4i71M4e4FKavDOz8Vk0ILmHIoTPc0+dlpeV4jhUCVnuabjmLQYr0mjUvk5x?=
 =?us-ascii?Q?hlZn+5/r1hZrXeIEIJop1RS2i5mNT+x+Xd1B0rvjrUuC74YtWSsqI2Z12vo+?=
 =?us-ascii?Q?jtdIgrTFvikXV8le6o4IpDmsq43TALrnWHRH1pMoHoS/03Jokyz0eA278yI5?=
 =?us-ascii?Q?HBInhBT+o1tY6LD+oCvyH2sL4KRGpIsj6v8D9ArNuvbHQ21PYVdYxOVSs+lM?=
 =?us-ascii?Q?WQ3AdwurQ1bF7yUc8lcBfdf8ICWLxGXOUBZO3MxbC5J5EVgH11Cp8ANA64wy?=
 =?us-ascii?Q?KdC4ANKHr+g2c+ZjTlwR0NS/E9duhAo2WeXhMCKlHA2yl8OmAKamlhawe4aN?=
 =?us-ascii?Q?NZylQWtgwaJk61T693DlzDEdA9B7J1kJsLGlWlL7ehNKO6o1oOLLi2eq8T1B?=
 =?us-ascii?Q?F/+YshPpvXd0KXwDlCcMkMroJREFl70XF79wrzAzC9I64HP8ubnZqRbZ4ag3?=
 =?us-ascii?Q?xbG6ejFzcEMlcJw//ke5cF7N6Rbd14yik6zIWZE3hQmyI9b3uVTi+4fO1Kpl?=
 =?us-ascii?Q?lG+oS+LDZ+LJM6eh3ZoFNrpqLM9AcHnOBYXR/q4RYVCWy5ESRDoKz/kLr7jC?=
 =?us-ascii?Q?qWC38X++Q7FFhL2qxEW5VdZkUu36sSPxIdcRZKfT2yDHX7Gunx+nzkdb6Q/w?=
 =?us-ascii?Q?675JigGFEmn64VQg2vqRFRvocmSqq+A1nt+qiIhg4+IHIBtXkHPw2HF4cMcD?=
 =?us-ascii?Q?ReMt1qz7qOacLBkG50gEjNmmRnazDN9TFNBoPgoQcRWKSrE4a5pUsPI6umue?=
 =?us-ascii?Q?FpwUGqWJAJsq4Trcl196No9VVd1YYGbM+P3U3WdAVLC5twqwKgDJ6t26QhSL?=
 =?us-ascii?Q?LrgC3dg2jwGaUC7wyLmy8am8X38AZIJH44g5XbvIm3Mx3seYDcRUP0MPb3/3?=
 =?us-ascii?Q?OX6KsxE0kvh+jP/TrirEHxxV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 154cfd84-0213-417b-e467-08d90f9a7475
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:50:30.5258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGzGjTvtetdXznoIfQz6tR9E0+3PAcn3MtBOM9dUEeZ0GSk9Q2vKTISP+DUJFd2nYnhUCIYrydbH2T509D37R0JBU+HIV2mme6mR06bO7Bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Received-SPF: pass client-ip=40.107.20.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, convert driver write handlers parameters which are already 64bit to
signed type.

While being here, convert also flags parameter to be BdrvRequestFlags.

Now let's consider all callers. Simple

  git grep '\->bdrv_\(aio\|co\)_pwritev\(_part\)\?'

shows that's there two callers of driver function:

 bdrv_driver_pwritev() in block/io.c, passes int64_t, checked by
   bdrv_check_qiov_request() to be non-negative.

 qcow2_save_vmstate() does bdrv_check_qiov_request().

Still, the functions may be called directly, not only by drv->...
Let's check:

git grep '\.bdrv_\(aio\|co\)_pwritev\(_part\)\?\s*=' | \
awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
while read func; do git grep "$func(" | \
grep -v "$func(BlockDriverState"; done

shows several callers:

qcow2:
  qcow2_co_truncate() write at most up to @offset, which is checked in
    generic qcow2_co_truncate() by bdrv_check_request().
  qcow2_co_pwritev_compressed_task() pass the request (or part of the
    request) that already went through normal write path, so it should
    be OK

qcow:
  qcow_co_pwritev_compressed() pass int64_t, it's updated by this patch

quorum:
  quorum_co_pwrite_zeroes() pass int64_t and int - OK

throttle:
  throttle_co_pwritev_compressed() pass int64_t, it's updated by this
  patch

vmdk:
  vmdk_co_pwritev_compressed() pass int64_t, it's updated by this
  patch

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h        | 16 ++++++++--------
 block/backup-top.c               |  6 +++---
 block/blkdebug.c                 |  4 ++--
 block/blklogwrites.c             |  4 ++--
 block/blkreplay.c                |  2 +-
 block/blkverify.c                |  4 ++--
 block/copy-on-read.c             | 11 ++++++-----
 block/crypto.c                   |  4 ++--
 block/file-posix.c               |  6 +++---
 block/file-win32.c               |  4 ++--
 block/filter-compress.c          |  7 ++++---
 block/io.c                       |  6 ++++--
 block/mirror.c                   |  2 +-
 block/nbd.c                      |  5 +++--
 block/nfs.c                      |  6 +++---
 block/null.c                     |  9 +++++----
 block/nvme.c                     |  5 +++--
 block/preallocate.c              |  6 +++---
 block/qcow.c                     | 10 +++++-----
 block/qcow2.c                    |  6 +++---
 block/quorum.c                   |  5 +++--
 block/raw-format.c               | 10 +++++-----
 block/rbd.c                      |  5 +++--
 block/throttle.c                 |  9 +++++----
 block/vdi.c                      |  4 ++--
 block/vmdk.c                     |  8 ++++----
 block/vpc.c                      |  4 ++--
 block/vvfat.c                    |  8 ++++----
 tests/unit/test-block-iothread.c |  4 ++--
 block/trace-events               |  2 +-
 30 files changed, 96 insertions(+), 86 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index dc08f99e95..38ce897972 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -237,8 +237,8 @@ struct BlockDriver {
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
     BlockAIOCB *(*bdrv_aio_pwritev)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags,
-        BlockCompletionFunc *cb, void *opaque);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
     BlockAIOCB *(*bdrv_aio_flush)(BlockDriverState *bs,
         BlockCompletionFunc *cb, void *opaque);
     BlockAIOCB *(*bdrv_aio_pdiscard)(BlockDriverState *bs,
@@ -287,10 +287,11 @@ struct BlockDriver {
      * The buffer in @qiov may point directly to guest memory.
      */
     int coroutine_fn (*bdrv_co_pwritev)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_pwritev_part)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, int flags);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset,
+        BdrvRequestFlags flags);
 
     /*
      * Efficiently zero a region of the disk image.  Typically an image format
@@ -428,10 +429,9 @@ struct BlockDriver {
                                       Error **errp);
 
     int coroutine_fn (*bdrv_co_pwritev_compressed)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov);
     int coroutine_fn (*bdrv_co_pwritev_compressed_part)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov,
-        size_t qiov_offset);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);
 
     int (*bdrv_snapshot_create)(BlockDriverState *bs,
                                 QEMUSnapshotInfo *sn_info);
diff --git a/block/backup-top.c b/block/backup-top.c
index fb32ac7b2b..6834921092 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -86,9 +86,9 @@ static int coroutine_fn backup_top_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static coroutine_fn int backup_top_co_pwritev(BlockDriverState *bs,
-                                              uint64_t offset,
-                                              uint64_t bytes,
-                                              QEMUIOVector *qiov, int flags)
+                                              int64_t offset, int64_t bytes,
+                                              QEMUIOVector *qiov,
+                                              BdrvRequestFlags flags)
 {
     int ret = backup_top_cbw(bs, offset, bytes, flags);
     if (ret < 0) {
diff --git a/block/blkdebug.c b/block/blkdebug.c
index b26fecf222..a7fedd80fd 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -635,8 +635,8 @@ blkdebug_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
 }
 
 static int coroutine_fn
-blkdebug_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                    QEMUIOVector *qiov, int flags)
+blkdebug_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                    QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int err;
 
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index de3d4ba2b6..ca174ab135 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -460,8 +460,8 @@ blk_log_writes_co_do_file_pdiscard(BlkLogWritesFileReq *fr)
 }
 
 static int coroutine_fn
-blk_log_writes_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                          QEMUIOVector *qiov, int flags)
+blk_log_writes_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                          QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return blk_log_writes_co_log(bs, offset, bytes, qiov, flags,
                                  blk_log_writes_co_do_file_pwritev, 0, false);
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 13ea2166bb..7ba62dcac1 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -83,7 +83,7 @@ static int coroutine_fn blkreplay_co_preadv(BlockDriverState *bs,
 }
 
 static int coroutine_fn blkreplay_co_pwritev(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
diff --git a/block/blkverify.c b/block/blkverify.c
index 5e35744b8a..d1facf5ba9 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -250,8 +250,8 @@ blkverify_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
 }
 
 static int coroutine_fn
-blkverify_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                     QEMUIOVector *qiov, int flags)
+blkverify_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                     QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BlkverifyRequest r;
     return blkverify_co_prwv(bs, &r, offset, bytes, qiov, qiov, flags, true);
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index afb2a77b08..7675565080 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -194,10 +194,11 @@ static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
 
 
 static int coroutine_fn cor_co_pwritev_part(BlockDriverState *bs,
-                                            uint64_t offset,
-                                            uint64_t bytes,
+                                            int64_t offset,
+                                            int64_t bytes,
                                             QEMUIOVector *qiov,
-                                            size_t qiov_offset, int flags)
+                                            size_t qiov_offset,
+                                            BdrvRequestFlags flags)
 {
     return bdrv_co_pwritev_part(bs->file, offset, bytes, qiov, qiov_offset,
                                 flags);
@@ -220,8 +221,8 @@ static int coroutine_fn cor_co_pdiscard(BlockDriverState *bs,
 
 
 static int coroutine_fn cor_co_pwritev_compressed(BlockDriverState *bs,
-                                                  uint64_t offset,
-                                                  uint64_t bytes,
+                                                  int64_t offset,
+                                                  int64_t bytes,
                                                   QEMUIOVector *qiov)
 {
     return bdrv_co_pwritev(bs->file, offset, bytes, qiov,
diff --git a/block/crypto.c b/block/crypto.c
index a732a36d10..c8ba4681e2 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -460,8 +460,8 @@ block_crypto_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
 
 
 static coroutine_fn int
-block_crypto_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                        QEMUIOVector *qiov, int flags)
+block_crypto_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                        QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BlockCrypto *crypto = bs->opaque;
     uint64_t cur_bytes; /* number of bytes in current iteration */
diff --git a/block/file-posix.c b/block/file-posix.c
index e0e758e446..9771eafe5e 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2016,9 +2016,9 @@ static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_READ);
 }
 
-static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t bytes, QEMUIOVector *qiov,
-                                       int flags)
+static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                       int64_t bytes, QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     assert(flags == 0);
     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_WRITE);
diff --git a/block/file-win32.c b/block/file-win32.c
index 15076350f2..7c2706c329 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -451,8 +451,8 @@ static BlockAIOCB *raw_aio_preadv(BlockDriverState *bs,
 }
 
 static BlockAIOCB *raw_aio_pwritev(BlockDriverState *bs,
-                                   uint64_t offset, uint64_t bytes,
-                                   QEMUIOVector *qiov, int flags,
+                                   int64_t offset, int64_t bytes,
+                                   QEMUIOVector *qiov, BdrvRequestFlags flags,
                                    BlockCompletionFunc *cb, void *opaque)
 {
     BDRVRawState *s = bs->opaque;
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 54a16c6c64..505822a44f 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -74,10 +74,11 @@ static int coroutine_fn compress_co_preadv_part(BlockDriverState *bs,
 
 
 static int coroutine_fn compress_co_pwritev_part(BlockDriverState *bs,
-                                                 uint64_t offset,
-                                                 uint64_t bytes,
+                                                 int64_t offset,
+                                                 int64_t bytes,
                                                  QEMUIOVector *qiov,
-                                                 size_t qiov_offset, int flags)
+                                                 size_t qiov_offset,
+                                                 BdrvRequestFlags flags)
 {
     return bdrv_co_pwritev_part(bs->file, offset, bytes, qiov, qiov_offset,
                                 flags | BDRV_REQ_WRITE_COMPRESSED);
diff --git a/block/io.c b/block/io.c
index 932a26f0bb..448251beaa 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1225,7 +1225,8 @@ out:
 static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
                                             int64_t offset, int64_t bytes,
                                             QEMUIOVector *qiov,
-                                            size_t qiov_offset, int flags)
+                                            size_t qiov_offset,
+                                            BdrvRequestFlags flags)
 {
     BlockDriver *drv = bs->drv;
     int64_t sector_num;
@@ -2064,7 +2065,8 @@ bdrv_co_write_req_finish(BdrvChild *child, int64_t offset, int64_t bytes,
  */
 static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
     BdrvTrackedRequest *req, int64_t offset, int64_t bytes,
-    int64_t align, QEMUIOVector *qiov, size_t qiov_offset, int flags)
+    int64_t align, QEMUIOVector *qiov, size_t qiov_offset,
+    BdrvRequestFlags flags)
 {
     BlockDriverState *bs = child->bs;
     BlockDriver *drv = bs->drv;
diff --git a/block/mirror.c b/block/mirror.c
index 684652092a..fdf477a0fd 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1434,7 +1434,7 @@ out:
 }
 
 static int coroutine_fn bdrv_mirror_top_pwritev(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     MirrorBDSOpaque *s = bs->opaque;
     QEMUIOVector bounce_qiov;
diff --git a/block/nbd.c b/block/nbd.c
index f1aac282e4..d3de441c2b 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1604,8 +1604,9 @@ static int nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
     return ret ? ret : request_ret;
 }
 
-static int nbd_client_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                                 uint64_t bytes, QEMUIOVector *qiov, int flags)
+static int nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                 int64_t bytes, QEMUIOVector *qiov,
+                                 BdrvRequestFlags flags)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
diff --git a/block/nfs.c b/block/nfs.c
index eee8f706ba..c6563930cf 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -299,9 +299,9 @@ static int coroutine_fn nfs_co_preadv(BlockDriverState *bs, int64_t offset,
     return 0;
 }
 
-static int coroutine_fn nfs_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t bytes, QEMUIOVector *iov,
-                                       int flags)
+static int coroutine_fn nfs_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                       int64_t bytes, QEMUIOVector *iov,
+                                       BdrvRequestFlags flags)
 {
     NFSClient *client = bs->opaque;
     NFSRPC task;
diff --git a/block/null.c b/block/null.c
index 343dbb580d..75f7d0db40 100644
--- a/block/null.c
+++ b/block/null.c
@@ -130,8 +130,9 @@ static coroutine_fn int null_co_preadv(BlockDriverState *bs,
 }
 
 static coroutine_fn int null_co_pwritev(BlockDriverState *bs,
-                                        uint64_t offset, uint64_t bytes,
-                                        QEMUIOVector *qiov, int flags)
+                                        int64_t offset, int64_t bytes,
+                                        QEMUIOVector *qiov,
+                                        BdrvRequestFlags flags)
 {
     return null_co_common(bs);
 }
@@ -203,8 +204,8 @@ static BlockAIOCB *null_aio_preadv(BlockDriverState *bs,
 }
 
 static BlockAIOCB *null_aio_pwritev(BlockDriverState *bs,
-                                    uint64_t offset, uint64_t bytes,
-                                    QEMUIOVector *qiov, int flags,
+                                    int64_t offset, int64_t bytes,
+                                    QEMUIOVector *qiov, BdrvRequestFlags flags,
                                     BlockCompletionFunc *cb,
                                     void *opaque)
 {
diff --git a/block/nvme.c b/block/nvme.c
index 58342c6409..349c152ab5 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1229,8 +1229,9 @@ static coroutine_fn int nvme_co_preadv(BlockDriverState *bs,
 }
 
 static coroutine_fn int nvme_co_pwritev(BlockDriverState *bs,
-                                        uint64_t offset, uint64_t bytes,
-                                        QEMUIOVector *qiov, int flags)
+                                        int64_t offset, int64_t bytes,
+                                        QEMUIOVector *qiov,
+                                        BdrvRequestFlags flags)
 {
     return nvme_co_prw(bs, offset, bytes, qiov, true, flags);
 }
diff --git a/block/preallocate.c b/block/preallocate.c
index 5709443612..c19885af17 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -349,11 +349,11 @@ static int coroutine_fn preallocate_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static coroutine_fn int preallocate_co_pwritev_part(BlockDriverState *bs,
-                                                    uint64_t offset,
-                                                    uint64_t bytes,
+                                                    int64_t offset,
+                                                    int64_t bytes,
                                                     QEMUIOVector *qiov,
                                                     size_t qiov_offset,
-                                                    int flags)
+                                                    BdrvRequestFlags flags)
 {
     handle_write(bs, offset, bytes, false);
 
diff --git a/block/qcow.c b/block/qcow.c
index 1151b8d79b..c39940f33e 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -714,9 +714,9 @@ static coroutine_fn int qcow_co_preadv(BlockDriverState *bs, int64_t offset,
     return ret;
 }
 
-static coroutine_fn int qcow_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                                        uint64_t bytes, QEMUIOVector *qiov,
-                                        int flags)
+static coroutine_fn int qcow_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                        int64_t bytes, QEMUIOVector *qiov,
+                                        BdrvRequestFlags flags)
 {
     BDRVQcowState *s = bs->opaque;
     int offset_in_cluster;
@@ -1047,8 +1047,8 @@ static int qcow_make_empty(BlockDriverState *bs)
 /* XXX: put compressed sectors first, then all the cluster aligned
    tables to avoid losing bytes in alignment */
 static coroutine_fn int
-qcow_co_pwritev_compressed(BlockDriverState *bs, uint64_t offset,
-                           uint64_t bytes, QEMUIOVector *qiov)
+qcow_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                           QEMUIOVector *qiov)
 {
     BDRVQcowState *s = bs->opaque;
     z_stream strm;
diff --git a/block/qcow2.c b/block/qcow2.c
index 35844beb46..5bab24d1dc 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2569,8 +2569,8 @@ static coroutine_fn int qcow2_co_pwritev_task_entry(AioTask *task)
 }
 
 static coroutine_fn int qcow2_co_pwritev_part(
-        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, int flags)
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags)
 {
     BDRVQcow2State *s = bs->opaque;
     int offset_in_cluster;
@@ -4603,7 +4603,7 @@ static coroutine_fn int qcow2_co_pwritev_compressed_task_entry(AioTask *task)
  */
 static coroutine_fn int
 qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
-                                 uint64_t offset, uint64_t bytes,
+                                 int64_t offset, int64_t bytes,
                                  QEMUIOVector *qiov, size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/quorum.c b/block/quorum.c
index 1eba2ce7ff..353401ac08 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -714,8 +714,9 @@ static void write_quorum_entry(void *opaque)
     }
 }
 
-static int quorum_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                             uint64_t bytes, QEMUIOVector *qiov, int flags)
+static int quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
+                             int64_t bytes, QEMUIOVector *qiov,
+                             BdrvRequestFlags flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
diff --git a/block/raw-format.c b/block/raw-format.c
index e3f459b2cb..b0fe75f54a 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -216,9 +216,9 @@ static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
-static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t bytes, QEMUIOVector *qiov,
-                                       int flags)
+static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                       int64_t bytes, QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     void *buf = NULL;
     BlockDriver *drv;
@@ -259,7 +259,7 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, uint64_t offset,
         qiov = &local_qiov;
     }
 
-    ret = raw_adjust_offset(bs, (int64_t *)&offset, bytes, true);
+    ret = raw_adjust_offset(bs, &offset, bytes, true);
     if (ret) {
         goto fail;
     }
@@ -294,7 +294,7 @@ static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
 {
     int ret;
 
-    ret = raw_adjust_offset(bs, (int64_t *)&offset, bytes, true);
+    ret = raw_adjust_offset(bs, &offset, bytes, true);
     if (ret) {
         return ret;
     }
diff --git a/block/rbd.c b/block/rbd.c
index 6a937723f4..3936d7888a 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1005,8 +1005,9 @@ static BlockAIOCB *qemu_rbd_aio_preadv(BlockDriverState *bs,
 }
 
 static BlockAIOCB *qemu_rbd_aio_pwritev(BlockDriverState *bs,
-                                        uint64_t offset, uint64_t bytes,
-                                        QEMUIOVector *qiov, int flags,
+                                        int64_t offset, int64_t bytes,
+                                        QEMUIOVector *qiov,
+                                        BdrvRequestFlags flags,
                                         BlockCompletionFunc *cb,
                                         void *opaque)
 {
diff --git a/block/throttle.c b/block/throttle.c
index 20362b5fe5..1330e844c3 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -124,8 +124,9 @@ static int coroutine_fn throttle_co_preadv(BlockDriverState *bs,
 }
 
 static int coroutine_fn throttle_co_pwritev(BlockDriverState *bs,
-                                            uint64_t offset, uint64_t bytes,
-                                            QEMUIOVector *qiov, int flags)
+                                            int64_t offset, int64_t bytes,
+                                            QEMUIOVector *qiov,
+                                            BdrvRequestFlags flags)
 {
     ThrottleGroupMember *tgm = bs->opaque;
     throttle_group_co_io_limits_intercept(tgm, bytes, true);
@@ -153,8 +154,8 @@ static int coroutine_fn throttle_co_pdiscard(BlockDriverState *bs,
 }
 
 static int coroutine_fn throttle_co_pwritev_compressed(BlockDriverState *bs,
-                                                       uint64_t offset,
-                                                       uint64_t bytes,
+                                                       int64_t offset,
+                                                       int64_t bytes,
                                                        QEMUIOVector *qiov)
 {
     return throttle_co_pwritev(bs, offset, bytes, qiov,
diff --git a/block/vdi.c b/block/vdi.c
index b394cf6ca6..bdc58d726e 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -600,8 +600,8 @@ vdi_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
 }
 
 static int coroutine_fn
-vdi_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-               QEMUIOVector *qiov, int flags)
+vdi_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+               QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVVdiState *s = bs->opaque;
     QEMUIOVector local_qiov;
diff --git a/block/vmdk.c b/block/vmdk.c
index 78592160d0..8d49e54bdd 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2068,8 +2068,8 @@ static int vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
 }
 
 static int coroutine_fn
-vmdk_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                QEMUIOVector *qiov, int flags)
+vmdk_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret;
     BDRVVmdkState *s = bs->opaque;
@@ -2080,8 +2080,8 @@ vmdk_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
 }
 
 static int coroutine_fn
-vmdk_co_pwritev_compressed(BlockDriverState *bs, uint64_t offset,
-                           uint64_t bytes, QEMUIOVector *qiov)
+vmdk_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                           QEMUIOVector *qiov)
 {
     if (bytes == 0) {
         /* The caller will write bytes 0 to signal EOF.
diff --git a/block/vpc.c b/block/vpc.c
index 29c8517ff8..1b4c7333af 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -658,8 +658,8 @@ fail:
 }
 
 static int coroutine_fn
-vpc_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-               QEMUIOVector *qiov, int flags)
+vpc_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+               QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVVPCState *s = bs->opaque;
     int64_t image_offset;
diff --git a/block/vvfat.c b/block/vvfat.c
index 8ac90166c5..0b6ed1c6d1 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3061,8 +3061,8 @@ DLOG(checkpoint());
 }
 
 static int coroutine_fn
-vvfat_co_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                 QEMUIOVector *qiov, int flags)
+vvfat_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                 QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret;
     BDRVVVFATState *s = bs->opaque;
@@ -3099,8 +3099,8 @@ static int coroutine_fn vvfat_co_block_status(BlockDriverState *bs,
 }
 
 static int coroutine_fn
-write_target_commit(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                    QEMUIOVector *qiov, int flags)
+write_target_commit(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                    QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret;
 
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index b3f8f3ff8e..50b8718b2a 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -40,9 +40,9 @@ static int coroutine_fn bdrv_test_co_preadv(BlockDriverState *bs,
 }
 
 static int coroutine_fn bdrv_test_co_pwritev(BlockDriverState *bs,
-                                             uint64_t offset, uint64_t bytes,
+                                             int64_t offset, int64_t bytes,
                                              QEMUIOVector *qiov,
-                                             int flags)
+                                             BdrvRequestFlags flags)
 {
     return 0;
 }
diff --git a/block/trace-events b/block/trace-events
index 1a12d634e2..3cbea9e2e2 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -75,7 +75,7 @@ luring_resubmit_short_read(void *s, void *luringcb, int nread) "LuringState %p l
 
 # qcow2.c
 qcow2_add_task(void *co, void *bs, void *pool, const char *action, int cluster_type, uint64_t host_offset, uint64_t offset, uint64_t bytes, void *qiov, size_t qiov_offset) "co %p bs %p pool %p: %s: cluster_type %d file_cluster_offset %" PRIu64 " offset %" PRIu64 " bytes %" PRIu64 " qiov %p qiov_offset %zu"
-qcow2_writev_start_req(void *co, int64_t offset, int bytes) "co %p offset 0x%" PRIx64 " bytes %d"
+qcow2_writev_start_req(void *co, int64_t offset, int64_t bytes) "co %p offset 0x%" PRIx64 " bytes %" PRId64
 qcow2_writev_done_req(void *co, int ret) "co %p ret %d"
 qcow2_writev_start_part(void *co) "co %p"
 qcow2_writev_done_part(void *co, int cur_bytes) "co %p cur_bytes %d"
-- 
2.29.2


