Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB93341319A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:32:47 +0200 (CEST)
Received: from localhost ([::1]:55278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSd4w-0005c9-Pz
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctI-0001GR-6a; Tue, 21 Sep 2021 06:20:44 -0400
Received: from mail-eopbgr140125.outbound.protection.outlook.com
 ([40.107.14.125]:6053 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctE-0002LA-1h; Tue, 21 Sep 2021 06:20:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2GTnn6Q1vECNiN7izjC4QmqI3iKAsD+ZurVCAq8nKSnLAL3gc7p0bD0RlWkkoj8hD1UKzt0AFxCZRT5DklCQm7aMqAOYo6bR1tL6ulkwbGTJlsX8teAZJunXP9YOt/ouoIW1R2zd0R0+uwhZJn7PdKd9kpGryKiAkldl11+lAQNxpH7zvZUCOxq/RVGtRz4fe0A3VvLdrvlU9rpkmW/do63mAShYknYVnIYJZ1JCqgc5WU0VLtRmJYSlnq97hAn2DF45Y5OWovVd+sZJJjWWnHq+nmT2zfCObWlf1RsKD524VvoJPN/LyNuSvdfAaS/3bU99iH/wn8LkXMcZH52Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=f4O0cQd183KP87XfC2HqX/xinJk5oGSw0QAp/hRCTg4=;
 b=BdKzEbZxWyYDBfYL8vUFxXqPBECq5R6zECSPHjNcTiRH+OykYDVygBDcTn+YiuTo+7lb8taREmPr7v03XZUVXx21OFldjT9kAms7i0SoD3PU7Sl8i7mQeQFHkhuCaRzEp0OvG4b1XGCMBIVOujLzJeTuRu7fyfw1kATUFnNoqyeZnbVc2/5RRI1NEIEWRrTxMi/nE3EAezmJZX1ZkLqI/LeGTdVz3xdamS2aDcJC+VJn8CkDBRmEDSRM6GdkAKgNkvy/0FzYxRbg8tRbpQPZZTmuohKXHZMrduHj/XO5fp4zvkJPMyEZfONDUSfv1FqFm6NlB0urEx6PieEtKJf2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4O0cQd183KP87XfC2HqX/xinJk5oGSw0QAp/hRCTg4=;
 b=PhVolDeivEJrlxgf/Kq3tQJLD9GyNv2Svp4VPCh00A/pu0u0Enx/stOb+OkG96tb1VxY93BXc3iJdla+2irwEXN1y+Z7K8rP+RKwO6BeFynOgVbCQHQwdI3q3CyfQN83nP1dJrmgwZuE5JYsCJhaSM1b15Q/dbQRatzpFwJos4Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 10:20:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 10:20:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PULL 00/12] jobs: mirror: Handle errors after READY cancel
Date: Tue, 21 Sep 2021 13:20:05 +0300
Message-Id: <20210921102017.273679-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR06CA0127.eurprd06.prod.outlook.com
 (2603:10a6:7:16::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.205) by
 HE1PR06CA0127.eurprd06.prod.outlook.com (2603:10a6:7:16::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:20:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a57258c-3a69-4546-1346-08d97ce97220
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6631E04A8FF14282077DC423C1A19@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:79;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CvNkvwtrpQ9czQf5uf+E7sUm2qqnjhTrm4/sVBE+pMKS1shpl2xjRsA2Iw5ut+irnHvkvnZz22AGpDR2vvuMLM7MKzqpzCeGDq8YM0U6GwuAtjesvZu7ZFFGHX+o+cDpn2DpiurbDOknO4zAWSl5N9K4JhiW6aYXwl807Z6IiorPXS1PZ7OzE7/85Rzx0ABNpXo8lMugB0KILG/CK2q21PrxQc6tD6NcIudG/T3i1jU3Q1CYR2mqftwNeXEzOVbq6WwsTWOgMxx8xrxzTsAzjjoEK3fYN+9oZweW2KhxsQ+bwr+wUyfUw0Qd0sW29WXEq0+jP+fnXzaB8QsG59lnazyIocSGe29xyn24mtIs/c31gAYToxz9wHEAF97HKqFSWis1EHih+MeHCuLmq8jAkZUA6lIZUDB0tRXcQAwZ6pPBP3CGLRjW8Ol+8crBOAIgjkGcnMvhYXbwd2tXKTYUQXECO6jlA5oewcyZ+tw0iUv9Gt6P4AK2TRnE35lrGHSFFwvNicNL7IHNfK7NIVwGR5WFuVh3ORa6vXgyZ3JWQ2x2DsJL/UcaW3RgTmO0JuZnfkaF42Z2vg8LmrviGPSXeCeMYOd9F3oDrHMmNaLAtw83Q7LSO5K2s9tp+tWwO7SE8bjrXWkc/Fr6cDKojT7mYzpwtAtM+noI4kD3YzcHWzbKfuq+vCd0artBvfb4R8pZixKAmhKSfC6nbrepDEi9QSOk8J1JNe1yFynprMx7O555IlkNqK/u+I47h4oT6Xpip/GFX+Uh4kZ27zd8l7fyv2io1DY9WyFofXJbmQk9/g8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(966005)(38350700002)(38100700002)(186003)(86362001)(8676002)(316002)(4326008)(6916009)(8936002)(6512007)(6666004)(2906002)(26005)(52116002)(5660300002)(6506007)(83380400001)(6486002)(956004)(2616005)(66476007)(36756003)(66556008)(508600001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LMfqYewgBpWvdDstD2TwRbLaj1h/CpAMAjVTtwZGwcHyw76E01gfx3wj+9yp?=
 =?us-ascii?Q?gMzga5UGnwBANhqpZoi5uvNxKQFcjFyzL+nzPVostYfMShECghIIr2gTPtsq?=
 =?us-ascii?Q?QuIPCQM0TckK2yVguxwmOfHdGENDu4/gbo7OTUEPJUY+P2QwtGCNLYmw55do?=
 =?us-ascii?Q?VreOPaaLLTgiAV0gMSdjaUYYnDJU/Mf2kR+rBevZlNx1G9PsjJAANxth3bsH?=
 =?us-ascii?Q?kZSaaRMwWlD+IipPANfSVBmZTBY5ZZRQzw/Y+oDn/Ex7lUFdFIOlxoa1XaIJ?=
 =?us-ascii?Q?PCZP11jqhmHBfJQ2i3GOzEF7ZvTp3g7YpvQm2B9SWYzYikowkuPns2qclH6y?=
 =?us-ascii?Q?EHDeY9c+CilhHQW3TqxI5TcYrh56nygO/uRzNAJEUcOTKrmpAki0OXIn4AdK?=
 =?us-ascii?Q?g6LCGUFA5dobWPjt4YDH+isArGlrtBlUZMDGxoRDzqaSbXdAAeDpCxbpWzzb?=
 =?us-ascii?Q?eDtjJheQXijiewRc5EPsT3R3kF+ZFdMdKQqgyMazJfi7uWjKPdGxiHY9ij4r?=
 =?us-ascii?Q?16fxssWN9WSvWayBXW5uyjDMaBd95kD8feKyxX+GO14p7qP8dOByv8SYQJnX?=
 =?us-ascii?Q?6WbAeKTjsT0n6glpfiHlDHETTE0OhonX/7kWvEhcNOqiTX8RQJAJzNeiilzh?=
 =?us-ascii?Q?D5JGW31PgYRCdCr9cQurp/0JPhOhR9YsnEanCQjXprpctHEFVqFsvXVbzgai?=
 =?us-ascii?Q?iFPfTzEC+gIT2dwfLouxRDPkAqIixkqXBYVD3jwN72p+fpPchJkCKZ6bQVwM?=
 =?us-ascii?Q?SxsERWfz+4ihwZBVoC8HovvFxo+VZZZfXS7DWoXbKrZUqiIq7uo0PMbx/wqL?=
 =?us-ascii?Q?Rfh+ROeJEvLMV1etoRB0qrfFfYEGhJrCO9N9aqzaT3m2oj9nsGd4HROeFSoB?=
 =?us-ascii?Q?NbFvhM7p5wvG1wy0t5JU9+2YyYGTdEFQuVKvStTSCRBKEaCsAtIm2+08CrTz?=
 =?us-ascii?Q?34gAZ7YaeCJ70bFwQcwo+4Gnf2w/vn26bTzIYFLUsv08x5X6gCj7gcvYK5xN?=
 =?us-ascii?Q?l11nUrZPVORD/hTNftz15qQdDxumTHMpLI+CpRDPcffBX2pTjxgR+DH87b5l?=
 =?us-ascii?Q?1JceZRQoQXTncAfjlYeGIeij683B0mqSlvtTGl8SNYb1O9SOx+apQ9AC0YDe?=
 =?us-ascii?Q?GtU5HT3Mo87nGyVDoPnhE9OpmYjhfU+XLi+r1zKbeizMWBWE0HGZcUjt8CG5?=
 =?us-ascii?Q?D7XbitLv+1vysTPhR/2xXtQ68UgIqCfE+9BtnmzHuquUdi45LNz1M91qWmfu?=
 =?us-ascii?Q?Vf+3dPWbtPDVNHRRWaMK+U+vo5b9fzi3TjBi9Wa4AaEzA/43cwRVqYOvymkz?=
 =?us-ascii?Q?CtWm8wRinYsQtzJPJHtVU73E?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a57258c-3a69-4546-1346-08d97ce97220
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:20:33.5755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6U38TyR8oc3PiZbXEnf2zJ0VXh+VODHM2q2FdZRbYaYWKEW7UVVvaNmIVj188Y99hLeZw2EgnRG7/bG4rzUySWzdjqtbP6BzKNU8fxUn+do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.14.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

The following changes since commit 326ff8dd09556fc2e257196c49f35009700794ac:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-09-20 16:17:05 +0100)

are available in the Git repository at:

  https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-jobs-2021-09-21

for you to fetch changes up to c9489c04319cac75c76af8fc27c254f46e10214c:

  iotests: Add mirror-ready-cancel-error test (2021-09-21 11:56:11 +0300)

----------------------------------------------------------------
mirror: Handle errors after READY cancel

----------------------------------------------------------------
Hanna Reitz (12):
      job: Context changes in job_completed_txn_abort()
      mirror: Keep s->synced on error
      mirror: Drop s->synced
      job: Force-cancel jobs in a failed transaction
      job: @force parameter for job_cancel_sync()
      jobs: Give Job.force_cancel more meaning
      job: Add job_cancel_requested()
      mirror: Use job_is_cancelled()
      mirror: Check job_is_cancelled() earlier
      mirror: Stop active mirroring after force-cancel
      mirror: Do not clear .cancelled
      iotests: Add mirror-ready-cancel-error test

 include/qemu/job.h                                     |  29 ++++++---
 block/backup.c                                         |   3 +-
 block/mirror.c                                         |  56 +++++++++--------
 block/replication.c                                    |   4 +-
 blockdev.c                                             |   4 +-
 job.c                                                  |  64 +++++++++++++++----
 tests/unit/test-blockjob.c                             |   2 +-
 tests/qemu-iotests/109.out                             |  60 ++++++++----------
 tests/qemu-iotests/tests/mirror-ready-cancel-error     | 143 +++++++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/tests/mirror-ready-cancel-error.out |   5 ++
 tests/qemu-iotests/tests/qsd-jobs.out                  |   2 +-
 11 files changed, 286 insertions(+), 86 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/mirror-ready-cancel-error
 create mode 100644 tests/qemu-iotests/tests/mirror-ready-cancel-error.out

-- 
2.29.2


