Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694DE5FD796
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 12:06:27 +0200 (CEST)
Received: from localhost ([::1]:50142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiv6f-0006w7-TY
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 06:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRO-000270-1I
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:23:46 -0400
Received: from mail-eopbgr140123.outbound.protection.outlook.com
 ([40.107.14.123]:28929 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRL-0004g6-5i
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:23:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vyv132ViO3qbhG//xK6vKxKPgFNxdaryWXZdUQEINBUP9vITlJQEhVeruOxBAZuw63s9ze2YBdKeMOMRByBZO4Ie20W7dz/oytiWdmRqe0QLCRracRdzsvAFz10geM7zCCZUj4iO8ORvxge4uh+UIFdZZLlDvUwzfxz1jCrvLg6O5yGKAIfqtppGAZc/R4dPh8+QuIYLp3pQqHtiTMh7nKcnCKHq6Ge3LVEnZK64rPa/IG5hzkpK2wGcmJG+iVBqORouy4AUskUQepJ6P3o9EuzNNTr//0oe8eGWpFli4YTeH8+uJ6ncsMmqU/c1E5cl8/d3hJs6uFfJObp9a8Hucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u15BCkbSjlZVJHbXgI4URmaqBqsXo8JWEDlk0o/JTJc=;
 b=GGa7vNC2XHQdcu9QZ/ZnOELmjgTyV8QcKTdMfcxfFtBQVe6NM0knmqgVwHUijr87KRSCvpyxQZFHYe8goGuy+bIAOFNyDNA/lEx0I4I2I9OFAQPyt5lfrMtCdrbDpU5HQkcrezMnt4xfCCcXrKfesUXVjyls7TxiO/9MRYgrorTDZYq7TcM9VzsXQL8+77Ny9GpqWiZXTQ5OcIsNZUTRgvNVQkPRHX9VTyC/fu0bPn1kTiY/HOU5+tS6XH1qfpKEeHsI8cjjbgPkM1Ezei6CdgM5bhsV0uO9oSqbefDEmjzZiJiqwpLwuv7r3RhTtSI49JpZRv1QQrDdoJMI67jxFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u15BCkbSjlZVJHbXgI4URmaqBqsXo8JWEDlk0o/JTJc=;
 b=CTqKb1N13QSLEVUHQGk3BmQpA/NLX2gBbSvPWq9JH8bfoir9qbacANgdVyiL+fJHuqKRhDHU/FiYY3h8DTBofcgRwDq9N6lloSpfPlOBWvUcYO2s61qBNJARv9upEnrMJfCsDC2N3jr8nuXoIpJ6xfOcvN+wAK3WkDQDmquOaUs2xHinvVdmfqE8s49MfmUB4Wx0syBzMkTZkndv/8UP+1Ftg9QVrzKESHZtyNw4b+jmsATrrbaVmf1Ip8Cyb8VA3kcmsACsQ7ICBK5ERawqZjEZbcOYYHQL5i+IhXhB/0PwszngwT2pOpJouW61tQm+x1DEMYn1uZNkYXxSV0mUsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB6466.eurprd08.prod.outlook.com (2603:10a6:20b:363::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 09:23:36 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Thu, 13 Oct 2022
 09:23:36 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v4 2/7] qga: Move Linux-specific FS freeze/thaw code to a
 separate file
Date: Thu, 13 Oct 2022 11:23:21 +0200
Message-Id: <20221013092326.2194646-3-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: f8d7b00b-39eb-47bf-0281-08daacfc9b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gs3U4cr4oBS9jIfXtyMl/Yq1g0hAP9C4r3bHr7mGxltqNWYO8HMWWPMXzEghz8EHkn0KjV/IDCJdgcxi+XgVMml4lUVCk1ImaugQcUPF/2tt9HNI5sgKUFKkbpgR1uwex/6d3puVLZfNObIbcu+JI+SxQqdejQMdz5yDli/yBxyP5brzEHt2Qg7R/41T2Nt1jN3ZCX5mKcSK5kkfpIgZke4VQaQnDRbfLO1buuC754jzUn1GhHzEiT18CTilYgI4TrAFZ8eCjqflNRDiDCiKyjkyRqKU+fdQqQSIShlFKWQ+wUOZbGOlm831hP4JDR7esZOJmvuifLjovtSLeG9gmq8dxAtD1JAneOsXSmzZW6UC+5FoS1LJQO3DZpNh+sQaIV0Mrzx7mow03xupYAKOKLsOR/r/TKfSV7+BwWoPKsi1UhpRVsZge/QoLBq6A3MYUy2LAtrDBmz1qYSpSCwHc+UufSnJehAjf6GlAHKZkTY0/hKN9Nudg7GwcpOM5TqjmfDFaOr8/8gMjS3wUK4SWqTBx96tgnnaa1Z6cU0TTsEI0T2krXRlp0fxa/IfCSJ3v/WngE49qRMIpbELnZGnkqYj7UJ2bF/cgTz2nnOQL9ZnjfeW2oT3J+zp6GftQ1z4j3IXZ/mnefBnUDe8wAtGpmekJcbM6IqapG//My48y1ulOgEQW9cYGVwxUMtE+xe3izD1jl59IcWQP58FcfKDYl2gzpIdfoVL2DUXn8kuzRDvOEuhnD6eoM3b+98c3Qs/8/rRx2POoi4Obc1kkWk4tQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199015)(36756003)(2906002)(44832011)(4326008)(30864003)(6512007)(5660300002)(41300700001)(8676002)(66556008)(316002)(86362001)(6916009)(66946007)(66476007)(8936002)(38100700002)(478600001)(6486002)(6666004)(38350700002)(83380400001)(26005)(6506007)(52116002)(2616005)(186003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2p6TGVDcm1aY0ExN3hEazJWWVlleVdoYmV6R0RMSWtlcmFZMkFqbHdUYi9F?=
 =?utf-8?B?dDdpTXFPMWFZZmp0QkxjVWhqSkpURFB6NCsvZTNXdlpFZDlnVmFJcmI3b3dM?=
 =?utf-8?B?SjZZNlIxeEduazJwOTY1Ymo3Z0FYOGY1VGZHSDdoUlhKb1NIcTFWRFVpR05B?=
 =?utf-8?B?SWVBeG1NSzRVRkhoNk5ZcnlXcDQ5YktIYTVOaWVBMlJPR290Vkk0djdPTjR0?=
 =?utf-8?B?S3VhcExxZkxVUDJraU80bGgrWm1jWittSUlJK1hkUm55M0xEcmNJZGk2azM3?=
 =?utf-8?B?OCtaZ055OGljb0d2UjFEcDU4dnJOSlBzOGpmRll3MGkvb2oxT0gyTFhMUkdR?=
 =?utf-8?B?QVR4d01OUkZXdVQ0K0x4S1k0YXNJVk1IZzFESDVxNDdaT3NFTUVpRGxJRkZi?=
 =?utf-8?B?WU9iRjZHeFdZKzA0NDMxVUhSUzVUamF6a2JnY01UNzVHNmxFdE5nUmdnVmIx?=
 =?utf-8?B?WnZJUzFXc1ppNEdZdGRmcUhOcUFJK3R4ZDFKRkp3ckJ5eDBOdWNYOXJxcmpt?=
 =?utf-8?B?UEFHZkM1RFJla21nZU01aEgxdksyTkpmMWh6Nk56STdBMUhZM21WdnhDN3R5?=
 =?utf-8?B?Z2lzekJRVWxwSDJGRXZVb1ZaQnRmdnViQS9rc3Z6Vk5yRlFlY3JYUnBxN2ZL?=
 =?utf-8?B?N1VLUFIzdU5GdWRwV2Z3dlk2QnZoZFVPcEF6SjRSWk5OaEw3ZkNTNyt6Z0dr?=
 =?utf-8?B?RXpGaVVhZVI5WUFUcXRnQTMzc0dMKzVwNW1GeHhVbVBsdUNIZXBEcWpDMzMw?=
 =?utf-8?B?TjhrTGxGTlNwTERqZzhWY0NEZE5ab1FsOU1jeUdXQWJlUU9xTWxoY3h0UUQz?=
 =?utf-8?B?dk1BQWNkOTZwMU9MU2NxdVVFamdwTnZWZG1EQ2IybGRMZzVhS20rclNxbmgz?=
 =?utf-8?B?cFZxQS9UT0xkRmg2SXVFNjhuRml4UU13bUtxWTM1ME1hT1Q3dDhJWGI5OUMx?=
 =?utf-8?B?eGxjT0FrTHhtWUFGajk5RlVTb1lmbEpveURvMVQ5U25xaG5CbGJhU1grdlJi?=
 =?utf-8?B?a1ZyNVF4NDVubUY5dmpjQkFFNkQvWXJXa2hIaDJ4dkk3QkY0Z2tkdnh2YklP?=
 =?utf-8?B?NUtXL2JhcXA0Y1greE9hMGxTT0k0N1RlWDUvRVBoN0pmMjRXc1FEQnFmZi85?=
 =?utf-8?B?QkpuaTRydnpvQWZQWUNwaS9xYjh3c3BwWmtVSndkTlgxS2FFYUpCeXI4a2lq?=
 =?utf-8?B?bDZBZkg3c2VJN0ZuQStQbDR6L1B4b1lBYmZzQVdIMzNMTnBOQVRRUmRWY0pL?=
 =?utf-8?B?REpWc0EyaG4yWnhNOUFvdFBhRC9ta1M4SXB2WWFycEd0cXZIQnJRVTd5b05a?=
 =?utf-8?B?ZHVjREZiZDVWNjJ5Q3BrdDRFU2o2VGlTSXBYR25SUEFjK2x5T1lxM2VXSzJQ?=
 =?utf-8?B?N2VsRlU2Tk1ibTFTblRaTW9STGlOeThOM2hrZVVUZ1F4cmZrS1MveWZVUzdl?=
 =?utf-8?B?VVYxNHpCSGlSN2NJNXhzZTduOHpCS3VOZExhc1kzZDhLMXRaOVQrMFNHc3FK?=
 =?utf-8?B?aUtuR1ZPS3JRWTdRZHEyWUQyQkJ6TmpPdlc3dStEMm1URWpHVjRrelNtSXdY?=
 =?utf-8?B?U1E0NlVnM2VXcUY2QWRsanJsaHRtQThnN2tvRUNNQ0Nyc0J0U0c3YWQzM0Yz?=
 =?utf-8?B?TlcyTVJBbWNOSUc2K0h0UmJuc3dRUTc1T2xSZHlWeGw1eTlCblJsNWx2SFpG?=
 =?utf-8?B?V21RTEVONjQrNWI3WDc3QjlQMloyaUFIOHNYOE5YQ09NdDZGQkwyc0lLdFJJ?=
 =?utf-8?B?aTE3YkxjMFZMbWdJdFY3eWpPQmlFZE92VWZkVm1SSmZzMlE4ckUrQy9uaVVn?=
 =?utf-8?B?WHJaaVh5OVE0ekJkejdNekdzNVNaUWc4YmkvVFIxY215Y1I0NnIrM09rcmZw?=
 =?utf-8?B?azRSTU1xWTh6ZUdiSVNtSFNZc0d1TWl2ajJIOW5jTGN6OHFCK1hwSzVNaTMr?=
 =?utf-8?B?ZEM5WC9RYU1rTmNmSzhNZStDSnFzdEY4K1JZUWpIRllRcVhaUkJsTitGS2Jz?=
 =?utf-8?B?VmpCZDAxY0Yzb21jWG9SL2RuVzJmZ3VmOWFGUlpOSzlRcFNNbmVmLzJiOVpt?=
 =?utf-8?B?Z3pjR1Qxbm0xVnFoZHFVT05NQWlBZFp6OG9PKy9CSkNkcHdIdWZQNmdaRFBP?=
 =?utf-8?B?Qy9mRzk1SFpieURVUkJSWEM5aFVCMUI3RmRRaktjVS9VZEd0Y2psZmNRMXFq?=
 =?utf-8?Q?42eE2kqcXPo35X3L+S7nvrg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d7b00b-39eb-47bf-0281-08daacfc9b4a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 09:23:36.5900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YklAPgVw67EL7J6Q7M2luHNHVuri1mxUG4XORivCr9d+4yUZ9x9t89NzpS61Iszv53wI3RREe9KmkHIVuM4hiC9ZJvSwu1TXfue2tcMd5lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6466
Received-SPF: pass client-ip=40.107.14.123;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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


