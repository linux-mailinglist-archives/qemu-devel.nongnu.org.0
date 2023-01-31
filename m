Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC08682A92
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:31:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnrq-0003OL-CF; Tue, 31 Jan 2023 05:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrn-0003N7-Uk; Tue, 31 Jan 2023 05:27:55 -0500
Received: from mail-vi1eur04on2130.outbound.protection.outlook.com
 ([40.107.8.130] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrm-0006VK-Fw; Tue, 31 Jan 2023 05:27:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=To5VyoHEMSTf2EwO5EydHLvA4ywM+SgHAcc5/ur+/3DNVkyI63MLX8pegbx1TER3H8Jw94OFC0pSSmX9KSQFpqhup0MdQHxetWWrGptqFzBVV8b6VrpASVxhG4trCnMZzz+oLy1/eFDxt5mhzr900WscBdZDwfuwZlN1OX05TtyS9Yctj4cASRU/JY7wgW5owmwdyEceqhWU8jQY+JwHlNF09i1r17WP1S9ByIeJIuCrWmqWtD4BYd02PIC0tU68Hk2tSZd6ILptussXsgyTCNJluW/sGjK000g4X6clck8si2K26MJlo9buwJ1PKccdkKmd0+XMlrUH9KMmOGDeGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qF3NOVPO0k3//yRzQXkyNI1yCckXNC+VUzpe20je6FQ=;
 b=RsCLNmF0lBE15dbt/Pqwmqy6JuT3dU9bP2lschYIINX/tRJoBb71aYs34hCwloPpGRpAQop6pMj08hrdmfbefU38zusYr/lJHZ8oXpu83n3feIBJ9sXT7xf3r7BSHBiSqq+a0fMQGfUx7CEMk6H/lwqdB/2j332fXmkSkY3zGZbXMG64+wmUfETOqEnrAVvfiwPvX+dZf/5yY/0bAixUhnwgrvL+PJZoS5ar38+Nc8tJ3Ns2SZHyUGcz/iCSPzX5RdDdwjURNtc7rNqY1cM4bFqxFe35YxX17fdXiVXEKqezkmsFAntrI6cKCOHodz/5+FyEcXWVtNDmau7OKBJRbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qF3NOVPO0k3//yRzQXkyNI1yCckXNC+VUzpe20je6FQ=;
 b=zluv65Hj9rvvy7sUckONub9SLo8IuJJU0GzAF7sbSKnrbdu0chM9PKAL02EnO7xOCQVwnXkqg3P5mrilroeK4CrjJwx6wAmxJv4ZhORqvxrmL5WxQmM73ZncjBOk9e5kWedy7hlbKsvBsTEjcefeNoHVN4tI0DDs4uxvaO51fy22xm5arpZthGmyI3Y9/v5L+oWNINEmGvvZJsZa28RJxtb08MIEn7mtOK2BhmcLIRAPwPdR1a29OtFtVqqdrBHYaMr+kRNyHqt0U/4btqsEZGqCNOF0fdmjZqCeu5Ng/Mrmf9vI0SdDbhkbYnfOzs5klR1g+R+DFYJfBHUcWUjF0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB8615.eurprd08.prod.outlook.com (2603:10a6:10:401::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 10:27:47 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 10:27:47 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v9 02/12] parallels: Fix high_off calculation in
 parallels_co_check()
Date: Tue, 31 Jan 2023 11:27:26 +0100
Message-Id: <20230131102736.2127945-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::26) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: 941e573e-d252-4bad-b991-08db0375cbf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ChjtybRImBLs0VTT9GNOv3Nze2gRMLyqzc0orvkhuY/b/GRdWcy31NcsDAN/N3iwFEW8b4mE16KjG3iDt1FZKBxpIuzAP6Ja5811L6E5gjqPHN+PcnA6z0/7APqkyRnOt7/pZ5a+MxGvYCxLD4W0kineeZgLQbTZuxOwbYr/EhoOYdUWzh+4rhmvcTIfwCYB7X9C/oObsCxQdB3ESLKfEg13wFjEjZnJZdeX+wQuKAaD3RII6VeOq3/DAsDG/XIcPAwmJAmKJNyB1CV9BhpcJLqHCVLeE18OiP8rcXhugAkQCF9iZz0QujpIYL9AccTXALu8ZNj4VavvJLlVDm/30u8Tq/RICFKw1MWhGyEV/RCPTiEBhqyVvBhkzTsHVTmelVT4AB8G3lPMGOLWDl6266l6QJfAGXiEarKAhPSCjxteB4oeB6SbNJsbKu8guDIdje7jpM1l6jx/X3qxR+F8B42wb3ovWdJhntw/HtRvderUIm/5RY3jhPQ6vfZL7nBTf/Cr+AbW+K/JvuDv3JvNDp9xv7+YtotAZCIwerPnCum36W/wMAOdxIeP8sfWUvyPdOp13sQRPXnJQjSTWzoHezP/Zk8CZbfy/PGEOUz6mbE/VcEet9tYjR1o3nrfDqP/YsuXYJfBJRlzvuP303L55arh4G9mamoASJhpnqh4AzeFZjUsfcNMuD3ijFABvx4vHyVjqcskMH+W5VVriDE7Dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(136003)(396003)(39850400004)(376002)(451199018)(4744005)(44832011)(5660300002)(2906002)(8936002)(41300700001)(6916009)(2616005)(66556008)(8676002)(478600001)(52116002)(4326008)(316002)(38350700002)(6512007)(38100700002)(6486002)(66476007)(86362001)(83380400001)(186003)(26005)(36756003)(6506007)(6666004)(1076003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gyhHqPpWZYukn+7XrWodx66WdDC3oYVwVhO2+JU40Wb929w9GRIRPtoplxkE?=
 =?us-ascii?Q?XOLy8eKq42uzkqRRLvetLwzoDc0B7VfJR4F7QEf8jtNFBPMJu4gnWbpCWpoM?=
 =?us-ascii?Q?U30kzu0YfLnrWdqFca4KgVvD7NNBYjRwZXi67qyJCitLe+ArSHzbct66Fa3K?=
 =?us-ascii?Q?SO6PdA5PZLQE720kEgJ4bE6xDUh7IcUJDZ2d7Nxx9B3XsZlSvahuB2gQK2cs?=
 =?us-ascii?Q?D/tbakccvokAyAOp3h8yOvorquCI+N6Qsdca122vzy6K30cmt7h6ozJYOsRX?=
 =?us-ascii?Q?GDY4+H+Vo3O8KodV0aSNUS0NHQC1PWVn/CI7njIQVu70S94a/EVpB49EDSCX?=
 =?us-ascii?Q?sLbMkvxPd4mom40CqICtk57e4SpSNWwhg7Zt20DZwautucIdWRpNHorJurcn?=
 =?us-ascii?Q?F9iBgeDinb7dU4WYaqW98dsbedSZKb/IAYLo4c2XcyVLIF2io6uqIq0N3/CS?=
 =?us-ascii?Q?fdO4/ad9k94RaAhbbs1hekDulM6GRsS8ZJBqmugNxVPlryRegfMIY1D5cCIt?=
 =?us-ascii?Q?702CZPkowz+W3IgZ0M6aiKOmPpcZs6+axUgf+llbiXOmIp8trh73HpWpzbl2?=
 =?us-ascii?Q?Usa2uEN6HHvp7EXVFxRJ1PIfg7IhtklmatXPepAmP0NhODZ1d1Kpubw2AI/4?=
 =?us-ascii?Q?nNSaPH17r6nHdeD74dcGYrnIN+uFS0m+Ckitcu8lG6ukwHFxSj6H7/ftZkbz?=
 =?us-ascii?Q?8kY8mjQfmtSSth8RgIuH4QQBYNNn9ZnPVE6jTe9jQ19x4ymnCctzTq0aEupa?=
 =?us-ascii?Q?lV5CRvnz/qXMc/BFdF/m3dcV8vMk7v6BWCCHQL5PbRqqVJuR7Tq3xHJBftod?=
 =?us-ascii?Q?VJs33sywNSkBu0LHS3YJjdLaeydHXgyyTbJY4GjmIXbOdMfGbcO3RBukYaa5?=
 =?us-ascii?Q?sIhZAu2O3ER3rwu0chgjlkhhEx4MTo+gz1n67cTx8jeGV0j9IqEvSMPK3PJK?=
 =?us-ascii?Q?POwonac9DPfe/USyn2lIuC/R1UMUp5eqiPNTmVzvu5ssSP5jrblbqtL5A5/m?=
 =?us-ascii?Q?glD4dVb6pLrCFAHGaf4UXIvjVecxOAAI33Ecs2tM2aEsG1yLpUMgAD1C+rV2?=
 =?us-ascii?Q?WM49vggt2JWXEDc3GEeemNtAUxVqiYRd/cSU1Es2qfOT7ECh90Z76wBYmDoz?=
 =?us-ascii?Q?TnLibfnzjvCogi3lmVTYUoryy8Ulu/iyDmhcHJ1KFZgrBZCLM61pQLTSs5nZ?=
 =?us-ascii?Q?Lu62AGs1A76aIYqke0Zy8mAexS6mH9rXSr+ElSSlE1EVn7Q8MXakokPp2zXK?=
 =?us-ascii?Q?8dr55A0AFOU8H1BaeHz0n7oExHVa6ICilE+5nyFa7wDE5l246cM/xFjTrmTA?=
 =?us-ascii?Q?mKe0GR5CNs6tZmdUdJdwzqPOiljrlhofb2CLu/ruuktrMmltrhKLdxQpNUFm?=
 =?us-ascii?Q?GaVMW2KdAxRdicaI15wtBTGp38yV0CFQk3c9W9uQ1YcCIDEtI2ksag8PczqX?=
 =?us-ascii?Q?Q6FYV4/KBhLnRC1cndkEwxl1PRc9pTToodrrR7z+OboNfeLpuhoVfRWR+nlW?=
 =?us-ascii?Q?8klZ7D0NcDYppxIdrRfRQqFXInd8pMvRQHOAB4Cw2+SgxLZcp9ZRpOIgzq2i?=
 =?us-ascii?Q?Ogd0pdss/6ldXTP6kJWM5aG4O1iOXUQe7iACeA6XPbQTzRJbSg4x1MO5P4Dk?=
 =?us-ascii?Q?VvQqKTJf3xBi6WJwLsQuZqA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 941e573e-d252-4bad-b991-08db0375cbf2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:27:47.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMLLDXtJ1emtPbOR3gYEbg8anUJT8ax6ffrPsmbS+kFtFHYPH7NsWGIYKj8Bm+e25fbnzfodhIIDkwNxberY0XBA4CLptmEF2i8v5PrxzOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8615
Received-SPF: pass client-ip=40.107.8.130;
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

Don't let high_off be more than the file size even if we don't fix the
image.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 4af68adc61..436b36bbd9 100644
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


