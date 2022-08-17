Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F235973A5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:10:41 +0200 (CEST)
Received: from localhost ([::1]:44480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLcu-0000uW-7T
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLNB-0006oH-03; Wed, 17 Aug 2022 11:54:25 -0400
Received: from mail-eopbgr60132.outbound.protection.outlook.com
 ([40.107.6.132]:65374 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLN9-0001M7-Ez; Wed, 17 Aug 2022 11:54:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhUWjkMvCdP3SMadAd2kWN+FTGOJguDp2AixRldLYLXo2V2qBe5TfOwImymCIc/9C8e3GPKHN+wvZ6tcUWzWk2zLpMB5aoLtK0aJG5RUiCB5glVRLn24N6NjeKvxvGUQSbOMF++pPkbO23OQY/T3FFKsO/fykGa+8ws76cZXH/0QHSM4zJzcZ25vOh5R5N6QkrwkLviKVEGmWpniE2NVDmPf1SeAYgRrXNekX3xlduZhEcyqt5AzhApPyOJUSjl82+jEY5eZ/prekfzElnbj+hsSZPKg/5Xhsh/VVUh6knWJdTcLNDaIlWZHaS2Q2gOoX3JV5JItYt5r2luYKanA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xz+DzqXqW919FkRy3ovwPtYiU6BGZbAT4qhL5eD+l8o=;
 b=ms8cmXaNQ5PCsHsp6OIKySCaJQnrqxeVEQNVkhwgZPFTInJBx553bYrWyIltvbKrxgHcZHD7j5Uw9u7gf8GHwI1TFvngeK+oJyqAwJMV4tWI1kOWmq3OkPp4fn1NJyrqTW1Rkir61iyediQN7UFvAT6Rvh0pYbw75bvaGHFGW8vme8QEMIeNDRA9dxnbUPgAh19keskkk+WtHv1qkMhwTbkqxiPHBHqHr8mnwz1I2wCsQogIjugLm18+qQgLE9cT3jgwNzXNStkE9SSiFNK8NRjfRH3R7xfPf2VxSbSiAECF4EJKtDoIXsiuw5QonC2qeXfaKLBo/xZzXIqlf8BUPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz+DzqXqW919FkRy3ovwPtYiU6BGZbAT4qhL5eD+l8o=;
 b=OL6G8Zu55aaHEdMkYbJPT5KC0zFrYN/xfdpIrX4/CgRSfpLzXTdjIZtc+2MTdgxplauQw6py2WcHQVqBr5odbT0bFM6FEXQihf3F//hJvmbSoGE8zGI+VuM0UHun2lRt/PFuM0VTWtcMQQulZ1Fb0drS3UjiL8V9X9z4xSlotfIhQ3iBqHqgVevdlYtMl8cC7iKpYD8eKGsNJkCJ3X4S8GoMrk91i8dHdMHk/3tbOj6KLrfhtut8ipYATr8CQkLpZ6sLsZY6vqVSCe0m++gCgXdKQxTG2r7DfxTToclIVVLfMoy6GOdVp0g2qHeGmIX8xcxocueDRq/0jo3LLN8hQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6783.eurprd08.prod.outlook.com (2603:10a6:102:131::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 17 Aug
 2022 15:54:13 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 15:54:13 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 05/10] parallels: Use highest_offset() helper in leak check
Date: Wed, 17 Aug 2022 17:53:56 +0200
Message-Id: <20220817155401.2045492-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
References: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2408715-a6f3-4bec-f575-08da8068bb36
X-MS-TrafficTypeDiagnostic: PAXPR08MB6783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GKGDogt9iyzGugtKsszcpPUhhx6X02oyG8fmpTcCjh3w7mKPI11TCS27+H5zwRWFLB2aVgD5DWH8wbkTKmemn2zQGcdAad3GfYvRy3jkJZRLcPjngPqiR4TVjRlWvo4LgpALioHftf5cXFqv44UOB2BppSa9x9GW8dlNnooHb8myAD/y7cqgYg9C8JWNDn3gBxqFRy446Nl4rEPiMK5T0EFe44/7PeiZQ/HFi/Ta9PT00ZDRA95o2DUobyn4RrSzSBfkwPs/N2G03Ic/V3x9e8UtMMHTcuoowYK49rMuuvInKF3hzBSOHB4sqE3yp4KQQRi5LF9r7K8kgpzVgvNWko8Km8RGydzsE+OGlq2qiNhAAFi42h8P1/VZ//WcJH1ZyqutqnBy8+ywPou8XJs3cE8FLaCIXMmqQ/fgGTZzqfCjS387ikYF9NQ/flei+p+6CKr4rk0YfhEFwMY0hMSRj1J6xH0TY77HtCW0Q+iNHGSeHsUx7WFJkha/HuVV4vrhGP+tfYMwUc02A1jZogmljHYuQEfV96BAmU2GrrP/4N1ffHDxTlNMfCw709fq26w/gb7bdKq646h93hNlLggAbjFrTaYNWbV+eiuWTrOkdaSV6U5Hi4T8H79T43Od9CUH5PckjD0JARZOlN1OF6eMZrn57d0kgXy+BimfrKK88pBNZplzv1OKfunuPB2/odGJhS5wKh2xTBI0qe1pbvbwNg7EmjhYnYUeTKgh1S0FN/xedR12zviPcwq1nY1HopkGr+7m69CTD/dYSzv2zAVLV2h+Vb8ErKaAPUJgvLE6dkjbDzFgv6QcrP5xbf7yM8ux
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(66476007)(66556008)(36756003)(4744005)(5660300002)(44832011)(66946007)(6916009)(316002)(86362001)(8676002)(6512007)(52116002)(6666004)(83380400001)(26005)(478600001)(6486002)(4326008)(38100700002)(38350700002)(2906002)(186003)(2616005)(1076003)(41300700001)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h+RPygArKXOI9NY7Ff1rHUZmSP04IJ/rPLAMBrU+987yIg+folruKv1lwo8N?=
 =?us-ascii?Q?HL8oJ6/ApfJzsIINUUmOZ7qvzSDhLyc7ybdjQQ0ij14yPJb2OeTUECjYIpvK?=
 =?us-ascii?Q?5u8TS2x2qJ0JvoiL/5CVP4ltm+3Njiecy4L/U55pUaKXpAeGryVQVA4COmDH?=
 =?us-ascii?Q?aTPd4G2eDG7k9NqZElWu948xR9liZuoA0zymwyfnozwlJFydiV5SO1JADp1k?=
 =?us-ascii?Q?F0BH9P3Qc0KBJ8Hf6McjRYJZC6PzGUgSORMDUeFwNgbm0KPg4VIdCYLKbFYw?=
 =?us-ascii?Q?ROhwNKtnV53snuPuxmL0YaGJa84SBbz5NABuYQaHchHmHY8/H9MgWbDx05QZ?=
 =?us-ascii?Q?J29l67BDtXmXbp0oGa27/WqbblrkQqLPhxLoXbvc+XZg2cY62KQ7wOpDcGGA?=
 =?us-ascii?Q?nfMDxI4tFY0KsazwiEI47MWml2SoXIfMW2ho/3ILTG+CqT+ZQuM5PcHXAP36?=
 =?us-ascii?Q?wOVyK9wAmqCTaW5iNjQItoooReXRRwsWujJCt6rUktCyDnW6S2+o1b2Etm+8?=
 =?us-ascii?Q?l2a2s8C5gWvagP+WNIZ7KB570Kh8G8NqkTOMoMzPbWeLUeiKpfC5Is2Ha9nF?=
 =?us-ascii?Q?rTlB36o3nrVvairP9wH+xW9Q9VSIadJxxCXrGAGchi1FzxixIV/JhsEZpdCI?=
 =?us-ascii?Q?8s+IRjtsTFkBtZ1kKUgBtlG/KdYLyvfbCkCTzAptmP0RAe53DDz8ixh4d3aH?=
 =?us-ascii?Q?imX/E/YtbJPduzXdnWO6zSaN24+E2w5ZA1xcNqXjPPoGfczpXwLihDva2hdC?=
 =?us-ascii?Q?LHQOeIRWNgFpIJadvORxTrY6+sbH9e9QcICrTjDWSAie3OuWIoOkbcgGtFrq?=
 =?us-ascii?Q?AOI0tKpJXgF87k+CLd7qZKvzZWLQj+nDenrsBLHr7mVh+YQrRuqRPa/cbhKJ?=
 =?us-ascii?Q?J0yPEFpb3S8/L4Y3o7QtQid7Oa9uG6RV4XuyQhd3fvPWNfxPLNjPCbvo2YbT?=
 =?us-ascii?Q?L+xyqWdOXmzZsu7Vo6a/x/Cm25KrTn3bUV2V/gH3+Cx1bl6qjmscBshnFTYw?=
 =?us-ascii?Q?uZ08e8eLzKZdPGMCdJLrd+rYmw2P8m2b9vqeGhUzGrIGDw28N9rlGViHELLj?=
 =?us-ascii?Q?aZJZgrD2XNFGa+sP7A7SAAHHjYN3BqT/XILPAzHxIBJ80q+3OFE2Oysrkjzj?=
 =?us-ascii?Q?eArEFs6lDGPy0UkDlj6rCzH7Wt3SzSDpse5lry+ugtUGrs19twYqsUfWYANX?=
 =?us-ascii?Q?8nKJ0LnlN60wDZ3aEg7yS4yBOjflP/mZL2aWr+LanFcbsBM6gGkMDbAeNhpS?=
 =?us-ascii?Q?Ty20wBWWhNRa2Xb9lN5wDYO34yMYEkEH8DpFFP+Q3t+M+n8dHfplSD7R6ttL?=
 =?us-ascii?Q?UK69pyd0tunpZYvJy8TKH3NeSJZNXi+70CKJ4mkG0+lkRTJsthNP7H1FnFyP?=
 =?us-ascii?Q?O1XjcoFwfVyD1zyiIGYP2Cg3KM9zBgrfXevDz3RhPtySybWEYoGJwktuT0o4?=
 =?us-ascii?Q?leMfKJBiPc+fIur5+XUlswcBhGyMtxHhgBHevb0CwnvLHJDhVsD2Y0EaHUS9?=
 =?us-ascii?Q?cBnkUAV6+ZLFkENXL3k3/TGCMmolE4kyRrInYJiIlSGsrlZLy+fdBZyuATYz?=
 =?us-ascii?Q?hgAT+xZFhVgxse62YlOkio0CSmfesYck0DfotP3EuI8UTSv21LOHKVZruvz3?=
 =?us-ascii?Q?Cep3FvjgVzWLlmnzWXMQ6Vk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2408715-a6f3-4bec-f575-08da8068bb36
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:54:13.3492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfmPoVUruElcCX715wcDkViE2ZfN3tDQ3oMsO35DSTs5+PCZwLDXnt0fDjwiyzZqxcli2EE4swz20uBp3+/zBjMpzC7RxzgU5VqDOKhkzyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6783
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

Deduplicate code by using highest_offset() helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index bd129f44fa..93d21804f2 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -530,15 +530,8 @@ static int parallels_check_leak(BlockDriverState *bs,
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t off, high_off, count, cut_out;
-    int i;
 
-    high_off = 0;
-    for (i = 0; i < s->bat_size; i++) {
-        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off > high_off) {
-            high_off = off;
-        }
-    }
+    high_off = highest_offset(s);
 
     cut_out = parallels_handle_leak(bs, res, high_off, fix & BDRV_FIX_LEAKS);
     if (cut_out < 0) {
-- 
2.34.1


