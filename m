Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E4F6EC891
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:18:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsKU-0006Qo-Po; Mon, 24 Apr 2023 05:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsK2-0006Pq-Hp
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:17:22 -0400
Received: from mail-dbaeur03on2071b.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::71b]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsK0-00035C-V8
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:17:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyMN2hP1NM63QT42uTgaGp0PRa/jUV7ldV1/q/04FHHBIln9v7cTCLQgxruKUhIPHWa5FKSbZpCGPyymJLRYq4xGM3HlEUw/mZsMCu4bMzT0UzqAtwdolI5/ss4strT4/817miEa+I8uXo0zv8VWOYB89AHqkUXewMS/I5GDBDKbJtH0xZPDPxrL0TE7Y7KhjhPns4mdy+XyLNTeZ9Hdsm9+pwmnaQjYuE6IDKtOdBytWWaYVMZyW4jnEh9LwwPvVfnnwUFEmtmHGR/Fm9aN2Qvx5QZRViniwYtYc8DG6n4hfjwkLv/CucQYpGRkcyXk6aar09DkFmQtOFoSK1AuCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV+O8VB011TyKZsfw+zmWqVBKFV1FqKWJbYlvULIEms=;
 b=kdfT8+AiDseuQrNMZHmdHGh1MBiKLkYu4qqo7fmZd+zxdMp99R1F5QvJ6h/nvSlnGRv7Al2LqwoiV5GJY6GkLVng8oFrCXsY4AqMi9ra18M8dhmoiOw7kuJXXzQidRZksALUQJL2jDB4Ffd2jKNQ8kbFNVH6OW2dQG13t+nUfWKnMBdpM24SP4EvD25545e7EojPJku4qfW7sWryA7wvrxHzw6KTH3KrAVQcFA6kFCWRjJ158C8XPnc/z5zXzlWwO+Ww2w8aTtH4X8yraSgsn4QLzY6vH15L7MczCsAvVGhdCOeCiiinogFj/jn5JOj4TLlidDLziaZf46ciukwGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV+O8VB011TyKZsfw+zmWqVBKFV1FqKWJbYlvULIEms=;
 b=HwmtsbXZCsxYwd2FWkfMumvc1KNzs6AUBEijuJbtFHFB7JrQrT6m5PCiZZz5qWD2xdL5Qdf72e0Dzt+FLC2SOWlpz2ZnIu7SsKXx/SdN9jicd2dEzQSwEP6w/150D4fkM+gHDIFaWNbsGhtWkarmHeqTMsT6UoLxoCb93dxI72JAXtzSJasOvxF+RWEV/TE/r96EVXlHJsiHRC/mrAbpTrMuv39lDXZ32Wv0ltChDVpWomchpJt16sT8eCUe2fJnGyeUUb5B4pJqdlZ2gbqRXiw84GPl357/vN7bLTG25gv9cBCaglPLmkqwRMcnDCe/GMheJnbID2iqCcDA9Ai4Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBAPR08MB5832.eurprd08.prod.outlook.com (2603:10a6:10:1a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:16:43 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:16:42 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v11 00/12] parallels: Refactor the code of images checks and
 fix a bug
