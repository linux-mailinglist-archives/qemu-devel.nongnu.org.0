Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5F66EC901
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:33:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsYS-0007b4-43; Mon, 24 Apr 2023 05:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYN-0007Z4-HQ; Mon, 24 Apr 2023 05:32:12 -0400
Received: from mail-am0eur02on20719.outbound.protection.outlook.com
 ([2a01:111:f400:fe13::719]
 helo=EUR02-AM0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYL-0007Ri-LO; Mon, 24 Apr 2023 05:32:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IL/9I12MsjYYXmi+NaaK/OuyKuKOXuXIRJRUTrVuMYAQ3Am2UXPg8DUSEEiiax3fhDbq/pTeQReRWZSDfisgiyavktbg1uG70xgVszwfJQhqF+q2eTMqXXnWTvDR6E/uYEJOELaygNf5EP+4LVPC+B9Q3J62kX7wKZRJQ11ij52rpTvXxu1+DzJPLXkyf8R6ObqENvyJYHhX3YCAe6ArbtTpUH3t7BX9Qmmt1jUKFUglPTinBxiQIBkerb/s+w++Xd0AZu12i3hM0mR2PdXRGBnLbDWuBetTrw/8L9FdDQC4vhihaenby6NMvZ60U141PTHWumZiN1JTs3kWXHnbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV+O8VB011TyKZsfw+zmWqVBKFV1FqKWJbYlvULIEms=;
 b=MP0j+EuaQKBKyLb1QoJarjs3ioYKeY/iCnKXt2m1W6htPbubi1wL9pdqsMl+NGq4Md7Tu7mnOC6q5QQo/mr+6zY3XrH+gHD+M3AIcTqMF0F4hOMnjwntWoVwbZgR0rWNs3L8eGDeUwfVVtRRGvxw/sE0a1SVqlncKGDu0EoZuqTex0PHYiXni5/uLHttobtvRBA8+2fWDGoz1e3fMk7hVR+BiIiyGEIAYaZs7UyHcUbEFMcP4BvtgU7J0q7Nb+SZgLaEVSWFxrVvccTQ6wH+zMea+6c+NlhlCZHMRaP3SHGvIlP5HzjBP1yQLHZFATiUE0aDsoRN7PwYmFRU1I/51A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV+O8VB011TyKZsfw+zmWqVBKFV1FqKWJbYlvULIEms=;
 b=fE/vZLfnB6r5jIno2mOr02fiDMjznf25PWBsx3UJUgqb24j0KjdbKTSSifDd5F35HoUFaKlzXcRe/c2H4yKxWljLOvoh2LrF3x1X1wfHLARAka0uYRmk1+uoA/iX5R/adq0QBoIWIZcsSp/Wp2AnJKrObZ/l379vzqc4XznmUzvAZdUiaMZXbHfS4cIA6ZIbZQonU13g3yzl1VmgHidfZ5NaMGAYrOqjMu+hoziRFB1A1fOBdz3rsznWazv8wcG1PzU+BHBDM6VFD2qqau0DAW9fPi/iEFokvsBqScDbaqb2jjkDb/t4YsGMFPQkq5TD2MJeWpdFDiWtKI68+te/fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB6077.eurprd08.prod.outlook.com (2603:10a6:102:e7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:31:56 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:31:55 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v11 00/12] parallels: Refactor the code of images checks and
 fix a bug
Date: Mon, 24 Apr 2023 11:31:35 +0200
Message-Id: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0169.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PA4PR08MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff9f610-d23e-454a-bb21-08db44a6beb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OBoSBptZ2s9i53Es2Ney4W7LPldS6xtiGPZs2CDAPCujtnI0R4cc0RmkMoa+7k/C9ynjVMF9LGQVc3nouQXp6JFM4CRnfnQZ3iTa4k9z18ADA5MeFUnPDLuVAq29jFsKWafaLmcjPRw2NBz9erB8bCukuZxfPqIaQre9l4MeQgrirgpf3/JBN8s88VW4GOQVuLYvCaoz6XBzWoUhLNE+IMI0qupxggn5J8yIq7WcYe/qZvXKrT3JDQI1dyzov4lQlAaVbc6upZXKrkvkYNSPiNxShaCAB7tGUm5yT5LiYVuJAGtNBeite6Pm4TblDOVJByQD0Dgt6sN7S5EscZ9aCcbhKQhPlgaAKq8ZAnqPPK0QKMpMmspdLpjfm4yil8EQalqqRH53Iwo4/VTllJNn/+kyN0CSG+YPIWcW3HotIzbj4oT/FH/G6G0+P4GEJeCCzvrnu3t42wsnNKVxjb3ilXw/tTM/6sdyajyeiSK1Q+lgoTrqRJg8U4evpunG8L+3blyx4ZOeEt2gnJjUiOY1vOtypsOJvD54Q5W4g9h+fvsaMnT+p4OE2ocSKxhxztGrJtzW1dTwoQO0CR84lTU6OxWoZL+QSYPbYTajdg19vZ4yVNda1FJIHpal/G1l/U71
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(451199021)(6506007)(1076003)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(38100700002)(38350700002)(66946007)(478600001)(86362001)(6916009)(66556008)(66476007)(8936002)(8676002)(44832011)(5660300002)(52116002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h0SSA4nwKV7g0srlF+BAhjYV6hLvYfPHqgHYrhQs7V8xJXHkuMtG1BH99DP/?=
 =?us-ascii?Q?9M2KW5uns5046BahWDMXn7pjb10QoL++mZ8aYALwc1XDbBd8wxDTIp5kdQ45?=
 =?us-ascii?Q?nLATx+BhoOZQcGYXzy/FjbB1lA8mdIievFeUtUWdIKOB0YWF0lj+hbWuxZxT?=
 =?us-ascii?Q?WCzgo9BVq7ycsKFa/n0wjuMejvryvnEazHBkK2sfgtBZNWa7r3bfYLvsgQXN?=
 =?us-ascii?Q?WvzVRmDQkLT6rtYamPqofc4HGn3Y+0oL6qiveYg9CqRV7RdAzVzB/EwE/fpc?=
 =?us-ascii?Q?84SuwMv5VfESMdgs/rQ/8diS7YXXCne+842oTuJCTfl1Zh1TzAKdKLrXp0uy?=
 =?us-ascii?Q?PCg69X5ar2qHm/rNd9MCfsdFY5jl52miZTSmVT3mxLwiFZN564b2DIrkhPSZ?=
 =?us-ascii?Q?Y/lVbhoMjg+nRJ3OGN9aPf7/CeewE75ZlWkRyGPmpiD2d4sqzhY1jqnn/5rZ?=
 =?us-ascii?Q?RoX/F5wpshz6TByiO4jRJ+/RyFrIXS6WEfdLD5nEAhJgLtdx4JJPgr2y5UUz?=
 =?us-ascii?Q?szT/hlN3sEFUHxi+C4uofG58IJR6kh7nRuFYbEbKzvsUniltT9AwK0AlscRw?=
 =?us-ascii?Q?/LHCVb6Oe0vPBgXS4DyAFqQKWcXCcJ5e0XS7Z69EYjb8zk2MmhH2/iHSNbJG?=
 =?us-ascii?Q?o+0MJAoAehBnLoScG4qnUohxwJDhuWZH2Ly6FrIBJXzUkoOpY52hNQAXDuSs?=
 =?us-ascii?Q?M5IdTQJ5VpGMnNMBq+l+AxI1meDrHW1taR+7WiEytipF5E+yL48gHLumIcWq?=
 =?us-ascii?Q?dPzb3mRVMIVnG9fgGDI66cxY5+tvvMITKSxo0opD96IVER6WETSH1e9ySfRr?=
 =?us-ascii?Q?eQzUGWlvp7oVP1r/V5gV+XC6SY+YY7QiwdDHaVndUZ/Eq+WS649rtWeW+wQD?=
 =?us-ascii?Q?d5RUuCmNP/cQR3YqrIG4AbbdaWsKX8CG2+NiuC2FKmh945tMLhECC2cACsJc?=
 =?us-ascii?Q?JEg4Z185Dx/ptbwQ+/pwu2LKg7oIJ2pAfJqcNbtCjuijX0PvRGWuAGYnJfeV?=
 =?us-ascii?Q?5mN2V1ufpDZjuOPkg+wAXyxlkBOkvLTNycp3+XsZ6XOSNakqObmhZ8rqC8HP?=
 =?us-ascii?Q?Qj3USE9zUR0sSJBIx5kxWxo/6j9eS7Lqu+P4DBQujRGQ/KQzNfoLWxTOJZS0?=
 =?us-ascii?Q?LhbkkoCT8so4QV4CFAZ4I+uVJ+VHObhUUOEWD429WVzDOB+kPTcU89+5Mqq6?=
 =?us-ascii?Q?9DPloDnMo9WEMN4ARMSOEyxZ2jFztp81doccLExTgWqwhxMl9JtLIiW/5EqR?=
 =?us-ascii?Q?7OUPGq+OdLgsBvryi1BHBJzztZFNQWN6+dy6sGu7b92v1tJNveOjp/qv9LF8?=
 =?us-ascii?Q?RJkpUdYOFKgZ1WVZMCABqetNHPVK/v56Fg1T1j0+lfJ2snfoJN+nSaqBsFOC?=
 =?us-ascii?Q?5AK1wQTi3LKqmE6HZ+akww7AyJJ7zJmSkAzHvDWWCvjPnnVDVOHaOydid9Cs?=
 =?us-ascii?Q?mELEYBXxevpWDPM95eTsb6WwvvhiKhYWg3qktisJqa2EutMGpswNkpWXrVTp?=
 =?us-ascii?Q?W8Cd/qnPy5M9tnhUbLL83ocOFozrVs58zbK5jONWFN5g2MlgyICYvFHIymE7?=
 =?us-ascii?Q?0tYdeBtHLeicfRmD/WLk6n4Kz8e6eoOQYwCJ9y/iXTZ1dMgZyYH+qaJo+bMj?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff9f610-d23e-454a-bb21-08db44a6beb2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:31:55.9085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3cRvTUpJjB8pWj+uIcSTkOpZRFreyOoems2MTCqPMMxaDhFJsTFgEoHibqG3U++8IAIbkSdxKO5eeXmgDhBb0eQYvBc33qmeq0PPEmgzEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6077
Received-SPF: pass client-ip=2a01:111:f400:fe13::719;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-AM0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix image inflation when offset in BAT is out of image.

Replace whole BAT syncing by flushing only dirty blocks.

Move all the checks outside the main check function in
separate functions

Use WITH_QEMU_LOCK_GUARD for simplier code.

Fix incorrect condition in out-of-image check.

v11:
1: Use bdrv_nb_sectors() instead of bdrv_getlength() to get image size in sectors.
7,9: Add coroutine_fn and GRAPH_RDLOCK annotations.

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

 block/parallels.c | 190 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 136 insertions(+), 54 deletions(-)

-- 
2.34.1


