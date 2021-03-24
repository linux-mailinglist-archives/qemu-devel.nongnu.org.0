Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D05C348355
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 22:01:34 +0100 (CET)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAdB-000780-0X
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 17:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAU3-0006XS-Nk; Wed, 24 Mar 2021 16:52:07 -0400
Received: from mail-vi1eur05on2116.outbound.protection.outlook.com
 ([40.107.21.116]:40416 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPATy-0005Ie-OG; Wed, 24 Mar 2021 16:52:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqlLArJ2NSbv+UIC9g7ZfaCNwjoUAPTpXMnMVrvLEAVHmYuD+UwxWluwUSySM10+lMb/zBGQZbynp62KAAOF8zHHD3n27VEj8Z1rlbraqWj60un/0xYaLSzc114GVzxpFueIG33ir+5Sq4kBa//rLyCqz5orMaBoolSQvHiUuu0RUezgMU7nmoCoPH4ZaQiMquHFFvOBbE1xwMonRslxgg4W1u8IVk/HYjpeAM+5/7lNyd+NXhIN5EnEPsvcc+qaIqrkI2WY/U4AfZYkvX0Bf7LR2Zx2jTnuea1s2AMtUde0MlBiapKfRfAx1NcqjuoWq0THZxqmA3U6wyJAzyLZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeKk68IYLZDtwcva7amIbtzPaGGJcfFqUnvEVbFPHtc=;
 b=SWN7or6MGsdnwBy6P0rk5Y9rovmHTB8WddECiUI5n89ENZ52PapXTDcfN1Njg5yHvay4P81hAApw7dd6S9z39zz7D3LUlZGm6tnsOtHdrpD5IwEccTvQ8hsmo3LbNtmiPDKs/uLQrXPOMUwI4CeITNez+14sUUj/SLYr03u3eaxXDCAxt0VeiiJk4s0EYTKTLq5Ur0WoUucXLjookxJFjaKRE/bUYsciwfhKTUxGzWGPrrWXjTBNAoyl1UYSyMA1ATIaqT84ulTQ7qZchEf9mT6bl5H6YLw4ONzW/m6puQ0OQ5mPlHk1Jc8ujGZpphplW1HZbdr0w7dZpYsG6eComw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeKk68IYLZDtwcva7amIbtzPaGGJcfFqUnvEVbFPHtc=;
 b=SNOclEh5cMXzyHoFvFLdsio7ZkdcVxoSfHxQ3DptvzR17xWHqeyiIb2tMPQtDNeDB0mIUmW5/P0U6E/levbK69WJpR8vBOQJSGKyAtb6pTQXlJbDxEEgr7OrTDMXrfFwx34nBzz76VaCOynsNOYLzF7vKH4vvl4e5NHnMO9qxLo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 20:51:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:51:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 03/11] block: use int64_t instead of uint64_t in driver
 read handlers
Date: Wed, 24 Mar 2021 23:51:24 +0300
Message-Id: <20210324205132.464899-4-vsementsov@virtuozzo.com>
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
 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 20:51:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40662d71-a8f9-450c-43dc-08d8ef06a632
