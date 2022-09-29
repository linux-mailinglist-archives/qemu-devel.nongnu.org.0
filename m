Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5355EF032
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:18:47 +0200 (CEST)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odoko-0003YB-Ay
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoMQ-0005N7-BD
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:53:39 -0400
Received: from mail-eopbgr60106.outbound.protection.outlook.com
 ([40.107.6.106]:26178 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoMN-0000p0-W6
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:53:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt2Xt4GUY4u8inODNHwI5nYV4jUY6m3FUUL9O+SZ5f9I+d2fzx+u3mnuJBqNaeETWbUgxj+7DFgaKuiw24G9iqNKfsQJHh5yZi+71EWakLz0eG0NUGBI/xc2GtUWH1qLAbF3n7ddZhL0ujEOLVN4okfhC0f38iXVrjesM1+aBBL6Ond7SUsLWir/udcMlzALTIQaR0PtGKxASe3T13V6FUsyEqF0Od8gz0HalRRYu1sM8L7HtQREIAJBColnIMADvYoqixU+o9pYqpR/wMUCTWMHUYrdxG3OQMtVWjQk2IiSBmOVRMUxY6YERnj0USjZe+S02YuS8nG89mckHz75RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gV04v505/VaveTt2QFQG0nOmZ5puqbO6INppFCEbxXI=;
 b=GV5xu/EPR45jW4Hgddq9of5Tgx3W7yX9Lgj2nrv3hMKrYAEPQho7pzns7lZQUh3NI3s9IKyT1nR0evrHLM8UgqhzEOh91p8yfX5IEn00tG1hNsJdLnwoPTldAmyEpZ/HN5nPm0DRjJV3Tb4En2veHoxecuqnKGA5IJ6eQSFE/TXnuoGiMzu4/vArPaX9+HHbCQOPxTAEv9U4Shwt5MWn3vlimUTWyS4YCqHd9oiR/I0XDFm7oGUudHtVozH7Q0Qx184Kc1bGVnCF+7DRk6q2J201jB2gcuwd355V0j0PkG6x+wQdlAXWqGyRpSe/qhWv4qj9oJ7kVNF5bA8uf2nTOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gV04v505/VaveTt2QFQG0nOmZ5puqbO6INppFCEbxXI=;
 b=Z1cZaWkY6UtGX9qdbuJshIiX9qvmbLXkaEKF6933XUpANkuHDyWE9AdcglPsShfcSJrtclFPtI9Nv49jd8avyCKha2LUR75ACblVToP7HPg885uTwR3drHhw1lIpW1KdoYeriAsoBwUnGIEGE2Nd7kc2saV/TPZCbTdPmHabVVMMiKOpqZVHb4Y6lwZM1yLrlLdgkpuPKNKRkS72XrHd0qoUwI+ImwReAoDPVeMdSzv6qXgkFVViNLIa+OeDg9T56tk0QzIPgayfSF8D7K5nSZ53qUtchRjXV/DYlPyn8nm4L+WDinM6/GzB7rhydlB6vnMgcGG8KHePif3rUdG3dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9509.eurprd08.prod.outlook.com (2603:10a6:10:44f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 29 Sep
 2022 07:52:48 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 07:52:48 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com,
	michael.roth@amd.com,
	kkostiuk@redhat.com
Subject: [PATCH 3/7] qga: Add UFS freeze/thaw support for FreeBSD
Date: Thu, 29 Sep 2022 09:52:35 +0200
Message-Id: <20220929075239.1675374-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0039.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: c7037c03-6799-4da7-a3e6-08daa1ef99e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HlUt2FC7wRqOURFFOtrtGCwjn0vHXgvyarHf5mA2Q6Agf2QYmbqpzRBhD0R2XCn3gFLiGAUZ9CZPvL/dxN4AVeUbsZVNEHTec8JBwCy1kG0luBESu48TvR8169JoOzmGvC++nh5+txlzZ6qB4kdjyugL3VmU5Ov6HdU1NMUB873I5FjsQRDCnEarbfXEo+2UCNRO8ZwTboB9I5+UzN0wmRQnAe5dynXgT5gTkA57p/th8gAHhDG/xEDmxVQTkEdC22AylrHFEzT4JyTPIpa0qAG2yDwBjlMqrYg0/o5UsXFSaNg1jxSQnu5ObCz9/1OjVEDj5Kjic3OXDTTzGDEJ1OoP2IQnJNnS9YmvtNqq6cD3/z/YiQmUKi8dbjIxr9E1iSxUf0ZRNWr+spqswLxwt9IKAC78JqTHnjzJGJQWNHUOfvoKI1LeFY5rWieUJr98f31XG2yd/3ckj+g8LR77EPlxcVkMGhUokaRF6gtxikPFTLNX0lwJYn3+QhufoGaKWiB1gFpTj3kbYyCDnQtAcUEfN6EQ6sV4bfUDPk+9CPLdx4BsjRJr2CRqu9FqqXsN07i2cJrn3vdoaLMlv7rxKIuWw2HAIl2KdUFmrMu6hrBsAD4/e2S3umMzdDxm5WMLEMlKIvijRhGkfn58XIEktATGMw5/KMOMrs1iOvkfebgRAi/O2rlsrB9bwtd5J5JYvx4+Odm20/lWEf/51B9p8YvKEiuVwnF3AP3XszfM3iBDTuz5Hi71bCP9SXxh5E1ZqFfGSZsaE5LVdn8nr/jQ7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39850400004)(376002)(396003)(346002)(451199015)(2616005)(38100700002)(38350700002)(86362001)(6486002)(478600001)(8936002)(83380400001)(5660300002)(6506007)(26005)(6512007)(316002)(6666004)(2906002)(30864003)(6916009)(41300700001)(8676002)(36756003)(52116002)(44832011)(186003)(66476007)(66556008)(66946007)(4326008)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?38u2S/5K572VLIYKYE3HB8lbptsc+m0yaCD0Iel0JVTHb603DtLnfYTVQQ7e?=
 =?us-ascii?Q?6Cvq7fjGbA2bvW5HnoYIg9gGP6RkAD7vngvZ3hYNDJV5dz4EcAh4gU+18iPC?=
 =?us-ascii?Q?lpjFeAJ4ko23RTwfTDbhN9htFFMROboH0RnXpM2dgLUyLwREMlFrPeLe/Tm9?=
 =?us-ascii?Q?Zjs+0dNrmZj9nkelmdE8T5igvMrQVhCY3RPCpINo1Id9LCV1vwL+XAdEBKpa?=
 =?us-ascii?Q?DXo+EW9nn9YAXpTfp4nY5/p6pM08IavgRRfexa8wAhHDx75FbNKQrBYkFbr4?=
 =?us-ascii?Q?kBfRGrIM1veGhUi2d4KwBa3w4Iuk/yHtrHa7NKxOCejwPBwOiOnhMw24mbiJ?=
 =?us-ascii?Q?w8eaZs5H+6q2UYQxh5AUo+s18UfcWCakpgXqtv66kzXx9hfz0SkLH3mXrZNc?=
 =?us-ascii?Q?OtB0fotOwtWLo7q0tu2klQ9xWvf4i5twVM4t6xsa96l/0HkAWEBg6vBr8yJ5?=
 =?us-ascii?Q?nVDjBagi1L4R09HuoHcjWtQy8u3+LGs5O1y9AyUQsFZrB7086xCdDwN++0oV?=
 =?us-ascii?Q?Z2zphXPtRKF97JsvE0C8TQYwz82IF3Q081HmKyWGPl5TXQ3KUd4oy0tjmCmK?=
 =?us-ascii?Q?o4Wf9vRLB910cfDNkBjn/9+ubAh9lfObSTDMi7nEaUWerwdmXRU/pxqyo3wK?=
 =?us-ascii?Q?IMVwVcxJgDRSfXpipl+YTnQEWBG2t9IZscvZAXUhGD9YXMBISHwEchaE6tbd?=
 =?us-ascii?Q?d898BURlqdHIuv3pVsoWF8pJDO9Du0WEJwqFn/igjjFb4jeykx6BbCukuF4Z?=
 =?us-ascii?Q?Qzy/Yu9MHp5tboyV1Kpr6J0QMn1glwcGZdMQRw/AlI/KkccM2qFQSoc2B9j+?=
 =?us-ascii?Q?acQqoKaltk4fX5NxhpUAX/NYU+Z4U5wbmtRlm9NNOK6PmCY41C5IkFHMUz0v?=
 =?us-ascii?Q?9+XrFncC3uH/uVM2LDd/3bVCcOdGg6m5h3IEW52tVmGp9SHZSGuCEi74gYdg?=
 =?us-ascii?Q?Fb1mmbT9VCPJ4T0I6EY4o47qJ208UNKEvX/FAek9MjVnWl0uQr0DdU0wFzd1?=
 =?us-ascii?Q?5nlgN5eWFiJGTqXsjRDn1wTwfqu19wY/+C1has75G0TkxjtAME+eqyNQrOK8?=
 =?us-ascii?Q?zPD89AJM5sEPzWNdt6k0gj5LTXWdMLc/exTae9036k4+KH60DlWnQVxw/sm0?=
 =?us-ascii?Q?ru3nBiWpjV9US57wd8Pd7WVmruY40CtLZZL3E2yI37JRpO0cVIkihocyziAY?=
 =?us-ascii?Q?gPOoDTGmAlo8ookOnFego1G4dfGRDDbA0YIJTEInF7RBSYcVSmUvKUJjCw2v?=
 =?us-ascii?Q?5QURhuyP7mNWa4daoI9laGYQCj3q2Ahr2NvGAgHFOfpR776qWRlx4OGR2BYd?=
 =?us-ascii?Q?RcTI30maqT5BEQMDzFpXKbV+RE8+Lztm6iDgsdrshofPLj+GntB+ZnYza1i9?=
 =?us-ascii?Q?FGAn3bNP6XbDMb1knieEYkgBxp9GAM7Q+h6rt7jud0+YgMCR2gZHfVVV4kF5?=
 =?us-ascii?Q?0I5jGX2hamr1sFsMOtXMoEo4OcmJl/nKaMHgKEnNYUF/KcrZ18CAZuQsc6S1?=
 =?us-ascii?Q?N9neKGkskBigFyisW6HA/3hu4OtMgLJ5lIZMU0fuedAQYFebYgTFHOFpLzXj?=
 =?us-ascii?Q?sVrZLGO5j+griB506VmwrMGIhSOW3Yi3NEX2Tf+dbh8EslyhB2yCJegzi2Na?=
 =?us-ascii?Q?nEovMEMMMqnOp2r1Jwq4IxA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7037c03-6799-4da7-a3e6-08daa1ef99e1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:52:47.9022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKKKIRpGw7yAqCys00hIOxp1M/VmhbB4qXDSBfSRTobNOH47UpQTW1JT0XLbuLeHPULitnLE9+kZ+wdGhKsf/f4/ZzpdOfUbnNOOsIZjxGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9509
Received-SPF: pass client-ip=40.107.6.106;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

UFS supports FS freezing through ioctl UFSSUSPEND on /dev/ufssuspend.
Frozen FS can be thawed by closing /dev/ufssuspend file descriptior.

Use getmntinfo to get a list of mounted FS.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-bsd.c    | 169 +++++++++++++++++++++++
 qga/commands-common.h |  11 ++
 qga/commands-posix.c  | 308 ++++++++++++++++++++----------------------
 qga/main.c            |   7 +-
 qga/meson.build       |   3 +
 5 files changed, 334 insertions(+), 164 deletions(-)
 create mode 100644 qga/commands-bsd.c

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
new file mode 100644
index 0000000000..ca06692179
--- /dev/null
+++ b/qga/commands-bsd.c
@@ -0,0 +1,169 @@
+/*
+ * QEMU Guest Agent BSD-specific command implementations
+ *
+ * Copyright (c) Virtuozzo International GmbH.
+ *
+ * Authors:
+ *  Alexander Ivanov  <alexander.ivanov@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qga-qapi-commands.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/error.h"
+#include "qemu/queue.h"
+#include "commands-common.h"
+#include <sys/ioctl.h>
+#include <sys/param.h>
+#include <sys/ucred.h>
+#include <sys/mount.h>
+#include <paths.h>
+
+#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
+bool build_fs_mount_list(FsMountList *mounts, Error **errp)
+{
+    FsMount *mount;
+    struct statfs *mntbuf, *mntp;
+    struct stat statbuf;
+    int i, count, ret;
+
+    count = getmntinfo(&mntbuf, MNT_NOWAIT);
+    if (count == 0) {
+        error_setg_errno(errp, errno, "getmntinfo failed");
+        return false;
+    }
+
+    for (i = 0; i < count; i++) {
+        mntp = &mntbuf[i];
+        ret = stat(mntp->f_mntonname, &statbuf);
+        if (ret != 0) {
+            error_setg_errno(errp, errno, "stat failed on %s",
+                             mntp->f_mntonname);
+            return false;
+        }
+
+        mount = g_new0(FsMount, 1);
+
+        mount->dirname = g_strdup(mntp->f_mntonname);
+        mount->devtype = g_strdup(mntp->f_fstypename);
+        mount->devmajor = major(mount->dev);
+        mount->devminor = minor(mount->dev);
+        mount->fsid = mntp->f_fsid;
+        mount->dev = statbuf.st_dev;
+
+        QTAILQ_INSERT_TAIL(mounts, mount, next);
+    }
+    return true;
+}
+#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */
+
+#if defined(CONFIG_FSFREEZE)
+static int ufssuspend_fd = -1;
+static int ufssuspend_cnt;
+
+int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
+                                          strList *mountpoints,
+                                          FsMountList mounts,
+                                          Error **errp)
+{
+    int ret;
+    strList *list;
+    struct FsMount *mount;
+
+    if (ufssuspend_fd != -1) {
+        error_setg(errp, "filesystems have already frozen");
+        return -1;
+    }
+
+    ufssuspend_cnt = 0;
+    ufssuspend_fd = qemu_open(_PATH_UFSSUSPEND, O_RDWR, errp);
+    if (ufssuspend_fd == -1) {
+        return -1;
+    }
+
+    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
+        /*
+         * To issue fsfreeze in the reverse order of mounts, check if the
+         * mount is listed in the list here
+         */
+        if (has_mountpoints) {
+            for (list = mountpoints; list; list = list->next) {
+                if (g_str_equal(list->value, mount->dirname)) {
+                    break;
+                }
+            }
+            if (!list) {
+                continue;
+            }
+        }
+
+        /* Only UFS supports suspend */
+        if (!g_str_equal(mount->devtype, "ufs")) {
+            continue;
+        }
+
+        ret = ioctl(ufssuspend_fd, UFSSUSPEND, &mount->fsid);
+        if (ret == -1) {
+            /*
+             * ioctl returns EBUSY for all the FS except the first one
+             * that was suspended
+             */
+            if (errno == EBUSY) {
+                continue;
+            }
+            error_setg_errno(errp, errno, "failed to freeze %s",
+                             mount->dirname);
+            goto error;
+        }
+        ufssuspend_cnt++;
+    }
+    return ufssuspend_cnt;
+error:
+    close(ufssuspend_fd);
+    ufssuspend_fd = -1;
+    return -1;
+
+}
+
+/*
+ * We don't need to call UFSRESUME ioctl because all the frozen FS
+ * are thawed on /dev/ufssuspend closing.
+ */
+int qmp_guest_fsfreeze_do_thaw(Error **errp)
+{
+    int ret = ufssuspend_cnt;
+    ufssuspend_cnt = 0;
+    if (ufssuspend_fd != -1) {
+        close(ufssuspend_fd);
+        ufssuspend_fd = -1;
+    }
+    return ret;
+}
+
+GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+#endif /* CONFIG_FSFREEZE */
diff --git a/qga/commands-common.h b/qga/commands-common.h
index 181fc330aa..2d9878a634 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -23,11 +23,22 @@
 #endif
 #endif /* __linux__ */
 
