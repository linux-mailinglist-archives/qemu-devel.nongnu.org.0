Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7575EF037
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:20:09 +0200 (CEST)
Received: from localhost ([::1]:39796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odom8-0004e3-Lj
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoMM-0005N2-Va
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:53:39 -0400
Received: from mail-eopbgr60106.outbound.protection.outlook.com
 ([40.107.6.106]:26178 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoMK-0000p0-6m
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:53:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVPLgFMgxkTfBwPOz+BF6ahMVljbkABQz+XEdlUGdxlqIqZQX3cWt8PN7lSa0zYfaYp4Knq1ihADpKuqTSaeQzBK9GEj4Y3PS1NtQr+B0Rm6JXNH1d/n02iSrZBdFeFxfxTjZuPRgwAcFYV+MPHwDtEM1v0IAhh14gNl1gMGNEiagCdAfao2la9t3/EhCfkwzj3Ou0wO7g+hDBnhTTv+rvg7LC8Fnp3bKBpMexXkW8Mq1O4V59pFyUgi6+Q+O1UpZgkGLYzQ2L/VpbQ1tvnKo84zrULkRP+ZUVLoXg3iWW7MvTlCjXpVcbtccea+QTy5Ag3ivxcrPZZTU3MImCFsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQgo/lQsufBuyPF1gE5iyXXohWKD6JjRPtOTuVhV0Yg=;
 b=mgBwzZ68FPJK9q74NG+RVak7QNsDAy3gvxvO+DEqxQgP0gV3pB82yfnLSeBekWkUUUyrJ9l7goG2c60qEfDe3M7ZSdTU3l2+fxtG5sfGzLbs8YMPm5nPJqls5inXrK1k47rRem+EictsKnJH3EA9ZkFkrLdzgkqh7OS2r29VpSpwIu+Ue5gSGa9H1Bc3VISl+Qwyq934mDr1AmuuxLn8sHBFu3nTCn20KAOMP8HwHdo9eTxeGPBIImL32QA721Tb1nj2GiIgnIPLejNobzYc8TrmL4nXuc4KKgrCKS46mpFnkrexywPXmyzHSXRq5qPJMgY9gn/MpaZdaKIrmeHDWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQgo/lQsufBuyPF1gE5iyXXohWKD6JjRPtOTuVhV0Yg=;
 b=nPsek4E0Dv8Do2aaOdtAkESlYxmKbgeV7rgBcUUeOjgOtp+WlbegFsJzOtkYDfya/dxSSBzyik2nA6LCFduASAOSE7epJ7bJGHsUegLG+7DW5qdbnSP5sEFSPr6+OYxpAcFnpVmMulv7iumb3+dNYnSJkp0W5i1985E/E0ptO6XlRkcdzysytBzxQ6bWKmA86yMSY35WxjmzzfvbHgKbFbZmZdYkkJZHnpMZU2muYfwaYsY0UMW5ZEYqr9rXKLJ3c6mY7nRSw0TWoZjyyishu4fNku+iiIVIOfavf6F/asqtkhJ8v4f6kUjn4fBno7wX784x/MCblPCPbXA3EuniGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9509.eurprd08.prod.outlook.com (2603:10a6:10:44f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 29 Sep
 2022 07:52:47 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 07:52:47 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com,
	michael.roth@amd.com,
	kkostiuk@redhat.com
Subject: [PATCH 2/7] qga: Move Linux-specific FS freeze/thaw code to a
 separate file
Date: Thu, 29 Sep 2022 09:52:34 +0200
Message-Id: <20220929075239.1675374-3-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 23bd9cbb-5235-4637-0c57-08daa1ef9987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /SeRolP07bWIkltl5UHuz/fqAxcOiCMh1rLSzvc3F3pLiJan3Ddhgp1irfbcR4THgMfp+QnNCTqKZN4szmRWL6RVarQreW/WlHtbrB4vEIzkUqTC8SY5/YXIkLXKkff4HSP8knn6d6yV6LK+sv6g1MqRIits5wBMjP/si6GnCUs1NGgumkWg5CkN3a9Qtl90+rCFvrqRLs2/QW7lgnG81bYQgA6aJTrf4bh+FQjRSW6qxOILjrePgqFB5EqFZ0k/TVjFdxkSdgkcGcSMphFAKSK3P4eD+y7IYKeMS2+sCsPoNFixcNDwgQnDadrZbJdlVmUpD3Uy30AIufqn/DZ+Cw0oo+Q9UDSSzlTwTMMprMNVS16WEAtBC5MoaeQCd1T8c/94Bb/Tv/OJ20cBQTwh2ar1eapUuxEMUSXtNaQxcZAQj1ArDH7rP7h23AV0jk5L2HsyuQcEEW1wqilk6M9v5N7pLv6MLNkvroC0ekIPIWB/L77x3a+MhZ2rY/0IDUp92c3MnZsFN6/mlLwwhd2IAQ1dS8HvIvfMcnT0kLuYCsxpHZ0UNPcY4zWYmSX6yAL0Ks5Ci98Ajgsys/5GfJ2J+iakrh7jmtAVkt6TJy35YMv5i6jPcFDThlClyZ21ABjCGqLskYf4bEfO+KacMP6gUpYv2EuB00OEpOcOXBfPE5G86UU1aulCRkvLp6I1VJOeot243cRT/kOnKfdQPWgsuyo9LXvtTPtlZQ81Nhah/5pepTCMaR0CS6NvyTboVae/Ljl8OrduDaxHGIeUPB8BQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39850400004)(376002)(396003)(346002)(451199015)(2616005)(38100700002)(38350700002)(86362001)(6486002)(478600001)(8936002)(83380400001)(5660300002)(6506007)(26005)(6512007)(316002)(6666004)(2906002)(30864003)(6916009)(41300700001)(8676002)(36756003)(52116002)(44832011)(186003)(66476007)(66556008)(66946007)(4326008)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aOrqFtmzgP1KU2l7v0JMVLDSncBcykyxP7MfIyWDUZBRp3iEClvs3rd4raIo?=
 =?us-ascii?Q?7H1dQzI25DX51cxrZHgwHnG5wJkx0JSzsz0sCJHXH5InQjlk78KTMDHq1ZgL?=
 =?us-ascii?Q?4uDZ+fwVZBN8za7a/xQIaQJnw+gopkZsm3ZyaxCH9+12OH7lcL+KNVigCm2Y?=
 =?us-ascii?Q?uSPtyW8Mi2ngQg3BgGFDLeJ3JJl9h7QajgUlXOZ/z4L8xYoS9bKJ4RbmFfDO?=
 =?us-ascii?Q?Bo7I/adxmWzUx6Sm+V3OYAGeO754l3jlf1rIj19EimdVrjrutsvGVqw5lcmR?=
 =?us-ascii?Q?hzGsGxzUYVsQnOeui0+nSzga2Kdn7BKFso1hPkaHHhNMCftIjXaGBBNoYyYt?=
 =?us-ascii?Q?I5b2M/d8pOXKk6PukQFWvLOOZmCNkxsoNjwi0i5hlWuwdK1mujaKVlqBqf9u?=
 =?us-ascii?Q?AuHsGBjBut1N630xT3MrY3x2q3q4mixelqTxS7GXIB5324PyeTdy2We03waN?=
 =?us-ascii?Q?jHbbcVmFxwIBRj7pmRy7HN1JGUv8VIAlRGXjk/5sSLDIcJCi9FMQ3dNtoDBA?=
 =?us-ascii?Q?A1CjYymdoDn2+Sgm8JtKyg7s5FC2hmN70lAgaslAB1/Lt7UD704Q6vUZidNG?=
 =?us-ascii?Q?ZwNPuvXiQ/TQmqucUwYgqWXagxZ2RqiBowq5OFABlN97gtlDqeVoEMgFPX8C?=
 =?us-ascii?Q?ZnxjTTWPWrAjM2fbRxVrKJwZXcUeL0+7o7DPQPJ8Ms95yVOYwnsNRAqB5CN1?=
 =?us-ascii?Q?MCCcB2GcUDYImp4yip+4HDz8ranaUg7ijijJepqyklCTaUcqN8TJ4AXd9rjY?=
 =?us-ascii?Q?EFEe4SbsNFVTtD/2nDDQNMmZbPoglbumh9yB5WB7B+LrzB3eKzCdDwzXa2l4?=
 =?us-ascii?Q?dmDcS5xDRaGj+LXnTfr98kj43W3hHoocrxQnx5/uhrOfKVp0DVszAU9ThAjw?=
 =?us-ascii?Q?FyiOAFsU8XP9xi9UVWOL1NCTIrUTv1Dfy8Xyk/3VU6hIe+BP6UxF/wx0kNmO?=
 =?us-ascii?Q?/u8yhyOctXmUG0/xTUjRLF7+PqaSjQVsQ4l1FnfFtMipQPGU9DG9b2JrUb+u?=
 =?us-ascii?Q?5MAahav9VEYfAV6Yncg8Th15zlk2W6PJYaKzm1+LZzPBR5FKLSmgFZaTDMSo?=
 =?us-ascii?Q?a6wn8zeWSu+PA66G8uh7L3fdUdyuko1tQLgqwAFheC3MnMWe4bUSfbRu4Eks?=
 =?us-ascii?Q?UGvoltqZMtq/HOn63HlNM3CLtcOPKxc9cQXRAmmIZYtZzw5LnAKhfVkYJ10z?=
 =?us-ascii?Q?eYxuP0SIqxQ1i6w338w8xVYs1YXcewvaDknH82l+D/W8b8DlwKI6Fru4qFh1?=
 =?us-ascii?Q?tMEVDhDYdZGEmJybMw7Jj1QWTN/WOVUDhAYu+LN9QpH75fcXff65fRFOacgc?=
 =?us-ascii?Q?tlUzEbathdNMGKewUJ1KqruMR363YpDYKv9Q2O/d1IPU1r8P9+RUQePTIwOy?=
 =?us-ascii?Q?LHnS4FZdf7QxK3QTxHEhoQEDgEGRfaL/Or4T4u9VGhRoDE7jkrMutxSfxJoL?=
 =?us-ascii?Q?qBTxBM6dqyM7nQznF+adqlCGXptTd2UKAtreg1tbees46mSvEGRIxjnVYvuK?=
 =?us-ascii?Q?ZcEdA7XOSR5jDY4iqw/wuImm7GAjBjfyYiBcb0gyGFU0w2moxG37Nv561APT?=
 =?us-ascii?Q?k2FBChHz2V/cyIHGskz8zugW+1lRNBI9q+ubQE7ZGY3WmE6OfXox06kVl7ih?=
 =?us-ascii?Q?RbdPYFy5w0/r8+X4bAynbhM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bd9cbb-5235-4637-0c57-08daa1ef9987
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:52:47.3398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQwX/If6bE2xRAhnDhX/lWOBlVVuYir+f/N/wZ7/jvuLaDhha0UGT9H9WRlwnPUPy6AEAGmIZGkc1MoR+y1OjNmAWGhTomamD+CpKWZANN0=
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

In the next patches we are going to add FreeBSD support for QEMU Guest
Agent. In the result, code in commands-posix.c will be too cumbersome.

Move Linux-specific FS freeze/thaw code to a separate file commands-linux.c
keeping common POSIX code in commands-posix.c.

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


