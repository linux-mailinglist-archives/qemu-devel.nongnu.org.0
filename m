Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E1058C83D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:16:44 +0200 (CEST)
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1gZ-0005K6-Na
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1YD-0003cj-Hk; Mon, 08 Aug 2022 08:08:05 -0400
Received: from mail-eopbgr60132.outbound.protection.outlook.com
 ([40.107.6.132]:10881 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1YB-0001SH-CF; Mon, 08 Aug 2022 08:08:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBTfKZou7beIy99dM3UvpD/IZ5cE17+UGvabpEh/sgU8OHihlROuLEbN3dmkYGu+t5AGONsnXRc+o/RRXnhQfWdHbcodrxKRbp2IaGL9UvN2Hikno+KE+f6REEu5KcBE4Jkv/iskZjaXJWzjuSuzy8rUg5DsbGIAIZleAv8oei6AAGTZJ/lq71Yj/xuuUIsq06kikTuM4E0c2xrAx2/siZLQCzFMc0FlXygtl15yCx0QNUjLF1J4L+p+nfCl08H30c9vh02yohZFlv5dEV8xLurY/ltKqnjjft0lnheovUZqIcnW+cyfrop2+ZDQKzpcS0GqrqffUdT9IUWugBAjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VdphQqlCT/vIj0REPpVfTCqdLcP+9kPa7/JO7/DREg=;
 b=SEJ3sUMx6rytmuFbk4kOR1S4U2MMOTpXxYKviHK/4NnH4UsFr1D1fvLuARE5YQAIX5I/d0p7JXxtYhAQDTA78oFC8GV3hRl7h3Lm9xIz2hPUkiCZWI0v4QK2jMVDf3nid2juoFtaMe7azP0ZjcQXFz9MBk5ezAIGxh009CZAlBuw+za882Sk7SL42+MTXjfJo81etE2kOLBpB/Ob/W6xx7hY9OWo6PbVhUpL9gAFYHps9BQg9bzakJRhegWHY9twk/eRjxbMWLdMDbrBBx6WKlXq6PdY6W1IFFiiVJthyhNQq0Hm17RAjvCPAe1K4cy975qLScvWMIn2BYEU3lZNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VdphQqlCT/vIj0REPpVfTCqdLcP+9kPa7/JO7/DREg=;
 b=Yt5DbF9brmA2A96KXaFB/ET+aKm/bMsaIrYX/jg1YItU6lwGYqMFjBpRF/ClVbRMx905hKOsxqgDjWWDznhxfl9f+mFI7Aau0UD17YWS9IhleKFtO3+Ce7RJCsNhfB5bbOGafYVGOWPeovtEaqVKySyLhkfMQ/FLI27018byOa/mzakGdO2JMi+ivjG9pHqwZ5tAFq9r0jrFGx+8V+qYcQIV8LnfsIS5DWJGj1WiYNPQhwRMw3RWWmJ3Q2iR93F8rYNMi5Ynay4d2msIfKKarL3m8qMfLz0Mc/0epAJT29dnr2c0Awi+20xy65t1Q7OMs6UPJg+SIUtGws8BZC45UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB5360.eurprd08.prod.outlook.com (2603:10a6:803:132::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:07:49 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:07:49 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 8/9] parallels: Replace bdrv_co_pwrite_sync by bdrv_co_flush
 for BAT flushing
Date: Mon,  8 Aug 2022 14:07:33 +0200
Message-Id: <20220808120734.1168314-9-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 020169f1-cfcf-4c91-1a51-08da79369ceb
X-MS-TrafficTypeDiagnostic: VI1PR08MB5360:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P4ItX+ps0aKihbxSQEk4C74+QK8VorhoCAuq3sIdcTqAnMSZJIyk89lAViswPECDw7mwPHDYcXxUqUxd1I9/pErMWyqfA0UrZ+62+VeO3OLR29pn3hkIosdsBoLOKbN9AlGV2zIeveR1V4qchVVFG3npm3O05Yb+icNtqqwviUlAZcJE14nl1GCFusWfSye7ffTIR4o2YGyzF6Y/2LdxTujuundwIqLSI5mBw9nPyW/6r3pWypLGc4P3VT0vFCIUbdbXRzj13ectYMX1Nmf7wlN2beKlrb5/JXbtmYRM6jvyskgI1dPTzRA6ELXZQlqCrK4zaoB9o0ZNOHfSBSSTAlzsOjzidzH9yfvVJrBZo18SbvYTF/8AfGXjDycQuuNwx42CgRie7hHD9kyI1a6JAfjgFL1wB/XpcB/Nd+ub0U8rg/nMw1c3BgcMrkeeQSgogR/x4cMSV5ifAF8LiogOVk/STIEtFaTYONC1L77xTfagKIDZfXqzx+E1Tkj0fAgpqsPDVXatGgBbn7f4WIRnKPCTweNePPOqvoEEhP15mHdQKg8qRH/Xzd03c46gSgwzYaFgc+aVgQKlmw09KkptAmsfq1sPSFKw0VJf5xGS9z9Q3ZOd6yAoqLy3KTgRFe/6UG2OBLiIiuZ/fhlIxayrC4QXsMAhApFhrqhFJjL7rWug3wQ8IFWws0T7B9ubKbZsmdSx2u6ImKQ4pdUXZGCOE0YJHfSz6VJRnmbSFz4IF+rWVD6fX/P2oyiVMx7Xr4lC6m8qSTI/Ag3Y0TSfiqInbL2waOlf2G08wdtuZQ4i1hc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(66556008)(66476007)(8676002)(36756003)(4326008)(8936002)(186003)(1076003)(478600001)(316002)(6916009)(5660300002)(86362001)(66946007)(6486002)(4744005)(41300700001)(52116002)(6512007)(26005)(83380400001)(6506007)(44832011)(2906002)(6666004)(38100700002)(2616005)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K+YQdNDp3YIhw9H/WdcF5cf0nhZ6JExXEJVMqiZBcigAEf+fLSUMMDRCU8qC?=
 =?us-ascii?Q?KxW9lkx7dphECmgDjEL336sWAWx8dTMouVf1FW//mecg75FOsZir/oWDebJv?=
 =?us-ascii?Q?TcYdd1FQ25BTL8TY5R4D1wPr8V7SDNhGCjk5qhX0lDqT2c+m0KPCMI9Z9PZl?=
 =?us-ascii?Q?OEZjn6AqxhFZaI0X4AIkdtopwlWKm/qnbwycggeYQgXVAT2tmUTVPZ/Gr7N9?=
 =?us-ascii?Q?AVbkQ4fuS1NhT2abYr7YyEpEd+tugL1paB4OV0Ws/M7otNia3VUfoOLKiH0G?=
 =?us-ascii?Q?/78Gi8kd92RQiDtxeEQ+X7+jy0IzG+Nm7vFIuLp2NZZAwiti4JxwZeHwifi2?=
 =?us-ascii?Q?ipbKWJQSWapJnNd2qWXZmtMVWXeIz0c/fJmhsNK+py0BLIEsDR7bNtzPD8aD?=
 =?us-ascii?Q?r+j3lJtfSw6aX/IpA7wZAJKq/nFI+LLl/RLC90DIBOKyQY/ByGAqvsY+7l90?=
 =?us-ascii?Q?KmHpabYBXTH7o5TC8R+EEd2uRdcEPIqXRadjoUKmEw6NI1ycpT37644R9RK6?=
 =?us-ascii?Q?1bvEWbmwwFDcmPPg1MvF44IzeKReRrfoFMuRnZVcnok9TbFcJwk141u7M+Qq?=
 =?us-ascii?Q?wJVf3j1tGeZ9uw0hxJ2QdF2JqxDeTWGhyhtTWqnJ+H2juG/SLEMAIpxDe+nb?=
 =?us-ascii?Q?+zOJtLzmIiz5PHL+AMLHBnqrno1vPLytHgnTJKabVkLnzfxv3toJ6LZjV5AU?=
 =?us-ascii?Q?6X6DAls9MhYZojkObNlLssiUM2gWH3ILgBxuZK2rvDMTAteJ64NUAVWv0DUl?=
 =?us-ascii?Q?NF3c4SAV1uPQJrXLsaApvK9hfZmXkZBAzRfReAvN9GBPkrUnsFA+dV2gcmVB?=
 =?us-ascii?Q?pXqFsp3zDiX++8TR/25DWYRpyj/GFdYVtPPlmP37mR4Z3BHxB9Pr6Vz3WcXS?=
 =?us-ascii?Q?/8lA8xp6AlL2M2M+fsxFf1SEXlGs+oF47m3TbOVsqzFMT0kpfG0VljAMnq8B?=
 =?us-ascii?Q?IQqUQk/xVxrY6d0PC1qHnork9jvERE+c8lVM5ok0Iv4E1YIutFdwPz2l5k2X?=
 =?us-ascii?Q?Qlp/DIgPyIn55iRVfijyb0pSxyqjcOpuFdmnzHcJK5u8hlM33CxDEpCs8RK2?=
 =?us-ascii?Q?0mSEztKpyOTbm1gWtuyLLnZDOO8lbvKkAteCq6hMMK19Bn07ce69PV1urBlF?=
 =?us-ascii?Q?W6tZXRGFeuIpHcctycK1dldFYt/nUmaO4NlJ0OvtUtSeeqS+7Gw1F7v1Tdjn?=
 =?us-ascii?Q?Qc5CjwbIndbRGW0OIQoyEfZZeH7w3wAzgMLm9/VMhQ2hHSzZAi6XoN1LYpFb?=
 =?us-ascii?Q?rhMrcHSJK3/qZREwbkbActTy1kFdKhb7mEcBW0aa0/IRhC59RAlM7nCHk8ll?=
 =?us-ascii?Q?L6ziA9qd+upxPRT/brOA7E/Y5QaY1aLh2JyGqwgYhL0InFbDjTwVc9LKyE2V?=
 =?us-ascii?Q?GLLCydPPnOubkvgcHJjpUDHpC9SbwPAlgrfbHtNZ/eMkbc8MPYd+8W+qFgbL?=
 =?us-ascii?Q?Rhm7I+yjYr9sO7Bn4HZqV8d/wDfzSR8skwapTpv8wSE11JC55WhKqq3EVCEU?=
 =?us-ascii?Q?z72vhTMVogcmW9zJNLkUbGBuN//4MSGJk62/BWnDcbB7dnYm91QZ41/HDSl6?=
 =?us-ascii?Q?7DKyNx4Sr+U7+u9A1QR3avvIz3K3qBF+/d78E1ky+n+VVF6FUj/tid0NV8Jt?=
 =?us-ascii?Q?8wI1DLYTwHydWqr7AL65rVM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020169f1-cfcf-4c91-1a51-08da79369ceb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:07:49.5913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbAbPUNxGEMGc7HHfSkXd5s5Y97pHLXRYPXVl4/seibEPd2pOrXuca4rzGEBfHI3+LYVLEstdrvTpwFqMlw32xPuDeVDRmIogQYV2l56GnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5360
Received-SPF: pass client-ip=40.107.6.132;
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

It's too costly to write all the BAT to the disk. Let the flush function
write only dirty blocks.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index 72cf7499c1..38b1482e81 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -469,7 +469,7 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     }
 
     if (flush_bat) {
-        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
+        ret = bdrv_co_flush(bs);
         if (ret < 0) {
             res->check_errors++;
             return ret;
-- 
2.34.1