X-MS-TrafficTypeDiagnostic: AM7PR08MB5447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB54475603BA5F4D8CDF3E3A3BC1639@AM7PR08MB5447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tQ+lpK7gtNr+vsZsjxsjriXfIIp5y4Lkf/JyDdzds5vL10EMJUCzR80a6jsWTmwvk+t3xGpaEFgeEzojFVUDdpVTzlO1yW/KYVUGi25l42SC7TkTvcEryGa0NHaIQWNO9R2gUJxLNGQ9mE9b/ftB1kalVjRhGAJdwdmv1hkfUPhZvJm+ZqvXq9wxYvOH5EG6quzod2j8NxAmPRgqNJX57tF/zw4fGftXhje++tN8aBbjCsiRa3kASAxmg0iMpTLow/kCK1DBiAdGyNmJMTumxQ+iskl46yD+huFP3uek9HCWbC9NIIOBAD922wRMnjZBpSyZo1p/cuLgOJxVHXq06PdjNa61JYYt148uT+qf+7HY3YmDHZQrI9Ok5Z2klHbCbQTu9LEye2ymv1oJ25vl17AdzDWvZje0EPs+6tEqynUNvC/hBGmtXsq0deXC7sKRqLf801C3s8ZnKCv6KHvqUcmZ3uHQA0vmy9iMyYL/QwZxktXO7C7FmBB+gCtH4qvb+5z5KgqAoalWZKiWbGQiXS2YacFo4cl6gPrp0x7eP00B8xFq0AQYLw0f+ebKhFfhkscU8qjk2QtXw/icjeQpvPlsoqI+Ymd5CpOcjCRFOHGP6fv4dI8fn89FjZsmhSACXimFWLr66Fw4akkkb1Bwnnn5noccuarpwULZsFXIPdKviwZBe061uZ0kCuL67VN4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(376002)(396003)(366004)(2616005)(6916009)(478600001)(8936002)(66946007)(38100700001)(956004)(66556008)(6512007)(66476007)(6506007)(6486002)(52116002)(186003)(5660300002)(26005)(69590400012)(83380400001)(7416002)(6666004)(86362001)(2906002)(30864003)(16526019)(316002)(1076003)(36756003)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F2GpAk/iCGqqSj1j2lBwk198ItAjqXisTp4fujImCiloVlxLvQhaJphQPHux?=
 =?us-ascii?Q?olaygfIfo60+ZsB+HhvZI5znXfORFhKSCLXPsX1yA9Zgrk846ApE3+S2kXxH?=
 =?us-ascii?Q?McrjzsOWAONu2Be4xl1vwFZR8HS6eQv65VjM98Pcih0T11arKpGoRQyk3K/3?=
 =?us-ascii?Q?V6iWJaSchfBFLSBDzFLXbvpoi5L8GK5UNNLzauusEyfGuvrAHe83GydQFqnz?=
 =?us-ascii?Q?GV8Ex2bhzuGMacyFDf9OhwWOHwMhK6MqL7YbPEVgBM1CNEHFkt6zIu8aUaXi?=
 =?us-ascii?Q?h4ehiJL1AWgqZjxTXgGJPCGQkUgFerbX5+whtHdv1RmGzWMnRYpofA1TusEq?=
 =?us-ascii?Q?CdsSkpEbcSdmk+UIa5HSU/vsDd2NQ4w0TvLquU53MQJyHSS1gk1hw278qIW4?=
 =?us-ascii?Q?UCNFdE4FodB4FLyFfe+i/Bc1D6hLtUiIfdNcquNxm69Mmgttd69vB1FccCNB?=
 =?us-ascii?Q?wrh0xDcsJqKjyLxb/9i7cF2XiTR/E6KujemUtvIBAFc5mmTcMrpWvwMlseB6?=
 =?us-ascii?Q?BTyQdy+vbGajrh1BiG/AbCdKArQnA4dDoLwQwBrAWXhm0JcTbmuMIFtPX/QY?=
 =?us-ascii?Q?56/4ElBbwq33PKo0hN62ytgE3/M5K9vcHs5ZaKLC86qNEaKdgZoyIgsIh37z?=
 =?us-ascii?Q?Tlxmj96RbHhV3teRhPzPf6RsBOn1DoC5afa9kALze32tKjqz1D1f5YLUCzBN?=
 =?us-ascii?Q?uBhBpz67GFWwxKf0+tBnCxcC8yNZ/FEPbwZ4/50jr+vwaFOelMHnuNHJomPw?=
 =?us-ascii?Q?J5R21/dIRCmNbSS4eJsQUBJHUbgQkiDdYBO1jxFNOaIgLWe2CebJBTHbvknJ?=
 =?us-ascii?Q?RqFc9QEmtzvhnjlIlFgl+KDUbfQH4xll/+EqWUDuPJrzEoxfbQ3RPuw1Ya0q?=
 =?us-ascii?Q?4D8odsrpmpco9GJnlBuZZp7cDETrOjpBuY9BUEny4KkEdXHH20rOr4JRChzy?=
 =?us-ascii?Q?RwdIyKS5zXL/EcCXgDvEdIjFf4IaMNo+7UyKO7sHbjEc0ZWPCwU8oi2n6Qjc?=
 =?us-ascii?Q?tmFygBHgM/AihRd65l0sW3ZAe4B7UdcABdUUTppe9XFlnI68d3WUtg3sVw45?=
 =?us-ascii?Q?wzAODWru8MgTMa64MLv16GWxb5i4QIk5JSHrlc+sZhvA7kGATJdCv8hGVjEA?=
 =?us-ascii?Q?E79x6Zaa5cjkGo0jVMHHe6Z5tvL0c4QlhASqykwyeRIZy/3tL1zIQnxRdwSd?=
 =?us-ascii?Q?N8CCnTIjpsvv6OgSInn5FhMR1mOmfRQopAU2q9Zt3arKOrubja0M2Re6sO8+?=
 =?us-ascii?Q?3ZLnEkYT26e1UcU+XOjab7JK7XICfkQTQ1a9DqkhaeoSrX4CEmLAZ20F68IW?=
 =?us-ascii?Q?sGK/BNMvAls9QZB34ohmOLat?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40662d71-a8f9-450c-43dc-08d8ef06a632
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:51:51.1831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYdotB3cNkuDI27A7qMWbv27bthUxeEmT7dxsgFVjvpiGDYLP8EbbBvTyMZoNicZpV+aFz8nlcvf7UR3BuUaHJRqytMzAIjz1d8mKzcFskc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447
Received-SPF: pass client-ip=40.107.21.116;
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

