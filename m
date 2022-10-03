Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FAF5F2E5B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 11:44:42 +0200 (CEST)
Received: from localhost ([::1]:44014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofI09-0002VL-5J
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 05:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHvH-0006QA-KO
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:39:39 -0400
Received: from mail-eopbgr80119.outbound.protection.outlook.com
 ([40.107.8.119]:34208 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHvA-0002U6-J4
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:39:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFQEgyU2BSLVHeZSqS70932KTuXIswGOwro1TObJXB50zmWrVGoAjjNTMPiWorFTFqLNLR0LllRnq+3opSaAWtkn3EKjs1J+D2Ilwel134a25OnWsmO07VVmzKZkrUEQb5v9ZUacdkm/2QragxKp4IKp0Ya3lt/B5wjT23IXm6rc1RoOAXW/3KtJI6UHW3UMG8F9NAOH4Z8zS+kqrn21ynSLLC8UaizNlSLwezuy1APhQ0gTuvi1ShCJZwhTcqyBtQBKBiLtUguOXcdHHQBPU+1ad2HYlOgu88PxYYMIB+jyk4fzkQL29agnJP+yp48U0v9vcpkGOpXoOhg793kdow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgRh0Iz7zGD5i5zCMDbOOLS3g9ELVqMWgvSnjCqL9AE=;
 b=NQz2JGCWKMdx72uUmVWEPvzbD+jpdm3C7xsRHaV9zp/3yEtlPnENlPULBxcMPo6GbpKWImNg01U6aT+/yID4Hc8/k4uc0NX66I4/Nd9FRlOZq3qbAe3R4rqqyw1Zh/p5SWz7fXmJ8ihXF9RT1nOiRrmxsT6R/jys6PMbGcE4G9+e/gvJ2X6rQHuxzpgACUH/ulK/US5vk2BswdfmnJht5skLLj15FBSD7h13CQgIOQGQGZd6kQVwpENccSjWyjA/cgy8ACHvvxfw4t7r/tMSSCUE4I+PGBolegrPOzpH3abCw2y+3DYWKGIg8Z1QvlqPZr+ibthYpJfnRwogMg5GfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgRh0Iz7zGD5i5zCMDbOOLS3g9ELVqMWgvSnjCqL9AE=;
 b=Q1YECYO0LHfWXzNr20eQu5cGKR5hnHlaQj9vVE6TEY8CIHiPRLHI1SJ7H7Nge6fu3vqVuABHT/Ez2EbfxGNGyqS2JF1JaezrrgP6dW7/kX6hbdL83wmIIQ0BAZszhXQdaI3C04CqkmVWiVw2Nee2Mdo1oJ95lqIlSB8N+I54Zjf9s4HQQAVpI5MiWjpB8CnGD0P7KtAFA6Lu0gWEOs8Ywg51z/9Bw/hvwcahu/O58PybT+TYcB7iSNGFcma8f6/rezejMhqBZX9KMutWKk35VbZU0dY1Zpt6Wsa9HDfya/XpBmGNNYHloQZZpKqVYcwzytTywdhfJA2GqCynD4teHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB8203.eurprd08.prod.outlook.com (2603:10a6:10:39e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Mon, 3 Oct
 2022 09:39:22 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 09:39:22 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v3 2/7] qga: Move Linux-specific FS freeze/thaw code to a
 separate file
Date: Mon,  3 Oct 2022 11:39:06 +0200
Message-Id: <20221003093911.1844031-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
References: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 50be285c-415a-4579-aea0-08daa52326bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 31rmqB4Z06qWYFnbSd1GemzvUwV0F5ZDMrmDMceiusbnx1y/8gHANCWolp08KhWz+lg6sbQ8PrLmN+b7oDwEk5poIW/ehXWRWAIhRAYh6I7ggaJ2Yn4/aa2Kc/3gN7ol52IqhLhpQQGowRNgrKVe1bQ5HLdrt2asl4KTQh1VKeZj3YthBYBi9EVh/ELRcQcYGbQt5WuHyM+4HTrhLLlx3K1lJXq2V32f9z+k68ym5H3XmQiwIEJq27SR59pgeeETNJLkcHtgGGyyy1L4reqmzzFD3FT4GPHhT3hNmUb9+nMTSwr4/GsxKkmiktXzBPdlA4GUUlhvNAGo7l/4FJ2z7boE+8DWFVvrIgH2f+jSy0uJQOLM8j/aD69ozTuuGUrhbqyosTv8OGGTGKPqBuMOwA79DB2IQOo1Egu/4Lvf+Sf+zLeCYTqUwWCe56UobrMBtIjXvYPh9UaTOkuw7mEOBdViFu2IOr3H6irZFeQGRRL4moctp6mT7neo9ebaGjAQMvrZRsyv/hFRNmYXvlayDd1AnsQhduY2o/riHIwCVYlv+IC65NNcV1A7Q35pfQqBXKoEZ9uHNndeKEmNjZeA5EADQ5BgKuixKXdA69WTnf7CN4LWJuCPguaNrFzkWunOYI4UrPsdJzVJ+pia3e7wUdKrugfS+E2YyKxq4uQpWiubtcCIX6ww3jAvZBjMkfvqNFH4s2WXZrBpPHQThWIJcvlR9EchTjAyF9IJAdh/hL4iNB11T9r65hUth5+5Ndk+ak5qT614WBZnCXl/aAPHtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(39850400004)(376002)(396003)(451199015)(6666004)(316002)(66476007)(66556008)(26005)(4326008)(8676002)(6512007)(6506007)(52116002)(2616005)(6916009)(478600001)(6486002)(66946007)(36756003)(38350700002)(38100700002)(86362001)(186003)(83380400001)(1076003)(44832011)(30864003)(41300700001)(8936002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THFGUStSbTJkNTVKY0pOcHNTeEpLUXJwOTBjWlFNRjYzK0thMkpCVjZRYThF?=
 =?utf-8?B?L2g3NndSMkV4LzJncUdlWnFDQjJORTJFQmFSOHhvNjdtTXhybHJkWnhtRkwx?=
 =?utf-8?B?SGxhaktHaFY3TlNMaDVuNS9CdzBVR1RsMWcxNWVseThOWEZKemhTa3lNSThM?=
 =?utf-8?B?Nm5Ka1pqRzc2WnZ0L2tIR3JQU2ZJUUZZREJiU2o3bFk3c3czVkVSWHVMWGFF?=
 =?utf-8?B?L2p2blVzTkFSN0E5UW1xRUs5L1RERm8rWVQ4QURPbWtBY1QwRmErQzNHN0lh?=
 =?utf-8?B?UElPayt1dmxpZ3lJNEJhMDB3OUFIZDIwTEJNeE9lUi8zTlNncUVOdEYzaDdM?=
 =?utf-8?B?cGQ5RENuRExBUGxURE92SWpmZmN0STY4UTVNR2VDbExUWHluUyt4ZGlyd0gz?=
 =?utf-8?B?NDZJSVdnRjBNUW4vaS9iSXFkTEZQVDJOaEZFMTd0YjFhQ3c1L1A3VnZtd1NC?=
 =?utf-8?B?MExmQ3FaR1hNdlFKU0lvdUVCc2NONmtOajM3bEUvUnN2SXpoVzQ4ci9obUFy?=
 =?utf-8?B?ajAvV0dsM0lDN1lROS9ISGduMHlhY05tTjdBclNObzNZd01iTUVHRVpudFB0?=
 =?utf-8?B?N2pEbUlNa0JBS3c0VUF2M2t1K2NCbW9ZRWliYWhrMUNydTNlazdXc3dCaThQ?=
 =?utf-8?B?dENZd0hoRHM5ZkVvSlhrRlFuOUUvbDk0WkRNRWRGcFhRZ1JxUHBMZGR1MzlX?=
 =?utf-8?B?SnlxZmFHUWx4UUppQkRTQ1lvMENLRk83VTFIQlRFMW8wZEN3Q1gwRzRLOXhC?=
 =?utf-8?B?V252dkdGWUdEbnRrWEZsYVlkSDVIMEhiZXF0cXpROUtrek9ZbDBKYTdmTWty?=
 =?utf-8?B?Z1hncE1BaS8vZGJaWnZhajJyRzhpOW1yczY3RmFmY2ZEYWFZRjFTUTFZTCtJ?=
 =?utf-8?B?YnNLTVNXMlF6L1dsV3k2V2w3TG9LZk4rRXBNRGsvaGVkMWdsQzZ6WHAvdXRn?=
 =?utf-8?B?cVNkcmM4Vit1dVBHVWpPQUZ2V1RtVktYanVhcm1zb29nN0pnbTBhUTdieDhx?=
 =?utf-8?B?ekpjd2VkMmx6WVl5WDlUdlZaQmUySDJPVklVRE90V1ZsSHF4VWxRWGE5d1hk?=
 =?utf-8?B?YnhKVThFa3NWQ2k5Nm5MSU94SVIveVZ4czN2ckRUSXFUOUpnTmlPVG9UbHZR?=
 =?utf-8?B?TnZpRTZIb29LaU04NlEralExVDZsdjYxZnd6ajlkS1VSZy9nWml1bmV2aGNB?=
 =?utf-8?B?SG5rUG9KVWgxL241TFQ1ajhjZVF4UlBuS1NPdEJUWExZRW93UCtCNk1wNUVK?=
 =?utf-8?B?emRDb1BzWmZMYk5JNVNEaGUra01KUjJBVjBIVzMvS2wzMzZCdXp0Qm52TXpH?=
 =?utf-8?B?OU1hd3JiN0VYTTRvZmtBYXNZbDhGOXE2eW91dGFCQWR6NkZtSjZvS3VpQ29E?=
 =?utf-8?B?NTNOWnJscUxMNnJWNCs3VTFQSHlNL2lLMnRSV1ExdWRYTGw5a1E0eDZkMkpY?=
 =?utf-8?B?S1lVVG5hS1RWVFQyY0E1SG8rWGNpc1BDRVVYNTNua3VLblBnU0hxT3EzbE0w?=
 =?utf-8?B?OTN2cG02VU5kaGdJWCtYRThtRU52YUJqc1lWY0pMajgyUUVKS3NzQ3dUUGZB?=
 =?utf-8?B?Q3BQWGZWUXNhZWwzU1BqSXFhdWI3cVN6djBmSTBySk4zV2czSUVxK3o3ancr?=
 =?utf-8?B?SFhZNG5DK3pMV0pFK3FFemRKaTdyajZWSmV0TDFNYklXY0dlZVdzWUg3a093?=
 =?utf-8?B?aFFvTktydkpWSFdOZU1VODcrZTZheWQ4ZnU1OUFKMFZnYy9NdEZNbWw5UlVB?=
 =?utf-8?B?S0s2TmxydkRYdCt0d0R4bmRsY3lqTVJzdjI2bDkyS2lLSTZWeHRMNVhwQWRL?=
 =?utf-8?B?QkROWXA3Y2FUVENyakNCRlVKRnlOaEhUR2VrZ3ZCa2J4bnBISjdVRXk2YjVs?=
 =?utf-8?B?Q2Q4dVZXTmI3MU93U2N1REQ3TzFIblY2bzhyQUtYZGltTFRYZFh0NzIwS01D?=
 =?utf-8?B?QlMzOForL1lRZmljQTF3Z1NyN2phdjhoY05iKzJkMmsvQW9vazdsVEZRdHc1?=
 =?utf-8?B?Nk5mZHBjTjg3cHJKU2Vya3dzbnY0dlRxNldOYUNTdThyWUpmY2xNZVdqMjFM?=
 =?utf-8?B?ckx3VHRNVkFBTFIrSEZxa2syYzlxbW9ZSURjNzY4RlVDK2d3K3k5S0NvMU9T?=
 =?utf-8?B?L0x2UndRT0JBWWpuOUZSYnp2VzNHUWxFeENvWlQycUx1czFldmFPcWROOHgz?=
 =?utf-8?Q?U+Hr9R6T/icXfF0glx7BZzY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50be285c-415a-4579-aea0-08daa52326bc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 09:39:22.0871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBVhFnj/2ViXZuC34PwiRIYDhsman6MJB/IdXrnkYWiHw7gOSAY0HnKEa8TL9WYLz9Gh6B5nYFpj7pOQCeRKm/qPUp5lsvfOsgAK8JLzMxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8203
Received-SPF: pass client-ip=40.107.8.119;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the next patches we are going to add FreeBSD support for QEMU Guest
Agent. In the result, code in commands-posix.c will be too cumbersome.

Move Linux-specific FS freeze/thaw code to a separate file commands-linux.c
keeping common POSIX code in commands-posix.c.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-common.h |  35 +++++
 qga/commands-linux.c  | 286 +++++++++++++++++++++++++++++++++++++++++
 qga/commands-posix.c  | 289 +++---------------------------------------
 qga/meson.build       |   3 +
 4 files changed, 340 insertions(+), 273 deletions(-)
 create mode 100644 qga/commands-linux.c

diff --git a/qga/commands-common.h b/qga/commands-common.h
index d0e4a9696f..181fc330aa 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -10,6 +10,40 @@
 #define QGA_COMMANDS_COMMON_H
 
 #include "qga-qapi-types.h"
+#include "guest-agent-core.h"
+#include "qemu/queue.h"
+
+#if defined(__linux__)
+#include <linux/fs.h>
+#ifdef FIFREEZE
+#define CONFIG_FSFREEZE
+#endif
+#ifdef FITRIM
+#define CONFIG_FSTRIM
+#endif
+#endif /* __linux__ */
+
+#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
+typedef struct FsMount {
+    char *dirname;
+    char *devtype;
+    unsigned int devmajor, devminor;
+    QTAILQ_ENTRY(FsMount) next;
+} FsMount;
+
+typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;
+
+bool build_fs_mount_list(FsMountList *mounts, Error **errp);
+void free_fs_mount_list(FsMountList *mounts);
+#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */
+
+#if defined(CONFIG_FSFREEZE)
+int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
+                                          strList *mountpoints,
+                                          FsMountList mounts,
+                                          Error **errp);
+int qmp_guest_fsfreeze_do_thaw(Error **errp);
+#endif /* CONFIG_FSFREEZE */
 
 typedef struct GuestFileHandle GuestFileHandle;
 
@@ -29,4 +63,5 @@ GuestFileRead *guest_file_read_unsafe(GuestFileHandle *gfh,
  */
 char *qga_get_host_name(Error **errp);
 
+void ga_wait_child(pid_t pid, int *status, Error **errp);
 #endif
diff --git a/qga/commands-linux.c b/qga/commands-linux.c
new file mode 100644
index 0000000000..214e408fcd
--- /dev/null
+++ b/qga/commands-linux.c
@@ -0,0 +1,286 @@
+/*
+ * QEMU Guest Agent Linux-specific command implementations
+ *
+ * Copyright IBM Corp. 2011
+ *
+ * Authors:
+ *  Michael Roth      <mdroth@linux.vnet.ibm.com>
+ *  Michal Privoznik  <mprivozn@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "commands-common.h"
+#include "cutils.h"
+#include <mntent.h>
+#include <sys/ioctl.h>
+
+#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
+static int dev_major_minor(const char *devpath,
+                           unsigned int *devmajor, unsigned int *devminor)
+{
+    struct stat st;
+
+    *devmajor = 0;
+    *devminor = 0;
+
+    if (stat(devpath, &st) < 0) {
+        slog("failed to stat device file '%s': %s", devpath, strerror(errno));
+        return -1;
+    }
+    if (S_ISDIR(st.st_mode)) {
+        /* It is bind mount */
+        return -2;
+    }
+    if (S_ISBLK(st.st_mode)) {
+        *devmajor = major(st.st_rdev);
+        *devminor = minor(st.st_rdev);
+        return 0;
+    }
+    return -1;
+}
+
+static bool build_fs_mount_list_from_mtab(FsMountList *mounts, Error **errp)
+{
+    struct mntent *ment;
+    FsMount *mount;
+    char const *mtab = "/proc/self/mounts";
+    FILE *fp;
+    unsigned int devmajor, devminor;
+
+    fp = setmntent(mtab, "r");
+    if (!fp) {
+        error_setg(errp, "failed to open mtab file: '%s'", mtab);
+        return false;
+    }
+
+    while ((ment = getmntent(fp))) {
+        /*
+         * An entry which device name doesn't start with a '/' is
+         * either a dummy file system or a network file system.
+         * Add special handling for smbfs and cifs as is done by
+         * coreutils as well.
+         */
+        if ((ment->mnt_fsname[0] != '/') ||
+            (strcmp(ment->mnt_type, "smbfs") == 0) ||
+            (strcmp(ment->mnt_type, "cifs") == 0)) {
+            continue;
+        }
+        if (dev_major_minor(ment->mnt_fsname, &devmajor, &devminor) == -2) {
+            /* Skip bind mounts */
+            continue;
+        }
+
+        mount = g_new0(FsMount, 1);
+        mount->dirname = g_strdup(ment->mnt_dir);
+        mount->devtype = g_strdup(ment->mnt_type);
+        mount->devmajor = devmajor;
+        mount->devminor = devminor;
+
+        QTAILQ_INSERT_TAIL(mounts, mount, next);
+    }
+
+    endmntent(fp);
+    return true;
+}
+
+static void decode_mntname(char *name, int len)
+{
+    int i, j = 0;
+    for (i = 0; i <= len; i++) {
+        if (name[i] != '\\') {
+            name[j++] = name[i];
+        } else if (name[i + 1] == '\\') {
+            name[j++] = '\\';
+            i++;
+        } else if (name[i + 1] >= '0' && name[i + 1] <= '3' &&
+                   name[i + 2] >= '0' && name[i + 2] <= '7' &&
+                   name[i + 3] >= '0' && name[i + 3] <= '7') {
+            name[j++] = (name[i + 1] - '0') * 64 +
+                        (name[i + 2] - '0') * 8 +
+                        (name[i + 3] - '0');
+            i += 3;
+        } else {
+            name[j++] = name[i];
+        }
+    }
+}
+
+/*
+ * Walk the mount table and build a list of local file systems
+ */
+bool build_fs_mount_list(FsMountList *mounts, Error **errp)
+{
+    FsMount *mount;
+    char const *mountinfo = "/proc/self/mountinfo";
+    FILE *fp;
+    char *line = NULL, *dash;
+    size_t n;
+    char check;
+    unsigned int devmajor, devminor;
+    int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;
+
+    fp = fopen(mountinfo, "r");
+    if (!fp) {
+        return build_fs_mount_list_from_mtab(mounts, errp);
+    }
+
+    while (getline(&line, &n, fp) != -1) {
+        ret = sscanf(line, "%*u %*u %u:%u %*s %n%*s%n%c",
+                     &devmajor, &devminor, &dir_s, &dir_e, &check);
+        if (ret < 3) {
+            continue;
+        }
+        dash = strstr(line + dir_e, " - ");
+        if (!dash) {
+            continue;
+        }
+        ret = sscanf(dash, " - %n%*s%n %n%*s%n%c",
+                     &type_s, &type_e, &dev_s, &dev_e, &check);
+        if (ret < 1) {
+            continue;
+        }
+        line[dir_e] = 0;
+        dash[type_e] = 0;
+        dash[dev_e] = 0;
+        decode_mntname(line + dir_s, dir_e - dir_s);
+        decode_mntname(dash + dev_s, dev_e - dev_s);
+        if (devmajor == 0) {
+            /* btrfs reports major number = 0 */
+            if (strcmp("btrfs", dash + type_s) != 0 ||
+                dev_major_minor(dash + dev_s, &devmajor, &devminor) < 0) {
+                continue;
+            }
+        }
+
+        mount = g_new0(FsMount, 1);
+        mount->dirname = g_strdup(line + dir_s);
+        mount->devtype = g_strdup(dash + type_s);
+        mount->devmajor = devmajor;
+        mount->devminor = devminor;
+
+        QTAILQ_INSERT_TAIL(mounts, mount, next);
+    }
+    free(line);
+
+    fclose(fp);
+    return true;
+}
+#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */
+
+#ifdef CONFIG_FSFREEZE
+/*
+ * Walk list of mounted file systems in the guest, and freeze the ones which
+ * are real local file systems.
+ */
+int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
+                                          strList *mountpoints,
+                                          FsMountList mounts,
+                                          Error **errp)
+{
+    struct FsMount *mount;
+    strList *list;
+    int fd, ret, i = 0;
+
+    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
+        /* To issue fsfreeze in the reverse order of mounts, check if the
+         * mount is listed in the list here */
+        if (has_mountpoints) {
+            for (list = mountpoints; list; list = list->next) {
+                if (strcmp(list->value, mount->dirname) == 0) {
+                    break;
+                }
+            }
+            if (!list) {
+                continue;
+            }
+        }
+
+        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
+        if (fd == -1) {
+            error_setg_errno(errp, errno, "failed to open %s", mount->dirname);
+            return -1;
+        }
+
+        /* we try to cull filesystems we know won't work in advance, but other
+         * filesystems may not implement fsfreeze for less obvious reasons.
+         * these will report EOPNOTSUPP. we simply ignore these when tallying
+         * the number of frozen filesystems.
+         * if a filesystem is mounted more than once (aka bind mount) a
+         * consecutive attempt to freeze an already frozen filesystem will
+         * return EBUSY.
+         *
+         * any other error means a failure to freeze a filesystem we
+         * expect to be freezable, so return an error in those cases
+         * and return system to thawed state.
+         */
+        ret = ioctl(fd, FIFREEZE);
+        if (ret == -1) {
+            if (errno != EOPNOTSUPP && errno != EBUSY) {
+                error_setg_errno(errp, errno, "failed to freeze %s",
+                                 mount->dirname);
+                close(fd);
+                return -1;
+            }
+        } else {
+            i++;
+        }
+        close(fd);
+    }
+    return i;
+}
+
+int qmp_guest_fsfreeze_do_thaw(Error **errp)
+{
+    int ret;
+    FsMountList mounts;
+    FsMount *mount;
+    int fd, i = 0, logged;
+    Error *local_err = NULL;
+
+    QTAILQ_INIT(&mounts);
+    if (!build_fs_mount_list(&mounts, &local_err)) {
+        error_propagate(errp, local_err);
+        return -1;
+    }
+
+    QTAILQ_FOREACH(mount, &mounts, next) {
+        logged = false;
+        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
+        if (fd == -1) {
+            continue;
+        }
+        /* we have no way of knowing whether a filesystem was actually unfrozen
+         * as a result of a successful call to FITHAW, only that if an error
+         * was returned the filesystem was *not* unfrozen by that particular
+         * call.
+         *
+         * since multiple preceding FIFREEZEs require multiple calls to FITHAW
+         * to unfreeze, continuing issuing FITHAW until an error is returned,
+         * in which case either the filesystem is in an unfreezable state, or,
+         * more likely, it was thawed previously (and remains so afterward).
+         *
+         * also, since the most recent successful call is the one that did
+         * the actual unfreeze, we can use this to provide an accurate count
+         * of the number of filesystems unfrozen by guest-fsfreeze-thaw, which
+         * may * be useful for determining whether a filesystem was unfrozen
+         * during the freeze/thaw phase by a process other than qemu-ga.
+         */
+        do {
+            ret = ioctl(fd, FITHAW);
+            if (ret == 0 && !logged) {
+                i++;
+                logged = true;
+            }
+        } while (ret == 0);
+        close(fd);
+    }
+
+    free_fs_mount_list(&mounts);
+
+    return i;
+}
+#endif /* CONFIG_FSFREEZE */
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 16d67e9f6d..9574b83c92 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -16,11 +16,9 @@
 #include <sys/utsname.h>
 #include <sys/wait.h>
 #include <dirent.h>
