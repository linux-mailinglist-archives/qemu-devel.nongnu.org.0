Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5AA2F8F76
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:49:44 +0100 (CET)
Received: from localhost ([::1]:59496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tS3-0006v5-9U
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQA-00052p-O7; Sat, 16 Jan 2021 16:47:46 -0500
Received: from mail-eopbgr130098.outbound.protection.outlook.com
 ([40.107.13.98]:5600 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQ7-00076Z-NH; Sat, 16 Jan 2021 16:47:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEkAxeOrA1vUWI4qnBvqEvcPCpraKqO88Z65tozapWz1fSYeaSt18WfCf1faHd3tWukYBBfBwlkQONuvhKsAv6Ln/xpL/ylYB8gVUAdSfTZkAu40ghZTGRBXvA9AlOXBXF4a1eiXeWRwdTOwfafwB1lorYxAERYvmC/s1PLYITGEWGQlJa0gR/k7E6okF43VBfsC6thq7MF6PcPAT1VSN2M9Vn6awQfV+6ty1NG995qwOZhWrYt5ZSgdtb5ZPXJqgaR4mJorxgpOxqDP0oBZtRqUHwsooUIaaZQMPUxIxSx/QW21uf9Ta5Ve+fzXBu8Udy3kZh6NaLHq/QPgNw2Kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZXPAtChA5G3GOpd/o33NtSER5Kti/IFib/IQEfxox4=;
 b=g+Fmys9P06wXRoX9wdMH6+4a6G4m8wRJ7RV1dYItkMsKzFPicTPltoRci74clT7UF53nPKxSVDRAyaLnJHbs4jzCKuTBOupExDHy7+7LZKsmJ4Ps6SSj9MMFTWajAkZhuWoIkZhCE89le/Xj1xJuNFf7qI1ljGPr3gZGJBzeDSudi20FD7XEfP1bw5ucrzALmknPuQdtL18DaNadT7ffFYwZ/UoTwNe63Z3nk+/pAq+2EPGGc2X8D9PjGb6zS4mZLlJUW2WWlDsBnWTahbTnv/v6f3x7w1ulmt2ym4PKVc5IgNWikOrhWgvcRZLREHBJSkqW9/Xx8Ec4eZ1bLr/dKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZXPAtChA5G3GOpd/o33NtSER5Kti/IFib/IQEfxox4=;
 b=SH+SwF5sdpG/KEbkdNQtm3Y8IepqLO0grPns0LOp/mkPq1E0C+/opoQaGaGeQbRXJUj7pGcH0P9TKohhsKzheI5BscODdt7d/kpR+o5qmQPij1rnLyNfHq4stv3D/L6KcctkFQoIHZj5nbY7H5Z54rhecdF5lwT3pFfPUM0BjoU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 00/23] backup performance: block_status + async
Date: Sun, 17 Jan 2021 00:46:42 +0300
Message-Id: <20210116214705.822267-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5239f15-8aa9-45c1-55af-08d8ba685857
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2033443DAB0F8D1B45ED241BC1A60@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M6bBM6iyndbaw+G5YzWQ9T6EGZvTnhL5Av/+n5gKvo8egTBAoGMj60fdscaT1tLq4ejGCBAfzrE7eJJ97tmK6bC9JCqZ0yVwBSRJAJZ9QTTyQeOQ4Kv5fMKCeJ74MLVhL5KSS0ugSWBrzT62TAYLafnkPIzQ1VJKvXAJ+4CXAOoXH1wiwsywpOWhUYygduSd15yTZvZgW6taOArCSyOVeJ7gLbmfzvkYVimc3MMiQYm76IpwniokXL9UBX4AHqXfrO9ayOVsEIM42CQcFRbRTY+4475mUb8U7kNMJ5/sFGO1Mwi+PSh2pWTX+6OZatlEF2gvAHG2grl0NEAMgGqZajr9fD71AztA2LXmOswLoH13hIIIpBHPVuh4XY60zIGO+cxSKROxE2AHHYbrRQnDbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6506007)(8676002)(1076003)(186003)(16526019)(5660300002)(6486002)(6916009)(36756003)(6666004)(316002)(8936002)(107886003)(4326008)(478600001)(86362001)(6512007)(2616005)(956004)(2906002)(26005)(66476007)(66556008)(66946007)(83380400001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4aLVIeRm5ZytgtPQugdftLm0SBYgFxMjm7aUK8W/jOcZlrnGx2MJGkEpGeC5?=
 =?us-ascii?Q?TXR4OucHshqeLuxmoWMOrp1ktFKPmfwMz4wyBheCpm0boWJVkAy0Fr3B/nYp?=
 =?us-ascii?Q?zuGBtOy/kyMW+TiKOKcUCF3xfRYZty6jQWNxzEl7s2db6kX+WdKlYBTvgFm9?=
 =?us-ascii?Q?mdaWmh/pKRScK7ehNE/RDFyWbT9TwTuzp248Xz+ND58ON3nX9qwzPLwEN8D1?=
 =?us-ascii?Q?RbV4nAt5RSdZDEvrWt4mK/yI0NajFuEnU6oF8hS+L+FGMLMHbKl1JNoTOEQW?=
 =?us-ascii?Q?bCP2BmB22rSZkYTyy4R5OKUgAdG4z15zQ1kVxN7UYS/nv18EW0zDCOl37hwB?=
 =?us-ascii?Q?3nS9Ty68KFPDIyyAyHTmivFY2vo0pfzDu3u0dfLk8l33Z97UW/8wE291/VKW?=
 =?us-ascii?Q?ldvwbSaVIqCgTr+FZL7xRC5msUQYWYBA8lTIWFyWid2FMt4P1sr11dwopv46?=
 =?us-ascii?Q?0crTZT5j8H0DdLxzmyPqoAkeXbPidvGfri7HIrBaW3O9RcxaQYFaSgIUMrHC?=
 =?us-ascii?Q?QIgLS6o1DNiXbpDIgFM58TtKxchV/dEi5xTwQEEfvfKFO5NTglM9/oScBCmM?=
 =?us-ascii?Q?tEsY6jNBv1L70tY7KTJrMN8q4/UqTXlGwJ2otoQVvHvz6R3efcYrXdPC0zwg?=
 =?us-ascii?Q?NQNBqhWHRTQ7F1pa+nDp2/sUHGZqm0QhC3FsBq0L8J8M/iscNH8hBhTVxpP/?=
 =?us-ascii?Q?duidvLL4MfpuRBUcfKguIX6PB3ACVZvKikeChBhkLITFQKQkXxO2DFmDEXeF?=
 =?us-ascii?Q?eEjYo8I+5qwBNkbCLaX1UxseIJQHJh/q6CV8hKn7ZQmT1USltiOUAyA7kwxB?=
 =?us-ascii?Q?4GpZ8eNK8V5d2S59goGRwgV/I3vujArhXf2Zgc2PjO8uaOSCnbdZwp1gE0Sb?=
 =?us-ascii?Q?qeM0BFHUr7A1CGioQz7CrqqxKITZj2+jByyKhxJRgbkDe3+iZjdSewIImwHk?=
 =?us-ascii?Q?XB3E3KBGRugn3BHiWZk/D1x0gKUVcdNXWZ9k0ovjvjzgIZDN+SQJE4NY0uIM?=
 =?us-ascii?Q?uqVv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5239f15-8aa9-45c1-55af-08d8ba685857
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:39.6883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nvj8orUJFQ/QvYVjDgF3fl/0Is7Pu9nTylcS4fW1hyLUJlSNYi9ApAxVa8/HErLkDVzjGZW7+JiMXXZmeEsWLLIzHTIz0uu1b4e5KJrjT+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.13.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Max!
I applied my series onto yours 129-fixing and found, that 129 fails for backup.
And setting small max-chunk and even max-workers to 1 doesn't help! (setting
speed like in v3 still helps).

