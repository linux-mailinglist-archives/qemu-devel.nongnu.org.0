Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F23159BC8E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:17:00 +0200 (CEST)
Received: from localhost ([::1]:53786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3YJ-0006Kt-Lt
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NR-0005hD-2K; Mon, 22 Aug 2022 05:05:45 -0400
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:44801 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NP-0006xe-FD; Mon, 22 Aug 2022 05:05:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJxqBz1jnby6dJIVHO15vsfIYaX52qQLTF02lDbCcZuOmRB7cRtfvBUdJfKmO1ooFw6bspRrzAy+iXr5MyYUvs/QfpLOg/86R219r1PflcUmaDRzRYh+ls7lqdX47JXUHPqNn+lthS5pig8pHUc8WO6GbXw+sCPia81DkPMtXy3A5wEgjqmYr6mjnnkpuEUl8LF70yiHO/Nph6sRPvqfxws/V80vViSMuJXbCLwlPJafH4WBPRjq4ISR2yAD8WVi+/8KxH9glHMBJE2Y8kzBXgfu2ri+oZy96Si7fumc/wyaRE5CBS2+LG0tb7GhWYWz3qFNSnpbxlCJnAbu5GCEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDm4eZCjvQDbnOyqjxJHnM3ZJWF+6M9FzAvCU7W1YbQ=;
 b=U3bWe8deZfIClIa4rtt/Qh1SPIH5wkRSyKKyqJDdk4Had+INhV3br/rFufr3OQgLOhiKYZzSfra5oI76ljXTfMaz7hvPoeBKsN9C7IOeGrtsbHlJPSFTVg8ViT/PzdhN+KUfcveG70GjBaGovYsVEvnBcdOmzS8rUp4Ygsn7hOTq/q6X16lFKvr+6M6ZwvvFG36tIAAQoWjYch8OLkg/9eOehzDyrSnmHBBnRNznCL4n3kXIngOMXY2GfOehn61BzSX2N+VlHvCszNHgRjgJR2Zu2wdtZbr1zechYBSIp1Svp/3yTcNMDD0yLOaSzJCjn6opJtKhQBLkTvR9HszXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDm4eZCjvQDbnOyqjxJHnM3ZJWF+6M9FzAvCU7W1YbQ=;
 b=gSYU0GNJWTcNzazax1Il7Mf1FHrivfZGkRqpGL/S7rcHEItirTk8vDKRH151K4422OESocb7cIxiPvH36tW6+Poew/6NkZAADMRFux+tqy5Z3YA0pZXKf4CoGFnw1b3cH3fnAsLmMDvYA7TdBM8JilOd8kqkvJCu/fymvGO/7vIcPvXTNmVx1IBKIpvxurREdvzCNjoFV66Pt9Xk/rqM+EG+Jttg8qWR2Gl2xXgwAFA1JWiZjqHpUFkuKkkfV2RNaVq0/xuXJ8ZJvPJ1IqMMl81VN4RLB8boVAkl9EOGy6LQKqUUXNsJGxgrjqiobx0KGEiDqjA+6ImtUJmrqepJ1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 09:05:32 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:05:32 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 4/9] parallels: Use generic infrastructure for BAT writing
 in parallels_co_check()