We are going to convert .bdrv_co_preadv_part and .bdrv_co_pwritev_part
to int64_t type for offset and bytes parameters (as it's already done
for generic block/io.c layer).

In qcow2 .bdrv_co_preadv_part is used in some places, so let's add
corresponding checks and assertions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

block: use int64_t instead of uint64_t in driver read handlers

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, convert driver read handlers parameters which are already 64bit to
signed type.

While being here, convert also flags parameter to be BdrvRequestFlags.

Now let's consider all callers. Simple

  git grep '\->bdrv_\(aio\|co\)_preadv\(_part\)\?'

shows that's there three callers of driver function:

 bdrv_driver_preadv() in block/io.c, passes int64_t, checked by
   bdrv_check_qiov_request() to be non-negative.

 qcow2_load_vmstate() does bdrv_check_qiov_request().

 do_perform_cow_read() has uint64_t argument. And a lot of things in
 qcow2 driver are uint64_t, so converting it is big job. But we must
 not work with requests that doesn't satisfy bdrv_check_qiov_request(),
 so let's just assert it here.

Still, the functions may be called directly, not only by drv->...
Let's check:

git grep '\.bdrv_\(aio\|co\)_preadv\(_part\)\?\s*=' | \
awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
while read func; do git grep "$func(" | \
grep -v "$func(BlockDriverState"; done

The only one such caller:

    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, &data, 1);
    ...
    ret = bdrv_replace_test_co_preadv(bs, 0, 1, &qiov, 0);

in tesTS/unit/test-bdrv-drain.c, and it's OK obviously.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h        | 11 ++++++-----
 block/backup-top.c               |  4 ++--
 block/blkdebug.c                 |  4 ++--
 block/blklogwrites.c             |  4 ++--
 block/blkreplay.c                |  2 +-
 block/blkverify.c                |  4 ++--
 block/bochs.c                    |  4 ++--
 block/cloop.c                    |  4 ++--
 block/commit.c                   |  2 +-
 block/copy-on-read.c             |  4 ++--
 block/crypto.c                   |  4 ++--
 block/curl.c                     |  3 ++-
 block/dmg.c                      |  4 ++--
 block/file-posix.c               |  6 +++---
 block/file-win32.c               |  4 ++--
 block/filter-compress.c          |  4 ++--
 block/mirror.c                   |  2 +-
 block/nbd.c                      |  5 +++--
 block/nfs.c                      |  6 +++---
 block/null.c                     |  9 +++++----
 block/nvme.c                     |  5 +++--
 block/preallocate.c              |  4 ++--
 block/qcow.c                     |  6 +++---
 block/qcow2-cluster.c            | 14 +++++++++++++-
 block/qcow2.c                    |  5 +++--
 block/quorum.c                   |  4 ++--
 block/raw-format.c               | 20 ++++++++++----------
 block/rbd.c                      |  5 +++--
 block/throttle.c                 |  5 +++--
 block/vdi.c                      |  4 ++--
 block/vmdk.c                     |  4 ++--
 block/vpc.c                      |  4 ++--
 block/vvfat.c                    |  4 ++--
 tests/unit/test-bdrv-drain.c     | 16 +++++++++-------
 tests/unit/test-block-iothread.c | 19 ++++++++++++++-----
 35 files changed, 120 insertions(+), 89 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index db7a909ea9..e6bcf74e46 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -234,8 +234,8 @@ struct BlockDriver {
 
     /* aio */
     BlockAIOCB *(*bdrv_aio_preadv)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags,
-        BlockCompletionFunc *cb, void *opaque);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
     BlockAIOCB *(*bdrv_aio_pwritev)(BlockDriverState *bs,
         uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags,
         BlockCompletionFunc *cb, void *opaque);
