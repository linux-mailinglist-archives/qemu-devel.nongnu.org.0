Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8A462A192
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 19:52:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov129-0004bt-Dc; Tue, 15 Nov 2022 13:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ov11j-0004Sr-0K
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 13:51:19 -0500
Received: from mail-db5eur02on2106.outbound.protection.outlook.com
 ([40.107.249.106] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ov11g-0000j5-Jz
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 13:51:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXC28cPUQU8uR1X0/OdpuAWfBvJXo/9fQNrax+hP4SXeI+FpQ6kSt7ZZT+Afr5UluUdLokiOGbzP3TAB3Sab2tvww2WVDEsNA87Nds8pZ+N1QM65X8QwXGbfX0vTCvEQBhvsLbcC90MU+A4a4mWwgPOTCkixURdajfgs5qDIMVkekZEwgoEZ44LTyQOtWE7dvmfNRqyZlK8rqkq9KcTqVdBMXM8UIy4uUxP+aJy70HUAXZDbJSWFQgWvnE+i0cZM8blfLh0ww68AJ4tBr7acmasNBddtCMdh14I7jibDutAboyK8dtIspHQuSfry85+mrqzycEmsM0sBsn2+pB8Hog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BX0P4Xob4TfSYXsIhi/vDmTban9yoBDoVQaxYd+BX3Q=;
 b=YtSKlDsLB/H9sZHzz3Bke0Kn/agIAe+2SU+zfLnauQ7i54uhpDzTUhSbTSTEQGSAxD0UDhKRvfjXNIOTHLUaf5r10eC9aLnyFYqdbLnaQSR8k4QUjPVZBBQaS5SQgawkdaYG6jGrypEes/663b6rLaolZzlfh08ez/1eKvo/x6XKS6vw3n2dCJfrZ1lQdCLU6VFnPr/61NJWbV9M8juR5gF63qh+s6GkEZRwQZ0YoncDlnE9H1eBDIsaNAHHUcAnZobHEa7LZ8MymJX8JQYYxrUSyvRJzEBVe0Fed5DOuCy/MxeSo29r+nQ1Qder799x1gv9WQIWYxF4xpt3o+KzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BX0P4Xob4TfSYXsIhi/vDmTban9yoBDoVQaxYd+BX3Q=;
 b=C1+R90dV2/KHO2XBnVka91p4Cn4fxI1hAKeSX8xF2yJgcPzH6JZUd/TWjdXv3fRuHfnnyN75PvUy/5eqop0PWWIIPC/BqIRH+mqQXODLY6r+DzdDjMCGRNEPyHZQstuVa6QvFtlKTP1bq+7hdG+V2hVo+puHlLxznrk5FGq5RnRVXIaYnP03iWArWyIGnRdsYSdkUd8gOqHut4vwooV8Jb8yoKrOX+jzUcYYSfkaOMWv9P1hQa7xzbQWu1MpKphrsFFINABEr0PyciqEX8Z+z6wIyDByxB4DajcTMmQwelW47kQTWDM5XG8bhjIsK15HdL3yiafrN46yPPTYUqRzdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6607.eurprd08.prod.outlook.com (2603:10a6:102:152::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Tue, 15 Nov
 2022 18:46:09 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::fa9b:7e41:680b:aeb5]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::fa9b:7e41:680b:aeb5%8]) with mapi id 15.20.5834.007; Tue, 15 Nov 2022
 18:46:09 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH 1/2] qga: Move FS TRIM code to commands-linux.c