-#include "guest-agent-core.h"
 #include "qga-qapi-commands.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
-#include "qemu/queue.h"
 #include "qemu/host-utils.h"
 #include "qemu/sockets.h"
 #include "qemu/base64.h"
@@ -70,7 +68,7 @@
 #endif
 #endif
 
-static void ga_wait_child(pid_t pid, int *status, Error **errp)
+void ga_wait_child(pid_t pid, int *status, Error **errp)
 {
     pid_t rpid;
 
@@ -629,16 +627,7 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)
 #if defined(__linux__)
 
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
-typedef struct FsMount {
-    char *dirname;
-    char *devtype;
-    unsigned int devmajor, devminor;
-    QTAILQ_ENTRY(FsMount) next;
-} FsMount;
-
-typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;
-
-static void free_fs_mount_list(FsMountList *mounts)
+void free_fs_mount_list(FsMountList *mounts)
 {
      FsMount *mount, *temp;
 
@@ -653,157 +642,6 @@ static void free_fs_mount_list(FsMountList *mounts)
          g_free(mount);
      }
 }
-
-static int dev_major_minor(const char *devpath,
-                           unsigned int *devmajor, unsigned int *devminor)
-{
-    struct stat st;
-
-    *devmajor = 0;
-    *devminor = 0;
-
-    if (stat(devpath, &st) < 0) {
-        slog("failed to stat device file '%s': %s", devpath, strerror(errno));
-        return -1;
-    }
-    if (S_ISDIR(st.st_mode)) {
-        /* It is bind mount */
-        return -2;
-    }
-    if (S_ISBLK(st.st_mode)) {
-        *devmajor = major(st.st_rdev);
-        *devminor = minor(st.st_rdev);
-        return 0;
-    }
-    return -1;
-}
-
-/*
- * Walk the mount table and build a list of local file systems
- */
-static bool build_fs_mount_list_from_mtab(FsMountList *mounts, Error **errp)
-{
-    struct mntent *ment;
-    FsMount *mount;
-    char const *mtab = "/proc/self/mounts";
-    FILE *fp;
-    unsigned int devmajor, devminor;
-
-    fp = setmntent(mtab, "r");
-    if (!fp) {
-        error_setg(errp, "failed to open mtab file: '%s'", mtab);
-        return false;
-    }
-
-    while ((ment = getmntent(fp))) {
-        /*
-         * An entry which device name doesn't start with a '/' is
-         * either a dummy file system or a network file system.
-         * Add special handling for smbfs and cifs as is done by
-         * coreutils as well.
-         */
-        if ((ment->mnt_fsname[0] != '/') ||
-            (strcmp(ment->mnt_type, "smbfs") == 0) ||
-            (strcmp(ment->mnt_type, "cifs") == 0)) {
-            continue;
-        }
-        if (dev_major_minor(ment->mnt_fsname, &devmajor, &devminor) == -2) {
-            /* Skip bind mounts */
-            continue;
-        }
-
-        mount = g_new0(FsMount, 1);
-        mount->dirname = g_strdup(ment->mnt_dir);
-        mount->devtype = g_strdup(ment->mnt_type);
-        mount->devmajor = devmajor;
-        mount->devminor = devminor;
-
-        QTAILQ_INSERT_TAIL(mounts, mount, next);
-    }
-
-    endmntent(fp);
-    return true;
-}
-
-static void decode_mntname(char *name, int len)
-{
-    int i, j = 0;
-    for (i = 0; i <= len; i++) {
-        if (name[i] != '\\') {
-            name[j++] = name[i];
-        } else if (name[i + 1] == '\\') {
-            name[j++] = '\\';
-            i++;
-        } else if (name[i + 1] >= '0' && name[i + 1] <= '3' &&
-                   name[i + 2] >= '0' && name[i + 2] <= '7' &&
-                   name[i + 3] >= '0' && name[i + 3] <= '7') {
-            name[j++] = (name[i + 1] - '0') * 64 +
-                        (name[i + 2] - '0') * 8 +
-                        (name[i + 3] - '0');
-            i += 3;
-        } else {
-            name[j++] = name[i];
-        }
-    }
-}
-
-static bool build_fs_mount_list(FsMountList *mounts, Error **errp)
-{
-    FsMount *mount;
-    char const *mountinfo = "/proc/self/mountinfo";
-    FILE *fp;
-    char *line = NULL, *dash;
-    size_t n;
-    char check;
-    unsigned int devmajor, devminor;
-    int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;
-
-    fp = fopen(mountinfo, "r");
-    if (!fp) {
-        return build_fs_mount_list_from_mtab(mounts, errp);
-    }
-
-    while (getline(&line, &n, fp) != -1) {
-        ret = sscanf(line, "%*u %*u %u:%u %*s %n%*s%n%c",
-                     &devmajor, &devminor, &dir_s, &dir_e, &check);
-        if (ret < 3) {
-            continue;
-        }
-        dash = strstr(line + dir_e, " - ");
-        if (!dash) {
-            continue;
-        }
-        ret = sscanf(dash, " - %n%*s%n %n%*s%n%c",
-                     &type_s, &type_e, &dev_s, &dev_e, &check);
-        if (ret < 1) {
-            continue;
-        }
-        line[dir_e] = 0;
-        dash[type_e] = 0;
-        dash[dev_e] = 0;
-        decode_mntname(line + dir_s, dir_e - dir_s);
-        decode_mntname(dash + dev_s, dev_e - dev_s);
-        if (devmajor == 0) {
-            /* btrfs reports major number = 0 */
-            if (strcmp("btrfs", dash + type_s) != 0 ||
-                dev_major_minor(dash + dev_s, &devmajor, &devminor) < 0) {
-                continue;
-            }
-        }
-
-        mount = g_new0(FsMount, 1);
-        mount->dirname = g_strdup(line + dir_s);
-        mount->devtype = g_strdup(dash + type_s);
-        mount->devmajor = devmajor;
-        mount->devminor = devminor;
-
-        QTAILQ_INSERT_TAIL(mounts, mount, next);
-    }
-    free(line);
-
-    fclose(fp);
-    return true;
-}
 #endif
 
 #if defined(CONFIG_FSFREEZE)
