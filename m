Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9476893AA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:28:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsLw-0000Yd-EU; Fri, 03 Feb 2023 04:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsLo-0000VD-Lj; Fri, 03 Feb 2023 04:27:20 -0500
Received: from mail-db5eur01on072c.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::72c]
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsLm-0005CS-UN; Fri, 03 Feb 2023 04:27:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEOQyi9HL6Q1598HbgnHTC3CB2ZTOAyED1DReUtud/eSGHWq1vLZiigIYB9QTFhlrJpWDZ8SZKloP8jKUDalwh6kGEAb7K8eyvTwX8oF3kFkQSuBJY7/OlAGUSvXE4nxIRZh7xVQN/sSVtGDYRbGIKQfJovnFMVjaqr6ST+3IbM9s5QdhVwPqVfBXXjQjcK2PZgTeAus3x4GL/EDS0kSCQJRHifn9KOE2PvX6qEuszYP6pKyWNvWtsFcknbXK7xYqfEiv4GsYIgPbPIdMFMsnC6GFQo6VlwYq2oMr5Itj0Sbop3E0Vubdx7D9nXHEpWcGDKZ/7y5Kvgi+4lHN/oiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Tqp0IcQZoiETWlpSRFGL89vkXsoklIfg46sBDnGyfk=;
 b=CEEBq+7ZkomM5AQwd5dRwHXO5wxR0J180s7nyCjzQEUuLsDBi+d99Pq5i5Ahw1QVafnr8pXqe9wMWBWVWLcNvBvO94gKi26fX8cYK1MWMm9vQThLKbBH1BqKNTFnhTq3ILprH7fcYMsS6iDFK9CuqdZJISvfHrxW3fuqgMMfiul7VOaL7DoTMtasuS9H/HVcFb6gD+tZMa6xFlAB8EO+IrUGTyl0RH5mbeM8Vw8RvKk0/+JFouHv1/opRd75m4rhbjMgL0TYpZ4MLl32vhoV0yChLqKrKp0LPXxtxhFbIyXegtZ55zHUpfn6HhYQwtyio4Lb8QzYG/Y3p9yiNDMCUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Tqp0IcQZoiETWlpSRFGL89vkXsoklIfg46sBDnGyfk=;
 b=fvfJ9AYX2Nwr4jVCEYOK+x59LlN/wWHMf9I4X3hMLgEifV04laQ8yNimL9grCidrJKNbNE3DlCYOSByvAjzw0by4/eAvXh2A3IxbWy2//s1+PiE0eiyQ/VQKNtH2q0GGEfjAewdiippvkItN1Pds/wqgAnDNeVt0SGiFZpdmQVWFBta2I3hndvQZ5KOOGZZIBMAfI3xBjPi8ZTB/5wK+VR8srqu0JbbEsTvCZFshUVAMle/2s5qyH7Cor14hdo0OU6pzD64RTAGcSLyundDuro58YGl/u3qVfqIAtb273eUw9Zc4nj3aQxzv8rMxyIZc0dG8Fe25BCLxB1bG6TxKLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAVPR08MB9356.eurprd08.prod.outlook.com (2603:10a6:102:30f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Fri, 3 Feb
 2023 09:27:06 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:27:06 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 4/5] parallels: Replace fprintf by qemu_log in check
