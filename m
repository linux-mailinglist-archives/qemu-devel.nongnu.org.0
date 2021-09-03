Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9FD3FFE40
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:35:33 +0200 (CEST)
Received: from localhost ([::1]:46044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6Xk-0003bE-St
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6RE-00036F-56; Fri, 03 Sep 2021 06:28:48 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:7190 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6RB-0002A7-7w; Fri, 03 Sep 2021 06:28:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acwCHFz+wcJK7EgO90hSlzflljxYkLDfAJ7QApXgWNi9Drtbwobm6FfZGwOQ6RISoiwkQ5dW+sjwB+QFIGbuxMdodINC48iXnUGPZebX6Vja4OjiCxgPucyQDe1Ju3oKD9j6Pp0QrxWqvmWPV7UtW0f+mdfLVQzk5hhCcCpkXYvi6VBn3Qf2ndCG0VCDQPoCk1/3ifipGUSx0Ksx7U+413G1dRndMqpbofuuav9rLj9mhjC4dONY1nURH2ZuZmrswPDbj3H50OC89YTgOFjgDQnaolaolxT32+gRktwki/32i7N5rODuSlfnjJ6e4qtZItKfzTYkt7kNO17c0Xqslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=kbBnTp8aclESdDddxVHo1pS6Z4OhbktDEoAeyEHzUzQ=;
 b=IClfkuawDmZsLOvhd2+NyTpDydzRZAmPmR52c3PdKgW1oAVzEEE1SDNhGjFMLgmCFNS2Srz0hMJ5Vg9SzRWyej/vwuKEmhCg66+i7BFYGWNnQBnRm2TzUOUJ3Wn/u3mnq+maLN2Nrkfym4uVZ3/FvfA5AZH0RGI5rZAYZaIkXw5zt762Kucxgu7+K3KsnrfmLr4Felzj6mP16rAw1Ekk6TRwemluHF6GDn/HEM8SKG5S+YMToMpnkpFh5B6o/RzydteCyWtT0FnF5r5XAHU5ME4W8CDHTVUYmts9zHtXhQYWBI7Eg1AfIJzQH9LNpUGUyMbsASSUQgGF0jaiM0mVyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbBnTp8aclESdDddxVHo1pS6Z4OhbktDEoAeyEHzUzQ=;
 b=URf1wk9h0drcI8VrnfPIquh3pq4QlcrMtTnjsBl2ZrAjUdsZmhQZsMlPrvJACXNFvXQP1MblMnWTA17wy8NtRfIGte6X5HNuroqluo1MdkoWpONXDEZ+zerGerKfSuwrOeqnkzHM7915AQv1sZ2HMU7rtgx32fn4u9+nCwZKSRc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6945.eurprd08.prod.outlook.com (2603:10a6:20b:344::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 10:28:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 10:28:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, kraxel@redhat.com,
 idryomov@gmail.com, berto@igalia.com, philmd@redhat.com, eblake@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 vsementsov@virtuozzo.com, jsnow@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, ari@tuxera.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 07/11] block: use int64_t instead of int in driver
 write_zeroes handlers
Date: Fri,  3 Sep 2021 13:28:03 +0300
Message-Id: <20210903102807.27127-8-vsementsov@virtuozzo.com>
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
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:28:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3085679-daf9-456c-1d0d-08d96ec596f3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6945:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB69450B35CCF94C0C5CA6ABF9C1CF9@AS8PR08MB6945.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G7hceJQqXKavNXlzbicgLq1odP6uyxOgHCm2omHS6+MRHntjSh9Ncsh1RUCMH/jlhqmcAZWVBVpLDlD/5O0xlmBOqnmGouuMTws//3Lbfb9wC44fS9ptbK9/A2rSEKi9fv1fSZOr7WI/JCdsW3dyBVRJEWbDiPf3+JRndJ/s5l2AS/fbGSn8squ7PRcp3k/szH5QRbiQz2S4f4rY9xAcMbZZO6tMDYtRgfQPUGNKPDhrHTvl4TJcQHDsX6xgnM+kTLUYgQV4vN0Ax87sZ69m8E15nDsaNFTHAG9CVPQUd8eBfi3r754f0tOPyRygu+AM610AJyr7hqC/ySYwA2oERYRBvLcAGvsVcKKS9O3XZ+bef4+psh1aJAE5PMm6PQmw37m98Ywh5WC4Bv0VZme50D/saYybGDsW3ywpiqs9fJ0htPp5CC2gtP7YhwU9IrHfl2A7ABMJj257gEWZvjmzdmKqDctQFiBk+8Yy3AhAFHU4UiPKZP8AjEUFcsGnfcL8fLHEVB+SjiC1k5yDK8E5BQK4uKCl/gmSqgWHz7EOZa+h2l8/HBbYdMHzYhDHYkF70xWnQushgYgk/XoCDcbEP5ad9ZhriFG35TNXvQOKIJ8+0AGDWt0EF3t3ff2j0KLehC/jRvM/LWmTh04PxAqFDrFysgRkXUbviCXUR+8mx0VZxQrxWXUDyvJRUxWFCNYTaNkfeHkiPBkaynoIXrncVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39840400004)(396003)(376002)(7416002)(83380400001)(38350700002)(36756003)(6512007)(38100700002)(6486002)(5660300002)(52116002)(6666004)(6916009)(186003)(956004)(66556008)(2906002)(66476007)(66946007)(30864003)(8936002)(6506007)(26005)(86362001)(2616005)(316002)(478600001)(1076003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XnXTxL1EAPrZOI0ryCP6L8IES69rd5yp0FSwKliH4Ai0TU1hiLkvC0Cyfo1m?=
 =?us-ascii?Q?d1J3nEtogXCwjCfgcg4MGpmVLeZDZ+pRkKlfCNMD5tYuhTu1Yj7swNLRy14e?=
 =?us-ascii?Q?jpM9bxPdogykAV8UA23VpPHzbz3eJnzPB8ttZvDM8//pYw/nkF2N6ZnUYxkl?=
 =?us-ascii?Q?FfJzaeMUEdT9PP6LMjQWOD9nEQJph3Ah/sqzoM5VZ6u09gQbNv+QMuYlXcdv?=
 =?us-ascii?Q?9KeDz6XLRWcnsG/VMrJEob4aNIk6LgyZ9W6CjlUpbS1JWpqNQJHThTFiVbhv?=
 =?us-ascii?Q?R2F1cGV8QmzvVH6haEO2JS4radr3lzh5S/B0HXC5vOo4phRH1qYRumwP4voC?=
 =?us-ascii?Q?hcS96x6bAPXY5ZyB9p78zsvTjAEpt4e6jd+8CthfS+7FxlouRhdiw4/XWNuZ?=
 =?us-ascii?Q?//5WkRYN7u0jX2Ryrv7pb77U/5rt/YOWrP/dYbyhicLczAsjqGR2pJHcqRw2?=
 =?us-ascii?Q?gYbNzdG4thgfRJPTAIvVsMCaXuN2l2L7wbpmUqJQXX6gtHfej0X8+LxaHFfg?=
 =?us-ascii?Q?Osgo6D4edwEEe2foXTfxaDJpy7hsd5fGwMk8oK0bjDIwoV974kd5kLI5gmYW?=
 =?us-ascii?Q?oX5O794oVR9L3TtdHrulsMPWc2ZkN5akW69ITEQJxBM5cpIkGCzMDgUM9V/m?=
 =?us-ascii?Q?FDFDtD/ECTWTJUlb5z02XNo0lse2BGKmq24+oGgZN2M2LwuwKah9JKgbuGNe?=
 =?us-ascii?Q?9DUYtTJh2fF7+IbHe331o4jeq4ZLD+oYf/88IrRlbhzaHS+EfldoQ90GK5Pb?=
 =?us-ascii?Q?YUHeMsxk5KrwZYbXIQMw8iCYaciwDhORS+CGEu/Rytzj8RrIZxg+SuUZwRqa?=
 =?us-ascii?Q?mxQKJtE3gUuh9Sch9Pn9Crbf6p/fXeUfQC+8OyV1wlWWzz7Us/SfL9/hBqpL?=
 =?us-ascii?Q?m01RvMagB+KaqYGCkahHvxto1PMBNgL7lRh1rykc5FdCfIBVhEwJ2s251KQZ?=
 =?us-ascii?Q?9szyj5UCp9spiNKKftFB5O+NBLBP3yqFmfqZM9IAObAESqlJ+Md7uzUDH5yF?=
 =?us-ascii?Q?wGaOLd2DzcAOQLpzttM03My3Lv66miZRfAOxDqGurB9d3o8dK+9b+/JXYZ5n?=
 =?us-ascii?Q?Qn7772tyS+eAYlKeBlQy+vnrQMvwgfCoiKpjRtUo28xTvVwE0aVH/Eqdbar2?=
 =?us-ascii?Q?ADQlesXEsGMN9eFPhybhOPjHEmR8qLAoxhLSLYF2+NoEcSuXS8ZGWpSWIGvt?=
 =?us-ascii?Q?vcF+MfoR+RFm/WSt1pUZhlzJmq84Zkg074IlCwbmBNFbB66yvWj4PQ164la3?=
 =?us-ascii?Q?+LjKz2ZbNs4XCR+PbLkatl18qfjDY3ZfkNbkkw8enG/HK99DJ3lOmqLUOc9W?=
 =?us-ascii?Q?0yA3UNYZ62xQpYMvV89D2fQG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3085679-daf9-456c-1d0d-08d96ec596f3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:28:37.2451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3q/3AlXgvY5JQAqZNIV6lQr1NKLoDQQCfb/2Z1T7+x260Xo1tVydQlwR0lxfdPkJC1swJzMAtUgVKJ2JwWL/MrcIITDLJAwvoRoIsbFHgA=
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

So, convert driver write_zeroes handlers bytes parameter to int64_t.

The only caller of all updated function is bdrv_co_do_pwrite_zeroes().

bdrv_co_do_pwrite_zeroes() itself is of course OK with widening of
callee parameter type. Also, bdrv_co_do_pwrite_zeroes()'s
max_write_zeroes is limited to INT_MAX. So, updated functions all are
safe, they will not get "bytes" larger than before.

Still, let's look through all updated functions, and add assertions to
the ones which are actually unprepared to values larger than INT_MAX.
For these drivers also set explicit max_pwrite_zeroes limit.

Let's go:

blkdebug: calculations can't overflow, thanks to
  bdrv_check_qiov_request() in generic layer. rule_check() and
  bdrv_co_pwrite_zeroes() both have 64bit argument.

blklogwrites: pass to blk_log_writes_co_log() with 64bit argument.

blkreplay, copy-on-read, filter-compress: pass to
  bdrv_co_pwrite_zeroes() which is OK

copy-before-write: Calls cbw_do_copy_before_write() and
  bdrv_co_pwrite_zeroes, both have 64bit argument.

file-posix: both handler calls raw_do_pwrite_zeroes, which is updated.
  In raw_do_pwrite_zeroes() calculations are OK due to
  bdrv_check_qiov_request(), bytes go to RawPosixAIOData::aio_nbytes
  which is uint64_t.
  Check also where that uint64_t gets handed:
  handle_aiocb_write_zeroes_block() passes a uint64_t[2] to
  ioctl(BLKZEROOUT), handle_aiocb_write_zeroes() calls do_fallocate()
  which takes off_t (and we compile to always have 64-bit off_t), as
  does handle_aiocb_write_zeroes_unmap. All look safe.

gluster: bytes go to GlusterAIOCB::size which is int64_t and to
  glfs_zerofill_async works with off_t.

iscsi: Aha, here we deal with iscsi_writesame16_task() that has
  uint32_t num_blocks argument and iscsi_writesame16_task() has
  uint16_t argument. Make comments, add assertions and clarify
  max_pwrite_zeroes calculation.
  iscsi_allocmap_() functions already has int64_t argument
  is_byte_request_lun_aligned is simple to update, do it.

mirror_top: pass to bdrv_mirror_top_do_write which has uint64_t
  argument

nbd: Aha, here we have protocol limitation, and NBDRequest::len is
  uint32_t. max_pwrite_zeroes is cleanly set to 32bit value, so we are
  OK for now.

nvme: Again, protocol limitation. And no inherent limit for
  write-zeroes at all. But from code that calculates cdw12 it's obvious
  that we do have limit and alignment. Let's clarify it. Also,
  obviously the code is not prepared to handle bytes=0. Let's handle
  this case too.
  trace events already 64bit

preallocate: pass to handle_write() and bdrv_co_pwrite_zeroes(), both
  64bit.

rbd: pass to qemu_rbd_start_co() which is 64bit.

qcow2: offset + bytes and alignment still works good (thanks to
  bdrv_check_qiov_request()), so tail calculation is OK
  qcow2_subcluster_zeroize() has 64bit argument, should be OK
  trace events updated

qed: qed_co_request wants int nb_sectors. Also in code we have size_t
  used for request length which may be 32bit. So, let's just keep
  INT_MAX as a limit (aligning it down to pwrite_zeroes_alignment) and
  don't care.

raw-format: Is OK. raw_adjust_offset and bdrv_co_pwrite_zeroes are both
  64bit.

throttle: Both throttle_group_co_io_limits_intercept() and
  bdrv_co_pwrite_zeroes() are 64bit.

vmdk: pass to vmdk_pwritev which is 64bit

quorum: pass to quorum_co_pwritev() which is 64bit

Hooray!

At this point all block drivers are prepared to support 64bit
write-zero requests, or have explicitly set max_pwrite_zeroes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  2 +-
 block/blkdebug.c          |  2 +-
 block/blklogwrites.c      |  4 ++--
 block/blkreplay.c         |  2 +-
 block/copy-before-write.c |  2 +-
 block/copy-on-read.c      |  2 +-
 block/file-posix.c        |  6 +++---
 block/filter-compress.c   |  2 +-
 block/gluster.c           |  6 +++---
 block/iscsi.c             | 30 ++++++++++++++++++++----------
 block/mirror.c            |  2 +-
 block/nbd.c               |  6 ++++--
 block/nvme.c              | 24 +++++++++++++++++++++---
 block/preallocate.c       |  2 +-
 block/qcow2.c             |  2 +-
 block/qed.c               |  9 ++++++++-
 block/quorum.c            |  2 +-
 block/raw-format.c        |  2 +-
 block/rbd.c               |  4 ++--
 block/throttle.c          |  2 +-
 block/vmdk.c              |  2 +-
 block/trace-events        |  4 ++--
 22 files changed, 78 insertions(+), 41 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 6c47985d5f..112a42ae8f 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -300,7 +300,7 @@ struct BlockDriver {
      * will be called instead.
      */
     int coroutine_fn (*bdrv_co_pwrite_zeroes)(BlockDriverState *bs,
-        int64_t offset, int bytes, BdrvRequestFlags flags);
+        int64_t offset, int64_t bytes, BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_pdiscard)(BlockDriverState *bs,
         int64_t offset, int bytes);
 
diff --git a/block/blkdebug.c b/block/blkdebug.c
index e686cd9799..742b4a3834 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -684,7 +684,7 @@ static int blkdebug_co_flush(BlockDriverState *bs)
 }
 
 static int coroutine_fn blkdebug_co_pwrite_zeroes(BlockDriverState *bs,
-                                                  int64_t offset, int bytes,
+                                                  int64_t offset, int64_t bytes,
                                                   BdrvRequestFlags flags)
 {
     uint32_t align = MAX(bs->bl.request_alignment,
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index ca174ab135..d7ae64c22d 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -468,8 +468,8 @@ blk_log_writes_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
 }
 
 static int coroutine_fn
-blk_log_writes_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
-                                BdrvRequestFlags flags)
+blk_log_writes_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
+                                int64_t bytes, BdrvRequestFlags flags)
 {
     return blk_log_writes_co_log(bs, offset, bytes, NULL, flags,
                                  blk_log_writes_co_do_file_pwrite_zeroes, 0,
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 7ba62dcac1..89d74a3cca 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -94,7 +94,7 @@ static int coroutine_fn blkreplay_co_pwritev(BlockDriverState *bs,
 }
 
 static int coroutine_fn blkreplay_co_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 74360b4853..d210e87a45 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -75,7 +75,7 @@ static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
 }
 
 static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
-        int64_t offset, int bytes, BdrvRequestFlags flags)
+        int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     int ret = cbw_do_copy_before_write(bs, offset, bytes, flags);
     if (ret < 0) {
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index b2ec36b6fc..f83dd83f14 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -193,7 +193,7 @@ static int coroutine_fn cor_co_pwritev_part(BlockDriverState *bs,
 
 
 static int coroutine_fn cor_co_pwrite_zeroes(BlockDriverState *bs,
-                                             int64_t offset, int bytes,
+                                             int64_t offset, int64_t bytes,
                                              BdrvRequestFlags flags)
 {
     return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
diff --git a/block/file-posix.c b/block/file-posix.c
index 6c64061a47..d90a0bd723 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2971,7 +2971,7 @@ raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
 }
 
 static int coroutine_fn
-raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
+raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
                      BdrvRequestFlags flags, bool blkdev)
 {
     BDRVRawState *s = bs->opaque;
@@ -3039,7 +3039,7 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
 
 static int coroutine_fn raw_co_pwrite_zeroes(
     BlockDriverState *bs, int64_t offset,
-    int bytes, BdrvRequestFlags flags)
+    int64_t bytes, BdrvRequestFlags flags)
 {
     return raw_do_pwrite_zeroes(bs, offset, bytes, flags, false);
 }
@@ -3604,7 +3604,7 @@ hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
 }
 
 static coroutine_fn int hdev_co_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     int rc;
 
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 505822a44f..fb85686b69 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -86,7 +86,7 @@ static int coroutine_fn compress_co_pwritev_part(BlockDriverState *bs,
 
 
 static int coroutine_fn compress_co_pwrite_zeroes(BlockDriverState *bs,
-                                                  int64_t offset, int bytes,
+                                                  int64_t offset, int64_t bytes,
                                                   BdrvRequestFlags flags)
 {
     return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
diff --git a/block/gluster.c b/block/gluster.c
index e8ee14c8e9..6a17b37c0c 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -1003,19 +1003,19 @@ static void qemu_gluster_reopen_abort(BDRVReopenState *state)
 #ifdef CONFIG_GLUSTERFS_ZEROFILL
 static coroutine_fn int qemu_gluster_co_pwrite_zeroes(BlockDriverState *bs,
                                                       int64_t offset,
-                                                      int size,
+                                                      int64_t bytes,
                                                       BdrvRequestFlags flags)
 {
     int ret;
     GlusterAIOCB acb;
     BDRVGlusterState *s = bs->opaque;
 
-    acb.size = size;
+    acb.size = bytes;
     acb.ret = 0;
     acb.coroutine = qemu_coroutine_self();
     acb.aio_context = bdrv_get_aio_context(bs);
 
-    ret = glfs_zerofill_async(s->fd, offset, size, gluster_finish_aiocb, &acb);
+    ret = glfs_zerofill_async(s->fd, offset, bytes, gluster_finish_aiocb, &acb);
     if (ret < 0) {
         return -errno;
     }
diff --git a/block/iscsi.c b/block/iscsi.c
index 6bcde6ec6b..eaeb93ebc7 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -427,14 +427,14 @@ static int64_t sector_qemu2lun(int64_t sector, IscsiLun *iscsilun)
     return sector * BDRV_SECTOR_SIZE / iscsilun->block_size;
 }
 
-static bool is_byte_request_lun_aligned(int64_t offset, int count,
+static bool is_byte_request_lun_aligned(int64_t offset, int64_t bytes,
                                         IscsiLun *iscsilun)
 {
-    if (offset % iscsilun->block_size || count % iscsilun->block_size) {
+    if (offset % iscsilun->block_size || bytes % iscsilun->block_size) {
         error_report("iSCSI misaligned request: "
                      "iscsilun->block_size %u, offset %" PRIi64
-                     ", count %d",
-                     iscsilun->block_size, offset, count);
+                     ", bytes %" PRIi64,
+                     iscsilun->block_size, offset, bytes);
         return false;
     }
     return true;
@@ -1205,12 +1205,12 @@ out_unlock:
 
 static int
 coroutine_fn iscsi_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                    int bytes, BdrvRequestFlags flags)
+                                    int64_t bytes, BdrvRequestFlags flags)
 {
     IscsiLun *iscsilun = bs->opaque;
     struct IscsiTask iTask;
     uint64_t lba;
-    uint32_t nb_blocks;
+    uint64_t nb_blocks;
     bool use_16_for_ws = iscsilun->use_16_for_rw;
     int r = 0;
 
@@ -1250,11 +1250,21 @@ coroutine_fn iscsi_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
     iscsi_co_init_iscsitask(iscsilun, &iTask);
 retry:
     if (use_16_for_ws) {
+        /*
+         * iscsi_writesame16_task num_blocks argument is uint32_t. We rely here
+         * on our max_pwrite_zeroes limit.
+         */
+        assert(nb_blocks < UINT32_MAX);
         iTask.task = iscsi_writesame16_task(iscsilun->iscsi, iscsilun->lun, lba,
                                             iscsilun->zeroblock, iscsilun->block_size,
                                             nb_blocks, 0, !!(flags & BDRV_REQ_MAY_UNMAP),
                                             0, 0, iscsi_co_generic_cb, &iTask);
     } else {
+        /*
+         * iscsi_writesame10_task num_blocks argument is uint16_t. We rely here
+         * on our max_pwrite_zeroes limit.
+         */
+        assert(nb_blocks < UINT16_MAX);
         iTask.task = iscsi_writesame10_task(iscsilun->iscsi, iscsilun->lun, lba,
                                             iscsilun->zeroblock, iscsilun->block_size,
                                             nb_blocks, 0, !!(flags & BDRV_REQ_MAY_UNMAP),
@@ -2074,10 +2084,10 @@ static void iscsi_refresh_limits(BlockDriverState *bs, Error **errp)
         bs->bl.pdiscard_alignment = iscsilun->block_size;
     }
 
-    if (iscsilun->bl.max_ws_len < 0xffffffff / block_size) {
-        bs->bl.max_pwrite_zeroes =
-            iscsilun->bl.max_ws_len * iscsilun->block_size;
-    }
+    bs->bl.max_pwrite_zeroes =
+        MIN_NON_ZERO(iscsilun->bl.max_ws_len * iscsilun->block_size,
+                     max_xfer_len * iscsilun->block_size);
+
     if (iscsilun->lbp.lbpws) {
         bs->bl.pwrite_zeroes_alignment =
             iscsilun->bl.opt_unmap_gran * iscsilun->block_size;
diff --git a/block/mirror.c b/block/mirror.c
index ed3bc5b1c3..64ef53cdd4 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1494,7 +1494,7 @@ static int coroutine_fn bdrv_mirror_top_flush(BlockDriverState *bs)
 }
 
 static int coroutine_fn bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     return bdrv_mirror_top_do_write(bs, MIRROR_METHOD_ZERO, offset, bytes, NULL,
                                     flags);
diff --git a/block/nbd.c b/block/nbd.c
index caee396525..5e1c4f30b1 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1407,15 +1407,17 @@ static int nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
 }
 
 static int nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                       int bytes, BdrvRequestFlags flags)
+                                       int64_t bytes, BdrvRequestFlags flags)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
         .type = NBD_CMD_WRITE_ZEROES,
         .from = offset,
-        .len = bytes,
+        .len = bytes,  /* .len is uint32_t actually */
     };
 
