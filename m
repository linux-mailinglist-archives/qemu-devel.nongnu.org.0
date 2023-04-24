Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CB86EC94B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:45:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsjd-0003yY-ET; Mon, 24 Apr 2023 05:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsjP-0003vi-9G; Mon, 24 Apr 2023 05:43:38 -0400
Received: from mail-db8eur05on20723.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::723]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsjN-0001KL-OO; Mon, 24 Apr 2023 05:43:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7Gfx+zP7redhH3g9hbcAwXeKIQHTDYBdj/VpyDrsZ8CeL1EhbCw+c2HbLaeCBzDs6Ik9aNgJgay73Qw9/dulBS/IIz9+pH/mRtvLU1PIB0mhuCIWKWAmKPFujNB4J/cOXfjYftiZOh2dC731EvBIWxOjPcZSnmASPwopWheeSQCprTt8K8/5xhD0ibFAlsXDFonUCDdkV5oNyGFtFOlQ0fM+9tZldJZbvFxlIk1EcFCq0JwefZsX4YuMwtIYzPLTLgCpYJSBDCjVaSKmVFBxG+0cr3vAx/5RDh8KZFCyX0pB9AAUyFbcHQrZ+6t7bfLqH7hVTfAeyVZahwEzFOCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVvXahkekOwOWj8uJ0Xb/gYw/NV8Ny8iv/8izjHk9zM=;
 b=nYqS9DGCUWBgCJY6jZtdH4ij+5uQmxrayvzEcOrNpvrubYBn0Uuk6FhSYNYVTLTx7JqSH1EQ9QewzoeA1BoIM/4KUImFF18XomMrwK7bWqrmjsYBtSpzBvRrVTlzbFmBo2bVARfYiDrBLeuwzE00XgQu2qtKW+D9VHJ7g2ar/LGQ1vg/QTpBGgHeqEJlb/1BPZdMhFHpZwE+fCkYLU2Bc7J///8/jx97vpiamWExKhLUAhpW/x01gilBuA52NZ+iXO1K1KST652xwKDUZ9JHAue/gXBaqso8NTppTexJ6HCrzZtpxS4NDrhjZjV5va9QiX01+XAtvbw5HcXiKu5GWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVvXahkekOwOWj8uJ0Xb/gYw/NV8Ny8iv/8izjHk9zM=;
 b=ugX/rSIFkamI8mt9Ukn3P3Ez0ZpwktmwPZGtUE1iqKAEgQWZSouRTSr9p/eKFLeqsNdSTRxhqiuq7Dl6Kad3ZRtM1CcrtMl9nKbVs+Tm//xpgoQdOpuXYxBm5U2lv89bBmDn9C1XtqOz+inb1hce7ozxddo/ObnUNXvXJOSqim+xWwSzqbKEUVJTFoGG4UfUJ6Nx9JgY18H1rbZLZktl8Ew66QWYR3SjtqO+GTrF3GuwaJUIt5ZVnaRTJVF4/eKg7/Fhi7eZjWljQfbWbVuv19yZzkOvRe7Fg+kUKQTkZbRXLYBqRiGLs+v6AtOE2djPKDFKuq9nQhKjG+Nt8PA4uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB6188.eurprd08.prod.outlook.com (2603:10a6:10:1f6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:43:25 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:43:24 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v4 4/5] parallels: Replace fprintf by qemu_log in check
