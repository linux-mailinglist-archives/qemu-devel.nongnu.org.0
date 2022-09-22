Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6A55E65AD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:32:44 +0200 (CEST)
Received: from localhost ([::1]:42932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNFq-00082a-SQ
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obMCi-0003pJ-Ok
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:25:27 -0400
Received: from mail-db3eur04on0703.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::703]:39940
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obMCg-00082M-FJ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:25:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORrYfGohE1TTYfSv88zkOxHCk8q/w/KR9fa3lVamZohp5Bprq0acTDCKMpqN3faCPWhk+jLNbBls46xQHOcpmE4bQ79q8GRZ3Ohl28PECt2V1l13eQOCV5UCF4qPGJM0LWbmRjXl6bcgRgkC9qQP+ZRXmNYM/dNSlpvBtygp1ruNdiEqTbgIrgiCEZ2IRIjX2CS3Dv/opBjY4MgVHumSyyTh3nDham7wcmS5NSJ/iulvoH2Rj1A7AurQ8E99dQyU03PmSmYvsSXQjTrVRabsiSvMNM94ZSGGH8R/NjAUgyRHm3unO/HRIH1Ks2iOd/xyTFi+5IFQNYA2UvRDpu4Dwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFrv1ufMIEuTjrrp9MSpxURObbKKCc+IpHyH3IZgoEc=;
 b=YfDKzriKk6Cl3T2qNTq8oCsu+b6LF4xFfTzKYD48vAfvtGM6Px859X3d8OvWOuitv54Wm3dUIGVNImymQIQIySLY9yP1z7qWx1y+LMqUMHeTPI+Qti2JpgefceQsLstloBUaNAgMXxCSJuF1J2bSTXDBsE87tEVdlHPqReRdyxXqRZZjk1SxNa+63LxHiViygqLUqcTRTbIomDCrnXylTeThPIpCEMYUg4imqUe2hlHP+q1HZPY7Av4tvciv1c8q5o/7lOfpzzYHIQJPm8BNh4mEYUn7GPypI5mTHeWM+n1+4zhL5Qowmx0Kei9lhRoFx5UCphgg2+G7r6XlCd/x4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFrv1ufMIEuTjrrp9MSpxURObbKKCc+IpHyH3IZgoEc=;
 b=TyNVFUIRTv4Hs94k6IhEyJM2GSx3t5S58XfU+2JukmXtJLgbYIRpPmlWqNFYc0+vVkO3TpU0aKvCpb0+10GsujxDa43FssqVtYdS2AkhSHZ0d44YfKeioRXGyiEdiZTlkHnXZVuiM9r+dXmSTgp+IqPrpYMEyjgsL/+LY//rYB1xdcjIofSj8lTbLcu7UY6kLI31M/RnwegsGQTvxmYcQ8mO8/YNP6Jiuq/welutpOuGCSIHOrWFMJxklWEW2DGWNofj6aQFP4f9JXnuv/0iOsMeODje/akPkv59npfVpcKpHMR8NM4i0Prvjiy3ufDwxpGcHiQjehwTOpj1Jwt5eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6480.eurprd08.prod.outlook.com (2603:10a6:102:155::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 13:20:13 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 13:20:13 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com,
	michael.roth@amd.com,
	kkostiuk@redhat.com
