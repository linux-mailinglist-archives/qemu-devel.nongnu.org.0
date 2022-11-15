Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082A962A189
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 19:47:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov0xR-0001PN-4g; Tue, 15 Nov 2022 13:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ov0xN-0001ON-8w
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 13:46:50 -0500
Received: from mail-ve1eur02on072c.outbound.protection.outlook.com
 ([2a01:111:f400:fe06::72c]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ov0xL-0007qz-HN
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 13:46:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SD/0ADTe90AQFwuyCihMpu8C/6EqYeWyoWlXnyAkkeKkudAU3taoHDPnvUywZ8n+X4oAGeqBLv8kMN2P26AfH3eb1YZ7FkgfQXYGI9vABMeLnw/yqFHLUAuayCzr8s2CgP6e9UrjuZAem0B2X02uEmja6sZ/nWELFooMRILMLc+OMb2bsO1itjRNkCChfwhB1caWenKU+aE+9K1gujc9n7DZRxkLQDUNPnsjM8JQdN5x1/8XUCVK6eEl/fEo61VNpn+eM1prUTBBQT9JrpWhd1gKFHNhhPSa8fjystjqZNmWb3ClTGu4NElitYF230ZguoweSqwn9Ul9XhSOtWMu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNwrz3wOMOJ/dfpuiTcgtStHV/H+vkSjEA7jv2TxRbE=;
 b=FzZQBVDBSx+G6DGjGQZqLdPwQEX0+Yoyfk1QfJCu9/gsOkI2liWZq4Vf7MVvxfhT/A3ZiZS+jWM+JGccrpcYk3OJHWhfOzw0Kg1s7d3QzHLtFBVczVhUMNXCMtb+1YyWGtHbKjarTz57E3WFzCnU+n+SLnW57jL4xdV7VsvXrZzWa9OwV+W4NfICYD+FBPNAmrVF58szOzDrpExC+CUc7QyaER0Ya+H91au7MyMMOK/+fqAJmc8T4J4yDy+MWEAGv6fl3tFGcG9iCK8HNivJ5TAV5sjjPHM5BMCsjqkvBCfW1rEssIqZeTqsWczbjKkvl4Y6q/H27AYvCdLnAYWiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNwrz3wOMOJ/dfpuiTcgtStHV/H+vkSjEA7jv2TxRbE=;
 b=C1qFDT2ebDlV1lIIU/Sez+9NMBELP7soMhptN8yeeEErgksahmlIWUzmOP8hnxLb4e8aw6wqJLQur5OTHrMPs4rk4OLNOmf4tuOc/LwS4/g6etI0/NgubgDav6Q5Kt9A2q7GrIl/oUMcYS1firMNPSS9b6iDWWIrBVKJWcsHoT8ByGPSa6X5M+KnbSTFJDQeg6ivwG2htOppvBr0dqtFO8jzWVHR3oA/T/yA+Gw1nKlrQ3d+P/6rXor1FLPshSVIPshHvXMZj4UWIEwbENKh+h6kHJNDqDSlN9wnPmR+WSY3rkHEOabbEAy48n0WRoX1v2eznzcJZOhJ6Z28nMQkjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6607.eurprd08.prod.outlook.com (2603:10a6:102:152::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Tue, 15 Nov
 2022 18:46:10 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::fa9b:7e41:680b:aeb5]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::fa9b:7e41:680b:aeb5%8]) with mapi id 15.20.5834.007; Tue, 15 Nov 2022
 18:46:10 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH 2/2] qga: Add ZFS TRIM support for FreeBSD