Date: Mon, 22 Aug 2022 11:05:12 +0200
Message-Id: <20220822090517.2289697-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb83cf8c-0e3f-4691-299e-08da841d774c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JVQsoLSgJVAb95ZkqY7jUMhfXCKbhZDFmy79in6kmwEp5Ehm7vxAKQI98DDjT056wxtK2PgAjxfoK9S4HqCFhk/iU0sDIRMw62kfUFmPjH6dZMc6dlXRClE/x8mfYs9v1VNk4lsVI6z1Q3Sk6N1pQU57E0oiDhIf/AjaMJA6q+Dvx56lWUk3tbLTsyMtDtpLSsX2cpTJrmv+1f7GlivVGioLq0HYeG55tz8h3alf9DzHUIUhrZlJBYS7xrTzu8rzufLEoIUh+uzhifUCFzw4/7nV/WfMLcJGfIsFXYAFYNXj7ZIKRGf+9sXe8/oDs+BFsk474VarVJ5/RZtk+cBNcDnL0Aoab7/FjVq5fCv88TerJLhXdFHU4dcSntSHWb5pWTzHTFneycpuKzL8hnDdENrIjCSc+G69hbTw1JVUpwx7W2sCVUcltjh+Ecy8dPMHSc/bnLljOYIQNSrm43TahM3k7qNmzV8lrVo8FI1bWtltS2cD0hl9YjJtleZmVnYlE5/zr3gDiSRreXxYNwKO/nsLokEwQYzCZSYfjEEgbdWuRu2wfE5KJKuh9I7CZjK3r5LAfMSuewyc5O8Qx3ToctKOMDbKiuUdMr3hwc3HxDJZHex4Twa7beaGz/0ej/EbABYwhUCYV2fmOPViQ/A5FZVOOZfxh6ptaVnm2yOP/28J/j+02MvPgUi/j4dnDINkMvDDVemQNykP0G9HqGfjSoJGdOCW1OOrKitVRsIgz9lLqmCpJiG+SNE0hbKuhuAOZVQiShULrfNW+Pa+jvFK5uzF9vTh4hGfLtKqApABC5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39840400004)(396003)(366004)(4326008)(8936002)(6666004)(6506007)(6512007)(26005)(5660300002)(44832011)(52116002)(83380400001)(36756003)(6916009)(316002)(66946007)(8676002)(66476007)(66556008)(2906002)(38350700002)(38100700002)(2616005)(1076003)(186003)(86362001)(6486002)(41300700001)(478600001)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s2hI2Z6MeR31I9CJ9UsKRVQloJAc08WDajuxfR2hRqDDsKxsfXT8XfkbuNDA?=
 =?us-ascii?Q?FnW6ve+V8WsKabbeipvE13jqZKGDuxYXNPlb9WZXqedefTWx1lpK3bMxpWbL?=
 =?us-ascii?Q?21zA/8+7y1VYFp9jPgzkxTJv20V5uaay8stkmas6U0tnrudYOvANbD/Kil0o?=
 =?us-ascii?Q?7Rvg9ScXTRMfhFNdTMwLIVks6CSN3IwmtirPog7MoYNKWpTEyJJLn9CJOLXg?=
 =?us-ascii?Q?gfrgFMJ3xbdyiY6btQp77VSOVz6Mu119MF5F5pshLHHckLzqYBIQt8SaigHb?=
 =?us-ascii?Q?8bx+eOW9dO58xuarFLsLZH9StOfrUxgfmKYq7KL/kX5QDERAZiN7wighrRNn?=
 =?us-ascii?Q?UH6ZIVQuKPVrWBfQB9vfPH9ylulIeOMz9ETohH5siowiSVBECzbilhg3ZNF6?=
 =?us-ascii?Q?HtaGUgJIxAP2u/9G9lmGew/SyEXRMtDsB2YxyMIYbOw7iicg5OvhZJzqxjS3?=
 =?us-ascii?Q?O+mEamVPveUSHAU+kx/g0TcmA9y7ZfjwpeqAsVQO/OjtYjp4a/G87C+nh4SN?=
 =?us-ascii?Q?TSwm/rV2Sf5foRHfQvAq/HHNio0lEnBCNjJdyp3aKE2LvukaJkS47wNb4TIf?=
 =?us-ascii?Q?2sE2QXRl9v5DDX3P/PzoJIIAQfARoKCXs6iRabJdPN6YW7vErymuQOod0Lh5?=
 =?us-ascii?Q?rsD+9vDbGv9DZXXuRCd/4gNQpynFOFtYDwWQ46/7yi/6i+zwM2s24q4p7wxG?=
 =?us-ascii?Q?tdMftZNdtHqaJ+dNcMxKQ2O0CEeO/UIeq+QjuKj4/B6Boc0gkLDezW5pqkBo?=
 =?us-ascii?Q?4qc1aR/s913Q7amg0rQvSiPUWMkKMIf48CseVK0+0rBfszjPJQd/fw0sEFOI?=
 =?us-ascii?Q?e2Gs7Wg6dEGyZPCgsi80vtkUren4wmNvGOybCCsFnkfaX5CqTxnqENswSJlu?=
 =?us-ascii?Q?Iel6+GQbE8CdHJpa6G1NtFLDOzYyXTg3WBO0y6QZtgohUJGbe1tpJJ3z9kld?=
 =?us-ascii?Q?AxPouMjV1sspwV9OeNlnjDCfmongvflyBW0YBVDAP8UyfGQaY/NpLLSiJ6lR?=
 =?us-ascii?Q?exBtuVM+24MoxsVRAXwIkGBWRptXD6TitNpAGEK5Xu+hwE1foeBTiCKWnz/u?=
 =?us-ascii?Q?JHClS4/1bbBJCSoGMy4fjxGV+2BqLLvGzBBdjMvCAthzxk8TWHn1c6DQy0/c?=
 =?us-ascii?Q?dBhBaImpIEsMhlV434yViaVJ8ZV1koL6BmSVSYEZGKpG4lNZLYhA/4Ee6/y/?=
 =?us-ascii?Q?KF87GQDVlPD6kOBflyAvE5VG0qEE+a5CtMJBIHKvZ1jcIb8hzFYjjcmGa2XR?=
 =?us-ascii?Q?6rfoZg63WzsAcXgpq1y7EX+9fBhBm7nWqlLll9+jRZlFq8XXtS25/WFJeK1p?=
 =?us-ascii?Q?UZsZMZrIISc+dEDHF5J3WWvobmczAf6EP63nsCBWbEpYUxVhkQhamxUyUhOF?=
 =?us-ascii?Q?yHIoGTkjrPjFh8zzaHgbpkZij5pX1LGLH1VtzZGM1EFfnQrAqUj41NWyuxU1?=
 =?us-ascii?Q?f+pDzb3eNchuodqtNXUFPVJvMJYEFn0gv7EglQvExyV2YZhTbFfzzla+FZFX?=
 =?us-ascii?Q?bCKe5yoYYAdZsWxotpS+KOtbUczCraxs24rF1LsYtdCXZbHVnimc82eWd72H?=
 =?us-ascii?Q?xHex/A2HlueSDy75i+EOuFWNGFV8XubMrhz4nlqL694KMdPIPS+l1O4ZzPuS?=
 =?us-ascii?Q?ZicJoTM71kHJvYnRKSM/Ayo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb83cf8c-0e3f-4691-299e-08da841d774c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:05:32.0337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ceExg9AAAycOa2gNtyVUHmJ32Jr0ci+C1hgKHloyhpiNt0do9Akt6PN5i35Y2yyVrSVjjK3ZlPdlAtYWP0w+lGNlxluEUKi0K4mjKMP+1GE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.6.133;
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

