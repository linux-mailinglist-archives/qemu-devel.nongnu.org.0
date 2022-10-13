Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906545FD73D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 11:44:39 +0200 (CEST)
Received: from localhost ([::1]:33832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiulZ-0000iR-AS
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 05:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRc-0002M3-VX
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:24:02 -0400
Received: from mail-am6eur05on2109.outbound.protection.outlook.com
 ([40.107.22.109]:28065 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRM-0004gX-OC
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:24:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVUelJG57jRrSrwavXm8qaoQsSfVNgZivebU/56rx5vBQ5l7jp9HZHl9Sq7QLuq9qLNkw5a1nuUpuw0bexDv6s3zz9sRPD6E0OuO7YbdtEQygXZcUBIKonHKWR/vLlE+Afcij94onTDtwcDSE9RBykAyQ308lDYX3K3OFjgwWb2+MLsDo3q31eBaafEtdfbAclNYNDnJT3MdiXVUAcYEIGHxaBvpTvnfOQjHW3qGAGN74PoQyV5PErYHw6AHGf/m3OyJd2CxfIb7BUMhSE7C+BkGN67cfrEpips/nUNwbuplt36lQImeVpKZIlH3V7VpJyNXwJHqguHI+HNFmcLClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DK7nD0sgWCX9/ZdHU/h1wq1s4gT+ZWz1xBxB/M+VB8Y=;
 b=bhu8m+j/qGwZ1jTyRyUWLbgrkCfnhG5JUxKbJitN6EUt3JOA4bKtsopLs8XqaU57DSZ5tNZ7ATslGYQrRNEBLOnoeNYKl6yBLZ/m2QkujjxY6eRmuWjRfNF6Yj94C7E5sM72IgncjUSZu58FPbA1vuHOqJWUhO3Oi8a499piKt0MDYIQsf4XKDHGzzeXgRdOBG6SekbIqyDYEI/m9VwpjE4wJaLQPnK82JXMZtP3BIs3eA5MhcQ/BBfUf0kWrqG9lrGH7CiZIuXBlWYPRd13tEgk/pI+TlzOcM4V40eKW8GjCUT7jHriEGDO+LzW2s1tlRYfgvVcCohYsZTW/WZM+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DK7nD0sgWCX9/ZdHU/h1wq1s4gT+ZWz1xBxB/M+VB8Y=;
 b=oXD7MCT4A2m+dfunaAQd+69/hrn4esDHXwpra2VediBQhjybq9lOGJidTPcDBWyDGVZJs5qlTuBnGE0qSWpf6k3PhlSVdJdiaIPm090/Z5gBPtLIljqGLvOxKwm6xlv6kBTw3joz/AOMKtOMPZzGZEo5C6G789+NWBRjtOZxgrGTnuTCJ3WK1RwHu9x6keapuI0mRxNhwT3ZwXS2Rrw5qxQSS+NW43nAksPgAfo5KJ/U/GYudTvt06hYSJHeY98B8g3XKB4uRR0e825tGsHT3poUw576bYRujMturlybspELQSdKTNjUkMclxNjeVDi55rle6j9nbAXGutWYiBsFgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB6466.eurprd08.prod.outlook.com (2603:10a6:20b:363::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 09:23:37 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Thu, 13 Oct 2022
 09:23:37 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v4 3/7] qga: Add UFS freeze/thaw support for FreeBSD
Date: Thu, 13 Oct 2022 11:23:22 +0200
Message-Id: <20221013092326.2194646-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013092326.2194646-1-alexander.ivanov@virtuozzo.com>
References: <20221013092326.2194646-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AM8PR08MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 803d3e2f-ba73-4342-c740-08daacfc9bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9MvsZcDZBc0277G9qUL8clY9uDDNDDOmtVZDzClMO/1OrtM2Mae53JMhr/id8lUD1l3Lubchho182QMGvHNa8as8BHCF8MemJ6hnVNXx2ZuR3DQ5Brciw5xgqVlsJyj10tUmtGrl3xsV5rNVMQ2PJHAQUXnTuVZ7qMwRcgp+qNBJ9Q5W8yCU4qhGZcjdIvmJpm3/IiRLbpOqIfB0f0pdcTdQe5MxWc7Q85ULwX5/jB6NAYPKBfmkIvQ4OvMiwbmv70NoJ1VySOGCz4oF14aZYwuJcn+E+mewTjF2hxfKZQWgp+kZogTBNRc7HI0ArUrRnF2zquv4q60LaMwFGyi38ITvWkWoSUpIK8OWv88pSOb/5bJKivAFi/kBRHFx9CN4tk6rQVR3UoN1A4vpdVX6PBfz7jnxRUtBD2bTxFVTGzKY0RQYW7xLa5rTCSTeo97vEXrurRrszu7iywJN2QoFTmzK2aL2cEUZdKGOgrCSRbWqZolK71xpEfxRzf98womzAr5cUpEb1Ar54L3sNQxPtoXmsCiPReGuLTC5fHDVJ3qCzsqBvZ08UR/YbkJWYUc+8u+fPT6FBmnwNMtD1Pk6eiXpK8ALHCx3zz8SQtzdGxiaI/OD+pNPizEsKvys5+sq5+6hbUHI03DdyBTZ/Cb18u6LP871Zy/3WDho+3/iC+zTCDI6BYK6QMKGcYqmUgO2SI2IzBreLfW8t+M09jHxK5kiJUZYo2nN5lJWpbulT9LovZUddSw5lhgdkuIPoo589wIfZu1XlLsRPHk8FbtYsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199015)(36756003)(2906002)(44832011)(4326008)(30864003)(6512007)(5660300002)(41300700001)(8676002)(66556008)(316002)(86362001)(6916009)(66946007)(66476007)(8936002)(38100700002)(478600001)(6486002)(6666004)(38350700002)(83380400001)(26005)(6506007)(52116002)(2616005)(186003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WExDR3MxL0RwR2F1L3V1ekVrTEluYkNHQWFEdEttSXc1SjZSL2VMa3AzWm1I?=
 =?utf-8?B?VnJRdmtCMzRhQzF5YmZLUWw4U0psd1JkdDRXb1lTN0JmTzJlYlhDWnFQeUcr?=
 =?utf-8?B?OG43dldRQi9PMVdudisvRjN2WTlmOFF2bk9xS3BoeFdYbXM2WkxHVk5lUzZl?=
 =?utf-8?B?Y0hBSlJBOGRHYVc1WEdQUFFnUVFqVWNzbDNpL1FUUFBWTXdEaXQ5eUEvS0c0?=
 =?utf-8?B?Z0lXOGVMVzRjbDVnbDBUcWI0VkxkY2Y4VkNRNWpabkYraThlS3MzTmV6dTJ5?=
 =?utf-8?B?TkEyTmZrQlI5Z0kxM0VwTjhLM01NQnJmYnBvT1RzYSthdm5NYWNZbmppNEYz?=
 =?utf-8?B?bnEyWjZyYytBVVNmMkk0ZGRJd0Z4b3gvdy9Ja1lYUzluYlkrUW5FQ1htVFNB?=
 =?utf-8?B?VXFrcmNhQ05GMWVrZlZSc0JlaUExT1ZlRVJJeENjR0RIeGhvbjIzcG04LzA0?=
 =?utf-8?B?dWRCSEkvUSs5ODVHR2swODluczlVbUI5QjFFTFVCVXc4N0JjRE9kRUFzZzJ1?=
 =?utf-8?B?UWk2QzlMZXR2Y2dXalFxeXphQnc0RkJmWDRrZnZtdHVUcWdMaC9mbmRPWUFw?=
 =?utf-8?B?U0JoSTlYalN3ck9YdzNxTEp1eE9MOUVYN1ZLaEZaOVVmaTVZOU5IMGN4dFZi?=
 =?utf-8?B?U0ZqODhzYmFpTVdBMkhPNVhuWTRZdEdlSHN1cmZjbUdaSlQ2TElpZkVVT0hW?=
 =?utf-8?B?UExzQmFoZE5wRGkvMENCTXY0b3h0YU5qeDlwWXpJOENKY1MxTlNMdkxNMzdO?=
 =?utf-8?B?MkZQaDNXR1RnV0RHTHR1c0d1S3RnVUl2eE45aE40N3BMcnFjYTM5V3hTSm00?=
 =?utf-8?B?bTBHWURseXFaY0ZXaUt1aVhremY0VFA1ZG9mVkFKWGgwNzJjeUM5MHdVZ2ZG?=
 =?utf-8?B?anRoeVdMbHVWWDZ3K3M3Y1RiZ1BlWXFxS2pSTGFvY2dzTGZSTldlOXpzZG94?=
 =?utf-8?B?S2F0K0lLenUwOU9Jay9mYkY0bng2RWtNK0RzdlNyWGp2U0t4dnVBdVBZNmkz?=
 =?utf-8?B?RXcvT0pZUEIrdDVQZGRzNXpRd29FSUk0aTRmckhRVnZ3dlV6a01sU2wwRks0?=
 =?utf-8?B?a2ZDeE1oYmo1YkEzKzhVZTR3UmZyR2RXVDI4NFlPelEvK2VrSkgvOHJaclBZ?=
 =?utf-8?B?SkxCT0lJN005ZW9wNHhQLzY1ZzMvWWNCSGhmTW9zUStzdWMyYVJlTXRUNzBO?=
 =?utf-8?B?a2NveHl1RW1RblpTQm9SZms5L0tXZXJDVkZUaHI3a0w3cHJzajNIOVRRdTdR?=
 =?utf-8?B?Zk9tcjlycGEvYTRyU240MkJoSlc3NTlLMG9BRCtYNGQvODJsQURPQjdQelJH?=
 =?utf-8?B?YVQ0ME9ock5vOEg2VWl3NlhZaFVzUzBjNVE0dHZJWHlHb1lJVFExTDUrOTRi?=
 =?utf-8?B?ODlGaVZ6dm4zVUlQQmZCbkZKSUp4VGF0YzBMWXQxeUR6ZTlkZjhPK0JWcTc0?=
 =?utf-8?B?STA0OCtSbVR4L0R6WGNid3pFSkNYSmZMeFVLMm5HVExudWQxR1RJSDl3VStM?=
 =?utf-8?B?RUVLRG9qcXVLOXA4UzNvZ1RzSE5zR0xIdURjKzNjTWU2RG5nZVZSUGdkWG5u?=
 =?utf-8?B?aDFzSjBEUmxyZ2RmTFdaZFRtR2dEWTZWQzRrendYZ3BsZm5wa2NrZC9iY0xx?=
 =?utf-8?B?eXlabUNGVng4T2lGM2NpMExKemNObTQ1cnVia1FIbXJjeHkxV1phT1loUGFz?=
 =?utf-8?B?bmMxTjlzWThld1BrMjJaZlh1MHVRQytXOTBZeWQ3dGVKc21XZlYyV3Z4bUxq?=
 =?utf-8?B?ZFJlRVdXRmxXaXBtaGR0dTBwSUNHZlRUN0VzWC8wdEl2YlZiT2laOWxBalJS?=
 =?utf-8?B?bnNhbUNDM0dFdS93SUlUb3QvN3FZQ3dvWUhiUnQybUZHNzVhZjJ1Yk5id3Ex?=
 =?utf-8?B?ajF3YjM5QU05T0FtcFh1Y1RiWHlvZHMwNzFvVFBDT1g2Z1EyeW1nak1UR0dK?=
 =?utf-8?B?UFVXWW5RTTBDS1FCZkh5cEJVNHo4blorYXVwR2VUWGd1QmFnV2ZqbnRIOWs0?=
 =?utf-8?B?QVJsQ2ZXY0xwb25Bby9hclBnZXR4OHlLVmVXNS80eTlXNGs1NFdGY1NFMVp5?=
 =?utf-8?B?SGliN0cwQS81c0hxb0kwQTAyOGZpUUxFN0ZGbzFQM3AzQVYxMGFWVm9BRjBG?=
 =?utf-8?B?Zm91S2ZhV0tYbEJDRmdiVlN3U3h5ZDBQU0htSE9kNEFVUEwwMVk3TkhpcHpt?=
 =?utf-8?Q?qsHvGqwaMmSNFSnxXUVOlrA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 803d3e2f-ba73-4342-c740-08daacfc9bc3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 09:23:37.2957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0A5RhK+MIxa8BhP477zfLBguRZhdaqyZzuiL6FjDe7UORSwh4ihSETFGuFJKN3GpXP16WhgwM/OIHwVmWoSTV6nLU8f5FnQQFvbidWEQ0SU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6466
Received-SPF: pass client-ip=40.107.22.109;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UFS supports FS freezing through ioctl UFSSUSPEND on /dev/ufssuspend.
Frozen FS can be thawed by closing /dev/ufssuspend file descriptior.

Use getmntinfo to get a list of mounted FS.

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
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
index 932b4e7ca8..3cfb9166e5 100644
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