@@ -264,10 +264,11 @@ struct BlockDriver {
      * The buffer in @qiov may point directly to guest memory.
      */
     int coroutine_fn (*bdrv_co_preadv)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags);
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_preadv_part)(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, int flags);
+        int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_writev)(BlockDriverState *bs,
         int64_t sector_num, int nb_sectors, QEMUIOVector *qiov, int flags);
     /**
diff --git a/block/backup-top.c b/block/backup-top.c
index 589e8b651d..9779493a4b 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -42,8 +42,8 @@ typedef struct BDRVBackupTopState {
 } BDRVBackupTopState;
 
 static coroutine_fn int backup_top_co_preadv(
-        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, int flags)
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVBackupTopState *s = bs->opaque;
 
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 2c0b9b0ee8..b26fecf222 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -614,8 +614,8 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
 }
 
 static int coroutine_fn
-blkdebug_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                   QEMUIOVector *qiov, int flags)
+blkdebug_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                   QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int err;
 
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index b7579370a3..de3d4ba2b6 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -301,8 +301,8 @@ static void blk_log_writes_refresh_limits(BlockDriverState *bs, Error **errp)
 }
 
 static int coroutine_fn
-blk_log_writes_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                         QEMUIOVector *qiov, int flags)
+blk_log_writes_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                         QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 4a247752fd..13ea2166bb 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -72,7 +72,7 @@ static void block_request_create(uint64_t reqid, BlockDriverState *bs,
 }
 
 static int coroutine_fn blkreplay_co_preadv(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
diff --git a/block/blkverify.c b/block/blkverify.c
index 188d7632fa..5e35744b8a 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -221,8 +221,8 @@ blkverify_co_prwv(BlockDriverState *bs, BlkverifyRequest *r, uint64_t offset,
 }
 
 static int coroutine_fn
-blkverify_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                    QEMUIOVector *qiov, int flags)
+blkverify_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                    QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BlkverifyRequest r;
     QEMUIOVector raw_qiov;
diff --git a/block/bochs.c b/block/bochs.c
index 2f010ab40a..4d68658087 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -238,8 +238,8 @@ static int64_t seek_to_sector(BlockDriverState *bs, int64_t sector_num)
 }
 
 static int coroutine_fn
-bochs_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                QEMUIOVector *qiov, int flags)
+bochs_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVBochsState *s = bs->opaque;
     uint64_t sector_num = offset >> BDRV_SECTOR_BITS;
diff --git a/block/cloop.c b/block/cloop.c
index c99192a57f..b8c6d0eccd 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -245,8 +245,8 @@ static inline int cloop_read_block(BlockDriverState *bs, int block_num)
 }
 
 static int coroutine_fn
-cloop_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                QEMUIOVector *qiov, int flags)
+cloop_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVCloopState *s = bs->opaque;
     uint64_t sector_num = offset >> BDRV_SECTOR_BITS;
diff --git a/block/commit.c b/block/commit.c
index dd9ba87349..04a1bb43c1 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -212,7 +212,7 @@ static const BlockJobDriver commit_job_driver = {
 };
 
 static int coroutine_fn bdrv_commit_top_preadv(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 9cad9e1b8c..afb2a77b08 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -141,10 +141,10 @@ static int64_t cor_getlength(BlockDriverState *bs)
 
 
 static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
-                                           uint64_t offset, uint64_t bytes,
+                                           int64_t offset, int64_t bytes,
                                            QEMUIOVector *qiov,
                                            size_t qiov_offset,
-                                           int flags)
+                                           BdrvRequestFlags flags)
 {
     int64_t n;
     int local_flags;
diff --git a/block/crypto.c b/block/crypto.c
index 1d30fde38e..a732a36d10 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -397,8 +397,8 @@ static int block_crypto_reopen_prepare(BDRVReopenState *state,
 #define BLOCK_CRYPTO_MAX_IO_SIZE (1024 * 1024)
 
 static coroutine_fn int
-block_crypto_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                       QEMUIOVector *qiov, int flags)
+block_crypto_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                       QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BlockCrypto *crypto = bs->opaque;
     uint64_t cur_bytes; /* number of bytes in current iteration */
