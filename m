Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F2266B25B
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 17:03:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5PC-0001kx-AI; Sun, 15 Jan 2023 10:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P8-0001hm-Ki; Sun, 15 Jan 2023 10:58:42 -0500
Received: from mail-vi1eur04on2133.outbound.protection.outlook.com
 ([40.107.8.133] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P7-0001KA-3S; Sun, 15 Jan 2023 10:58:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8rX5wCN85HvU8+tsmR26t9QLNSU86aXBpPNDJDyFp1COa6GrpgwklZckomFrT6xeW+hR/riifBKNyKEuSpAZ4665b8kYkYaV/Fmx4P9Sh0lIdjTmDe//wk2b5gLAULOjKqVC29QQDRx6vYF4kwRUckXq6U9+bCnLKSIoHz2Sox6UGnDzdK4J3QJBScIIfZ+7lMzfR9cvOwNkRjmVpqfPe4zSupENknSAyaJqeOBfkFF0UwU/X4YMkUAxxlEaa0smhIyFcuGsT3tq7HZAL1l7h/Y48qhOV9SwWs2KveyMN0dv47utbF+wBy7zfHZxUAPa3URHVj3yNqpuY4bNijKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNyy8G/nw2Q+j3HECPZNo5x91+GFPYqJlh0OVa6T3Vg=;
 b=XLDHiZBYLh0Qj5DycLpVM+EHecF3tIBWRu5OG59vgkQXAGvN6yjgzy1eFIiZfoRaIEf3tgK9LebHYz9Z0iEMR3v/nspSmor37Y7SM6DQEfoGKVSelphRTaQ50ZYmBlR3ZFnzpkWd5kWDFmx1iIxLUWnwOFsPogXPI3IELPRblY9KHZ/3GNG1VQOi/0d6gq/8UUvvv8v5MHb8pA1ljmvkqj00aUkIJExM++G/iSHvetUlsOTzJTgWkJFS/oYWXOYSJ1RR/exTm6W3xTjAd1x0JupG2bzfPgkwY5HDXkpB3HujpxPg/aFChkfruyfJJ5V2aiNFO8STTBX6obgs6k/lZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNyy8G/nw2Q+j3HECPZNo5x91+GFPYqJlh0OVa6T3Vg=;
 b=ds1+GFJT9XdoM6BWzkVWzCM6rxcUX0C6tsIHCwwIrm79kExHg5cxbxnda4oyQkujsIsl7t3swiiUaqAe7bR6IRTRN1OjZ1egfL2DVz4pWleunzVxij2soFTNwWORddGvtp2l+CPSBhf1jn8Fsa4wL0uOJIfj6U+9K6iE7rbGMnuYGpqxtP9/xpcvlpHILBTD5R1BXAYFUThvTUee6g5IKsgzmpGGTiTLog1p5BGgoNefwC4lHSo18VUzbSsfo4iwK16VRPWBS8fi7vwVra2+H9eORt5xv/jg/KlpCJoz0Z7saH56TCy5Wdwyp48ntOvNxtZvn2QcDtrtwlgcwbN1qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB7857.eurprd08.prod.outlook.com (2603:10a6:10:3b3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Sun, 15 Jan
 2023 15:58:30 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 15:58:30 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v8 03/11] parallels: Fix data_end after out-of-image check
Date: Sun, 15 Jan 2023 16:58:13 +0100
Message-Id: <20230115155821.1534598-4-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: c308ec02-8f46-4696-9757-08daf71158c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y7Cz3Je9tPbXS7OT41b/vdaD8UwDFapZ7xKdOXu7dyfKV6jp1pM7Bp8c+ubVkRQKdoXPYhuxOG3oesLZy3iGDICSGDFXUx1Rz8AsaZ0m030do40RcwhRddP7eSFCRcGlVL8FFue+KWxD1P4aT26oHRbhlLso0Fs3kSnlNWHd3spGHQJQ//dy4/W2V9sGbVlQQVnm5y/5CGVNyS2H/8nEoKhL9l+UXWPbPeAWaCJ7XBFMtiyLMAZP0W1bYfQORUKG6n5lE5wzpDRuXDFzTd4Jq1bNILb1l2juEz1dEEBgaxXAohhrr11MOlie7QMiKliirHlReF1FVb5bZHApRXWpDNNHutUZBMHs3j4iDBvvxz4eq5s8KmgTa6UNW62rgDMXDp44t+yGPE0/Yqb1rUHoc+HGJzGJZh6dPJxrbJFxY+trcw7Fc8WoGqNwa5Wl+7RxcLAj0X2uPO9S1EYBP05VDWKGKuII0Xo+Lrhf4UZB9JgSR362nKI8DHmS++oITXmWe2MATqhkkxMdR6xdnpdmplYcahiOk3EKLGuB8SypOPZfL34UIef8xYV5htSOaOrCpj4FP59E6wJFSs7QWoXwo9LTB6eKZEN7psuR9DzraGRsTHE6SPBhARsSuhFdP1osIub4SS7B+C413G7nn83zSbCd257YPZ0zPAeZpeoAwgTO+Jk0TwJHTSGwBRYusIe+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199015)(41300700001)(66946007)(66556008)(2616005)(186003)(4326008)(6512007)(8676002)(26005)(36756003)(86362001)(66476007)(8936002)(83380400001)(38350700002)(5660300002)(6916009)(478600001)(6506007)(52116002)(316002)(1076003)(4744005)(6486002)(44832011)(6666004)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z9VmXmBH4bIPrRCwY4kjq2KyOBnx9EByr2wCgn6Twl7VGe4zG9Y+mNF1MUHD?=
 =?us-ascii?Q?6ze5JUGDMkHG1iKm9cu6UVrubccBqJtNPJarMxWo7L3yNr03ZKFqv60q+w1O?=
 =?us-ascii?Q?VNf8In/M7dVmLaZ5WFuNyOVYY+qLye6ChbxayljUw2GWocSH0vej/vUmLOs0?=
 =?us-ascii?Q?Ik0R6V4sIQ65OXqRRlvpMT2sfyiRv+P/5R2PUFAVpfKH+7tObPZZNoyraWLu?=
 =?us-ascii?Q?x92lE0PN4T4Gjd8WemrHmvHb79HW/LFJcsqJwF+oNvixaH9FISOwGmIRPeKV?=
 =?us-ascii?Q?1SYWK0MfFu2A14ywl0zjWnhEGGe8EBqDTslrIUKWL09doMM/X4zFiDgcPqtJ?=
 =?us-ascii?Q?23s77QTK+k+sheGEhieWt5MMwqZniVByYuTUMR+Ymll0UaZ7dBdzrL4uDU1n?=
 =?us-ascii?Q?GKa5FX5Pr+HsurHVuV08EB/f+8Fnipw/uTCjNFSU8+QKh4OOBLl3arX/NPbI?=
 =?us-ascii?Q?/GbfKVZBquM9kD0PDly2FPzInw1uOXVH+N+sjIRjJVI9teFV7UQyqtNbfy8O?=
 =?us-ascii?Q?npUfgjQSrShs4NmrdmAWVQRihoLYYdFsSMHSVK5ZkNeNuQSoZT2VEjSC40VH?=
 =?us-ascii?Q?vlJ81btgtq5QnGErjhVCy3oFsKyxX7Khjel5vYso/Z4MAbI6q+g+kEXI7mIf?=
 =?us-ascii?Q?jqwFfCAMAvKe760FiojyFq2UEAnvXfystZ2ih0H3gEuVg2qTPYGxDHWUQ8F7?=
 =?us-ascii?Q?qt7kPzkcOcM85N1l6C4c1DHM8uPDthx9AuMfvsrWD741Knisr+XlFr96888A?=
 =?us-ascii?Q?G4jw1daez9QQknXK6UL4UDagnldSCSvssU6tiQdczOUwIKktPCfHjddlHuhW?=
 =?us-ascii?Q?SZzq7P3FWYIaTpKJp3KOmxFhbtrg3d5XFEgAO9XUb/NyOPp6tYY6cGC74vYR?=
 =?us-ascii?Q?ZnTmdK23ig+QuehzvKS5uPqcG4t4L+jll6Dru90nX6ERmU+8LXfYgWwuXemq?=
 =?us-ascii?Q?qoN2lr8SjwZSMtUePt/U+oDMmQxfFen/fBVvAd8jMKbm++9GP4kX35qcNFM9?=
 =?us-ascii?Q?Quf650uk91y/mQmGXYnvZHHJYyq88Dyo0KvXbAujpOhLeshPZo0aZNzHRu0z?=
 =?us-ascii?Q?2NnkWDAg9q8AGnr/LFihJtq2apQETNHaIF5YkluxMNj4qHsRr76VOpCJHce3?=
 =?us-ascii?Q?JwKtWeu6nySkLHPnmjJWSIDJm6PcC53dct9jXm5GJQBRp1E3KOrTll2AZ5Ai?=
 =?us-ascii?Q?yPe21zytnmn14JRoSD9ejrkJP8/qqd2/hXZfn2DUTh84TKF39thVzN8Ltpmy?=
 =?us-ascii?Q?uunJMmDb5DIfJ2uZ9tAjkmW77zjU2ZxAL2ksg2RuI+rynve2/gL/roxOR9OO?=
 =?us-ascii?Q?9VVbnc3cJAvfFxyqgQ+Fwhlb4wa9R3NC0Si/tWbcoxXe6xyqGmcwXZFvbo6T?=
 =?us-ascii?Q?fpGFlPIGqPZCBRzJUFszoeg3y0VLhvYyK0INy3QQQUvbrxNozA7c5FtB8M+Z?=
 =?us-ascii?Q?zg2iuRTnkDIQbhzbZu9fPBZ4z+dnMLQafACYKltnyAcfpYNisfHSJlgkj31b?=
 =?us-ascii?Q?G3ZnucRFGf45XgL71yJ/KHI+MjsFDv4IYDNju82W+jv2WUryxhuB+VD30h3v?=
 =?us-ascii?Q?tVo08ZWhtTRETOWujW3Iqq3UqE6kRbjSPMu8g1n12ZHL1cXTMGKI54nNLvXr?=
 =?us-ascii?Q?RIc4u+LMtG+xQnjE0rhX72g=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c308ec02-8f46-4696-9757-08daf71158c8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 15:58:30.4111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsA3E6xFzbhYOVdtE19BKlu3/imbjuz7fusLg49eaGPOK64kjj9KbXLLQanLIUaG2hiaLROJwV3QWhJMaY0345tCZJLmj9U6RuOyMJUrlHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7857
Received-SPF: pass client-ip=40.107.8.133;
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

Set data_end to the end of the last cluster inside the image.
In such a way we can be sure that corrupted offsets in the BAT
can't affect on the image size.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index 436b36bbd9..9fe0f33ba9 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -514,6 +514,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         }
     }
 
+    s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
+
 out:
     qemu_co_mutex_unlock(&s->lock);
     return ret;
-- 
2.34.1


