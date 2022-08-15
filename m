Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6116B592B23
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 11:12:47 +0200 (CEST)
Received: from localhost ([::1]:35214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNW9O-0006QB-Gz
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 05:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzd-0000R7-B8; Mon, 15 Aug 2022 05:02:41 -0400
Received: from mail-vi1eur05on2121.outbound.protection.outlook.com
 ([40.107.21.121]:60736 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzb-0000Mn-1f; Mon, 15 Aug 2022 05:02:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kA5ICAOC+LINjy/7zrKkFhN3eS5koW5rPYnVqhx4Z5/veFIZb1O+rQE44rS1KjvgDjm+RAuRTmKTmTDJvjNvjLDrJrXzDpa/JyFbquRL2JuuivYKSEQ/pK1uvhvsjb6mybxEmsGNiY3dLT6HrpENdvtIoa92sufIAp44XOssXD0qkWPJjXIWZiqvYLZIjWRBLfOF7uFlp4aoS3bVOrE/GsH/Axez1V49nXk9OLggUmOjU0vg+sTSYWVbd6z4/aMjsp8gIk7SklWdcsOMNm4N1eFCgh1rM7x7RbIblM7nrp1+9jZ/OMagAguVUA7LgkVJ3UaCXgf2pfI1CZmHkxOr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzBp86pgnhluBiYfAuHw1k1RqIxCKbpvxfJfiGG/aPg=;
 b=Cylm8qkRgNH1ZURR5gJ9RCfi2UNiLFmpRrRYNMUVqnNunVV3YXCl5nhi5xDKJ30aVAB7RqYLF9t1efjXte6FvJeFD1N6biHmcH/uvgTwMWbSRcTr73AoU/TNC49TqdXElDG9Vy6l5fbMiYU1iCdHAU6BRdKPTEe4cYdUrru7ke1oqk/YfMiNyeWFjuXC9Img1wc+bzuE7G1zbYy57zNuBhcLsKDRoLBSjas2jt/o/xjod1D4BpEH9SirBuNgZyN5gGUXa/crbMwl7V+baEE5bhOQKLdcttzlqR63EHxgtrYa/TJdPPRR1sopOjqcr9bBMeRomvgG8mupBE7fnrCCrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzBp86pgnhluBiYfAuHw1k1RqIxCKbpvxfJfiGG/aPg=;
 b=r46k6+EF3snDXMICUHK1XAtT5CEywuNH4QK7WAusiMdwrCDEjm3K1qoiv8tdntDv5MXCEGK1M7mFy2zy6axC021bPMFztVjkep52JN4+QpTVWd4WbF8yM/1v3oaN5rWM6Q/H+GsuQDEvu0NZP3yEU1Dnaf0/3Wm5tRlwQwb03K0/KrM1DNl22g8NM2jldA39i6zmLyAKeMt5w+zFtR2N2I6fyvZgtF6pLai5uLL13a+27N+dS7f2E9O8DcJp1bPhmzrX0b+1ptMA/guCUScz+bkoxjj7t0VfEKR2BCjc6QV4w/UhZGtIfTSlZPpCt8nVtiESQcz2RRCTDTrBb7OFWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com (2603:10a6:10:2c6::19)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 09:02:25 +0000
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c]) by DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c%9]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 09:02:25 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 1/8] parallels: Out of image offset in BAT leads to image
 inflation