diff --git a/block/curl.c b/block/curl.c
index 50e741a0d7..4a8ae2b269 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -896,7 +896,8 @@ out:
 }
 
 static int coroutine_fn curl_co_preadv(BlockDriverState *bs,
-        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        BdrvRequestFlags flags)
 {
     CURLAIOCB acb = {
         .co = qemu_coroutine_self(),
diff --git a/block/dmg.c b/block/dmg.c
index ef35a505f2..447901fbb8 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -689,8 +689,8 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
 }
 
 static int coroutine_fn
-dmg_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-              QEMUIOVector *qiov, int flags)
+dmg_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+              QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVDMGState *s = bs->opaque;
     uint64_t sector_num = offset >> BDRV_SECTOR_BITS;
diff --git a/block/file-posix.c b/block/file-posix.c
index 20e14f8e96..25da79cdd5 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2033,9 +2033,9 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
     return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
 }
 
-static int coroutine_fn raw_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                      uint64_t bytes, QEMUIOVector *qiov,
-                                      int flags)
+static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, QEMUIOVector *qiov,
+                                      BdrvRequestFlags flags)
 {
     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_READ);
 }
diff --git a/block/file-win32.c b/block/file-win32.c
index 2642088bd6..15076350f2 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -436,8 +436,8 @@ fail:
 }
 
 static BlockAIOCB *raw_aio_preadv(BlockDriverState *bs,
-                                  uint64_t offset, uint64_t bytes,
-                                  QEMUIOVector *qiov, int flags,
+                                  int64_t offset, int64_t bytes,
+                                  QEMUIOVector *qiov, BdrvRequestFlags flags,
                                   BlockCompletionFunc *cb, void *opaque)
 {
     BDRVRawState *s = bs->opaque;
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 5136371bf8..54a16c6c64 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -63,10 +63,10 @@ static int64_t compress_getlength(BlockDriverState *bs)
 
 
 static int coroutine_fn compress_co_preadv_part(BlockDriverState *bs,
-                                                uint64_t offset, uint64_t bytes,
+                                                int64_t offset, int64_t bytes,
                                                 QEMUIOVector *qiov,
                                                 size_t qiov_offset,
-                                                int flags)
+                                                BdrvRequestFlags flags)
 {
     return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
                                flags);
diff --git a/block/mirror.c b/block/mirror.c
index 6af02a57c4..1587cda13c 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1381,7 +1381,7 @@ static void coroutine_fn active_write_settle(MirrorOp *op)
 }
 
 static int coroutine_fn bdrv_mirror_top_preadv(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
diff --git a/block/nbd.c b/block/nbd.c
index c26dc5a54f..a2b6aa1bca 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1534,8 +1534,9 @@ static int nbd_co_request(BlockDriverState *bs, NBDRequest *request,
     return ret ? ret : request_ret;
 }
 
-static int nbd_client_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                uint64_t bytes, QEMUIOVector *qiov, int flags)
+static int nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
+                                int64_t bytes, QEMUIOVector *qiov,
+                                BdrvRequestFlags flags)
 {
     int ret, request_ret;
     Error *local_err = NULL;
diff --git a/block/nfs.c b/block/nfs.c
index 8c1968bb41..eee8f706ba 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -265,9 +265,9 @@ nfs_co_generic_cb(int ret, struct nfs_context *nfs, void *data,
                                      nfs_co_generic_bh_cb, task);
 }
 
-static int coroutine_fn nfs_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                      uint64_t bytes, QEMUIOVector *iov,
-                                      int flags)
+static int coroutine_fn nfs_co_preadv(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, QEMUIOVector *iov,
+                                      BdrvRequestFlags flags)
 {
     NFSClient *client = bs->opaque;
     NFSRPC task;
diff --git a/block/null.c b/block/null.c
index cc9b1d4ea7..343dbb580d 100644
--- a/block/null.c
+++ b/block/null.c
@@ -116,8 +116,9 @@ static coroutine_fn int null_co_common(BlockDriverState *bs)
 }
 
 static coroutine_fn int null_co_preadv(BlockDriverState *bs,
-                                       uint64_t offset, uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags)
+                                       int64_t offset, int64_t bytes,
+                                       QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     BDRVNullState *s = bs->opaque;
 