BAT is written in the context of conventional operations over
the image inside bdrv_co_flush() when it calls
parallels_co_flush_to_os() callback. Thus we should not
modify BAT array directly, but call parallels_set_bat_entry()
helper and bdrv_co_flush() further on. After that there is no
need to manually write BAT and track its modification.

This makes code more generic and allows to split
parallels_set_bat_entry() for independent pieces.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 8733ef8a70..357c345517 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -425,9 +425,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t size, prev_off, high_off;
-    int ret;
+    int ret = 0;
     uint32_t i;
-    bool flush_bat = false;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -466,9 +465,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
                 prev_off = 0;
-                s->bat_bitmap[i] = 0;
+                parallels_set_bat_entry(s, i, 0);
                 res->corruptions_fixed++;
-                flush_bat = true;
                 continue;
             }
         }
@@ -484,15 +482,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         prev_off = off;
     }
 
-    ret = 0;
-    if (flush_bat) {
-        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
-        if (ret < 0) {
-            res->check_errors++;
-            goto out;
-        }
-    }
-
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
         int64_t count;
@@ -529,6 +518,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     s->data_end = size >> BDRV_SECTOR_BITS;
 out:
     qemu_co_mutex_unlock(&s->lock);
+
+    if (ret == 0) {
+        ret = bdrv_co_flush(bs);
+        if (ret < 0) {
+            res->check_errors++;
+        }
+    }
+
     return ret;
 }
 
-- 
2.34.1


