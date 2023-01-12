Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758EB6678A0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:08:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFz5p-0003wI-FN; Thu, 12 Jan 2023 10:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pFz5l-0003u7-OX; Thu, 12 Jan 2023 10:02:09 -0500
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pFz5k-0007Hj-7u; Thu, 12 Jan 2023 10:02:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElQHPAcZ6iwPekGPTN1WMaPnlltD/ZWNbYNgfx5SqYlDgGPUtqycYVjtwlTEcbMRVGqvfPEAKpmZGvg1yFyc3YkaqIyTfUKCJT0uTYXfE+87+/vvEFHNePa80FPjtem6sxrei6KWpVq+r4i919KLZH1XCOJ0/5zdr3Dajgv49qbSeDSTAccKuu/RaHzFrwISPSH61H0NgmJOPFlpnc1RBV81y9PWRrlGQRsJzielUZfC5SUV+JEZ88k4kay6fQnpsWuUA+it0iZp0hmSi/6sN1KO7JjZsd4/bhsvPuFeMwvkekErbC734McgaTazogul5rF64vE4WaomZfZLQdiz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+yN8EE1WJw3sAAYfKHJlMrtTrqsrKxKKlIybMmh1mg=;
 b=fCaPu2eMfZMeveff9S2AQSJpiLKA7e4G5JAvPCLcy+EIyPQp+1xt8MA21yWi91B3Q9zGRWw4lPO1dHnMhfW5lfU961y209ugPPKnC7xZYcA2cCmnj66FzJCQY+HsBA5NO7O/lDIl2dqmIXe5M7bkMi8nw06Srqv5Kgg1Mq+C3ZHKyyZFU1hb1R1pfP5vc8bc8Eqt0V76kf8MJ9yFK+4+4Jh+EL9ml+JetC5prntfZjB+HYTbtyl9gFjRvj03kgE/szhUi9a9Tp0ldnHMsHFOpMSfyE83yxpXOlDAFbULOaviqWT0rJH/iiKLsR3tw7L0t7OkXrcdZBek4uBUEeM37g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+yN8EE1WJw3sAAYfKHJlMrtTrqsrKxKKlIybMmh1mg=;
 b=kxoLwX7u7GRmYJacp2AJ0Tki690iCQg1MsVIEFVURz/h6uign3ZGRJB/YCCh9lAHR/otqhgsO5Zm+E7S/qVmY3tJhf10j418dOlxbcxvauZ0Ej9Ue9aG1DqaOUkqsf0u26p+xcPMObMy42EohX3LiDoWuOMTDeEZmeQL+do8SGuMl8HbZ/LNSULmshL0DsKLP/PSjOgTWqPFBJaceHWFqxjM8lEkGD7Z5+Rvs8px7vICAm82csUxHeTeMER01hyQT0jXlTKdoGtPESHER8fcEUtiyw/9foS4FszFogZ9AN3C1FExXqdT45i6sZ/iMVizKPHMlLVFeYc4LteNqeiZYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9250.eurprd08.prod.outlook.com (2603:10a6:10:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 15:01:59 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 15:01:59 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 4/5] parallels: Replace fprintf by qemu_log in check
