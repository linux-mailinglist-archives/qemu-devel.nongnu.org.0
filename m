Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0043689375
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:21:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsE3-0007C2-0z; Fri, 03 Feb 2023 04:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsDz-0007AL-4N; Fri, 03 Feb 2023 04:19:15 -0500
Received: from mail-am6eur05on2072d.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::72d]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsDu-0000nb-Lh; Fri, 03 Feb 2023 04:19:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXbKWUmghEp6bt+PyPksZjjbMM4ILXUXTT4G5N2QgI+0EWzE+l9uL/xNzQTQQ9mbHNxL3+twt6yQv+I+R7kRGRnAoiLjWE/demicrc5jnhSGA4C045htLoC5fRokq5jABUyU8ECIDrTMK1B/ZKPETRyG3Olj5MwP/1Fa7pscWX+TNUCzsA9C/RW5bM9gHb0GOhzk8hFTeHfBBuIT5z4KItmDmCnw24SoPQ4zEzm/NIr++7QJ0d2kRo/pXH5cH676YqPkjaK66KZw/4M9D0P1pJl0PweBBs8HnB5jjhL68qqzQR8z3JEBAzJerDy2lrmaTQXDgxqBbkrlqX75GXE0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHBwjSWzr4Wn3aCb/vzPR79KwPcHKO5XovdQXtnJ4Lc=;
 b=U/aq8/W+e+9ZOJBCagWzjakFUnxd0jsXPTQG0vJhiTafr8Ez9i9QfR10FVjRFFwW84vh41KEgT8ukas3/rCW0VQQHWCUEbO3B9rC3hb7FN4L2Mf88EQcDE7wlz9LpZp+iBo8l8I3Q+Z+V3Uz5XsaMxNENczglmScQU48dD4n6qlHzG+jQLoHTDoejtLwY6buM1I0ypZsA6Nkz6L7yVJMAk86XkoVoaCWAz76eTGMcMr4Zst5Gbh8GScGP1s3FEZ5GIYffPwcwrn6qVijb+TGm04nmCxfssL49EcPLqfuiyumtSBPeWTr1dh4Oe2GkKOaSF/OGRpzhKx7ooK7f+HEoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHBwjSWzr4Wn3aCb/vzPR79KwPcHKO5XovdQXtnJ4Lc=;
 b=Tzhg+/sn5oqgNq5kmXQqBSYzoQkhiVIc27nywAtvrC/cPPtS5Of0HwaXndpg7AM17tK6JI+oO0qxCaYXRJmJsW1qVK7HPEbazN3mDRGFWoVDDuvkSKeUOeC3OQix2Xr9LS9M2exDX89Zzf+uMrYlsLl+EyVbAFsdtSs1PImhUtBF/Ftp7gIxKJawCZNJjAMz1mEAktY10QcGCPxrZLkNO1R3HZrbs2B3SGHHuZMLDaGuXi2uR10z1XJrSb62kYs2Nawl5wZcjMzapl+kUMBrRE4pt7rbWgLubYLU1WOdcL9os2nRqGfOi6kb1+t6XlGyHBGuC3ytyRQExQPVo0wf1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM7PR08MB5525.eurprd08.prod.outlook.com (2603:10a6:20b:107::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Fri, 3 Feb
 2023 09:19:02 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:19:01 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v10 00/12] parallels: Refactor the code of images checks and
 fix a bug
