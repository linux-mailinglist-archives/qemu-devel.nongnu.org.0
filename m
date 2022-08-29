Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB90D5A4711
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:24:41 +0200 (CEST)
Received: from localhost ([::1]:36476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbwe-0002Z4-Gi
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblO-00012h-4y; Mon, 29 Aug 2022 06:13:03 -0400
Received: from mail-eopbgr80130.outbound.protection.outlook.com
 ([40.107.8.130]:50395 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblM-0005zs-B1; Mon, 29 Aug 2022 06:13:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d49nswmOIt4L6LHOKAsuMV7J8Zjg+n9AxHjfGhcfyHDYG4q7aqpHd+GNvMcYXXqq5mZ7Ch+eks2FLH/uVVj13w1NK8q7oy4wuiIr1X52+WDu1xJAkQNTsvwIgDPxm1rTZnyqCiiUnXPaIDoPLSg9S5E9oyOY25gBGsRt8eyhgCDLxpuUF2XM3C2Cyo7X3Nq+BUiAlpeagiC+e+nJ/WX6lmSm4C6tp9Z4KoFHgLmr0V6y6jhieYrwZNG3YxOcqr3ty//8WfdpVw60kmO8Fd3Uv8khLdHdetWRu5Fp0525R5WH8SnmqUdH1pCg/rikIPXywDQAQbkt8MZ7Qn8IP0WPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGP3DBjWL1JXmKfgIkKAcZVSum3f8b5ClOKzvr9OcT0=;
 b=NcalQAvNi/9TGXYKsQTaKgVVfeOnJAFoitWxMDJVphvyAxwfCVDv4NbuQk4t9PQPyc+oPzOg3wVe6dCMu120oRQmJ8mWCF4W7TR0zLQYj0nF+UjYHJkO6H61BQ5MARfY8SKjmYqlN+4Eab2/vIPu1f9K1SKWdhDFPW6COtEpaG/MjVDPoqsSckJOhnH/Ajr55ejM+fvwnsyH+Y8OJHIzzaRsEgiAADZMIkcFj6J+OD2jXkQME+2dZeb82r4KLWKplV8tMxOuufbj5Ygjgwjo7Mv/vcCC3E52AY/0WpKNRxa5wDkaoaccylWmSxJAIj9y1sPcryU0Huq+N4/hnD01OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGP3DBjWL1JXmKfgIkKAcZVSum3f8b5ClOKzvr9OcT0=;
 b=Y2K4BP8cVSZrSDsjc27sPUG0reQE899irk54RpZiDj/RhlZdrs1thsgpjrneKa21JEytpHA2j7PBygWvXY8lkx9WEYygq/eoAztY2AddIlxq7XYXUShCDwIA4GX+FkBqVD5uor0ljK/7cK1vH7gsUkWOxsQ5T4dA83j6GyevOboctrLuFOJP/D5Rvoo+adJFtde5kURlvuhpjM1DeAN75FUGndlx6iE5Hnx9NWG8xXUgHxfBldXlBHJp+MlSmQ/VGyU7QUNvSyxxnzIfXhd+8032biJeLf+y1pBzBSXFk7CODKFtC+S5EPAtfrv1iPTVcOmwjLX0yBDK3nUTqNP3Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB3023.eurprd08.prod.outlook.com (2603:10a6:803:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:12:54 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:12:54 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 02/10] parallels: Fix high_off calculation in
 parallels_co_check()
Date: Mon, 29 Aug 2022 12:12:37 +0200
Message-Id: <20220829101246.343507-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
References: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e55ffe6-b440-4c95-9d3d-08da89a709cf
X-MS-TrafficTypeDiagnostic: VI1PR08MB3023:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zLnaX4TAZ7tzIa+0W7aY6rAFGFuVbihsl0KsW1CNCsFunPoNJ7U2mjuBD+Ewg1SiRN0Baca3JynJaiB7cbVXWyeaEublQYQVyUnLSzh9jgjIWcowXZjxIkTo6myDlBrFZpsJnJpFHLrvaVijzvNeO19m0yo9g/acSn2Il/OMrSYbd6pKoWSfu6i1WxoydGJbzgg94J65Q1JEMG+5Ev7pdu1pmx2sG3kqz6TgLl8ezzrCBC+6N/fT+BD7MUPsJso9pI//poRdw/CG1tJdnaTJEPbifJ+BVRLjrohmJIsxUmgrq2It8X0G5CtWUYedfuZUpe+P48+UT2Jwe6g/nJUbGzbGqIcfhvplDbilJSUKTKJo77G6JwhnziEGMZvASizDZYd8EjjLgK0WVuynNbPEzLUqkJHzPR4ROIafi432dXedps1+2EvDcH2VJWJZ8R6pyId9MNzgPqowJjtOu1H/zTs9rFftYWUkkFiUdlwJM/+CeYTrdg4o9lp6YWnLCEqra4qMtn5Ezly4i97Lhk5wyIiL1xz4CjTVyYgNiwKiqjGPBt4eLDcbrXg3I2YinljVkVTzPi4c7kKcLu62UmMMfLZB+LonzQ9cllkZk9//Lkk+PjA2iqZc0/0q3EN+uGg+UoUW+zTqjgUYx4u+1/Okde5ONoXBsZ5CpvzLQRSJowzHSb8n8OF9fe2I7+hsNbWfkuVT3u5QRNrZBhNAbyxqui8kAcgms71DYXXSGtNucdCw2IkyyU2JbHVeGnGaRgadS0Elc3xdapMxf1ZGZa2dRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39840400004)(346002)(136003)(376002)(83380400001)(86362001)(1076003)(186003)(2616005)(38350700002)(44832011)(38100700002)(5660300002)(36756003)(4744005)(66946007)(4326008)(8676002)(66476007)(66556008)(8936002)(2906002)(6666004)(478600001)(41300700001)(6486002)(6512007)(6506007)(52116002)(26005)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eS67mX9Glw25q4BvkEHinaLtT4ifLivGdXqAzXM+i3nrMGDLdpcR8pXMgD+L?=
 =?us-ascii?Q?ZvmxP7o4uOQjPD8QjLdSK6Qp/hl7HWmv/4KA4CjgUF9tqxzoMKhdLK6ynNg5?=
 =?us-ascii?Q?xRP6nynHDsXMcfgiX+M9zyj/4JEWRHBViIF+aj34RBrgHW1mFBrdhc/elVO8?=
 =?us-ascii?Q?eprEWdr5YePl2BcUp3crYgw8bkj5U6GzgbbkLdkpxn8VlKlzUSoZSfZ2UoZ5?=
 =?us-ascii?Q?/oiMGn/38PmL7pAozsCm3si0ohY28klGM57FnrV4xtT4gjMvuwf7IOBgeRME?=
 =?us-ascii?Q?ds4iD4eJU7UNEYuU8UvlVFEUjxYv+Ie0IiTS5Mt50miralbLMPPrgSef1nu7?=
 =?us-ascii?Q?qm9cgs2Nm2iixY4RIWd6yc/GB67iuRe1KxP/Zpd8VMEnMh9J7uv5yfk0nWaM?=
 =?us-ascii?Q?i8YPcr6km68Cks/Lg7k3T5IyPoxXqd+AP3LQVRC8ECMZFVS8LFNjv80frxA2?=
 =?us-ascii?Q?vk6DJbbpEWNhOnEMAQqD1t4xKHQ5QKqLzsdC9cdodryqL9r0Wsml+FsKP+l0?=
 =?us-ascii?Q?VNo5msbx64MKTR5Goe0evvXegPAtqMf9LaJQaFAA7xbZf+eavvcUp981sf6f?=
 =?us-ascii?Q?S4jyAW4XFlRiBI4zJAutC3qrfJv/ASM04Ct80UgxgfGcIfraXIuT3vvfBC9T?=
 =?us-ascii?Q?QvCrjPhc1Jp8OBVQVJOK5DR8acU5RLf65exvEpGSiQ6ipyVJSckza65Cy+Hy?=
 =?us-ascii?Q?uC+wXZJum2TOmMpUPZaDp+m6q6VZw+iVw3gxOH2RSSmHXYSDxiznyXiHlsgT?=
 =?us-ascii?Q?IVr0XM44K45WFltK9k2EzmkoPm8bKtlVB0KkakTGFd/x6/nBnO9vp7sQv/6W?=
 =?us-ascii?Q?ONXV+DlsTyDanzoASiJvmEbfbzthraT4KITFFS/xVnmvhTiM88jUoOr1JRQD?=
 =?us-ascii?Q?qn3rFiwXOoXoucdFn5QghGqYAmG37zdM2lPAd0F+uUCKkC7r8/2HAHCpJ5t3?=
 =?us-ascii?Q?j0MchMKdpwKkVcHFosWhAguaAmYP44cMxPISUdtLzI4jOlmk2Hefjos6YP6T?=
 =?us-ascii?Q?odFtB3Pmaq+3XhCNhPeGkOQyGIXQuOQCmsKFK8Y1akBjkMcdsD/owoUEWPbq?=
 =?us-ascii?Q?Q+BrqSCfUm7i+jp3zJPyhEBaDGy53ukeaRtn0kTpr15pBPl4jSRdQibq2XTu?=
 =?us-ascii?Q?oT+rgNnMNF7H8egvXPmPsQcGpcLJlzCL/KFO10sF9mPJfUDxprFrfLK0T5qh?=
 =?us-ascii?Q?Riy7sZQ7VI5L3bEXEo/r0vz7I8nowFRWfKiOVigcRtFFuoDJXcj3xp0ICBxH?=
 =?us-ascii?Q?Rt4h1oIhYnu/d5S3er/X62e6Z2Z6vAKVTk+jDb1tA/3eO754qYiBZQPTR4lV?=
 =?us-ascii?Q?WYv4mKFTdh443UP1ZVB6Pihq/0YYAI8PgD8KJutHDjL6elq1gEIqHYXffLzi?=
 =?us-ascii?Q?t7PmIseqWc9s3A/VmeKdF4w7O5UgOL3fqRUfVAkgBu0vjAPS47fE2hfh+WwQ?=
 =?us-ascii?Q?7RFNhsVlOOatpizomZ6UavAGB/yd1ScLBIJS5ii8CpZyTdnIaDI/myFB0Tgm?=
 =?us-ascii?Q?Y5jr7AKlxXK0DLYDvpAYeLorZzn5SvOVgbayNgURCAlGZttHN+79LePCl6s2?=
 =?us-ascii?Q?27sntRjc1u7fY9Fe1CdqyTtoocFT7rNTd+pE3pqshS/izobjlGrYyiMu4EPQ?=
 =?us-ascii?Q?PyZ/ZDmBMLyM3/1R3ydrBKg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e55ffe6-b440-4c95-9d3d-08da89a709cf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:12:54.4741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTyGtb3zXq0k9B8QXbx/KJpX7QEO3sIthi8zc7+X1hH+Q2YIgW7WxXPHXtAjvJ7Ipk2WKvHjiTweSf84IdqCL29gYxwbgMyPR4pIY3z7OK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3023
Received-SPF: pass client-ip=40.107.8.130;
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

Don't let high_off be more than the file size
even if we don't fix the image.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 93bc2750ef..7e8cdbbc3a 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -460,12 +460,12 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
-                prev_off = 0;
                 s->bat_bitmap[i] = 0;
                 res->corruptions_fixed++;
                 flush_bat = true;
-                continue;
             }
+            prev_off = 0;
+            continue;
         }
 
         res->bfi.allocated_clusters++;
-- 
2.34.1


