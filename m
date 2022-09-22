Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635E65E6505
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:22:02 +0200 (CEST)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obN5U-0003xp-VK
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obM8O-0001WE-3L
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:21:06 -0400
Received: from mail-eopbgr60136.outbound.protection.outlook.com
 ([40.107.6.136]:7326 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obM8K-0004pt-Fz
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:20:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCVllDXvaxpU0HbAUSfJpJw9DV0surNFT6cREElYw3y6ri8LmjWCinzC+STdwTRRNfm5MkceC13hZbCXdHHqIVMXjRD0O77ZhAI/8/TSyEJaolncclEwIdyCXzvAJ2QRCqa58+wu5M7K1h0fHlam3BIQO/qQtc1SuN0FQkigofdcIqeE7950IGvzCFV+et2EtStxoWEmlx++B6kPxvIZvIRQvsAkWU++GAXytmInuz35OKIsUEYDErev5UU9IWcotBhegTdVDKKw71Ijm2Q6gDmiwf9EjISW1TU8ZD5ocnzBkF0Or9bv/PY15pgyQWDCHc5e9xBPzn3EsVePSsVdTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnWNATV3S86omQsc/eiTIbd24tH6lGlT3gh9+O1nfU0=;
 b=goh+2g/FxAixKvxaStwOySFxLFZ0NSmJyV2rbs879QrP+t30IAHqsasK8L+AnSAQoFu3W3UZWzd8iPMcF01Kd6TzHD5hVlc8NtRdg880SKl55G0V/zs84JVghx8nkB/1jqf1gnzp118qLK+EZExpKVZBwpsJhRc4XqW1Z6RlmMwaOKn1Ts26zL4tLPnWEcbON2tf0qUy3QJmTj//2tCCCqtlX0lbVHrvlrWhEvyZVKYG5RZA3CeQ5MRGDO2BswBytpMZpl1I2Y/RNPF8ap/A3upYky3eZuXT/mvCwwNGcaAnw7GBLCVfq0cEgt3Z6VQHgcAhK3HK3Z1C+G9HHEXuRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnWNATV3S86omQsc/eiTIbd24tH6lGlT3gh9+O1nfU0=;
 b=yZ1Xd16D/Pn2vIUNL+WwVzMgQnsKZ8YaLox5cY+RYy1PvMMq8hzv+Lmtv7DgrulSROqwrVoLJ5xnq69ePsZbePmK0Zs2QAZDaQ1QujavK8zxv84LD19g4TuEe1BxJaYs2Pjmm/SwOoKQLfxKhphCZMCXAwUkGe4PxCAav28PXcf897xqqHk3vfh6QFWJGdMyxsSiZ10drZ7SUS1J+TohfDiMn27V5I1DLqio0UttlfWgKLHjqAufDirrDH1j1ZzLDfIlKsyqi2t6Y/yYGbyyz8LNRrG54wVVQ5REz9rNyesx8AEEKEi8GchDIQ+iyzGZm47926UbT0TFhKSoj0CXVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6480.eurprd08.prod.outlook.com (2603:10a6:102:155::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 13:20:14 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 13:20:14 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com,
	michael.roth@amd.com,
	kkostiuk@redhat.com
Subject: [PATCH 3/5] qga: Add UFS freeze/thaw support for FreeBSD
Date: Thu, 22 Sep 2022 15:19:59 +0200
Message-Id: <20220922132001.940334-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
References: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAXPR08MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: cdbb2e8b-0181-4085-1906-08da9c9d2ee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4BJ/Fku7bd6XLfLRA9/AEOETjN9DREI8IVPDsxBJbJo1kYDGEhjxs4OI+zryd7k+GAMYYgf2G0pLN/A1iy/DCAAAy1MQGTLoehgZxRwNcPfOtMxi/W1gsW/ZFr0P2tJzRs+bkDtGdxQtNNa0GlA2PxyHDnDiSZUjAe8WXmLil2W1B8T3MKX+cZE3r8SXmufca8sjPT8ZYVivyzgybOlCDs+YGURonkcYyatf/E1zCmAWk4p/Yb2mtANGqQ56OTwat8s+I6GhXVyDCP9fk+3Fk2D0t3eUH03y49lBpQ+ZeKZ/CVzO1NaQ9lxA+srBcnGSHFGBRdT3RsBjoMhMkVtEyBFGjOZz0ElMzsDnp2oaV26DcwsfCbdGHssWwM6uI2nFRmc78FCnsdZsQSlfZWT9yfRr7/8ro/6bLmdd6Xi2EnWllvmtwidlq2cLSit+eMxvhTljRR5N2JDz7qyKEq3TnebsclGk9wQJcNdtS6cFBq7H99Gy3eMR9pdWeDeVbrCk0+rHR2ZBKzs9lFOSml3grW5n1ecVjV4Mfi1p+gbw3c1if9hZBZRFrxJOlNU8rMtzIL53f7WOkADjCcEBwD+4rQEoGWlL8QeyV2VhETIiTNvWLr3ziviKISbA8yAOXsbX8rA6TKCzUR11ilVR7K7XebM8EaTbqFnTGo759pqUKlHtw4QWnYCaOhh+BnpYZ7p/Zj4PzPOauTjRBc6zbJ16W17ePB3qGC1EhI8UwQ7d66KjXv+p10oKA4S0HbwWWCzZ+1boC08Dzxmd58A6cEcAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(451199015)(41300700001)(6486002)(478600001)(6666004)(52116002)(36756003)(66476007)(66556008)(316002)(186003)(66946007)(83380400001)(1076003)(5660300002)(2616005)(8936002)(26005)(6506007)(6916009)(86362001)(8676002)(44832011)(4326008)(2906002)(6512007)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sYVNB6nGz3MJaJJ7rtAeQ9hNC1xelifFRaQ4ocTSaMvHGKsoCFldVw0Brfp1?=
 =?us-ascii?Q?F21ZTF2PMyNIfbbGBCe7gJjw0sp4XTeAP2HLxi4q9jS3g41qW5BHr7WPPL+Z?=
 =?us-ascii?Q?fBfE06LQeoT9F4FOrE1fzomsLUwiRB+OsCHCPYCFoq6bU2aZ8L3cmo5C2Hvb?=
 =?us-ascii?Q?t/JnStGNVb4GtBRxYXXjIknVkSwBMx6WI7Iw1wEdz47H59x2FxofJaUL0GXj?=
 =?us-ascii?Q?OnzDwik/NAPAypn1PNAjkWUUxqhzUvCtpGJhkd3wjXsD7RCZ91WnrNpEErgK?=
 =?us-ascii?Q?Qd8vfvARjAWWnvSbHextcuQzVTdcRCBOfN1Bo/2ukF9775YdBy+cLH3GfWaS?=
 =?us-ascii?Q?oQRlM11wcVxVT+2iabLe/h7v4Y2a2gg5gx9uWQSuT4eLs+z/fhVuwMibAFZ2?=
 =?us-ascii?Q?S+cfab7rp4EYbMP12qsm13GVrkb9BVLPy40+p1RlTJc4YJp+kmhAWZnqF9Rr?=
 =?us-ascii?Q?2nugtemorDkwGm+LfvB/lC3JP0P8UIJnmPK0h1Ax6wybnfhpQ7dlnutKd2yJ?=
 =?us-ascii?Q?WlSeJ3luKi2zo7OOW0Ve04iEQove/fNk0ZAQvuuhnWvbvn18cFKgro6nlDAR?=
 =?us-ascii?Q?8FqlnCs1sYpjNOiD/Mh7nQ47JZykq7sTCkMhnpCLAh//RLa/5i8vBmeGOl69?=
 =?us-ascii?Q?CTrX8BlWZI7LEx7eUnLw8AmrAjiekas4zBpf2Ppb9R7sJIEAX155bf/Xkwku?=
 =?us-ascii?Q?tJ+Lm/V8jHDKTFFHOM7pTx2c4gPgmNyycVAGvZfsFzVndxMQlNqXhStItPsN?=
 =?us-ascii?Q?aoYTKK7ptJaDQv97YpO1e9V6BKxzkuut6ey27cXBMpVBQF+wG2hbSlcHTOHE?=
 =?us-ascii?Q?vABuQiZ2C7JBRx9g5yMYJv7fD92aUfTDouHSpYEJwIqJulYSlEJ/USmfT0hU?=
 =?us-ascii?Q?chww0GPMv3S7FB1e13k4ai3+h5xDKV4A9qMcE7dJitC0WY61IT7bGDtG6H9P?=
 =?us-ascii?Q?4N2A4ArY0/bGqVaUTR0UUDjM02YSHdzvmh5MdWeQ5BUL1tQPUmUiNVPqLMWo?=
 =?us-ascii?Q?dOikYlKT/0V2arV68KjWNsPaHkQ9cBhjSOhH5A6CPcdiAIdeUmAduQ0NwT+T?=
 =?us-ascii?Q?8g4R3uIccz0UPToIaMU0UzS5njHwl17nTc0UYNN3Txwbgrbbu71XikhKJHqQ?=
 =?us-ascii?Q?wxZvu5SICtysMMotS79rHc1ODTR30N3Fuyh7LnrysngHBiMmThEgW24ygxqp?=
 =?us-ascii?Q?Qa4pITcw0s2u12fIp0CzVAurDVuACd3tBbh5rSyyWVaE6zYVQfc9/ujZr10X?=
 =?us-ascii?Q?l27R98pWKCNDivsYPnm5YQV5H1FW8Xh9mun8WT/yie3wYT1NClsDu4Wipf7M?=
 =?us-ascii?Q?GEsYEPGOMKnNMrCne3Ia6nH6ou7YP6nejYUKrH9NRXFCv0OLKvoE95jBW84W?=
 =?us-ascii?Q?QQSHr8XqA24gex8hs94115+RYuX/Vpa0afO1xfGiv2oc5e8zPoX/zvZYlIAx?=
 =?us-ascii?Q?ibu396F92Y4Hifm0GYwqAQ6V4AfEdRlpbekKJnZnFr/dUfUTYkRR76HJmdR8?=
 =?us-ascii?Q?Z3lF2990/m33DRMrysN5maA8q6ks2IyjbvJlD2z39dxXrtjzyvDXH+Kjd9y5?=
 =?us-ascii?Q?Zg5FrM6Z9Qc7Es7OTjadvLq10aAz7PIu8RiDXwTI7hLCu8QVb2Zlqb+HJUrB?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbb2e8b-0181-4085-1906-08da9c9d2ee7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:20:14.1260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GY5A6xHA2QImCatCKULwKZvv9lLqDk1gCV7HwmSDXKPZuh719c57LoBR5kjMcqSTZ9eSRidBfsJ+njodkzi4mQ/e6J1Ek/vUBnLkejOLULM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6480
Received-SPF: pass client-ip=40.107.6.136;
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
Freezed FS can be thawed by closing /dev/ufssuspend file descriptior.

Use getmntinfo to get a list of mounted FS.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-bsd.c    | 109 +++++++++++++++++++++++++++++++++++++++---
 qga/commands-common.h |  11 +++++
 qga/main.c            |   6 +++
 3 files changed, 120 insertions(+), 6 deletions(-)

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index c1e3ed13e9..5d3f46804a 100644
--- a/qga/commands-bsd.c
+++ b/qga/commands-bsd.c
@@ -17,28 +17,125 @@
 #include "qemu/queue.h"
 #include "commands-common.h"
 
+#include <sys/ioctl.h>
+#include <sys/param.h>
+#include <sys/ucred.h>
+#include <sys/mount.h>
+#include <paths.h>
+
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
 bool build_fs_mount_list(FsMountList *mounts, Error **errp)
 {
-    error_setg(errp, QERR_UNSUPPORTED);
-    return false;
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
+            continue;
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
 }
 #endif
 
 #if defined(CONFIG_FSFREEZE)
+static int ufssuspend_fd = -1;
+static int ufssuspend_cnt;
+
 int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
                                           strList *mountpoints,
                                           FsMountList mounts,
                                           Error **errp)
 {
-    error_setg(errp, QERR_UNSUPPORTED);
-    return 0;
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
+                if (strcmp(list->value, mount->dirname) == 0) {
+                    break;
+                }
+            }
+            if (!list) {
+                continue;
+            }
+        }
+
+        /* Only UFS supports suspend */
+        if (strcmp(mount->devtype, "ufs") != 0) {
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
 }
 
 int qmp_guest_fsfreeze_do_thaw(Error **errp)
 {
-    error_setg(errp, QERR_UNSUPPORTED);
-    return 0;
+    int ret = ufssuspend_cnt;
+    ufssuspend_cnt = 0;
+    if (ufssuspend_fd != -1) {
+        close(ufssuspend_fd);
+        ufssuspend_fd = -1;
+    }
+    return ret;
 }
 #endif
 
diff --git a/qga/commands-common.h b/qga/commands-common.h
index aa0472ea4c..c3be6db3a9 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -41,11 +41,22 @@ void ga_wait_child(pid_t pid, int *status, Error **errp);
 #endif
 #endif /* __linux__*/
 
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
 
diff --git a/qga/main.c b/qga/main.c
index 22b3c0df11..ab420051fb 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -43,6 +43,12 @@
 #define CONFIG_FSFREEZE
 #endif
 #endif
+#ifdef __FreeBSD__
+#include <ufs/ffs/fs.h>
+#ifdef UFSSUSPEND
+#define CONFIG_FSFREEZE
+#endif
+#endif
 
 #ifndef _WIN32
 #ifdef __FreeBSD__
-- 
2.34.1


