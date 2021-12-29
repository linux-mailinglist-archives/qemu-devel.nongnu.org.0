Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4883F481668
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 20:40:36 +0100 (CET)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2eoK-0004Ay-HE
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 14:40:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eb4-0002z4-OW; Wed, 29 Dec 2021 14:26:50 -0500
Received: from [2a01:111:f400:7d00::71a] (port=56449
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eb2-0001M7-Sw; Wed, 29 Dec 2021 14:26:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsYkOxVS3fJ/3Z5Nt3t0UBSFIOt4fSj4tGH0ngmZmwcur/7oXpfi23uCGVa4XOwdc6wxXpoiw694t81F9p+kXZbKnwgfn4FSoU691iOavpGBeamYRacEthhfB8MrI30IOcD/444hhLPPoXeIlzlIyhPuPc7u2JKjvoZxErSclWVbCqQLmaCZdv9H0lkRMP5184EnAVtL2NE/j//Wivyl/H6iKZ1W8mkq8Fg+5RF3f7RVQyQFt2kAct6xXbkpWmB0WWny0IoXNyVLjoK11XM+mTRt+4ncQps3mMyo76N0uHgJWhk/wksKFh67neyx+emxaJwHtuMkWlXSztZs8oOWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3u7RxWDqfaV7jkBm2qaIo3F3qIypQqVaUGIVIUM8Uw=;
 b=RT3nQDSgBYblqUvPEukavyG3gk9CVZ7luYjTJaIJzPR2oREIkK0yPAyNff6YDCVzlVapsG2zhE8gMfRb/jY9qcAJj1Nyb66Ol9OwzBaXtI6E6tgSKy4cFPkU2s00i/wckphBCocywKpWkSopiAaJ+l1yx3JrtGQnmY86JMF+JuSoE0L6WdvZzXYjAidIQY+GrWlQtmbxWGrrSN5Lpk0ULGLkiIxlKMuZ5CgXeQ92T+gOHGp14KLw2x1C/yQ/MfNu7VUPllbVXVfEoEIM21agNx/PkggDQaPcNKY9qwLD+JyICbV2hJ9abDsp8JTYJmWEBEKRYCMrCnM19g+jCRoYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3u7RxWDqfaV7jkBm2qaIo3F3qIypQqVaUGIVIUM8Uw=;
 b=u7S63k4NFo4/kgdVrCclzVoSkN2xDdpryMjXPJrI8nEXczEy438dYKeRGqQrbmv87TVmDsYhX7/bHxcWEq2ft3dVFR2cOqq5R9CLPj6wcZtNeODrHRugB0LaOhnsLuFgrdVynbYwG+w7SMsYY8oRRJtplCmmZEFbEsSYjMqPTcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2276.eurprd08.prod.outlook.com (2603:10a6:200:5f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 29 Dec
 2021 19:21:43 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Wed, 29 Dec 2021
 19:21:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PULL 0/6] Block jobs patches
Date: Wed, 29 Dec 2021 20:21:21 +0100
Message-Id: <20211229192127.1772134-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0152.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06c600f5-ce87-4416-118a-08d9cb00729d
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2276:EE_
X-Microsoft-Antispam-PRVS: <AM4PR0802MB227642BF1A8399DA54A4FBE5C1449@AM4PR0802MB2276.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:269;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ect4ZDVhZ5Ybl2dcdf/vpZSo03slP7KhdZFrXRowURWbqlSzbeqbBHtyVOr/V0B+xjXlG7pgtQTGovZt1ZRaafVDM5H8wnuHvUoe1i62kQ5YqZ/zLjEn0heFU/zFK5ssjBV2K1aZLBj66HMssGG+GH4uWqFOIERw1mOCPp44qRulIqf5G3TatZ58eaP9tHCceP5/YGawz1KqXUP4DLjZmQWD/ZBnC9K2Y1wTvMDYVDMX4CgX6J8rbg1pS5BByRzDEGxE3qNs7pai9pGJ+UMjm1EN5YujUYQZwDIVF4Y46vsA5hpxdjyI5ym80EsE2jPNpejKb1Cwp0VJ/5Czekf8wSZ0S2yQzxNYT2En2YNvpUa+fZzNSj9MGzXY/fKsNU7beMcN5K7FXCbZe2nBelabVAbL4PdaDr1knFbn+HgFNxEDzmzt4g6e5/N6jOy5UI+dT/+lJQzOCNcuCHyO1T9cYACzevQDZU0REDnFSniZ65nePLSWzPjwOZpZvFCQu5YcECC9Nc3/2L+ScklCTgD0mn1pUYoVjQYiAy5ASyQS8xUckeiSZIbCFL7C3gY8oxYx2N9XLWzP9FKb/nuNsMMnmuWbhMPaJ7u4o6sJUPO6tyhvQQpfqiMq2GVMyRXccfxkE2GwErP1+RAi9Id1z95c9oK5K4ZNHDWY8G40+VlnNywfXsljUWaIiiuVHuPScZwJ0N3DPfgKKiVUmlVDzYthQOCVJdhWh+0TaDK13QBlDJocqXfEVDaMOKHTSf26k9YclMY/Gbugs0Gvj7CRuVLlIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(52116002)(1076003)(6666004)(83380400001)(2616005)(2906002)(4001150100001)(6512007)(36756003)(6506007)(316002)(86362001)(38350700002)(966005)(8676002)(66556008)(66946007)(66476007)(6916009)(38100700002)(5660300002)(8936002)(6486002)(186003)(26005)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW12ak1rNVdrSVovQWdOZjVkRyt5czVMWUpxM2tKbW51UmtpMW1jc0N2U2VV?=
 =?utf-8?B?Z3NJdDBrWW1kS0lCZ3d5dGU4enFYcmFKQXVpTTFGVlFCOFVQUmloeUFNTnZU?=
 =?utf-8?B?R2J0Q1ZnTFBQSHdkRklHQks2RnFDemE1d2pnNjRENmU5S3FRclFwMDN2MDV1?=
 =?utf-8?B?UTBRYVpqbi9BUHJsbFY5ZU9GcmI2TkJjTUUzYVVoa0E4TUJCK3oySkhvbXRj?=
 =?utf-8?B?OTFibERXRTRwZzQ3K3JNd0NQS3JpajJwYXExTnFzNE1VMTJNTnFObFg4d1Z0?=
 =?utf-8?B?bEJQeldXQ0o0bG04QVNFM2hKWC9FR0lFVnZzN3l4U0dPSkNXckw0OEluK0R5?=
 =?utf-8?B?SFB6RlNiUkZUZGlacm82ZTkyTEFrV0xMWkJodElyaDN0N2swRjVHNVJmTERU?=
 =?utf-8?B?NC9aZE5iUGhiRnJaNDhxVkxIdzJKQmJTekF6c0Nwak5hcUtkTkdlNVJqTTRw?=
 =?utf-8?B?UXZnVlVHWUlqVGxDeHlvdWRKQm5INHl1VkY4aURWbVBISHIzTno1OUg4L1Z3?=
 =?utf-8?B?RlNnR1ovQXpLRUdiY0JZclQySGV4YnBKTHM4azh6eXdDcUJmU0lUYUxuTlJW?=
 =?utf-8?B?bko3UVQ1M3IveHNxL2hNZENUNEVqS0ZHZGxYeEZ1ejkzTllxR3BZZTVaTElB?=
 =?utf-8?B?Q0xMMm5CZGRtVmFFdjFqZlM5L2IzUCtYdkR2TWxEbmltM1RMQzlJV2djS3Ja?=
 =?utf-8?B?NWNvMFV1N0kvelRiNmdUVEZib24vWkpsN2o4QWZTN1BSRlBnOFg5NjlVZVNP?=
 =?utf-8?B?OHBYaXlhZ0tIaDhVN05vdWppbFBjdHdmSzJDL2RzRXJ4QmF4UXVseWZQRW5t?=
 =?utf-8?B?ODNIdlpLdmo4b0NpVFpZZHVQQXY4K1UxcVplTHRuNVRwUGpNejZPR1dqcmJC?=
 =?utf-8?B?MkFaUWZ2SW5pMWdLTlh1TWNIWHJ1dy9pZHhwaXNiZ3RCWmFQWTA0dHNTbnNi?=
 =?utf-8?B?TGViaEZqTHNpRUo3aVNYRVYxQ0FUeUVHWWc1YXgwang0bWJXbXR4ZW9CVFFy?=
 =?utf-8?B?RzRGbDNCNG1lMHRSZi9Vb2xtYU5MWU5DN2xiaTVFTVU4MmtSb21YSmVEKzFi?=
 =?utf-8?B?cm42dEh2ZnI1c1IyU0lISGlMcFBuL3N5U3l0Wml5Z21vdDNVWTNYeXAzeGcw?=
 =?utf-8?B?OFVCVUYvSThrdDllcmZubXZ5bEpCZEtWa2JzNUxPRFYrSG5ZNjVzR2k1SUx2?=
 =?utf-8?B?bWc4cEdETWhoUDJEQ2RsQ1Y3NUxKak5JeWxDYnFZSmFhMHhRN3BUcmVxNGkx?=
 =?utf-8?B?Y0RSRzQ1LzEwekRMSHZOcnk4QklvQUZHc2pvaGZ4ekZOblVaVitlRWVoczFa?=
 =?utf-8?B?VU83WFd4Y2t4UzlIRStPTXVYU1cvMXE1QVZqUmpldEt2WWNkZG5tdVFiditI?=
 =?utf-8?B?Y01oYldJZHN3eXFMa1lUT3BsdTVhbW8xZFNYajBmVExUWFU4T0NZZ3djMnp0?=
 =?utf-8?B?ZnVDeFU0NWprQlllNTREeEJCdFN1N3BIcTk4VXpJMks4N0VNU3lWNWtLWXBG?=
 =?utf-8?B?UlAzaDhkanVmQjA4S2RWQmRoWHBoalRueWpSNi9kb09hM1ovSHRjRkwxZzJp?=
 =?utf-8?B?ZTVETkxmZzNBdWZlRUFtd2Zja0xBSk03cGxTYnpreVozdWpqLyt2SEEzUml1?=
 =?utf-8?B?ZzV4YkZLVnlSWDFwR3ZDdTladnJTbU1KQjQ0b0ZMRzhFVEx3R2pEWmNwSFkv?=
 =?utf-8?B?TlVuR2lBaUdud3BwWHNJQi9JRXhacHBHL2pMTUd3RnN5dW5jUG9yenVvVFhF?=
 =?utf-8?B?bmtoZWZnbWtiK1AycW5PMXVvNHNWcFlGYzhDcld0Wlc0UEZNeTA0YnhkeGlS?=
 =?utf-8?B?VGxqZWMvV1pnTFBuYkQyT3BXSkp4bHR1a3hVZlg4MU91bG1XVVZZV0hwMVFo?=
 =?utf-8?B?ZlJEQXRhMmtVZ28razNoT0dRcDRFYm1Tby9wZWhZSnRvNnFFVCtoQXBRQUtm?=
 =?utf-8?B?aW9JaXhCUmZkWXprQWttelQ0bVRMU2I0cXBHL3l0T3NjWWRjRndhRUh4Wmc1?=
 =?utf-8?B?MFh2N2xLZlh5RHZFUXh3Q0RTSGdFb0VZK1h2ZVRmc1M4YVh1cHBEQ1BZK01M?=
 =?utf-8?B?T3FTQ0VTUUY1VUJtS21Wb2hEeER0VUp3UDhUNlZmZlJ4MmdiRnFlZU5NMUZ0?=
 =?utf-8?B?T3IrRTdkSm9YeGYvODdyK2dGM3k4ZVpPNDl6L25uSm9qaUlvcGpkVjNSSXFB?=
 =?utf-8?B?WUloazBKRW5hZGFncFE5TVpKUXI0QkZITVVSalVYa3B0OUlXdzFURHVVOXh5?=
 =?utf-8?B?ZHlSaUhicVJHV1h3Q2I4b2xzdWt3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c600f5-ce87-4416-118a-08d9cb00729d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 19:21:43.4845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBgtP8NBRoaVx/5QPDAuDpDpw2U7n4tsINWzvtxGrHF/sSdgI321P2LHWECx3RX5V/1QHW2cQdCgaTJcYFQx2gBBXpQ+HLNU5aY3mC7pZqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2276
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::71a
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::71a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The following changes since commit 89f3bfa3265554d1d591ee4d7f1197b6e3397e84:

  Merge tag 'pull-pa-20211223' of https://gitlab.com/rth7680/qemu into staging (2021-12-23 17:53:36 -0800)

are available in the Git repository at:

  https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-jobs-2021-12-29

for you to fetch changes up to 985cac8f200443ad952becc03b07c51ff4f80983:

  blockjob: drop BlockJob.blk field (2021-12-28 15:18:59 +0100)

----------------------------------------------------------------
Jobs patches:
 - small fix of job_create()
 - refactoring: drop BlockJob.blk field

----------------------------------------------------------------

Emanuele Giuseppe Esposito (1):
  job.c: add missing notifier initialization

Vladimir Sementsov-Ogievskiy (5):
  blockjob: implement and use block_job_get_aio_context
  test-blockjob-txn: don't abuse job->blk
  block/stream: add own blk
  test-bdrv-drain: don't use BlockJob.blk
  blockjob: drop BlockJob.blk field

 include/block/blockjob.h       | 10 +++++++---
 block/mirror.c                 |  7 -------
 block/stream.c                 | 24 +++++++++++++++++------
 blockdev.c                     |  6 +++---
 blockjob.c                     | 36 ++++++++++++++++------------------
 job.c                          |  1 +
 qemu-img.c                     |  2 +-
 tests/unit/test-bdrv-drain.c   | 12 ++++++++----
 tests/unit/test-blockjob-txn.c | 10 +---------
 tests/qemu-iotests/141.out     |  2 +-
 tests/qemu-iotests/283         |  3 ++-
 tests/qemu-iotests/283.out     |  2 +-
 12 files changed, 60 insertions(+), 55 deletions(-)

-- 
2.31.1