Date: Tue, 15 Nov 2022 19:45:59 +0100
Message-Id: <20221115184600.747961-2-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7d651923-b9db-4bb8-37fb-08dac739a94e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UbSpL4OiGaToXjBtgBcBl7TWjv3bD54pRO/DPh8B8te3oemtYbugpfG7Qklsd/oGOsaZgHxTNGPMiJhmTs/YjJjwOXOm0hNY84hrEz69BeA+4EGG81evF4gds7N+QB4mNdsMsSBWXhd0atG7jCCqd+8H9EjVAqnZdxjlvyFWOj57Ud6d8DIoDdKBqfMsKLUHYIfdWMT4BoevEGCBiEs3jjl6inP4GI4Hqjz2zc5tD0Utlc+d3gLNxm74VYyhjr7ya9ssBsbAer3Ez9MjPc1dMFD8ahA4oBHTGTCT4gCinflj65sqi+BYQ3auDK47d+6h9g09IDoC2uCmQ+LTulyd9uPjjs1QyDQ5NKyx4EUIhdhfcXShA/8DwEerNHJSV/lKjG9FbhezB/UGLwoN9JT5HeTsB7kms1Y+ASGavFvRNOFROkMyOXnesbnzYvfRCvP7WdeZiUpD74qO30SEsmAe8oPXhRYYF4e+rAOBZrf3D4ECrxGk0Jo4c5C05PUUH/wfwoEu2OEqqkaR5WPkn8KrJa94my0hq0b1bRIAWc8/BxvDf6sBEFQQho2zMGtQMRgabXvYf5tmHDYkHorN5Uv5dDtDGGqBVpQRWRX+DLbd8tPRNbaIY+jexix66teXNpi5oGQ0qNzhDOh4+co5RXR+mAVnftgqlG7IgasJQm43NByWZLCygLNmQVyZ//56T/JV+PnJxx7ZxZTsUHFQYWrvvgcyF55bwKfeXV9JARVLtuhfBRVjW3T8fbho/UYaQbZ6QmKTgK2YwsCl6icWa2PePA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39850400004)(346002)(366004)(396003)(451199015)(36756003)(38350700002)(2906002)(41300700001)(83380400001)(44832011)(86362001)(6916009)(478600001)(1076003)(2616005)(4326008)(316002)(6486002)(66946007)(186003)(8936002)(5660300002)(26005)(6512007)(38100700002)(8676002)(66556008)(52116002)(6666004)(66476007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IZe7Z59x1HuD9VQCJLeZGcKExMYh4drvb9yr2YgNlONmsVejvnL4VXyA1tX0?=
 =?us-ascii?Q?obZDVyLrkw1OcrRkPuAZbrqkuwETyhAb9ULBO0ibl5huDBfnSR0zeFOT3Vtc?=
 =?us-ascii?Q?hes1NPAAQvvolQfGSr4pnOZeBVYkqdB3F81o0qbysr2Pe6W3+V140uzhC5rj?=
 =?us-ascii?Q?J1YEnE916IID7XodY02lzT6Kk++UTcQizEz/x+rQy/EMQrkcc2aXnKT3Rf3W?=
 =?us-ascii?Q?94IU1K/3Igh9ys0yBOsBCkopNWLcnRiksV66hpx8lrnqdjrDwyIf9lJyyvIO?=
 =?us-ascii?Q?uuIGZ8E3QEFX7gujGCzV3Sl/U2I5IGt4wIEKYsiKp2g+zE1+YXHz5UXPi9mk?=
 =?us-ascii?Q?PA5eMnV+t2dQdJbadvnF3CxkQaV+Ilu5xEHkcaDeqwS229faI0whUGwAHUch?=
 =?us-ascii?Q?eokJKBIEA7A0EsdzKQd2/FutIr2IAFY8zGutVDzAW5bgdvCOyt74BkKX8g/9?=
 =?us-ascii?Q?GFFGtyhX5qdTQVXf+NBCxdyjmI9VuYZvwsf9TF0aJNjTKfSQYyZR6zUCu8XA?=
 =?us-ascii?Q?agjz3E9YOjWrVuHFg55MsbLMOq5vYoQ4zP1iq+GwIrSo28AQaM/s9fK81FPD?=
 =?us-ascii?Q?yP/+PwvV8yAbsBSzy0UdhEh6DgXLWscgdmXgqesnBpmTD7iebBsBnq300kr6?=
 =?us-ascii?Q?RRnOBgp7VXuRbjcG3EM/6YNKBq+pHrD4CWgumSb/od0csUS7Qr40PSO9x0dU?=
 =?us-ascii?Q?Rm63kr6mfcLSQEQQOBkCCdlWWYSgL59+BMT91Yj1tMD97O7ATl7R9pdXTkPX?=
 =?us-ascii?Q?tOahYizzvodWH05/CgI9NdjjCvY0Xfqv0O6cyv7rzZohVa2k4Pi+vTyp/Qvq?=
 =?us-ascii?Q?7Sw6koX66LYolhn3ibnm18uiVNj7GusJ3zlWeurxNgEoCoCcXTfPOL3GTLZi?=
 =?us-ascii?Q?UtuHFbYa7pv3g5UZaxzhZEQRVLSmQJnNqocJNpOkj9mdmceFaToGrzeawyJm?=
 =?us-ascii?Q?C4d+x2lvVeUSl3elnVH/+dAfVxq2NgXKQf7/wMyKxfTU3n2eZfchv/fV7uKX?=
 =?us-ascii?Q?M4K40h1lmwRuZeAWXqFXZl2Ki9a5xTpRPsVo86dtD0/+SJzKs8ZbWtayh+im?=
 =?us-ascii?Q?kuJPoZ0lnLGtUJ/n76ALRC7nvY4DHJ34vj6vt/7H0KKY1ap+YV/6znrduzxs?=
 =?us-ascii?Q?MKtV1kOW0M+Vxv8JFqVadlX+9hYP2zWIR3RWo+ypNz6PiHsn/daKH93GWLdS?=
 =?us-ascii?Q?PrC3ZSLQaZGG0IEJCd1lIOsxqB/k7M68hRg/H2nxNOL4THqVNAIx/DeFBUw9?=
 =?us-ascii?Q?GPLCLGdtIyIx6EO1gIzXY1nK5QzRiVrSSBACNlJV48VHYjxZWct2+vhJ/W9S?=
 =?us-ascii?Q?Kuk7FnmPMDpTI2LZickj1PmOQdm8ypvip/5RSCmmsvIbq5GiztFqwvJrnFjr?=
 =?us-ascii?Q?hYglE7lyKwwE8KsO/e4vKFzCvUl1hq4bdnohd18twCMQctiJ12x1NbjXq4ke?=
 =?us-ascii?Q?KR6z8hUHRnFmIX6G8zZdSg+UYOmnHz9wdaGFifm79SdVJpt35FOregFYO+d2?=
 =?us-ascii?Q?JbugNjxstWdimDA9x0tWmcxlkF2MyRwoXoHV7vqu3bw36x15mCxaGXoQxdEz?=
 =?us-ascii?Q?K8H+KPJ7TdjxPZpzcrENZbGp9yk8inMjEjOOa/fOBfvaAdAa249hy8cVkkdc?=
 =?us-ascii?Q?Fw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d651923-b9db-4bb8-37fb-08dac739a94e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 18:46:09.5603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JPwXAQUccUt90r3L0e35zefS5+JSLjkKutsJaoVBCw5L7h9FwbHmp2Dk7200YsLl5IXr6y+4QYkfpDkhg8aTqGsgzqJJQ4sT65jj5IGbjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6607
