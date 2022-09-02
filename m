Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7B85AAAE8
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 11:09:35 +0200 (CEST)
Received: from localhost ([::1]:49202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU2g9-0002aa-30
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 05:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2QW-0000Jv-9U; Fri, 02 Sep 2022 04:53:24 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:3043 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2QP-0006SC-J3; Fri, 02 Sep 2022 04:53:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFmW7T23xabLwcvag2RGX4kovmleX/5ClrMSvSwk1vzhp1XtDGH4J5enxiwSraBpjdOCdtXzudgNeF5E3vVE+uWj2EU0lPNEA8RJ26Bqys+7fQSFuRWU6PADGIaVZ8fMyWhLzDfVBUmFXVVG78XocmMqsmRi6lP7CLDyA7KbJFlf9geD7EDmLvVSVDqFfcakc4l5UHgNJ6pLBk1NgW4yvkbvUrKrmUPu4nkAPKnqUSPRxZP47RM5l41ORDVxwHEDtUQoRSh45+Am5C8JFaU3PRkj88pt7RKoGrIBoRncdx6zw8rUmJmdYvkPsbl7BQadZ5IeQtq3OQeA42BLYxVb6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LA1uhftTCZDapDSENTHbJl/AeU8PdAio4PW3nHRNxkQ=;
 b=b9NQs5Tb77fdc6yaH/NFiMxWW1JItGrT/rX1+LHYnY9mjWD6OG83yaP4tEggAbmDIYG3P/A+61biqqV+XEtdwAN5nSlFLlHhR03rvBsN0aoOPz34lANiCjIocixamcbQAiZNG0lUfkFyfOsoY/CKeLS5j6FG0Kws4JVp5vvaOwdI30BKvENXcNyHJ/0OOq1kyYAEvMFVEioxkbIwVjJKHuZLGxLiDQu6DAzCSM3+dRkqbGhsW1BtpSWbVuLfSybR450z/n5ztYvyaCvEITLaNV+GSGvTN0wWRMAjBpkIdqlE3uRHGvkSE1sVBdwZF7zIazQeISbUeVVv23/Jru4BYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LA1uhftTCZDapDSENTHbJl/AeU8PdAio4PW3nHRNxkQ=;
 b=mnwHbeH1UQyR/Te0qsY2F+Iu1iVXoHRkRv+0WP9nHXtdhSf1clzHF2ksd2FddVVmJS9KwPXgEbGSktMWPAzvnj1AOPVtcidXSiOI6jAeZXA2K9Khw1eKnpowk1/3WBpicKkT2eGJZiUEubPwuHF9MgEotIHJNRb9I3eVJcMh1GPFAEZU6Ec/T2db5UCq+RH+xrWaMJB4wLTuPdUclz2LfX5Te6QMLCpq6KVtou5owGOS4xgxyEgQwzZifG12kOcLwabmRkO8YK+gkVtXW6nMMB2/OhFvquIsvghZObEs2Fiqeko9hPZP+dUzRmjrNzvZ4ZGAqKYfJaTG889MtztOuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB5619.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 08:53:09 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 08:53:09 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 1/6] parallels: Incorrect data end calculation in
 parallels_open()
