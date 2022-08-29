Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F1F5A4615
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:30:08 +0200 (CEST)
Received: from localhost ([::1]:40194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSb5r-0003iy-Gz
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0a-0005wY-TR; Mon, 29 Aug 2022 05:24:41 -0400
Received: from mail-db8eur05on2109.outbound.protection.outlook.com
 ([40.107.20.109]:39455 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0Z-0006h6-DY; Mon, 29 Aug 2022 05:24:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkejueVh8wyDlaKqXzavs6rx5OsSM+TV8SuuR34nb5I1FBhVYE7kX20/FuuESsCB5xe2juNRsVt5ZO3OkOEabYXT2eJJYpBtO6OFKFh2wMU8flC1ZkPPruIcmLziGwg+D1Xf2/Pd7q+kLGcg8vwkEi/OIUK8Egp0y2Vvk9kB9WtZwpwaaf8OZl2TAPAnP8CkjQcq5zS7Qf2AxmW33tkvcB7Tq34bzbFI7L8/86S4y2nLsZi+68rXiqFDaVtt3gL+p+L0zvRnOVpFoVvXyq4HZrWe6NETbNnN2SozF1oEJN4xMNsV8hmmGy56CfBtlu7UCsqEoyqCGtLWmRP7SX0GMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYRFUpACEhkX+bXhxRNDhGyqPDgF7Ofp2pS31i/7POo=;
 b=ieH4JDpAD7fj2lJeGmOmhxxIKYdF6hrM/rWKT9XaVld8vY9cUPuXlC+Qbd0agvWzFR8l5eB3AyTQQQkzBITPW71p4WrVTWDnVcxfnXXUiAKf5kaPP6KGyscHuz6zHeS+533bUm/Qgia9CeUbxOAxtRBbGWxHvemAlFOUIGNkcbQDcSwnTzAxapSgp93Yag6bd0vmc5wNf1Fbt7eoNxK0kHlMut0SZ12UnRXtZSb1kTl5JYrW7ooDo4cfEZD/rvsIGyLOfVMzf0qz1ymTMEbAikbIjOoh/+YZLyyUb49B2+XAwl8s0pPyDWOhPpEtDpy0Qp3K5EyILLB40NuIcKa8Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYRFUpACEhkX+bXhxRNDhGyqPDgF7Ofp2pS31i/7POo=;
 b=Ei/aiJQ6BJ61kSizYnkPKMZefgSEYOX0b06IUYh8PwDtcaZFYQNqck+fxUipmL8LMsEi8CgZj36RQD7AMlR2muA2O0a4ejT7xXIQ+NbcEQ/+MlEqDMB6M9LiSKe55v5dpbVbYyjAUpHOgtIxc2nwTl3sEXURHOWoZeqjv7F33Zwoc6Q7RRVTyAWhcuSFjX9qT6R5Ho/XdfGl377Kl3m7x1jUMp0XaE9UE5ugrOJoYyO7V36W1+SSnndioZW7XFBhDpeKL2j/Bewvl01kLNdigRN0QEUAXA2tB45FWd5QxxIjlGrPGJkXUplGnbhrDKNxywfW/3L+UDx+PeyjnFXojQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB4447.eurprd08.prod.outlook.com (2603:10a6:803:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 09:24:30 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 09:24:30 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 03/10] parallels: Fix data_end after out-of-image check
Date: Mon, 29 Aug 2022 11:24:12 +0200
Message-Id: <20220829092420.341050-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42b71639-752a-41f8-459c-08da89a04689
X-MS-TrafficTypeDiagnostic: VI1PR08MB4447:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3oqHhiJoGM1HuwHw3Y5snW81z8A1xgj0Iz+AXpw70nB7e83cU+46gDtJqbhSWAndSSnAjhrfmOiEtLyAsrCeEjLoue7m5SdNvyhtCimJYXr3pDV8ZAEdhzYB5EwYUnv6lYUg3he+lS3zCRUZ7qjo82FvUpjxfzCuhcDDFPXUUSmsS6Qs90tSo7sQ1JGrYYljkWQ1UGtqpPld4QARyED40xh7WWshVG61OHq7dsVpx+ByLF9RAk8/Nry4AduusxxwPgDCiDOEE0KZWsR5jQQ1sNcFQG+Y3e89HQ8f1PHCwsPV1Xdzcz88VurmCLlkyDyXhUJRUsCi7euW/DMHCLFSRL0p8n1m/WXSbJfxC4dNGwR4NJGkBdm1zsCwfzXwtYHfdeb+o3XEnAEyinny1h0c7KSiroYcpA0UMthIKlbgv1VpJ1OXBf/FEWC7Wf+8YDX2I/nt68EPdazRUD0q/rqYlpL9fbgVyogW17/GuI6sB/oEKUV9JkmtnaG/UsKPZXf5qI/09GgVTwj/WGITn9Rykye1UhlSjmfzRHX8wTb1Teu2bL5fV93RY0aicke5Cwj3wVGhEBQoXGoXn9ZLr9FoMiLJB96i7cr4e1LOknb1/2E+TRs6NnAzYDM+VtGRE5DbEESWl4+Zh1CWTex4UvDS5Bdjtc5HxAe4W6ZGBDDZpw9jg7LCBmGj24Jrjvmk5oEwwqjbQDUiftuL8o+diI5CUTRoOtNcJ147ckqY//jDsjCMAaClN4O+oE5OftViCs0lxHgkoc3gwSnJjh1hxYLBGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(39840400004)(136003)(1076003)(316002)(6916009)(8676002)(86362001)(6486002)(4326008)(66946007)(66476007)(66556008)(5660300002)(478600001)(36756003)(8936002)(41300700001)(4744005)(38350700002)(44832011)(2616005)(6666004)(6506007)(2906002)(52116002)(38100700002)(83380400001)(26005)(6512007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PG6x8oMma45ngroTvmtZiwZ5T1RRbtseS0IHp7FIkZOW1wuFLrBg20GtkgEW?=
 =?us-ascii?Q?x6+pr8XncOyq4wWTL98fKPQH92YsUe51dAkC4mjOV7oZIL/DMTUSpqLYwNNM?=
 =?us-ascii?Q?GoC03qtWh05AcSJnmlVQ7O+sUqraQIudeaer6WJVdGMb+ckP85BFnLYJJY6J?=
 =?us-ascii?Q?QGFXHMxLyfQoA78ssJko41PmjGzKVPIRBZcxxAIZjCWfjwSZjGO8BFAJUj7c?=
 =?us-ascii?Q?gqKyTPDenqKG5Af9sY0+9LtMrUrS5ASMYtPbaYJW3smx+1A6wduIl24oh9gR?=
 =?us-ascii?Q?pKaxorXYugsd/9oA8TCNQgc8QHiZ2+ezyn+FOdf0VsX3NYbevP4dfNFXxo8D?=
 =?us-ascii?Q?LGKpIDRzBFSv72z3D4cQs/FZujIeoHwhEdLeFs4hjGG2X6woHyVgBZG/bfHB?=
 =?us-ascii?Q?Pqpoec34It1wPxYfsVEDCYRDffOn07bY2SHLN4+5wOdtE4z8M1IeDaSMe7nb?=
 =?us-ascii?Q?/dskPto0ArJBV1RSn9onsxbPa9ajVoraXC32/OFJI7hvoNT48XAZ026+EWDs?=
 =?us-ascii?Q?LIbzYHF31h3VTiV1+96Q0srq9+EDjavLZPyBLokQW7SoPVMmWxQ9oeWGTnvV?=
 =?us-ascii?Q?bvVw9VLeeeB7qIVKdvNUHzDv8J/GgdmVuxJi/+60cihwqW9aIFxxQew/kpJp?=
 =?us-ascii?Q?sFSjgOMvH3jBki4vU2jmp9mIiLz0Y/oibt4y8CPnegM4Tu5nYkmR5+gqUFWd?=
 =?us-ascii?Q?TuOjWmO6j2NfPWvpnTcmN8PK2BzYUokiQbM+ucwdkvdtwdP5tYp54YTWzfy2?=
 =?us-ascii?Q?fCLYV0pp1Ir6OtevKVuXayt0dwhsahM2Aie3wSg+4g6VLPOrgSF0iWdz5rFo?=
 =?us-ascii?Q?vC8FAfA2qrPxh7ed1P/qAWp/fkldNuyl8qV1gEevuFZi241PtHnD+vg7TXSE?=
 =?us-ascii?Q?SV9nBGGeS9K+tYQDWFJ9AnchZViMf4V8DtUl4/8K33JgVDtU0cSczhbgRef4?=
 =?us-ascii?Q?yTnQc2AWDUwJPnBrodysRoLGQwwSb8w/TeCFZaLu66ghsvaWmGDBnoIKkDJ/?=
 =?us-ascii?Q?RWNA6xE85ROphvtCNRefKu0h1HFy8lWNRlzczygBlTobhOQM1vTbqvtjbReb?=
 =?us-ascii?Q?lp/es10yiH6fOELUa3fjV0V9UxX/rufMS7O+GUbIjOPy9rLi8bOJxW7fgOF4?=
 =?us-ascii?Q?zrWQS+x1IV4hIvniXiQuC+9kMIZsX18mhb2Wtuw0nz77aJ+JxhXtug2X94Pd?=
 =?us-ascii?Q?kVS6j5RG6jqJudRhrKJM6u7LsHv6G+auLLU8dE2bxnsz/oZzSGUx+VjzemqX?=
 =?us-ascii?Q?GIgBRPIpAsIbZokupbIYgk706DOdtp9Evc3HmunuIiNAn2sa3aBxovADCp+u?=
 =?us-ascii?Q?hXPj6HQ2BcORn74iouV/r6IZClxR4rv7PuXbjtanzKFe6MNXJAVPojQh1kzo?=
 =?us-ascii?Q?Q0yVm5dCVpkjYu5cwHvKCdmVetSxLmB5od1jP2quvniVpzNBfm8Wf2MRV3q2?=
 =?us-ascii?Q?xfTcocWA+EV/KBUnKcJr+UKiC+tw7RdvpTK3S+5G4cfMLH5e8xLIQGCos92H?=
 =?us-ascii?Q?avtClt/SGPoAS9G06CtYnO+DpUVNPO+znpN8aK8ko0YgRuCZ4gF/nQqeBMpU?=
 =?us-ascii?Q?dy96MLd5wZKSMTFk6FO5Op2dFh4TgSzaU+9U+J5UkBn14AoFE3IHKTA6A1F9?=
 =?us-ascii?Q?c2ASq+soKbi+MmNZrnoEa1Q=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b71639-752a-41f8-459c-08da89a04689
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 09:24:29.8926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MV5BNCjCAUCnWMZ8zhflcpEG6BHgl+m+Lqn6iJ1Fby/U6asqdZuLxwPvMUgbWwEDmyuIxI2QRtPMvDqqfLRE8KdBNd1riAAEzOv5TwyiXiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4447
Received-SPF: pass client-ip=40.107.20.109;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Set data_end to the end of the last cluster inside the image.
In such a way we can be sure that corrupted offsets in the BAT
can't affect on the image size.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index 7e8cdbbc3a..c1ff8bb5f0 100644
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