And I found, that the problem is that really, the whole backup job goes during
drain, because in new architecture we do just job_yield() during the whole
background block-copy.

This leads to modifying the existing patch in the series, which does job_enter()
from job_user_pause: we just need call job_enter() from job_pause() to cover
not only user pauses but also drained_begin.

So, now I don't need any additional fixing of 129.

Changes in v4:
- add a lot of Max's r-b's, thanks!

03: fix over-80 line (in comment), add r-b
09: was "[PATCH v3 10/25] job: call job_enter from job_user_pause",
    now changed to finally fix 129 iotest, drop r-b

10: squash-in additional wording on max-chunk, fix error message, keep r-b
17: drop extra include, assert job_is_cancelled() instead of check, add r-b
18: adjust commit message, add r-b
23: add comments and assertion, about the fact that test doesn't support
    paths with colon inside
    fix s/disable-copy-range/use-copy-range/

Vladimir Sementsov-Ogievskiy (23):
  qapi: backup: add perf.use-copy-range parameter
  block/block-copy: More explicit call_state
  block/block-copy: implement block_copy_async
  block/block-copy: add max_chunk and max_workers parameters
  block/block-copy: add list of all call-states
  block/block-copy: add ratelimit to block-copy
  block/block-copy: add block_copy_cancel
  blockjob: add set_speed to BlockJobDriver
  job: call job_enter from job_pause
  qapi: backup: add max-chunk and max-workers to x-perf struct
  iotests: 56: prepare for backup over block-copy
  iotests: 185: prepare for backup over block-copy
  iotests: 219: prepare for backup over block-copy
  iotests: 257: prepare for backup over block-copy
  block/block-copy: make progress_bytes_callback optional
  block/backup: drop extra gotos from backup_run()
  backup: move to block-copy
  qapi: backup: disable copy_range by default
  block/block-copy: drop unused block_copy_set_progress_callback()
  block/block-copy: drop unused argument of block_copy()
  simplebench/bench_block_job: use correct shebang line with python3
  simplebench: bench_block_job: add cmd_options argument
  simplebench: add bench-backup.py

 qapi/block-core.json                   |  28 ++-
 block/backup-top.h                     |   1 +
 include/block/block-copy.h             |  61 ++++-
 include/block/block_int.h              |   3 +
 include/block/blockjob_int.h           |   2 +
 block/backup-top.c                     |   6 +-
 block/backup.c                         | 233 ++++++++++++-------
 block/block-copy.c                     | 227 +++++++++++++++---
 block/replication.c                    |   2 +
 blockdev.c                             |  14 ++
 blockjob.c                             |   6 +
 job.c                                  |   3 +
 scripts/simplebench/bench-backup.py    | 167 ++++++++++++++
 scripts/simplebench/bench-example.py   |   2 +-
 scripts/simplebench/bench_block_job.py |  13 +-
 tests/qemu-iotests/056                 |   9 +-
 tests/qemu-iotests/109.out             |  24 ++
 tests/qemu-iotests/185                 |   3 +-
 tests/qemu-iotests/185.out             |   3 +-
 tests/qemu-iotests/219                 |  13 +-
 tests/qemu-iotests/257                 |   1 +
 tests/qemu-iotests/257.out             | 306 ++++++++++++-------------
 22 files changed, 830 insertions(+), 297 deletions(-)
 create mode 100755 scripts/simplebench/bench-backup.py

-- 
2.29.2


