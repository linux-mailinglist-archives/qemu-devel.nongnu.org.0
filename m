Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123693FFE38
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:31:39 +0200 (CEST)
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6Ty-0005yl-3U
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6R1-0002tU-Cm; Fri, 03 Sep 2021 06:28:35 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:7190 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6Qx-0002A7-P5; Fri, 03 Sep 2021 06:28:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUk3Sa73EOEzAFmuJedFBpMOZfG8kRCR5c1/7zAN75vTqsDcEAq/Mp6rJS898WbMc6sg/lyL69hsrszA7dMSHg6d66gOQy0Pn+xHPdikGy8krlVdmyQCvm5QEkDCvD6BEg4J6ss9jxyPqQkTtDJSsuwenRaTelv0kvftpyQ3bqdYB96ckJqPgTM8fyipCrH5alR+fpBGshYqh6VCUlelbk7GFjc3bybx1ZP6nwAediFPmpUH/i1l9CRIuASp/4mp+IP0+PafT+MQ+WoAv+KZC5qDhsXhTUftbZWD3Cbe/lJ4B/SLFhmdSha/qKQaR8U6M8LfvxxkvpM//PKl0H25Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=jhQIM2V3yCcVe+4d3x5oj8fdIOee2PI9kvlJknTDbz0=;
 b=Pqy5qXTBGwe3+cApi2VMcDSmH1YSHFBXpPTrytUsUGLnlMzoFYH2Pz4qQnjAvP5TXEzqRvWCv9DAc774sReeA9iubltvgWeWa8NbauqzM4UkBapmFu1CDYMhIn40KlBOKvQHYP82ocvvGZNgS/kBtnLW8lprjXnQXDHj61XwaKiQLM+OukOus0iJU7xcYfjYZ0grfpnAAmVRgFzvVGfyj1R9bPiTQq8sZLttFgje3U34R2OMKwWAoWXT5NTeYbWDUG/anhPzqXMilnAqCSqPO9evcMrUFba0Jw8fPp4RyBUFAoaYs7M3E6SmP9jazT590PlO0MUWonvudVCxLRSPQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhQIM2V3yCcVe+4d3x5oj8fdIOee2PI9kvlJknTDbz0=;
 b=fdKrxSI1MkddO3CuplduI78nvFLViOJsOHY46v2QB4CNWvsXfFGldONdfztSeR5ocVYcoVYrXhFOqz3SQaRbkfybQOHqq/sxaHe07+LMTBTTVAmlh8kad1QeHqp6WIbFnnWB3VcaDV4MVRm/K4BjYcohemjNRZwWDKBWAa8bcc4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6945.eurprd08.prod.outlook.com (2603:10a6:20b:344::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 10:28:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 10:28:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, kraxel@redhat.com,
 idryomov@gmail.com, berto@igalia.com, philmd@redhat.com, eblake@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 vsementsov@virtuozzo.com, jsnow@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, ari@tuxera.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 03/11] block: use int64_t instead of uint64_t in driver
 read handlers
