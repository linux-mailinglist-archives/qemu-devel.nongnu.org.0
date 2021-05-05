Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6763735DB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:53:06 +0200 (CEST)
Received: from localhost ([::1]:43622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCLB-0007b5-Vd
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIw-0005km-Mq; Wed, 05 May 2021 03:50:46 -0400
Received: from mail-eopbgr10116.outbound.protection.outlook.com
 ([40.107.1.116]:51367 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIt-0002fG-4d; Wed, 05 May 2021 03:50:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzW2qKhmB/uIgtRKntGRj1eYEkCc52Kkm3NJIaVV06eNwcM4gIa/+dMkbdWuZHDx30AuGIQNgIP67RGu8RnYw1RRwjpf41NQLh1isLrNaoeMLleuqAwXKexfe9Ml0tdDADSltOYuCHjHXlzf2V6pfUkako0A1pOdTDBuGN2uPr41oovsYylUEApBW5nBOsR9ohADNzhw3MsroRkHNVkVZE86V/WON3uciXRQBykmRY+vg6fgOXaqoa6JQ7gYLoZSLF8W/izuJJbHgDdXr2wMNeboZvoXNAFYSBtXPRM2p+TpWM4hR4kM8DQ0zHKjqBFrrclhvXW4cpz5UNfIBQtF/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkFYxOJGNrSMCABwC//GmN8DEC5NH7pMqwE/1SVAyhY=;
 b=kEYm39Ow7/isAk7yhzbKD5BvqgklVNVcK50GOElcVC1JjZDjMyD6D+/XsXWjCjpZxL43SknO0aY0dIgTSmD7IJjLjnN2XUPbppcmBiHXWuOE81TwnHl/1uHtbpTnGATU8mmsMeTlg8Q3SdBTx1+c6sucsChZlAYv0FYdRUkGTPFa+qcAXvelXyk1BE0a1nJpDX5nLp88e3vX6NNoQiRZhd3nEgtpbDkNjO8TFbUAlNpg+kqLz5jBQ13Y/i+0YB0xQlr3C3Yr6jnscd/K/C5OobAL/ofCmq54yveIcpaoxzGrPcm0twJFMyLHOxK2rWY6EY6TmjYmEotPmQ2+OENeGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkFYxOJGNrSMCABwC//GmN8DEC5NH7pMqwE/1SVAyhY=;
 b=LxjdYI1OjakLiN/eHPTRQJV/mKBHXFzV8bUQpvwnLMPi3VGyz1wna6siSkbeb481kG4Adr/3zaEMFOvNQmtaYxNOBXF1khixDWU3Yv2CmEOMaB1grVcBFSDdyEqLD/YrHp/+AxgKEV7w8fe/bu/JPvYa1v0+xBfx/lGxuN+Rrt4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:50:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:50:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, vsementsov@virtuozzo.com,
 John Snow <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Fam Zheng <fam@euphon.net>, Liu Yuan <namei.unix@gmail.com>,
 integration@gluster.org (open list:GLUSTER)
Subject: [PATCH v5 10/11] block: use int64_t instead of int in driver discard
 handlers
Date: Wed,  5 May 2021 10:50:00 +0300
Message-Id: <20210505075001.45041-11-vsementsov@virtuozzo.com>
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
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:50:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fae10d3-9655-4570-144d-08d90f9a79c9
X-MS-TrafficTypeDiagnostic: AS8PR08MB6551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB65514D8029A5B8E5EA2018DAC1599@AS8PR08MB6551.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2I7hAHA1P0l8Tg5AlelprL4m9qUqRCOU0K387ppTnBQuXwbAgHf/OxntEahtPmX9+GevEMfMXJmF1iZUCGqE1Fjdq9HTXnyfsn9W0O4AamRx0Hx42T1a8OxBp+SIeEogb9uYakrDQt0iQ2yaxkAdqOP9VJoGLVD3e22A92dwxWFodAw5vv0w854/q7juAeSSo5/CH76JkDdmlOaAcvwqfDs0MDgF7pxqDhTi4miUwN5TG/gO89Rg1MdmOQleXfTe0n7AsET+9DhhDVQey2hYZjLvsfuOPD8R5fIiwbXLdQQE76Rn47lGy3ZpmwUDJTA87zLAsPR7u0YEsBX+qufa7Ji/LeBu6cRe5UyS8FleQ9wvO7SyQA+AsFsNnR1UaBO/aDRUE0AwdYUcyHRkRkrr8quKYqZbSOY9pyoaxslNVrWs0KeMA2UtBq3loHVG1ZHs08t308JVdkyEJV5rg4ysFKFDc1rUpJ0ool3rE0zXlwHGz8DB3kofx9x5g17iigfrPJFL7eDeKqTmQTRLW9jM7P3Cv9RkTy7Eu9S5hSS0b03lN41QQML9xjZxcsbON8VSNe8tZA3zCNmz2s4YESy4oUig3suZxC5mtsxT+EczmkI9GvoqWocebsUl/JLYRvVFq0uZ+6wVjfdoF4b8NI4etDWoFEqVPisAXufhMMvyHNNX0s8uPePP+0J1P/QDrAN8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(346002)(376002)(2616005)(5660300002)(1076003)(26005)(38350700002)(86362001)(66946007)(52116002)(38100700002)(54906003)(6512007)(66556008)(956004)(36756003)(66476007)(2906002)(6916009)(83380400001)(6506007)(6486002)(4326008)(316002)(478600001)(16526019)(8936002)(186003)(8676002)(6666004)(30864003)(7416002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4pQQ21vmQPh2jHQdcRCyhXFd5KDUjUJPQRiRNqZ1w99MJomjfOmfFkRBzQvl?=
 =?us-ascii?Q?ccQtxRqTh2kU8KUVfDfpauoBsmQ5X8cUscliVvLMCo8muqmaK1GoomDoWY/n?=
 =?us-ascii?Q?JuC015S+cqd5eviCt2PXxBxLXg8jGX3JlTRFRyKJ8GoTSdygiABuZS0xtamg?=
 =?us-ascii?Q?flZLsXdrdj1ecoBefXhvILPuABQdKzYVOZTu43+/Njrq+5hS2K0Cfzx34UX8?=
 =?us-ascii?Q?XQ95hJMurwbhEdFfcN5tjuLRghAoidL6dQP91kZsJbBpcK3GpzIe7skQ1Gjh?=
 =?us-ascii?Q?E0xUTTzb+KuxgCSlcVVWAZ5NyI8rgakt19TcCmTO5uH0xbLmMZPWHW+uGmwX?=
 =?us-ascii?Q?W0aVO6H2aZ1I/gKGoDVBzl++LJS08ZXhVcel/SLZCLqnmalYW0b0b5UuH2E2?=
 =?us-ascii?Q?mN23w1MDCu1QTshpZ9HzQgJv9LJlF2YAY1tfuzwZDJqLcr8D3vszZNq9oLKc?=
 =?us-ascii?Q?s7tVZM8LAC7M0fJH1t0T3XdbStdjtEC7YXuOuJaLKgzBU9RFAdlzhE/Whqln?=
 =?us-ascii?Q?BsDmikWK4Qm8EMmVut+9qVafEMrbDBmrMJcoUZhCastSWvv/z9R9BvIRQ9Ym?=
 =?us-ascii?Q?fg4/zZGvlT4cUNhay6Y3kNiYTXYp2MKkU8W4jdSiSFQczIKhXTc6EAMjwVjk?=
 =?us-ascii?Q?ii/szEDEih9eTZiK/gt32JP17slGSBlBjivNP9n70HKQA/SIWHaIOutkMSP6?=
 =?us-ascii?Q?2E9IW3+kbo+QXjW/+QzKt2xzlNuL2nMPQYSM6ttr7gmpHEQrEh3ewBpu/G9p?=
 =?us-ascii?Q?Ue0YoMrG5rw8Rq69kRYVo+LLHFxqXQskR4LN2My7/jZvZcr8xw79S9tfk23a?=
 =?us-ascii?Q?HGzjU/X7CUmU7qXGpzu8DY/ndfi1kTUywBfQwzWnnUTU8f6TDtOPe1iRx919?=
 =?us-ascii?Q?X/b18CqBA30ccylEqcxBXfgxu+ZYXNoUgWL2bKXSPG7edQd9cZGK7hWD6Yab?=
 =?us-ascii?Q?YHqdXNgxgx313NQVONykSA75R4XC3fxfKd1x90nzS5j6eJESBfShORk+3I1D?=
 =?us-ascii?Q?RMD7exATNLzvOFpulSA64LXfmM3iSfMTkUEGYCvfjv3vCofjpjb66eVpGjwS?=
 =?us-ascii?Q?INEB/eJjLO9zbJ8sAfYS62UP2WWOzvQzbINmVfib4kN9h0/V7fNenFNgCVSs?=
 =?us-ascii?Q?A/PZED3pr3WBiElG6t4N8RdwwIEeD6i009IifJfcg8bamP6qSkTS0OS0zaRd?=
 =?us-ascii?Q?A8BJ4OXZckoVBTC89urNHRbu31lGumJ08AmOTgbusCgc1L2oSJWBBGopPtNa?=
 =?us-ascii?Q?AhIx8U48huPjQyu2GULQsbWo/LrVrJPfh7mEG0xLwfJPi2W5BhS2zbbMhTCw?=
 =?us-ascii?Q?ymC14A/2hjSf8ynK6j2IbMCx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fae10d3-9655-4570-144d-08d90f9a79c9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:50:39.3332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLB3V3huJIgbu34hGy5zTuaLmQe4N9TQ1HrNc3UHBc0UuulKQRNexPOk2I2JE2TTsiy2W0jd2txSXAVgpE+A07LgeUzcuysXBhlvR6/iMog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Received-SPF: pass client-ip=40.107.1.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

So, convert driver discard handlers bytes parameter to int64_t.

The only caller of all updated function is bdrv_co_pdiscard in
block/io.c. It is already prepared to work with 64bit requests, but
pass at most max(bs->bl.max_pdiscard, INT_MAX) to the driver.

Let's look at all updated functions:

backup-top: pass to bdrv_co_pdiscard which is 64bit

blkdebug: all calculations are still OK, thanks to
  bdrv_check_qiov_request().
  both rule_check and bdrv_co_pdiscard are 64bit

blklogwrites: pass to blk_loc_writes_co_log which is 64bit

blkreply, copy-on-read, filter-compress: pass to bdrv_co_pdiscard, OK

file-posix: one handler calls raw_account_discard() is 64bit and both
  handlers calls raw_do_pdiscard(). Update raw_do_pdiscard, which pass
  to RawPosixAIOData::aio_nbytes, which is 64bit (and calls
  raw_account_discard())

gluster: somehow, third argument of glfs_discard_async is size_t.
  Let's set max_pdiscard accordingly.

iscsi: iscsi_allocmap_set_invalid is 64bit,
  !is_byte_request_lun_aligned is 64bit.
  list.num is uint32_t. Let's clarify max_pdiscard and
  pdiscard_alignment.

mirror_top, preallocate: pass to bdrv_mirror_top_do_write() which is
  64bit

nbd: protocol limitation. max_pdiscard is alredy set strict enough,
  keep it as is for now.

nvmd: buf.nlb is uint32_t and we do shift. So, add corresponding limits
  to nvme_refresh_limits().

qcow2: calculations are still OK, thanks to bdrv_check_qiov_request(),
  qcow2_cluster_discard() is 64bit.

raw-format: raw_adjust_offset() is 64bit, bdrv_co_pdiscard too.

sheepdog: the format is deprecated. Don't care and just make old
  INT_MAX limit to be explicit

throttle: pass to bdrv_co_pdiscard() which is 64bit and to
  throttle_group_co_io_limits_intercept() which is 64bit as well.

test-block-iothread: bytes argument is unused

Great! Now all drivers are prepared to 64bit discard requests or has
explicit max_pdiscard limit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h        |  2 +-
 block/backup-top.c               |  2 +-
 block/blkdebug.c                 |  2 +-
 block/blklogwrites.c             |  4 ++--
 block/blkreplay.c                |  2 +-
 block/copy-on-read.c             |  2 +-
 block/file-posix.c               |  7 ++++---
 block/filter-compress.c          |  2 +-
 block/gluster.c                  |  7 +++++--
 block/iscsi.c                    | 10 +++++-----
 block/mirror.c                   |  2 +-
 block/nbd.c                      |  6 ++++--
 block/nvme.c                     | 14 +++++++++++++-
 block/preallocate.c              |  2 +-
 block/qcow2.c                    |  2 +-
 block/raw-format.c               |  2 +-
 block/sheepdog.c                 | 15 ++++++++++++++-
 block/throttle.c                 |  2 +-
 tests/unit/test-block-iothread.c |  2 +-
 block/trace-events               |  4 ++--
 20 files changed, 61 insertions(+), 30 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index cb36ba93a6..adc5ea12cc 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -302,7 +302,7 @@ struct BlockDriver {
     int coroutine_fn (*bdrv_co_pwrite_zeroes)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_pdiscard)(BlockDriverState *bs,
-        int64_t offset, int bytes);
+        int64_t offset, int64_t bytes);
 
     /* Map [offset, offset + nbytes) range onto a child of @bs to copy from,
      * and invoke bdrv_co_copy_range_from(child, ...), or invoke
diff --git a/block/backup-top.c b/block/backup-top.c
index f193cc549c..45240aef9e 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -64,7 +64,7 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
 }
 
 static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
-                                               int64_t offset, int bytes)
+                                               int64_t offset, int64_t bytes)
 {
     int ret = backup_top_cbw(bs, offset, bytes, 0);
     if (ret < 0) {
diff --git a/block/blkdebug.c b/block/blkdebug.c
index c81cb9cb1a..2d98a33982 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -700,7 +700,7 @@ static int coroutine_fn blkdebug_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn blkdebug_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int bytes)
+                                             int64_t offset, int64_t bytes)
 {
     uint32_t align = bs->bl.pdiscard_alignment;
     int err;
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index d7ae64c22d..f7a251e91f 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -484,9 +484,9 @@ static int coroutine_fn blk_log_writes_co_flush_to_disk(BlockDriverState *bs)
 }
 
 static int coroutine_fn
-blk_log_writes_co_pdiscard(BlockDriverState *bs, int64_t offset, int count)
+blk_log_writes_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
-    return blk_log_writes_co_log(bs, offset, count, NULL, 0,
+    return blk_log_writes_co_log(bs, offset, bytes, NULL, 0,
                                  blk_log_writes_co_do_file_pdiscard,
                                  LOG_DISCARD_FLAG, false);
 }
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 89d74a3cca..dcbe780ddb 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -105,7 +105,7 @@ static int coroutine_fn blkreplay_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn blkreplay_co_pdiscard(BlockDriverState *bs,
-                                              int64_t offset, int bytes)
+                                              int64_t offset, int64_t bytes)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_pdiscard(bs->file, offset, bytes);
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 758a5d44d5..c29cfdd10e 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -214,7 +214,7 @@ static int coroutine_fn cor_co_pwrite_zeroes(BlockDriverState *bs,
 
 
 static int coroutine_fn cor_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int bytes)
+                                        int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
diff --git a/block/file-posix.c b/block/file-posix.c
index 6114bdd308..6959e2feba 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2875,7 +2875,8 @@ static void raw_account_discard(BDRVRawState *s, uint64_t nbytes, int ret)
 }
 
 static coroutine_fn int
-raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int bytes, bool blkdev)
+raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                bool blkdev)
 {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
@@ -2899,7 +2900,7 @@ raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int bytes, bool blkdev)
 }
 
 static coroutine_fn int
-raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
+raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     return raw_do_pdiscard(bs, offset, bytes, false);
 }
@@ -3530,7 +3531,7 @@ static int fd_open(BlockDriverState *bs)
 }
 
 static coroutine_fn int
-hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
+hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     BDRVRawState *s = bs->opaque;
     int ret;
diff --git a/block/filter-compress.c b/block/filter-compress.c
index fb85686b69..d5be538619 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -94,7 +94,7 @@ static int coroutine_fn compress_co_pwrite_zeroes(BlockDriverState *bs,
 
 
 static int coroutine_fn compress_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int bytes)
+                                             int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
diff --git a/block/gluster.c b/block/gluster.c
index 6a17b37c0c..066fdf60fa 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -891,6 +891,7 @@ out:
 static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
+    bs->bl.max_pdiscard = SIZE_MAX;
 }
 
 static int qemu_gluster_reopen_prepare(BDRVReopenState *state,
@@ -1297,18 +1298,20 @@ error:
 
 #ifdef CONFIG_GLUSTERFS_DISCARD
 static coroutine_fn int qemu_gluster_co_pdiscard(BlockDriverState *bs,
-                                                 int64_t offset, int size)
+                                                 int64_t offset, int64_t bytes)
 {
     int ret;
     GlusterAIOCB acb;
     BDRVGlusterState *s = bs->opaque;
 
+    assert(bytes <= SIZE_MAX); /* rely on max_pdiscard */
+
     acb.size = 0;
     acb.ret = 0;
     acb.coroutine = qemu_coroutine_self();
     acb.aio_context = bdrv_get_aio_context(bs);
 
-    ret = glfs_discard_async(s->fd, offset, size, gluster_finish_aiocb, &acb);
+    ret = glfs_discard_async(s->fd, offset, bytes, gluster_finish_aiocb, &acb);
     if (ret < 0) {
         return -errno;
     }
diff --git a/block/iscsi.c b/block/iscsi.c
index b90ed67377..297919ebc2 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1141,7 +1141,8 @@ iscsi_getlength(BlockDriverState *bs)
 }
 
 static int
-coroutine_fn iscsi_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
+coroutine_fn iscsi_co_pdiscard(BlockDriverState *bs, int64_t offset,
+                               int64_t bytes)
 {
     IscsiLun *iscsilun = bs->opaque;
     struct IscsiTask iTask;
@@ -2075,10 +2076,9 @@ static void iscsi_refresh_limits(BlockDriverState *bs, Error **errp)
     }
 
     if (iscsilun->lbp.lbpu) {
-        if (iscsilun->bl.max_unmap < 0xffffffff / block_size) {
-            bs->bl.max_pdiscard =
-                iscsilun->bl.max_unmap * iscsilun->block_size;
-        }
+        bs->bl.max_pdiscard =
+            MIN_NON_ZERO(iscsilun->bl.max_unmap * iscsilun->block_size,
+                         (uint64_t)UINT32_MAX * iscsilun->block_size);
         bs->bl.pdiscard_alignment =
             iscsilun->bl.opt_unmap_gran * iscsilun->block_size;
     } else {
diff --git a/block/mirror.c b/block/mirror.c
index f0a3eac216..3dbe696873 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1486,7 +1486,7 @@ static int coroutine_fn bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn bdrv_mirror_top_pdiscard(BlockDriverState *bs,
-    int64_t offset, int bytes)
+    int64_t offset, int64_t bytes)
 {
     return bdrv_mirror_top_do_write(bs, MIRROR_METHOD_DISCARD, offset, bytes,
                                     NULL, 0);
diff --git a/block/nbd.c b/block/nbd.c
index bf56735e4a..03f74b6f60 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1680,15 +1680,17 @@ static int nbd_client_co_flush(BlockDriverState *bs)
 }
 
 static int nbd_client_co_pdiscard(BlockDriverState *bs, int64_t offset,
-                                  int bytes)
+                                  int64_t bytes)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
         .type = NBD_CMD_TRIM,
         .from = offset,