Date: Fri,  3 Feb 2023 10:26:55 +0100
Message-Id: <20230203092656.2221598-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203092656.2221598-1-alexander.ivanov@virtuozzo.com>
References: <20230203092656.2221598-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0099.eurprd09.prod.outlook.com
 (2603:10a6:803:78::22) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAVPR08MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a11c04-0b1c-44b2-ca36-08db05c8d108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zVVRy7NpEDJPpUQ6x8+Sd8kXLt5N1WvK0TRpdnGPISbTAefIQLES941J9bB90YawBNvfy28aPgHZvceUESHWcArGJfbWrJkVXtjz+zU4QJ6ZcWI1JLkrVWKOmVpnRS6nC3plHzdrZ7EBux09cIPTM+HiFNPl1g2e/svK3lHu00Yq6k6/sIdzMVLhYq2OR5hxWVLnGGv7u/P/3XnGhj/ala1AJiYmQ6ijamQbQiuXeKPGI6FsxMEI6sSevP/2rRFBsNekjed67E2g7QqhTSdJ8Uvd6nEhPY2b1aArwHwMkkAjV8WQh6ThO3mYbsab/ERYTwl1l1wtMSdhYc2FH+NQkLKkLUlOYmIXniH+OOfxrEJYatKDQHAv3fZq+gSyqd9cuzCsZRYJHERHnXYVfaNPADSMV6XcD49Q88JbbeYjBui0DyXZsV7v5xUEruglzlrAfM2j4t1wf68jQ0GP+I/YhRNH3d6hqMP0GbwSMwP07AyYM2sJSbFkKVmGY5+AAZM4fNHo0fLWEKQTKextXZVOeysPwqG1I9RKOxmKc6PfRMmii+L3eFI+TBlE40CATNo3lJiK81H+GuuxhDq2EhQFR0MjtIDawV71YGD5fA09M2DiA+ao/EwTh5vGYR4XcDrrX+s7hnCli7IPwLFBFd4tTFMvd4x1ee11/WArYRVbAudaRfL5W4JkFVGqdGIaUVyxBOxnSNK1V81qJFfCfZylsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(451199018)(478600001)(52116002)(2616005)(44832011)(36756003)(6486002)(5660300002)(2906002)(8936002)(316002)(86362001)(4326008)(38350700002)(8676002)(6916009)(66476007)(6506007)(1076003)(66556008)(186003)(38100700002)(26005)(66946007)(6512007)(41300700001)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qbOUBt5b/ZJTUXg6bxIQQQJxge9SKybDjed7WrAVVqHsAYxxzg3Pco+9iKuf?=
 =?us-ascii?Q?wDDDgN99dZRTIlNqu72Ji31H8Wo7k4DzkAOTsh7cJOZjGYhOgCRqTI9JzYRd?=
 =?us-ascii?Q?2Tm4hKffcjJ80fMy4Pw7mqw87KJYldQeOkYRbnNZ7OkHF5RA9UHGpIs7FpFs?=
 =?us-ascii?Q?zJDw0C+GkG4HdlHa9Kw6rwp6umQJOrrq6goEUjb8P7D0q4tiSpEeE7t3TRNu?=
 =?us-ascii?Q?pE6r/v/pKnZ26Gpyagrmy5TLaDlMJtzAgOJPXWhDlTmXLAjh4a2eM+icqshj?=
 =?us-ascii?Q?FZG2LBM6WXnNd4e9rsQtI6/RCnApCoctV1VVTZ1DyVGFCDnkd0pUwkk1qQ6L?=
 =?us-ascii?Q?rhTpi1pka/DTamz2Ic/74VRHwVpJeYk7h/9gq6DopuO0dMvWtudqoo93P8aJ?=
 =?us-ascii?Q?gjKOts8Jqnj7/gdTJdY+3st0q11ErBY7dD8xJYfQl5qXrw5dgQKReb63ZOxi?=
 =?us-ascii?Q?2NseuUE+gHLMkSbihpylqkO4QuFgcEH257BlXqTjEYLvZESCDaWa5Wz7qGp2?=
 =?us-ascii?Q?dnFs/bd+43ZAM0NjBN5ACOXvGUGctjEoYoWZ72nBxEQED54jYgIxYawzrRMr?=
 =?us-ascii?Q?OGKTQog2Gj9cylNiPk8lGaUtFeWuNoeKWNuYrY5yg3YHpvlZ8OlWsWvyLoBz?=
 =?us-ascii?Q?F/gx9MSX9SYlJRhyG/out8kmaOHnIYxUpMuZaxhSlgz0bXri6caNrmT2op0H?=
 =?us-ascii?Q?s0Naq6flDowqV5qEwEuxj8AtlRC7RVJBXM8RcVyyD8RvploioX4AWCL34Jpu?=
 =?us-ascii?Q?QkMzIlXYIE9Xfrl7cjLAJRS7sbhtH+22VwWepHo9vw41etGQNKeAkqgKqAYG?=
 =?us-ascii?Q?nHJ5y3HeKvRJTS/XVxXhQHKK1+20Ga79zoSG940tTBUdPJ8HwNraVxO7yYM1?=
 =?us-ascii?Q?0faJ00iJikLD1HoCt3VcGQx0xMXfj+otLxW3k8kg+JXv5iXg7Xxm0u09CtRG?=
 =?us-ascii?Q?+MXJNXD+GOYwizK8g5d0EF/1NFY+mkv7qvrebncrbDjZdgKzWnDpEfJUZK17?=
 =?us-ascii?Q?u5BqCFxTz/QyqWaTDNlaGRCAIIobJEUrqKqqUHL3tnyF4WfQG65tAudidQEg?=
 =?us-ascii?Q?edZ8cSU0fNdpR7oLhEOlNglwhBpZ8d977eCTGGVPkgfgYYqghHUszyayB9aX?=
 =?us-ascii?Q?wkiS1xq6UT+yDgmfbq7dzJr6y0SVqHdwme/d1VD9h2s8wJfuLFmAQV84fYTa?=
 =?us-ascii?Q?zs41xl3/rqlVCCHgHRXHveTy8nbnpVIqXnOFdYArS9umnzgd9yt89b2GHfFb?=
 =?us-ascii?Q?OVazErt+CbTjCQ0MgeQqGEnoxSOKjmRdUz5SPaWS8HBJU+wg8wQRaSHVh0UG?=
 =?us-ascii?Q?O9plMRaxcByDS6z97W6+Qg0YJcLqABbUcZl0kmhq3mUGhzvLUIeMQjfNwd6I?=
 =?us-ascii?Q?l5E1s4/9kOYfGyiwrsTy8kZm1r6Vew+URrx37rdl/0OEUWm41D45t9XrkWqw?=
 =?us-ascii?Q?fZsXv9AvdffrsdkgJ2uYkRtLiWbvm58x0fNSoGnkxKPYoZv6m+aTPa8hOFk1?=
 =?us-ascii?Q?6fxMwsLKXukCmW7/M8e+RHAzRxyRrhfKhA2osmQQ6sxw3MNB6w1tago/n6v1?=
 =?us-ascii?Q?sQCjZHB8kt6S+5xQ00tMkAt7Zan9e08Y7MejeQwdCzzlM7Out/n0Yk6l87mP?=
 =?us-ascii?Q?d8Z914v0gi5PWfJQDK+aKAY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a11c04-0b1c-44b2-ca36-08db05c8d108
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:27:06.3387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/o2d0HAqfZghsf0/K51ZzNovWq72ZvLa3pYZc0qumm3FvHexfl/Rsa+N7m5MWq3CDvVRMp8oUFFEP3NsHpVKJ9qg0Q0ILebV2wy1Haqmno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9356
Received-SPF: pass client-ip=2a01:111:f400:fe02::72c;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 3ba8f42131..31e74c9d3a 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -42,6 +42,7 @@
 #include "qemu/bswap.h"
 #include "qemu/bitmap.h"
 #include "qemu/memalign.h"
+#include "qemu/log-for-trace.h"
 #include "migration/blocker.h"
 #include "parallels.h"
 
@@ -434,8 +435,8 @@ static void parallels_check_unclean(BlockDriverState *bs,
         return;
     }
 
-    fprintf(stderr, "%s image was not closed correctly\n",
-            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+    qemu_log("%s image was not closed correctly\n",
+             fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
     res->corruptions++;
     if (fix & BDRV_FIX_ERRORS) {
         /* parallels_close will do the job right */
@@ -462,8 +463,8 @@ static int parallels_check_outside_image(BlockDriverState *bs,
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
@@ -549,8 +550,8 @@ static int parallels_check_leak(BlockDriverState *bs,
 
     count = DIV_ROUND_UP(leak_size, s->cluster_size);
     res->leaks += count;
-    fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
-            fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
+    qemu_log("%s space leaked at the end of the image %" PRId64 "\n",
+             fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
 
     if (fix & BDRV_FIX_LEAKS) {
         res->leaks_fixed += count;
@@ -597,9 +598,8 @@ static int parallels_check_duplicate(BlockDriverState *bs,
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