Date: Mon, 15 Aug 2022 11:02:09 +0200
Message-Id: <20220815090216.1818622-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To DB9PR08MB7100.eurprd08.prod.outlook.com
 (2603:10a6:10:2c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aaf1db9-e25a-4321-e162-08da7e9cdf7c
X-MS-TrafficTypeDiagnostic: PA4PR08MB6032:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jiBUT8HEjaSBEuv86NeroyQ0gV78uj1XklfQLHYTZgzR5IxMOngsOWU1BKYzkfmZcgtgWq/3ta0/iJXqlxE0m1nORHSNESe+1AYg5YsAdxkhxUkAr194uThtXtxF9obQt71gBSKNy6Nds2vkvc0+ARYzvMHYw2m5DqqYJVuyCTwTBz/k7AyzhRjPWBeuy2zl0tYM7Ny0z57bvWra+1AAsr490UfyHbtav4A32lcLt7p8tVHDMfHshxVJ7n1Fj68y7dy+Bvy/adoIJICc0NB8ViNi1qEXmZ3GgdG+swNJ36+Lqt19YptPPNXHTkZomjwCHPCqW+OqZpfn/MxEoW+/VKiatN3jWan2BYcC/YuqIJTGtNsE+wKL+VKr56fdem69cuMdpWzWr5TgM8JgbD/xWI+RgZ4iarVD5yixDwCWmeeVOz1J14gV470xd0rW0K7AAtSHyJilsisIHgwYv7amOle019woYnwNrwb7enTT5ksqHBDaIEtWGb78+n0vRy2XMKe+gHghaTUoOn78L/3s3CtWgA1+ZkV/08tXeX98uxLCmn5NLr2qVzeBlz4HYFafy67Lq5ux8Mshnn0OPQJddtwJ7KSJ7AbvIpGJCxb70L+FIILPdriS3oUc65Tc3Mo3m4X/zp3vUNVOUbSb80eq77R6wq/Qzv3wuOpQD/5QSsxcvFJGUlQOeOJuhamWCh0tBo5pV+dZyJDUzJnMIlvS+BSm1Wemdg/R8Gt5g7OCbGbNSK52hw4EkMwZ693dp5/5HQI1EMAP7t9zIqEKmIKaOxeTB9ZKvbHG5HJDtx3KYMM0odtGlDlIY0/hZRsi6UCX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB7100.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(39840400004)(136003)(346002)(396003)(83380400001)(86362001)(2616005)(41300700001)(36756003)(6506007)(26005)(6512007)(6666004)(1076003)(4326008)(52116002)(186003)(316002)(6486002)(478600001)(66946007)(2906002)(66476007)(66556008)(6916009)(38100700002)(5660300002)(44832011)(8676002)(38350700002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XC4mzc2PrK8vY8rJlTY/zUHRr2/++GKiGmPx3sikZ9tdfK0H3pmOypj7qH7m?=
 =?us-ascii?Q?Bqvlq0Y6JSEpb/eUySZsRMAz52qdM6Jp2ZJCpdROUHZO3MXEYgUXxNVPkynk?=
 =?us-ascii?Q?03bUZ+sG06LeK5ZpQTfE+kxDSGPKrVr2zBjKBjCmWGya3QM7l91TAa11Ifpz?=
 =?us-ascii?Q?GkngVtNPyKK53UZx98nGSQjIUbrfd7JVva1IXQVknQEcSn3FINi/dDxDJqea?=
 =?us-ascii?Q?1LphPHwlmw1ei+uJIHyKppNL6ILOzSJcCDEZbl6L8t+CHvEIBuo7PJOuHo0y?=
 =?us-ascii?Q?HE9+IfLei8dR0MCPpXGqAaOv0w7h5Jj9CHhsKIx62W8kmkTNzdRkE2MNG/Vc?=
 =?us-ascii?Q?KgqIUQHM6LgwpPaI+5SxgWjdvDAzp5d2Ta24Hme8TJZbYvI6Qth+l99JHsR2?=
 =?us-ascii?Q?Qo98CjPHAe36zoC9UqpZZizDhuSVc4k203wvA9vpo5UkrVPnj49fLxInGkDT?=
 =?us-ascii?Q?T2bKfe6o5YmWhl13b4FGH6Bikb+UCnG68T7YsiENxccFQ8Ftlwx/kNc1pYsk?=
 =?us-ascii?Q?JAlMDID+cF+Kz9eLTuuwJAOlNgvKrHhh6A21J2RhFg1UguEgIvRnT9AP0T4n?=
 =?us-ascii?Q?3HK94hrfeE/zFdX4q6QmgsYBGCBxcGkixzb1m+AeiRBNuJMDg5iRQuDnjJac?=
 =?us-ascii?Q?uIJPHeYe4d3bzqaNwUbwNyFiWvdBSjt04JcHMWsJTsRoutjdgoy8p+c5x9/E?=
 =?us-ascii?Q?T68SgJ9YDJMVwFsFaiyCqs8923ykytzDu5Gtu4tbQMiCiUDep3cyfACfrOrE?=
 =?us-ascii?Q?my+Vvz4Ii039B/afsXj8+kDDANhDo/2goxrITOcgsbvhy0zj2YyQMxXSohPO?=
 =?us-ascii?Q?wRyC8QaM+EcptBwPlvz5wrtbJVm4JNvJqiJ4sStEiJ5OsG8PUDJXANqspgrZ?=
 =?us-ascii?Q?q7Bj1dkRgf9wLJZinoOBQ9GS9OGnxIwo3NPzHuqK44LbeYaj4OKIcYfptWQQ?=
 =?us-ascii?Q?JvcnAknA8e249WMDmY4fXcUKbbW7jnNj/AA+iBZ4h6A5ez3pEyzkVQI8IYti?=
 =?us-ascii?Q?tjfjr6MBiOxuH/I3O3iwAX8cUQ3aewqAmQHAlkkQ39NK/KJdc4mHtDLKVtYm?=
 =?us-ascii?Q?jUNfDFdB4N3jlq9r0IV/HF/zEOSpB0S4LscYkkTljmLAKPs5LDUXNubXUfu+?=
 =?us-ascii?Q?HKlzI0bFAKDhceTNKyJoVoPyUPBfUuZJZRRbO7mWsWd/KE0NkLKcQOdNB3T+?=
 =?us-ascii?Q?jBM/LhwQk8uN2xuW4GH4jn//mJNcb8BISR+CeYm2anRNT6KsqWIiWxL+jPtw?=
 =?us-ascii?Q?f1ZNviGv6rDB0wnwRf1L28Qf/OGtqXGEB9SFATHmTvQwRF1QeSzAhLTRLVVH?=
 =?us-ascii?Q?BN2V6fQ6et0dMgcWSctW5oXXFw/QiELaW/bRDVm5BVApea54xUWNSm/V6t/q?=
 =?us-ascii?Q?mndF6JbNFqCgmOBzLoh6OewLFrjiyKMyIJZHGm9J8LDxkb90rzLQdM5bdrJl?=
 =?us-ascii?Q?I6zRU0xwMTR9oLuCP9lXW9s09onhzJNGhQUnCPdtq3SYZHyuL6yhkFI6i4B2?=
 =?us-ascii?Q?2Umxx8z4dm312maE425FvwletBWmeN6JHaVgrwlhoIQ6o4LO6ulycYJ9uoWq?=
 =?us-ascii?Q?Oa7EUCUHkpzu1ZFky8QFiZo+AgQwLjsgHnf8rKbAzK+ACZh824rJDE3zH5Fk?=
 =?us-ascii?Q?FXZ+9x6QJZXe0EB88XCb7U0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aaf1db9-e25a-4321-e162-08da7e9cdf7c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7100.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 09:02:25.8291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcFcQmnW87LT2rpYDTYKRYrVvd3GhuYdiaLnqhQNBeUlmiH6bUO2CYrb5Bk9uYC8/XsPqLPiKxYYRHbO+ROW/xFmRGyCBQZelUfqGb1GjYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Received-SPF: pass client-ip=40.107.21.121;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

data_end field in BDRVParallelsState is set to the biggest offset present
in BAT. If this offset is outside of the image, any further write will create
the cluster at this offset and/or the image will be truncated to this
offset on close. This is definitely not correct and should be fixed.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
v2: No change.
v3: Fix commit message.

 block/parallels.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index a229c06f25..a76cf9d993 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
     int ret, size, i;
+    int64_t file_size;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -811,6 +812,22 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         }
     }
 
+    file_size = bdrv_getlength(bs->file->bs);
+    if (file_size < 0) {
+        goto fail;
+    }
+
+    file_size >>= BDRV_SECTOR_BITS;
+    if (s->data_end > file_size) {
+        if (flags & BDRV_O_CHECK) {
+            s->data_end = file_size;
+        } else {
+            error_setg(errp, "parallels: Offset in BAT is out of image");
+            ret = -EINVAL;
+            goto fail;
+        }
+    }
+
     if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
         /* Image was not closed correctly. The check is mandatory */
         s->header_unclean = true;
-- 
2.34.1


