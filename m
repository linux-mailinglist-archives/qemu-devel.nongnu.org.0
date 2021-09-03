Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A823FFE42
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:35:55 +0200 (CEST)
Received: from localhost ([::1]:46110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6Y6-0003eE-1t
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6R4-0002uJ-Uc; Fri, 03 Sep 2021 06:28:40 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:7190 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6R2-0002A7-04; Fri, 03 Sep 2021 06:28:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fK4J7ZtLUkQWR9ZzwORTdQK0GbANoZhAzVN6ZWs59GkbbQDWJIPZMEh5FkqdfjWeWDmv4V4GyvWIBPBidGfiYNLfKBWqozyH6+lA46cyRtfwk+XBFUYvAWE436l8XBqnyQ0huXloLTltbPISCBkvY9Pb+PiiZSxOeA2eNoY6MbqQOLcRW1zOmfwswc+6HP1IBrVFfj6AX0k+DweKJpMlndAzjI/oSFxciaSEQ1jefxhjdLazmMu41AJe2KF8zwJH3yA0/bQl7sTk8y5NqJVuSnRaeS9ciT3qoZ2f0UjBGBUnJjSfhQXejTt7osTa8hPb80KAYbPnkVnTIto1OMkCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ts3wsNNt4NddM6CWbhmH/TLehM961aDsA145gHDEkTU=;
 b=NRjmKyDAWSdWPrd0V2R37ISVjJJ+53eQ97Oj991ImmJ+cYYYl+hDVFfvTTok7tC9oA0VjJ0FT5/3ih7j8r9yDYZbIN6UHaIlf1DGv5VQFGcwstL0ArhMnawuzjQeoIRUBfyIfg7MO3I3FnYCz4yiS7IXCFCt8zvx4ZitLgkBF5VbziIgOaSzkMBnghaDvFqqemgpGIH1FTOA0FPKhf0bmwya6DNnTA0uXP2ATS6T/sOOSFoN37lzlmARmvN6HljKfM+B8Ck0oVFiABm2qlGHQIDOoQpnuprElHbY9SKXtvZ5e2LZe+uYojkOLrqfhF1iHkDeADenMnisOWowYBwGCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts3wsNNt4NddM6CWbhmH/TLehM961aDsA145gHDEkTU=;
 b=Cy3lp+pJa8Tx4C03K3Mt/S/btvcdyPURTT1bjlIO3BS4/H2PCB+j0gTmtEVOjLK6zHtP8bHes06FMhukpzVczEmBhfKh4JBAqXU0he4z5mkkEIfUy0Is6wNZZr14/aDaFd2i8/iLMm5nmVSHLIyasuPqIrXI7nKe9867JBOq8us=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6945.eurprd08.prod.outlook.com (2603:10a6:20b:344::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 10:28:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 10:28:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, kraxel@redhat.com,
 idryomov@gmail.com, berto@igalia.com, philmd@redhat.com, eblake@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 vsementsov@virtuozzo.com, jsnow@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, ari@tuxera.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 04/11] block: use int64_t instead of uint64_t in driver
 write handlers
Date: Fri,  3 Sep 2021 13:28:00 +0300
Message-Id: <20210903102807.27127-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210903102807.27127-1-vsementsov@virtuozzo.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0163.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0163.eurprd05.prod.outlook.com (2603:10a6:3:f8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:28:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a72d1312-307f-4332-a3aa-08d96ec5936b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6945:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB69457DD917DF96BD091687E0C1CF9@AS8PR08MB6945.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D46eD5/ZjPF8spl74La3kRTJv9q7Y6UcXGvy20ar/hPNZcc3gcw4YOj7iKykVqY+2P3QYNoK8sstSTcu1DH1/QwcFxR/sWz4Fi4lJwMhCsJxLWRao1DmF3Re2Brqort/vRsRiEEjggq9g0Odf7H/o5jBiVEM2TMUvvBLsfXSUHKRNjHcC6F11148i7d7FoQA3fyBPBg9pFvVw/i2RoxXY6qXx92xL/vghUx59fBXgb70CJiwacQChB2VO4gfjWkv+zZvj9Py9r2bj4RIXufYREaQaYmug5BjAfHXNQ+MVyPdDs5zo2BiS1zR5s+4zPlh7oEcJLBNxYfMOFrVl18cyJ6Ze1MMb2kCNydjHhnvmXy7k98eKIwyNNEhgI+8aUj+wa4WhVeVZoI+YNPjRv3DXM4v8xwwYyQAA8A7skVD8DxcqGoMing2VA/CRAuv/FhEcjQVfhAWzH1uPdqVF213dtHeocPkXX4vUaoP5KpTS9cXSj2lRxbXm2/6kRFVBWSbqCmEX0tNdSQxAR7OKWi6tFD477wvYUlCMBVvJUEC33/+3uNAEhWApLxR4MaT4sTXwaQBVXiUu+cQoUareRSv7Ix6TbtYZAYAHthSZtzwkASlSpXgXC+FURfdotYb6iIhfrxFaF0aW0MzcweAxrIyQlNIMypg6+J81piMikQcx9q+Y/ciuG+4pMlroF6dhEHIIubiCGkUf0xogx784p6Og+kX2j4ZQXaM1F6JDGuSRw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39840400004)(396003)(376002)(7416002)(83380400001)(38350700002)(36756003)(6512007)(38100700002)(6486002)(5660300002)(52116002)(6666004)(6916009)(186003)(956004)(66556008)(2906002)(66476007)(66946007)(30864003)(8936002)(6506007)(26005)(86362001)(2616005)(316002)(478600001)(1076003)(8676002)(4326008)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZoZnYPo/7oVVTMkukQ+PWQqz81MDbWyXY0P0HktYk+AyYGkMP8uWdwWMgkQL?=
 =?us-ascii?Q?4ReEQJ8j+AKEfDaHkyu0VeHfk/pDbsc6BHuzpZUNsyUFLW7Xlmyl/0pNBh1+?=
 =?us-ascii?Q?kAPp76AKIVF/wic7Rsocup1GM5HAnyIIirdoRUiIX8EoeDZBTmfYGZjzg2s6?=
 =?us-ascii?Q?uk7CDah1bLkvsTztwlWZV0S92rKiyJh50MGvVKTRH476yPhJcdFLk2U44CjP?=
 =?us-ascii?Q?/oW/QRxU8/RMmNAltW2LQ8mcZpSMHIiedw0Aquh1I3a1FmJcOfQbDHz4G2G7?=
 =?us-ascii?Q?21rKyMf4/GEP3f5CFgo15JHJERNC0QUYLZuALxTbM2J4KIFvMaUnGjKfafcc?=
 =?us-ascii?Q?PfytG0L2ZIMSQodRh4W5eEnPScW761D97J6LUWGacvzUxx0Yn7dwxgvheWKm?=
 =?us-ascii?Q?1hcAJp/hEMJPcZcgtSbKJCgOESgsOaVuMXKqT1iswyDyvU8jBh/v4H5EtVSa?=
 =?us-ascii?Q?YEXZZTI7zG9nCID/Xc4jN8Ikg5iCanwBhjfQz7Hrd0aSdcVhtC7AXwWx9hT3?=
 =?us-ascii?Q?vTfEcFh1ivI/zF+NPjL0RgZ9kODRdtTy9rZ4aAd70hsVPuAxBDRJ2G7p4wTv?=
 =?us-ascii?Q?EcSWWeGOpuMp8Fp2jD1Y2jkYx2sViJV+4q+vIBwD3Vh3RS7GcIqwrv4lYtiz?=
 =?us-ascii?Q?CqYpnQaiPjbgyzbvAZaBZQKHKTPiOz1hM5sNmP1sdO8v0VQqTyKtbt/dVIFA?=
 =?us-ascii?Q?VM3cSelHMJkUrWuyed6Ny1x3LqGrwQXQyG4hod8izYIFMMubyOm9fGtQUFjU?=
 =?us-ascii?Q?q9IAtSCXP9aUspk/2PMMX9pohM0Za2DUz4MZSRGHjNIlgvfcYoTB8AH3h4+q?=
 =?us-ascii?Q?ShageTfJbgHgCjujgEOfZACwDeALnqL8HPy6XySuv//5CuTZvPCZmV6M/nLc?=
 =?us-ascii?Q?C4QvQgbJBsnKr1fwR5LOzHKDG6iwNVfD1KsG0Swh+BAPGpOhtbKji5SFqtzk?=
 =?us-ascii?Q?x/K10DPwM+YSSOI4tKITPtfTXKmmDk+Y3N9+0EPPvq4cJk+Ysb7WE29dosZB?=
 =?us-ascii?Q?zYqRBtF7DEIDErXUd4lg1LbUSzpOgQLvSyectZzXPKiu2MrbPORGfIWf2ryk?=
 =?us-ascii?Q?d9tlrv/83YY1k2FjvKoWzFHiGFK2SZjesx/h4U3I6Nqtu/asPCY9PLUMnthM?=
 =?us-ascii?Q?aNt2eSYvCNmXPsLF2+W34o2VS6IijKxr3ls01QeYR5wYE8I9/fcZw9o4eVKf?=
 =?us-ascii?Q?jD/8pdrW2MAWKdfHBb3fbOgYIUr1Cau3tkpu21hACodeXzjRb5K8Nfpf72Et?=
 =?us-ascii?Q?TzF1OzvVE01mzqENbyTQwQolhw3d6shKfgPEBEXBHxfQ9tqlJM49tIBAcsgJ?=
 =?us-ascii?Q?jnC5hQZ6WnysBP2zVqpAnLas?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72d1312-307f-4332-a3aa-08d96ec5936b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:28:31.2773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3S2CAm0LZLg1ifRGLqVSUS9SCeHhFvBMDKBOzcMXna/6l3voSVLiLhy2TNv0H/AuFnXfUhQ09O7qvkwTF+eM3320ELmJmwjCZpxCMTQT3bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6945
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

shows that's there three callers of driver function:

 bdrv_driver_pwritev() and bdrv_driver_pwritev_compressed() in
 block/io.c, both pass int64_t, checked by bdrv_check_qiov_request() to
 be non-negative.

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
 block/blkdebug.c                 |  4 ++--
 block/blklogwrites.c             |  4 ++--
 block/blkreplay.c                |  2 +-
 block/blkverify.c                |  4 ++--
 block/copy-before-write.c        |  7 ++++---
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
 block/raw-format.c               |  8 ++++----
 block/rbd.c                      |  6 +++---
 block/throttle.c                 |  9 +++++----
 block/vdi.c                      |  4 ++--
 block/vmdk.c                     |  8 ++++----
 block/vpc.c                      |  4 ++--
 block/vvfat.c                    |  4 ++--
 tests/unit/test-block-iothread.c |  4 ++--
 block/trace-events               |  2 +-
 30 files changed, 94 insertions(+), 84 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 4906f27097..252fb3df21 100644
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
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 12b8419065..e686cd9799 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -652,8 +652,8 @@ blkdebug_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
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
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 591cc3ac75..74360b4853 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -86,9 +86,10 @@ static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
-                                       uint64_t offset,
-                                       uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags)
+                                       int64_t offset,
+                                       int64_t bytes,
+                                       QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     int ret = cbw_do_copy_before_write(bs, offset, bytes, flags);
     if (ret < 0) {
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index d34add4476..b2ec36b6fc 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -181,10 +181,11 @@ static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
 
 
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
@@ -207,8 +208,8 @@ static int coroutine_fn cor_co_pdiscard(BlockDriverState *bs,
 
 
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
index 9c81e45179..0afa60bfd1 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2084,9 +2084,9 @@ static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
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
index 4e8947009b..ec9d64d0e4 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -455,8 +455,8 @@ static BlockAIOCB *raw_aio_preadv(BlockDriverState *bs,
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
index 0058cf4a6f..5aca909a80 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1230,7 +1230,8 @@ out:
 static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
                                             int64_t offset, int64_t bytes,
                                             QEMUIOVector *qiov,
-                                            size_t qiov_offset, int flags)
+                                            size_t qiov_offset,
+                                            BdrvRequestFlags flags)
 {
     BlockDriver *drv = bs->drv;
     int64_t sector_num;
@@ -2070,7 +2071,8 @@ bdrv_co_write_req_finish(BdrvChild *child, int64_t offset, int64_t bytes,
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
index 8595007be7..ed3bc5b1c3 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1449,7 +1449,7 @@ out:
 }
 
 static int coroutine_fn bdrv_mirror_top_pwritev(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     MirrorBDSOpaque *s = bs->opaque;
     QEMUIOVector bounce_qiov;
diff --git a/block/nbd.c b/block/nbd.c
index c816933d7d..caee396525 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1381,8 +1381,9 @@ static int nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
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
index 27f9ab8307..577aea1d22 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -296,9 +296,9 @@ static int coroutine_fn nfs_co_preadv(BlockDriverState *bs, int64_t offset,
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
index c7fba6623d..63a638e52d 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1251,8 +1251,9 @@ static coroutine_fn int nvme_co_preadv(BlockDriverState *bs,
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
index 610fdfc72b..0ee664894c 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2597,8 +2597,8 @@ static coroutine_fn int qcow2_co_pwritev_task_entry(AioTask *task)
 }
 
 static coroutine_fn int qcow2_co_pwritev_part(
-        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, int flags)
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags)
 {
     BDRVQcow2State *s = bs->opaque;
     int offset_in_cluster;
@@ -4631,7 +4631,7 @@ static coroutine_fn int qcow2_co_pwritev_compressed_task_entry(AioTask *task)
  */
 static coroutine_fn int
 qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
-                                 uint64_t offset, uint64_t bytes,
+                                 int64_t offset, int64_t bytes,
                                  QEMUIOVector *qiov, size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/quorum.c b/block/quorum.c
index 57c73b2156..f4b76ea010 100644
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
index a5728e7b0c..d223298dfc 100644
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
diff --git a/block/rbd.c b/block/rbd.c
index 21438dfb7c..efc0835ee7 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1172,9 +1172,9 @@ coroutine_fn qemu_rbd_co_preadv(BlockDriverState *bs, int64_t offset,
 }
 
 static int
-coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, uint64_t offset,
-                                 uint64_t bytes, QEMUIOVector *qiov,
-                                 int flags)
+coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                 int64_t bytes, QEMUIOVector *qiov,
+                                 BdrvRequestFlags flags)
 {
     BDRVRBDState *s = bs->opaque;
     /*
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
index 9c53c2d0a4..05e78e3c27 100644
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
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index f18fa6e0fb..c86954c7ba 100644
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
index b3d2b1e62c..2f5c9c1d71 100644
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