Date: Thu, 12 Jan 2023 16:01:48 +0100
Message-Id: <20230112150149.1452033-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
References: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0701CA0035.eurprd07.prod.outlook.com
 (2603:10a6:800:90::21) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: b7101e01-f15b-45aa-b716-08daf4adf455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5EOK636ApqgEsu7SZ+0MOcPfXI+5BLUn41gMdrUgICMevesadiSeelw0Hv3vxOb609uTTQxSsbI8sK3XoCJ5chXyK9ua7crVVgIkTXcVPK0fP7Ci21IxyHFtMEdRNGPSms4oipBu8ReZO4C24OEZfTDeYG0XwN192DpUKTRYkVWnCvZvD9jt3S0vA9QPegQn0/UaMZzZtN1qpKwqF04aCrBp2WJGgx9KodKTStH0cbIUhUsKNEBkeZYqK3yBqRWgXL4TDboy9NZzINFZ+7MHsJ4fHHAWZ1hbZUKLvg6GSEVM43adbg0OjFtOn4VGtQTKOnLTpKeX3Mx79jxfmbG36DDZf/Bj9p44gWZtmzF1fFpxxCgT4SBLZfSIgd+acug8vnDQc717BP/bSEgHUdF3Eyvh36ss9LyKAO0QZofbMasuEs3M/DeNjrYUnyBWRYACVVpODylD/rMS1/e6R2d2B7/I3DXnY4bonZsuHmX4BlDHtMJnWmou2oAho2IvHqVgIGgGa3Y2lScE9Wo4PYfBCXd7bQ+zn4uB2CmBMoSGvD3RyF1nMmK+yF0wO+1Ap99+XhraI8zbFoE83cLAiTkFJsjvOPonjJy7ZUVhDBJ3XqW5BPGwxF3swAHLQslJVz/X+W9i75xvydcBsbWaT069bxSPBf1cCstJ/Ou1x+6tMFSDj7fw/ic1WYodBICCvZOtumf7i7i4oV0gKOK27w2D4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(451199015)(36756003)(5660300002)(86362001)(6486002)(316002)(6506007)(52116002)(6916009)(44832011)(2906002)(6666004)(478600001)(66946007)(66476007)(66556008)(8676002)(41300700001)(4326008)(8936002)(38100700002)(6512007)(38350700002)(2616005)(1076003)(26005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qDHVckrQTMryEggp3td4/tLAn4afUO7GPVxt9xUf33ZdKiA5EwbvNcXkQa5b?=
 =?us-ascii?Q?1fJ16gQQHdEXhLSTKuEq0JsC1RCYJOsNOknUw2ZJjGT5uGObtFI5Z7BIx0Kd?=
 =?us-ascii?Q?3AafKrDY4tvmEc8rx/dvp++/4R/3FYuHnevaKC46FIaEp4p7ohx0Me96zScE?=
 =?us-ascii?Q?UfzM6F89sYelD8HxL1RtNn/PW1ierfFiM3zeEnv1xGWwxHmFvUJOsb9L/Rut?=
 =?us-ascii?Q?2Y/UugPmDEjnEBf1Wr4/FmhRq2JMokUnxdw+XfGtVpu/m8Dr8Zz2IjFn0aky?=
 =?us-ascii?Q?B2TKL9Bv7vL2Tv11V+EK+xGJTndksbUbpQnZTplzCXx4QjBpW8zlEGrnjir4?=
 =?us-ascii?Q?DGAtt5uLBkj3hSoOevCnOk7tKn7/VSWBkikpqqYZRwJa+MZiFD+/zEwdNB1k?=
 =?us-ascii?Q?PnPGgnbj1y/bvem7qkpjpn2rimt7SmqID5cCd+OXPtejsOUQmKl8dnKCOOXW?=
 =?us-ascii?Q?x7fOR7Wxfz4Pu5UsaAMCHmotE3TNRbf7KjL4Ey2nzr9CXat78kVPIZiWQsD4?=
 =?us-ascii?Q?AdrQHV69w9EbhDD3cUlN92RcZ/5qUwpnDF2W2mF45VpxPma9yabzL6X3CSLA?=
 =?us-ascii?Q?WxC3/iRmud85QySU5jdoCAt+Z+6/P/6ClifTcndhWHgMUgNgzj+pUqZxpeH/?=
 =?us-ascii?Q?BZOKoiDVXQU3AlBc9cx2b820jhPd3fjKtGnbkVLR46dcglaxDyCbEact0o4X?=
 =?us-ascii?Q?gVT+lzAw3GSRhSkG/LeqAIOiaHvXJ4C4pIFvwk8eWgKVE1avvqbZNDmGEI9w?=
 =?us-ascii?Q?fJ1W5q1J6n1peog7AVpYGoNbBBtrgZGVIt03GRdwO8cNJVbxIAbkn1jkMQpT?=
 =?us-ascii?Q?ibCYx5uBEi0YpgrZXTnmVx9hwhT5nbIgD21pBizp8mxb5bLs8Sh1hmJ/QW94?=
 =?us-ascii?Q?Q6v9Z21mzIGJ2evv53xJgsGPJGFFv4kPg0WRJg+cuVRGRoMafGPq3RD/rcSF?=
 =?us-ascii?Q?64pTpCmVpv04JurhcPGb/ZivcDOMm4IdSbmrEehDYWk0OmUsrBiWBl1I+lLQ?=
 =?us-ascii?Q?wbmKL3n6MewyVV17c6OZprGN1Xf9/Hjhpj5atzf9QEYSGg+N5cpydMerEoXz?=
 =?us-ascii?Q?eCDvB4OXNSh0Sf+fpqWjrgSw/0n5+kTKdRXiRCi2r7990oSDQA47MuI6H1tE?=
 =?us-ascii?Q?9enTyqvn/P23wRsL2WhjZINFhHJLiRVOLK+PmJt6lpjvumSCqo9Q8jq9HMXW?=
 =?us-ascii?Q?ePagE5iAvzzWokCyzinl6zl6LvyknwcXzcJCsqa7bh2LC6Jyhe538OJl4cXr?=
 =?us-ascii?Q?UWAJvx3Agkte/2M2diRRSyqKm9Mt1PkZ606J3/5gL+ttQ1aWcb3gK6bVyUbf?=
 =?us-ascii?Q?yIUB3Yxy4+qMn8MWBmE58iabeztqJkGfQ39VPfIeKX9pwDaLKmPMcvayMTPB?=
 =?us-ascii?Q?El+0ixeQgyUXxY9Xr78kLwbaYnzVY3bAO5eJK876Zc6SBFJakJmX0IGbnfXE?=
 =?us-ascii?Q?x8PwTwhmyxL1EVcEI1MhBYwyxmsEfr4vmmdQGU2dS2b+MfWT86SLeKveXn2X?=
 =?us-ascii?Q?+E43dNnqM6rsTlzblJsIirlefLyo5LVyPIjKUoW9jD50E3ExL+9H+Sl/AkvJ?=
 =?us-ascii?Q?aEU2CsZv4kl6kE/DWT6V1V5wX2bFyzPsWoHwh69wvxr7QqAUjbIdAWGUSdc4?=
 =?us-ascii?Q?MUOthepuoKuGqYCC7aazjsA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7101e01-f15b-45aa-b716-08daf4adf455
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 15:01:59.3217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxTeIYp3MuiDM1GCfz/rFQGQYb6ldkwsWPLFYZgAnTHXPurjZ8hbH3Qv2mKl6VYTvX+Ah5vkAmbMRMh4XcXT75RQX/mTUBbrfwKW1bH0Z5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9250
Received-SPF: pass client-ip=40.107.22.133;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

If the check is called during normal work, tracking of the check must be
present in VM logs to have some clues if something going wrong with user's
data.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 73e992875a..5c9568f197 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -42,6 +42,7 @@
 #include "qemu/bswap.h"
 #include "qemu/bitmap.h"
 #include "qemu/memalign.h"
+#include "qemu/log-for-trace.h"
 #include "migration/blocker.h"
 #include "parallels.h"
 
@@ -448,8 +449,8 @@ static void parallels_check_unclean(BlockDriverState *bs,
         return;
     }
 
-    fprintf(stderr, "%s image was not closed correctly\n",
-            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+    qemu_log("%s image was not closed correctly\n",
+             fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
     res->corruptions++;
     if (fix & BDRV_FIX_ERRORS) {
         /* parallels_close will do the job right */
@@ -476,8 +477,8 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     for (i = 0; i < s->bat_size; i++) {
         off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off >= size) {
-            fprintf(stderr, "%s cluster %u is outside image\n",
-                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+            qemu_log("%s cluster %u is outside image\n",
+                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
                 parallels_set_bat_entry(s, i, 0);
@@ -554,8 +555,8 @@ static int parallels_check_leak(BlockDriverState *bs,
     }
 
     count = DIV_ROUND_UP(leak_size, s->cluster_size);
-    fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
-            fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
+    qemu_log("%s space leaked at the end of the image %" PRId64 "\n",
+             fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
 
     res->leaks += count;
     if (fix & BDRV_FIX_LEAKS) {
@@ -608,9 +609,8 @@ static int parallels_check_duplicate(BlockDriverState *bs,
         cluster_index = host_cluster_index(s, off);
         if (test_bit(cluster_index, bitmap)) {
             /* this cluster duplicates another one */
-            fprintf(stderr,
-                    "%s duplicate offset in BAT entry %u\n",
-                    *fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+            qemu_log("%s duplicate offset in BAT entry %u\n",
+                     *fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
 
             res->corruptions++;
 
-- 
2.34.1