@@ -187,8 +188,8 @@ static inline BlockAIOCB *null_aio_common(BlockDriverState *bs,
 }
 
 static BlockAIOCB *null_aio_preadv(BlockDriverState *bs,
-                                   uint64_t offset, uint64_t bytes,
-                                   QEMUIOVector *qiov, int flags,
+                                   int64_t offset, int64_t bytes,
+                                   QEMUIOVector *qiov, BdrvRequestFlags flags,
                                    BlockCompletionFunc *cb,
                                    void *opaque)
 {
diff --git a/block/nvme.c b/block/nvme.c
index 2b5421e7aa..58342c6409 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1221,8 +1221,9 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
 }
 
 static coroutine_fn int nvme_co_preadv(BlockDriverState *bs,
-                                       uint64_t offset, uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags)
+                                       int64_t offset, int64_t bytes,
+                                       QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     return nvme_co_prw(bs, offset, bytes, qiov, false, flags);
 }
diff --git a/block/preallocate.c b/block/preallocate.c
index b619206304..5709443612 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -227,8 +227,8 @@ static void preallocate_reopen_abort(BDRVReopenState *state)
 }
 
 static coroutine_fn int preallocate_co_preadv_part(
-        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, int flags)
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
                                flags);
diff --git a/block/qcow.c b/block/qcow.c
index f8919a44d1..1151b8d79b 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -617,9 +617,9 @@ static void qcow_refresh_limits(BlockDriverState *bs, Error **errp)
     bs->bl.request_alignment = BDRV_SECTOR_SIZE;
 }
 
-static coroutine_fn int qcow_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t bytes, QEMUIOVector *qiov,
-                                       int flags)
+static coroutine_fn int qcow_co_preadv(BlockDriverState *bs, int64_t offset,
+                                       int64_t bytes, QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags)
 {
     BDRVQcowState *s = bs->opaque;
     int offset_in_cluster;
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index bd0597842f..70adea9f59 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -505,7 +505,19 @@ static int coroutine_fn do_perform_cow_read(BlockDriverState *bs,
         return -ENOMEDIUM;
     }
 
-    /* Call .bdrv_co_readv() directly instead of using the public block-layer
+    /*
+     * We never deal with requests that doesn't satisfy
+     * bdrv_check_qiov_request(), and aligning requests to clusters never break
+     * this condition. So, do some assertions before calling
+     * bs->drv->bdrv_co_preadv_part() which has int64_t arguments.
+     */
+    assert(src_cluster_offset <= INT64_MAX);
+    assert(src_cluster_offset + offset_in_cluster <= INT64_MAX);
+    assert(qiov->size <= INT64_MAX);
+    bdrv_check_qiov_request(src_cluster_offset + offset_in_cluster, qiov->size,
+                            qiov, 0, &error_abort);
+    /*
+     * Call .bdrv_co_readv() directly instead of using the public block-layer
      * interface.  This avoids double I/O throttling and request tracking,
      * which can lead to deadlock when block layer copy-on-read is enabled.
      */
diff --git a/block/qcow2.c b/block/qcow2.c
index b57acda010..34c5e1c073 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2281,9 +2281,10 @@ static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
 }
 
 static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
-                                             uint64_t offset, uint64_t bytes,
+                                             int64_t offset, int64_t bytes,
                                              QEMUIOVector *qiov,
-                                             size_t qiov_offset, int flags)
+                                             size_t qiov_offset,
+                                             BdrvRequestFlags flags)
 {
     BDRVQcow2State *s = bs->opaque;
     int ret = 0;
diff --git a/block/quorum.c b/block/quorum.c
index cfc1436abb..1eba2ce7ff 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -663,8 +663,8 @@ static int read_fifo_child(QuorumAIOCB *acb)
     return ret;
 }
 