+#ifdef __FreeBSD__
+#include <ufs/ffs/fs.h>
+#ifdef UFSSUSPEND
+#define CONFIG_FSFREEZE
+#endif
+#endif /* __FreeBSD__ */
+
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
 typedef struct FsMount {
     char *dirname;
     char *devtype;
     unsigned int devmajor, devminor;
+#if defined(__FreeBSD__)
+    dev_t dev;
+    fsid_t fsid;
+#endif
     QTAILQ_ENTRY(FsMount) next;
 } FsMount;
 
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 9574b83c92..49f9996a9c 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -33,20 +33,12 @@
 
 #if defined(__linux__)
 #include <mntent.h>
-#include <linux/fs.h>
 #include <sys/statvfs.h>
 #include <linux/nvme_ioctl.h>
 
 #ifdef CONFIG_LIBUDEV
 #include <libudev.h>
 #endif
-
-#ifdef FIFREEZE
-#define CONFIG_FSFREEZE
-#endif
-#ifdef FITRIM
-#define CONFIG_FSTRIM
-#endif
 #endif
 
 #ifdef __FreeBSD__
@@ -623,9 +615,6 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)
     }
 }
 
-/* linux-specific implementations. avoid this if at all possible. */
-#if defined(__linux__)
-
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
 void free_fs_mount_list(FsMountList *mounts)
 {
@@ -644,6 +633,156 @@ void free_fs_mount_list(FsMountList *mounts)
 }
 #endif
 
