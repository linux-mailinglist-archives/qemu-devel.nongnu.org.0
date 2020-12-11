Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBB12D7E47
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:45:36 +0100 (CET)
Received: from localhost ([::1]:41488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnQ7-0000rK-K9
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKg-0006VR-6U; Fri, 11 Dec 2020 13:39:58 -0500
Received: from mail-eopbgr70090.outbound.protection.outlook.com
 ([40.107.7.90]:11267 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKb-00089o-7A; Fri, 11 Dec 2020 13:39:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRBUoGcfstd58ubwyNCdO/kNmRRVt/A+SLny//Dw5fuRSqFJnp0KaxQBYZtKftBVehzqRQMduTDx2KTermG0/y0JSOuH/8d03rEl+RAXeZwB7HuPmwLg7Zpz/ff1UGS1dRJr/QNAENcLlwYGP8E1uB/CSSwdR+QornYQOYmy4S/YY9ugL/W2O2yOUU1TwAokgq1eJrZmHOZD94PeykKXaSoyxoQfy1amZTM/Q0nYaTAl2fWDdyfYyd8Ji+WKQ7YoqGJ1HTHf4kdStRCFNDtu7sSG1dp6IXMnA90dcak8Q+RdBIGGlmrPLyX8nizjIM3KYN0LOKLi1M5zB5yM9isJgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQxnsTT3INe67YFBDEOyC9XtHilShDbRP2JSfk1hpZM=;
 b=ZEHmMxBAElaakbT8jOONR9ItU2PfX9MqmsLRsNCGBGk6FdE44fjGIS9N4XN3HUABDVBAXzLsOIs+VMBf+z2kkxYwUD0l+uWArpu49i0D2L8RbdyH7owM6fzjq/UDNTeImM3LfzT44k4q1vf9EqPhbS+8isxteo14u3wQdwHW2a2L/p4gWIxKBDQmOSjIb97BhSRNuVsQSsf7DxawkpSmcngDp3I6CCupkpE+MVB7922UDQgZWuuIVXTXUYKyYn0ykL5LjMMTSaVkxAozlmmxuPQLuCI0CwlkJwI8+nb7lzVmzVBi8DFsKVU4otOVGIW+fRc3U4H/PmmboM9WRQ28Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQxnsTT3INe67YFBDEOyC9XtHilShDbRP2JSfk1hpZM=;
 b=hfTbPH1tgNQkZ9lgow7QKAI0Wq/4LF9ladV62Zeyh8QxZBnFeZ3oWhQCoUAH4gq3dqy0xkMHTEPkML+ZQgPpflOLg9Qmupovq3VohpXRTD+44/Jg5MHMlUPy9pi9qM48EefwVUTXh/a6ifpTzu21lxAHc6vwseuclh8PfpPes/s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 00/16] 64bit block-layer: part I
Date: Fri, 11 Dec 2020 21:39:18 +0300
Message-Id: <20201211183934.169161-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:208:1::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:208:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9af9f9b-afe6-43ad-2130-08d89e0422ec
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4915A37689F4173AE29F78EFC1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pKL5trpkl9/lTj+h4ImW7EBS7am1c4QcCbdPN3R9NJKz1XFD8yuGRgMpZw0K4U4i089W7V9UaeMSNE6o4yCy8AVTgQGN7kfP78mqRkqRA257ZtjX9c2mZ9Xq9+/p27MuSHGRjDgXbI0htTznCPjAxAXxWYmMydVigxOymcr4tXIdjlUZGhcPr3hzXzxj5G3p8jJcFp8kUDRSvNxOC4NbELfJz4jhouRJ2fJU8gsEMdBYiS3mMoxvEYyZGnHJTA8Z1Q4uO5m90j4ToU0AE2JdalmCsRup6SUFCBAzv34waOwNJjwgBE4LBJG9mXRUVEff41YZLvX/V+xNQg/3dlJtmbQmNBtEA24Kgs5expinlB9LV9kn2s4JtoWcw8yQtJ9TIePXUO/9adbVIwS5dybd6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(966005)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7Dx6Po0HvjQQOKMIZyiwOYzWMni9A+GL5MnUrbBtgGq0iUy7ZKJXhXG99oc0?=
 =?us-ascii?Q?Tfg04kQxISRdKaYtm81n2C9ykSrX5lzR7OzxZvFvBHUK9yF5/1aZIoO6+gWM?=
 =?us-ascii?Q?WLfkwQtkXd0nR4vzqaKtTvfIgdnuWlQZRHy6yVoENFxDMy2CbWL1qqc4MIgH?=
 =?us-ascii?Q?9aDbMMmgjenVZDzmeq2QbDcyyRjUlGF8M26yxWVYN7wfahQMTTsStTSIqaRp?=
 =?us-ascii?Q?6Od/MGGV9FC7l291OnHEjdaTiwpirgz8UJMyJ+76G841UfM3mQNe4FnsDBZi?=
 =?us-ascii?Q?sJuXdgsSvkMdWo+7wbXnewLjDB10noY7OrRZ0qOncbLbfOdY7Q9res3Cs0LZ?=
 =?us-ascii?Q?mmxI9C/NoVTRypy4cccdmHyPJS9P6YL3QpP/uRVp6EBuKnyzyqBL4Mv4XudY?=
 =?us-ascii?Q?KoEP/rTTOzbBOPPnidqnr3vDrr3Z1Z4TW+eDydrqqiXUVXQ65M4ARBPbBwI4?=
 =?us-ascii?Q?aDgDxJd3mDlannimWwQoIFrSEQhzbcS0gWfCGHoTvnIn5HjK17+bCUKD9Q0C?=
 =?us-ascii?Q?tjsrOrDu49lpRle9DMnCRmo2eZigfOJ77G6oI9ocXyU/fk0ppf1TX31ijCaa?=
 =?us-ascii?Q?BQxVnYUkwJLvREpvPoz6+ab4jdGuYeL/WOB3MmrQ4TQ9YiYrWgLtPcxK8sJa?=
 =?us-ascii?Q?2zJ9L/hsbg500SNZuuEFoEMq3pRjkAiSgNxjhyO24Lsu5BL1FBZb+vYlWRZs?=
 =?us-ascii?Q?QfnDIIvv6u54YS1dtzCWGQyNg/e/1fxGG1HdY9CpoKv/7HjFIp+niMbEoOqD?=
 =?us-ascii?Q?0yOAvOkMxmwSB73JoXgIV/LIkzG1RqonScM18NZ842MxvIreS77RFwpU9XZp?=
 =?us-ascii?Q?vbtxsj9yU9f+6lXpl63HIr24R/HZMbnYxA2AZhImw80pU4sWXrnftZcy3QXy?=
 =?us-ascii?Q?yTpdh1Ed1wEduouiViiZEZIDgplxuJXLdkDxVVYpB7H1r/vkdHqMD9GXYP5z?=
 =?us-ascii?Q?P3KobpRdYHGPiVslRipmphQQ886lx+gz8qkze0OrC8nUPKzs9Y0bArLa+vQm?=
 =?us-ascii?Q?GrFO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:47.4608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: e9af9f9b-afe6-43ad-2130-08d89e0422ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x40TR5wCpVzU184Ti7VCDM9oXOwU2SwZYjdWVh9YwXWvlR/MnGD4YBsM9HCwf+vTK1HvbzKliVG/9XZHLeI3P82s4+lJngjH0VKuo8ZllSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.7.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 berto@igalia.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

We want 64bit write-zeroes, and for this, convert all io functions to
64bit.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

Please refer to initial cover-letter 
 https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg08723.html
for more info.

v4: I found, that some more work is needed for block/block-backend, so
decided to make partI, converting block/io

v4 is based on Kevin's block branch ([PULL 00/34] Block layer patches)
   for BDRV_MAX_LENGTH

changes:
01-05: new
06: add Alberto's r-b
07: new
08-16: rebase, add new-style request check, improve commit-msg, drop r-bs

Based-on: <20201211170812.228643-1-kwolf@redhat.com>

Vladimir Sementsov-Ogievskiy (16):
  block: refactor bdrv_check_request: add errp
  util/iov: make qemu_iovec_init_extended() honest
  block: fix theoretical overflow in bdrv_init_padding()
  block/io: refactor bdrv_pad_request(): move bdrv_pad_request() up
  block/io: bdrv_pad_request(): support qemu_iovec_init_extended failure
  block/throttle-groups: throttle_group_co_io_limits_intercept(): 64bit
    bytes
  block/io: improve bdrv_check_request: check qiov too
  block: use int64_t as bytes type in tracked requests
  block/io: use int64_t bytes in driver wrappers
  block/io: support int64_t bytes in bdrv_co_do_pwrite_zeroes()
  block/io: support int64_t bytes in bdrv_aligned_pwritev()
  block/io: support int64_t bytes in bdrv_co_do_copy_on_readv()
  block/io: support int64_t bytes in bdrv_aligned_preadv()
  block/io: support int64_t bytes in bdrv_co_p{read,write}v_part()
  block/io: support int64_t bytes in read/write wrappers
  block/io: use int64_t bytes in copy_range

 include/block/block.h           |  17 +-
 include/block/block_int.h       |  26 +--
 include/block/throttle-groups.h |   2 +-
 include/qemu/iov.h              |   2 +-
 block/blkverify.c               |   2 +-
 block/file-posix.c              |   2 +-
 block/io.c                      | 274 ++++++++++++++++++++++----------
 block/throttle-groups.c         |   5 +-
 tests/test-write-threshold.c    |   5 +-
 util/iov.c                      |  25 ++-
 block/trace-events              |  12 +-
 11 files changed, 252 insertions(+), 120 deletions(-)

-- 
2.25.4


