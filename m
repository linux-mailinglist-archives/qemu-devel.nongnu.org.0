Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EAF34833C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:56:17 +0100 (CET)
Received: from localhost ([::1]:44548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAY4-0001Vm-12
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAU1-0006RV-3V; Wed, 24 Mar 2021 16:52:05 -0400
Received: from mail-eopbgr140109.outbound.protection.outlook.com
 ([40.107.14.109]:48878 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPATx-0005Mt-H9; Wed, 24 Mar 2021 16:52:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKB9aIG7QSPtaCxydIkf4qgn4lsBBFZL2NfBhBV+zULFHeiL70xUpNdOytlVXXPjDt+6JVwb50E3mFZZGS4nlHzFpb7MEaep4aK46W65GOdint42bV3HNBTVeOoob6K+tH17Lr9JsXAIb+RWPOQI9sRj6LjnverLmcc0eertNGSQdmfdtdlZoQMnHKj9LibZDFjTLX6C/j08xbnOd8/ZN+G8K0ZTVvgL0/hIamgh3cVrRIp8B2yHYG7HsAxLpZM2T1qb6Uys4pERCQlaEcnxpVvlgEpwr7vTGIgbC26WmfvIocrGYdqN42bmmBdQqe9zVpNxNO1BMhbASlCry0as0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIGTFJeqdu2j+631u69SnZRDnts0JNmrwz53r3tF0aM=;
 b=U6Yshsv0cGdZFxJ0SYP8tcP8fkTJcpKWFxiNXq+SWlx0sGHs8h5NgcYD1T8tmg8YgnFAJwWHR8WaqKzxu3ZdAduwr2GmwohMGKSD02jxPE3+OWrxYjkj7dZUCtHkBWMLg6In8MROKbf2u7CnQM1i9RlfzgesEm9YCU8HQeKE9eNcS0GSByM0Mj7NVFGnIxzZKFD8rxjuGho0sm2hrGFbfBp6mXfFmgIyu6fmxoUbqUJrFK9VVMoIebC+TueDoWKurZXJpEcVLOj4z3XoM8cOhszDPVXgjSSZkAqJdPjM2GNYi90N/qnAa6lFGTgvW0PWwc7KvWZY/rXTLwdckIbU4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIGTFJeqdu2j+631u69SnZRDnts0JNmrwz53r3tF0aM=;
 b=TgPB6N3dEPjCeb3yPL9lzsYrI8omoRS/6ecC8xs04jOqlntGb67KyjENoDXIMWMEcTmQhkhhKBjrQf6H7X41ezS5H1wXGNR4dZNhdtSw74m3y3t7VDTmEcOhbljfcygnMUQEHMsBgG50VCYuGBvBlmjEARtQYL+8iv9RQ4M6u58=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 20:51:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:51:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 07/11] block: use int64_t instead of int in driver
 write_zeroes handlers
Date: Wed, 24 Mar 2021 23:51:28 +0300
Message-Id: <20210324205132.464899-8-vsementsov@virtuozzo.com>
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
 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 20:51:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4315ebb9-af66-4369-163a-08d8ef06a992
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB69044C81879E7CC756995796C1639@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7RtppqAvIJveVJDKNagB8pnsVkm1e2PaKAhlK+0qjh5wcaFgeWTngC5Fo4Iew9McyiPZ06qFlGhsNA4XhBCkeXqqWHicS3cRQ0ljDvfUVv36zgfkBhcCRYhjN5f1PM9CO5o8kdJ/RcO/DU0u1VOCjjTGY3a/oZDU9FvqYimF7G0Q/sDxExoSHILKNninP+96jO1mfpKpEOgxk9IgO1gQlv9RAUZ+4b30bJf7gWwraas8bTJeyGAJnMu23oimHLEFhs+fbJhAPbiFPVMPpdrQqMjf7tCJgoTPzmXf86F2eKuN41QZwyI1iLygI/GAdOqUhxT2XEs07FVSNldnCvF5jnTBZVzaSKcPyAeiKFrqYJ2tDG0NQsFQR3y78Hzv+bvb2nOGYOOk3+e/r2OBRZGiMAr1aC+mur02iKvEUXRZu2QlqXnyS8W8mOeDH/+V9OZZFqAwBVMBuHjPHBppwXfOg4kVs80rR3HgkjAIEDEYmiTVTlY6RwbIlhUK/bqQkBbnmDP5nR5SMOEbUgF7lV4MAg/HDsGNqdhRS1/8ScaNJ3rcKcs8vr1opIQs3ZFmXwIqS0NMk9wSzbtEa0lq+lPW7NVJ59SlyfA2WmwnT22eRPyrWeNoxwsgtPwN2eMKGgVTagOEWSSDnWYu+JDnUvc9oxZ4nEKFAiVNLD2afWIleV5m17Szt07QpjdbeA0uNXnL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39840400004)(38100700001)(16526019)(478600001)(6916009)(8936002)(8676002)(186003)(26005)(52116002)(316002)(36756003)(2616005)(6506007)(30864003)(4326008)(5660300002)(956004)(69590400012)(6486002)(1076003)(6666004)(2906002)(66946007)(6512007)(86362001)(83380400001)(7416002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MbEyh7B7xl/OAT9rFQ6vvdL4NS8p4GmgVnLEJ+czaiVC1P83k1Y1Zqb5fE/q?=
 =?us-ascii?Q?lL+SVlJu2U8zR8uMgXp/BvuFC4rDtFWLSmKAqDPD7ws/CAMlyHFM4nXWjmQJ?=
 =?us-ascii?Q?vxG7rg7mnWfnDODLZ8cXqoa/YAjKDUUJ0hWjYwMp0dleK7OH6jQmNu47a+AA?=
 =?us-ascii?Q?bNv5l16jL7fr28Jq3oin+QNvqwAmfq8vbns6TbDO03WVjnQnmwB9lIWahXi/?=
 =?us-ascii?Q?EBdDced6ezZsTz490X+f9dL6XzwVPWC/3YtXEIAMM/3CPoIEkJRZStG3OsoF?=
 =?us-ascii?Q?qClMLYz3BC/oPCNa8f62pvq71mKcdplFQtZ31gpv+qqpjMo5jf8vGtKWZAkL?=
 =?us-ascii?Q?Yoq7CwfbM5DhIHlJarc3xFPfo3RdavrGdtMRBIh/8rrFHJsvRWusekqqkiWs?=
 =?us-ascii?Q?i3FXfLP96z0d9FPrVqkmwonQS3hMYIS/lGfL2MBUYqGOwngdwPb/5CCMQg5k?=
 =?us-ascii?Q?9xASEQx/z+LddbJZ06QBObWBakon0Ib44zqaUcZPG1YxvNwexAMn2yhmtTBQ?=
 =?us-ascii?Q?n3VJPJf//tDQ6MbLPO5aNKzTUK/PR5NF8viwTe+T0wniqg8KY/E3E4W11Jkt?=
 =?us-ascii?Q?7nTL6Rp56f5pU5NiVp5/DMrCAsEJQ1ApwXL4DrornkrR/lA9fGDrYUWGQB+B?=
 =?us-ascii?Q?oH5doC75yMoDSDic94bdvNgoxYZnFcPlpkk2guNPglTF9VOw50H4KiMRhO2f?=
 =?us-ascii?Q?dhaP5oMPI0+rALjJJ7hQDRdP7zB4NmzSNYFOETohY4nho7sGq0eTWX5BJwNf?=
 =?us-ascii?Q?kE4d3RzRkcCSWuRfbkUA3i6IoLFGBOQhuYqLrr0i692umlXwU6O8Sdm+um1I?=
 =?us-ascii?Q?QDaf0Qi4YL5yHm2jqTebxrTG8tb8slY+39w10OjbwEF5Lw3mWbMZ58+0stvV?=
 =?us-ascii?Q?Lhm4tmW7im0aIpgM3CHdeOeDmRy+TcgGotF1Ht4CWhEldF5crs9yy51/tyeI?=
 =?us-ascii?Q?4ux8DG6aBiDOdQOsVBoa3auw5TSSrw/svu6qvb5KSko4xn2heTNwIuQVpX4L?=
 =?us-ascii?Q?p19kW+M7cSRPvZfCpXfWQVRXf2RRCszJyV5gX1BFcMCsPsEHN0ju/khHxbCp?=
 =?us-ascii?Q?+EH59NmVx76++CiYW3Of7vRi8NPlqfFyMMvz49spLYHNArwpCcG0hNtGhvA8?=
 =?us-ascii?Q?Kcnco84/PQuXJo6K5f18nUp1f/OoIfsMNlZkxZ3o8etCXlXs0XFwngy/t+VP?=
 =?us-ascii?Q?V6ydsFklCy8UulQDZ+FYJUYr73DYtfYhDWybNzsBKPuZGYf71hahhRVKTthM?=
 =?us-ascii?Q?CGkj80SMjl2MfysUlGnVgq80Q4lMtdxH1UsouOb1cg0mpkQX33Cb62jydxRW?=
 =?us-ascii?Q?TCQf2IE/YKZMMKw0SN/ANlTa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4315ebb9-af66-4369-163a-08d8ef06a992
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:51:56.8044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eR+A/BMlTqCL/VYaj5JG2PLirSG2MuP1Qc6lFirz9q4wq8jGqprC+jBze8aMfZ3w9QDtsbnHnsrsPA+GF96vACl+LjOiYAbBphX52Fsaouw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.14.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 71e5025534..d9e1f04b21 100644
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
index aa27afbb1b..838027981b 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -86,7 +86,7 @@ static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
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
index 6faf7eb96e..03618cc18b 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2929,7 +2929,7 @@ raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
 }
 
 static int coroutine_fn
-raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
+raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
                      BdrvRequestFlags flags, bool blkdev)
 {
     BDRVRawState *s = bs->opaque;
@@ -2997,7 +2997,7 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
 
 static int coroutine_fn raw_co_pwrite_zeroes(
     BlockDriverState *bs, int64_t offset,
-    int bytes, BdrvRequestFlags flags)
+    int64_t bytes, BdrvRequestFlags flags)
 {
     return raw_do_pwrite_zeroes(bs, offset, bytes, flags, false);
 }
@@ -3577,7 +3577,7 @@ hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
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
index f7b7f4d566..e40608b2d3 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1480,7 +1480,7 @@ static int coroutine_fn bdrv_mirror_top_flush(BlockDriverState *bs)
 }
 
 static int coroutine_fn bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     return bdrv_mirror_top_do_write(bs, MIRROR_METHOD_ZERO, offset, bytes, NULL,
                                     flags);
diff --git a/block/nbd.c b/block/nbd.c
index 34cb28927b..9ec822c083 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1619,15 +1619,17 @@ static int nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
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
index 1a128ef95e..1263022e1c 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1265,19 +1265,29 @@ static coroutine_fn int nvme_co_flush(BlockDriverState *bs)
 
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
@@ -1441,6 +1451,14 @@ static void nvme_refresh_limits(BlockDriverState *bs, Error **errp)
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
index c786601d52..c9bce9711d 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3890,7 +3890,7 @@ static bool is_zero(BlockDriverState *bs, int64_t offset, int64_t bytes)
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


