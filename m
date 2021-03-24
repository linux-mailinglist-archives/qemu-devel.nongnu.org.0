Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DBD34835B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 22:03:22 +0100 (CET)
Received: from localhost ([::1]:34594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAev-0000v7-RX
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 17:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAU7-0006fa-A7; Wed, 24 Mar 2021 16:52:11 -0400
Received: from mail-vi1eur05on2116.outbound.protection.outlook.com
 ([40.107.21.116]:40416 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAU4-0005Ie-Hc; Wed, 24 Mar 2021 16:52:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aB2Rwi0potVWuk/Un9yPlefaiTKI55T2puym0oQ9zPFjRpHkSe0sDP/98PGWvnvntCeP5ZvxI7Zeb1KT+UUeIMZa9H+m6XizCsX3tmjoLpbjsm7MT3wnJqy4ItErcwsrrsf0G/AtojHvvwuSwlXT/HANEW2sZUYDXQc3bT3Yid+hbtQhbg3VYwCHTbM2WhzZFgALWEZ8oV48zEWErCMxaCiLRVTRLdBslGsYKjzmEW7iM0bZXVLYMoJ3Rugb24zbOnl6mjTHRP37oFD/3pFdXg5zREqKbba30b6B7ub+fpc05HjdYVKee9L0lQcPO9su0WBwMCQ/ICz2ajI9jvVvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajHSNZBLXJdejHFx3sNu2R9jm4Sw5Pru+WDibOJOH8A=;
 b=blYJNrt8z7qB7MdxTLIVrN5kqViD76eKngvs2M8iKUtCg5L1QUPzYH3AFg8j4y23x3Xlo3QATIwktdlViSEXZKvWTaDRpoKKOtbk0UyYNL1x6TVrmC6JjAWrTtq5EdjR97f7MJRANTpOZCUWr1fCN6eGRQCOb7KH8rjCjiXeXK/x57YAXj0BGyHfbB47QN/8haUNftiym0LL3sCp4Qmrj7Vqkm1AtiNebuEzgQHyLYMHOtiZ+AVl9LvhMdqT5CQvielXtcYu28pNPM7tcWmvUiBpXwV180FH3REITkM12U4YkVjcuFInRxQFmnUyBaF6VfIvnALaHn8nhpwkBNb5Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajHSNZBLXJdejHFx3sNu2R9jm4Sw5Pru+WDibOJOH8A=;
 b=vN3FAf5pA/kLqg+qvzH2DhTgieKCkS7DIVldsvvsQubCjBsa7XsdawurndUFw2EMm+PrwT1ZISp3VdWX3AL2BxUtVo/yUrMNKv0qm9P1RiNhlWnLNRBZgIShkrPEv0f4ETw+yyTTEEhJVN+D3jaUcz3T0iO2X9Srb2tjoYdSHMY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 20:51:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:51:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 06/11] block: make BlockLimits::max_pwrite_zeroes 64bit
Date: Wed, 24 Mar 2021 23:51:27 +0300
Message-Id: <20210324205132.464899-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210324205132.464899-1-vsementsov@virtuozzo.com>
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 AM0PR07CA0022.eurprd07.prod.outlook.com (2603:10a6:208:ac::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 20:51:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f0ead44-08f1-4d30-5597-08d8ef06a8bc
X-MS-TrafficTypeDiagnostic: AM7PR08MB5447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB54475BF5787D3AA64E67BD04C1639@AM7PR08MB5447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xEl9zlsi6V6ar4bWU8+fFWezvQZOWXq7bIZ8iWWTTccmH4j2Xw/g63iNqiBg0VbXg4+jF63R7UcID898HE1ScUjrCeRckGFh7/Q467V/i1AlrVzjMtiO11ImKLQOAD0y2TbWnh02iZSKZJmVFeIM5uvB5ZAC8DLSWOwbqc4QjmGnSOFpj4SsEdIz848BmBk16taMe/uzahQFQdjo51p7+EH8xC5WtIGLuoFPDdNVwEqSzVj3t1HjTzsrs6ulaWPMHBeHPnksY1beh0Nt1TmTprdVZnF6PnCW+1pt6DZ/6RoKttr7mzzJqEEK/HWcvi4v/hgqfCt4A+lkmgiw1k+oJs/4blFSlSd+AL5Kv/r1Vq9JAFhCRTHXgSfhxDhOj5nRb5jJdawvH3QGlHKqyo5BkH5e7knW5l5L1LsXjPqgC1gwEAEiyeDlIE+4e90ZYfXKJ4KOBIdRq+TLqOf8wuiwTQTUyOoOm3K1S1qVCf5QOqKB2heZ7xA2xyDFxqrnBy/zFomG7g1nyqnlVL80OdFKmSUndIN83h4SchG6p8K6xTZy9Us4yXVkNltJuwP4B9eyCa24woq21JlnrqW3Y9LZclRGo1+sfAvAGiRyp6e5E9Kjn9qQi2oKL8X3smYQv7VFqf16lw2QCybn/WUMeSCS8kBa/BLpfs7oC3L+g6vCig+RJFU8SRj43Wnpae4Td7N2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(376002)(396003)(366004)(2616005)(6916009)(478600001)(8936002)(66946007)(38100700001)(956004)(66556008)(6512007)(66476007)(6506007)(6486002)(52116002)(186003)(5660300002)(26005)(69590400012)(83380400001)(7416002)(6666004)(86362001)(2906002)(16526019)(316002)(1076003)(36756003)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kVXU10pSsOsMYTmHi3ZcP7R5zv2SYl9kDva27xYPAu8L1j5GsP8jb+72bTYT?=
 =?us-ascii?Q?L4uheXa9PW2s2wWfj9ch6O1gJwA5q8bBnOORKsmrgqsAvFplQOP0loDUszan?=
 =?us-ascii?Q?th2aY19QXAzW2sFYv9ZaP0u/1EayJ5LHkfEA4+wScrrwSOjuulinsABadRSQ?=
 =?us-ascii?Q?vWbaGxX4fc2F1PUuXrkg5+QUGA1IlTu6izFhEswixWZNX+WnR5lCLrAtP5Kf?=
 =?us-ascii?Q?DEHRIBB4Zbqb28pDX6GrjuNsbuRSJserKpiNlr82XXtho9ptZb+HGLd+/14S?=
 =?us-ascii?Q?8sutVx5bmnmLUBIgbr5R3oWStA3vMlbYvbA+on+Nm+mBrdyHgzDzaLVuqJCd?=
 =?us-ascii?Q?2em0CCoKptlITurB+2cHWtWaqboWM9n0dnh0j+9vMrT7PpJF7F6OkV0ETRO2?=
 =?us-ascii?Q?O6KjGFSiHszt65z1IPjT7nIdzPMyJi+W7LDv3L7W4Lw6zTZMYi8+I6ovtfzW?=
 =?us-ascii?Q?Y7l/bDSIdnGNnif0/dckIxviKuJjzyQrDGocHfq0pq1omogegWeRM/EGe4GD?=
 =?us-ascii?Q?K6ugwMRTr0X4aLVJX9S3Z0n4slIeCnwqvGRNIeiP68GABM83lq3g4t1Wo9ap?=
 =?us-ascii?Q?lZgF4Oblq9su3noTHCSa/oi+tgwMOgeuAvVf3EfnCeOsXxUhVTOezl6pOwSA?=
 =?us-ascii?Q?gOFh8AO3PU366zxevSE8F9WUlP7hRLC8n+u+nTdwCjCJz/atOoixpJQlGL9e?=
 =?us-ascii?Q?7MOGjnr2f7U6wTnaULy+p29fiJTQeQv2S1i62R6ihAxwbS2tlyNkGpyrejzG?=
 =?us-ascii?Q?Debf90Lkyk8kd1NM/XnbK6GYNgtQrc3Bs4FmGDr48dCzYfMD9WOa7IBGH3f6?=
 =?us-ascii?Q?tIrRO5e2zhDRgU3oTYukBWdApji9f3QpC5wDdrZNbhKz/ZhVCRrL4lgBYn4H?=
 =?us-ascii?Q?Hq1ci8mDYaX5FJVXCaocJTpkyvYqXv1A8zwvnGAj0qxlj/i5eSSPQN8+5PYY?=
 =?us-ascii?Q?5hHHB/D09w9CC9v1dksN2b9LNNMjn1A3TxsXnk8Hh69Q7zvDVjQIFjmGc/HN?=
 =?us-ascii?Q?bxkdps0iq64wgiParTjjH/k9QHOLK8coRe5Fr/Cii1xT3VELLEB387xW7F9J?=
 =?us-ascii?Q?yV41Odqlyi2hdlYxjDg90kdZJdIgij2MF21PDaiRK83aeOEYROV0dILd0DHS?=
 =?us-ascii?Q?OiB9EhDxI+kwuNsOGdKU76da7zNtwURyHBptXEvezXfp/wYJC9/45FrEgnSg?=
 =?us-ascii?Q?NBgwczpHiQjXaVQRe+tGTD1Afec7AJsrR4YAdJaSx5WeUD6TCl8RijOX3I5n?=
 =?us-ascii?Q?zBwVuPMKGkumyYw27dkWlOZCtCMa6jD2vXeVg2AJebo6TIBp74obZ4MSLYxB?=
 =?us-ascii?Q?moFoN0ByT+FV7oWa0n1SHKyn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0ead44-08f1-4d30-5597-08d8ef06a8bc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:51:55.4016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q18XFVmhcbpYNCdumYQUNNVu6aymNgCL2owPaX5oFMLYGLZijdDeAifN2adplcDOsnoGi2KI7b0MYejfS4AlmGgU6h/OmeZVZZyO8nrBGoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447
Received-SPF: pass client-ip=40.107.21.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

We are going to support 64 bit write-zeroes requests. Now update the
limit variable. It's absolutely safe. The variable is set in some
drivers, and used in bdrv_co_do_pwrite_zeroes().

Update also max_write_zeroes variable in bdrv_co_do_pwrite_zeroes(), so
that bdrv_co_do_pwrite_zeroes() is now prepared to 64bit requests. The
remaining logic including num, offset and bytes variables is already
supporting 64bit requests.

So the only thing that prevents 64 bit requests is limiting
max_write_zeroes variable to INT_MAX in bdrv_co_do_pwrite_zeroes().
We'll drop this limitation after updating all block drivers.

Ah, we also have bdrv_check_request32() in bdrv_co_pwritev_part(). It
will be modified to do bdrv_check_request() for write-zeroes path.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 7 +++----
 block/io.c                | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 88b19db756..71e5025534 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -676,10 +676,9 @@ typedef struct BlockLimits {
      * that is set. May be 0 if bl.request_alignment is good enough */
     uint32_t pdiscard_alignment;
 
-    /* Maximum number of bytes that can zeroized at once (since it is
-     * signed, it must be < 2G, if set). Must be multiple of
-     * pwrite_zeroes_alignment. May be 0 if no inherent 32-bit limit */
-    int32_t max_pwrite_zeroes;
+    /* Maximum number of bytes that can zeroized at once. Must be multiple of
+     * pwrite_zeroes_alignment. May be 0 if no inherent 64-bit limit */
+    int64_t max_pwrite_zeroes;
 
     /* Optimal alignment for write zeroes requests in bytes. A power
      * of 2 is best but not mandatory.  Must be a multiple of
diff --git a/block/io.c b/block/io.c
index 55095dd08e..79e600af27 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1836,7 +1836,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int head = 0;
     int tail = 0;
 
-    int max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
+    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
     int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
                         bs->bl.request_alignment);
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer, MAX_BOUNCE_BUFFER);
-- 
2.29.2