@@ -1708,20 +1546,13 @@ int64_t qmp_guest_fsfreeze_freeze(Error **errp)
     return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
 }
 
-/*
- * Walk list of mounted file systems in the guest, and freeze the ones which
- * are real local file systems.
- */
 int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
                                        strList *mountpoints,
                                        Error **errp)
 {
-    int ret = 0, i = 0;
-    strList *list;
+    int ret;
     FsMountList mounts;
-    struct FsMount *mount;
     Error *local_err = NULL;
-    int fd;
 
     slog("guest-fsfreeze called");
 
@@ -1740,122 +1571,34 @@ int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
     /* cannot risk guest agent blocking itself on a write in this state */
     ga_set_frozen(ga_state);
 
-    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
-        /* To issue fsfreeze in the reverse order of mounts, check if the
-         * mount is listed in the list here */
-        if (has_mountpoints) {
-            for (list = mountpoints; list; list = list->next) {
-                if (strcmp(list->value, mount->dirname) == 0) {
-                    break;
-                }
-            }
-            if (!list) {
-                continue;
-            }
-        }
-
-        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
-        if (fd == -1) {
-            error_setg_errno(errp, errno, "failed to open %s", mount->dirname);
-            goto error;
-        }
-
-        /* we try to cull filesystems we know won't work in advance, but other
-         * filesystems may not implement fsfreeze for less obvious reasons.
-         * these will report EOPNOTSUPP. we simply ignore these when tallying
-         * the number of frozen filesystems.
-         * if a filesystem is mounted more than once (aka bind mount) a
-         * consecutive attempt to freeze an already frozen filesystem will
-         * return EBUSY.
-         *
-         * any other error means a failure to freeze a filesystem we
-         * expect to be freezable, so return an error in those cases
-         * and return system to thawed state.
-         */
-        ret = ioctl(fd, FIFREEZE);
-        if (ret == -1) {
-            if (errno != EOPNOTSUPP && errno != EBUSY) {
-                error_setg_errno(errp, errno, "failed to freeze %s",
-                                 mount->dirname);
-                close(fd);
-                goto error;
-            }
-        } else {
-            i++;
-        }
-        close(fd);
-    }
+    ret = qmp_guest_fsfreeze_do_freeze_list(has_mountpoints, mountpoints,
+                                            mounts, errp);
 
     free_fs_mount_list(&mounts);
     /* We may not issue any FIFREEZE here.
      * Just unset ga_state here and ready for the next call.
      */
