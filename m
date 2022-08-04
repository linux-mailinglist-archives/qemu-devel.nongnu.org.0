Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0B3589FBB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 19:13:37 +0200 (CEST)
Received: from localhost ([::1]:51926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJePg-0005Fu-KT
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 13:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJcDX-0003UE-F7
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:52:55 -0400
Received: from mail-eopbgr60105.outbound.protection.outlook.com
 ([40.107.6.105]:27575 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJcDV-0002DQ-F5
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:52:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KC8TDyWiviyRQ+R3R85LaYvyXi+LpvxQcEM2poW2sVkVWXrRbQq3YIi9RbkfSu5yxEflVVYDcCD5VjLQohZv1NBb2CFLmLN9cfVG0/j9HqJYVCUGemyj26fwH5Cc5s1Y7ik+XC5EijkvfStDkZRw6wyx/6mtcafK3Gg9VicKhW8trAI869KASFjUy5cm9jYT/Y1MTmym0qoD99YLmN0aJPPL6Py9NEkPW0iHG9OadYV97ShVFf9EUE4k9yzHpxLUumKX7ANNuUH+NLch+UQTcOI4TkOX3QvP8TEIUXGqdeMJZim1matddMDEiEfU8vv6QKh06oDqjrFNXQgnfqP+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbjUQOpCIcF3DzKRDsdn979UmE2ludBXwyiWbrCBb08=;
 b=Ni7GU5e8C9kEJI2an7ZDJ+SnrlenQ82rsrdE+rQCEoVLsV3++s3gUFSOOKSrHQV5zAH/ARjwd5mN+gXYwoY8bH/snl3MyWKtcIya/ZC7Clo9AhaGDP+hIkvwUGHVp0Uc8Btkjt/9Ac+1TFtvVhHcopq9KUdPvkhsrGLKigLFd4radNqSU0mLiSeY/Zn7w6QgLgrUVJRGsq/MxLyqyztURKLCFb2UNKsDYfObgg8peCezMDdxhT6KPuqJnhlDF6SVpcV/A5iO21bkSsXbt/SlX24vA6yxuG9dzbAK6vefurDc3+ww0db+Ef9xPz0XLR+wyMlRAXzzlnAdmI+LUWYzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbjUQOpCIcF3DzKRDsdn979UmE2ludBXwyiWbrCBb08=;
 b=LVMv1bEWzupf78ZKtYK4i2uAEr1OaEodR2hKnt7v5aXHnWOhA7UEetpk+j85TfBKAhF8U7Y2ZdHmIJRX28I8sug5UJWY4rrwxBqbkdBPq7nyR9oap5y7PnsqjB9tCQQZ+l48iJeCySw/SnZcV1IoebCPh5hIIR0+ibROlBsl8c/YPD8yHFdWLm04bBgNjEpDEW9pkBtKrYVLc6fTeiQzH3PNL03HUXxEiWteePhx6v/iZ+w6XKVLzGqbm8b0nV7S6J6fncnYwtFS8qo10WfQG862ehY0awqN4s7yyDLUwKC3kQ7T2Raz0AGKuhOy+Nl28tahApxVTlj+LvH7AhI73Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBAPR08MB5624.eurprd08.prod.outlook.com (2603:10a6:10:1a8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Thu, 4 Aug
 2022 14:52:10 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 14:52:10 +0000
From: alexander.ivanov@virtuozzo.com
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com
Subject: [PATCH 2/3] parallels: Let duplicates repairing pass without unwanted
 messages
Date: Thu,  4 Aug 2022 16:51:59 +0200
Message-Id: <20220804145200.564072-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220804145200.564072-1-alexander.ivanov@virtuozzo.com>
References: <20220804145200.564072-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c37502e-4690-4ab7-ea21-08da7628e913
X-MS-TrafficTypeDiagnostic: DBAPR08MB5624:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJ3qykFk6L/sYgm2r+lMdD738iiv2b7cdnpX4nDxtAFCgZOnKIQMlcOQLt5Chg8xIU7XdbRKMSZND7mSPpv3C1e8FfGLrAjwO4g9dG/h+J6e5tGEFhVjOC3mjTmn8i7owZIVYdU3kecf77N4wu75tne4lgpu5Gd5WexIOZOvLkNagds76XvjIw/rKJZXFm8g/d7Wus1xSqAFAP7IVnXRksfWtV4CjacxCQYWZUs6zbmpPuFckBo73I3xQcuQep6XomZqOJoCcf5/r+JVNMouw0KIz/3Koxyu9i6iyrl1jvuMgoBw7KdXYipesvMemBFrG6Ja/NZPLGPUbb4nn8b6IIWf/JnJQZlIeoTPKGZSL6arQD5rtXfKgTWLIAZzeNnBLNCxvwK3XVuQuYOrNHXQv/hgco75HM7SPqcX8CDXKYpdYUfVAPWGpMrwn7CCj4wULNWTWm2JKOpRbflQyOBgqUOXxTtb5VhjxcaKRErqgnA80v4ncyEvt265KuJOIlj+NNAFRoMMiuOvUkfw4Ti/fCmeYpvByVA2qhfPwMb/C852eCjMCaU80UMikz3Kc89AtVptkQr5wVT21OJya7MRS8LtG+hV/SFMQ7c5m+IDDDXhZnYv4NaDcYhW2D59OTR0B094nfyiJdqkLU7HXST3RHYhhYjA04cfoZAPwnyAxpV4XTquLr7z7rmqj5c/eD71Huf/3wsOx4Y5LO540R+RM3sriUg5S+VnMOD6cPE2nE48xzpKMqWZ1IsLr1wpK92VPMWC0uacX6vxtBXwTxZDdSht2h5LIPQmFSoHTQDKDdrSuBTl6ZMMrOJoSquGaPqlwOER7IankX6PK8nP9HSiVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(66946007)(8936002)(2906002)(83380400001)(2616005)(107886003)(186003)(66556008)(15650500001)(8676002)(36756003)(66476007)(1076003)(5660300002)(4326008)(316002)(6486002)(478600001)(26005)(6512007)(6916009)(41300700001)(6666004)(6506007)(9686003)(52116002)(86362001)(38350700002)(38100700002)(26123001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ReBJDC5bzhZHzQ5zURycDDFX3EJCAB2Un86YsAY72zth02L82xnM2BPXGGIr?=
 =?us-ascii?Q?U2OUvxB8qTCCe8Gx2GVnDGCnoI7wxsJ5KZ5EwtVmgUmI+39eCB8UN0v7ObuA?=
 =?us-ascii?Q?Nj+xctciP/MS2deadPfWfPHwRXK3ir18WoBrFvHbGrosuTS0u/5RJvtJtaHw?=
 =?us-ascii?Q?Y1buklNKEJKv2bNh2uUjKQym7NHaL29RUveONvT5ti8SucqUbTFecw99zZfx?=
 =?us-ascii?Q?Ri6YDS96TC/SAZn75hspuKC3WGMTCEUQH2AfGVPL/ydJM6ZBfQ8NWF44kGsh?=
 =?us-ascii?Q?V2AthP8XjFFKjY54kM/mCvt8UX3P/filaWDcnPUHN3c28z6i6EKb6fkprreB?=
 =?us-ascii?Q?2RKBFdwdz2DN5sd6PQGZcBzVdScHRSd0yef8uVpLKoj4rZvsiKZj/aYfjx5v?=
 =?us-ascii?Q?eXICWR0JWunoNDMIArtCfpsRpKAZg41j+/aILmT0kK+NJaGBu6T5lgSnlSnu?=
 =?us-ascii?Q?GwIaoLMFdjiwslQ8ybu3XShn9vJfZWMWGCUK+g8V7l0KGpXijxyy9MPyMmlY?=
 =?us-ascii?Q?Yps1884GbWqPnRMOnwiyW0Jnot8a1gdt48SXZKMafBTzl0pbqAll9R7KaCJM?=
 =?us-ascii?Q?XYoiEZNFFhOy0GsrGRbBXvJfXqB+UoyC4vOtuuqJzH2+f57hxmXH+6nqP6Wb?=
 =?us-ascii?Q?/Ju6UxTCb2dpNsUI7fYLFH63vhefvrV4uYqg1fXmomnYO0vZF/BJvgNEZQft?=
 =?us-ascii?Q?fk79sgvWdJf/UMDWf2SpxbSk8iA5xZXnrnM9dxPnWWe4kwMjVlKeFVdh9iLx?=
 =?us-ascii?Q?y7YepPoSHOWtZ6MUIG+mfsQhq8jLoIk021tDDBcdShJfZQieByYdeP1dR1q3?=
 =?us-ascii?Q?cYGwCVvlD3LdMAT4oHYHrDBtGSGNll6Z5uq+Up+oKE6OIK9cC5ekeXv5aw7d?=
 =?us-ascii?Q?U+aUulXnZx93AwbWgXJygPoV4G4aeIQGhdLqXHQP9merT++53xsnpEmByWQ2?=
 =?us-ascii?Q?QbtacepxhWW0a8DnuFHN8g6zT/ehP/GpeHK2oRtfbLqm24EeEUmowbf9PqD9?=
 =?us-ascii?Q?HX+lvi/NloREC2mJbHFqxHIi8lJlmJjTjEmR9zQNK5JSZeINxPtEyNoM39MG?=
 =?us-ascii?Q?YKHiMZylYymLZSYFOr1CQaNlfjjk1GcuYMCUeiGKPqb/9nWKN5szjkRBz6FQ?=
 =?us-ascii?Q?WW3tWFONS5Awot3N9uOHj8lUMjmqkwUlOEPe6zXnbB+OnCtEtVAVinquSMGx?=
 =?us-ascii?Q?LpKllkgiZLGPdUHz5l5ud4Wvi1pNorcIRead/4TPyWGpj5vJXW00FI0/GoZm?=
 =?us-ascii?Q?MWBoRgs9veXibSfwBS6Cj+y/N8Oix70AhPVUvpRLoHAM3a/zQsInhHnJ9Yxd?=
 =?us-ascii?Q?AafS2UBR+v4eMFWGWUJe+W3IxFv4q8T0gyiyMyIc8SKZcY0KXKciH4QuYKNA?=
 =?us-ascii?Q?nw4AjuEqCciWMBkynN7JuxEtnZ4Ir1j0plMhieUSenFQR4PadMCC4nhunvz3?=
 =?us-ascii?Q?LF1dCAwtfVyaoVvFcMsNHqy+lMFI7zbZpSjaEhnfwGP+7ObZEZP5MHMtprXr?=
 =?us-ascii?Q?lnOCzjk/bQhWOEPwq+NZ3b+MEJOxIEs2nzYP3TxIdylTndJdYojpbaIlGeFx?=
 =?us-ascii?Q?GP2J4K8yA7NIU+rzyzCLvkrLGsnm314RLf7aFS9aF6BFnQ65UzJPm4ok4t0T?=
 =?us-ascii?Q?3c68K60SwC4/1J4GGzYcJpI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c37502e-4690-4ab7-ea21-08da7628e913
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 14:52:10.8605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dy2ctZJmF72xo4AX0/dV6c+ZUwLQQgbjzGC3r00WuzguBb56aOwwA7WYhFeTAQTbSYjUlGSSkX8m6Qa7HpV1lec5xRTfljo1zW36LRXzNNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5624
Received-SPF: pass client-ip=40.107.6.105;
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
X-Mailman-Approved-At: Thu, 04 Aug 2022 13:10:06 -0400
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

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

When duplicates are repaired a new space area is allocated
and further leak check considers it as a leak.
Let fix it without printing any messages.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 6a82942f38..1f56ce26e4 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -429,7 +429,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     int ret, n;
     uint32_t i, idx_host, *reversed_bat;
     int64_t *cluster_buf;
-    bool flush_bat = false;
+    bool flush_bat = false, truncate_silently = false;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -547,6 +547,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
                 res->corruptions_fixed++;
                 flush_bat = true;
+                truncate_silently = true;
             }
         }
         reversed_bat[idx_host] = i;
@@ -576,10 +577,13 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     if (size > res->image_end_offset) {
         int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
-        fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
-                fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
-                size - res->image_end_offset);
-        res->leaks += count;
+        if (!truncate_silently) {
+            fprintf(stderr,
+                    "%s space leaked at the end of the image %" PRId64 "\n",
+                    fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
+                    size - res->image_end_offset);
+            res->leaks += count;
+        }
         if (fix & BDRV_FIX_LEAKS) {
             Error *local_err = NULL;
 
@@ -594,7 +598,10 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                 res->check_errors++;
                 goto out;
             }
-            res->leaks_fixed += count;
+
+            if (!truncate_silently) {
+                res->leaks_fixed += count;
+            }
         }
     }
 
-- 
2.34.1


