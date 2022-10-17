Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A6600814
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:50:53 +0200 (CEST)
Received: from localhost ([::1]:48114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okKtg-00034y-8h
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKYn-0004km-64
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:29:23 -0400
Received: from mail-db8eur05on2129.outbound.protection.outlook.com
 ([40.107.20.129]:65301 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKYk-0001Je-F5
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:29:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnSc399AaTP6gCXQXwCh25yGCoyE6plmgKOeaaCyCXV0XdmNSMsoGb55PY8TddHmhMDvfQvUu8VAMU7MzVmNkPi7dDV3/JXlP+yErOBNiM+qJi7bzZmmqJlI2Bt1D1jxrGd3/A0ns3AJZ6RD6P/0DZsXVQwKlDtpkZVpH3wFBhuu9LLhm9FuLgSckRzzV9g2/uXEigri7IhDwn+Sf/aY9+YBbaxUrJVUQ4QgV0r/SW4SJA9bCneUvGCXzLcR+nEP4mlgY/n8sb9e+B+glgBkMvCtKim76AAaBUN2++K7nmZ6U37GAaaNeX3E11m28zw0Me+XjVFr8ddwZ/5FHCHjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90yaN/ZPijff8/jFBt2y179WRMXRaLZAWtUrg5jzAEg=;
 b=nOQ0zku9RKC0T3YLIFbrF8Zp7Sz815z0yW9yEdomEr60iKgsnUWRfTzaDRPbBIaqfuF1L6anAzJ+BpuXQDbeGqUY6jnLZzdkU2Sy13RIQALhzxqTeTO52teKgiIPKLUWKs9gn8flnBggooDCyHvBKX7ouMbk1u5EiQwzgL3OBbalRdNCSkuA1Gd8YvFEnLqn68ScpLc9DLhU937e6mvH2DBDB7M0jorLyR1R++sKRYV612QH9t+BPmUETTq9fVbOuj8hi4nPi5AqABlu+vfiCotfO/CN9LW/xjTU9bsGFWzsLC8sZL7lX+qZr7Ft1XxAfru3p3IA/ySD24+uGPg/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90yaN/ZPijff8/jFBt2y179WRMXRaLZAWtUrg5jzAEg=;
 b=sMDKwIzdAvgXlcmKHnCQPzF8c/R/PmZCiNjChIsKZh/OnIPvB0jSNTL4r4kFEaq+m+VIAQz5TYeGkS3Dr+hXQoZdxzYtUotzbsq5ushCeJbYYyz9aevlKm0hloLI/rv6nGb0kCNTHbPjiq2agDV9abtzUBKSnbavLqrZLvvk49CnoPrSD01pMUGyrO6FLrHipaye9MMVPLHof2Ei74ZU3piH+9FeVyXCcdrHfVdhl8FQDRAdS7oDQ+HTbX7OGFvfCvnwSDGt09C6dqeyyrZ4q3/ghcfvCgmHUisa4TlYucYnOoAj28d2XIML3fCwk9sVAIGWrmEJASz1zil5vc+nNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS2PR08MB8286.eurprd08.prod.outlook.com (2603:10a6:20b:555::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 07:28:38 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Mon, 17 Oct 2022
 07:28:38 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v5 2/7] qga: Move Linux-specific FS freeze/thaw code to a
 separate file
Date: Mon, 17 Oct 2022 09:28:20 +0200
Message-Id: <20221017072825.72867-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
References: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS2PR08MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab22149-e855-43c9-8b4c-08dab0113526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EZnxSaxHjIKTUp9ky9pW52pJsYKA2rU5KnSGTtbODUJRzcBCL+De3eHFqb/Lm2SVNJ95/TK15kmwcegZoUGosICrFOba8VtKn98RcGtUwm4I7bXBhwMBNeClvmro8JNBXhWENePFY+bOL3PhTkmavAVjvHWCcFREZqVBgU8jfSeI9FEvSBawADVnY7kq9pI0zY2I+rn7dGUzSnRNKb2tGt+zOkuZ9cmmqSfV0D4TYxbGo9WceWXinYiwQ/Olzo+2w0ADgcsxiTfqJKBHTN0MKHNs8vyWl60EVJ3xdiXkJ6pCTq2D5fJ7vQNIiVewoU913Nt93UBi42+KY1HNm81ihm1Noq9FRcMWNkfcdSFt0icP9FkuMSlgTvxj6nD9PDRhuNCeF55q+VSNc9mu7Vna7Iugqwq8GtW0AgxIn80tJT6WYs0NGYD94uV9CCIQrounITPBqnxS4smz2oV9zOa0zdOLF1xEegsf0vUsTlJ0z2oged3xzRfJ6EEn4lFZdDZiCROYyY5A7nP0K7MOlxl+J0bxGOzIVqU6mV0gmKnPe9fwfBRtM8jV+3gqbcfSxrVFYzwu4hr4l4KRxDZ1mEmgI4JBSsIoV1kMuECP9iMz4BU4wLksx9+9CvYWPQp8cmGWliUumOoTiglsIuG6Tb6CHQ1avJoZ56/B7JFWCYff6niLrc4fKvCwU1dki6P0WVCatWIgK/6FB/glUJTtir2e/eI6XInUPdszHPiRDFimHJXx6DFzaqxaDwxl5lbDvLW+gV1F+z/BhKZZC2VEhdcDjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39850400004)(396003)(366004)(451199015)(30864003)(6916009)(66946007)(8676002)(66476007)(6666004)(66556008)(36756003)(6506007)(41300700001)(4326008)(5660300002)(316002)(26005)(6512007)(86362001)(8936002)(83380400001)(2906002)(2616005)(38100700002)(52116002)(186003)(1076003)(38350700002)(478600001)(6486002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDFZVnM5b0kxQXhxV3d5QXVnQ2RiQ0pDOXhmaFhyV2w4S1JhaUVtNHZQSjhu?=
 =?utf-8?B?M0FPL2ltR1JPUWJGVlBQcFIzK1NqQ0wrVkRka3pWMWx0MVBzclJQZ1NtZStq?=
 =?utf-8?B?MTRDM0hsVHpRU1dPUkVJLzhTbzUrRVJtSGdyalhGN3pMMXFxeEZXUWZqS1ZT?=
 =?utf-8?B?a0FvMDdMbGpQTmVDRVJHTXZJOXk4RXh6TWhLaWJoeXJlRDFaeHpwcEMwTE8x?=
 =?utf-8?B?ZEg3SVpDRWZxcE5pT1JQREJFRkRmK1R5RDdaOTIrdEd6UVVFY1hJRlozTmxa?=
 =?utf-8?B?Ykg3OVFKN2h3aVUvWmV1YlZrZVBjNDdjb2dyaDlvWUhYR2dzdUtXSlJlZzc4?=
 =?utf-8?B?dFBMdWxqZ2dLWHRDUUVyL3N4Y1VITTlDRFVrQ2I2Vm5tUTZNNTNoTG4zK2lV?=
 =?utf-8?B?OVlpYUZkYVRzNERQcklobDYvVHFrakIwU01ldktKQXJaQis4Z0lJcXYrTmgz?=
 =?utf-8?B?ejMzMVUzYkFVR2VRbURPMitydkI1VVdkR1U1SnpCMVRRM1RxMko1L1RUU1pv?=
 =?utf-8?B?Wk5DM29qbi9Rdm91ZTk0bFN6Y2J3aXhDZzIrQ3dXZERYSDJoZUtkdmV3blZ6?=
 =?utf-8?B?WThXdDRCRFM3RTZtNTh1MnV3bTAwZVhqY3FwWDdhWmxKcVdKZDVJVDZMbG1S?=
 =?utf-8?B?aWxReTEwazNiUHRMU1M2MnB3elZBQlc3MTcvaGJYQ0MzWmxmeitzMllFZ2Rq?=
 =?utf-8?B?Z1pyekF0c0JwRUhzOE5jL3BHNlM3YW0rZFA3TTVoS1Y2ZmdCZ1ZyNEtzTFZR?=
 =?utf-8?B?cjlxR09RS0xXTnVZSHNJMkNUNWh2TmlZSUNIUkJKMklkK1dnci9XY1A5STJB?=
 =?utf-8?B?N1ZTeXlJVjJhK21RT0xTZ0M5eGNVMnlVN2JsSjYxUW5SeCtSb1pnV0pCaHlT?=
 =?utf-8?B?SFhINDNnVmpBQjlwWWFDOGJDQTJnbkRnRHUrL1czM1hqZGFEaGovVy9sSW5F?=
 =?utf-8?B?NzQvMjJqWDhRZTlNc3dCNVhtalloRHUwWktFbGZXdUVUVlFwUTJCWENzU3lm?=
 =?utf-8?B?dlo0R3FYdjZsTmk1Ym5udEsvZ2g1U0VORDhPMjY3NE1RSWZIekNKUExTaGhp?=
 =?utf-8?B?U2drWkRHMUV4YWdXajF1TnZCTVRsNDZpZmlFc1A4U1pSU3A3MG5wcjNCMXV2?=
 =?utf-8?B?bmU2UnF2Y2E4dnN6Wm04Qk5DK2dPNSs1YmdIeVFlT1g3S3V2NEt4Z1ErK2hj?=
 =?utf-8?B?VzE1YUVNUWZPZDlBWTFDeVZkWXVnTkJmNWpHSlJPRGNzRWNGQ1BJZC9WblBs?=
 =?utf-8?B?cmF2R2lvR2I2RHk5NS9lQkY1dWp6Uy9XQkhNM3JWdnZoMFNibFNqTld4NE5D?=
 =?utf-8?B?cWR0RUZpK1lFelV6TjNkWVp5a0E0blpEN1JFWk1OT1hWS0lGK0tBMXpEaHZU?=
 =?utf-8?B?MEloN0wrM3RBRDFzVWZJSVJxTnc4L2FPaktwTmNlOEdaZVBpY1B6QXVPNHo4?=
 =?utf-8?B?ci9NL29DdVV4KzVRcjFnb2piZ3h5WXR3cFNDTW9vQ0pLY2QzUTQ2SnlKcGxt?=
 =?utf-8?B?Vy9GbU05U3RRQ00xR3JpMUE4bVY3UGo1ZVU5QkJiMjV6TEs2TTlzaWVXeWFQ?=
 =?utf-8?B?ZUxDQndvWDkwZ2NZbnhRQnppbS96dTFKVUVXMURtL09WTkNHR29PMHhlV2hO?=
 =?utf-8?B?T0ozTWRCTThmYlp0YUlWL2FENHFxRkxWMlAzbmc2MUhNSmZCTmdEVDhzQzRN?=
 =?utf-8?B?MXhQZTNRSGJnNVQrUDMrUFlBUm0yWDZQSDdZb0k5UWJwaDNFYWxPb3FpU3ZC?=
 =?utf-8?B?YStwTFpUMmF2V2ozR3NWQkRsSFVCTlR4TnMwQ2lZNStabnNaM1Y5S0NNcXJF?=
 =?utf-8?B?eHFEMHR4eWFjUmtNUW1UMEZZN0tjQnFqQVNsYVJlNHRubHJkc2hRMXJEUUNN?=
 =?utf-8?B?Y21KWXhTUVIzdUo2ZUtlN2NzMmNhV0ZWTElCUVBlcHFvWXRvdlZYK0FJTnpn?=
 =?utf-8?B?SHlEOGRPcUlHOE9lYU1rREhMRVA5dWdCcVdhUmZiSEJkWlhFTGt6T1htSENU?=
 =?utf-8?B?Zmp0UDk5Qi9tVEVCN3ZpRGlYV1BvYWJaRkxKa29xNEU4V3h4Lzc4RHVvTUFU?=
 =?utf-8?B?US83M0oxeUhRWnZqc3B1NzBWckFuT3hXcnpFVGhNZ3JReW5Xb1AvT244RmJ4?=
 =?utf-8?B?Z0RibEphSGdsYUJEa2NpT2lUN2pUSEpXSnBjMzhjYk4rM080bEkyWDlZSXYr?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab22149-e855-43c9-8b4c-08dab0113526
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 07:28:38.0716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LWIRYraY8sJ0sOhEfL8v1RzY1u+dFUSczK0YonltkSUJMAYNKyhNxVtRD998X0eaIKj6nuYUogV/zPl3jo3OMPj6LKnWNrmEeAXgFJBkIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8286
Received-SPF: pass client-ip=40.107.20.129;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-common.h |  34 +++++
 qga/commands-linux.c  | 286 +++++++++++++++++++++++++++++++++++++++++
 qga/commands-posix.c  | 287 +++---------------------------------------
 qga/meson.build       |   3 +
 4 files changed, 338 insertions(+), 272 deletions(-)
 create mode 100644 qga/commands-linux.c

diff --git a/qga/commands-common.h b/qga/commands-common.h
index d0e4a9696f..cb51b1c6e9 100644
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
index 16d67e9f6d..d24f2fafd8 100644
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
index a0ffd6d268..932b4e7ca8 100644
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


