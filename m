Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5403E369C26
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:43:02 +0200 (CEST)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3Zl-0006jS-Co
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xk-0004xC-QU; Fri, 23 Apr 2021 17:40:56 -0400
Received: from mail-eopbgr10127.outbound.protection.outlook.com
 ([40.107.1.127]:4578 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xh-0002m3-Hv; Fri, 23 Apr 2021 17:40:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SG9ikcXPUMZ565+EE/HvsQ8sCOImP6dZjHhgyRvAArdoJGj+fUWIGLhU8es9ir97eOWhnt8l6ABxKmwQCSfeL3Y7SfkoXCMYCdZZx21X67PeRDka7yaWG2AbY66fnPMq67MHNCQlkHe8bxaOMtyhQmBrFjY2CGtuwJQ2c5s8MJ9bfYcjAbIh9Do233QnKc9biBbwLZz1/2WdMXEGfEkK5csxHrXX/ZiMfpyK9NJTR+AhOcSJe8XGP1Uq7u5QQiCQaNS9N/SWWRIs+F0Qf01c7pv7ZD9PUX4mMzS7GoGralOmDi24V2qFLojRei+3UGenoll208DpZxICS5K7AfhNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COzw02ukHlodocLODgdhDpzkWST46lIQIEj7D05iqtQ=;
 b=RTTmpZ/Yf7ENxZXVXKpUR4gXW8LzmIhgSSe1REO7YCrdA1PSi7I+6BOqMJPoytOYmVsXapVW8L/W1U6d3u+Nqd81yS9/D6yQh3NnyhaGaEAKvOKfKqxcAdBktUIcNbwq7IwuDtdGXmsaeuQ0abHE9T1DS0FpoCr5jpTa5eC/SVKn8EwBSfP7//0Af+u/743uqvtNxRBJNwWvpj/Du52YYReg+bQSPX90kOeJTFTUikWmAV7wIYIImRR1B60LJOYsdXPCr/i4pWoocsaEbJwBi58Yt7veNZoB1g5cz9a60wGZVd9d1hjQmqbZsPll2JcZmofQd77DYXZPFMKU08rBHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COzw02ukHlodocLODgdhDpzkWST46lIQIEj7D05iqtQ=;
 b=Mgi5NDildm80I+ocfwx0yzrayuVYAJY08mpFB57+yG6PlEowzB5mUSEL195brUUHScZjtD04Y4/7iOqyj73kcu2BGrx8IaHYAr7DLYuALEndB/A48JucX1MOuNW6jQNaRAq0GCzMFbTADDgQAiTUZbu8F4LVvfVb3JnsHRe0FDc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 21:40:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 21:40:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 philmd@redhat.com
Subject: [PATCH 00/11] qemu-io-cmds: move to coroutine
Date: Sat, 24 Apr 2021 00:40:22 +0300
Message-Id: <20210423214033.474034-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 21:40:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f358b88-fbf1-4d31-4fec-08d906a0758c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63742DFE2C8B38497CF49E16C1459@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKP4cVsb9FlBwdet+vnQpkVreC/d32zHBAdlhLx0iBkpaGHa1u/UXyg420Z/yJG8XHvE2Txa7bZsBvMw/KjCl6jHrZA0SWxg7LdTI5W+2SXUpdgfquu4R33CnZE2t28zHQePCn7Z8UjVCDGtTT7fqEzEqNxaSXSr6Ae9vMshaliHaQlu7wXlFeLx0IKtIsPbrUJlqMX+tSjtj1DqZMIHqySG4MlXyLoJeiFu2foQZnjo1At/KdLM3ov6mYQQGpCF7L88fWwuytWTM6COIcNbDyrc1nIRrCSA/5BmfOKWiB4ROUDb1XxbWJMTYcLd9w+7jjL1cE2bboMXA5vlhMcWApcLPXIKYQFlkElVsUvuZTm0OutwoOMMM2Un7eqQFqn6i1idBjPTJFxR013E+G/SKBuXjNoez2BaNR36Zbf8e7VyC7fHtmWFeUT0/u8IRSHIS2QFWdBk/+rWenEJOi+SENQQv/Z003PS61RhLBc0osN1aLczp75Uqvhlnwyqa1fiMs6f/U2ShrwJX4okMnKQafHkFb66d7cZkwcDbIBDZ6yHq/eqetWNOgzFsVS22bbHDKFfUmrdC22HVW4xwr3RZjLeRYmr75sTjakPjPh+yY0tGfcpTvRzhL+qqrSc9aJCnyG7eTUoPV0urMb3BoubAOqdmfJS0QdicsldKN6CQaBBAjgAHf3fR0L4N14kbPsM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39840400004)(346002)(376002)(316002)(2616005)(26005)(956004)(83380400001)(8676002)(4326008)(38100700002)(38350700002)(478600001)(6666004)(5660300002)(86362001)(186003)(6506007)(66476007)(66556008)(1076003)(16526019)(6512007)(6916009)(6486002)(2906002)(52116002)(36756003)(66946007)(8936002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uCbI69hVfBAUiEsGZ+cx1iSza5Vvd4XsV8Ussb6GWXsv7XeUaWO1uxTMssbf?=
 =?us-ascii?Q?hBcg1tzBHEH2db7HL1wWD64kJ0K+nQlNV1fodOYQOTRa9hG/W+uKL6A03CtZ?=
 =?us-ascii?Q?IHwmlpT9725iNBdJdYocXz4APNp5mwbJ2SfAm1z/ykB260G6WCyklVG4GcJt?=
 =?us-ascii?Q?y4ZdvgGoxzjzep1Jhat7kLRrnbVtZskIx2THavxsvNU7naoVo1mDiNEvi7fX?=
 =?us-ascii?Q?Kl6V3TUKaTINzy6E2FBxgrGBuB1vL31lD/9MCOMspZmTxW5qNtsjNS67uZm6?=
 =?us-ascii?Q?oDBM1D1axxll6KUvpxEVPIGyis/KxvsP06C7CWmc/WN3ycrWBgzAfkWWtcR7?=
 =?us-ascii?Q?2//6TMkO/Wm2ejtqfWkfoaqHgjw7yYmV1w+wVLhSASbRvUJtLMEjwk6lcY2k?=
 =?us-ascii?Q?/Ey7JgsDBVIkpEucvyOmJzVB3KJuISWfN0EWyylpI6Id/2IkPhE6oDR2URy6?=
 =?us-ascii?Q?wFuKO6etmDEg33Aq3PzVQ2yO7/D9DnOfJa1hJiDeJC61IE30VLFPjl7ezyZn?=
 =?us-ascii?Q?OzTJQoLoOr9CLKFPP2mePg1bKhWC7sUyBkpIAbQy+asq0UpuSDIYyA9cboYy?=
 =?us-ascii?Q?p2v5b5zao0/zYKlCBZG0inuqLfr5jea9Mk3flpEmLsGnWY3YhobEw63pQc3G?=
 =?us-ascii?Q?VMtKVQHAQVTZ2uyUFvhiYwo9aygbutTSjKuMMBNgd4bSoe3PaLFxTcX2di2N?=
 =?us-ascii?Q?qx8NR/0Xeuo0hoVOLWPYLpoNJkiH+nbD+gyQbyxfrxeImPPaWuN8ViOCnHYw?=
 =?us-ascii?Q?7lJ3/oZu6fFXkjD90ukCGMiEodNxktq9gms+Nq/U2TxGtEP1x7MbyLZXwWmc?=
 =?us-ascii?Q?Y1KsjDO/evf21rtUH24L5xCPMxaUEggF3LXj5VbGZ+4zNxfEyOEpcMMCY2/6?=
 =?us-ascii?Q?QpGO+7z6qassR0fxOh+qgHQQzsin6KNUTlvq2hNNZcRlE52nn9Oxa6b8MOwQ?=
 =?us-ascii?Q?kkB8Fu0E2uL1zSfd+kbLCfOmw2djjOTBediSpzKaPWU1QHrTnCLZjo77JVG9?=
 =?us-ascii?Q?R9bqFltivxTaEdJuqrXzvdIRsA0a9Gi8k8ybfhM3xr/4JSufbvL/ne+44ikV?=
 =?us-ascii?Q?ews4d6KRI95VQyTld9jiNpX9bQk3x8pgadX6vYu4edN2EmvZaNo+D5A4ExoB?=
 =?us-ascii?Q?sZORvlas1V6RPcvEw2CQED3A8xTjh//6tDMTJPq5Y1vrfKYSC8kZXUkbo36x?=
 =?us-ascii?Q?f7YhQ8MFFlBO3nvIaWUdtJFS0jIP5gWuS2AWhdOKdA6+qYydhWcR+TkFqCfC?=
 =?us-ascii?Q?qhRQEbN/dG2vZ6hkCW6kML32+yKvhBq1cvyRe76mljJjGUQS81ZyiovcYQRy?=
 =?us-ascii?Q?ZjnxjHp56B7YvjShC2MRZFJj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f358b88-fbf1-4d31-4fec-08d906a0758c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 21:40:48.8987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTQd9+rQ953u7gJKBVXL6WUoYNljETDkPlniGgB+MCuUDiqW2rRXrPk6zcXtUqmzYMeDp1knpQ+cHh7cGT4rNAQO+cM4//7OvB61Eg3nbXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.1.127;
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

Hi!

I've done this by accident. I decided that it is needed to make a nice
fix for a problem with aio context locking in hmp_qemu_io(). Still, the
problem is fixed without this series, so it's based on on the fix
instead of being preparation for it:

Based-on: <20210423134233.51495-1-vsementsov@virtuozzo.com>
  "[PATCH v2] monitor: hmp_qemu_io: acquire aio contex, fix crash"

When I understood this, the series was more than half-done, so I decided
to finish it. I think it's a good refactoring. And moving block-layer
things to coroutine is good in general: we reduce number of polling
loops here and there.

Vladimir Sementsov-Ogievskiy (11):
  block-coroutine-wrapper: allow non bdrv_ prefix
  block-coroutine-wrapper: support BlockBackend first argument
  block/block-gen.h: bind monitor
  block: introduce bdrv_debug_wait_break
  qemu-io-cmds: move qemu-io commands to coroutine
  block: drop unused bdrv_debug_is_suspended()
  block-backend: add _co_ versions of blk_save_vmstate /
    blk_load_vmstate
  qemu-io-cmds: refactor read_f(): drop extra helpers and variables
  qemu-io-cmds: refactor write_f(): drop extra helpers and variables
  qemu-io-cmds: drop do_co_readv() and do_co_writev() helpers
  block-backend: drop unused blk_save_vmstate() and blk_load_vmstate()

 block/block-gen.h                  |  22 ++-
 include/block/block.h              |   2 +-
 include/block/block_int.h          |   2 +-
 include/qemu-io.h                  |   9 +-
 include/sysemu/block-backend.h     |   6 +-
 block.c                            |  10 +-
 block/blkdebug.c                   |  17 ++-
 block/block-backend.c              |  21 ++-
 qemu-io-cmds.c                     | 237 ++++-------------------------
 block/meson.build                  |   3 +-
 scripts/block-coroutine-wrapper.py |  30 +++-
 11 files changed, 113 insertions(+), 246 deletions(-)

-- 
2.29.2


