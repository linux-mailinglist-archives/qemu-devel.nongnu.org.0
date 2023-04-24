Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45F86EC949
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:45:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsje-000417-2R; Mon, 24 Apr 2023 05:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsjG-0003uc-Bf; Mon, 24 Apr 2023 05:43:28 -0400
Received: from mail-db8eur05on20723.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::723]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsjE-0001KL-FL; Mon, 24 Apr 2023 05:43:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kV/hYneAJxX6Mq7hLlQgEQHWJdbKcFqFqAxOR0mSLBGEee8CU5bM/DvzyNNAfxR6DAM+I1eljS/zEx4gc+LJAIfaVEorDWdnyDU4TIzcNHhWKoInGzn2ZStmIbqwDH786t6/hG+oP/V5Kli3XNNEIOoyqQzOFtOf4hcG5wni6SYFTtadS3e0sPKsWrB8E+wMVfW8uMLxEGKU8R7ygkKpOGIfmKo2C1g5FY4xC7mS9u+sHztYkQ5LvqEEXd5Wk9Vn7scjWeakFjgQWrJPB4JdsSoKv/S2+EvXtelPYmFsdTTOO39Hc2ePJFSK7wMTCLBSWraF4tkx3/WHnSF+ctkitA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvYlYjE+FC4X0h3xY84ctwUCDNjGejj/g2TLHF1kcrM=;
 b=RnMceNQYvdY0L63mstcQzT6J4fCGWAwAhdUuVDS7OpAlipptM44lLbVMzU1MnQz6zlrW4XJdNd7qDOUwSzR/+Rt5sAaVkSoqbYqDYOwJtY31Mg7lnw39BqvK/lz796IEVD6UQG7gTXwnetuvnLVsA8tpGhVQkebQonXxpwP6r7UvylYPQ0V4EMJeD0U0Y9lhUiR/Y2VdymX9cTPUShtTZBVhqicWZHbjuESzmkBlgciohkVonVFxLL21yxaEKGtu7p4tY4M/b87HTmSWylI6xZC6ujRDi45fxqkZ6TDoDe7VWLjTexXRR4KYv0gZgSHnimIialtNpHZ2m2MkWcPmPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvYlYjE+FC4X0h3xY84ctwUCDNjGejj/g2TLHF1kcrM=;
 b=ehk6sujRTd047KiQe3oBLpcHRWAqNifLFXK80pKY49MWdIWiXW82f/3pRZcGKI0vi9lbwX9KRhn0/u5tuaymXq3kaGdowwmhrwXJp3OoLagSNxaXxDdkNIkZxHdAujwKpVGH5OCrVyBu1R0HIIfM/H5BUE3O6iIv5r9KrgQbb6B8rlw9iCqvdOUKJnbKrArcfwD3zXQIZMcPP2dvCiwi+wpNvT5y+0k14f2s881VtY0jRPeB62dBtAJpxp1tn78K3DuWyB3RQfLwVs5mRN9debfk0/7hKx+MVPUcGkp2gnnuI9TPPtEJ6Z8RfPJWnLYp8fdTr1QfdmFaDVQrXJi6RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB6188.eurprd08.prod.outlook.com (2603:10a6:10:1f6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:43:20 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:43:20 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v4 1/5] parallels: Incorrect data end calculation in
 parallels_open()