-        .len = bytes,
+        .len = bytes, /* len is uint32_t */
     };
 
+    assert(bytes <= UINT32_MAX); /* rely on max_pdiscard */
+
     assert(!(s->info.flags & NBD_FLAG_READ_ONLY));
     if (!(s->info.flags & NBD_FLAG_SEND_TRIM) || !bytes) {
         return 0;
diff --git a/block/nvme.c b/block/nvme.c
index 51fc65fc91..1d59514f63 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1330,7 +1330,7 @@ static coroutine_fn int nvme_co_pwrite_zeroes(BlockDriverState *bs,
 
 static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
                                          int64_t offset,
-                                         int bytes)
+                                         int64_t bytes)
 {
     BDRVNVMeState *s = bs->opaque;
     NVMeQueuePair *ioq = s->queues[INDEX_IO(0)];
@@ -1357,6 +1357,14 @@ static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
 
     assert(s->queue_count > 1);
 
+    /*
+     * Filling the @buf requires @offset and @bytes to satisfy restrictions
+     * defined in nvme_refresh_limits().
+     */
+    assert(QEMU_IS_ALIGNED(bytes, 1UL << s->blkshift));
+    assert(QEMU_IS_ALIGNED(offset, 1UL << s->blkshift));
+    assert((bytes >> s->blkshift) <= UINT32_MAX);
+
     buf = qemu_try_memalign(s->page_size, s->page_size);
     if (!buf) {
         return -ENOMEM;
@@ -1460,6 +1468,10 @@ static void nvme_refresh_limits(BlockDriverState *bs, Error **errp)
     bs->bl.max_pwrite_zeroes = 1ULL << (s->blkshift + 16);
     bs->bl.pwrite_zeroes_alignment = MAX(bs->bl.request_alignment,
                                          1UL << s->blkshift);
+
+    bs->bl.max_pdiscard = (uint64_t)UINT32_MAX << s->blkshift;
+    bs->bl.pdiscard_alignment = MAX(bs->bl.request_alignment,
+                                    1UL << s->blkshift);
 }
 
 static void nvme_detach_aio_context(BlockDriverState *bs)
diff --git a/block/preallocate.c b/block/preallocate.c
index 99e28d9f08..1d4233f730 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -235,7 +235,7 @@ static coroutine_fn int preallocate_co_preadv_part(
 }
 
 static int coroutine_fn preallocate_co_pdiscard(BlockDriverState *bs,
-                                               int64_t offset, int bytes)
+                                               int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
diff --git a/block/qcow2.c b/block/qcow2.c
index 59c5137410..442917b85d 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3968,7 +3968,7 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
-                                          int64_t offset, int bytes)
+                                          int64_t offset, int64_t bytes)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/raw-format.c b/block/raw-format.c
index 4e9304c63b..45846e42d5 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -302,7 +302,7 @@ static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int bytes)
+                                        int64_t offset, int64_t bytes)
 {
     int ret;
 
diff --git a/block/sheepdog.c b/block/sheepdog.c
index a45c73826d..80e04dccfd 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -3101,7 +3101,7 @@ static int sd_load_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
 
 
 static coroutine_fn int sd_co_pdiscard(BlockDriverState *bs, int64_t offset,
-                                      int bytes)
+                                       int64_t bytes)
 {
     SheepdogAIOCB acb;
     BDRVSheepdogState *s = bs->opaque;
@@ -3113,6 +3113,8 @@ static coroutine_fn int sd_co_pdiscard(BlockDriverState *bs, int64_t offset,
         return 0;
     }
 
+    assert(bytes <= INT_MAX); /* thanks to max_pdiscard */
+
     memset(&discard_iov, 0, sizeof(discard_iov));
     memset(&iov, 0, sizeof(iov));
     iov.iov_base = &zero;
@@ -3186,6 +3188,11 @@ static int64_t sd_get_allocated_file_size(BlockDriverState *bs)
     return size;
 }
 