Received-SPF: pass client-ip=40.107.249.106;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
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

In the next patch ZFS TRIM support for FreeBSD will be added. Move
Linux-specific TRIM code to commands-linux.c file.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-linux.c | 73 ++++++++++++++++++++++++++++++++++++++++++++
 qga/commands-posix.c | 72 -------------------------------------------
 2 files changed, 73 insertions(+), 72 deletions(-)

diff --git a/qga/commands-linux.c b/qga/commands-linux.c
index 214e408fcd..fb01114153 100644
--- a/qga/commands-linux.c
+++ b/qga/commands-linux.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qga-qapi-commands.h"
 #include "commands-common.h"
 #include "cutils.h"
 #include <mntent.h>
@@ -284,3 +285,75 @@ int qmp_guest_fsfreeze_do_thaw(Error **errp)
     return i;
 }
 #endif /* CONFIG_FSFREEZE */
+
+#if defined(CONFIG_FSTRIM)
+/*
+ * Walk list of mounted file systems in the guest, and trim them.
+ */
+GuestFilesystemTrimResponse *
+qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
+{
+    GuestFilesystemTrimResponse *response;
+    GuestFilesystemTrimResult *result;
+    int ret = 0;
+    FsMountList mounts;
+    struct FsMount *mount;
+    int fd;
+    struct fstrim_range r;
+
+    slog("guest-fstrim called");
+
+    QTAILQ_INIT(&mounts);
+    if (!build_fs_mount_list(&mounts, errp)) {
+        return NULL;
+    }
+
+    response = g_malloc0(sizeof(*response));
+
+    QTAILQ_FOREACH(mount, &mounts, next) {
+        result = g_malloc0(sizeof(*result));
+        result->path = g_strdup(mount->dirname);
+
+        QAPI_LIST_PREPEND(response->paths, result);
+
+        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
+        if (fd == -1) {
+            result->error = g_strdup_printf("failed to open: %s",
+                                            strerror(errno));
+            result->has_error = true;
+            continue;
+        }
+
+        /* We try to cull filesystems we know won't work in advance, but other
+         * filesystems may not implement fstrim for less obvious reasons.
+         * These will report EOPNOTSUPP; while in some other cases ENOTTY
+         * will be reported (e.g. CD-ROMs).
+         * Any other error means an unexpected error.
+         */
+        r.start = 0;
+        r.len = -1;
+        r.minlen = has_minimum ? minimum : 0;
+        ret = ioctl(fd, FITRIM, &r);
+        if (ret == -1) {
+            result->has_error = true;
+            if (errno == ENOTTY || errno == EOPNOTSUPP) {
+                result->error = g_strdup("trim not supported");
+            } else {
+                result->error = g_strdup_printf("failed to trim: %s",
+                                                strerror(errno));
+            }
+            close(fd);
+            continue;
+        }
+
+        result->has_minimum = true;
+        result->minimum = r.minlen;
+        result->has_trimmed = true;
+        result->trimmed = r.len;
+        close(fd);
+    }
+
+    free_fs_mount_list(&mounts);
+    return response;
+}
+#endif /* CONFIG_FSTRIM */
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 32493d6383..b2a6d8b227 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1607,78 +1607,6 @@ GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
 }
 #endif /* CONFIG_FSFREEZE */
 