+#if defined(CONFIG_FSFREEZE)
+typedef enum {
+    FSFREEZE_HOOK_THAW = 0,
+    FSFREEZE_HOOK_FREEZE,
+} FsfreezeHookArg;
+
+static const char *fsfreeze_hook_arg_string[] = {
+    "thaw",
+    "freeze",
+};
+
+static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)
+{
+    int status;
+    pid_t pid;
+    const char *hook;
+    const char *arg_str = fsfreeze_hook_arg_string[arg];
+    Error *local_err = NULL;
+
+    hook = ga_fsfreeze_hook(ga_state);
+    if (!hook) {
+        return;
+    }
+    if (access(hook, X_OK) != 0) {
+        error_setg_errno(errp, errno, "can't access fsfreeze hook '%s'", hook);
+        return;
+    }
+
+    slog("executing fsfreeze hook with arg '%s'", arg_str);
+    pid = fork();
+    if (pid == 0) {
+        setsid();
+        reopen_fd_to_null(0);
+        reopen_fd_to_null(1);
+        reopen_fd_to_null(2);
+
+        execl(hook, hook, arg_str, NULL);
+        _exit(EXIT_FAILURE);
+    } else if (pid < 0) {
+        error_setg_errno(errp, errno, "failed to create child process");
+        return;
+    }
+
+    ga_wait_child(pid, &status, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (!WIFEXITED(status)) {
+        error_setg(errp, "fsfreeze hook has terminated abnormally");
+        return;
+    }
+
+    status = WEXITSTATUS(status);
+    if (status) {
+        error_setg(errp, "fsfreeze hook has failed with status %d", status);
+        return;
+    }
+}
+
+/*
+ * Return status of freeze/thaw
+ */
+GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **errp)
+{
+    if (ga_is_frozen(ga_state)) {
+        return GUEST_FSFREEZE_STATUS_FROZEN;
+    }
+
+    return GUEST_FSFREEZE_STATUS_THAWED;
+}
+
+int64_t qmp_guest_fsfreeze_freeze(Error **errp)
+{
+    return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
+}
+
+int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
+                                       strList *mountpoints,
+                                       Error **errp)
+{
+    int ret;
+    FsMountList mounts;
+    Error *local_err = NULL;
+
+    slog("guest-fsfreeze called");
+
+    execute_fsfreeze_hook(FSFREEZE_HOOK_FREEZE, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return -1;
+    }
+
+    QTAILQ_INIT(&mounts);
+    if (!build_fs_mount_list(&mounts, &local_err)) {
+        error_propagate(errp, local_err);
+        return -1;
+    }
+
+    /* cannot risk guest agent blocking itself on a write in this state */
+    ga_set_frozen(ga_state);
+
+    ret = qmp_guest_fsfreeze_do_freeze_list(has_mountpoints, mountpoints,
+                                            mounts, errp);
+
+    free_fs_mount_list(&mounts);
+    /* We may not issue any FIFREEZE here.
+     * Just unset ga_state here and ready for the next call.
+     */
+    if (ret == 0) {
+        ga_unset_frozen(ga_state);
+    } else if (ret < 0) {
+        qmp_guest_fsfreeze_thaw(NULL);
+    }
+    return ret;
+}
+
+int64_t qmp_guest_fsfreeze_thaw(Error **errp)
+{
+    int ret;
+
+    ret = qmp_guest_fsfreeze_do_thaw(errp);
+    if (ret >= 0) {
+        ga_unset_frozen(ga_state);
+        execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
+    } else {
+        ret = 0;
+    }
+
+    return ret;
+}
+
+static void guest_fsfreeze_cleanup(void)
+{
+    Error *err = NULL;
+
+    if (ga_is_frozen(ga_state) == GUEST_FSFREEZE_STATUS_FROZEN) {
+        qmp_guest_fsfreeze_thaw(&err);
+        if (err) {
+            slog("failed to clean up frozen filesystems: %s",
+                 error_get_pretty(err));
+            error_free(err);
+        }
+    }
+}
+#endif
+
+/* linux-specific implementations. avoid this if at all possible. */
+#if defined(__linux__)
 #if defined(CONFIG_FSFREEZE)
 
 static char *get_pci_driver(char const *syspath, int pathlen, Error **errp)
