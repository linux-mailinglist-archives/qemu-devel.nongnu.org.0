Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51F55F2E86
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 11:53:23 +0200 (CEST)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofI8Y-0000HW-QF
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 05:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHvJ-0006RW-Bn
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:39:42 -0400
Received: from mail-eopbgr80119.outbound.protection.outlook.com
 ([40.107.8.119]:34208 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHvG-0002U6-Tv
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:39:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cu+gAd8NdTdtMWuj/n3KEL5izaClAeO7eVgvp2kLFVK3SJPplQam/Uegvh6Ndk15cJFZJ4VGWF+6vfQ7qUiqqC09RJg+BNrhZDGppdLvVLdfdaIWtIk24X0q2UZK0vxvkCmwnf8zZZCT1MlYHeyJuYYs51ADdn4qwy3fT1yhM2NuKVdm51yIuKfL60xHMNv7Ku9EAzDc5GHssgb/f7WP3eecDgazxlA90EcqptjFYILRa9Xb+WwYOt+mt/cuz5YU5YoF50E7OELBXBaZAUFc1URNywg73D4qyhrj8GrOeU7ZviURDyYwgzTx3BgvVCmaFafuffQKC3xj2GTPuc52eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pRohLF15lHFmrvkX7AYU88DslNsDkv2W4101oQE7fY=;
 b=U7ca8Zzo41s2tnhokCTEYEz+NqDy6nelzDuAj+RZcAcNF3oN9Iylf/aCM00yC3cEV1K7jzeH2QCoN8sph9WeTM5pBJrjJSGqrF1u/RGVlcavcc+CnmuNmr9dwlT7rqGNOZwP9nCkAzkbjxV40uZLiPZTMft8r8mdfzxxHCud3RnLvoMuEX7/bEYkFp2CH1p7RZntWkTMBocJSGgHNhHbtUjVs19bUfbZO6wnP8JmFPmTnv13JwjoMLMzggTUZcV8Nx63hJgOuurYaWunQGd823+4NFnOm1rRBc7nJPl/aAW9Nqb/BJ6nm2pP3Vom6m73K8KjYIidh7MErqoizuoOeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pRohLF15lHFmrvkX7AYU88DslNsDkv2W4101oQE7fY=;
 b=mmHomuNeLLzCsQ+zleMHr3AP8A1OOBOELK1YYA7fW55vS5REWQLaarbPPnHPXMEbe0w+/oqyrok5spwdwNv2xfhAmts0NUicx7CcXgvLjYJIx8ecZIjluVt/8+0y/dZcI55hswbxypiRfgIarxLhFvd0wFOYf2wyguR1u2aNCVl6/nx9BVrIBz+XVjsNUzmZyv9Yw0qIyrzXNFqjBH9Q8A6CXsCSu4BSjBg9s/0BPk/9K4DOZda7U6PsuayGC5lAyfkVdzI37qB6OKLvbLBOs5wgviAkrzslEJ9wrn4xVni8aOuVOyMcGWZ1W2Vugz5GypdplCYgUJWbjFfpNArbSA==
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
Subject: [PATCH v3 3/7] qga: Add UFS freeze/thaw support for FreeBSD
Date: Mon,  3 Oct 2022 11:39:07 +0200
Message-Id: <20221003093911.1844031-4-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: b1be7880-88f3-4710-f387-08daa5232727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 86uM7GF6O1vJsM+qTarSR/cHej9lUH1sApYOcfaRy0r6sSgjgEATFpwgf8YISieamZVjzcvWswdUQ/dzjPKHR7Wp1TGmukCguak8z8UI88YfF+vnMMPDKnTo7BAIO7RDwHpKSGalzmywSBCdZiANptSBZniev3bFwrIlAux/Junm9DtAsddMHfKHZmP9X221NZPMb488L11hLqN/L0T6zXoMgVGnckRVm0w/16a15QsWtwPz0+Wv5AzZ3v42fmocJgZvwqDMWm5pOMeQqBuh7A98anXQIMobFMGSm0C6vcEtrISvl4YW/lVvALMmUdASSFera8GeC9RwA+GQ6rGWlOrQRI+2mdt4KD2seIRhzDahuAVwYBxFRHg+vNA0/G/waq8TTgnqdHps92zT3HCF8NViy+8ZbDIdcmNsEjb0H7RJnGJlCSylX0jDvPHKVhcn3M5r6ChyXLU8KcGoq/QS4I481dVMHnkMOUh723MRD5t/3MWUiFyOYLrCXKl+YMvtIfLeR8gGBMLSiQ/vTjcSvdwqBQnCMLstH2tqeVCHBC6MIzJ+brus8elE4YsbEstDDpst8pDPYK8oRWXKNgC88C1Ux/jUcfpOKrjh8kvq67BMJ8LFhqHMQKW+mNWGbNaj0HOAPOSjPxwayDJmrKdUzwUQgFW/jIxWlMf1vYn6IBal3JoLGwfoaXuSmkunAQRqDSvv8No6mspoyGHc+QWWPBUaiJhvVOmyNnhL/gXOPdE1TmfhukW+Y2pNDf12qYkhhTUn70rC78ajvZ3i6eEn1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(39850400004)(376002)(396003)(451199015)(6666004)(316002)(66476007)(66556008)(26005)(4326008)(8676002)(6512007)(6506007)(52116002)(2616005)(6916009)(478600001)(6486002)(66946007)(36756003)(38350700002)(38100700002)(86362001)(186003)(83380400001)(1076003)(44832011)(30864003)(41300700001)(8936002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWs1WlBJMUhDUFVHSW9OMVlGM21HbFFuWU1BUzVMQVlzbVFjbE9seWlBMCtS?=
 =?utf-8?B?ajQ1RzltS3V6aTJDR0pNN3VaQktaMjlwWXM5NjVLTFovV0RjR2QzbVN2aFYr?=
 =?utf-8?B?WDRNaWxCYnhSbkJ0bUlGbU9TY1BXR1N5WVFxNmtGRmNXZTFFYjVaY3lTVFdj?=
 =?utf-8?B?ZDNBMmpiUlFBbUx2QXE0Z2J1RUY5RGVkL2kwdmtDMVNmdGZIWEUrUkJIS2Ir?=
 =?utf-8?B?ZlBVSUg4SS9MUDh4MUlyS2ZubXRySndNOVNYOUQ1ME5JWWlJeS93ZzIvTTFa?=
 =?utf-8?B?bVJCdEJKT1dLM3NQZzk3dlQya3AxbmFKZEUxT0Z0d2R0c1R6N2IvM1pWM0F5?=
 =?utf-8?B?RU9uTFNMQXJNSHFxdVlKUFB0WDZaSGxxRFg0UzhZVGo2TVVYWWswdVd3T01I?=
 =?utf-8?B?c0pEamkrVXQwRmxlVzMzTnpzVkNjY0ZQUHBWZWd0bFBEQklhd2tYd3BlSVR5?=
 =?utf-8?B?QldMS0p5MC9mcUw2TldCKzRNdm1Pb3k4UWt3WXdjc2FDK0xZT094RmlnOUp5?=
 =?utf-8?B?OStSN0I1b25OVERSM1NTNkpQN1FQREIwaDUrMm42QWM3YThmemFxNTU3dkxR?=
 =?utf-8?B?VXcyYUZFZmxHSzJ2RnF4alNzbjdGdzQvMzArZCtpd0tPZmJwVGJFNWt1Z2FL?=
 =?utf-8?B?R05LQmV6SVJCYkdNeFBycmZnYmpsVTBHNFd1K3pTcDgzN2NSc21tS05NY0pX?=
 =?utf-8?B?YlFzTkdjSTBRRWl1Yk5YT3FTbzg0bEdUdm5hektZZXV0cUovMlhWSWVsNGZJ?=
 =?utf-8?B?dnRWc0p3MmUzTktNV3g5Z2V0dGFnZm1kTFV5N0hSRlFSSTViMmNoVTNmNkNF?=
 =?utf-8?B?bFkrRGtZUVNFeFVQVXFUalhERlFxUy91UWVUMHhIMTFHcHJxS2lNZ2tkWFZN?=
 =?utf-8?B?UzFYWU4xSGpyb0hzbEorY0dGVzcvdFJIZ3BVNWYvOURGMDVXTUdDa0x0ZVov?=
 =?utf-8?B?TFRvUjJZNXJJYmNpRFlJWjFRcmZEV3RKdjFEMSthMXlGUmM1aHN3alJ5cTlT?=
 =?utf-8?B?QmpaWEtxbG95TTdzL1Zmbk1EaUVEMFBHU2FWNGNWWFpLN25KSitzdjc0MnZX?=
 =?utf-8?B?OWFoUWpmcHRiem5KV1JtczAvSEd1aUx6WE1zaC90eGpEVGdnNWZUTXNZY0tK?=
 =?utf-8?B?SzQ4YzBaT1FLTGFXTVlWd1c0eXVCK0YybFF4VkRHZmN6Umo0WWNJZThZbVVp?=
 =?utf-8?B?bXQ2N050TmNXNjlweEF3VFUyUEl6TzJZZHVaUG1GRFpsd3dRaGRHUjY5ZTJn?=
 =?utf-8?B?REVhaHVJaUJzQ3J0TmpVUFdQVFd0aXptNmdRQ2J6RVpkV2c2TVA1SFBFTHdz?=
 =?utf-8?B?MTh1aWU5RWx2dWc0bW5JYTNYQmwvQ3g4WjBYU1pqWWlvZ2xNN3VBSDRQRVFi?=
 =?utf-8?B?ZytEeVl3UWoxdEw2TVp4SnlqWjBNaHV4TkVkN1BGSzF0eWkrc3lyQThaV2Q3?=
 =?utf-8?B?UkphNzVvN1ZnUWV4QVlmb3pXVzJMZ0psZzNLQW8vU0dybzVMME5WTm5LM1Nl?=
 =?utf-8?B?Mks2V280N0dDWTR2cy9rM0hXejV3M2VhL3dVN3NUYjJDS2ttbkRTVzZoN2NC?=
 =?utf-8?B?S0t3NTQ3eVppc1Ayb2lJSDhBTmxWSC9QRzM0OW82R0RNQUFDSkp5MFBFbS8z?=
 =?utf-8?B?NDF3Mi9LVnh6Y1lVY2tvN29CQi9aVFJISGFKcFhjdW05RmExVnluM0I0RlFx?=
 =?utf-8?B?NWdUK1ppMDVqOTRma0xxMTZEaG5oMWpVRnBzanIxZmVHcHhoK1ppNTg1UXB5?=
 =?utf-8?B?UmlDZG1ubU0ydzRlL0d2ZDQ0SXczQVR1bXZhTno5VmRWY3RQdFV2S1hNa0Nu?=
 =?utf-8?B?RHFRdTlDNU8xSVpUSWdtZ3J4UEJpcHFTSHdtc3llRWRzYmxXSlRScTZQMERw?=
 =?utf-8?B?WnF6b0pNV1FBNDE5bk1KNFNUalljRzBXVW9IMllIdFVYU0Z3aTUvdXF4OUtp?=
 =?utf-8?B?d0YxdHhFckRqVVVFZ2JOM0NXVWtGWEIyQVZsYlBtZFNEdk1ONkpXNWVxZHl2?=
 =?utf-8?B?RTBjcS91UWhPNnduRlV1aS9lZm1lM0xQd0MwdTl3S2hwTzFvZUZPc0hFNEZl?=
 =?utf-8?B?UlZ6MFNOUWFzbDl3RzFtdEJrbmJQOW1ZdTR3SGx0NEl2THdhd3dDc2Y0OVM0?=
 =?utf-8?B?ZFUwZ284Z200YlRucG42aWpmWW94MGJEWWtBMGtLVEE0bjJrM3ovc1BLZGY0?=
 =?utf-8?B?bmc9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1be7880-88f3-4710-f387-08daa5232727
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 09:39:22.6808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/InRzCP2MfZpWbzAKjc8dnukDD2lY1RWITzlWxWhoatXm3hVerTIMhWQ8d5nODm0ypor8S967zvQdh+skI9z/3ILQDQ8iiT19zRZr72+yE=
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

UFS supports FS freezing through ioctl UFSSUSPEND on /dev/ufssuspend.
Frozen FS can be thawed by closing /dev/ufssuspend file descriptior.

Use getmntinfo to get a list of mounted FS.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