+static void sd_refresh_limits(BlockDriverState *bs, Error **errp)
+{
+    bs->bl.max_pdiscard = INT_MAX;
+}
+
 static QemuOptsList sd_create_opts = {
     .name = "sheepdog-create-opts",
     .head = QTAILQ_HEAD_INITIALIZER(sd_create_opts.head),
@@ -3269,6 +3276,8 @@ static BlockDriver bdrv_sheepdog = {
 
     .create_opts                  = &sd_create_opts,
     .strong_runtime_opts          = sd_strong_runtime_opts,
+
+    .bdrv_refresh_limits          = sd_refresh_limits,
 };
 
 static BlockDriver bdrv_sheepdog_tcp = {
@@ -3307,6 +3316,8 @@ static BlockDriver bdrv_sheepdog_tcp = {
 
     .create_opts                  = &sd_create_opts,
     .strong_runtime_opts          = sd_strong_runtime_opts,
+
+    .bdrv_refresh_limits          = sd_refresh_limits,
 };
 
 static BlockDriver bdrv_sheepdog_unix = {
@@ -3345,6 +3356,8 @@ static BlockDriver bdrv_sheepdog_unix = {
 
     .create_opts                  = &sd_create_opts,
     .strong_runtime_opts          = sd_strong_runtime_opts,
+
+    .bdrv_refresh_limits          = sd_refresh_limits,
 };
 
 static void bdrv_sheepdog_init(void)
diff --git a/block/throttle.c b/block/throttle.c
index c13fe9067f..6e8d52fa24 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -145,7 +145,7 @@ static int coroutine_fn throttle_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn throttle_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int bytes)
+                                             int64_t offset, int64_t bytes)
 {
     ThrottleGroupMember *tgm = bs->opaque;
     throttle_group_co_io_limits_intercept(tgm, bytes, true);
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 50b8718b2a..9656814814 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -48,7 +48,7 @@ static int coroutine_fn bdrv_test_co_pwritev(BlockDriverState *bs,
 }
 
 static int coroutine_fn bdrv_test_co_pdiscard(BlockDriverState *bs,
-                                              int64_t offset, int bytes)
+                                              int64_t offset, int64_t bytes)
 {
     return 0;
 }
diff --git a/block/trace-events b/block/trace-events
index 3edd2899c2..3b86c03b2f 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -152,8 +152,8 @@ nvme_write_zeroes(void *s, uint64_t offset, uint64_t bytes, int flags) "s %p off
 nvme_qiov_unaligned(const void *qiov, int n, void *base, size_t size, int align) "qiov %p n %d base %p size 0x%zx align 0x%x"
 nvme_prw_buffered(void *s, uint64_t offset, uint64_t bytes, int niov, int is_write) "s %p offset 0x%"PRIx64" bytes %"PRId64" niov %d is_write %d"
 nvme_rw_done(void *s, int is_write, uint64_t offset, uint64_t bytes, int ret) "s %p is_write %d offset 0x%"PRIx64" bytes %"PRId64" ret %d"
-nvme_dsm(void *s, uint64_t offset, uint64_t bytes) "s %p offset 0x%"PRIx64" bytes %"PRId64""
-nvme_dsm_done(void *s, uint64_t offset, uint64_t bytes, int ret) "s %p offset 0x%"PRIx64" bytes %"PRId64" ret %d"
+nvme_dsm(void *s, int64_t offset, int64_t bytes) "s %p offset 0x%"PRIx64" bytes %"PRId64""
+nvme_dsm_done(void *s, int64_t offset, int64_t bytes, int ret) "s %p offset 0x%"PRIx64" bytes %"PRId64" ret %d"
 nvme_dma_map_flush(void *s) "s %p"
 nvme_free_req_queue_wait(void *s, unsigned q_index) "s %p q #%u"
 nvme_create_queue_pair(unsigned q_index, void *q, unsigned size, void *aio_context, int fd) "index %u q %p size %u aioctx %p fd %d"
-- 
2.29.2


