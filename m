Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5F36678FA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:22:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFz5l-0003ty-Hi; Thu, 12 Jan 2023 10:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pFz5j-0003s0-Jy; Thu, 12 Jan 2023 10:02:07 -0500
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pFz5h-0007Hj-Me; Thu, 12 Jan 2023 10:02:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEjxjBkdEzuMiJ2mX55E5wJBwZkEnr8auwdYD/mq1bhoeXyKzYowp4oQQCXMarlkc1/Hl3X1R605hS+mtv/tulkG9KHbZ9L0/y+91jj6ePS6dfEhEOihp8XawLScc53nYzVE1OrnDpKhHe/v0CJ6JV/1GVuWAJMw2UXz/WSVe9/ygxubTiNSN0Fl5Z1wblgXo95AhaPS9z5kiVuGH0dwQx9V+RexFf7qiDz8XTVUixR8Oad5uDPDlTf5yFxFL1wCjsLgF04BEAe17ocVqWIEbbM2wVK9njSff6XdStK7MniJzE6bqaHJ9H0hXJx8/u2h/kPXleVfzDEZmK1IYXvjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cj7Ka0LzTUQab+txJk+z4ZzSI/xBbQmNVtRVrrh18t0=;
 b=BxgK7D13j88yKp1bkEu7rJcXrHS4u8AIlP3FLhx4QiLK5Dl3SNnUEZ40siZ/B3RKxbP+SgIVJvN2U5KyWFILoptRz18V7CvYjDtVuE1aPn6r/15ZFicWqVBCl/zFv27+nM1sluxN4pCTZR/pyGdv8wqjxejK29COJGekrMYuJR+rts+q/SqHEfelBclutFJIUbuKy3C56oD20vmA8EZlt4yS9z5VtmZ6fV7/xgmB3xEIjUx+QaqvYVeoyPLfx30Recl/ACwaG6cxGj1CDuEx320vpdZUmbskV75C6t1MI13/ACL7V5eU2rGPdmwBRRvVqgmweoiygKqvFVEsycs3Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cj7Ka0LzTUQab+txJk+z4ZzSI/xBbQmNVtRVrrh18t0=;
 b=ToFibzbrEEKoQT3yuyCnfXDmVjm1775PQXwU9OCVv1iqb9BMvw73WI1VMZO1lCLeG8a1RL/IT4UiucLy8vtlBK3+oeJGKJP7kxNEYddcUVJO2kxZG6J7qXeKQzfUbqdl9ChVMfnaKzdGJvMSk1TKvBTiU1QMe45fSN9g8nG7x3Y0i4T+jL5SIhICEHFstsk2LHJyMd8PuArrKLK1cwnedRwGfavsD5IJkgvP04/9H7PomJ+T80Aj/lbqiiG3sTknRSNKD44D/fi1ibj5I3YxTx+snOJGOrZGUBVB7NT4hdpc9D9Wlve0zvptChavpe3uawTL8V5pi/V0JFNVhQsU4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9250.eurprd08.prod.outlook.com (2603:10a6:10:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 15:01:57 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 15:01:56 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 1/5] parallels: Incorrect data end calculation in
 parallels_open()