Date: Tue, 15 Nov 2022 19:46:00 +0100
Message-Id: <20221115184600.747961-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115184600.747961-1-alexander.ivanov@virtuozzo.com>
References: <20221115184600.747961-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0102.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::43) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAXPR08MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0875a5-7f0c-47b0-391c-08dac739a9a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPXC7jWWacNUzoOhSYJvMq+VeFaG48s2a+PIeb/vvKFnTlhKO0MmS1ZTJUHlvo2S3hPMKQdM6Uvg5tFdKmX89ag/IUQJ8cEqY2oUHkbaK60KyDX8aG6wkGqxOWqqRb9L++R0YA+iXzqWrrinxAS7NEEVflwrmgf/hEB69UxkYugAtpjJX+N024CuAZe4yto//Zev0o+zaNC1nzGgJT/Bkg6AojmbJa+5i5j67fDKs5Vrss0kEpEnXv4c3CAP960EaxqDZG3tKGFIDRhbY9qIGOODivpdIoT0ig/MhjR/Hu3Ylk40xT71HOF7vv8WNKUgiAJdtBPBVp2oaJhEKExaXx0IrlokXas/z0TKE4s8Tn4Fh74O0nB8aAR8+9E1QsvzQ6OI2wOi6yYVkjxPboC1I8IwPzOTBVvMXcHpwY766y9nitQ1aInN+QsAssaQe3hKMQHj0cNGU7Uc752+H5RrKwxuORpsrcl6J7DjIxlklNZeoInX6YWLcWisYsrITbnXqrCvgKmlxjvqU9J3z4EkeINUVwF2aNMDprLw89FsZee+yrPpI9OygNnq8yq8j+39/f5/lwejv1u+Vag6mQxC/GsSMJetlOtQuTBjDxnEmW3zpvQxFtAtRyFI+UHceBbp01Go0uwe1WrpX/y3TGXiGkOrkhh3XTwly7R1aNMshAUFj546NmZb9nOuRF9yt8Cz9EbhmiIXyQt72fy5B5PSlr9ZjQC8kp0MQ3koBHk2Nd0HMcwC13eFDArdzqJLQ/6d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39850400004)(346002)(366004)(396003)(451199015)(36756003)(38350700002)(2906002)(41300700001)(83380400001)(44832011)(86362001)(6916009)(478600001)(1076003)(2616005)(4326008)(316002)(6486002)(66946007)(186003)(8936002)(5660300002)(26005)(6512007)(38100700002)(8676002)(66556008)(52116002)(6666004)(66476007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Krxj7N1DpZ7nx3BggGyjBQ5OPIMBXJS4UOzlnvq2NYlkqbpfijLr5RHNG7g?=
 =?us-ascii?Q?KHis9uVX31/pdGn/vYvD0V06LfAWnAzgeMhr+9VUztVGWu5ZFHA0RHeL+o8B?=
 =?us-ascii?Q?nDSvDEc9l5CeE95lkkKdtrUj+AGilYceqUniOVUD+cD1yvEZ+o306rNEkbQ2?=
 =?us-ascii?Q?q6ukcddbkYFSmvOv3UTJYOVlIk45YYPvAJH4a+FkBO86zywwD4LMN+oJF+5z?=
 =?us-ascii?Q?QTxY2V0K8pTXmZVJfd/wGTR4UCej5M3joLrDsWXBQVFiKVsT1u5wBvi3/UdT?=
 =?us-ascii?Q?9ivaSOHcADdGNn95NUHAxSQZAto01j3RSwehUZ9S8sMJzKZXzr76oXffGVBE?=
 =?us-ascii?Q?2LH/tNd51JlNT/IROsD1xg4am52QUhGdg4RwEa6YloXoIZDS/uACSMRpuDTn?=
 =?us-ascii?Q?xulFAnu8SVCHRvqmy8PQkm+dzTtBFM7eI++KOdW3ZZBHvky1Kav8zwWy3jod?=
 =?us-ascii?Q?7F0V7G6UcNyg4VCG4nrXsc6s+WlT5yNFcfGzuzwTFeBkut0r30qcWncmlgpL?=
 =?us-ascii?Q?v+bkubuncRrsmVTYYhmzs+tleAVw4zRypudtd1la+lYGK584Zmg8SpyPdtLA?=
 =?us-ascii?Q?HLzcybs0inDxgGoaFqMwMuB82XJuSlN6gap3JxWhcAVRg8W0GPNVJQBIuqzM?=
 =?us-ascii?Q?nt1UZuQpuCGx/oxtHLTG8iYhj+Mzfx5Wyo32HKPu9RVOeF5ySDsAsGR7NhvU?=
 =?us-ascii?Q?DrJtEQr9JWYunYmlUoXLrAz8jdIKwv7vvz/OA7eOvhsmEEu33EzGsb6x9AWj?=
 =?us-ascii?Q?ECsJDc70s/i6eFaa9O4z4atn6XhxrhNjt2gc9ZuHxTDisz3LjljnhG532RUv?=
 =?us-ascii?Q?wLW+efqeGWMhso3qfo94ntTUxyETvAuzZHJ/xIV7tILS41LN7a36BsC9m231?=
 =?us-ascii?Q?LIM68Oe1HctYKE7Fs9IurZ0rmq2QPA8v0cLHB+KQO1izt9a69hznBGYYiu4z?=
 =?us-ascii?Q?0Yl4h/RmJbBR7ajSB7PPL9OT11oEEBoag4+6nR1qJCGP3sA7LJ3KT7mi9o16?=
 =?us-ascii?Q?ULlL+rSUgyds1isqnQqwDjb3ZusHDf7yBVLmUuyeA8eO6OmbleiYh1UqmUm9?=
 =?us-ascii?Q?iCc+/FF0+nPdeqpXFUUX43DOnZGdHnk3gkCxhV9uip+YPAAs6jotHv9ZGHu9?=
 =?us-ascii?Q?owhDsdMttWW49831X1CwPg+B9Qbt2Mys9krG3YSVtjiX9lMVdrNPECJfRUUW?=
 =?us-ascii?Q?Bxjf3cinMYUKQ1u2gYpNuw7/63P5WKBwzpxdx5d/25trXBsKYCUcJ8RdIcqC?=
 =?us-ascii?Q?vAPdQIyPav1dQLS41LYsggZFLEClomp+tZzG/xCU3kNdgW6h5JiNA9/PzPyy?=
 =?us-ascii?Q?9OPNV9DuaDVknmBh/iQlMfh7uealH8sr/GhKq2ZlVNMEgvTHFD8gtzh4qeEp?=
 =?us-ascii?Q?oCjjj1km2v+pR8clINg3jvyH/ZK4/0YvvD9jrXGUqHC/AVZRgXV5ey90oM/v?=
 =?us-ascii?Q?wNU1P4iFyQWxnaFdGgGPgZRL7LOCS4MGnk/KMOUGruzPuaqPgglnopIS8Wwv?=
 =?us-ascii?Q?PWpjdBt1LDtdySRU3/PDnG7NmBdZZvXYnDZ0R56ErCQMJ6Jmvqv/6JdPkM90?=
 =?us-ascii?Q?PfdAih6y3IBwuzHrObGWflemzCoPX2WTINqEQonf1DWwQqtxyLM9JPb46NfM?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0875a5-7f0c-47b0-391c-08dac739a9a4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 18:46:10.1084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IwOdOmMqkSws3dPTPrePhROe0fy9M1KuCcA3TsPQgiP/tSBsT4Y7A32xl45FMmTu6H5y9xD2EnRfyijEtjG8oezzn8OcEx847nfCmG2f90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6607