Date: Fri,  2 Sep 2022 10:52:55 +0200
Message-Id: <20220902085300.508078-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41800f43-a10a-45aa-8ba4-08da8cc08f2c
X-MS-TrafficTypeDiagnostic: AM8PR08MB5619:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ipXB/LC/vqceeYG7CY+IEcrpKEoqSp4/CMODmbA6Owb72wqCpiapwRG0/a+De9247Bf/thXFfi53RzxTlIU4hAxFpAlrYlm8F4nxOucxl/qMHw9Hw90mvvPNbHT+OpSuvJULXT9EHmAH8Q9UKdd5MV51uotIOoZDqBw+zq6k9V1rFB92Jidb6OUKHYJ5tZDyzW0OMmGT278d65o0WPjT6elYLdd9dy2UB/evbqBMnPZyzxdtVWXCrtLj0OmmszJaiiwUG4w1oXLJUVmeKEE84uvbrWF/nfCcyxpriMNMYY/ipFv47qwl5lsV7QDCMhbhN+TP8AKB5nO6UNHv7miEzDGI7rZTj6XYduutEtt1gMJWU3SNDRvZFFm/QuR2bRNjyRykyHJo0KQnpmx3119SsXc0+Y4RyLVm1jkmgx7/SH+5M7pxA1sJjK7rPwSplR8NawEcDU/c02CqsgRO1qC9L+2y2LHHCgODT6u6cFhFJqD0xHaha66o+p+g+Wnltpx/vLYBoYbmv6dc74fYNgqhocCr6lMlPhp0/qdkVzr1ohfJ+P1AevTCp/cICpQp/3otpkQNu1cNtfsIqhNLowV9+4ZISpRMLhb54s/4jy8LbRsUYDOzui/5cmsi18pXm8WSazffs6v07qZKJDE3mUJD8BR4m81B/QntuaKJ4jLWjNbP3XLES5nR0CQyUQvyzXDgxkTnSaBZo0sc5XMol6Z83tE94yeM/1bLFnLNRHCDqWhz5tJ7Kbek1RLJ2aiIF3wBxAb6kiravgjrEZoVjq7hjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(366004)(39850400004)(8936002)(6916009)(8676002)(86362001)(66556008)(66476007)(4326008)(66946007)(316002)(6512007)(26005)(2616005)(83380400001)(1076003)(186003)(478600001)(6486002)(6506007)(52116002)(6666004)(38350700002)(41300700001)(38100700002)(36756003)(44832011)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RbbTHszNdytYeNmgH7ZINLt3pOdkd7yvjV0vuOgHqldjjHzOvGx3s4aGVFB2?=
 =?us-ascii?Q?N0ZKb7q5LVGRuM4KboCYK4t4d0q6KISSFBrNdda5Sv9YbgDV0tQCTmXsTzRE?=
 =?us-ascii?Q?XqcN9Ys8eBvOy6XtmWIwf4S+HQ33Mv9law5fvPkZfKBS1JGdVbP4TTCn4y4k?=
 =?us-ascii?Q?Ajgn8jRmZVFnATpOzw/Jb9dR7IySuCyyF7LbvvwwQxginBLMcz2derO1MrQ6?=
 =?us-ascii?Q?p0P0nYMXknDf3mFh6EGGeP7LrxH9jQCKDPtp9kqjpEA/XeoUQVlCJp2AyrCx?=
 =?us-ascii?Q?KujsNll5U1AvSm54dDQOvsvpLREan8zDVRddPXsPW1tcCayS55gxR705rnud?=
 =?us-ascii?Q?xepUo7VAyTX57TLM7lTnoy79NVulBdVwrrXUvJXN29X5zBT/HGc0zPS8AazZ?=
 =?us-ascii?Q?wIdHT0P5tCk/evXk3di8BX48jhfS+YsLJ6pEFp/e+RZNLNPzZYWarQB22LvD?=
 =?us-ascii?Q?MEeT7ZAeGmhzavvVpo4jCz7RN6RYnY0HbMoz6EkZAK/v8aoZ7XrRItk1eyZO?=
 =?us-ascii?Q?dLjSeWtcog3fYiLU+ZPoJpl00hxOGPsbXBOKIpeOUbbcpYelchhayHW4W1xh?=
 =?us-ascii?Q?vqIMS9WX+RX87psPZnMXJ8MBV8YtywJ1NQSloBjewDR2MvRyepv9Z5nMFS7v?=
 =?us-ascii?Q?Xgp3rxZdGgNSZFcTZ8VfpTp6wJnT3CgpPt3MVS4R6QRU7ZyTKd8K2ud7WtvX?=
 =?us-ascii?Q?2KrvPdFD+sxemzO4HNCez8Tr2aH5MWcWL6jpsUNrJNTv6WHv2rrrjnGR/m/0?=
 =?us-ascii?Q?P0SQfjA8+THAsJELPndhpIKxYvJfgAekQFtvcuxRMDnQaORL/8Q8YXyuWqS+?=
 =?us-ascii?Q?oBjMyWAxotvJ3iB8ZwoxVdva9Z9pNTnywIIJRUs9mc3XDG/m+H318hrrmxk/?=
 =?us-ascii?Q?gBRaUfVqB9vt9PEUPyH44MZ6FDiURS0FwrqooXG+UeQ9SwKyGA4LPLstIxmd?=
 =?us-ascii?Q?kk2TMb5osqfS5nSvE04oen5uj2YrbI7YoTKCodPOPS9vHvc+rvx7VB9oANf8?=
 =?us-ascii?Q?El74sM8nEvLFeDyApdPcDB92oxjVSGYRUFFiALgFSkbLe7qUFLRfah7IkUBM?=
 =?us-ascii?Q?KNCzbtgZNcQx60Y68qduFclrgNl1ALsROWJav2l6wr4IiwlKFMdTRDp/FbzZ?=
 =?us-ascii?Q?gFwccV39Xd3gw9b1BkNQVTdIEO52/OQYx7frESTkRnHZaJadMVHGNC4ssnK9?=
 =?us-ascii?Q?XIQu4z3sQPBE2BJBFhBZz14m+ppIbkP4ht+ey+JE6OBU0dW/N0wh0/UZfGhA?=
 =?us-ascii?Q?K8TLmrwfnLVevd2wgih9YqapjVgvf6uo+qWgbpnvo495Gw0/5Nhy2FbNolYs?=
 =?us-ascii?Q?U905NfoiC21LYG+/q3j9KkXCaRX8oiPmBpp8/CYoZp1L1otUhbu845loe5PM?=
 =?us-ascii?Q?TCRq3XvfJr0PPNi8GGpyCThTK4CUjO3srbFdAaSwEQ2sCXgAYgRY35IlUw2w?=
 =?us-ascii?Q?xv322Kl/cPyhLgKfhyYUEKhEbsepcCYkb6uSzAVeo98MkMCCckZBQ6iz9k+u?=
 =?us-ascii?Q?4ZKj79owA6sQr4sBi0g2R8+teB09p5QEThm0VkjdCyDbrFO6ckIa5QNrEXQ0?=
 =?us-ascii?Q?69P447iiUxS4QYz2NIoDqQFf7yxt+8gOGZXVXb+ALAkzMQzCyzxrFUJAqiJu?=
 =?us-ascii?Q?PnpzsoFlL2RRCp+TEbJ5Vow=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41800f43-a10a-45aa-8ba4-08da8cc08f2c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 08:53:09.0798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2r17bXqDIm4AOnYb3lM918LTHN2zjFr5R2Cd3fVMC/onXlon42jkpR5VUrQj0v1f+JOI1jnA+8sYxRwaLjRViRvn9EjL5JSa0jwqBuy3alk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5619
Received-SPF: pass client-ip=40.107.8.91;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

The BDRVParallelsState structure contains data_end field that
is measured in sectors.
In parallels_open() initially this field is set by data_off field from
parallels image header.

According to the parallels format documentation,
data_off field contains an offset, in sectors, from the start of the file
to the start of the data area.
For "WithoutFreeSpace" images: if data_off is zero,
the offset is calculated as the end of the BAT table
plus some padding to ensure sector size alignment.

The parallels_open() function has code for handling zero value
in data_off, but in the result data_end contains the offset in bytes.

Replace the alignment to sector size by division by sector size
and fix the comparision with s->header_size.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index e6e8b9e369..7b4e997ebd 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -863,9 +863,9 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
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