Date: Mon, 24 Apr 2023 11:16:14 +0200
Message-Id: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBAPR08MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: cb49db85-025a-4ecc-406e-08db44a49b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZgv1DHX3Z9VBP1o4b0X3VM4I5kOzfoBzT3+uBx1nowDziQcZdkcwVICtcE0R69IZ+zUDKP3bgAXy/SvPKcU2fsilNEhn9B/Suq0CN3G5qDGmrIDq2qsdPlgaEJ83MtStt3yCXBjCnI+3IJDXMaLT5KLfqveGRKpdm6GdsFQXrrccA+UR9jnr7Q0WiPHnTShJJZdfRIjU8N3xFD0uhbmd/NOX3Yx+y7EgePFrZnOnSypR0hzVN7V9bWuyW9qjQ9bfH4VtYlEG0mQ4SHcVL6Z2PvXi6ZylNazN+qw1N60Nn308VorcUaK9NtU2Np/QpyrkPPc3cE5X3rvr5v4x4ZjhC23kFukIeSX4p0vcOkdN4lf31DvJTTRirF2qJr1Sy1ybtkN7FosJM5NqbUh9X3f5iJo8Trvb8iXqe2iVY00mYux2WZo7w8aUHTKRMZ1vDyb7yvF3uByUicVPG0KFlkD2yEG+EdRmV2XdvMwKo1GUCg534TKLOMCYLVObWNM15Z5OUGLUimG93k12E6IB4RJ/vC4GQeObfVxc9F61f1mTEBII9hEYxUkEzStwer2qGW/3vLoaqAqrzpmUu2TrJb1wE8UVHF1gAJiFJCBLIuFGnuNGEi3YmbJJG46SbwvaVKT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(39840400004)(396003)(366004)(451199021)(5660300002)(44832011)(2616005)(86362001)(83380400001)(186003)(6512007)(6506007)(26005)(1076003)(38100700002)(38350700002)(8936002)(8676002)(478600001)(316002)(6666004)(6486002)(52116002)(41300700001)(36756003)(4326008)(66476007)(66556008)(66946007)(6916009)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9puIkjOxSCPJsWsaU/s+MujMWVBwNsibYvgvJTUYiq5MslP0hDaYkC7jLmGj?=
 =?us-ascii?Q?IxuyjLdbP+8lkH2SSBpm4PSb+puH5x5GJ3opuezBnGD9FiUGzF479X4zxWg1?=
 =?us-ascii?Q?9Ccvz+eZVrzdY7gxwU1fkRXUuDWWZPAL615V6MhbcOrGBF2JI9NdOHr6gWom?=
 =?us-ascii?Q?kQTq4GYKz8kICzBqYiLmsbFMOPcDnwKdmiW4IFn0eRUxNJAYm5iIebPurdzl?=
 =?us-ascii?Q?NGz0dbiwBQhLauAooHYJMWuOLxwelaUojiJqbfxQJY9xd33bUoX9AgK2mSGE?=
 =?us-ascii?Q?S8qw8/gK6TTHDlIQcziZCU2xleUtT48YYxq75Db5H3/Y1fShCihqtqcptOSU?=
 =?us-ascii?Q?ofPxjJ1qOPI4Jn23M7XzqljT/dyfDC2rcsrQIxEGPcyeYrYGL7ufEDFhbX8m?=
 =?us-ascii?Q?9aEeAlpoxyCCXwECLSuiOKxnpiWqHMZQBI7GYv0ti1wcLxIWUrQdsqBVcjqv?=
 =?us-ascii?Q?M/hnIdTJgc/fGrAZzU0xKCX8xcbNpYPUiAnMrxhoWgVAaSTCHGJUEXhaV/GG?=
 =?us-ascii?Q?L8RuPOAaj03LoQmjIA7RWogNePqf3iOZYifQ9BRV3F1LEEsgWlXh7ctmooln?=
 =?us-ascii?Q?zngvxslu6+nFoZfC3ZCq0wYfinZuaM8LtRAgDRHmvbq4be8n9COOo9PeOQEC?=
 =?us-ascii?Q?WiPEID4DToWO6rPPAasCxBM7KRPwyqdBnP1F8zBw0XhXOzkET2fIWeG8qyzs?=
 =?us-ascii?Q?+3RYoG31w2IIXOHDoOkNxkcIqhroAoZI+azUExgFrxPwysRtqxP7J44VMJ3K?=
 =?us-ascii?Q?6n6XrW3g9Qs4S0VynFXGcRR3yMeB2hUCm6WZBHrMprgYPlAJwfnZoXCpexQC?=
 =?us-ascii?Q?HOlGXtfisd8IyTZzcFd//Olt9+cH4rG73SgQfFTW/09vCVUAzR4yzJvms2m/?=
 =?us-ascii?Q?/fDDv5DKsm0NGFPazhN31+NQvULh6dOUJ8W0eGYVCEOq6ODvL/VpoywgDm1H?=
 =?us-ascii?Q?AUcBBSM5k+2qUCWThsCpUiXPpPXcsI24VPvfNGwYpEVyFaIYih2t/hm1Nmu7?=
 =?us-ascii?Q?2kfEY+6+wP139CtcuWWKGMKClU47uV4ezsEyf0SHP2Ujdy9/INs4q2Bpzk1F?=
 =?us-ascii?Q?GQUjOzT50mKgH8QCKKYGq6CWVRE/vsHXA+VpJZSYGJaWRGpdbQjLbcW/JIlN?=
 =?us-ascii?Q?s6U7ahIzwQ/N4fVmjyjl2fq5CsljSaCi/pIcnTo9bIgoGObuEXTtbb/XPOtS?=
 =?us-ascii?Q?kxvQU5sNunLKrwWfsF3hPCKMcSa2J50Hr1BcJc+efj8Tjnt3cOF3/mFMc27H?=
 =?us-ascii?Q?1noFFFfEzMg67f9hyqEky+iN6RV+YXUnlcdxHAnECK2JZIfdS8QbHHhLxHGP?=
 =?us-ascii?Q?7hMvAAsdwJOh5BwDOOEfG29Uvf8EytpLlBc2tloEAFtIublaTZNudGcWHNis?=
 =?us-ascii?Q?fIIQbcDy5J6Re/RcEIIoCW9V9D108KEdachcrT/X4fugxjwy+my6vBMFCErF?=
 =?us-ascii?Q?bPm8ptz8MPutgMJU86G15Ldfiix+n4c+oJw4M8b/pCdsqetlmnZuLBESoZwb?=
 =?us-ascii?Q?YGu5+esqHoOfa67oGvVuYrJdXHGW/d2x/Z3+GDoij5utAU1TAIB+KEb/Ra8S?=
 =?us-ascii?Q?4tzv7ZfjOb3rYtOR+0ZbEpz9STA21+D8DLD6nkyEEsZB6Ar8KmwB0ZptClQL?=
 =?us-ascii?Q?Qw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb49db85-025a-4ecc-406e-08db44a49b9b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:16:38.4749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ok6Jhm/OyGeTJMBjSkGXspscpsw6iD2RQEDTaNaAm9WBoyByBAwnUoxrRXY1I9J/juYjX3YH6LXVwt7eSP1Opli9DVakMTZYlvBj6ltC8cY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5832
Received-SPF: pass client-ip=2a01:111:f400:fe1a::71b;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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


