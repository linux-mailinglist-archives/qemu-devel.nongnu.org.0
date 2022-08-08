Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FCC58C82F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:12:40 +0200 (CEST)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1cZ-0000Us-8u
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Y2-0003I5-GT; Mon, 08 Aug 2022 08:07:55 -0400
Received: from mail-eopbgr150107.outbound.protection.outlook.com
 ([40.107.15.107]:10567 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Xy-0001SC-Qf; Mon, 08 Aug 2022 08:07:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnxi4IP1wsNe2QifFN6d9lri6G6IpQAXS1iOOs8r/DZG+NsdbS0mJwYIBnfPmWlqjxy2OacowcjTGgUm7j9on5CyNZiVHQiAHWf+9gsw4CY3ppggJ4Jjfcpbn3VedVpiuMRR8TVGxK1VHY4cJ4r8ffxoF7J4OvVjf+2VA/kYqX7JGypLXW81IoxpvOQQ9UBiyC2uLJJw5ZTXNuyqstwabYsfV7S8J5x+CW618KQLyrY8J2M4EjuY91acLsIdfoHYkuLg0rgaholEh+9lIoiW41+qa6wdp4gXNJ9brFVYyQNIQaEtOaUR0H4gVIIm9sMqRLh5AVToa315DsDumtBBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjyjLqIBc+naZmk8DmZwwD4f58cwmXoLVhtCNlpOC0M=;
 b=lDfIog7c9eBu52+4yWdw2p4qLLURntTiR+f8aXTDT4KbqxZg/+khIENVZ9cxI4HC2ZFDKvqSJPPgvmkYjKUdJX8p0RLxpn5KBuD3aPEZkuFeziGO3mH9KdIMXm1686Ubl9kH+foH3UwCGclTgn/TaXiROwlawmhbscd3Gw+QJo2gQV0KljCU9HaUjxaPLTwj4XRLtWClNIy7su9iycCNQILRH8AP1t0FpUceSQaof36F1by8V0T5DpmOEVFSdTIeX4/dSRSh49V0sggZV9ROM3HOUrhMjkwx5BiXWyaWChQJYV+2/+mYmWq2JW6vaQeesi+lVr415dGuPBRXHKa+GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjyjLqIBc+naZmk8DmZwwD4f58cwmXoLVhtCNlpOC0M=;
 b=g8ejkg5e0zCi80cefRVquj6/LhOxYi/BzEmljPjQ5OaCzc+ZpYTBHj8nd1umzLiBbzYT8LPxFe8xd2Z9v3rxxStrqiDbCofErF9TI1ksc06ACa7Sg6UAAFW48BRIsCpu1I3qSIWrO9ObSLu2O2aluoqevf1qf8IYIExFZq3uI/zvoGIEJvK7vuqUKIdZFkHmZvjWyC2dqt1HT4fuvcO1DoqRjnL0ZOYS2dsqVV3BxKYQclOd9msn1ZcwNZBVb3eYkthnUJoLL8WepLzPnroJh+GrDIcWbsY294AvPCA4lXzU4qHTqyVi+FfsUzUb064wfkzNRYy7Hdsg2f6eIePQQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB4PR08MB8055.eurprd08.prod.outlook.com (2603:10a6:10:388::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 8 Aug
 2022 12:07:43 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:07:43 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 0/9] parallels: Refactor the code of images checks and fix a
 bug
Date: Mon,  8 Aug 2022 14:07:25 +0200
Message-Id: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abd4fdaf-37f2-4028-2fcf-08da79369916
X-MS-TrafficTypeDiagnostic: DB4PR08MB8055:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0OHlT33T4i0FnTOsP5X/8ab2NCVOmVlCgG8+RhtLTNjjlQ0sqD+UrMmhmasM8gsLYXWodmYLhTop9xoXJ6v1cWgcxakra2hxIcsIAaJdQnMkvsVRkeUjkSjW3jLEJGDFdD2hTNHN6CqQ+Hz9aZJCRZ2k4ZOUVXNMvbk7ZXmb4GDJdHDh14uyhy/CzRIn2DVZURl0xSGFHcg6ZuMGG6wiJyi6AtWj3nVXbv5D6Vxjmt4KZhJ+0/dOGHo1KKkyiVs9OXarbGQSaqmHcFpsV1lkgGpMEj5KJ2LNoyqP8VQN+QSGNrtWoc6qGxVfCSDNRhdm/Hl4cFTqHyfge5QHE7ZhcFHMXJvZeyh/Bf3fkgiUUe4lrWRNhkq3L91Y20xEVGln7rR+BxV4Z4KP36j1M8DmKrUedGSNOE+ivEuRmZf4nE8NugWdE8u9S9wSAWo/LBa6Ujg+Xu3wZavhz6/12eZ0+TB3Ijrr1MGWp4opyRzfMeWbjX3Fe0EQRzVxgz5W4aIhfIdhW1bvEx7b1Nw8wXDDhnTzZ5GBLOg2KiCrqLPlTKK+HUS7WoU8cboLsWDRM3ys5KgEO9dETOM/Je7tsLUs614qwysk944lrTx7Bz1EfKgWlZRyy9vCygx/DWkOuCA8JzTHjPU1FC3IpS37hJLe252qkTQ21F0qPVcjfg83VeQEYCctBsIhFjccJdW4pfn/iHA8vsMkb/k8Um77Tv+4dC/WRoDrudnZ3UW0tNoHzM2ZswoRLWfc7+j5i/lilBEP5MGKsR/4UAV6IZlaA5mZzYrIKBF45ZnSWjNwImUD7fk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(39840400004)(346002)(136003)(396003)(4326008)(478600001)(2906002)(6486002)(6512007)(26005)(1076003)(2616005)(83380400001)(186003)(6666004)(41300700001)(8676002)(6506007)(52116002)(66476007)(66556008)(44832011)(38100700002)(36756003)(6916009)(316002)(86362001)(66946007)(5660300002)(8936002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3VlYvZrKFuComN92jnWJT08h+JTaOUblGA/I5PnXSXxHxnGqEKWVaGrT/W8t?=
 =?us-ascii?Q?F7tM3X1AoJ/nM3yoGlmE/S6xNFDJlGy/Qljp6BuBDfFrxWIp9X6XbhU3Ew38?=
 =?us-ascii?Q?VdB7GtpUWAiflbkPC6NOoo/VNHaLYaKq0YGyL11s7Pvfl4u0clnsxEvfL65H?=
 =?us-ascii?Q?sZRxNp/87L8G1ETLOJyrUPnXh65AKYGp+EsA+EdR3VbjBcOUV4KjpJhl30b8?=
 =?us-ascii?Q?DC5gZMgZN/aVSUFm/JcIuZDjPKvhfB6tGK+4TFo9wv37d2YSQowtpLol7Mps?=
 =?us-ascii?Q?xmZtsmsRGNHVIr7Cm+jPKZytpFDIyAnDZVXXUKnuIXzk983LTo9ZgsvKTvYH?=
 =?us-ascii?Q?uWb+ku4RDYFKZZsiDN6mKtpqaNy0BmPvkSkstqKUyMyaLCAIeM2OpQ37kXUa?=
 =?us-ascii?Q?pGDl4RM1Siz7FourOI8OqSw/g1y4bpvor9BizVL3b5Xcsb29J0FxZTBuoGuM?=
 =?us-ascii?Q?o/iFyQlNsv8kRBuPh3CRwIigkxeyd0ePNDmFvW47ZPUe4PvcNI4mn15TcGtB?=
 =?us-ascii?Q?51Q5VF1tivpFKwS8wqmutUmfM2Oe5QrkavUqfVhPY550m0zi0MiTiexSs1Pv?=
 =?us-ascii?Q?G62Kc/vnwsyvSIIv67Cibl9TfUxg532oRdn9Oeu7CLubzswjkDvpijiC2MvO?=
 =?us-ascii?Q?tK+xGzBX9rF7mv8pMcyfNvpZhf+9j06hFQQzJF8+dw/XNcub9qNkyEYo2PWM?=
 =?us-ascii?Q?xXhJItbGJKRZONxQNK8zx5GIdV71LC736nBSdalgA7php3d2oVCEfcfZ6XVs?=
 =?us-ascii?Q?8s4l9uFlgWGAl+PrKJ9yrhu4XcOlSPMeC2j+HzomUuz7jnwjIo37Q5Hqv97R?=
 =?us-ascii?Q?PwKQQC2T8P5wHReFN5NH5n/0wpg2Lioifnx/2o2eBwIjbHwPcbaCPObXtpoA?=
 =?us-ascii?Q?qhGIBqCnwBD23WccfGi6P/WzQDdmhYhHNfkGVXGCmKMlJp1sQAnUiA7FrHHi?=
 =?us-ascii?Q?gSkxT0FhucFZ5o/9sHfcsBPwwgxRb5fLBDdiQiTfwPQ65wK1UoBtdoZFm6pC?=
 =?us-ascii?Q?wg1t6OsqS+aTuRDmI9VIoOtYQ1Ykfzq6lNLIDLiAzAq4VmIB5rC5KTtJRVxC?=
 =?us-ascii?Q?3O7Y7be9KWz1o3nIQZpKcTXiG/Pk5E4V9iZfM7YA85EpYUZJBzV5MOdmpSNl?=
 =?us-ascii?Q?Y3QCSkYTu7nbvZnIm6HzBQew85NPTJ0kiphXZZzFNdySvh4x2ACz6xQi5VYI?=
 =?us-ascii?Q?aoPjENs5m7IFtUMY9TekZIVd4L0ofyMLxHUawQoNOGKi0MEBCBUUE5Ibgkxz?=
 =?us-ascii?Q?r/Zq7pzqU6FCWtoDKXQt/wxN/opwMo5/BTvM3MoVky7DRdUH1/Kl3pvtYzLJ?=
 =?us-ascii?Q?Z2Wq1IUDj3dFk9vu+rozaN+IulwzmoUsTWjbpYvIwXtiC1YDRAUsqGsB9czT?=
 =?us-ascii?Q?bFK5cC6bsP17QyYoTBw65qCOleE1IubyZ3HCA0OSLCkgi1bws2//XzK3yPdq?=
 =?us-ascii?Q?8f4hQ5NC+pXHMAIk0FUm32SpHIU/KMCE+8R3vNOui74d277y0sVxvOBEAqni?=
 =?us-ascii?Q?1VnYwpMoQrbAks4GiNwf+0UspAUEajYxDRAjyQDsWrf1EneYVyuppXahDxAe?=
 =?us-ascii?Q?gYsl6mDi+87/xn+oe3qxh0EbhAjzE8HAKpnY+Eizc3wTpUXZLbNQtXsAdqHk?=
 =?us-ascii?Q?EXan8KHVrGrDHq2kpxIH6HA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd4fdaf-37f2-4028-2fcf-08da79369916
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:07:43.1627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjFOMS6NVUUCKE6bApkRDmbxbB/4LLbpTKSa0Ex/l+FmiB4UVrzIonJlavwpBadPD7vMPwM3qb8eK1cWqgOfon426a4uhqb0kMsVXjWTkIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8055
Received-SPF: pass client-ip=40.107.15.107;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We will add more and more checks of images so we need to reorganize the code.
Put each check to a separate helper function with a separate loop.

Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD for more clean code.

Fix a bug when out of image offset in BAT leads to image inflation.

Replace bdrv_co_pwrite_sync by bdrv_co_flush for writing to the disk
only dirty blocks.

Merge parallels_check_fragmentation to parallels_collect_statistics.


Alexander Ivanov (9):
  parallels: Move check of unclean image to a separate function
  parallels: Move check of cluster outside image to a separate function
  parallels: Move check of leaks to a separate function
  parallels: Move check of fragmentation to a separate function
  parallels: Move statistic collection to a separate function
  parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD
  parallels: Out of image offset in BAT leads to image inflation
  parallels: Replace bdrv_co_pwrite_sync by bdrv_co_flush for BAT
    flushing
  parallels: Merge parallels_check_fragmentation to
    parallels_collect_statistics

 block/parallels.c | 173 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 127 insertions(+), 46 deletions(-)

-- 
2.34.1