Date: Mon, 24 Apr 2023 11:43:08 +0200
Message-Id: <20230424094309.197969-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
References: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0247.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBBPR08MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4e7e76-747a-4be4-32a3-08db44a85960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uOBdeXBK93cZ3BzNaLcG0ujpR2dmMK4F3t7aKj9e5ldZSCTwkbbfR1cWjcnr13gtsoeFcPuoPq66FSwAun7BMsBt8/ggTQdgVVe7aK3LGh/2dUI/1Lx6qBN3ZKOtmX21JbUdaG1zpnZ2SArqeMdQePHEvOjsVBZutwfgQkwr0SxgXGjSFuZn6kfkCCV4SyjINi+lYAkpbNoYUBjR02fC2mC0O9g6DprSKyOeWJxhOGvsjUfWWU7Ca1uyDztCngKihmFlDJZfypPmXa0o8dM5p3KGoVkrGR7ScosgGDEz868o2bF/5Pm4v+0OnGQSv0tJ5Enm+SXASain+70A1T+Y5CdHXPwVMvrXNEVrUjf/5vxZBRdynpGPGX+GDsNvWaJ1L8+M5eB9wZ96LbebnC8LR7q8XgI0rqS5KAvEmwHr9YH6I1u2baci+qIt4Vx4GjIfot2dyyMIw1AbyrzZBprXvkjdK4ASCurIJqRqIOyxP58SKtkxLLbPDJAnzwzxuRTdr7wGxEH/TWu9EjyHgYk0QmDpP/9mChUtzTQ2lvztOTfbpco601ZkZF0Zj6JKZVgfn4+E9+qQ8nwPAtYDeo6JSzatVAbrv6aznIAKtGtD8j/WJNBNIa58EsxmnnGe924M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39850400004)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(44832011)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(6512007)(26005)(186003)(1076003)(38100700002)(38350700002)(478600001)(52116002)(6486002)(6666004)(83380400001)(2616005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oh38SKilhjJx9hXLpk3S0Uci31oxdVVu57i74M8rVuoWbbR1rWN0Y2WV636J?=
 =?us-ascii?Q?gE1t/8jTs5jYgergYpS6qYZvO49K3Qt08yfTqqBiIZed5KNB/D3UNwnsxqIi?=
 =?us-ascii?Q?OLE6EgyH1tGloZ2dT177vRgbpaOBs8Ew7M9kxc8O7QMpveidllMkaGjAMAtc?=
 =?us-ascii?Q?u5N+KHRzdtBfwykke+bOfxgWLhrnJiTWlNgnhAOa/IHfROrgvCkw8iGSsxJt?=
 =?us-ascii?Q?XgmBJI8Sme/Kf6DM6EjoKigLuCzxjilWWrSPiRq5TrOpv/86LHT5aE5N2qhP?=
 =?us-ascii?Q?extZvry16i+WZyZRRGvpqEt0udEAKJKfF/EXcsukh8LqJWT0q+057107dVq3?=
 =?us-ascii?Q?3sxJ8Kv15/4vr+nrgyUjNk/zB9QTjdZDK4ekyLutsb8WEm+SNnZzZuSINF6p?=
 =?us-ascii?Q?+oS0CgRajCW5J39txdeGQT5b2qJqhAI2veXeyXQmW9YyDPwARvYvEdFtdq4T?=
 =?us-ascii?Q?ZsvgR9sKGL9FQmatEhoKkNkd1DWHsj4q6kkDNDLDGkEpKlvkqrzarCwR8/QG?=
 =?us-ascii?Q?7uHVAaWyXi4Ia0QWEGlajIxuihoXB2nuXdzm2t77ePD/f/UForYevpzGop+D?=
 =?us-ascii?Q?rn3RhzO7A9QXsGQu4rjDwxd9C8mPmQ7Ek7gl4XEin9qXPBCaH8BznFU1DDtw?=
 =?us-ascii?Q?AaKqQKIFVwm45wXaKsj/2mRa/Cu9BRvdsFLk5sevb7X6Y2XGdIgn/2MXU9RQ?=
 =?us-ascii?Q?iVhPZvMy4RmOpPwWlpnz1xGJ0mP3A8AjtPQc6YGMXO9yhSwkrzcvoQc6Sm8M?=
 =?us-ascii?Q?jvRj+1uaIQDOYdSU74ZtpuTx6MgTKfWUc7MQ/nzQsPGTfGHjFXcx5Z9JNChp?=
 =?us-ascii?Q?dQVveJmHwHJ7JJIcxSlUoBEE1tCN7hTyeh06jomORP64aoE1G4o2TSEOLDJX?=
 =?us-ascii?Q?6Lv+yTf/zeWu4XipvQ1YJmL73ghZsgou3iDtt6DyAaHrMXZGF86Rm757P2ld?=
 =?us-ascii?Q?9HI+Pd0d+3SokxLrhkq1i1ylPgNajIFYv+YAfGmc8LrJ2iuy1Rs4aDgaNg5E?=
 =?us-ascii?Q?BudV/zyiII+dZJJA7WSZP5jBiQq9CvnmBcWm4MQ1CuF0u3JRumdHU4/tMnaw?=
 =?us-ascii?Q?ixj5UNmXuyxSd306W5AQTZdM+GNTPqxsnt8QMeRIrffDA5p8Gql3vrOhzFbT?=
 =?us-ascii?Q?CtLWdA8JNWJ+2dHQcEcsD1+FOEUR4xdxcZqq91UjSxEJRQVVI9brl3FiUvda?=
 =?us-ascii?Q?QgSfKf2KjI9rSZLsUMNKrLjMzWOWTlNXVqosPF3ZUDu9L3D9tekK42a9leTh?=
 =?us-ascii?Q?I3gV7OCO9yHzllZB1QhRpd2zMVTWaWj3RLcoZx7KcSDTbBhuDhDZCRDE3UrE?=
 =?us-ascii?Q?FW1yMB4b8bFN0sAOrgL/8S141vZXCE2BschM7hn515FoYDhwO+agKQkGNZMi?=
 =?us-ascii?Q?3xExSXi3zRnC0beGzmRVlLc42CYF/7hPW2l9AMD/aLv32ct4npIayygQWLEG?=
 =?us-ascii?Q?Hl46VmHxxmrh0eURL0hMXfnc47bQ00P0i5CdHl5ctQHDffaaiheWMG9P2jyK?=
 =?us-ascii?Q?3pbGWombP/A7+UHX9aDsdMwUfTSoiKYZIDv0RGC9e46VLnBnSk94vpRb8rG1?=
 =?us-ascii?Q?PwJNa8WOx8nHKxTwktY7JeQF6ORipUoKUQADnakgjnVGgdtXtMmFC8aA6rif?=
 =?us-ascii?Q?kQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4e7e76-747a-4be4-32a3-08db44a85960
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:43:24.9192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMJmh63dH7NbDfmemg0QeudXwHoS/u+5oClYbdtVFlQFXB8ftEtZVP+Rbjk2o3yayQZrRsI3csrdWRT8Ag0dDyWfcPULK68qztqpUk9dWx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6188
Received-SPF: pass client-ip=2a01:111:f400:7e1a::723;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 3b992e8173..5dc56ca36b 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -42,6 +42,7 @@
 #include "qemu/bswap.h"
 #include "qemu/bitmap.h"
 #include "qemu/memalign.h"
+#include "qemu/log-for-trace.h"
 #include "migration/blocker.h"
 #include "parallels.h"
 
@@ -436,8 +437,8 @@ static void parallels_check_unclean(BlockDriverState *bs,
         return;
     }
 
-    fprintf(stderr, "%s image was not closed correctly\n",
-            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+    qemu_log("%s image was not closed correctly\n",
+             fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
     res->corruptions++;
     if (fix & BDRV_FIX_ERRORS) {
         /* parallels_close will do the job right */
@@ -464,8 +465,8 @@ parallels_check_outside_image(BlockDriverState *bs, BdrvCheckResult *res,
     for (i = 0; i < s->bat_size; i++) {
         off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off + s->cluster_size > size) {
-            fprintf(stderr, "%s cluster %u is outside image\n",
-                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+            qemu_log("%s cluster %u is outside image\n",
+                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
                 parallels_set_bat_entry(s, i, 0);
@@ -551,8 +552,8 @@ parallels_check_leak(BlockDriverState *bs, BdrvCheckResult *res,
 
     count = DIV_ROUND_UP(leak_size, s->cluster_size);
     res->leaks += count;
-    fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
-            fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
+    qemu_log("%s space leaked at the end of the image %" PRId64 "\n",
+             fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
 
     if (fix & BDRV_FIX_LEAKS) {
         res->leaks_fixed += count;
@@ -599,9 +600,8 @@ static int parallels_check_duplicate(BlockDriverState *bs,
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


