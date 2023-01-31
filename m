Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23173682A86
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMns0-0003Xv-An; Tue, 31 Jan 2023 05:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrw-0003U5-Tf; Tue, 31 Jan 2023 05:28:05 -0500
Received: from mail-he1eur04on0704.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::704]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrv-0006WH-Dt; Tue, 31 Jan 2023 05:28:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8wl0x+4qshTiBqsVmRzT/hCqYpI3/npWyQaxz7tyPAm1KFZ0FVW2wFrZn8TmWrfryPcOFgw6hvpNBbfis+8guQu3/O6vFrbx2i3vTQ9NO9O9RUV1BLmFd1SGkI296vfM4a3943zXSFQvsflIWrKb4ESlDCwDZbSd6IjqFv+alSGaIL1+ad8dC/UtiMjdui8XjI7bOCPQ7ppy12oErP4sMM+6RjKNTAKmvmJbx+3hZUnkD8d+XVgkQpZRw7wookLVfXkqC6TGVlbqgzKQHg82yfZBbHPIYRuoKKPboqhNc5nuBhgF7ntxe986RaVy8gB1voBYKQcT0kyVY3V3bhF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aN7VI25ymTQXJ6uuVXX+SYV9vhnbFxSnH/PryfIepIA=;
 b=fPuexb5mI8TrKvki8gpcgmMAP1bGcKk/StQ7u+m12uM//FU3CE45vkwJyiaF++qDKTX+CA85bIZpMogIPqL6IhsnefhcOAkkXC4TnrSW633lH+oBoOLmQENo9VundChhqJYTL/577E7dXWSdocixBK3pthhjpGAxnCXLqJrNvpI6A8XoYtZ+AoXZed0qtegWzI2LzTEx+mlxXP6MNEYsX6pN14fupS5K0GfGCdepNuwHcRyIg0JSZm+tDq/YDSpk3DA0C7sMEtWAlyGDacSe7aKm7/Eaxy0sqxusTM9LmmYv4NoztrJrpi+Nzu6YXNZBQFqzUUjlKOO6F0H9/aQnDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aN7VI25ymTQXJ6uuVXX+SYV9vhnbFxSnH/PryfIepIA=;
 b=rd/krDAckj/pYZtAN19M/lM2QEdPMsM7HoUYlRX/9319loX7kU/xQIYYQb1ya67j97wk4pCkImXjGrP03r91m1VEpC9IZlhixn0Hx2ULJDMVXwDMI4uSialozs+N9LETTID18xQZ/biiir4pZelueCVhtzvteRB5W/p1U9tPUJR/jxXEEgUgM5ZyMjfnXoE/59xURxnlBVtQFgehCGWSAgmYh1MBmntaG2ZiXcCaThKjN81b3pdVj4Y6iQRDHz5DRzjL1TGBNMf2D1t7BhZzRR/TcxWtzJuc6xYduOOtTi61EMS9+ni8zXclz0xXrj1MHOsTajkFSYTOIfzjt/GzKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB10217.eurprd08.prod.outlook.com (2603:10a6:800:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 10:27:53 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 10:27:53 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v9 11/12] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Date: Tue, 31 Jan 2023 11:27:35 +0100
