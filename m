Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66843735FD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:04:12 +0200 (CEST)
Received: from localhost ([::1]:45998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCVu-0003uj-O3
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCJ2-0005w2-1z; Wed, 05 May 2021 03:50:52 -0400
Received: from mail-db8eur05on2090.outbound.protection.outlook.com
 ([40.107.20.90]:42592 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIv-0002eS-Pp; Wed, 05 May 2021 03:50:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYjyeX9qc6PM+2CDVY4rSqceQXmvVGM/q48fI3lYVanccEr616ZMt+/WywM0Fio3V4aM13OYCtLUlU88m3PWr9l4jataPGMqNsXXHY0l/QoiCUhJevNzF8t+HhY9KP1EqrNDaFCa+FKUpkn8XSlh28lir+wGNk2cjm0WBDMFOyu9veJV24YXAFsB+OdX26Sz6Z3ASthixtRmQqNASFjwG08v6ZdBlybn0TDs+2ru+L1gyd9DbmLOzq+1Be0PJay9gF0jL/rghAq2RvvtB1YgcXK8b0ScKrQ57p0z49sxmFYSYcj0IoVyLG1XFvMfGWppdi3aePx7/c0If7jgGmt/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRc3qnU31UcxuxG4xM+cGmaQL71Oxg1IGriu+Z9Bh+8=;
 b=lDjJWFfZ5PtCIjBx3jRQBcg8xm1uv3y0r6mfez/3u7RUc3K0zvs3MCJXdtZgUJH/6dR2dzXrts/V22DpG0cqgCk+IwxYFOSINRnxz7CezAepWp38YP8qA61P/lIOQSZ6lnzm9rR3PF1+QbGhZzVcIEE33mu7LrZe5E/9SIy6kUbLbO7CwToNuVgZMW2ajB1U0yUIKv2m3eWgsmRYNxo1uV6EDNKgZ7FeBzaBPj+JT63eQSSSByBMOr+Nog6KUZdLcxrDm1a9cDj4h20a3NDhIOtlfFm2/B6uqwvI3Ztoz02FsSkv+yUsxRleY3DOOukzk/pxKtEcrDfTiDu7vbXZ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRc3qnU31UcxuxG4xM+cGmaQL71Oxg1IGriu+Z9Bh+8=;
 b=P7bM73tgxNG/+TufS3T8xY8ODt8Xl5RB49N6yWa3AYnP9xy2oyEjMiitoVGj6b83TkoeQh2M5/YiQtplVk5GOWT5ruS566chWY8gYzneNqvOLrlgYuBuzpbc5XGGdq6XjJIUgN3XqDcsClojsqMq6BXf6RqtwgsV2bqZ5G1bAuI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.39; Wed, 5 May
 2021 07:50:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:50:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, vsementsov@virtuozzo.com,
 John Snow <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Fam Zheng <fam@euphon.net>, Alberto Garcia <berto@igalia.com>,
 integration@gluster.org (open list:GLUSTER)
Subject: [PATCH v5 07/11] block: use int64_t instead of int in driver
 write_zeroes handlers
Date: Wed,  5 May 2021 10:49:57 +0300
Message-Id: <20210505075001.45041-8-vsementsov@virtuozzo.com>
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
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:50:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 654d5f05-817a-4420-971e-08d90f9a7735
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB68397F39C035567825486B84C1599@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AwG29hwQKIOelajnt7xC7MJRQjvqyX0VCZTDpt9b/IA+uVtCGwUi40SgBh6QhSqBjYCTOKjqqARQcVJN62RPZOwz5gGsOiwV1UWiHVI1a3DTfzuvHZxOy8k4ITwYFpW1Vo6qJjB83ykhMwIiH51D1q9Hrok3XTjpN0P5qvdd5IMLCz3hurFaPQC17DORsID1aB/fDTVYLdz6q9bf2JACCCzLs/+RW//MnrB7nveTDK6KtSiJEozQ3cDSllj78fi1XpF1wXnHlsgb+PQ5d6U5d9Nh0Q2GUZjTLeqeUCa+hpL5FdJERRiKZI0bij6BU//LMwaAcy9k8i3ZZ6Pl5bYvnaHfiQXk960MaQe6od7qQYwyA2uQCfO1q00D+p1CFrkSNULPR9DlzL+37+V3nkFFcsSrgbHJLJS45ifviIeVQOvCo9NFpLnSeVzvzMFQUYArFMwsUQgkKPUATIFLhyBopZw+mt3YRIor9CbqbOWHq0Dr8KoTcTXSQJ9Gcey/ro4aarYOV3SkI3h1IZSgtSMbPUWbPkzVQWFK6kYcATEwOUut2DRseHtImb69k/e1U/Z+G1YX7CwUjm5Ulv4b7w6hqYC9oug1BVBaYtpq0ZnrrFeY5HSaySVZp2lWqLVjU9KzLnnoMmyvhKxE5jKu0rHYGM/csbjjU5mGm3HQGFzEim4wtnxI94YtnokW+D8nBiaL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(366004)(136003)(38350700002)(38100700002)(66946007)(26005)(66556008)(6506007)(66476007)(86362001)(16526019)(30864003)(83380400001)(6666004)(7416002)(54906003)(6916009)(4326008)(36756003)(478600001)(316002)(8676002)(6512007)(2616005)(2906002)(186003)(52116002)(956004)(6486002)(8936002)(5660300002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FDlzSs/u0mkBl/pgT0BKV5hNmJm/ucOfY6VmQyj5MOLLAxOpL3+oq+7AKIEf?=
 =?us-ascii?Q?Fl/RRy1V60Gh0hBpzFi8XXb10WA/LcBF2qiTwADs5U6PedccTzw1QohoTv6U?=
 =?us-ascii?Q?yropIllEKMk8FDy7TXtzMY9qd0eQm1iurRQnKJE8YEMl/93txkjR+Ib+4Z5l?=
 =?us-ascii?Q?LGy007E/bDIf37Kpkwd3wBN8ll+3cDUFKHOL1+u7EQMSf9o0sZ98Cj7KkKip?=
 =?us-ascii?Q?ZYNX+VqEF2QAm9ncO/2nROQU/En4r9iMZ0nfMB7Ofv/YVPs68eKMLTv2gprJ?=
 =?us-ascii?Q?6D30s4LmJdnLoZqAbOkN/ipaFa071l0vmT9SjfIxWbKM26OJrE5szugeb/p6?=
 =?us-ascii?Q?D3MgMnYzQxX9+65MzuZxZtXqOPiMfODg/VXtcXvh8mHwc6NEwCdEfdBpBM8A?=
 =?us-ascii?Q?L0A8hZGLRabCC4eXcEjqCQ4V3VgxRb0UkXTobrZh0El9g9bVYL+WXMQfzNZ7?=
 =?us-ascii?Q?7j+n9jrECOm1Eox9m5NruDAVid/Vx1sSMJxnXfWtBwwKjwnVzVV/SP1STTsT?=
 =?us-ascii?Q?gesDhXXz4zpsN8lNCX4VYyJG6LQVlAmYCNZBLB/zp97/phqx0c8KrmAtX5pC?=
 =?us-ascii?Q?t5D8dusStAGVvOqWVBvokxpAMKhQo50NWiwRq39UnCY3XPZdChacYpV8bNSH?=
 =?us-ascii?Q?sc5bP5mxL9h5rVQEiTzAZIHiP2pLk2hEDav+txTxJ3ZCm3vZqQnQIB1J78rn?=
 =?us-ascii?Q?3JtBRkaYoGjGnBOSN9aGUTkWz3jXJ3ArPWhxZrtS4BeHSab7n9B4YxTPbTGe?=
 =?us-ascii?Q?SPGYkzP/fEg4WqMy5lbHOiZzrcapY79oqNtVURVF3RkNVGE4I3/8j4tCWNOm?=
 =?us-ascii?Q?tI4ZR5X8NBQtqmGiysqkeyNHukpYgGrwkqdDgvG8lcbw/PK0IRQ4gmcRTCoO?=
 =?us-ascii?Q?vBIH/+N4U1zBqeQFpYwoDHvnr8/odlQloGX0YTKBzqbRCrVfyPoMvGbtH6A2?=
 =?us-ascii?Q?EV7feQsBUM0xIOVWah2mlg0vzlOpV+9BKac5jdjdJvOzJXWhD5IQ7XAdIo0q?=
 =?us-ascii?Q?/T1LR/WndbWUJ/UKvQ7bdJAn4k0Hd1RRz3z6LNnHB1G+1cGU5RXXfEp4BlE1?=
 =?us-ascii?Q?WiJWTqhu/HmHs7QOIdyB2Vkf1KmmdCoFJTlirchun9XhRcVTLcRQ7WZ1GIQ+?=
 =?us-ascii?Q?tpGqp57ck8178zgpE3nQmqTHOjOq77Cof9z8SAWQIq6Ow+oAljnDpFvDCOus?=
 =?us-ascii?Q?Axyo8+zhm9ULmAflyiddtEYzkLlhQr8WaaFx6bXntlEE5qrXVCR9vINKsCJ/?=
 =?us-ascii?Q?8Rwr85a+SE1Smf6VS4aW/bS6s3O3oHVYYBDzI0KBaLsS2ARu8P0oLLh+NQrc?=
 =?us-ascii?Q?Ph+VujwvvRCxF+suapDaRSSO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654d5f05-817a-4420-971e-08d90f9a7735
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:50:35.1595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5GqnnM5zunHitcVmIjWYl8g/FX5u6Vet8Y3PTgMjHDXyRaIQXUFYSgId4wm5KI0LFoSRxVYkASOKckH8nGbKk5Cczdsr0CGW2sOxpN8xgI=
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

So, convert driver write_zeroes handlers bytes parameter to int64_t.

The only caller of all updated function is bdrv_co_do_pwrite_zeroes().

bdrv_co_do_pwrite_zeroes() itself is of course OK with widening of
callee parameter type. Also, bdrv_co_do_pwrite_zeroes()'s
max_write_zeroes is limited to INT_MAX. So, updated functions all are
safe, the will not get "bytes" larger than before.

Still, let's look through all updated functions, and add assertions to
the ones which are actually unprepared to values larger than INT_MAX.
For these drivers also set explicit max_pwrite_zeroes limit.

Let's go:

backup-top: Calls backup_top_cbw() and bdrv_co_pwrite_zeroes, both
  have 64bit argument.

blkdebug: calculations can't overflow, thanks to
  bdrv_check_qiov_request() in generic layer. rule_check() and
  bdrv_co_pwrite_zeroes() both have 64bit argument.

blklogwrites: pass to blk_log_writes_co_log() with 64bit argument.

blkreply, copy-on-read, filter-compress: pass to bdrv_co_pwrite_zeroes() which is OK

file-posix: both handler calls raw_do_pwrite_zeroes, which is updated.
  In raw_do_pwrite_zeroes() calculations are OK due to
  bdrv_check_qiov_request(), bytes go to RawPosixAIOData::aio_nbytes
  which is uint64_t.

gluster: bytes go to GlusterAIOCB::size which is int64_t and to
  glfs_zerofill_async works with off_t.

iscsi: Aha, here we deal with iscsi_writesame16_task() that has
  uint32_t num_blocks argument and iscsi_writesame16_task() has
  uint16_t argument. Make comments, add assertions and clarify
  max_pwrite_zeroes calculation.
  iscsi_allocmap_() functions already has int64_t argument
  is_byte_request_lun_aligned is simple to update, do it.

mirror_top: pass to bdrv_mirror_top_do_write which has uint16_t
  argument

nbd: Aha, here we have protocol limitation, and NBDRequest::len is
  uint32_t. max_pwrite_zeroes is cleanly set to 32bit value, so we are
  OK for now.

nvme: Again, protocol limitation. And no inherent limit for
  write-zeroes at all. But from code that calculates cdw12 it's obvious
  that we do have limit and alignment. Let's clarify it. Also,
  obviously the code is not prepared to bytes=0. Let's handle this
  case too.
  trace events already 64bit

qcow2: offset + bytes and alignment still works good (thanks to
  bdrv_check_qiov_request()), so tail calculation is OK
  qcow2_subcluster_zeroize() has 64bit argument, should be OK
  trace events updated

qed: qed_co_request wants int nb_sectors. Also in code we have size_t
  used for request length which may be 32bit.. So, let's just keep
  INT_MAX as a limit (aligning it down to pwrite_zeroes_alignment) and
  don't care.

raw-format: Is OK. raw_adjust_offset and bdrv_co_pwrite_zeroes are both
  64bit.

throttle: Both throttle_group_co_io_limits_intercept() and
  bdrv_co_pwrite_zeroes() are 64bit.

vmdk: pass to vmdk_pwritev which is 64bit

quorum: pass to quorum_co_pwritev() which is 64bit

preallocated: pass to handle_write() and bdrv_co_pwrite_zeroes(), both
  64bit.

Hooray!

At this point all block drivers are prepared to 64bit write-zero
requests or has explicitly set max_pwrite_zeroes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  2 +-
 block/backup-top.c        |  2 +-
 block/blkdebug.c          |  2 +-
 block/blklogwrites.c      |  4 ++--
 block/blkreplay.c         |  2 +-
 block/copy-on-read.c      |  2 +-
 block/file-posix.c        |  6 +++---
 block/filter-compress.c   |  2 +-
 block/gluster.c           |  6 +++---
 block/iscsi.c             | 31 +++++++++++++++++++++----------
 block/mirror.c            |  2 +-
 block/nbd.c               |  6 ++++--
 block/nvme.c              | 24 +++++++++++++++++++++---
 block/preallocate.c       |  2 +-
 block/qcow2.c             |  2 +-
 block/qed.c               |  9 ++++++++-
 block/quorum.c            |  2 +-
 block/raw-format.c        |  2 +-
 block/throttle.c          |  2 +-
 block/vmdk.c              |  2 +-
 block/trace-events        |  4 ++--
 21 files changed, 77 insertions(+), 39 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 1f93a38a23..5734f44e59 100644
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
 
diff --git a/block/backup-top.c b/block/backup-top.c
index 6834921092..f193cc549c 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -75,7 +75,7 @@ static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
 }
 
 static int coroutine_fn backup_top_co_pwrite_zeroes(BlockDriverState *bs,
-        int64_t offset, int bytes, BdrvRequestFlags flags)
+        int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     int ret = backup_top_cbw(bs, offset, bytes, flags);
     if (ret < 0) {
diff --git a/block/blkdebug.c b/block/blkdebug.c
index a7fedd80fd..c81cb9cb1a 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -667,7 +667,7 @@ static int blkdebug_co_flush(BlockDriverState *bs)
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
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 7675565080..758a5d44d5 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -206,7 +206,7 @@ static int coroutine_fn cor_co_pwritev_part(BlockDriverState *bs,
 
 
 static int coroutine_fn cor_co_pwrite_zeroes(BlockDriverState *bs,
-                                             int64_t offset, int bytes,
+                                             int64_t offset, int64_t bytes,
                                              BdrvRequestFlags flags)
 {
     return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
diff --git a/block/file-posix.c b/block/file-posix.c
index df1b3c98c8..6114bdd308 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2905,7 +2905,7 @@ raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
 }
 
 static int coroutine_fn
-raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
+raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
                      BdrvRequestFlags flags, bool blkdev)
 {
     BDRVRawState *s = bs->opaque;
@@ -2973,7 +2973,7 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
 
 static int coroutine_fn raw_co_pwrite_zeroes(
     BlockDriverState *bs, int64_t offset,
-    int bytes, BdrvRequestFlags flags)
+    int64_t bytes, BdrvRequestFlags flags)
 {
     return raw_do_pwrite_zeroes(bs, offset, bytes, flags, false);
 }
@@ -3544,7 +3544,7 @@ hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
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
index 6bcde6ec6b..b90ed67377 100644
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
@@ -1205,15 +1205,16 @@ out_unlock:
 
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
 
+
     if (!is_byte_request_lun_aligned(offset, bytes, iscsilun)) {
         return -ENOTSUP;
     }
@@ -1250,11 +1251,21 @@ coroutine_fn iscsi_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
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
@@ -2074,10 +2085,10 @@ static void iscsi_refresh_limits(BlockDriverState *bs, Error **errp)
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
index fdf477a0fd..f0a3eac216 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1479,7 +1479,7 @@ static int coroutine_fn bdrv_mirror_top_flush(BlockDriverState *bs)
 }
 
 static int coroutine_fn bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     return bdrv_mirror_top_do_write(bs, MIRROR_METHOD_ZERO, offset, bytes, NULL,
                                     flags);
diff --git a/block/nbd.c b/block/nbd.c
index d3de441c2b..bf56735e4a 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1630,15 +1630,17 @@ static int nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
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
index 349c152ab5..51fc65fc91 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1266,19 +1266,29 @@ static coroutine_fn int nvme_co_flush(BlockDriverState *bs)
 
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
+     * We should not loose information. pwrite_zeroes_alignment and
+     * max_pwrite_zeroes guarantees it.
+     */
+    assert(((cdw12 + 1) << s->blkshift) == bytes);
+
     NvmeCmd cmd = {
         .opcode = NVME_CMD_WRITE_ZEROES,
         .nsid = cpu_to_le32(s->nsid),
@@ -1442,6 +1452,14 @@ static void nvme_refresh_limits(BlockDriverState *bs, Error **errp)
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
index acf29277c9..59c5137410 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3913,7 +3913,7 @@ static bool is_zero(BlockDriverState *bs, int64_t offset, int64_t bytes)
 }
 
 static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/qed.c b/block/qed.c
index f45c640513..09773c584b 100644
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
+     * QED is not prepared for 62bit write-zero requests, so rely on
+     * max_pwrite_zeroes.
+     */
+    assert(bytes <= INT_MAX);
+
     /* Fall back if the request is not aligned */
     if (qed_offset_into_cluster(s, offset) ||
         qed_offset_into_cluster(s, bytes)) {
diff --git a/block/quorum.c b/block/quorum.c
index 353401ac08..772de80a77 100644
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
index 051b00a4d4..4e9304c63b 100644
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
index 3cbea9e2e2..3edd2899c2 100644
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