Date: Fri,  3 Sep 2021 13:27:59 +0300
Message-Id: <20210903102807.27127-4-vsementsov@virtuozzo.com>
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
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:28:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73a52c7c-5de9-4edd-eb87-08d96ec591ca
X-MS-TrafficTypeDiagnostic: AS8PR08MB6945:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB694520D56C729480E92F5DCCC1CF9@AS8PR08MB6945.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nk5tKrAG5X+1PHMO5NNFztaOrztKi6qzX3Fx5pF377dY0UPZXZctm+Cq9fzeZ0TQHlMoJeSAdWqDDUyU4jXAnZ1wEKwO9fQoxbLfgzmT+GzqdGsFZl1gmmOCL9433SB/Yee0ArhWCfyj9efbkdMBxyIcU0e1QEOZPqfKcabscbA5hxj+mY4DYKCeM71rYU4SCAX39BB5FpyKlDQd5o43H+lpDQ9yBsbRJ7SFNzVNRrEakOE6AtdRlkBcYUnY2o6DCwr/tLaLPehKW127R0fAK4QQAr2E0IjPGtGSildsuriUQsSLBWRXUtPvCSc9RqsQKvZWNjgl4dY6YIPb9QTFPmAQGi86W5O9w9quA4y5AojKGuM2Kp78bVItXZDFlUgs/R8QlWUalkdalnljqMMIS2KqJQZLG1abvPnEZbtwmW5lBwaxygidn5AnUuvZqNBcxHcLMXSZKRNFtmJE2evLvcef+onOswDQsys1rP9pTw61C5TVmXZ+Ibob6ehjxHsUewHRRCV+XLzoqR2Bj3W+TI2mefIv/jhlaqhuwaXZ8BFaVSy+OJmtCxqQB02I4s9XlyxJI3WuEahYZysDsqeD5boAbINhSHj0o5m/RZoLdz/7W6t+vyuMtLd3rS63yQOzKaxyFGyqP61sCW6FX4LQQkjLYkSEWsI6aXy0oyhnwye0wuFJYB2eCgjdON8LFnHg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39840400004)(396003)(376002)(7416002)(83380400001)(38350700002)(36756003)(6512007)(38100700002)(6486002)(5660300002)(52116002)(6666004)(6916009)(186003)(956004)(66556008)(2906002)(66476007)(66946007)(30864003)(8936002)(6506007)(26005)(86362001)(2616005)(316002)(478600001)(1076003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uBAsUBlsMMCCBH8CzAiNcktsvOex3O1r6DkCzzB4QN/7DsXZ2zVsnqm1F9Ya?=
 =?us-ascii?Q?oc6+CtsamCXUJ/1JDhNJZY9bb2xFp4+0tgf6SlwHtihGgFFfjDosszHvhSnd?=
 =?us-ascii?Q?bcD7kqqZ19FaEA7FRfCKFdyzRHRBEpV+KnXAbeDY5uEcKL4mLdIdTHj+jWJM?=
 =?us-ascii?Q?1l9mKCpfLRRcGknSGXopGsSUZEdam+s7Sog6iMbPQufXo88NjcfzYCGfPXiD?=
 =?us-ascii?Q?OKKagUjPWrloqJt6lyQFnMR4vQVmNPx8uatSKzrMjQKsx6xK48f12VxWSTYX?=
 =?us-ascii?Q?k22WpZim2CS2BG/+awUsFQUwgzXW+zOja4jgokf4n1ukguU/MC2Nbvx1fsJD?=
 =?us-ascii?Q?tLF6nmu3BmD79L+HqluJCYlddbr9bcYITjbmUjO5DrssqBq5dakWb6e8VrX4?=
 =?us-ascii?Q?7t0C4kwaP6CjGvTln0OPvZpD15wbGfKsm1tCS2eMzqQOxaBK0YsNIelTG5QW?=
 =?us-ascii?Q?3wIQbWj4p87UVloIlD3wWy3vKzX7K2IMvcVwAuHq1hdv9KVIdJk2f35D7VsC?=
 =?us-ascii?Q?JePkDFGzBTW58MlCKVrOl44mRXEGrhr/OYysEjNYeM81tR244rcUsdk6AcvQ?=
 =?us-ascii?Q?bZba5bq5vmwTMAS4PA6f+GgsSNHkw90LMz10LPFbItGd2agjgozXZ9apYeHo?=
 =?us-ascii?Q?XQHJewYzJeEPVe8SIpX54Oizvwceu2sIUN/daga8DpL+CWIcCNTpKIX272VA?=
 =?us-ascii?Q?38NoH3pLGIYZX5V/odWyTYoNRPfSkBurJO4itngU9TOj9zXVrEOF2hWumS07?=
 =?us-ascii?Q?NM8FYGa5ZTpw4MvZb0O4CTnYUEjcXNJwrkODFal7MHYPI9Or3cjIbYYm572b?=
 =?us-ascii?Q?0KVz1iSS/JFDhzpzZxqJNL+1C4ecbeAJx6teTLBufZHrt1KpHfp9LM1og3C2?=
 =?us-ascii?Q?O3MGWVUXKNV1TYxGTfKvOcGGAuuHif6h2pBhC5UvSQ1e7tgOTlmHSYpKDQjE?=
 =?us-ascii?Q?mzbQmXWYR+sasTXsLR7Tx2x5ra48y2OIVD7+WlL3QxIKkpl/m3EqZ5tyAaor?=
 =?us-ascii?Q?G5aIBZMJxAnDF25SmQNvGLdOYn8BRmJf0gAdjPDnCNUEcFSpWcz5VbJH5h0k?=
 =?us-ascii?Q?eYF6e+BLJLYlG5piNzdGvgRCKYv1yTI7U8BTN6vnxN3dAiCMr9IUk019aTXX?=
 =?us-ascii?Q?tecyd3daRnSGS1f0ZWODmgLcEBPn3Px7lF3N/AdxiBXcEHZ5wQAj1h3qKx/+?=
 =?us-ascii?Q?+cnneUaqZMVuxJ6+qnlTjaFkdXyq9OlIK/dgdInE2SugatVWTrmv63fYKrzz?=
 =?us-ascii?Q?+cVH7s6U2Imk/fXWj4FZPzlm7AiA7pQitTbmHFIhV7zdLq02dk+sfMxFZSOT?=
 =?us-ascii?Q?4KKBdFFxfFrchqe+8v6jgFJT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a52c7c-5de9-4edd-eb87-08d96ec591ca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:28:29.0640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4w5groZBwxs3xp94jAvPq4v7Nbn5lbWhC8740ihlY5Im7rOE7ViQAJ+XTjY5+A2gpTjhkFM8OfBrekA3Ah4sGb1/iOafEYhSLt+morRrIt4=
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
 not work with requests that don't satisfy bdrv_check_qiov_request(),
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
 block/blkdebug.c                 |  4 ++--
 block/blklogwrites.c             |  4 ++--
 block/blkreplay.c                |  2 +-
 block/blkverify.c                |  4 ++--
 block/bochs.c                    |  4 ++--
 block/cloop.c                    |  4 ++--
 block/commit.c                   |  2 +-
 block/copy-before-write.c        |  4 ++--
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
 block/rbd.c                      |  6 +++---
 block/throttle.c                 |  5 +++--
 block/vdi.c                      |  4 ++--
 block/vmdk.c                     |  4 ++--
 block/vpc.c                      |  4 ++--
 block/vvfat.c                    |  4 ++--
 tests/unit/test-bdrv-drain.c     | 16 +++++++++-------
 tests/unit/test-block-iothread.c | 19 ++++++++++++++-----
 slirp                            |  2 +-
 ui/keycodemapdb                  |  2 +-
 37 files changed, 122 insertions(+), 92 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 6f15cc9073..4906f27097 100644
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
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 8b67554bec..12b8419065 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -631,8 +631,8 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
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
index 42792b4556..10cc5ff451 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -207,7 +207,7 @@ static const BlockJobDriver commit_job_driver = {
 };
 
 static int coroutine_fn bdrv_commit_top_preadv(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2a5e57deca..591cc3ac75 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -40,8 +40,8 @@ typedef struct BDRVCopyBeforeWriteState {
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
-        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-        QEMUIOVector *qiov, int flags)
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index c428682272..d34add4476 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -128,10 +128,10 @@ static int64_t cor_getlength(BlockDriverState *bs)
 
 
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
index cb9bffe047..9c81e45179 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2077,9 +2077,9 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
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
index b97c58d642..4e8947009b 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -440,8 +440,8 @@ fail:
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
index 98fc66eabf..8595007be7 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1395,7 +1395,7 @@ static void coroutine_fn active_write_settle(MirrorOp *op)
 }
 
 static int coroutine_fn bdrv_mirror_top_preadv(BlockDriverState *bs,
-    uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
diff --git a/block/nbd.c b/block/nbd.c
index f6ff1c4fb4..c816933d7d 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1322,8 +1322,9 @@ static int nbd_co_request(BlockDriverState *bs, NBDRequest *request,
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
index 9aeaefb364..27f9ab8307 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -262,9 +262,9 @@ nfs_co_generic_cb(int ret, struct nfs_context *nfs, void *data,
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
index e8dbbc2317..c7fba6623d 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1243,8 +1243,9 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
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
index 04ad512897..610fdfc72b 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2310,9 +2310,10 @@ static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
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
index f2c0805000..57c73b2156 100644
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
index c26f493688..a5728e7b0c 100644
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
+    ret = raw_adjust_offset(bs, &offset, bytes, true);
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
index dcf82b15b8..21438dfb7c 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1164,9 +1164,9 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
 }
 
 static int
-coroutine_fn qemu_rbd_co_preadv(BlockDriverState *bs, uint64_t offset,
-                               uint64_t bytes, QEMUIOVector *qiov,
-                               int flags)
+coroutine_fn qemu_rbd_co_preadv(BlockDriverState *bs, int64_t offset,
+                                int64_t bytes, QEMUIOVector *qiov,
+                                BdrvRequestFlags flags)
 {
     return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_READ);
 }
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
index 548f8a057b..b394cf6ca6 100644
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
index 34bf1e3a86..9c53c2d0a4 100644
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
index ce071b5fc5..2d3c17e566 100644
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
 
@@ -1106,8 +1107,9 @@ static void bdrv_test_top_close(BlockDriverState *bs)
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
@@ -1855,10 +1857,10 @@ static void bdrv_replace_test_close(BlockDriverState *bs)
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
index c39e70b2f5..f18fa6e0fb 100644
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
diff --git a/slirp b/slirp
index a88d9ace23..8f43a99191 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
+Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
diff --git a/ui/keycodemapdb b/ui/keycodemapdb
index d21009b1c9..6119e6e19a 160000
--- a/ui/keycodemapdb
+++ b/ui/keycodemapdb
@@ -1 +1 @@
-Subproject commit d21009b1c9f94b740ea66be8e48a1d8ad8124023
+Subproject commit 6119e6e19a050df847418de7babe5166779955e4
-- 
2.29.2


