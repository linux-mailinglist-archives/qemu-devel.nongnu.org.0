Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98DF3A290E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:11:04 +0200 (CEST)
Received: from localhost ([::1]:38182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHeR-0007ob-Mn
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcL-0004so-1S; Thu, 10 Jun 2021 06:08:53 -0400
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:8008 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcH-0004uY-Q9; Thu, 10 Jun 2021 06:08:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mr/BqCWC5y0DqFxEY3FQfHtbtbRDe7LQVKIlyMuyDLLpu/4ju4X3KK4uRvojCWP+e3OVuSRshd5rBsrXPbgeWL8+8xLi+/ABXDaWIN8IPSk3CDZZqQHniEVZoeuJqUgOG7RJzrPJgMNN7AvrcVeAI8waDnxxbeC5EaTjNJle3SWt497wHifSuK9WT7kcL+u06SJUuE93C3o+zSNI+pVt5LEQ0JMI+PkeY5ERC6l2QB/3zgsI89tHtLFZjGySewpsyef3FSYLCbgcdjF+FGuaUw1B6RNpn6VnazytLHsQHwhzd6f/mMdmK63mBeyfY58GaB5zwiY1fz3/XNSS7D+D6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlBlA9OYTxonz8Jv6RcjR5hCkeBTm9PnYuPuzj9DeXU=;
 b=WZdicbI9paOwLXxLa+91OL1FdlM/Wxu6/weGqquyqOnrONGLozF3LF1Wer0MOwPL1sskjUAwO8FRlhKeew9kza+gFUYPtqZj0XcB8B//+6DiP4ODfvTrjxgg+0QAPqf+pZOAfp4tZ0rWOUT+L0wavXYZB8Z0YldCBetBGKv7E5MWLmZuLqf9gcuWE9hS0ghl3swG219F5ZWGuUMAUUTW1yQZFQBgVLy69lsr6vC4kWVOZZXVOBpwPKGjOFuFw3IRWiG+HpXRRL7BHOpeZcDq3Y5CfnTelvgYa9gpHPTKhLfU5mSaBwCy6GsITEG6GXICT2zX5m+YcAXUasY0puk8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlBlA9OYTxonz8Jv6RcjR5hCkeBTm9PnYuPuzj9DeXU=;
 b=cUTL5ceHV8pPjz3J7cGCArgNKbvlJTUGlUXNpt8+bz8TejFp5tdOOxcXNe+ZvNemFpb4ke++fK+Dzrd37hILJiKLNSeEO61M+MsfV8I8vUul5dx4/veVvDvYDgKL8e25Gao9yD6fMeUVa42pZea64iVKNUfoubfksr4I/uvewQ8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2035.eurprd08.prod.outlook.com (2603:10a6:203:4a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 10:08:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:08:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 00/32] block/nbd: rework client connection
Date: Thu, 10 Jun 2021 13:07:30 +0300
Message-Id: <20210610100802.5888-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1a0b588-0287-45ee-5e87-08d92bf7bb60
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2035:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2035E0ACFAA3C6AC05EFDD49C1359@AM5PR0801MB2035.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: byKEWTourZhPbdH7v9+fYp0UjoBOOuUBFcIU+ycDRJdeu7YTlIB1CzCanrLDUozBKHYgWPWmbSdd1id3DbV/S8qXuF9pgGUA1qUQAAjTNMSCmMYNqz7n0gb2SltpEq1FHwMrLRpwcO58ch5A9PFp6JUtnmZtIh0gK5WYpxRA1Zz11LtxD1JEyDd1sVGEG/KoaLyyXGul/a7izn39FS0tLfKYUdBBzJ89y/C8Mkzxmfgv4ZYdMmAGwdHydXvt59Ks1roTQmfMj2X5ARLKLf0ebu8yB6/nROaS3Qy10t+QeqtdCl+BccBfgvNaso30OlRYNvgBKIHsKQabEEcDkomnCrdU73Khd9njjCmWASOQA9CDtIbtDJIFOkN1eA9QRD9nH4Mk0zPaoXtub1M5ImvJ3wVHjzvVK6004XcjI/k9gS1eq8gWFilm1YZyZ8PsUFcYKWBRMFSuFlaZWAq3nnHeGBTrF9xTROoXG7nm9wYr1M0eIRkA4vL36M4IwbvLvnBzrvAjZOSqxhaM7veUniwr3twkvgsr7TkHt7p9t7yjD3WGavxByKFxzb+42n2qQIS/4AaqpmXg1Fz0Jmiys6d0//t13gDMq9MAYR3Q9zzTeRo40te2bBAR21qkJUgoW36NewhIczJOeDP8LyvNme60+nrbas3ybwyX156QiM01ycjSqACsQ5/lop4TilWOStnJ1jvpbVnH77SjrmuDauUabU6YT7ExAIMwGHQXAjioabXqSYx/Qlw2ZvJCii/X0mtvEWud3DSmYP+tKpXZgF8t5HKBr1wEK8NWOvHt4zUZv3OJBF8lwDNubGZ194rxtsPS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(39840400004)(136003)(26005)(5660300002)(86362001)(8936002)(6506007)(2616005)(38350700002)(1076003)(38100700002)(956004)(316002)(83380400001)(66476007)(8676002)(966005)(66556008)(36756003)(66946007)(4326008)(478600001)(6916009)(6666004)(2906002)(52116002)(16526019)(6512007)(6486002)(186003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ft4yQKZfwV9KpXKdRbs6XqkHm7brcun0V953jXW7nOXRnhf8dHmXdpeONLTI?=
 =?us-ascii?Q?ku/slCFWA7Z/j1f+r4Y4x4iB0bBmvK+Npjxmu/XSTPpTB15VDF7zjlF6ZAxc?=
 =?us-ascii?Q?8fdh+gq1LauIlNxdXzw7/Vph010N9sUTRaU9yiVm5RdfDZO+/wrQ/damDkCs?=
 =?us-ascii?Q?xc5JQ+G7+c+XCj4xo5X14CQftn9ULsnFNjLUFcuL3Q3kGYfbxdbEQRpvoytd?=
 =?us-ascii?Q?53t1RiupJec+uYJ8wzTFHf8F5R0llqC/dOYNgTKMKpxCBB1oG8x+g0DRae7u?=
 =?us-ascii?Q?CErZAjDOHKU6N6oew39cGcQX42RbYPrnBzeJFoaHvh7eMfUq5yA7dstYsnOV?=
 =?us-ascii?Q?5a6TDW6ZL5tU4PfvPZ2pVySqCl21kUMCCRaTHNFMyqLXrgu/MFPCAdXM2mTh?=
 =?us-ascii?Q?15cMI4vInr1Bdo/kfc/UHa762ZbrN38oJme4qMc6e5zwRwGuINYxW/XL36We?=
 =?us-ascii?Q?4bZRD09uVdEEnYOQ1ENgJIobPHDCS3DN3rOxF3hqvS68FfoQW0xhFeW8ybMY?=
 =?us-ascii?Q?bcwuHFLA7UkoR48XgzJHiPUg1HiAIcYP2C7Z9Ey48rfQ5bMAQYjb3A5n2SxL?=
 =?us-ascii?Q?fG0Yq265JTwZEJLdDBs7Vr72emNgYeWQonZzrjqbb5bpp61w5oc7aQqaQhnS?=
 =?us-ascii?Q?HN1WBLCR6RxpKcvWxuRxKY/K9OSLyrH14MlFh2xadaWylBMk5228g37P1Ygh?=
 =?us-ascii?Q?Xe6pCy42IaZfkdzp5KKjP7FtxdmNtvq8jKbZQpqcg3HUtlgv2PF7gp7jvO2X?=
 =?us-ascii?Q?Sw9lev5matKLsddIJd5JZsSnVjEN2GmcQcVjgPlTJzmq22d5QymIALKiesKQ?=
 =?us-ascii?Q?Zr6/cEELFo0WRdJfM0yEMrIABr0YNlE5n225A54jltisQMTSYiILdgvPOObQ?=
 =?us-ascii?Q?8R+dhiQZ15UuQletaJDEDHjrel6fry0h6MtUjdNY3AE58KBcxp7tiWnDIsY4?=
 =?us-ascii?Q?6Qdn09Mz71pijfNWHAvxS8LliOsVBTkz38sXsKOKaIcup5dWThuC8Ebo+gwP?=
 =?us-ascii?Q?6YEgm4SLrJxAKalmxYeXBdngj0Rdmb1MTauUNsLGqL9PZUmPcMo6fMMRpRNU?=
 =?us-ascii?Q?sRIvBbB5rkyF01wk2QJglGroGwxkZK/ANlVDtVTfusBEAqbDnCRFKS7BQS5m?=
 =?us-ascii?Q?Ua5mSdwnwxDHPIfFWR/kmbD9O9TQnzplT8HJv94+7VfNtrcAMYfktYFhhudw?=
 =?us-ascii?Q?JNOWtDbfwW6CdKGgnXTQtTVD39Wjz5xTKazaTqB1UyY7d7kT0rtcU5IgNI3E?=
 =?us-ascii?Q?lSbHQS9YiiBNmdgEanCXAwoJjPPb7Otmr9Ll9CiUOYNJvHUWEd2z6i42QdYP?=
 =?us-ascii?Q?7Pveip4hUd8K3dayqptqNHKF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a0b588-0287-45ee-5e87-08d92bf7bb60
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:08:45.2497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L36fwZh1PYNVdB/gAkXfuTTrubxcasoryvw85FeEQgGAltYtYAEbyXu3Z05JSCqCKtrvvp9OD7rgo2g8qrAOEHDGWohxy1DqYQ7g66V6RTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2035
Received-SPF: pass client-ip=40.107.21.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

v4:

Now based on new Paolo's patch:
Based-on: <20210609122234.544153-1-pbonzini@redhat.com>

Also, I've dropped patch 33 for now, it's too much for this series.
I'll resend it later on top of this.

The series is also available at tag up-nbd-client-connection-v4 in
git https://src.openvz.org/scm/~vsementsov/qemu.git 

01: new
02: add Eric's r-b
03: add Roman's and Eric's r-bs
04: rebased to start of the series
05-06: new
07: tweak comment, add Eric's r-b
08: add Roman's r-b
09: add Eric's r-b
10: tweak comment, use aio_co_wake (after Paolo's fix), keep calling aio_co_wake after mutex in nbd_co_establish_connection_cancel
11: improve comments, change logic a bit
12: add Eric's r-b, fix grammar
13: add Eric's r-b, improve wording
14: add Roman's and Eric's r-bs
15: add Eric's r-b, fix commit message
16: rebased
17: add Eric's r-b, rebased on some changes, but still a clear movement.
18: rebased, changed
19: rebased, tweak comment
20: tweak wording, add comment
21: rebased, tweak wording
22: add Roman's and Eric's r-bs, tweak comment
23: add Eric's r-b, tweak commit message
24: add Eric's r-b, tweak commit message and subject
25-26: add Eric's r-b
27: add Eric's r-b, tweak commit message
28: tweak commit message, keep coroutine_fn
29: add Eric's r-b, tweak commit message
30: add Eric's r-b, add whitespace in comment
31: add Eric's r-b, fix s/clinen?t/client/
32: add Eric's r-b, rebased

Roman Kagan (2):
  block/nbd: fix channel object leak
  block/nbd: ensure ->connection_thread is always valid

Vladimir Sementsov-Ogievskiy (30):
  co-queue: drop extra coroutine_fn marks
  block/nbd: fix how state is cleared on nbd_open() failure paths
  block/nbd: connect_thread_func(): do qio_channel_set_delay(false)
  qemu-sockets: introduce socket_address_parse_named_fd()
  block/nbd: call socket_address_parse_named_fd() in advance
  block/nbd: nbd_client_handshake(): fix leak of s->ioc
  block/nbd: BDRVNBDState: drop unused connect_err and connect_status
  block/nbd: simplify waking of nbd_co_establish_connection()
  block/nbd: drop thr->state
  block/nbd: bs-independent interface for nbd_co_establish_connection()
  block/nbd: make nbd_co_establish_connection_cancel() bs-independent
  block/nbd: rename NBDConnectThread to NBDClientConnection
  block/nbd: introduce nbd_client_connection_new()
  block/nbd: introduce nbd_client_connection_release()
  nbd: move connection code from block/nbd to nbd/client-connection
  nbd/client-connection: use QEMU_LOCK_GUARD
  nbd/client-connection: add possibility of negotiation
  nbd/client-connection: implement connection retry
  nbd/client-connection: shutdown connection on release
  block/nbd: split nbd_handle_updated_info out of nbd_client_handshake()
  block/nbd: use negotiation of NBDClientConnection
  block/nbd: don't touch s->sioc in nbd_teardown_connection()
  block/nbd: drop BDRVNBDState::sioc
  nbd/client-connection: return only one io channel
  block-coroutine-wrapper: allow non bdrv_ prefix
  block/nbd: split nbd_co_do_establish_connection out of
    nbd_reconnect_attempt
  nbd/client-connection: add option for non-blocking connection attempt
  block/nbd: reuse nbd_co_do_establish_connection() in nbd_open()
  block/nbd: add nbd_client_connected() helper
  block/nbd: safer transition to receiving request

 block/coroutines.h                 |   6 +
 include/block/nbd.h                |  18 +
 include/qemu/coroutine.h           |   6 +-
 include/qemu/sockets.h             |  14 +
 block/nbd.c                        | 553 ++++++-----------------------
 nbd/client-connection.c            | 384 ++++++++++++++++++++
 util/qemu-sockets.c                |  19 +
 nbd/meson.build                    |   1 +
 scripts/block-coroutine-wrapper.py |   7 +-
 9 files changed, 560 insertions(+), 448 deletions(-)
 create mode 100644 nbd/client-connection.c

-- 
2.29.2