Message-Id: <20230131102736.2127945-12-alexander.ivanov@virtuozzo.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|VI1PR08MB10217:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4ad14d-fa30-4447-bdae-08db0375cf88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M6igUVW1SAE0iFfPdZpiAwvmzoScGbA1UUcDpBd9GWfHwD17ZuNSzyPaPvVwpd4Y1Va36LA/sI1aPDP/jXmqb4q+IjwvAbzDCjp9iujlHQ18OTVWMivtFBt5f8z4MkauZRIpRiJYXOED4s8dwqFjMbnKqZ3/Kn5co2p0J6t8NwY4PV3TvgCD72+kbjDYQeN0sK2JPPheY1Xc8Nn5Mdt2l/72CbjKCEXUUEboH237i5pxhRlLaFVt22SAA7dwdx9jmUU7OjzJ6kt/sqW0B0Q0JXMU1DiaWyzJCGcU2iGrfiobHjzLBK4bceSnG0pYRtv5ujix6rzoiaBmEis0zUAX7XXlHJCRm/JuUIjWqfY6zxTOBqRyUZQRENZ3rJb6R2AOid+Cqvqba7Ix3B1AVxAWAThKtwGD0oOXk3odcdW4ECSrwTlm9g8XjtVD9uNFmT602F5fLErlyFlXZ7Cjl6+bXnIZD2hkTGTm/ns4vVKrAHoG9c1i3XK9FuQ822wPvgJqk+jkK40ppZgHA+g55pgcgiPaYFnAlgGtbNJa9I2D/LTwGWgbLuLjpTaBaNqtVPm+wgxilGnRDeg+HHhzT9M33GFT8q6x0mQSu0stSfM+C46RAuMbgLXWF8NOPGuiEiSLi16NZ28wH9ZEHfdUQV07jH+eD/JqqGXJGLb9yc4+kvCNhDerkUL9C9jRIA2dO5/0A1OlT08EYXeJtHMjsJgL+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(451199018)(478600001)(6486002)(26005)(186003)(86362001)(52116002)(83380400001)(38100700002)(38350700002)(2616005)(6512007)(36756003)(6666004)(1076003)(6506007)(4326008)(8676002)(66946007)(66556008)(66476007)(8936002)(5660300002)(6916009)(316002)(41300700001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WMsYgJ1j2a6cwn97MCuZqrg9c6SdU683/hmtDDAWw0E93xjO8HVtoA6QHEox?=
 =?us-ascii?Q?wHi+30txJ5He34ohUJteH3f4JCrTaspVXSNiA2TU/WNtzycmmox1CMSJf+ig?=
 =?us-ascii?Q?5Gmge1kVbZ/8htt4I/GMSy1w0Pr13wIcJ+H1JY+dBn6wCD5fOjucXh4Jd9V+?=
 =?us-ascii?Q?xhn7jFn76/vQSTiHaE7W7d7ebDenLL89ZjHk3uNsbi2p+ld6NCnLce/Kjw/i?=
 =?us-ascii?Q?Hsd5cmOTvyaOIMsJ3UT28NeU+ytz/f0WkDACYhgcGtE+e5/bSQXu7xc2IOU/?=
 =?us-ascii?Q?QmGqPVu12J68UP3VYqaJC1KTQbQZv+i8wyGTegNCsAcGGYKVs32JHsqRWC3h?=
 =?us-ascii?Q?FvwKmzCWCR3HF1b7Cz/kwelCrGM72ycnvQnB9JGoxAKupqFgCfH9ckRtd7fs?=
 =?us-ascii?Q?SUrwAJfNTPz8K4790w5gYoeMh/CRsRDgP9u1iDOrAotJd7DfP0cCbkX+2LF5?=
 =?us-ascii?Q?NKYZvmtvinl1KHL8HtFefl/1Ak8sI1mKQoYp8zufaakEBHmxaQwVbhIrOaQE?=
 =?us-ascii?Q?UYaoi61FW0jShDfkdYeVO7/tyanmoPS2lLssfeWUYZUzI/cP5Fnm47lFtq2M?=
 =?us-ascii?Q?q+D9O/SiUtz3UQK8Vk/V+O5Zfk9t8zRyl3zEzYNjFCE7SMSj705uwF9kze83?=
 =?us-ascii?Q?m3hduEuk3w62kUZDU8Z8S6jUHcR454OJFlYoW+mz7qry1LutouKhH4u8pYiU?=
 =?us-ascii?Q?RVw9zC0T6XljHD0AiBJKtw4uryc3HAGrQ3/Zw8rUs0pOatis5bXUZ5ob2R5l?=
 =?us-ascii?Q?rxY7mpbdCnnMJF2Dt+SSNK7aBwk17WeZ3gp1NcKjKXCAEXzVz8/IfkNOQVVR?=
 =?us-ascii?Q?ryU4FC+OT9SnrsjB1QYSH/PLbXFP8WgMMH1e4UQpjS8ah2/TK0SCW+TiGomz?=
 =?us-ascii?Q?3sUjYPMLCg/riDILpXnAYb4Ggi4DtIH/GsZWL8TsNeoy69m3ftE4gQ6H+IwS?=
 =?us-ascii?Q?fmwVcHVaW/VBoT8lGrSiXWEewhtckDE7m+/tI7BeGZ5nVfUb+UvBJrV4Bbps?=
 =?us-ascii?Q?Vkl8IxxuqrJn7G+r1q3zCJzU7j8Pt3aAgnSAuAe6h/uLlxRQc2B1qNJmHDEZ?=
 =?us-ascii?Q?gS1bI+WO3SXsmp3SNAZ232Ry+stRV+57DSLTF4tIWIuq+CHNDLuNxGvE/Tqk?=
 =?us-ascii?Q?ogQfdEFQCuxzLKmmBRdTD3bQwDiz7FxkP/PYVogOAe1NE9lpaK5MviFp7PF1?=
 =?us-ascii?Q?Crq4FylFvEO3uRJQzjDI+nCPwPTCAI6XLKrMruZCbj405OlLF43prhIZao6X?=
 =?us-ascii?Q?oj9f6RoobCaEvzHyygnNI79uhMOR4Q1qb2hycMKAjvyT/FboEnH+08U+aKXP?=
 =?us-ascii?Q?VDlUebrLubMDHDtyVFVc8bSck3RSnMiGHhm3hqanG/tBrj9blm91QoSvYy+t?=
 =?us-ascii?Q?z2c+dbgZOhzH3bbO6ctZvVbdokzPI0skRhZYIpAvO3oDv6HKCXm+1ypfCVwh?=
 =?us-ascii?Q?PQwLHPtY0gQ87YJ2mZjaVzFnBobwGAkZNHHvnkcD8VPZTMK5mCplJ0SfzGWR?=
 =?us-ascii?Q?LiYSGkXRq0Ii75B/p3LpRnjPmv3wWpdeXNk9NDx0ZrG8I2niQWC9zqI/xW/A?=
 =?us-ascii?Q?bRx+1H77c2ow3z0PTPw1dwd7bfSFE90SNPydjgVMEuhojIWkbWlGA5/s827C?=
 =?us-ascii?Q?3XQpAouLyc3h8zbUb9e3z3s=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4ad14d-fa30-4447-bdae-08db0375cf88
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:27:53.2052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvdZG0hVgYfS3dZQS1REzVWifc67vMJPADjNVbcCT/ep6I+skrn0/LkzfjXkdr5mwAb1khToOgg5oGkRbQvWlIfDXLeoL/DpYpIsO2d59os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10217
Received-SPF: pass client-ip=2a01:111:f400:fe0d::704;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Replace the way we use mutex in parallels_co_check() for simplier
and less error prone code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 23c9ba7b7b..e4faa14add 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -556,30 +556,25 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     BDRVParallelsState *s = bs->opaque;
     int ret;
 
-    qemu_co_mutex_lock(&s->lock);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        parallels_check_unclean(bs, res, fix);
 
-    parallels_check_unclean(bs, res, fix);
+        ret = parallels_check_outside_image(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
+        ret = parallels_check_leak(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
+        parallels_collect_statistics(bs, res, fix);
     }
 
-    parallels_collect_statistics(bs, res, fix);
-
-out:
-    qemu_co_mutex_unlock(&s->lock);
-
-    if (ret == 0) {
-        ret = bdrv_co_flush(bs);
-        if (ret < 0) {
-            res->check_errors++;
-        }
+    ret = bdrv_co_flush(bs);
+    if (ret < 0) {
+        res->check_errors++;
     }
 
     return ret;
-- 
2.34.1