-#if defined(CONFIG_FSTRIM)
-/*
- * Walk list of mounted file systems in the guest, and trim them.
- */
-GuestFilesystemTrimResponse *
-qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
-{
-    GuestFilesystemTrimResponse *response;
-    GuestFilesystemTrimResult *result;
-    int ret = 0;
-    FsMountList mounts;
-    struct FsMount *mount;
-    int fd;
-    struct fstrim_range r;
-
-    slog("guest-fstrim called");
-
-    QTAILQ_INIT(&mounts);
-    if (!build_fs_mount_list(&mounts, errp)) {
-        return NULL;
-    }
-
-    response = g_malloc0(sizeof(*response));
-
-    QTAILQ_FOREACH(mount, &mounts, next) {
-        result = g_malloc0(sizeof(*result));
-        result->path = g_strdup(mount->dirname);
-
-        QAPI_LIST_PREPEND(response->paths, result);
-
-        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
-        if (fd == -1) {
-            result->error = g_strdup_printf("failed to open: %s",
-                                            strerror(errno));
-            result->has_error = true;
-            continue;
-        }
-
-        /* We try to cull filesystems we know won't work in advance, but other
-         * filesystems may not implement fstrim for less obvious reasons.
-         * These will report EOPNOTSUPP; while in some other cases ENOTTY
-         * will be reported (e.g. CD-ROMs).
-         * Any other error means an unexpected error.
-         */
-        r.start = 0;
-        r.len = -1;
-        r.minlen = has_minimum ? minimum : 0;
-        ret = ioctl(fd, FITRIM, &r);
-        if (ret == -1) {
-            result->has_error = true;
-            if (errno == ENOTTY || errno == EOPNOTSUPP) {
-                result->error = g_strdup("trim not supported");
-            } else {
-                result->error = g_strdup_printf("failed to trim: %s",
-                                                strerror(errno));
-            }
-            close(fd);
-            continue;
-        }
-
-        result->has_minimum = true;
-        result->minimum = r.minlen;
-        result->has_trimmed = true;
-        result->trimmed = r.len;
-        close(fd);
-    }
-
-    free_fs_mount_list(&mounts);
-    return response;
-}
-#endif /* CONFIG_FSTRIM */
-
 
 #define LINUX_SYS_STATE_FILE "/sys/power/state"
 #define SUSPEND_SUPPORTED 0
-- 
2.34.1