Date: Thu, 12 Jan 2023 16:01:45 +0100
Message-Id: <20230112150149.1452033-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
References: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0701CA0035.eurprd07.prod.outlook.com
 (2603:10a6:800:90::21) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac6171c-af82-4ef5-f46c-08daf4adf2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bg2p5R3b00a05yFT02IDF3w2gEyDk6Wvb3VaccuJchC4C38tQ0Q9x6E6TLe0nuo2sIUR9bHO9PUXb2iu7J7sX0yuNhv6DpgJfACNbKM8NLfBkHIVBoE1RMrHFBrBape77AKpe2j+71OpJYK874FOrT0EK0ZcCrE1aXUDnvA9nbPJpYSREA3lQQpkI/wvKzIvoxQ/WEZnNGrd7Tm1EMi3Iub8Ql2ctL4ENvN2lXz/v8Vv+xJVp9ztaD5+KpTkDaDD1HOqm3V9lZBf+a++C6wueQvJP9Os/Fsy2KD+9qJInVJHbdyKsU/oEs5kPycm5cri5IalTZRogJ70kWnidXfC4V/ngzcFI4LvxZdpg4NAtgWEf8mADjEozvjxcVm4frW691JLH0RuHjs1kyLZF3qnSTyq6BIvZhfTxnQmV77TRgHP4X42cpmXc4Yu2p10uAPW1MJSGixi+S3eByKXiEH3Qd1+0FINLymoqcnlQkJlD4msl44FxB1BVyDZhsE7zPozyTo+b6g5tpCteiIKNxe9OOQrIzwQrwfJu2rYciUpqYolDeKs0RRoj+OvO66tkePQ8tCZ2E7xm4zV3vLFmqn7ZbRj4gHXqpu3mtuOniBGBvf20IYm1+unsXkQPhPwyMtGmOd7Nw0VCMbsDS4nDkFe+IkX+RND8rpJk/KIN+YYEoQXQjqqliDb/xr0Mdlv/O1J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(451199015)(36756003)(5660300002)(86362001)(6486002)(316002)(6506007)(52116002)(6916009)(44832011)(2906002)(6666004)(478600001)(66946007)(66476007)(66556008)(8676002)(41300700001)(4326008)(8936002)(38100700002)(6512007)(38350700002)(2616005)(1076003)(26005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DQ8qThrAUX0vsRgiR3nqiwx/Z4qMXrtQOif/nXt762fp76Eo0YdZwzkrK/o6?=
 =?us-ascii?Q?kGtCov9+ojIIf8s+2kklgUJygHlH1uvb+HwIy+2BVTcMovOGBOvU+lKo4g3Z?=
 =?us-ascii?Q?o++Y041AMTtGoKF0ZXJvBAXCTWuP8CkMytGAV+LhQV0D0lWtBjBNH7ra8pDv?=
 =?us-ascii?Q?6yS5TjtclKt/aoIDbVv9nBQbEXAhKc4hd0NL1c0INcDm+yMg+c9rjrir4jS3?=
 =?us-ascii?Q?2lichEWL4lplUjI9vlhxR6nQvgrccEf/s1mD4Tq4DUREk3jmPJ9aSa0icJ5m?=
 =?us-ascii?Q?lYC3wHQZHZ3xo+5nnvZ2MOGvdBoCPKvTdww4LcHwbvshBGo4ZWE5yzuEqehz?=
 =?us-ascii?Q?a2ZDywTGbqtvJS49ZKeIbICMHG1POQ6NusPI4mlHjJw6Kq51zR7LQraIBxYQ?=
 =?us-ascii?Q?6J5e1dHga5hWYBZHRNVlh40iOpdctJB1IMPbzNQhMnqZWFN4I00AtpQOEKJh?=
 =?us-ascii?Q?8Gfq4bkmbSLkbN6FvwvS2eWCac/RBsmNu8XdkU+X171Y46hLlq30llmHD8az?=
 =?us-ascii?Q?gtmHdXFeF/uX1D/6Cbr1mXFiW0YK2nscSsCTBRZLZnHKs+Zjcb2ck1KSjoUQ?=
 =?us-ascii?Q?eeMNHVLANs/SfRNbhVTjAXIx4CE0U/fduCYcuOtBLjmVC7eqnwdSGNoECyGC?=
 =?us-ascii?Q?p/XFwxmF6/VslS13leTdeK30EkPePLtWQ/WBhWqDFa4eWCxGFUgJRC84QOvr?=
 =?us-ascii?Q?pLMif/8jlnfktdIYI2t1NLgm8d1wV8rjYMcndHgSIiybM4NCLaAY3Tcf0rGu?=
 =?us-ascii?Q?A9wzGAI+HvZ8P7pBtEFZti6uxotHQoX9F+zzSrzNNctcdDRRGST/4yDqTmd1?=
 =?us-ascii?Q?Nbw/bG+bkAfKQe0qRc1ZRH8sXErKXL30zSuUvW0drq1q+su5p9M4NkJk8lBp?=
 =?us-ascii?Q?EiGQNpl8zkcvjAxa2EOzI/Wi0RGhtx60pTSs7E2vqJYXgYAbBFckTkkjZZMt?=
 =?us-ascii?Q?s0aUkSKq53zuguPLY0/LdcJvXiCVlx5bucJ3uWIQmEWFvW5PpJf7iD4g7Vc0?=
 =?us-ascii?Q?dECGz9RxrVxkC4O91L2jVT7FqwpChMM8D9RTvVF1CXm3u8RG6ITL8lOaJLse?=
 =?us-ascii?Q?wuewcmXrUfA8Di06chpXvmA+hiahkNHIZ2GM+Hw/obIZ13deNTDMw8p/xC+z?=
 =?us-ascii?Q?FFGPwM5sPm3v4P8KeM9xAFItyMR/6yl3ZJsOABjlEU1uqEJF3EnuYQup7tf/?=
 =?us-ascii?Q?VEM+4PdXTfRFVWLm4Ie2rYe4AB6l6YxM7SGzpRHd6a6yWVjv/ILEWOxva4pt?=
 =?us-ascii?Q?dOV2CroyuLsvneo5cReY0PN/Pt2JjcnPwYSdfmjs6ra6ReBLGQyylhJ3IDtt?=
 =?us-ascii?Q?MynvORfuqjUi9GGtrS3MDiTfgdVuV9UQJKqDUBhzFUOH3wZ7ZzDBRMK5FSI5?=
 =?us-ascii?Q?MUf6T9rOV3Rm2HUZUy+BSWyYo/gQqiLSIoTgkfuLkwwCdTMtrqZKgHo0GiEt?=
 =?us-ascii?Q?VygKwnStQtWuwBjXzpE2z6UOLoUOtYq8k6nRjks50HRPuWDrpWngXaQQTZh4?=
 =?us-ascii?Q?WOyt8SaL4MnkJPT5rf8/Od6VWGBlKPUjFvCYO3CzLiu/s2ID4zZNy3kD3YmG?=
 =?us-ascii?Q?M8MnG2t3vcJb3t29poq1JBRqOJKPFg4xx4rjcXh+hganbdfY4GfvmBF0UkTq?=
 =?us-ascii?Q?Sl78V0Quc4iuyontieUJuNY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac6171c-af82-4ef5-f46c-08daf4adf2e1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 15:01:56.9010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhZ2ikANTk0smFFqfkHZTca5GQdt+PpEHyGn/bo/qFl6FEwuUZVyN/A81Y9MVZ/q7GcZTsFvA6hKPT7BsG4L4wurG/qIB8xhzKwa7nwUj2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9250
Received-SPF: pass client-ip=40.107.22.133;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

The BDRVParallelsState structure contains data_end field that is measured
in sectors. In parallels_open() initially this field is set by data_off
field from parallels image header.

According to the parallels format documentation, data_off field contains
an offset, in sectors, from the start of the file to the start of the
data area. For "WithoutFreeSpace" images: if data_off is zero, the offset
is calculated as the end of the BAT table plus some padding to ensure
sector size alignment.

The parallels_open() function has code for handling zero value in
data_off, but in the result data_end contains the offset in bytes.

Replace the alignment to sector size by division by sector size and fix
the comparision with s->header_size.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index eda3fb558d..ed2cf27abc 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -862,9 +862,9 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->data_end = le32_to_cpu(ph.data_off);
     if (s->data_end == 0) {
-        s->data_end = ROUND_UP(bat_entry_off(s->bat_size), BDRV_SECTOR_SIZE);
+        s->data_end = DIV_ROUND_UP(size, BDRV_SECTOR_SIZE);
     }
-    if (s->data_end < s->header_size) {
+    if (s->data_end < (s->header_size >> BDRV_SECTOR_BITS)) {
         /* there is not enough unused space to fit to block align between BAT
            and actual data. We can't avoid read-modify-write... */
         s->header_size = size;
-- 
2.34.1


