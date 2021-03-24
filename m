Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446CE348347
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:57:52 +0100 (CET)
Received: from localhost ([::1]:48812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAZb-0003LC-0K
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAU3-0006WL-9i; Wed, 24 Mar 2021 16:52:07 -0400
Received: from mail-vi1eur05on2092.outbound.protection.outlook.com
 ([40.107.21.92]:36928 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPATz-0005MQ-Ft; Wed, 24 Mar 2021 16:52:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0hz7MKIW08JN4A44OQK9wHUquEFGFPg54LfD5axj71UddOYWdnRj7H0RPb8SwhhoQYi6jiqJBXVzEPAk4G8P45mlP3ti/xGHLlaAPbz1sPChgiZMIQajoOIbeUQvFFWWXfDASspoV4WWv+I2CdcnsiQsBTDhQt+f8Uy8cOhhxLTQNPadJaDMlaLoIx8fVnYDnDWV2VWtLPwPOIt/Mwur0hs4qDe8PRWe9LkRX/b8WDO/ziUPsh6V4ohP7JsrUiQ+2eaSsMGqpiy6vvQ4p4fkSV0sd732m5Vuytes0GtwglmO7OY8TDuKn8gVq/RfNqNyN8wamFeAyJfxCBF34A7ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qy3seYCy4/ADrGcme8/S3+782QExpvgjBWX4+tnky4=;
 b=iIz1UV5ozqhb+td9rVKHV1Qe8jwYIXI9g0Oeob0B+rfBp1s/MbHBMp1ldVIf93Ftcr3ABBLEszDEpz49emE5ORDk2WGHDhh2Fb27B8dUds+W6jo2uWXG8OoE6Zf6tE/5aulZOjjcQAKMnJ/p2GeTqIwW9l/ybeaQDcPI0iUSuaBJ1V1JFyi3lmZrI1N0PzLLFiqW0TC312Rn+j/0eM3VnL22AMXc9KKs2YvjlU5o1x90W1ctpsCjSiXyW5KtIrKFFz8sOyxJ7F0CX3hYk3R0cjAaXo6hjBlcFQh4ZqbL1FJzWoKVQosMHiz700+jpuJwJ9TPnWj5xVEJCiPWmh08gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qy3seYCy4/ADrGcme8/S3+782QExpvgjBWX4+tnky4=;
 b=Z2NLIvLsO4dyy0YHzV13eZDskXjxKaFolfwaH1DRABoQEDoqIDVjOp7ApktF5zbqQzZyArgdzdRE/xbtiTJ/2MjMabFlvKj/ZxXIKhT6dNGG/KFZ714hPf1VB0HEcwL/j1ouyTO4pkNIlQ0MHlhDT1V1c5ZGawi3TbSRdCtjfRk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 20:51:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:51:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 04/11] block: use int64_t instead of uint64_t in driver
 write handlers
Date: Wed, 24 Mar 2021 23:51:25 +0300
Message-Id: <20210324205132.464899-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210324205132.464899-1-vsementsov@virtuozzo.com>
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 AM0PR07CA0022.eurprd07.prod.outlook.com (2603:10a6:208:ac::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 20:51:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74bf4c27-9576-40bc-3f14-08d8ef06a70e
X-MS-TrafficTypeDiagnostic: AM7PR08MB5447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5447CAA0DC5C77DF9D528317C1639@AM7PR08MB5447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GsoNvMCEfEZNPhbOu3W/QjdJSXEkEx3FGIWxFlbjClKWzVMKFFK+/BHo4r2bZVIc57xsV9HDcOQaQq/csZUNju9JtiC18Vcu4fy2wHspWr62alx2E7ob6eiqMmwI0KggZwOCKe5ke3uHCDZNdJ3mar0Cn04fQ2eSNJfanhtKEsWDUlwZ/5xdOwAijwiCiEC/OLaffK93SAj0g1yFAuNl+D3I6nJCwcgwygoYInhu8siWUx8syCZwznVuMNprAE1X8Mon/n5iyTuc+GctPPa7vSGG03LAyzAkRn8EGXlfGbJQBfJ3/KAgemRpmYRFzl2pRyh8JupuIusc9oKvKj2Prt/WRJyZGN8q4VyDs0988wjJy0ZV6VeKoyYXpMY/rGr3/5YbVzRDsob+7DAw+b35wKUJgKgJZlWPeXKyopRAhzc4eJugrMopp8+jrEWB94ggB3yp08rMI6DDUktEnC1qrQOmLtx+avOxJSHLXpbF7hvG892dn7wMpodcyxA4OO6WQ/83rB5i3GTBMl3VUJ7xiv2sIk1YndLwE6h56nWYsXq+c0n4bUPN34Ok1pdXl7II7EOV7ryVjbydZNQXb2feSeHp1Cgazb8/zajqdlDfVX2nsbIkhW0SYrGtSESJAgrrStxCoaPUJUjTGAshpEia8nqQj42UBGpXYjPmG0C/na9vDxoCFKJNz2Nkq2LmI5c3kANkgModb07XeUpuMPDYQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(376002)(396003)(366004)(2616005)(6916009)(478600001)(8936002)(66946007)(38100700001)(956004)(66556008)(6512007)(66476007)(6506007)(6486002)(52116002)(186003)(5660300002)(26005)(69590400012)(83380400001)(7416002)(6666004)(86362001)(2906002)(30864003)(16526019)(316002)(1076003)(36756003)(4326008)(8676002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IBVcaQLhQ//pIm7h/SB+bpLgRG+CXS8cJOka4k+SRCk2L/EFfvr+kvV00C0w?=
 =?us-ascii?Q?kctl61F8oMT9JM7UfOWPO+LR7ZTJV2OVxKALDqLVb2vh+wACLsdbIyZC2a/V?=
 =?us-ascii?Q?RE2tSFfVtqGlRa7UrKPuf/+75zdMKJoTVvSsmVYNsy2iUQUtS1gxOAj0K9NL?=
 =?us-ascii?Q?BSAWTGkD7qOE0TIPtjYJGGCwKmf8fWSb3GiVgZXuoOoF3h7xCqP5WFNGV9il?=
 =?us-ascii?Q?YWG1dlB2i+jL4JxWOZeUtmxrXehgH/kxghS4TaL8OGyDPxNJTdxYrOHLxYo6?=
 =?us-ascii?Q?TaxTjokeyO6ZFfW1gweI+i1DoE2VxiOUdVxVjMyBy11CruSP8+fwDb2yRZ28?=
 =?us-ascii?Q?FCAZl6k+oqtBozc/aGDhvFwJSi09GhKXUgMvdtpl0Wlj5gkWOOfOYRT3+fdC?=
 =?us-ascii?Q?f36S7mZ5hB8SyO6ImEpLpBmdcd8wXtxM9X+7fKXwhCkChQwHNIyj3EEeMnBg?=
 =?us-ascii?Q?QydpJfldz90DOqFANpYcc33jOWPYr37Hym4N6IzBjOAFAJNhPoL0W1XOAxfh?=
 =?us-ascii?Q?RlvRot0R60mECtNDIWKNH3vmRL/k+gmHeRiLdX2xgLRzpreOwi2YbOuXci5V?=
 =?us-ascii?Q?fJEeAq9rkzef7hwUHZBmmQqtepMhXJQ2UMVSNP62QG8TSx6nwGJtohAVn+yp?=
 =?us-ascii?Q?zZIDcpcvjGpSq9Kc8CCHpCf6vqDSiksDs4ieEYFcjXysk8ZJG/ymX1y3S1lv?=
 =?us-ascii?Q?gtSGjtRMl2Oe857J33MLN9AWfG772HmjVtkJxoPrGCrRkyXu6q7gvG2lM4xW?=
 =?us-ascii?Q?jrrRGEE6FqP36kvleKbKyBcidcb4DNQWlQjtypwO7oCSeE6Do5LHRLDKgd2e?=
 =?us-ascii?Q?K0ak4ScS57RaKJDtFjIywGyW3oqZ2QlHvYs5+AM/2Ob1CiImorXaElyTrh72?=
 =?us-ascii?Q?L4NsbKXiJE18/vPWcMmG0CDxYf4sBoF2KATEkxSFPCzT0HAlU9IFB+kVUdk8?=
 =?us-ascii?Q?5CNWTyUDRgqw2hkYVTe/QG1Afse15Fl1hFvU+neL6aVY2cLS2YwyGKY6q09D?=
 =?us-ascii?Q?HRlbLO7HSB4RIjD6NeqKTqYeRqMzxUdzVjV8JET9NOfGDRQCvzvXekYu9fmf?=
 =?us-ascii?Q?Lji4ek3ac7KNdnuK/z9gcgs9kpTkTJAzfzxr3rd6gRySsPTvIwgrw7F9kiRy?=
 =?us-ascii?Q?EPQ2gobOiirVMZ6qN0gjrAPXz61sWbZ0hNb88yJ09lyFLTDmpdZIhebwBiMx?=
 =?us-ascii?Q?+ypJd34IuVHA/NkGTlFjNfgBS+rhHe+SAB9nm7LjvtrWOoD0ln7hjzVZ1qR7?=
 =?us-ascii?Q?wMPP7jb6xI0dbDVUpdZRoG1nh53FSU+nykJ0fzqTUmMfdiot6t3WzkFUS0vd?=
 =?us-ascii?Q?XVtfde90OpSuo6Mmxvn8d36W?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bf4c27-9576-40bc-3f14-08d8ef06a70e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:51:52.6387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYxGnpaqnEqj4W7bT52wW6qHlvbjqbjuxDtgKP+VaOvIkQ9wJuOwmqCM9FfmlmhzEPep+mKDk650e4jV1YlPL3PkB0Ti5dHNTU0YIFY2rrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447
Received-SPF: pass client-ip=40.107.21.92;
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
 block/nvme.c                     |  4 ++--
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
 30 files changed, 95 insertions(+), 86 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index e6bcf74e46..928369e0bc 100644
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
index 9779493a4b..aa27afbb1b 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -97,9 +97,9 @@ static int coroutine_fn backup_top_co_pwrite_zeroes(BlockDriverState *bs,
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
index 25da79cdd5..add56cab00 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2040,9 +2040,9 @@ static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
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
index 59924867c5..55095dd08e 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1198,7 +1198,8 @@ out:
 static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
                                             int64_t offset, int64_t bytes,
                                             QEMUIOVector *qiov,
-                                            size_t qiov_offset, int flags)
+                                            size_t qiov_offset,
+                                            BdrvRequestFlags flags)
 {
     BlockDriver *drv = bs->drv;
     int64_t sector_num;
@@ -2037,7 +2038,8 @@ bdrv_co_write_req_finish(BdrvChild *child, int64_t offset, int64_t bytes,
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
index 1587cda13c..f7b7f4d566 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1435,7 +1435,7 @@ out:
 }
 
 static int coroutine_fn bdrv_mirror_top_pwritev(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     MirrorBDSOpaque *s = bs->opaque;
     QEMUIOVector bounce_qiov;
diff --git a/block/nbd.c b/block/nbd.c
index a2b6aa1bca..34cb28927b 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1593,8 +1593,9 @@ static int nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
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
index 58342c6409..1a128ef95e 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1229,8 +1229,8 @@ static coroutine_fn int nvme_co_preadv(BlockDriverState *bs,
 }
 
 static coroutine_fn int nvme_co_pwritev(BlockDriverState *bs,
-                                        uint64_t offset, uint64_t bytes,
-                                        QEMUIOVector *qiov, int flags)
+                                        int64_t offset, int64_t bytes,
+                                        QEMUIOVector *qiov, BdrvRequestFlags flags)
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
index 34c5e1c073..1e55ab52b3 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2568,8 +2568,8 @@ static coroutine_fn int qcow2_co_pwritev_task_entry(AioTask *task)
 }
 
 static coroutine_fn int qcow2_co_pwritev_part(
-        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, int flags)
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags)
 {
     BDRVQcow2State *s = bs->opaque;
     int offset_in_cluster;
@@ -4568,7 +4568,7 @@ static coroutine_fn int qcow2_co_pwritev_compressed_task_entry(AioTask *task)
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
index 69299e5f6f..598b801f96 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1003,8 +1003,9 @@ static BlockAIOCB *qemu_rbd_aio_preadv(BlockDriverState *bs,
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
index c0e71bfa53..020f7a3cbc 100644
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


