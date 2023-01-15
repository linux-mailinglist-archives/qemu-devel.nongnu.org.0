Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCDB66B243
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 17:00:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5PF-0001ng-3T; Sun, 15 Jan 2023 10:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P9-0001iK-2w; Sun, 15 Jan 2023 10:58:43 -0500
Received: from mail-vi1eur04on2124.outbound.protection.outlook.com
 ([40.107.8.124] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P7-0001Ko-Ho; Sun, 15 Jan 2023 10:58:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9M5sbAX5pQXpnba6wQzOuZDOaEZIUdOhA+qyKIiLFzelUQupLbYbDdXJQ/Kd0utaJcls6C6CSY6HRVhh+dgN78gmpWyTkd8WHYbU1DnUiEoGUD6wMIp0Ea5Tw3Dp4ywOREreA4u9Qb5Hp7Xz/qPj9EykPekCxEoxrMlXcy7xdUWwpA56ZHr1vXvTW5haFaaCl8NpR+r9CFhKSg1n2RHrvIEWLznpRuwPgr9e8R5WdQK9K/9LzoA84GJZbhMiXI0vw/LVkoBxLaouGYE6qkLaqxgD7T5lgMcfvIheJ4n0zqdSGSdvbcbDN0ePzxhrZ9kIAhD3dPGeulKX8v0Gzij/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jN8RgkorK79wVMgslyhH+ZYUxnA8Ie6vmg6Dp2EXz1I=;
 b=IG9BXYj1tpLkUY+x2kaQrQXchODas8vLTO/S4tQdPnUPt7CzH+HRYIJEaiOQRoHVHwrGALFcRBELaOylOaE3rdqWfeeQoTHHtmQZl3dH71QVfXXen8FvWELu9vXM+nGzKEHyQPuGH4GxjNpf3aNuOozxjWe9jnIdN/2Ue/VXb7+o4rwYxcdEpdzubmeaeSoHcL3PH7dAdu0u2y6mPNHENHOTYjcqH/mJYWxRWNCiqppqHErIeAQYVI8Aou6hVc7+YxHqVqpmcfLpnz17fITwWuYTR4alUHhLazCdFP7WbV83sxCg5ZRrCTk+2AU6xb0yvmghDIyWj3/l0YbgYspodA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN8RgkorK79wVMgslyhH+ZYUxnA8Ie6vmg6Dp2EXz1I=;
 b=eaorcscYXfdPqNFwwluBF/g0ATNVENVBVAllbYygk1mFLDtVswyTu9jjBdtY8NzK1sp+7z00lpwsJHMyNyeiudcio9llkW+dyFsqnCjk8Dkriq1zG5QpiZE/9zlR2nKeY4VkdLl54+VtetY5TWpgfoznfyPTG+yC0VeaAK7YTzhzb0TQAQTfkbusLRtkrIEac9B/8cctdggfV9U/rW8gl7OX/K2XZXH1ixtJCkq077TIibV2CiKrsEVfXhxiX8G8uupQU0Q+VBWnaDFzw+AQ+gINdZqsy9Qf7zvRckxCSf/OgSP281InFiT04fPWD4NLBqa172ndVfUXuJf+XPaIdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB7857.eurprd08.prod.outlook.com (2603:10a6:10:3b3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Sun, 15 Jan
 2023 15:58:31 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 15:58:31 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v8 04/11] parallels: create parallels_set_bat_entry_helper()
 to assign BAT value
Date: Sun, 15 Jan 2023 16:58:14 +0100
Message-Id: <20230115155821.1534598-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
References: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0312.eurprd07.prod.outlook.com
 (2603:10a6:800:130::40) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: e5473b6f-5985-42ea-ba31-08daf711592c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K+lbUe0uGxDNpq38pkotjIInSdtlESCgjHA71SO4oV/VMm4mB7gYK4HNQ/icvKENTM+Sek2IwB7FtYKR7ppVM+Ymr7UannHJLRc64qd/+JxuNuHjmhZ/aBg9xVKELHKkCRScVFVxbfzOQIi3JGZm2NG3UXjRlGgv/Rsc8RZ7E3IZI5uY/tT8KBjBed3ALbHiKDtCez3cqqQLWbA5ulUXc+FlUCsVWvoVRAkbBhZyDkLJbFkMTs/OL/1bDTgAdNZtzJ9K3nMiUTSfXxEgpNMwDV/GlbSSx3JjQzNCYXzWir9cCJMHIWOFZZVRy3Xp8PiycHDOCgtaehD/7wCWB1C/uWXxLqkF+JB/uU6pDBichf7BHDz8iKZ8lKYUxz7HGkhS2MuVPBLNLUzZVfN4Q7JGDAoWMYnMaYpdNdggOK6HVITb+pD5J3zlmLN5xsmvsWJKoeLVwc48hUXUwlAzCF7yxG5iA2qtKjzAB8KwElunO2K92fEdXsqTkyXvRldcPJr9BmCtKzF+K15x+r3TYyfAnd/hT6doYaEZ9fAKhQGqJNj0GQbQdqBNFx53PcYC9zENtxIbV54p6M8ay00XZf1a1q7BYOrpKctopOpTwayvqrEzNg5puKu9cXsWo011Syz9a2Rqr8ch2DXjR+YQeBRAXOtfz1T6RhITNgbcyTbjiv3NTd3pDOpU+HYQS9mvkTGp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199015)(41300700001)(66946007)(66556008)(2616005)(186003)(4326008)(6512007)(8676002)(26005)(36756003)(86362001)(66476007)(8936002)(83380400001)(38350700002)(5660300002)(6916009)(478600001)(6506007)(52116002)(316002)(1076003)(6486002)(44832011)(6666004)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8jzp6XPZCuBZpPKU+PC52ZJMcoNM0cVVyr6jWw8MMFmhcgnkXEGXPTFvHQBD?=
 =?us-ascii?Q?/0+bEB5CE+r+E5vlJIn10F+1DgkXiebRbQa8lBq95xKE2LxMKi8aWVjTyYdN?=
 =?us-ascii?Q?l4a5G449J5yHtqjktLosvnXv0IjqGKZHax5E+kAulWsQSg2PRh/J5YYOVrRs?=
 =?us-ascii?Q?lXDjiuSonhTVDNLcQGpxiRzlToKMFvIBvOgIKofqO/LTBWeL8qU1GLTUWsDF?=
 =?us-ascii?Q?SNsI+lc8ArTgkSd0KKYxQrulWzAady7FwDE8jt4N1RjOO/VHYiY4Fkm0pJXu?=
 =?us-ascii?Q?GGB8xKGG+aeR6iqedxws1tIHEk6w0amOKEqhTFdLSO/6wIZ8iX5vYG5TvU2e?=
 =?us-ascii?Q?YMIhDSULiY8A7/h6dG29LsATI32kJ0gHJKiH8GFBNSySp3yx8f2fy6Ih3DEe?=
 =?us-ascii?Q?5k0C4HsQMFuiv4uMrhFJ8d1zaTthY1sHFX9PbRkCmxZ7Epy2+YE2kcUyTuac?=
 =?us-ascii?Q?hNDbp9HdDm500KW7QBm8k0SsJSSuFRT1CE0ehJP0WcePmrnBqiETPBR6Gwax?=
 =?us-ascii?Q?aXTB2xy29g7NCtU1UQg7PM1oQdJ86IP2DmKSY1pqtUnEqlcSWIRKu6uEmpxA?=
 =?us-ascii?Q?W27rTa9k942rAp6mhB7ls7VIQ87Ae5Ip5x9yj41145iLRKsaKZyA9kHoNUtJ?=
 =?us-ascii?Q?QP88X6w1iTqEeyRlU553EGY63PsE+rr0A8Fk8a28oQ61bWf4uMzPlw6OO7GJ?=
 =?us-ascii?Q?jqb21EH71R3rr9twsJs4Cgq7gRggDwzxM8LJ7PVj4F8N/3Oy+2li11HvJUii?=
 =?us-ascii?Q?5DiVLxcxI7nCFtw4Kxnx8cErexjJYLvIn/Lnp/GJxoXx9SEFWZuuwkLxWcoE?=
 =?us-ascii?Q?I/zcRniBtawWUAnbGRiCluI4c/p2K5iQUi7Tjfun0PkJLzLNcWGH6zoT3J0I?=
 =?us-ascii?Q?84wHmMgs8q44dw2822KBOwESHjfhyha1a8bSYlfqX/F3Amw0nIhjDKgqqmuW?=
 =?us-ascii?Q?5lItQzIw0KB54fJxdgZfDLlMRSmzCsIMnl1YgE66c2JERasd8x9JXb+npKUN?=
 =?us-ascii?Q?ZOA/Q5mvxwEQUO7zcw+dqGqPq3GZXy9UPAMsfjcLR94VTraH468mzz+nI2pm?=
 =?us-ascii?Q?oeuPj1agTtp5Q747QeBPokD32NJvfpt0Fz0FfGNF4mIodLY0a3G9TWU9rXF/?=
 =?us-ascii?Q?ZHvK5E9qe3+5RVITzVuFZtKDc+I58Fb4eIzQLui8uXTbAdWJCb4Un5gAzODf?=
 =?us-ascii?Q?Iaq6EO+epHEiBzEIVglv7BOhZCGemlDpWgbBlPidKAUuI6kC2IcH77wHgDYD?=
 =?us-ascii?Q?FZXatxcxYDEYfetqcG/Fa6EQnBkqX0YHGdHXXL6Mp6+6gYzPg40faICL4dfh?=
 =?us-ascii?Q?Hj/A93K+ZJ1iNGmJVEFtv4NVfP0BEc7g0A5zpYTULN/2/yp3kO2A+9PMAWDS?=
 =?us-ascii?Q?1CBbxaGuC4EsJG/dKhfPQ11JTEVRFg2kRHHx5fDDz8KcyN9i/80ecyF+asdw?=
 =?us-ascii?Q?IamhIqEFMKklh+Je58VgjSCNN6wyKtOiPaza+4wRw5/E2wdjTdVju9VUAOF+?=
 =?us-ascii?Q?qeKvzGXDkdwDLAP4P0zkHmgvPaHsSWaoSG3UkaGvzfOeSC8jd2HiN1qItVF/?=
 =?us-ascii?Q?53YXhb7wwCNr12GqHwaDsFF4+guFpqQVRU/QD2ReXNq84LvRVaAYyJdty3KT?=
 =?us-ascii?Q?1A8UoqSJLkxKFS2YdDStfL0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5473b6f-5985-42ea-ba31-08daf711592c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 15:58:30.9890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOZtgwtjznolVm1oxcO5JTFufZieJr+/RzVBMT0S02cp4gjA1t5uXJM+m+qfrEr7b2oy9XG0/DIvIJzz9BXVz3KYU9+Z0EJL9Dk+istMWOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7857