-static int quorum_co_preadv(BlockDriverState *bs, uint64_t offset,
-                            uint64_t bytes, QEMUIOVector *qiov, int flags)
+static int quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                            QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
diff --git a/block/raw-format.c b/block/raw-format.c
index 7717578ed6..e3f459b2cb 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -181,8 +181,8 @@ static void raw_reopen_abort(BDRVReopenState *state)
 }
 
 /* Check and adjust the offset, against 'offset' and 'size' options. */
-static inline int raw_adjust_offset(BlockDriverState *bs, uint64_t *offset,
-                                    uint64_t bytes, bool is_write)
+static inline int raw_adjust_offset(BlockDriverState *bs, int64_t *offset,
+                                    int64_t bytes, bool is_write)
 {
     BDRVRawState *s = bs->opaque;
 
@@ -201,9 +201,9 @@ static inline int raw_adjust_offset(BlockDriverState *bs, uint64_t *offset,
     return 0;
 }
 
-static int coroutine_fn raw_co_preadv(BlockDriverState *bs, uint64_t offset,
-                                      uint64_t bytes, QEMUIOVector *qiov,
-                                      int flags)
+static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, QEMUIOVector *qiov,
+                                      BdrvRequestFlags flags)
 {
     int ret;
 
@@ -259,7 +259,7 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, uint64_t offset,
         qiov = &local_qiov;
     }
 
-    ret = raw_adjust_offset(bs, &offset, bytes, true);
+    ret = raw_adjust_offset(bs, (int64_t *)&offset, bytes, true);
     if (ret) {
         goto fail;
     }
@@ -294,7 +294,7 @@ static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
 {
     int ret;
 
-    ret = raw_adjust_offset(bs, (uint64_t *)&offset, bytes, true);
+    ret = raw_adjust_offset(bs, (int64_t *)&offset, bytes, true);
     if (ret) {
         return ret;
     }
@@ -306,7 +306,7 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
 {
     int ret;
 
-    ret = raw_adjust_offset(bs, (uint64_t *)&offset, bytes, true);
+    ret = raw_adjust_offset(bs, &offset, bytes, true);
     if (ret) {
         return ret;
     }
@@ -541,7 +541,7 @@ static int coroutine_fn raw_co_copy_range_from(BlockDriverState *bs,
 {
     int ret;
 
-    ret = raw_adjust_offset(bs, &src_offset, bytes, false);
+    ret = raw_adjust_offset(bs, (int64_t *)&src_offset, bytes, false);
     if (ret) {
         return ret;
     }
@@ -560,7 +560,7 @@ static int coroutine_fn raw_co_copy_range_to(BlockDriverState *bs,
 {
     int ret;
 
-    ret = raw_adjust_offset(bs, &dst_offset, bytes, true);
+    ret = raw_adjust_offset(bs, (int64_t *)&dst_offset, bytes, true);
     if (ret) {
         return ret;
     }
diff --git a/block/rbd.c b/block/rbd.c
index 9071a00e3f..69299e5f6f 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -992,8 +992,9 @@ failed:
 }
 
 static BlockAIOCB *qemu_rbd_aio_preadv(BlockDriverState *bs,
-                                       uint64_t offset, uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags,
+                                       int64_t offset, int64_t bytes,
+                                       QEMUIOVector *qiov,
+                                       BdrvRequestFlags flags,
                                        BlockCompletionFunc *cb,
                                        void *opaque)
 {
diff --git a/block/throttle.c b/block/throttle.c
index b685166ad4..20362b5fe5 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -112,8 +112,9 @@ static int64_t throttle_getlength(BlockDriverState *bs)
 }
 
 static int coroutine_fn throttle_co_preadv(BlockDriverState *bs,
-                                           uint64_t offset, uint64_t bytes,
-                                           QEMUIOVector *qiov, int flags)
+                                           int64_t offset, int64_t bytes,
+                                           QEMUIOVector *qiov,
+                                           BdrvRequestFlags flags)
 {
 
     ThrottleGroupMember *tgm = bs->opaque;
diff --git a/block/vdi.c b/block/vdi.c
index 5627e7d764..c0e71bfa53 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -544,8 +544,8 @@ static int coroutine_fn vdi_co_block_status(BlockDriverState *bs,
 }
 
 static int coroutine_fn
-vdi_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-              QEMUIOVector *qiov, int flags)
+vdi_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+              QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVVdiState *s = bs->opaque;
     QEMUIOVector local_qiov;
diff --git a/block/vmdk.c b/block/vmdk.c
index 4499f136bd..78592160d0 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1888,8 +1888,8 @@ static int vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
 }
 
 static int coroutine_fn
-vmdk_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-               QEMUIOVector *qiov, int flags)
+vmdk_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+               QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVVmdkState *s = bs->opaque;
     int ret;
diff --git a/block/vpc.c b/block/vpc.c
index 17a705b482..29c8517ff8 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -608,8 +608,8 @@ static int vpc_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 }
 
 static int coroutine_fn
-vpc_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-              QEMUIOVector *qiov, int flags)
+vpc_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+              QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVVPCState *s = bs->opaque;
     int ret;
