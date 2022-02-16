Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989524B9221
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:13:32 +0100 (CET)
Received: from localhost ([::1]:50658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQg7-0008MW-5o
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:13:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGc-00041J-7f; Wed, 16 Feb 2022 14:47:10 -0500
Received: from [2a01:111:f400:fe0c::710] (port=6627
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGZ-0006Nc-Ko; Wed, 16 Feb 2022 14:47:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwiGOKGKYyuo/EdSjDYv7zbCsEodaxgbSav2xo0g/Kin417IUYRmeSsts5PtZpR2LwJ0xt1TmoUYHZpJQEtwAtQFGfG+3Z6OthSwYimAs7jO6hPsP/KM/UMGfXdpvTcZ1XjT+MTDMVWJOHtXktP2DSNBuai594gh6KC6V3BK8zHloqqW9bRWH7NLts1OQZikwRSYColgI/X0M/DqDXMGsC/QjTzJZzvE9s916ZW0vXSkEI+BJtAttMO1rOUohcXxCdafB570SZhrmDt7qdK/+/bJMXCUZBPakDRQLzbGFCnGa0OG35GrSedylgNlILgbJPlp9jE6ttyYcHkPmVRYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/xI1bwVWeXrYH4wm9UVaY0DLc7UYdQSVr2/1c+jy88=;
 b=JpgvbDEjqbEMlCfjxDxSUXqx5l1gEj0SsUBRPSh3I5DGNLdwxRCJf8fP/psFcdh/2Me8YYFobo1cGTc2AaRa2CNIjxwr0AYbsq18wvzSpEW6mI7UI0Gv7ja+DoP/872gMvSZ/cSBiXLuJoK3LLp3x1c39a/RmwIL1sQSy9PKzu9vdDCke2X0BhviUu7s0z5SIFlf5pnn1CoKdHPSxcLCxoKXbRNaF9Gjm5taGDr+rbk4Ojt+Cx4a8JLoL34EKn5hjVRMGkRl/sCxFLDn3hp0TsM0U8vleioD23uqxSHQhBC/LNhSgelxg7AI/2Xns/Mien3jzuApwWQWcJHKbdgV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/xI1bwVWeXrYH4wm9UVaY0DLc7UYdQSVr2/1c+jy88=;
 b=ZMUo8yAqs6sTKHy0t0U50JG5ClLMtDke1HxsQHTbRWQhSvl+FasVvnr8SsIoosr2enRdoPSi27Sur825yDQp5pYS50q35Wv93s4aeU0ANP5QEqbdR5T0vVkNL2nbM9KDdL6CCcvutJ8l/Kvatsujg/AIO1GBGFXHpl+oTr82Q/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AS8PR08MB6856.eurprd08.prod.outlook.com (2603:10a6:20b:351::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 19:46:43 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 16/18] block: blk_root(): return non-const pointer
Date: Wed, 16 Feb 2022 20:46:15 +0100
Message-Id: <20220216194617.126484-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb75a533-a721-4e22-ca54-08d9f1850ee0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6856:EE_
X-Microsoft-Antispam-PRVS: <AS8PR08MB685631F7AC75350D240D4786C1359@AS8PR08MB6856.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FEJSIVqNCDJDJsmUzlZFcXHhRqyGG6JmfJXueJ4cQJT6ytKwo3xu2P/Fjc5y3Et+xDJ4MZ40h/wZeroAB1iDplqJ+SPnLSoSGfD0XySlE8ORytloAVJCrY3k4XojVoCwGoSfVY/gXMVpEXa5VQWEto+t5xyjC3kqiv4ozsZ3BaR8ynRc/nWYu1akMUDR24S3vxnB1qQvqz3Ytnt3Vgm6tD6LPeIVyJg+GQ1nBDvmUu2iD4CRTlVOIx2tjbgopSZ9cT6AQo0fcPFWLIag2Ebi+Fd0v+m/5VcqNjYLqXRGw7D8M8mZy70DHCXaYuQOb7vXY5FJ4106IJuner/eILGSGvIYTQ2gKCabEH4QNRQeJFpfsDDr54VKPPjHsoZwo8LkrC+nBsetbHLCUqqOyiz4y8XoyQcaAxJoHVgOUe0g3Pmk3g9qqKFzNnPrxn++QnL9GB07w59amAb3+pO0g3Srk9fKjsTTm0oNGhc+4kK+FYYO5PtnHAS1unRf6X9SB9mi4bo9zYBry5+BZXX81riZcAzZvbQv60iODpUTgF5nT8HuxtHNQmHyPT9fWaLgztLf6SVZ8N+opVd6ptphEbChPDZ3AHk9cjEMtsyDCehl6fVQtNbnKeEYOnx6ci9sZ2ofVxoxdVc7n659oBZV7lni8HvKQ0TeW1Sybefb6Np/JkdEXK9IVhtBJAHC9Vv70MWjmx/E4RJVkyzAUvnWp6WHkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6916009)(316002)(4326008)(66476007)(66946007)(8676002)(66556008)(38350700002)(38100700002)(8936002)(86362001)(6486002)(5660300002)(7416002)(508600001)(6512007)(2616005)(186003)(6506007)(83380400001)(1076003)(26005)(52116002)(107886003)(6666004)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yHqD8f99maPBasS10TSlmeCzfuZvsG9JvH5G99Dnmidww0OOYt42DgcyPP9L?=
 =?us-ascii?Q?AAgwcfUgz6vzDP0FZH1l6lwualm7Tx3XICvMbiGJUdQC9RCF+xnSDBeEQo3Q?=
 =?us-ascii?Q?hcQ9BM3vua7tlGFH+Vat3peXFSdQVpVfPl7JdT1DFykehfYt2nsFYsdDzap6?=
 =?us-ascii?Q?1PXBFSyFzVlxQ5Wh77uvd+3QPt75fRjOV8JAnuuC8O1qGlUQZcu5sY/UUlWm?=
 =?us-ascii?Q?VNuMmVcvb2La0ygl7CoiAJe8empQSue8iOVGU47JtA/2d40uAJSSR4xhQU6l?=
 =?us-ascii?Q?GgwmYhufNPwnSKuFqlbdGvkr3UgDyRq83jVkDXiWQWHMn+mfZZvgQ+XiSx4Y?=
 =?us-ascii?Q?NV5dnfbrqzH6Znj5J6C7OB6UwbSzHDt3VYngwZ5lnqU5HRfzlvQC3Y345tCh?=
 =?us-ascii?Q?YTKub4tVhiSTKlnkql+mtLjt7R838n35xle6KG1BMWjxjgqlXbFDukuRW+xr?=
 =?us-ascii?Q?6DJ9+jzQkFf1wOXTsI9wsW0OdY76pZhL4rfcBGmNjT0d0oMYti48OAyqzCQ2?=
 =?us-ascii?Q?1pfnz3rRc3xJd0U5MWYczbs6Th21sZMy83Vc6afohf0iI56ceADDk2QYGNBL?=
 =?us-ascii?Q?6HO2FwB8pjckhPZAQNIjNbvUPGQM8e8owRPdPz4xJx31hwTAM+gZ9+Apvy59?=
 =?us-ascii?Q?gqIVIE85uqfX27Swm/oJlnruTGnUkriWO3gsuQgGfN9CCh7JzQdGIPgmC7hC?=
 =?us-ascii?Q?gFOUR3ggXj3DKaD08BWOdkYEVx1gotZNC4zWwtYjI56gN9YLidYe0iqjal1d?=
 =?us-ascii?Q?DOl6FVF0h4JJeqJS2Gf3rEycJiDgf5PAsE6tz7DAv7eBORrDih4I7EgAFAhV?=
 =?us-ascii?Q?qfY+fW7xBeGar9lTj1lC2JCM6uuEMWyAdwjb6eYaFd22LO6TpujYTOjOGa4L?=
 =?us-ascii?Q?h8SEhKxyAJ8CGzbsfwqXHDNsDDIWod8H6iYD843hcBn32CjnT+KybBC0qYw3?=
 =?us-ascii?Q?uSK++BPwIMwjXA7TbJJGosSbAEbOzqzmmo0rIKpRYhzFAqa5vcjQUAtZyVnO?=
 =?us-ascii?Q?SFOFeS0wxRQv/5jlR9PamZx29gnN2/BrwrCPiNzgt12TywGXRkw5I4hIp3kG?=
 =?us-ascii?Q?WXzA977qV6WqZ2Xzt6H68Vxn+y4s1nBtXJ6Y+COpi5p7Lvu0Q55GQT2h681/?=
 =?us-ascii?Q?7ovzAAWuHak8QDbvHjAUhm9VawgBLe50HJEvX4gFYj2R2e6/YuRCmqoUTi2r?=
 =?us-ascii?Q?IGQ96dNdXZxjyk58Mk3tPM/kfkvAEhq+UxGhNGKOmnGkags3Lma1Q2e6CtW+?=
 =?us-ascii?Q?0a9WTvSCfrgo49wO3ruTGIGtHEyGbWkHuL53UF07E5L4aUYxZeUikpu7SNB7?=
 =?us-ascii?Q?q5rHiOi6NxuCJn2nQilkSYWY0uxRGm2ymeBH/bu6zdwkknooxW5FW5MHhpGe?=
 =?us-ascii?Q?qpol3Xdr4pueTn9X4qf1sBXgG5wlyw3HK0yn6BLgN2xO+TLEfi97+y/+qq57?=
 =?us-ascii?Q?SihlV9OUsG439tXryDwc7E9DeCi6qDtPO1vkUgcFQnh9St3hZZUCe8gQHSn3?=
 =?us-ascii?Q?QHWQP+eGLjh3fbCdsh10zz/0hAoOIik6TRU0VI6M8xeDi1R8UqhjDRiZ2JBR?=
 =?us-ascii?Q?cWA9Up8xyPgLEGAa/4LlaVEXbDnj009uiwe2psMcYzfPSDIAKBHvyx/Sp/Fr?=
 =?us-ascii?Q?GHD0HZ/49ttQVJmGStE5vPhcJjIFf0oz4Ary6OgdUaDt8/PdrBNlmLu+uIgE?=
 =?us-ascii?Q?ObxCgw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb75a533-a721-4e22-ca54-08d9f1850ee0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:43.3130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4pisq6rQoXPdoRnaBIfmLrrQYwn7ALPy2SK+WONDmkUcBWjI7XQCWbNWEkRK1YgwJFgPw0WI8OQfbwrmBn9CvHgpq2ZN7RbhsHQzTeCULM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6856
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::710
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::710;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

In the following patch we'll want to pass blk children to block-copy.
Const pointers are not enough. So, return non const pointer from
blk_root().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h | 2 +-
 block/block-backend.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index e5e1524f06..904d70f49c 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -277,7 +277,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                                    int64_t bytes, BdrvRequestFlags read_flags,
                                    BdrvRequestFlags write_flags);
 
-const BdrvChild *blk_root(BlockBackend *blk);
+BdrvChild *blk_root(BlockBackend *blk);
 
 int blk_make_empty(BlockBackend *blk, Error **errp);
 
diff --git a/block/block-backend.c b/block/block-backend.c
index 4ff6b4d785..97913acfcd 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2464,7 +2464,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                               bytes, read_flags, write_flags);
 }
 
-const BdrvChild *blk_root(BlockBackend *blk)
+BdrvChild *blk_root(BlockBackend *blk)
 {
     return blk->root;
 }
-- 
2.31.1


