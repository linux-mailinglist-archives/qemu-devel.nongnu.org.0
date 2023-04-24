Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58026EC90B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:34:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsYW-0007fg-DV; Mon, 24 Apr 2023 05:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYP-0007a2-R4; Mon, 24 Apr 2023 05:32:13 -0400
Received: from mail-he1eur04on0731.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::731]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYO-0007Rb-AI; Mon, 24 Apr 2023 05:32:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hf6YDbL9rsRXhLqcbpu1YpFkS0PXGWEokUi/PdNDHE2yqZfXPuRLXt+DEvpUwzPetbzB37bCe4G3KuNPZAcO9s5w5+6CJ7Yqz/3pdZOKHXSfrnKjA4X3ePNEk8a8GqMoRyFe+Nm8b0j5d5RCNKDJLRUk1birUz6sNAlXhbuV1mruk3GHJTe23C8eudUT9X/PS8na3jZE1VHecOc8PkiBtMz4GugLP8QJaMsGiVSTijangHMjQM2fB6VCRoRbCffF90ey6U141Mkd1zNHPymlglmm1tMJ0LXbXpb6G3kITaW9lMkCLTAjVaQEHWdiXmaGgKRzFwevnGD6n4UkEw9evA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzdUYM1t83GtJ+XUwNuVoTU1WC9dIlfan1AXZqmH9W0=;
 b=EgLdi2K/Xidup5W/ej4UDJPCr78zNWaS2QIEkoDal7dJXLL7MFs4Uy+niBQpTBwt7mg842NAycfHfkQNgnPx38K0EfmgRVDK/JW0WxcYD/H+eh7R/q5BysT2SIe6CoFv7mkdH4bljKxw6LS2hFvcrh0nkCe85E1plL1KC6HATxQaIi79O9ZHid92BxBkUtZj74+UczgZnaNxrDYQK/N4Ul+sLsKNfzCmdaGLzEBRIjfyWIqGdYqU2Z8rmzJunoQBLqU3ZpTL06ACn3e/YPAFvZj8EOG6ha+gmQl2G7F9tbSamq1WPhuLI08m4NvuYV90zmbduD1g3ZWoU9/UFpVLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzdUYM1t83GtJ+XUwNuVoTU1WC9dIlfan1AXZqmH9W0=;
 b=SeeYvFiVVcNtIPQ+Fn79a2ZTt8HdJ+Q+ArUhM7eU47gLFX0SuL2EaJ9XhLYfh2XVdcb023p/vWol9p8BAn9k3M9gGqGjnP7cLUZ0Mvqc2kQG/rkrNQoVSAHBPRu4KKiBVXF7rVd765L4+NoWzFy1DgQmq3mEVmSZveXFG7krWaqjncVL7sZ2MT768X1A85c7P6G+JAF0d+odZsFlQJOcdry+KxzSNlTx6iOS2in005oVAzTGFCp7yluQjXBQyklHGe/O2Oil1/ayVqiQT2QSXxpBY5D3apYFLi/M1h1eGcKwwoszbV2/6WmsAj1Dx/jorG2rnO+bJbTHmYdCX4nipg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9487.eurprd08.prod.outlook.com (2603:10a6:10:42c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:32:05 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:32:05 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v11 08/12] parallels: Fix statistics calculation