diff --git a/block/vvfat.c b/block/vvfat.c
index 54807f82ca..8ac90166c5 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1522,8 +1522,8 @@ static int vvfat_read(BlockDriverState *bs, int64_t sector_num,
 }
 
 static int coroutine_fn
-vvfat_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                QEMUIOVector *qiov, int flags)
+vvfat_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret;
     BDRVVVFATState *s = bs->opaque;
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 8a29e33e00..2627d9781e 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -65,8 +65,9 @@ static void co_reenter_bh(void *opaque)
 }
 
 static int coroutine_fn bdrv_test_co_preadv(BlockDriverState *bs,
-                                            uint64_t offset, uint64_t bytes,
-                                            QEMUIOVector *qiov, int flags)
+                                            int64_t offset, int64_t bytes,
+                                            QEMUIOVector *qiov,
+                                            BdrvRequestFlags flags)
 {
     BDRVTestState *s = bs->opaque;
 
@@ -1105,8 +1106,9 @@ static void bdrv_test_top_close(BlockDriverState *bs)
 }
 
 static int coroutine_fn bdrv_test_top_co_preadv(BlockDriverState *bs,
-                                                uint64_t offset, uint64_t bytes,
-                                                QEMUIOVector *qiov, int flags)
+                                                int64_t offset, int64_t bytes,
+                                                QEMUIOVector *qiov,
+                                                BdrvRequestFlags flags)
 {
     BDRVTestTopState *tts = bs->opaque;
     return bdrv_co_preadv(tts->wait_child, offset, bytes, qiov, flags);
@@ -1854,10 +1856,10 @@ static void bdrv_replace_test_close(BlockDriverState *bs)
  *   Set .has_read to true and return success.
  */
 static int coroutine_fn bdrv_replace_test_co_preadv(BlockDriverState *bs,
-                                                    uint64_t offset,
-                                                    uint64_t bytes,
+                                                    int64_t offset,
+                                                    int64_t bytes,
                                                     QEMUIOVector *qiov,
-                                                    int flags)
+                                                    BdrvRequestFlags flags)
 {
     BDRVReplaceTestState *s = bs->opaque;
 
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 8cf172cb7a..b3f8f3ff8e 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -31,9 +31,18 @@
 #include "qemu/main-loop.h"
 #include "iothread.h"
 
-static int coroutine_fn bdrv_test_co_prwv(BlockDriverState *bs,
-                                          uint64_t offset, uint64_t bytes,
-                                          QEMUIOVector *qiov, int flags)
+static int coroutine_fn bdrv_test_co_preadv(BlockDriverState *bs,
+                                            int64_t offset, int64_t bytes,
+                                            QEMUIOVector *qiov,
+                                            BdrvRequestFlags flags)
+{
+    return 0;
+}
+
+static int coroutine_fn bdrv_test_co_pwritev(BlockDriverState *bs,
+                                             uint64_t offset, uint64_t bytes,
+                                             QEMUIOVector *qiov,
+                                             int flags)
 {
     return 0;
 }
@@ -66,8 +75,8 @@ static BlockDriver bdrv_test = {
     .format_name            = "test",
     .instance_size          = 1,
 
-    .bdrv_co_preadv         = bdrv_test_co_prwv,
-    .bdrv_co_pwritev        = bdrv_test_co_prwv,
+    .bdrv_co_preadv         = bdrv_test_co_preadv,
+    .bdrv_co_pwritev        = bdrv_test_co_pwritev,
     .bdrv_co_pdiscard       = bdrv_test_co_pdiscard,
     .bdrv_co_truncate       = bdrv_test_co_truncate,
     .bdrv_co_block_status   = bdrv_test_co_block_status,
-- 
2.29.2