@@ -1467,153 +1606,6 @@ GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
     free_fs_mount_list(&mounts);
     return ret;
 }
-
-
-typedef enum {
-    FSFREEZE_HOOK_THAW = 0,
-    FSFREEZE_HOOK_FREEZE,
-} FsfreezeHookArg;
-
-static const char *fsfreeze_hook_arg_string[] = {
-    "thaw",
-    "freeze",
-};
-
-static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)
-{
-    int status;
-    pid_t pid;
-    const char *hook;
-    const char *arg_str = fsfreeze_hook_arg_string[arg];
-    Error *local_err = NULL;
-
-    hook = ga_fsfreeze_hook(ga_state);
-    if (!hook) {
-        return;
-    }
-    if (access(hook, X_OK) != 0) {
-        error_setg_errno(errp, errno, "can't access fsfreeze hook '%s'", hook);
-        return;
-    }
-
-    slog("executing fsfreeze hook with arg '%s'", arg_str);
-    pid = fork();
-    if (pid == 0) {
-        setsid();
-        reopen_fd_to_null(0);
-        reopen_fd_to_null(1);
-        reopen_fd_to_null(2);
-
-        execl(hook, hook, arg_str, NULL);
-        _exit(EXIT_FAILURE);
-    } else if (pid < 0) {
-        error_setg_errno(errp, errno, "failed to create child process");
-        return;
-    }
-
-    ga_wait_child(pid, &status, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    if (!WIFEXITED(status)) {
-        error_setg(errp, "fsfreeze hook has terminated abnormally");
-        return;
-    }
-
-    status = WEXITSTATUS(status);
-    if (status) {
-        error_setg(errp, "fsfreeze hook has failed with status %d", status);
-        return;
-    }
-}
-
-/*
- * Return status of freeze/thaw
- */
-GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **errp)
-{
-    if (ga_is_frozen(ga_state)) {
-        return GUEST_FSFREEZE_STATUS_FROZEN;
-    }
-
-    return GUEST_FSFREEZE_STATUS_THAWED;
-}
-
-int64_t qmp_guest_fsfreeze_freeze(Error **errp)
-{
-    return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
-}
-
-int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
-                                       strList *mountpoints,
-                                       Error **errp)
-{
-    int ret;
-    FsMountList mounts;
-    Error *local_err = NULL;
-
-    slog("guest-fsfreeze called");
-
-    execute_fsfreeze_hook(FSFREEZE_HOOK_FREEZE, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return -1;
-    }
-
-    QTAILQ_INIT(&mounts);
-    if (!build_fs_mount_list(&mounts, &local_err)) {
-        error_propagate(errp, local_err);
-        return -1;
-    }
-
-    /* cannot risk guest agent blocking itself on a write in this state */
-    ga_set_frozen(ga_state);
-
-    ret = qmp_guest_fsfreeze_do_freeze_list(has_mountpoints, mountpoints,
-                                            mounts, errp);
-
-    free_fs_mount_list(&mounts);
-    /* We may not issue any FIFREEZE here.
-     * Just unset ga_state here and ready for the next call.
-     */
-    if (ret == 0) {
-        ga_unset_frozen(ga_state);
-    } else if (ret < 0) {
-        qmp_guest_fsfreeze_thaw(NULL);
-    }
-    return ret;
-}
-
-int64_t qmp_guest_fsfreeze_thaw(Error **errp)
-{
-    int ret;
-
-    ret = qmp_guest_fsfreeze_do_thaw(errp);
-    if (ret >= 0) {
-        ga_unset_frozen(ga_state);
-        execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
-    } else {
-        ret = 0;
-    }
-
-    return ret;
-}
-
-static void guest_fsfreeze_cleanup(void)
-{
-    Error *err = NULL;
-
-    if (ga_is_frozen(ga_state) == GUEST_FSFREEZE_STATUS_FROZEN) {
-        qmp_guest_fsfreeze_thaw(&err);
-        if (err) {
-            slog("failed to clean up frozen filesystems: %s",
-                 error_get_pretty(err));
-            error_free(err);
-        }
-    }
-}
 #endif /* CONFIG_FSFREEZE */
 
 #if defined(CONFIG_FSTRIM)
diff --git a/qga/main.c b/qga/main.c
index 0d27c97d38..b3580508fa 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -37,12 +37,7 @@
 #include "qga/service-win32.h"
 #include "qga/vss-win32.h"
 #endif
-#ifdef __linux__
-#include <linux/fs.h>
-#ifdef FIFREEZE
-#define CONFIG_FSFREEZE
-#endif
-#endif
+#include "commands-common.h"
 
 #ifndef _WIN32
 #ifdef __FreeBSD__
diff --git a/qga/meson.build b/qga/meson.build
index 409f49a000..456ba4c29f 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -75,6 +75,9 @@ qga_ss.add(when: 'CONFIG_POSIX', if_true: files(
 qga_ss.add(when: 'CONFIG_LINUX', if_true: files(
   'commands-linux.c',
 ))
+qga_ss.add(when: 'CONFIG_BSD', if_true: files(
+  'commands-bsd.c',
+))
 qga_ss.add(when: 'CONFIG_WIN32', if_true: files(
   'channel-win32.c',
   'commands-win32.c',
-- 
2.34.1