Subject: [PATCH 2/5] qga: Add initial FreeBSD support
Date: Thu, 22 Sep 2022 15:19:58 +0200
Message-Id: <20220922132001.940334-3-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: edd79205-a00b-4666-4ae2-08da9c9d2e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DGLHHiBuAJSUEM6adHfNOsb84RP+TlrHJ35Kju/PkJRKVVGKyt1KXRXfh2MA7yJldU5q+4McYRb2erdUBnl1iw3snEwrr8t1MMSIOD5uzKznRcCu59hExvWW2encr/xaLyDPLDFBUdyt2ADsODwGjxFs38akOmWr6CQCGG6UixpfsZLq7zlcGUPq5h4KFnQa9qAD+Dewxm0D4EkKTprTAF2mw1H1JDmgizCd+kSFr1vfjhMJsgHT4+eIBunpkzQwi96mAt0v8l0PC4vhyht4FKvJGss1/c4kVFBRz7giA0bdRJDoqkIR/Uc7D7R387xG0tDvCVXiLqJ0zIXGXMP2Drfw/I7Our/xNbc5TbxJcQv+gnVhi8438GmGZAne9LryhlVfNR6GJihn2FB0msWjzyDE8epqKrmly43VVALnN/Y83QyeH/QXhNbMqTMusqLjKG3je1mWid0FHH6ZCrIQ0XWRbaqrSdgeef57zC2JTUz/EUtAVUxMsR8YTwR2KRtr8AEXopdmeYd+oZIzs+Ft9x+578s1gkHpq+zi6u0Ze2bDMcv/w5EvYf8tXBqt22o0td+UPX33+7m+nYYCn9JsOR+zwAMYS/p+96qu5SAs5irvyUoitUD5qNo0AfTmLba4H66Sg+kr5Ws2APwLTKDv8klqm+JR6kKmFC8svQUiz/HdqQ8eX5vLr4vi1ZC0iJT3o0q2aDOSFrRsTJEGpX2r5lPBCYfutmYaIMxrUwYmKJQtGvpkZ7an3Jjf4q540na4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(451199015)(41300700001)(6486002)(478600001)(6666004)(52116002)(36756003)(66476007)(66556008)(316002)(186003)(66946007)(83380400001)(1076003)(5660300002)(2616005)(8936002)(26005)(6506007)(6916009)(86362001)(8676002)(44832011)(4326008)(2906002)(6512007)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+8bExo5Pkr8dJVisy6Aq0zYKLs7bW7ucu1M5zdvBkSFwCkFx9k8zHdGiD+jX?=
 =?us-ascii?Q?J4sL5/6I4ZZAzpdAPACrQtlSCB8vzJ7V2fT4gjBjBydyM7xIjpO0ZjxectoP?=
 =?us-ascii?Q?CvfV3KPvqaPPADdvj3eAcO+Kv/x3A20pY4FXO1E7CVNja9kzEMpPCUxuhVV8?=
 =?us-ascii?Q?mUW+s4LyN5J6D+yBz6L8xX6qoJTAaL0ScTunBr4iWJ7OsS5TDK/dzu1IZHbN?=
 =?us-ascii?Q?HcZUySk4iJv4uJi2v897WrtX606HSZo0sq8CuPSaGvk8hA+WJPSk2awTeaMI?=
 =?us-ascii?Q?+YHGr+aYLDfT2oSySF1PdPwIXsZc/afkbZvnf6IBnJkPyeE12N4OGvxBl0DB?=
 =?us-ascii?Q?DmfFqdb24+0YLHXlwbPcA4PW8qorJ1WP5yMhBNEKbaj/kIBGJP1TaV1pwt+C?=
 =?us-ascii?Q?UPwLHRilVCMHzxOylT8RINNPVBMpXULYRBWfuSvFhMHj3vw7DIUWF5gnrq+O?=
 =?us-ascii?Q?5M6lDxjbNVGVcijk1dybPXMUDGJtHdLLXSOXU4pdtsdBipnNy6zswJSIqoBV?=
 =?us-ascii?Q?rT2krQ2IivlecPq6Ru3U4TkuNmlaDTN5e1qBMN7RuGQQP7WRGXnogGQZFSLV?=
 =?us-ascii?Q?6BDMbg4Vg96S/dPJpLaqlNFdYODb6V96noTt5jzlaXtFz4Se8wOhffbkdnVq?=
 =?us-ascii?Q?v9M8A9HEp6gug2W+L+tyWWB9MV55c55CdJqhqg10+hh6y/bOXDFqrFPCuQgc?=
 =?us-ascii?Q?weyHmICF7odapz2VDMLN7l7QvCd1Pitp39DL5EalXau7Hsa8qDsmLlJbjfAM?=
 =?us-ascii?Q?wN2LqjcC8P0NCuc29Dbh17udwzBxJdXpRfIGSd+VdvYIQzyvZcNFlSW2p1Yt?=
 =?us-ascii?Q?OQCBXCfGtReBiRjKPtyA1geAGAdwgF8AZj6yVqRhI3b0naV72HVQMmJjC18H?=
 =?us-ascii?Q?b/MSSvnJ9OqPSSwR6UIKg/WD42tEu3jHoy4m/v1PkYzzEFgYnpjonbcwTe10?=
 =?us-ascii?Q?EyN0yoDL3ljqL759ob5kHPreaStIfiUWZBlYhkKR1Ezcyzun1A+Ul5iv/Ora?=
 =?us-ascii?Q?1YceuAyOd9oG9gHlLfckB6xUpjvp/pDlx48DZwXw9SdUZHgDj0iJ7Gw4E6ke?=
 =?us-ascii?Q?whIvLSPrwUDTsmjgxvFybT21piMAHz7V5WPvTPzyEVQdnaFLqoYqureDNZzd?=
 =?us-ascii?Q?mHCoPluken8wNkiYFiwowXPzbqYKU1TNMPAmEaxLV0D2nEUhfzDMIkv1ZOGZ?=
 =?us-ascii?Q?7h0H8HPVcKBqzYpNV/eMB3/YwAugjS7rtnTrjyU2GAg1npBU/CN7W834jBEb?=
 =?us-ascii?Q?637xne6K6Jw4/h4CjlDIfc8MqPJKjPLGjo8c7l8ANGvvmZ2bK6iCe9/9efNc?=
 =?us-ascii?Q?NliIyJXR1l6S2lCchuX8iM4p0ZPX1bypAvVA148QrNJaheEi+gEaooEIbx6A?=
 =?us-ascii?Q?9oSB+J+Fzuo6StEYnyPQ6jGD5jnx58+Wf1D76Zb7zBwxnNpR+Hcb3+WX+uM1?=
 =?us-ascii?Q?7eKatSskyU9O4YTyevt4rGJ7ayk3HXpgarRN3a5YGM/+fGQx4vquSklrZ9I3?=
 =?us-ascii?Q?BD4+X5lQrvxx8SNEWN4ONSTFoi+qsFkaXl34ZiiDcsrqsOITN+UCRdmKyiZh?=
 =?us-ascii?Q?SlsXWrsw+HOwJ43HHr6jX4y8S668MVXkIB5gN8kDVub80pWQO4fBCbYTu4Sb?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd79205-a00b-4666-4ae2-08da9c9d2e72
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:20:13.0637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/IRDEq/sSnhKLfCCf21BOO/thSA4lYJlwwlqs6xdexuTJz1uwyxI5TTjsxlrlgv84zPCGvDYky91P/BFVG2sjPl4kaHncJ7iV01+7eeys4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6480
Received-SPF: pass client-ip=2a01:111:f400:fe0c::703;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Add commands-bsd.c file with dumb functions, fix device path and make
the code buildable in FreeBSD.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 meson.build          |   2 +-
 qga/commands-bsd.c   | 121 +++++++++++++++++++++++++++++++++++++++++++
 qga/commands-posix.c |   6 ++-
 qga/main.c           |  11 +++-
 qga/meson.build      |   3 ++
 5 files changed, 140 insertions(+), 3 deletions(-)
 create mode 100644 qga/commands-bsd.c