-    if (i == 0) {
+    if (ret == 0) {
         ga_unset_frozen(ga_state);
+    } else if (ret < 0) {
+        qmp_guest_fsfreeze_thaw(NULL);
     }
-    return i;
-
-error:
-    free_fs_mount_list(&mounts);
-    qmp_guest_fsfreeze_thaw(NULL);
-    return 0;
+    return ret;
 }
 
-/*
- * Walk list of frozen file systems in the guest, and thaw them.
- */
 int64_t qmp_guest_fsfreeze_thaw(Error **errp)
 {
     int ret;
-    FsMountList mounts;
-    FsMount *mount;
-    int fd, i = 0, logged;
-    Error *local_err = NULL;
 
-    QTAILQ_INIT(&mounts);
-    if (!build_fs_mount_list(&mounts, &local_err)) {
-        error_propagate(errp, local_err);
-        return 0;
+    ret = qmp_guest_fsfreeze_do_thaw(errp);
+    if (ret >= 0) {
+        ga_unset_frozen(ga_state);
+        execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
+    } else {
+        ret = 0;
     }
 
-    QTAILQ_FOREACH(mount, &mounts, next) {
-        logged = false;
-        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
-        if (fd == -1) {
-            continue;
-        }
-        /* we have no way of knowing whether a filesystem was actually unfrozen
-         * as a result of a successful call to FITHAW, only that if an error
-         * was returned the filesystem was *not* unfrozen by that particular
-         * call.
-         *
-         * since multiple preceding FIFREEZEs require multiple calls to FITHAW
-         * to unfreeze, continuing issuing FITHAW until an error is returned,
-         * in which case either the filesystem is in an unfreezable state, or,
-         * more likely, it was thawed previously (and remains so afterward).
-         *
-         * also, since the most recent successful call is the one that did
-         * the actual unfreeze, we can use this to provide an accurate count
-         * of the number of filesystems unfrozen by guest-fsfreeze-thaw, which
-         * may * be useful for determining whether a filesystem was unfrozen
-         * during the freeze/thaw phase by a process other than qemu-ga.
-         */
-        do {
-            ret = ioctl(fd, FITHAW);
-            if (ret == 0 && !logged) {
-                i++;
-                logged = true;
-            }
-        } while (ret == 0);
-        close(fd);
-    }
-
-    ga_unset_frozen(ga_state);
-    free_fs_mount_list(&mounts);
-
-    execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
-
-    return i;
+    return ret;
 }
 
 static void guest_fsfreeze_cleanup(void)
diff --git a/qga/meson.build b/qga/meson.build
index 65c1e93846..409f49a000 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -72,6 +72,9 @@ qga_ss.add(when: 'CONFIG_POSIX', if_true: files(
   'commands-posix.c',
   'commands-posix-ssh.c',
 ))
+qga_ss.add(when: 'CONFIG_LINUX', if_true: files(
+  'commands-linux.c',
+))
 qga_ss.add(when: 'CONFIG_WIN32', if_true: files(
   'channel-win32.c',
   'commands-win32.c',
-- 
2.34.1