Received-SPF: pass client-ip=2a01:111:f400:fe06::72c;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

Use zpool tool for ZFS pools trimming in FreeBSD.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-bsd.c    | 109 ++++++++++++++++++++++++++++++++++++++++++
 qga/commands-common.h |   1 +
 2 files changed, 110 insertions(+)

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index 15cade2d4c..960c4209e5 100644
--- a/qga/commands-bsd.c
+++ b/qga/commands-bsd.c
@@ -170,6 +170,115 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
 }
 #endif /* CONFIG_FSFREEZE */
 
+#if defined(CONFIG_FSTRIM)
+typedef struct FsPool {
+    char *name;
+    QTAILQ_ENTRY(FsPool) next;
+} FsPool;
+
+typedef QTAILQ_HEAD(FsPoolList, FsPool) FsPoolList;
+
+static void build_fs_pool_list(FsPoolList *pools, Error **errp)
+{
+    FILE *fp;
+    char *line = NULL, *p;
+    size_t linecap = 0;
+    ssize_t linelen;
+    FsPool *pool;
+
+    fp = popen("/sbin/zpool list -H", "r");
+    if (fp == NULL) {
+        error_setg_errno(errp, errno, "failed to run zpool");
+        return;
+    }
+
+    while ((linelen = getline(&line, &linecap, fp)) > 0) {
+        p = strchr(line, '\t');
+        if (!p) {
+            continue;
+        }
+
+        *p = '\0';
+
+        pool = g_new0(FsPool, 1);
+        pool->name = g_strdup(line);
+        QTAILQ_INSERT_TAIL(pools, pool, next);
+    }
+
+    free(line);
+    pclose(fp);
+}
+
+static void free_fs_pool_list(FsPoolList *pools)
+{
+    FsPool *pool, *temp;
+
+    if (!pools) {
+        return;
+    }
+
+    QTAILQ_FOREACH_SAFE(pool, pools, next, temp) {
+        QTAILQ_REMOVE(pools, pool, next);
+        g_free(pool->name);
+        g_free(pool);
+    }
+}
+
+/*
+ * Walk the list of ZFS pools in the guest, and trim them.
+ */
+GuestFilesystemTrimResponse *
+qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
+{
+    GuestFilesystemTrimResponse *response;
+    GuestFilesystemTrimResultList *list;
+    GuestFilesystemTrimResult *result;
+    int ret;
+    FsPoolList pools;
+    FsPool *pool;
+    char cmd[256];
+    Error *local_err = NULL;
+
+    slog("guest-fstrim called");
+
+    QTAILQ_INIT(&pools);
+    build_fs_pool_list(&pools, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return NULL;
+    }
+
+    response = g_malloc0(sizeof(*response));
+
+    QTAILQ_FOREACH(pool, &pools, next) {
+        result = g_malloc0(sizeof(*result));
+        result->path = g_strdup(pool->name);
+
+        list = g_malloc0(sizeof(*list));
+        list->value = result;
+        list->next = response->paths;
+        response->paths = list;
+
+        snprintf(cmd, sizeof(cmd), "/sbin/zpool trim %s", pool->name);
+        ret = system(cmd);
+        if (ret != 0) {
+            result->error = g_strdup_printf("failed to trim %s: %s",
+                                            pool->name, strerror(errno));
+            result->has_error = true;
+            continue;
+        }
+
+        result->has_minimum = true;
+        result->minimum = 0;
+        result->has_trimmed = true;
+        result->trimmed = 0;
+    }
+
+    free_fs_pool_list(&pools);
+    return response;
+}
+#endif /* CONFIG_FSTRIM */
+
 #ifdef HAVE_GETIFADDRS
 /*
  * Fill "buf" with MAC address by ifaddrs. Pointer buf must point to a
diff --git a/qga/commands-common.h b/qga/commands-common.h
index 8c1c56aac9..922f9c479b 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -28,6 +28,7 @@
 #ifdef UFSSUSPEND
 #define CONFIG_FSFREEZE
 #endif
+#define CONFIG_FSTRIM
 #endif /* __FreeBSD__ */
 
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
-- 
2.34.1