Received-SPF: pass client-ip=40.107.8.124;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

This helper will be reused in next patches during parallels_co_check
rework to simplify its code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 9fe0f33ba9..2144ecff7d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -165,6 +165,13 @@ static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
     return start_off;
 }
 
+static void parallels_set_bat_entry(BDRVParallelsState *s,
+                                    uint32_t index, uint32_t offset)
+{
+    s->bat_bitmap[index] = cpu_to_le32(offset);
+    bitmap_set(s->bat_dirty_bmap, bat_entry_off(index) / s->bat_dirty_block, 1);
+}
+
 static coroutine_fn int64_t allocate_clusters(BlockDriverState *bs,
                                               int64_t sector_num,
                                               int nb_sectors, int *pnum)
@@ -251,10 +258,8 @@ static coroutine_fn int64_t allocate_clusters(BlockDriverState *bs,
     }
 
     for (i = 0; i < to_allocate; i++) {
-        s->bat_bitmap[idx + i] = cpu_to_le32(s->data_end / s->off_multiplier);
+        parallels_set_bat_entry(s, idx + i, s->data_end / s->off_multiplier);
         s->data_end += s->tracks;
-        bitmap_set(s->bat_dirty_bmap,
-                   bat_entry_off(idx + i) / s->bat_dirty_block, 1);
     }
 
     return bat2sect(s, idx) + sector_num % s->tracks;
-- 
2.34.1


