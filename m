Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41EC425A19
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:56:37 +0200 (CEST)
Received: from localhost ([::1]:46380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXdE-00036w-W8
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYXZn-0005vV-CC; Thu, 07 Oct 2021 13:53:03 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91]:59585 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYXZj-0002il-4R; Thu, 07 Oct 2021 13:53:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MC/qMRcvnRzJQyUAO+hUVch4V7VMxXZQiunLnS/3cgbIftZ7++P1ZaGpX2O+3K0h4cmw2yxEGWPEXoqb5HZu4vyBiGGgoTcaTRzsNZh3CKyTAFzbXFEn3haMev4r3tl0XryWloZ7JrbKL3NPaadjZGIF9kNtTqjFX22i9fghUeVIbTQNmm34Err+iTZy4wWp20ZX7/qXYfSw+IlxwnHQnkbagRAo9mK7R+Qnjos4u1E6y7gF/lVB5Z0gRELmZ20B2jSQJCvi9zNu+6SD6sxCYJOhcXPBc/FNk8/bp7YfE/85SXPuM/ySBwb3RbQNUcMVBPb2lHaN61ykRJoa7sIB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUw469alwzGahZgaem1O5gdOVz7U+AJJQuawJAIv/nI=;
 b=HaXR5ZWPsvHXNKutnzHU4qiLtebPYjGqSpij99QPeCVuadcgdSuLhSsKwUnixtRdB/nz85gdn2SqZhUJ3CPLIE5AR33Zo9TiSglsNoE9yZwCnq58Z0LxRaLOSDjTHnOGFV4YlUoYeuwqUIPJVHWzwrGyUVrpc/uRssfRaIbJ2DEeFa/qS/02wt7+Z6kNt5FKuz0e6+sQCVzu1N52hA/jDJFMnMnWFVz/zP1ef+3MBFOHptTAt2SP8OIjjD3j+JN9Vy9iHvlM/KyKlaZoq92HWo4j8c1cSDAZx7k0Hs2udhceQAh47Y4N7XSCJYbiKKztCBljPcQ2ogNmPZOtQOz3Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUw469alwzGahZgaem1O5gdOVz7U+AJJQuawJAIv/nI=;
 b=JcaMZZBf/UajZLrbrjdh+5KJLk/Vg9cIip90FB/wp3pgaBwW5t/ozbJaD99pr1YF2b+8LrhJgzBzWBv++5lyFKLINbCr7JnHb8EgH4M3XChA2qdmqV7vO7IrL/wzpcNet8nOtS0s4axynr4b3EJd2uF+77ljVGzU7HlQfIBo8GY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1779.eurprd08.prod.outlook.com (2603:10a6:203:2f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 17:52:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 17:52:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 13/12] block-backend: fix blk_co_flush prototype to mention
 coroutine_fn