+    assert(bytes < UINT32_MAX); /* relay on max_pwrite_zeroes */
+
     assert(!(s->info.flags & NBD_FLAG_READ_ONLY));
     if (!(s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES)) {
         return -ENOTSUP;
diff --git a/block/nvme.c b/block/nvme.c
index 63a638e52d..760d7bea73 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1288,19 +1288,29 @@ static coroutine_fn int nvme_co_flush(BlockDriverState *bs)
 
 static coroutine_fn int nvme_co_pwrite_zeroes(BlockDriverState *bs,
                                               int64_t offset,
-                                              int bytes,
+                                              int64_t bytes,
                                               BdrvRequestFlags flags)
 {
     BDRVNVMeState *s = bs->opaque;
     NVMeQueuePair *ioq = s->queues[INDEX_IO(0)];
     NVMeRequest *req;
-
-    uint32_t cdw12 = ((bytes >> s->blkshift) - 1) & 0xFFFF;
+    uint32_t cdw12;
 
     if (!s->supports_write_zeroes) {
         return -ENOTSUP;
     }
 
+    if (bytes == 0) {
+        return 0;
+    }
+
+    cdw12 = ((bytes >> s->blkshift) - 1) & 0xFFFF;
+    /*
+     * We should not lose information. pwrite_zeroes_alignment and
+     * max_pwrite_zeroes guarantees it.
+     */
+    assert(((cdw12 + 1) << s->blkshift) == bytes);
+
     NvmeCmd cmd = {
         .opcode = NVME_CMD_WRITE_ZEROES,
         .nsid = cpu_to_le32(s->nsid),
@@ -1464,6 +1474,14 @@ static void nvme_refresh_limits(BlockDriverState *bs, Error **errp)
     bs->bl.opt_mem_alignment = s->page_size;
     bs->bl.request_alignment = s->page_size;
     bs->bl.max_transfer = s->max_transfer;
+
+    /*
+     * Look at nvme_co_pwrite_zeroes: after shift and decrement we should get
+     * at most 0xFFFF
+     */
+    bs->bl.max_pwrite_zeroes = 1ULL << (s->blkshift + 16);
+    bs->bl.pwrite_zeroes_alignment = MAX(bs->bl.request_alignment,
+                                         1UL << s->blkshift);
 }
 
 static void nvme_detach_aio_context(BlockDriverState *bs)
diff --git a/block/preallocate.c b/block/preallocate.c
index c19885af17..99e28d9f08 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -337,7 +337,7 @@ static bool coroutine_fn handle_write(BlockDriverState *bs, int64_t offset,
 }
 
 static int coroutine_fn preallocate_co_pwrite_zeroes(BlockDriverState *bs,
-        int64_t offset, int bytes, BdrvRequestFlags flags)
+        int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     bool want_merge_zero =
         !(flags & ~(BDRV_REQ_ZERO_WRITE | BDRV_REQ_NO_FALLBACK));
diff --git a/block/qcow2.c b/block/qcow2.c
index 100eda03cb..b881cba0d5 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3941,7 +3941,7 @@ static bool is_zero(BlockDriverState *bs, int64_t offset, int64_t bytes)
 }
 
 static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/qed.c b/block/qed.c
index f45c640513..558d3646c4 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -582,6 +582,7 @@ static void bdrv_qed_refresh_limits(BlockDriverState *bs, Error **errp)
     BDRVQEDState *s = bs->opaque;
 
     bs->bl.pwrite_zeroes_alignment = s->header.cluster_size;
+    bs->bl.max_pwrite_zeroes = QEMU_ALIGN_DOWN(INT_MAX, s->header.cluster_size);
 }
 
 /* We have nothing to do for QED reopen, stubs just return
@@ -1397,7 +1398,7 @@ static int coroutine_fn bdrv_qed_co_writev(BlockDriverState *bs,
 
 static int coroutine_fn bdrv_qed_co_pwrite_zeroes(BlockDriverState *bs,
                                                   int64_t offset,
-                                                  int bytes,
+                                                  int64_t bytes,
                                                   BdrvRequestFlags flags)
 {
     BDRVQEDState *s = bs->opaque;
@@ -1408,6 +1409,12 @@ static int coroutine_fn bdrv_qed_co_pwrite_zeroes(BlockDriverState *bs,
      */
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, NULL, bytes);
 
