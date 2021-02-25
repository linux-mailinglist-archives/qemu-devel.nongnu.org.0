Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CF7324F82
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:53:50 +0100 (CET)
Received: from localhost ([::1]:59742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFFDJ-00014G-R7
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFFC4-0008AE-Pl; Thu, 25 Feb 2021 06:52:33 -0500
Received: from mail-eopbgr30137.outbound.protection.outlook.com
 ([40.107.3.137]:1858 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFFC1-0006sd-QR; Thu, 25 Feb 2021 06:52:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIuo7oOI/zNpfrmyIWZqtUXcVUp2UUevzDcV6gClEyYob1VLJaXx3vhl1cpawzdEIJyXYVsQ1AdOg1HtouTC8s4XKRjtrZz6ntEEnw/8TIDeyr3QaNtTxFdVurVzMnMd9wbQ5xVT8kUHPa4PruLyTmxjb5v/0Fj7O80h1my+bFy2H+r5MAMtlgrpfE2l3FngVnTkrQMdkItkncKxxtN8nabZvn05kFCc9H4bis1zX7nBvBPSNRN6e4rmAKe2kWuGki/C2ux4KQhoGWX6cObtWyhbi3Nqqgm8k0BUkTHLFcIGFemSTZrcuWp2FXFwoMltlKOPGjBP5rGMWE81G746VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4hBxYfm7jB5Hr2fuQQ6mD/xkHas1Lb1dYkNasb2PXc=;
 b=g6i9c/5cysY7BgFOGyQ16zZRMzOwsnsPMBZp43/kMneBVtI0g9AOvXuwVSQXL/Qz4rSqBb9l/aVUa0WM6/SNg1cSGbZ7+OAtleIxeq0P0seXVFw1AFywcqd+ajcCj7AIuAYErrL0V8IceJHroX+qXLv60RMWB/AxWL/7tRAPXcTMtlSnec/Ai22APetbKd5FFxGzKjLtMWXGUewRdvytJvrLk73GnGv/VUExLSc+snFkXxotRHfbcPCUNBr2wvwxY5yJ9BpxiFo3N/XOdYJ8+8W7Wwgw9Fu5GQyMzoKLsAwTsNdUHkWmReQe4W7ZDSjqOzUBm5iUeGFL9sisGq4unQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4hBxYfm7jB5Hr2fuQQ6mD/xkHas1Lb1dYkNasb2PXc=;
 b=mLpLvzH7T2tMJWsPtAGCye151Dj8JRPMTPihUatrTru2Wr70wzRwuCzxWhO2kegUqoGZGnFRXl+OK/n1HVSFiSipsc3EDLy9KqLR9VYQG/c88PzLp5psu2Nfdhknac/nznnWA1t6RAFiHHPNBs1bF3xAypcYUGkBPLZto/i9fsQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6008.eurprd08.prod.outlook.com (2603:10a6:20b:29d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 25 Feb
 2021 11:52:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 11:52:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v2(RFC) 0/3] qcow2: fix parallel rewrite and discard
Date: Thu, 25 Feb 2021 14:52:02 +0300
Message-Id: <20210225115205.249923-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR09CA0074.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.253) by
 HE1PR09CA0074.eurprd09.prod.outlook.com (2603:10a6:7:3d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 11:52:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42ba37ed-8dfe-407d-85e2-08d8d983ce36
X-MS-TrafficTypeDiagnostic: AS8PR08MB6008:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60080AB52CAFC4A64F7C9FDFC19E9@AS8PR08MB6008.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MdY65Nm45J4xKt6z1PgJZ8LWHcYZ86Jnf/epUm3oWzLFFMoewv7D86viC8W/HDAXWFCHkgi3l/E3CeOYa37axmf3FXfn86U5pKlmsnUyRJ8AmUf1s7geiwoQZKpOiDwfyoVchLWqjCFBFrM4ZcteYXdcwGkjzSZkmsiRDDJjEnX2uBgcUVjRqaK4PxVh1SXisOi0SJxrxR8pBkjQ2OQnv8PYxVnIEfDX/rn8duYIb1SCnA70htlXbniKTtRYqIkj8nkx6N2ZnK6Im6t1gcEXe2Qd16CZ1DPZ8N2ZVx0gAMKCPeDnVpGhQ1HmRCfvI1yrdBTCj5LaK2Mg/SDcLyWuwxQOW/we8NFFcuO9FzSP9nFm0A5OhDXw3ULD7wr8HJTwJSiaa6Lfqpmf0Y+KufGCrEGcn58cmPpqL6/4Lfkb+wTFCWLoutnHk4qmUf1ULD6kmar96ZZHojcEoW6HRpGCptI+W34m38bb9teCB6e3ntgczPL6y7T/8XdFEhDnUiLX2pdvwmIEEvK/w2InnRvHReviVtGZFsOyojcW4kb41TM3Ews0Ul/P9U3rE5/aDNIcAn6gujxALfydNzvZDphhTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39840400004)(346002)(83380400001)(36756003)(186003)(8676002)(16526019)(6666004)(478600001)(1076003)(5660300002)(69590400012)(86362001)(4326008)(6486002)(52116002)(6506007)(66556008)(107886003)(26005)(6512007)(956004)(8936002)(316002)(2616005)(6916009)(2906002)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DaY6vAozpsKcMRS/NkIJhHwZ2bPq34ArZ9NoHqfPjbGMI8fBxHG4bJXXePtG?=
 =?us-ascii?Q?fRd3NUb6B9iKAFol0Vzr9iikgUMhZ0LYkOs2R14bkIt2LQhTd2bKY7n4IgQx?=
 =?us-ascii?Q?MxX+bpL2mycc73kKt0ZGy0CHAucr0pa9aORQA6c3tc5bhduniQ1tbPfsQfXg?=
 =?us-ascii?Q?ilQgawnjEgIxjfM9/zkIfdmk31U5aBBRKCW7Js4mMLDVnKrQJ0JnPRlKSeiN?=
 =?us-ascii?Q?5GTkM6AfGw+Al7vlULvWrdtGwDs3s/1KFO88zxXOmtJr3zXcZ9We8eYhPxWA?=
 =?us-ascii?Q?6LRjN9lBXJyoMvXKwpcTadpvLYxqFha8Rse4AFjA3GpamGIauNPWAE9fN0iA?=
 =?us-ascii?Q?WYWsg+vlh1SNALjuhdTTMJ9y/2t4U50KnUMZudx7MiTVrsgDB7Med5O4MwDT?=
 =?us-ascii?Q?ujwE8eDOgo3EArdW2pdTk8aZTy9/FXbAcqegIN46JZ82HxYX7CooHlY38lOb?=
 =?us-ascii?Q?RnFzBykreLSJDQfeAA64GW19raU52qdQ1xHJE6M5UD0XcVq0/25XGL8dv6cG?=
 =?us-ascii?Q?fJoQ6vQdNDPL8Xxs/jffK2OQVhNyhA6gldah1FpAetw11y5WMBaky4fviZXo?=
 =?us-ascii?Q?62VT5Mz/BejowuaMza6mmps4Yq07oigJMwUC8wzBibKECNND8eACiKuxaXQs?=
 =?us-ascii?Q?tye7I0FdN9qkYmFt48b2cykJ+mZVhflU4Rg5wXYtdOxX91MFhTaBkNTGvOn8?=
 =?us-ascii?Q?H0HIGs+5lmL9h+9pVerbylX4CrZ9zNuE/aCU5lpp5yrqOq5gs4hJ6u8TCV9U?=
 =?us-ascii?Q?evAZacTMUUFFklhDv+jJ5SSF7u/XuK/Zn6LqezRfmzT7v+u7vH1O79LeFVvk?=
 =?us-ascii?Q?zNfUiXghbRTT1fJJocXNtDHu7jbeyYJoe/vLIho4HXRlLQYYUE1cwA/14W/p?=
 =?us-ascii?Q?u6B9KsNcIYdu/172D4oQ+XU3Qy6MtXrXSwsZv253JrHnyQC30eAeL9sTWkmT?=
 =?us-ascii?Q?Ayx2myRZQNZGgL6i1E1gI9ESZSVfnYReaVrY47TcL7Ey/HqTto53lJROfVi8?=
 =?us-ascii?Q?OZfSN4Q0RARIqHB/OAyiiidYsu4nod5p7aGRgk9S4c5isBUmP8XlnguVZPrI?=
 =?us-ascii?Q?++VGV+6DDEghPdiJh0zNDstTE/iICguH6GUf3Uc2sjQncElslKs/TQqCepOT?=
 =?us-ascii?Q?rcj47D0gTDkPg+i+Z6A/zfzDCO4Q0xPfHNjzrBI54AwpAjKYB06l9eYnASh2?=
 =?us-ascii?Q?BQFqIvNmTlg1QnPVQFxqvlxvGi9rR/YvAacwPJzAoe2xcFQzilj3MI1S8jiQ?=
 =?us-ascii?Q?YW0EniRFhWIcszgO+fcnXRver0mmzVKOpRxwZM6ErMtEQ88IMaqyc3OGMEaV?=
 =?us-ascii?Q?s3OHd/5THSVCbmdPs5yHX13G?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ba37ed-8dfe-407d-85e2-08d8d983ce36
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 11:52:19.8718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AJJiEJG6GC9Xy+AlOBmC99kMhXZ5wU9V7APKlGQ4BR4PUBY2WVDsMhaarKuemufWf5YJmCa+Bn1rGPSuXiEruhYChKCugQrm+6JnEYl84s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6008
Received-SPF: pass client-ip=40.107.3.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

Hi all! It occurs that nothing prevents discarding and reallocating host
cluster during data writing. This way data writing will pollute another
newly allocated cluster of data or metadata.

OK, v2 is a try to solve the problem with CoRwlock.. And it is marked
RFC, because of a lot of iotest failures.. Some of problems with v2:

1. It's a more complicated to make a test, as everything is blocking
and I can't just break write and do discard.. I have to implement
aio_discard in qemu-io and rewrite test into several portions of io
commands splitted by "sleep 1".. OK, it's not a big problem, and I've
solved it.

2. iotest 7 fails with several leaked clusters. Seems, that it depend on
the fact that discard may be done in parallel with writes. Iotest 7 does
snapshots, so I think l1 table is updated to the moment when discard is
finally unlocked.. But I didn't dig into it, it's all my assumptions.

3. iotest 13 (and I think a lot more iotests) crashes on
assert(!to->locks_held); .. So with this assertion we can't keep rwlock
locked during data writing...

  #3  in __assert_fail () from /lib64/libc.so.6
  #4  in qemu_aio_coroutine_enter (ctx=0x55762120b700, co=0x55762121d700)
      at ../util/qemu-coroutine.c:158
  #5  in aio_co_enter (ctx=0x55762120b700, co=0x55762121d700) at ../util/async.c:628
  #6  in aio_co_wake (co=0x55762121d700) at ../util/async.c:612
  #7  in thread_pool_co_cb (opaque=0x7f17950daab0, ret=0) at ../util/thread-pool.c:279
  #8  in thread_pool_completion_bh (opaque=0x5576211e5070) at ../util/thread-pool.c:188
  #9  in aio_bh_call (bh=0x557621205df0) at ../util/async.c:136
  #10 in aio_bh_poll (ctx=0x55762120b700) at ../util/async.c:164
  #11 in aio_poll (ctx=0x55762120b700, blocking=true) at ../util/aio-posix.c:659
  #12 in blk_prw (blk=0x557621205790, offset=4303351808, 
      buf=0x55762123e000 '\364' <repeats 199 times>, <incomplete sequence \364>..., bytes=12288, 
      co_entry=0x557620d9dc97 <blk_write_entry>, flags=0) at ../block/block-backend.c:1335
  #13 in blk_pwrite (blk=0x557621205790, offset=4303351808, buf=0x55762123e000, 
      count=12288, flags=0) at ../block/block-backend.c:1501


So now I think that v1 is simpler.. It's more complicated (but not too
much) in code. But it keeps discards and data writes non-blocking each
other and avoids yields in critical sections.

Vladimir Sementsov-Ogievskiy (3):
  qemu-io: add aio_discard
  iotests: add qcow2-discard-during-rewrite
  block/qcow2: introduce inflight writes counters: fix discard

 block/qcow2.h                                 |   2 +
 block/qcow2-cluster.c                         |   4 +
 block/qcow2.c                                 |  18 ++-
 qemu-io-cmds.c                                | 117 ++++++++++++++++++
 .../tests/qcow2-discard-during-rewrite        |  99 +++++++++++++++
 .../tests/qcow2-discard-during-rewrite.out    |  17 +++
 6 files changed, 256 insertions(+), 1 deletion(-)
 create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
 create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out

-- 
2.29.2