Date: Thu,  7 Oct 2021 19:52:42 +0200
Message-Id: <20211007175243.642516-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006131718.214235-1-vsementsov@virtuozzo.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0269.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0269.eurprd06.prod.outlook.com (2603:10a6:20b:45f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 17:52:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8132fa7e-e89f-4cf2-4084-08d989bb4951
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1779:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17794D1886564B10DA7D91A0C1B19@AM5PR0801MB1779.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:192;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RvIxQpXzHA2ohlagTHi4HkXau/VbKfXa7+G8+MyPiFwNCaxTa4NltaX1RfPclePNta4dOB/o2Nigm6fAMbwG2dUAfoSJ4kenDtX3cThQKYg0r9EIi3lyqfoz+xpLnHaJ6501BaICuKfeWhf2GYj07w3+liHVDJf2psOcXkrC9vcy/ABTyajZ0rCKRwtpv1ZMJ6RCjrxtLdGhD/RT+M8BoRKCrAj5LHP5FWfqCuv4HVPoseShXJahq7RTPUZcbiDR5upGvGIxb5sILIHfoytnjDU8Uhctk28/ttQEfzyutyZeVtlOzMkVz6uMUtsoWbxrx9HJmbhcf3JfS4omi+melxLI9kKo4AznJmq/U3eKIrtFQghXuqFz4duXf6fikpWwFKX3tax7ApTx91bWSC95XIYFSkXxtTQE+zUwcsAm5QHIzx3+qJiY0xW6oyg7DYefvIzDbsFBS3wiTwpKesqrknE/RQ/PZZf7tmfdNn/L/2xjR4PFm7xGO4sGVoYyENOe9qALzIn4VrfR7NWXSRJ50DsJLfPBDWUCwB+DV8nKPKUW13ntILvHbcManK1BxeFIRc8itOr8TRWtnqV2j1f/iVrWhtkBSt/T3/eTQu+FAbEYBJKwUYJNY1PsxF4LP1ZdO1O+vWAXPP+nSbM/HRcpgP3PLlq1EeSUSvxx6Rc+J7hQX9cRN/daYBb+zYFZ4SAQ9KB3hN+Zsy7k2Ig3mF9X8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(2616005)(4744005)(86362001)(1076003)(8936002)(5660300002)(316002)(6666004)(83380400001)(6486002)(8676002)(6506007)(6916009)(2906002)(52116002)(66946007)(26005)(66476007)(66556008)(38100700002)(38350700002)(956004)(6512007)(4326008)(508600001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q6Bl6IRx20/6BNrkMUyFW2ozcBqA8iI9SVlkiSVChimzm7/P3w/ATvpS60CL?=
 =?us-ascii?Q?bAfgYO9focR5tKKbIjMKXh9M+Lp6hyAXh5o+2xYhS/4GTUhBGmcPRRR3BZp8?=
 =?us-ascii?Q?8AbmQxhyofIF/Klri0Vws3BQ9QBvrn9OdrBet/UJMDlEYnQXM1lZQ6GUpmae?=
 =?us-ascii?Q?chqQ7Sui++7K8y7ja1uhVvJeEGhICIi85pgFymDRBUcR9SIfeR3gsi0k4qC0?=
 =?us-ascii?Q?wE4IRTO1UbH1x+H0jlh1duVpGhJaZwlog+PqNDEu9K1nIVSYkoknj5LFKY2z?=
 =?us-ascii?Q?IriEmc7cO10S+vCdJ7t6zGdH92C9jNF3ZvdDv85vmHE/KEDgKMmcYMLIXYFB?=
 =?us-ascii?Q?zNy3MvfWLjWcUU0EQOtW2YmsE1mWS4YGCD+bAFO6snBTp6RzGxpDJ8AaYW3J?=
 =?us-ascii?Q?wY5zlheHgr01llHXrvDxNC9RPwLVi5W308+5NUFa0iw2QlD2nFt+YxN5tK2e?=
 =?us-ascii?Q?XoEUorCsswu90Nv1GCdVNWcUYSB6lxAUbtsQcYGbseNHTRRNnPtRGmlr9Gfm?=
 =?us-ascii?Q?VByqh9pEDSRTHnaWM0BAytbW6ayKv9XUIF1IQaazNGPf+H1M4JZU//oWTiQH?=
 =?us-ascii?Q?GH7Yqq7FrDExeZPIp4Yak4hiMxfpncSrjDjRL58ro6MPweaiF1FsGrL3agia?=
 =?us-ascii?Q?ESoR4wlSkvNT4owDQh4ouNSqkdDCFw+zB7bYD1QYSs9It4DyFdJr6dtWdnqC?=
 =?us-ascii?Q?9LiaFutM2JXAOaZJFGsyDNSQhyuUZqweIv1QiDpQkQwMQP+5HIrkl97b/tzr?=
 =?us-ascii?Q?zf+Nhfn6AGGmGTHH7VUqlFvLzMaG6/eIwb5537+Xi/vVZ8p8T4qWSwvWFbVb?=
 =?us-ascii?Q?Bcybx274P5Sim0C6KossWxJk81Y8ngZ/Q2LqWM+RS9bEFEQie+w7niV+On4r?=
 =?us-ascii?Q?DJr1L2WBDYxhlZqGyBbRBfSJqxg+/G+9xI8UthvGDZsr2814i+7a3eGuZ81x?=
 =?us-ascii?Q?+ozsfj6fHX+sgI1ecl+9xpW3AQmwGBkzBfstfdLS/Uyd/inI1ZCnrp01pxm4?=
 =?us-ascii?Q?5l2MBv3V+ixrxD38cccROB25Kx7HXU+JJVgq1AsfjVC0e1SojTaCzYzx6nO0?=
 =?us-ascii?Q?UGC9o3IbYTaqzQB+xIL0tG+gD0C/SkB4Sn8mkedvbs8XvuBjbhE/bUCpAIqU?=
 =?us-ascii?Q?Q70rxrvx99Xr4C2uzHOtEtZ5XeFokjZF2L+PxhJXKFSnLGbJYhuulEPDOY/J?=
 =?us-ascii?Q?vgpjCPQr48uPcpUOySilZ7ekV7959GktoXTu8NCb2q+2NDmTmzu41wMpP4LW?=
 =?us-ascii?Q?2rTgYuNMBdmVmjx8kVkXv+2mrBRltU7Bvdrqu9qrmMMg7zkf/jR2pb+qZvVx?=
 =?us-ascii?Q?+XoqiSVb0wizRBQa2xGCkIRX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8132fa7e-e89f-4cf2-4084-08d989bb4951
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:52:53.3229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuKvfJBKNN8GaiGac6/L5h1u9NFVr/9OZLfL9CTsrUFe/HQXwJiT2XRMzbPiRJP8H4bIsciREFqRdJuxHqh/BelcpRKqsxNpzHTSfYBp4Gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1779
Received-SPF: pass client-ip=40.107.20.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We do have this marker for blk_co_flush function declaration in
block/block-backend.c. Add it in header too.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 979829b325..f3227098fc 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -183,7 +183,7 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
                           BlockCompletionFunc *cb, void *opaque);
 int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
                                  int64_t bytes);
-int blk_co_flush(BlockBackend *blk);
+int coroutine_fn blk_co_flush(BlockBackend *blk);
 int blk_flush(BlockBackend *blk);
 int blk_commit_all(void);
 void blk_inc_in_flight(BlockBackend *blk);
-- 
2.31.1