diff --git a/meson.build b/meson.build
index c2adb7caf4..574cc1e91e 100644
--- a/meson.build
+++ b/meson.build
@@ -75,7 +75,7 @@ have_tools = get_option('tools') \
   .allowed()
 have_ga = get_option('guest_agent') \
   .disable_auto_if(not have_system and not have_tools) \
-  .require(targetos in ['sunos', 'linux', 'windows'],
+  .require(targetos in ['sunos', 'linux', 'windows', 'freebsd'],
            error_message: 'unsupported OS for QEMU guest agent') \
   .allowed()
 have_block = have_system or have_tools
diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
new file mode 100644
index 0000000000..c1e3ed13e9
--- /dev/null
+++ b/qga/commands-bsd.c
@@ -0,0 +1,121 @@
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
+
+#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
+bool build_fs_mount_list(FsMountList *mounts, Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return false;
+}
+#endif
+
+#if defined(CONFIG_FSFREEZE)
+int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
+                                          strList *mountpoints,
+                                          FsMountList mounts,
+                                          Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return 0;
+}
+
+int qmp_guest_fsfreeze_do_thaw(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return 0;
+}
+#endif
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
+
+GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+void qmp_guest_suspend_disk(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+}
+
+void qmp_guest_suspend_ram(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+}
+
+void qmp_guest_suspend_hybrid(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+}
+
+GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return -1;
+}
+
+void qmp_guest_set_user_password(const char *username,
+                                 const char *password,
+                                 bool crypted,
+                                 Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+}
+
+GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+GuestMemoryBlockResponseList *
+qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 0bb8b9e2f3..3a1055d5c3 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -31,6 +31,10 @@
 #include <utmpx.h>
 #endif
 
+#ifdef __FreeBSD__
+#undef HAVE_GETIFADDRS
+#endif
+
 #ifdef HAVE_GETIFADDRS
 #include <arpa/inet.h>
 #include <sys/socket.h>
@@ -763,7 +767,7 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)
     }
 }
 
-#if !defined(__linux__)
+#if !(defined(__linux__) || defined(__FreeBSD__))
 
 void qmp_guest_suspend_disk(Error **errp)
 {
diff --git a/qga/main.c b/qga/main.c
index 5f1efa2333..22b3c0df11 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -45,9 +45,14 @@
 #endif
 
 #ifndef _WIN32
+#ifdef __FreeBSD__
+#define QGA_VIRTIO_PATH_DEFAULT "/dev/vtcon/org.qemu.guest_agent.0"
+#define QGA_SERIAL_PATH_DEFAULT "/dev/vtcon/org.qemu.guest_agent.0"
+#else /* __FreeBSD__ */
 #define QGA_VIRTIO_PATH_DEFAULT "/dev/virtio-ports/org.qemu.guest_agent.0"
-#define QGA_STATE_RELATIVE_DIR  "run"
 #define QGA_SERIAL_PATH_DEFAULT "/dev/ttyS0"
+#endif /* __FreeBSD__ */
+#define QGA_STATE_RELATIVE_DIR  "run"
 #else
 #define QGA_VIRTIO_PATH_DEFAULT "\\\\.\\Global\\org.qemu.guest_agent.0"
 #define QGA_STATE_RELATIVE_DIR  "qemu-ga"
@@ -1475,7 +1480,11 @@ int main(int argc, char **argv)
     }
 
     if (config->method == NULL) {
+#ifdef CONFIG_BSD
+        config->method = g_strdup("isa-serial");
+#else
         config->method = g_strdup("virtio-serial");
+#endif
     }
 
     socket_activation = check_socket_activation();
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