Date: Mon, 24 Apr 2023 11:43:05 +0200
Message-Id: <20230424094309.197969-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
References: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0247.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBBPR08MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a7f5ae-ceca-48a0-7a11-08db44a85659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gs3FHLZ2ahuTBmB6k+awX1y2kae1bXupRDxN8lKkK02nn1HiHzVYq5T2RVyfdU2tyBmaCw/eUIePpuhcrGy9ShyF+KkalLw+6OIB7Ie4CS6ZB1+tr6edxkdkfnTteowUo+6q9lA74fSIRVYw3u31yYl+qUSpgarSVht3GpiZmJKvxt6AtxcS7GQn5o9oyodsB2eMsHeiqhIhsjTdQJ1MYLppW4+gpZ8G9NrOCTYEE+SYQFSsJqUbxk/gwY13XCB3kCL4QSIEBP7aaNQIJqbNx1VegtVp5QwtlOLoH+UZNs+wj2vmEwMIFQki5nAsdOjqCbUqrrwaxEQdQfgycgIFeSho7fgR9kJbVg4aZlIK9ZhuG0yGcUARN/pcXlrferhjsktUNBBsXXIWMWvH7XV4XI9uro4mUAU4BDMWWKrs1jOLM3akR5mmkeQTpK2gD7DmTaZhX7zYBxChXs/0TkAS2YKuCIx5OlPV9AtPrwoA3N4j6jk+SohstAc8G2FFyy2PmUi7uoGGp1VRNs8YpJj7Xn68uBu2hYIVBkCX5LFwrdTDhaD1t95W+O40NkyrmD5qNjbv7F75NTkju8R2XZ0hPKhrJliMavVmEuR5ANqr7ghncCA9Gv8fOuJhQGzgR9Ic
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39850400004)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(44832011)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(6512007)(26005)(186003)(1076003)(38100700002)(38350700002)(478600001)(52116002)(6486002)(6666004)(83380400001)(2616005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/QI829e954p9m3cocwBAIn5OaZyLO++wjDLwaJtbiL1tAWxxTFrz7RB739FQ?=
 =?us-ascii?Q?MkCxHid47AlsZklVgwMZGDzDXdG8qJCDSWtA5cYJF4Zc9QRzzSewuLqK2ptd?=
 =?us-ascii?Q?bpRfix+ieG0wi8pxezo9tk0vjNnH4EGD7x5Dz6bNcntGm+Iv+ddUDGAp6NMb?=
 =?us-ascii?Q?mjzpi6uekau1k+myql8L5gwirstPBAgq4BJOSjKU6PbGnuoI/FLg3tQtg1RX?=
 =?us-ascii?Q?JURFczea6gsVWW8XehzLEIa7R50r6kchxrYUJ2HZjjncuA541aGLyCUf4R/X?=
 =?us-ascii?Q?fsHURY95r2LdKkzzlPX8ICxxagv8478WKIsYUtcQ0rFMdijQvbhB37NVjBnN?=
 =?us-ascii?Q?jq01KcQej6O6l/FYp5Y7iuPoo7BJHQmLW0ZuV1xlnVIpCh/PyR08sC+bwxD9?=
 =?us-ascii?Q?Ce1EeJuHKMk7/GzD8SaXRxNNWTU+nZE+2uMwTruSjbb12627CLZsVz5yXF3W?=
 =?us-ascii?Q?sXa9bObXdc1sr18pa9MP09ueU5uRw3ftJgDBibygdfJc5wxsrZh7FMMiNRvh?=
 =?us-ascii?Q?At/UwFwF1w0j0rOl32Gfv6+n+CfB8rHi/vVJEpcmfkKAWc06jf3JxHMbfT7O?=
 =?us-ascii?Q?eS7G24EY902h8Xj569LqlMJId8Fs4yBPuiE3PdC0gPCHZacFc4prb+Ano+dG?=
 =?us-ascii?Q?2fsO0MpKvBiGAQnxlo9mQy8Ak1LZRxcF+i2O5zjvDBuroY0b/OfppemJwDsp?=
 =?us-ascii?Q?XVZavAf4sPve5T7E/HORGKWS0z5XqeCKYTvx6tqDl0FQ1xZLs+ttz2Ox9bKU?=
 =?us-ascii?Q?owc2i+b5v9zYLMAE8RjHVRBZKT2FWLRTklNacI4hK6Lixl4XlPFYG9fePMVw?=
 =?us-ascii?Q?bskthfJxRz184JourdDAGUNu140KnSsBD1uPAlNAMyCqeHJsAqu7mAh4Ifcj?=
 =?us-ascii?Q?ugpSewjoHlVM7ROPhDejZAhBtQVQS9Mq8ZX3bISs9vnDG7FSLuzTAz+G8aSx?=
 =?us-ascii?Q?3kJfIK54tfyGFyIAL1xEzi5c6ErYglbGBcUP5dtBA++dzMyK/OG5n/SiXjfO?=
 =?us-ascii?Q?RrpoxELgRDvqxQejEpbsn+l5jsUBI4PdrS5cFhkGrinbXj9mmS9cGVvkTUQS?=
 =?us-ascii?Q?z2MueQ0Rp0LEuF3xU1X4sgwON/Z/rZezKDZTTy/xiCYvaD8KbPGCZu3+Suik?=
 =?us-ascii?Q?B9Zsb6chOBVPKSwcUzjWGPXSxCFMnMTvDVQ+Q67uP2wowSsSAOKC0FRIgX3E?=
 =?us-ascii?Q?mxEIKuvS49VJ/p+qcwbFSaLnmLl3pr+4u/QQGFXDm0wH8LG6d/Q43rgZSzXF?=
 =?us-ascii?Q?+6pOffI2exKcn0pLjRQuPB6F/u71Umfgv8DZL98ciu5WsFu1t/Q1sasyHguN?=
 =?us-ascii?Q?4HVJE3TjcaZqUgUvqVuediQD/tb0ZgIE37gCNQOSxyASx5NCN3HMqPdWQOKV?=
 =?us-ascii?Q?DuJU26t5vOkxIcpt0XjY5w/HtUh1IuC86bC7O015flILmToPEMHhRZisS+iJ?=
 =?us-ascii?Q?u/YliXPVLkyvaghATq0m3YLPs81s92eKQXG6Te0pwMP2AwAoCiQlZMGiJNTO?=
 =?us-ascii?Q?NBusqMKL/skI3fARlJj5+m/a569qqDXaC1BEIEDjzZSsIneRQ4SpoR+N/mSV?=
 =?us-ascii?Q?3Dp3W7KwPnygU/ObT5ownM2Jfn7hN18XStUhrQ3AF4IQKKaKDpwJdnuZ42+B?=
 =?us-ascii?Q?8g=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a7f5ae-ceca-48a0-7a11-08db44a85659
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:43:19.9762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrC1NAjRTk5fMw/Xpl27gpSz+hIYNRFNYkdE4cUZ06AdaLTZgBEV3li1a0EDBfZaDQfm8naVZWeKhMjHjkh9f8FY1TVLbvEGTTMNa1t5qm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6188
Received-SPF: pass client-ip=2a01:111:f400:7e1a::723;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index ce9ac47c55..60033c1204 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -861,9 +861,9 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
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