+    /*
+     * QED is not prepared for 63bit write-zero requests, so rely on
+     * max_pwrite_zeroes.
+     */
+    assert(bytes <= INT_MAX);
+
     /* Fall back if the request is not aligned */
     if (qed_offset_into_cluster(s, offset) ||
         qed_offset_into_cluster(s, bytes)) {
diff --git a/block/quorum.c b/block/quorum.c
index f4b76ea010..c28dda7baa 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -746,7 +746,7 @@ static int quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
 }
 
 static int quorum_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                   int bytes, BdrvRequestFlags flags)
+                                   int64_t bytes, BdrvRequestFlags flags)
 
 {
     return quorum_co_pwritev(bs, offset, bytes, NULL,
diff --git a/block/raw-format.c b/block/raw-format.c
index 345137813e..a2485926b8 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -289,7 +289,7 @@ static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
 }
 
 static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
-                                             int64_t offset, int bytes,
+                                             int64_t offset, int64_t bytes,
                                              BdrvRequestFlags flags)
 {
     int ret;
diff --git a/block/rbd.c b/block/rbd.c
index efc0835ee7..053eb8e48f 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1205,9 +1205,9 @@ static int coroutine_fn qemu_rbd_co_pdiscard(BlockDriverState *bs,
 #ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
 static int
 coroutine_fn qemu_rbd_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                      int count, BdrvRequestFlags flags)
+                                       int64_t bytes, BdrvRequestFlags flags)
 {
-    return qemu_rbd_start_co(bs, offset, count, NULL, flags,
+    return qemu_rbd_start_co(bs, offset, bytes, NULL, flags,
                              RBD_AIO_WRITE_ZEROES);
 }
 #endif
diff --git a/block/throttle.c b/block/throttle.c
index 1330e844c3..c13fe9067f 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -135,7 +135,7 @@ static int coroutine_fn throttle_co_pwritev(BlockDriverState *bs,
 }
 
 static int coroutine_fn throttle_co_pwrite_zeroes(BlockDriverState *bs,
-                                                  int64_t offset, int bytes,
+                                                  int64_t offset, int64_t bytes,
                                                   BdrvRequestFlags flags)
 {
     ThrottleGroupMember *tgm = bs->opaque;
diff --git a/block/vmdk.c b/block/vmdk.c
index 8d49e54bdd..fb4cc9da90 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2109,7 +2109,7 @@ vmdk_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
 
 static int coroutine_fn vmdk_co_pwrite_zeroes(BlockDriverState *bs,
                                               int64_t offset,
-                                              int bytes,
+                                              int64_t bytes,
                                               BdrvRequestFlags flags)
 {
     int ret;
diff --git a/block/trace-events b/block/trace-events
index 2f5c9c1d71..573acd67d5 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -80,8 +80,8 @@ qcow2_writev_done_req(void *co, int ret) "co %p ret %d"
 qcow2_writev_start_part(void *co) "co %p"
 qcow2_writev_done_part(void *co, int cur_bytes) "co %p cur_bytes %d"
 qcow2_writev_data(void *co, uint64_t offset) "co %p offset 0x%" PRIx64
-qcow2_pwrite_zeroes_start_req(void *co, int64_t offset, int count) "co %p offset 0x%" PRIx64 " count %d"
-qcow2_pwrite_zeroes(void *co, int64_t offset, int count) "co %p offset 0x%" PRIx64 " count %d"
+qcow2_pwrite_zeroes_start_req(void *co, int64_t offset, int64_t bytes) "co %p offset 0x%" PRIx64 " bytes %" PRId64
+qcow2_pwrite_zeroes(void *co, int64_t offset, int64_t bytes) "co %p offset 0x%" PRIx64 " bytes %" PRId64
 qcow2_skip_cow(void *co, uint64_t offset, int nb_clusters) "co %p offset 0x%" PRIx64 " nb_clusters %d"
 
 # qcow2-cluster.c
-- 
2.29.2