Date: Mon, 24 Apr 2023 11:31:43 +0200
Message-Id: <20230424093147.197643-9-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
References: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0169.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9487:EE_
X-MS-Office365-Filtering-Correlation-Id: 415740c3-9c8d-4943-7021-08db44a6c45e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rF9GIzr5CHO/Ar03YtgzQFwDeLoiScn8OymMkbEdj+aqwUS8SJqouqR07Aq1sR46Y0TMsjeWLpmvyoFlkbR9DegxVvhSa5InNANnrXqFkJzGGBFQQVEhmtEGn8uweea1h2MOJQBJMsl/MuAgl2++PqyGgzQjY9LImwdp+epuIeuoha16xr7YVH0HCPgKnN0yJJ0bJ/tEX0YjXJDGYuvm+/VsjUD+4jEn9LONdUpv+iBsTTfmIWNGIDi7J09oim2rIJ0OU523Ve7CZYd+0JWwWo7VHGKLj+2V7uJzwhMwnkHwsrtLs9RHIBU5eZSMcnnwE0GBPsGftLQBeSABS7jj2qzWmwqZ6EyNY0QUc8Xo2V8hwZ0brsA1Bn6SaO4+QvWhzHRmZ5qk+VhiM/2ciMewC0SZtygvegvv/PhbFfy9dajdeHOjKoXJhpBHfLXO92vgYXncP5FtCoOrPbGrZ50R6ec3y1MLTiCsVPhKlM0090Mkc58Op70bMkRTmBPRFmpDephcmic/eIlrgOqCaJlIeXRVjBPkQ+h84JuQSafG7nkCux2UXPszvb5rs6kow2eDxf1OM3yWLzXS0cfKH/ny9a67pIXHIHzzOfw6wjydhZsam9zgB+iOIVEJsjmyY+Bc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(451199021)(478600001)(86362001)(36756003)(186003)(6486002)(26005)(52116002)(1076003)(6506007)(6512007)(6666004)(4326008)(6916009)(66476007)(66556008)(316002)(44832011)(83380400001)(66946007)(2906002)(4744005)(38350700002)(38100700002)(41300700001)(8676002)(8936002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+akkF+k7c0PnL0mH8HGzYFNlKR7ZXPjQ9nGyN30s/agqIU4DfTbYn/0HQ1+p?=
 =?us-ascii?Q?0t/tyXhB76x3IrYisZ12+s7YQqiX9xqASwzGjNXT6nPkwRuPEmIq62lY4lr8?=
 =?us-ascii?Q?ZzFlRLDwFGME62G5z9FAyRBKCLDYb9S9TxIdxFxovw23fY+8060WYPwOj5UF?=
 =?us-ascii?Q?CBf821TMol+0IuEKIbxeStiPhxDnrrPfcmXZ+UzVJdJV6p5dQpOcx9wGwuY2?=
 =?us-ascii?Q?D8Xedato1ITGBPw2NnnMvQyBPuDPvaOVkVbOsmvyMHxqjI+oogem2g8jUFlm?=
 =?us-ascii?Q?1lj2NudAeGN4BQVgTTQF6Ia8YUc23JNZ5k+g92IuBK23PZ8ReBsWHa5CGGEF?=
 =?us-ascii?Q?4MVlnLY9sIbDWek0afZ2XbCLNiIn6pVKpFnFK7SSE6Lm7s/GoRyZVq+mr3bB?=
 =?us-ascii?Q?FifDOOWFdX7LqaENXskvRZdctSppBabhbDxW0C/36ftJ/AVcRf0/xNG2Zdsa?=
 =?us-ascii?Q?m9U1KxZPGn7hjI4ARvYQMlz/ud43mO+P598NTpY2hQJerBpW5WQcBbL0YV2l?=
 =?us-ascii?Q?HgVGonyeAHQRqH4LWjNjYHe6W0lHyzfbFI5DsUEHrDdgA5Ekxh6U3RJ0PYk5?=
 =?us-ascii?Q?GbZziivkuYhMLD8azsgdt+6lebnweyDqAKd2h3pQgxV35QBtpI2OtqTVaiZy?=
 =?us-ascii?Q?KkOqMpYn98EX7VjtYOdKZl4SAARSS19uDwkoXNvn3ItUkJQB8pYhWLLAukJ4?=
 =?us-ascii?Q?D8dNvQE6kxncj0emFklO9R+bvF92aLb9iJg9Lde5B9hH6F90YHt59xZ39CCf?=
 =?us-ascii?Q?4wMLxU60oIKCcE0b+hJbck1g9KlYgXvTJ+iLnlv4F6Yj110yDas2wa8b5JRR?=
 =?us-ascii?Q?rTjdwRR8E41EXOXnuCrNOaUzQbsAjj/LKPIgqTdFBoAsW2BPvCZupKHlqNYO?=
 =?us-ascii?Q?tonzXnxhHjpZAjSNDIjFYkRXhIu2nad0Z0xGlRI4nHaVfFlgw6CNTWb2JSEV?=
 =?us-ascii?Q?rN8eYuCj4FjwGE4fanhS+FFxe1Zvzy76Bmjl9Yf5kTZ1XZU2m1CXBfmzzY/9?=
 =?us-ascii?Q?sxX0yHwoTuulWw2+tfHnj30VXeoVn/sHOOeChxyG0KjKN9D9l5ZzeAcwRVib?=
 =?us-ascii?Q?vf6B3U1q0rVZpv4E2QB7R2nNc2FZc4JCFmQVWMxnDJuDV4BVcQelE0cmvFtK?=
 =?us-ascii?Q?Yp03KJ9r/CZptOhTcsFnwWSk9XeAp5pQzFyBfJ/K1SS3fYrvzLINYZeSEb3g?=
 =?us-ascii?Q?J41KD/T1rWzo3x4+EwivKtjD4k6oWPhhct+PgJQZbYZKGKsM+tbUcGErw2GN?=
 =?us-ascii?Q?DZEOxAUMTOjaHFa9keq37WDdVQHoh0Lc/wBAWQPCkox7kAZeEpFzYn9kSJ70?=
 =?us-ascii?Q?xMbVhKNvtqIdUEycsK2ZaXigJZEm7VmN5RqeFY+gYAoF9Igp+QS42i/3jsJ9?=
 =?us-ascii?Q?yx9WvzMnb20Lb5Gq0tKeKlGcU3XPhI14U0sGTvIcEJf9DiFpAdvt2AFDiObs?=
 =?us-ascii?Q?yXxmu+DP3eFBYlqJVaPOPSX1MiREHL88boIB6jvVOwtQaEl7RqAbiZ+GX6el?=
 =?us-ascii?Q?87rtLEuwZEg/xLsfoQeWA/BjQX5EZTSe6YT2JYzB367hqt04Dz/DlFrfkrn2?=
 =?us-ascii?Q?0+8bKpDbHCE7EiRpN1RC2dx/y1zPPtRwriiPgaXastuD7HAumqdvaqYilLVY?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415740c3-9c8d-4943-7021-08db44a6c45e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:32:05.5266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3Sshmre75uNo3fKSMZrfCydTuLVcFEfRm16IjB4wh4VxY1I0QUQltJtu0Td5VF4rSY+/qm28NU+IdjET6IDapq0VfAsS69Y0BtLhSC0zrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9487
Received-SPF: pass client-ip=2a01:111:f400:fe0d::731;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Exclude out-of-image clusters from allocated and fragmented clusters
calculation.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index 8588c3d775..f389a74466 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -512,7 +512,11 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
         int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off == 0) {
+        /*
+         * If BDRV_FIX_ERRORS is not set, out-of-image BAT entries were not
+         * fixed. Skip not allocated and out-of-image BAT entries.
+         */
+        if (off == 0 || off + s->cluster_size > res->image_end_offset) {
             prev_off = 0;
             continue;
         }
-- 
2.34.1


