Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EDF58C831
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:13:47 +0200 (CEST)
Received: from localhost ([::1]:45662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1di-0002t9-LY
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1YB-0003bA-JT; Mon, 08 Aug 2022 08:08:04 -0400
Received: from mail-eopbgr60099.outbound.protection.outlook.com
 ([40.107.6.99]:57061 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Y9-0001TS-Rx; Mon, 08 Aug 2022 08:08:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8LTNPzBCVEWyQHzPc2DVm/2Jlh91qKDQq3tCUU4YyMy5vEs8cZ2kWYlQMwpmU1PJl8Wi3l3sZ3XBTJ5plNPJuhgKIjhNy/rqufNR2AsAFuLPLjd5CoPBCdEUmvObVLUJQ4JGbKwIusYWh3SifVQthPv8mhjkVm1RzrXi9+OzYr/kcbyj1ag0+ZMAplxKHm7x5Ev9a3RSTRo/6jD6Nl6oRbePLg2JbnvQ+kB6mEgz1V02MhY8Kel+l0EV3cw935j8YQjOqv+DY17aof8YEyr8eiBWet8UdQtvVn2SHgbReVLznLc6EHqF6yriD49aBZ+KYwiLE1S2+ytfam6pC6qzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HG2KlUBcp1uC024PFTKjBzFPV5NG6VwXF9hqlxzj/jA=;
 b=RzxaA9/xqQsKTAOZBsSAZZfiH0O9EbBcIh6sEFyPpXo3uK0nm/qyRBvwz6y0HMv9fk3nubgsjxrgz1/m5dEOX6G9ExJybhy+7Fw2NGfTNUEg4HAz7Rj7HfvjaoK9RpumP91DrmC0HMtsJ1gh0gPS9w0dLk+qTMvrEXLcf5x4D3bx8vX4XZtST3s9YD11Gt9eCIIPHEfsMc0L/f0jraLooyFfiUYnHimo7uFmIStD6d/aWtTD4Rmm9/VN52C63Fj0VowL1IlXWeMIxoXg1Tvh7DzLO7Yoxi6CRlCivDwPtL6AgmkEoJ7rsa5231CB+BbRQpXgRXxRHALeengj9SkO8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HG2KlUBcp1uC024PFTKjBzFPV5NG6VwXF9hqlxzj/jA=;
 b=eBjESQpMnOsIcAv4aX6UtlnLVknEOmDS/yBTaiXS5Mb1JzjsWXL3A/I0NBRYuYdzr3HLsBfQ+GafQco4tQoWhGJAmaqmYM252eATgybRo5JdbIq4mjLcmDthw54k4Co6gqF9dLj94sKGMWoi9TCFd5STUJrk4ml1IQRJXWWq4S7HwDNrVIY3Onb/OPiQrXDVmwKz9r8Nl0ddn2FS81xpNm2TRXLqMB592CVYJBq/cywYLY723bEUubNaz84+QukmCZMpyQPzNjejK1SgjHuc09GugXc9T+4FCvB6PcZ/ki6gtLSklPfQz1KEqtHn0fMoXHBDpQ6hiWvlYudcalWmMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB5360.eurprd08.prod.outlook.com (2603:10a6:803:132::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:07:48 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:07:48 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 7/9] parallels: Out of image offset in BAT leads to image
 inflation
Date: Mon,  8 Aug 2022 14:07:32 +0200
Message-Id: <20220808120734.1168314-8-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
References: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03a5c2f7-5169-4733-25b0-08da79369c6f
X-MS-TrafficTypeDiagnostic: VI1PR08MB5360:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IUbfRyIhnpCZqogZ9XiYprQ8/QZsugDA+7TZ+P8yYQyPfF7m1Q8RhsAatkqyWPPcy4OXO9rLgYh4I6XNPIEhXFYin1XgOrU2fefrAJhsnnO+xef17fYSNraXtCykNTkL4H9qiQvG0A0GjsBsoExIHJoRyzD3STbXA7bT5jXu6neDDy17Hf5moqUi1nlWb/Nqpr4r7V1kO5+ZQ5UgAIaf+0Ongu4hHb3d+FxxPJvmbH43YWLbwSqzV5t3G6ui4sO/RMrZahwcwCgHbfiUQ0caOak39vwWlM9Paose8YiU8cWZN9xSe36BM0ixMJPpC755hSAw/F2VAIHjRUJfbjFUPXJd79USGRHJb3daJ7cDK9Q1t1DDP6aQZtTshIXFDD4z2FrOXlrexVt/2ExDSJu8fljPuyA8HG1EEEA4NNUbLpmQ4JtUdDAxCI13IxOFEuq1L00nKQPn0GD7nd1xIFjSPf2q0/rBvhluwYYG7nef1PvB+BAUcieY3WNPtkZYmyjy+fApHQh7iN0m2nAKRTHvWe+/ocn5WtiNFGvMnmFdpwNMGmWYcGTYU5dtwVbvbxy6HJXFpj5A7jMOggGIR6YAON8HeE/8HEzKTxK/yqCFt+vlRUqPAlN7vmFecF5I7aOzbDuRG6kV/TeyCCCdttzRUfvDEuG6rPTSz75NkjTafzL03QoEW2pdsoV+feszGMCTGHmTktUlx0wGImbOo+NNuXB9S3LCUyZb5KXAQhgBAHf/V9W8ILwA0DFI6mJjhWQtFmjRPPSdLdeO+lZ0YIox0lNzprma25bEuEG7nzgCruo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(66556008)(66476007)(8676002)(36756003)(4326008)(8936002)(186003)(1076003)(478600001)(316002)(6916009)(5660300002)(86362001)(66946007)(6486002)(41300700001)(52116002)(6512007)(26005)(83380400001)(6506007)(44832011)(2906002)(6666004)(38100700002)(2616005)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xlflg74cZ3xKtAQU+2hqL/A1EMd4mG57o/B74eukj4FnvbgYeBMvHSptNs+9?=
 =?us-ascii?Q?oPInCYuFPYBcsjuMw6mx5LHqJQB9BQ9b2KxTrEaPBlM8XoLXo1CGzMTHbdAX?=
 =?us-ascii?Q?QGHpE0ViiZ6PZqh5RbVlY/8K5pxi7lqVUjaQOvPr5xjaVZbFYyF7MOrS2Lif?=
 =?us-ascii?Q?BRgCA9qCe+s3IzinpNOXgr+04dheVeZ+OybU455A0DzrvuJaQDnkGmlMAvzl?=
 =?us-ascii?Q?km+gaMmRhSFcFmxT6MukcWoAXLJFHbq20iExOb+AwLH9WQBshuUNuZA1HSp5?=
 =?us-ascii?Q?J+dUOSKHMDlPg0Sb4eKedsTDXa0C8+hHGOz/HMDZe37LMOnDJAmlLOsjmbaB?=
 =?us-ascii?Q?lpIpX7nM1AktXdPmh/uEojZnvFwmE4sOWaOYzjWcJLWEZYAAz9tOhsn70E0c?=
 =?us-ascii?Q?g7bywFzw1or1uaFKxn3szQIsO6A3XYTqZzhHotkIe8EaffbTyKKh2dvew5ik?=
 =?us-ascii?Q?/EJRo/DFvotX2+CzQ2Ng58KeluyA1pBikgAKspuchxQahC1UQc4oagIw4ghx?=
 =?us-ascii?Q?gQ1sHw31MegdxSkfkQ5+eFK7fKoNScd6QimsaE9zwn1gbq5HA8L97+sP6wPV?=
 =?us-ascii?Q?dle/lJazFuhekimH8tEGPbJAaEi+tsLCIPtf6dv3hnxCm1t4vTDB3Anglx9g?=
 =?us-ascii?Q?tCATZNKVPvU7zwqpJ0yH/hCP9SB6JYBYE65D58GaNuPKjRQBHZds+iLHskkL?=
 =?us-ascii?Q?QtaE+Aku7D78YPE3/FQx2LlXpQ51tFx3oZC3xrWKJhQ/WW4H65C6zK2OY2/d?=
 =?us-ascii?Q?esEBQr6pq0Jzvu1LxvyxZr3240oTTjvY5vu2KhEuBSg0TLaZ1CXNUwefua3G?=
 =?us-ascii?Q?E/rt+5xFzOhjTm4q0NpiPPZC60LtGXniPJwzdj01q9k71wa9kNBCBF7HqjP1?=
 =?us-ascii?Q?zrCzvjabWj2YjClyDBdCfo493MXN9HiIRxAadFK18sMP1MM9j/N0KL7yI3tG?=
 =?us-ascii?Q?cldGaFjcbGw17uFa/IRfkjOy8k7Cp2a1S/u0nqbXkEx2szl8UFrkfio+z5mL?=
 =?us-ascii?Q?WDHG6azhIdnv2LX2eCe+GrrlECC/w8wkmVemAvW/asgHVvqFcnXQLzubNKcn?=
 =?us-ascii?Q?QX6fKRzN4kA/qZDCP/elxph4fZFKykhOiiRSEy6Lf7NJ+qzaZQ5iohLhGKaR?=
 =?us-ascii?Q?Gy/bQwJ9+ryzLsA2PYuP0cEUuEFDd7HJFLSP7AfUtyrzKERwagM5STWWrPxX?=
 =?us-ascii?Q?kBMNWmrHqNvW7OMPOINPO/0WYaXLrC4v3Q8cf1LGuLwbtRa+FOFJkGC1GpC4?=
 =?us-ascii?Q?sBL0RGzzDllSk1CavDVYkPqm1NKjKiiwxlGv55Xg2bWbxdcMviuyUdj4j74X?=
 =?us-ascii?Q?95//ZvN4VyEmvRVC3S20i5UcW5vGcetbcQJEUqBDXOkvOPo3pXIXXmk7nUZB?=
 =?us-ascii?Q?VGfcD0pfAe87GstP2yqkmqhvV+BOQ5h0Ex1MSDWV+PtHFU3wr3XGPXcB4oDq?=
 =?us-ascii?Q?oXQ9oSQHcHaO2Fz8KM1nCDiOWECMkV/ShFBoCgh25ZmEo+iwkqGZey8J2Vci?=
 =?us-ascii?Q?XhYPg8w1gZkmcDNBlAgqzW8PZaCpH2NHGTQjF46v2/2pFeTxXo/vJZ8rMRRZ?=
 =?us-ascii?Q?0NFS+dPRLSa+RPQv9v/X4RXbyAXnUswU0JrntnDviVu+wBNj3OwZUHp5xUes?=
 =?us-ascii?Q?oNJ6jVnkZKe/fXl3iUZXE9s=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a5c2f7-5169-4733-25b0-08da79369c6f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:07:48.8258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wGl9HSwCl2w8plOnsB/Z32od/vgyht1SZ36Wltz4Xep3lmd/+jNgDmdt2QAqu+SX/06fNpp4Kgr7p9Nvpl1W6uOZ0WyDOHAQSR5Fd+VZ/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5360
Received-SPF: pass client-ip=40.107.6.99;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

When an image is opened, data_end field in BDRVParallelsState
is setted as the biggest offset in the BAT plus cluster size.
If there is a corrupted offset pointing outside the image,
the image size increase accordingly. It potentially leads
to attempts to create a file size of petabytes.

Set the data_end field with the original file size if the image
was opened for checking and repairing purposes or raise an error.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index 3cb5452613..72cf7499c1 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -811,6 +811,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
     int ret, size, i;
+    int64_t file_size;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -890,6 +891,22 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
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