Date: Fri,  3 Feb 2023 10:18:42 +0100
Message-Id: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::33) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AM7PR08MB5525:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b928658-f107-4344-1a79-08db05c7b056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Rids3doJq/ozAng8BknGk7t6iDOaiPEJqy/sHFA3gyyjvcCpW66YkvGXywfOkWktikhlZeETW7gUESYtHbVKv1Zl6IFM5lt/hbbL/sg/FxK3QB4nNxWZpCnM22Gce1Rnwu/mvnoA1NE9XLg3PSu5YdlzAXlzLUbpN5p2SHrpVGDe4t2TXi5zoeaP8darudXxRJG0ISh8/eUAcPA15Uln/DtzDF7ySbONhux2IVMc5MyZBHbmJPUT7yGgsJntc1Ai6PHEL7cOh9BmasHfKCwzzOj+9ulxhtSldWBwt+RBmcOzbSrQiPkHtqxrpIsq3vHChAeRYc/njH/JgOeyhp6RNekyy6JJE5NzXscITcUovIwdP/PuD+3pvFqJLwyTYddQtsdjreprUNqmYa3IjN5qk1gN37zrv2cYiaqRpNuCjrBP8Cgm0HAvDXIfokM6558tTPhv8+1rfwMqd5AJoMhGSKq0TKqnwWojjgq0jqmQlmfJ4iyrVMMAWVg0o1X5dlNAMuArj/+pGaE7e6lpiuaSQWlrV0edWcJ/no7I8OCZ1/Z5xvdw+qMQKXs3ijE1rhJqcosmENpeSElz7XeY1Qv2KSDk+rJtO3sBZtwBZgG84eCUO1R+X8i0IAm8jto1PSVlFKjY6E2GC5BMchiO/JpiwcY81nF5JxSR07r9CpSug/KrNF4KdTk6RxJU/1zqaNd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39850400004)(136003)(366004)(346002)(396003)(376002)(451199018)(36756003)(6666004)(478600001)(6486002)(52116002)(6506007)(6512007)(2616005)(1076003)(186003)(26005)(66556008)(8676002)(4326008)(41300700001)(6916009)(8936002)(66476007)(66946007)(2906002)(44832011)(316002)(38350700002)(38100700002)(86362001)(5660300002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zOneabc7pHVNGc+3A9MaQ1sKzY3WayyUUMJYxe6LI51sBcf1ecF1Cwn8sL9K?=
 =?us-ascii?Q?LTINVLEBcj2oEKNRNnlOPBF4cCdEZU2JGSJ/1So+2ayuiG8SWVaYj5l0/S1j?=
 =?us-ascii?Q?Jv6bgxXC3eAFgr5T7uMGrVVJcCCmED2vKIzdnx+yzjiw/mXyX7xHrXplyBMT?=
 =?us-ascii?Q?mkKe9ciKDioPjfIH5TUtYdr0fH2xlhhHObAWLXXreSBnLXhvptMfpO4Hsd7E?=
 =?us-ascii?Q?ZnOvYNqXRZQCNNPrxvNueqpR5UfwQ4zx3+tBd7lUQNeU7BoUXRInuHUHT69C?=
 =?us-ascii?Q?EviUovuiL1K9NZqI+V95itcQFOsSKtJyNTTcRlmEszH1LM6LHHus+6fJHmik?=
 =?us-ascii?Q?hRSKCkOY1AgYbYTgPhI50nphnZzETPjy5/N1/2L1rgQgRJsNeAAYxGEcARPu?=
 =?us-ascii?Q?8hmgJjIgeJuw5cJkmemjbvdmLhh8x2zZL8Q1MAltmdmFJiJBE/vSVfSfWxiI?=
 =?us-ascii?Q?eKR1jLDhjxzvXKF7PuR4hzuepCVIvfytm3s5BBnvtLPvxFIlqqGhsnKILB2O?=
 =?us-ascii?Q?5rcvVSxLnXgtjp9pQ0/d9eKq5sEJaVcQMUftxTm26bceqWknFNKLtLTI5jhT?=
 =?us-ascii?Q?l4Mupi7coP9bXLyXj6gw2RSyqZ5jS5f4cXFQo1I8t6k2AtffAQKGSpW0CH0A?=
 =?us-ascii?Q?i9sRXCRaEGalIzyyai6WR9yNWhSUe1KeyubW0wFdb9ion0PGy5XrBuhnSp/E?=
 =?us-ascii?Q?CDuUUquaWDzhVIYD3ZU/hUxie0pm8NjUkmF5TkKHL18hPCUPcJjLsId/tPi+?=
 =?us-ascii?Q?kRqM/WcTl90VMPwMHaPbUxVYywJEQpqqm4rpYv9y6a7CfYbB48jVl2dcp1mQ?=
 =?us-ascii?Q?B6fXs+cCvvKhr3PeAIiuHLb+cGWBSxbZjKM1YriuQxY/bO6syixVhRxUp8Vw?=
 =?us-ascii?Q?Ybjp7FBP1y8ItCvvA1PIXI+nUsdBJ/7u0dlLGiAv93AUh9i6vquvoz1iDrE8?=
 =?us-ascii?Q?vBzNGz1pmwjSNw158WkfFFdAxOL1CjMjJEibU5iCmnzJQQsxKkHwHUGeNYeh?=
 =?us-ascii?Q?kkmAtKibE+8B1ROmgMusa8OieKmNc/nhGeMw5bc51J60ZdVzcyukVrNzjoSu?=
 =?us-ascii?Q?8Rl1ecEEgBhA7E3JB2F00VpXwf/Wzv1LJarTIiP0pn+ZIvbcFIfKhElM6k47?=
 =?us-ascii?Q?TKXD6jHW8N600nq4pnMFsNEnz2PNvOZKT2xVu6SJf1IYlXaXZErMbNTudnQS?=
 =?us-ascii?Q?vi48E/ZbJ9Fu/8npFwHfA5Re3AQypv+gOBWqjtEGqEtLzlhRRtHBNf2loI96?=
 =?us-ascii?Q?GW1yhMOXvRTbAITcbGyOiBgJ83xWsU9Ct3Wt22ErwmZc6yqIV5nIeB7gF/Pq?=
 =?us-ascii?Q?2Rm8UrGsMZUOEA3KCBzdZCpFgtC6yTRVQajdefbz1WXAWxfv445oZ+XOBKzu?=
 =?us-ascii?Q?PmBzIiHXCxsVsP9CaeVqLK0aMXWjWRwY4MTNKZAC8T3jqydL933Pg/Pp8liV?=
 =?us-ascii?Q?y6NiQiFdhN8VurKeMz8WvppiuFHHF8BL/ZSxl1ExiZYEsmcHD7gCQSUuGYwG?=
 =?us-ascii?Q?FtCrB8q55495uPid80GT1KQ3DDOxoZLLHmLjnfooME8hEK1tKKFTphaczag2?=
 =?us-ascii?Q?XAPeSKzxWmTxvWfA9X4DE76MqpBoWgr/yadv/rNVw7j3hZy7svdHsIWHKMz/?=
 =?us-ascii?Q?4C7wPq35c/J+pJFNxPBY4MU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b928658-f107-4344-1a79-08db05c7b056
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:19:01.9370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGyw+YvgJLY2J+/0ack6zwjXw5BhSw3OGDZZ0wnmWi8dbq1CJCRIGoobWcO9SYeLNqHosgPwQVdHyJ4vTxJMTGCY2s8vgl99JZXzhhsaMiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5525
Received-SPF: pass client-ip=2a01:111:f400:7e1b::72d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix image inflation when offset in BAT is out of image.

Replace whole BAT syncing by flushing only dirty blocks.

Move all the checks outside the main check function in
separate functions

Use WITH_QEMU_LOCK_GUARD for simplier code.

Fix incorrect condition in out-of-image check.

v10:
8: Add a comment.
9: Exclude unrelated changes.

v9:
3: Add (high_off == 0) case handling.
7: Move res->image_end_offset setting to parallels_check_outside_image().
8: Add a patch with a statistics calculation fix.
9: Remove redundant high_off calculation.
12: Change the condition to (off + s->cluster_size > size).

v8: Rebase on the top of the current master branch.

v7:
1,2: Fix string lengths in the commit messages.
3: Fix a typo in the commit message.

v6:
1: Move the error check inside the loop. Move file size getting
   to the function beginning. Skip out-of-image offsets.
2: A new patch - don't let high_off be more than the end of the last cluster.
3: Set data_end without any condition.
7: Move data_end setting to parallels_check_outside_image().
8: Remove s->data_end setting from parallels_check_leak().
   Fix 'i' type.

v5:
2: Change the way of data_end fixing.
6,7: Move data_end check to parallels_check_leak().

v4:
1: Move s->data_end fix to parallels_co_check(). Split the check
   in parallels_open() and the fix in parallels_co_check() to two patches.
2: A new patch - a part of the patch 1.
   Add a fix for data_end to parallels_co_check().
3: Move offset convertation to parallels_set_bat_entry().
4: Fix 'ret' rewriting by bdrv_co_flush() results.
7: Keep 'i' as uint32_t.

v3:

1-8: Fix commit message.

v2:

2: A new patch - a part of the splitted patch 2.
3: Patch order was changed so the replacement is done in parallels_co_check.
   Now we use a helper to set BAT entry and mark the block dirty.
4: Revert the condition with s->header_unclean.
5: Move unrelated helper parallels_set_bat_entry creation to a separate patch.
7: Move fragmentation counting code to this function too.
8: Fix an incorrect usage of WITH_QEMU_LOCK_GUARD.

Alexander Ivanov (12):
  parallels: Out of image offset in BAT leads to image inflation
  parallels: Fix high_off calculation in parallels_co_check()
  parallels: Fix image_end_offset and data_end after out-of-image check
  parallels: create parallels_set_bat_entry_helper() to assign BAT value
  parallels: Use generic infrastructure for BAT writing in
    parallels_co_check()
  parallels: Move check of unclean image to a separate function
  parallels: Move check of cluster outside image to a separate function
  parallels: Fix statistics calculation
  parallels: Move check of leaks to a separate function
  parallels: Move statistic collection to a separate function
  parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD
  parallels: Incorrect condition in out-of-image check

 block/parallels.c | 192 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 137 insertions(+), 55 deletions(-)

-- 
2.34.1


