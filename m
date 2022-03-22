Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939854E3CFA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:52:13 +0100 (CET)
Received: from localhost ([::1]:41982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWc7W-0001tk-By
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:52:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWc5d-000859-Fc
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:50:13 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:5024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWc5Z-0006VF-7r
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:50:12 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22M67b4f026511;
 Tue, 22 Mar 2022 03:50:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=7lmGXgU3EhR0vQR3nmbwsoPHlV5OekJ/GP9k6YHsuE4=;
 b=VttmVWHllg1uUkT93g7BRwoaWrd43dzNt+NF9V8g5w9KPi/FdX712PXGsrnfiVX+eNIc
 9HUNt69ThsoKGL+mSSSwm/FGXHcaIHKT03Z/p1D4lWGU9oEDAl1VnNC9JqoH5qBjGWPL
 k46/cnfEyFsyLIBYodnE1SND35tF6xX62q1wIG7QeFqMGEFM6U5or62FjiZwNvdJeOj3
 cuxS01AY0GXCjvf54ForgHdPM8dUKGkUnXtd/ZNEbMhEkcU8kewLp2Inow8Tds0gRGOd
 7qRcV6eUX5JMTCl8FOSAhaNWAaQEXXOodM+ZJWW1AFBBw0n7zSy0Ezt9DJoEtTXQw5Mx 0A== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3ewe8ewjd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 03:50:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtI08AW+GjmdWwH+TWE1KOmRLrqyVA7jJA2yzL1PCyFwIxUFubHrIt0sMwdogPWvFpScE2tmoumCWbmLwIARHHaCGaLZDRwwvT2v3lyG2l/6nNjhotce6zgSkg49OID+N+uBysvxsqqphawdQO9OJbsT/y24DBtMdSiifeApij2/SUkdespDpC14okwWmNjZWWHhnzCDuefe/5DRiPJF2UJPt58+fI6PMeR7DRM05Td7WioO5PZt8wbdtG0qMQfLvUUokssP0qr0LvDWZnUY7nGGl/SHGv2CNoOZS3v1PaXGNnaM7mdhqZPxgRFWJzMJw598i2zPaIxc1yJ/V5tPig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lmGXgU3EhR0vQR3nmbwsoPHlV5OekJ/GP9k6YHsuE4=;
 b=BpAYE71pzXDop3s+gQwVmdE+jrl3tBl/z1U051m/ZZYDtSmjim/L2Zh9YhsNmHICwKz0oPhZLBxKvBMz0ukZpd0/z4Cj39fS87ASAV/KWie39KtqkolwK1bB/U/jqKySlJjOE8sO9Errcnrw5PKDYBygclG6IWKxVVzXdUo19t6ehwo2jfiZ6C1rbW5XYgI3OS/0ZY2qWP+AnfQDnVxIOwL19xeLlES4sm71RlvKRUAHALyVv1xj89o9mJw40VIXbyGg6e09fHlcsn9QnnxjONtNR8qbT6ibqoFlRHYG8A2PfkU2o1ncluV8pRWdHLON6gdaSklJOJPwVh4wqbiOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by CY4PR0201MB3556.namprd02.prod.outlook.com (2603:10b6:910:8b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Tue, 22 Mar
 2022 10:50:00 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 10:50:00 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] Added parameter to take screenshot with screendump as
 PNG
Date: Tue, 22 Mar 2022 10:49:53 +0000
Message-Id: <20220322104953.27731-2-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220322104953.27731-1-kshitij.suri@nutanix.com>
References: <20220322104953.27731-1-kshitij.suri@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::18) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f440b9c-4f5b-4480-179d-08da0bf1b692
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3556:EE_
X-Microsoft-Antispam-PRVS: <CY4PR0201MB3556F1214ACBD94C97879C0A99179@CY4PR0201MB3556.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3QCAVjOOMUerFOPl+wMsgI3YDpMd95mjaz+z4ACCRVct10psiECSg1wekbk0IAtvLtvJbf4RCiWo6qa5DgVF3qogZS7J8yjW2AFZjbZulU4DZ26V1FEEmZJnZDOoVHA7Kxkp/CmRfsbCtAzrdtnGDCwXnNEdvD3YazfLVsgBAcG3RGP7Xa5mEDxLTDDZKW6rcrRJRkP0kNzxzrxus5ghceqGtx5QK3L5GYdENiDpvxTjdLJBzSze//rPGOTkVw0MYfebNGpoc90WiVHBLovhNtmpWGbsIhosMpfAbiVRBO+wScS5kvJc9ypco98jYNxHxHPrsTS5FvyMdROjX+H+1YYkgp/CHcg5PXhh5HS2SBtyp2mzrc0WHn2gvVum0yjFnETSc4VqBapjWz/riYWbmxDySGU6R4THabrqg+TDqhpm5Erxm5SGa6sJECIH1kRAs5amzL7bDwaQuOAcm0/b0N8Klyne1Dj4kGbjd3UmGCe+RgOD2SVLSSwCGnzTlL3e1amElLejqP8JqFJDNO3UaRI5JGT0Sln1r6j9gTQ79llpc4NeiHc/K4f7jZGfWqexFr/M/sjE5dOZ4QsFY+sjH2raNmmzcWh3d2yblufmuFVThTJyPVP3wRixLds+DBtGD3RNxBCnnBl96bm2spFS1O5gKfq2APJ9aK00xaY6uVMdFm7H/tLYTAdAcz56Nz+AGxXnu0ajUQpBdFAP1X7O8HEAX25apsM2YJWUuXSv8mxnMcfhR208v7iQUoyegVlgE1Y0uDiJxqZDUB1AwY8l65zxC2v+wLISDL9wnoesw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6916009)(86362001)(2616005)(26005)(316002)(1076003)(107886003)(186003)(508600001)(6486002)(966005)(6506007)(6666004)(52116002)(38100700002)(38350700002)(83380400001)(66574015)(8936002)(36756003)(5660300002)(2906002)(66556008)(4326008)(66946007)(66476007)(8676002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7T1mnrnZqYx2JJSToP7OR1ju5Y+qmY3hluID5UhcP7nFa67pqVnU91PubNqH?=
 =?us-ascii?Q?mgnXVBTqXv3u9gtPM9KksEBeeYLaQqnJH3am3R70cotYeE2QSEdF5rNUioBt?=
 =?us-ascii?Q?iE/q19NmGKkRJC460/b4e7yJ5K3YvXQetGJ0Z1MeH/VaGPO+cYpYTB9Vk8CP?=
 =?us-ascii?Q?1gNrAmF2R1SfHI7H4VXf3bI+zMXOM+kMDUYSvIklMlFScJug+8hZFLzNVKrA?=
 =?us-ascii?Q?z3g7AtYa0ULnavhVsabCwQNcan/rAwLKhzsIlldpBCTovSoePPpw9hAnvolE?=
 =?us-ascii?Q?hAAtkVtw1lyptJspkGQ/8yZKb0MLRJkfQ2hY6xtDLKf+jNo9yyqa0sSbgSNk?=
 =?us-ascii?Q?DO7B7ZsrANzZZopoS69zjaaqaNAv2JVWK0zjJQPe0xiH85UEf5Mgk5pGc+wB?=
 =?us-ascii?Q?FbFUQw/B2jazz3N3OQ3WEia7iTOL0igj+6I/e93dXpBWybU0asd1nwVksY3j?=
 =?us-ascii?Q?Hoy3g2V41eYIGDAFWigeyJey6LgGjMNC7w7J61W1RF77XBuEE3O/1Hql9fwH?=
 =?us-ascii?Q?oIOYX2LKMU78N9SPvd24RzPl6oQ9CpN661yJzwxRdcWPa64xvicV3s68v43E?=
 =?us-ascii?Q?qXafHDaDt3eAsQHb6MWCVWcFHzHr0K1usDh9uR06/nMxN+88GDjo+sJEe/Wh?=
 =?us-ascii?Q?2ajrjaFi1gSPHk04WiVWt5n00b4T09QSicyq0SE9PivlquOxK1lq7OHxud3M?=
 =?us-ascii?Q?zzJHFMVOz7AO+VymyIGqcqBy6vK5FYO1i2WEjCjndg6SePy3SFhTjZPO1iwn?=
 =?us-ascii?Q?Y/lBsqc98B7xMmGuMxQ4KTeFGKD2nZibCMmYrSErQCptvs/MixzCEMFLL4ZM?=
 =?us-ascii?Q?mUjaURlcbUfBBzKrjcwIc4pHQP5U72zs0zhvJ4QCEkMstuxhaIp+inEfb1Q2?=
 =?us-ascii?Q?/IswfdWqEo5S+r/9VOu7KgZvST7hIxyjkkdsLBU68/zsLgUUTFQ7592wSYZm?=
 =?us-ascii?Q?y0pRStvOrZ73VkRsNc6bPaH1ZWF2xonCnKLxgQbcZfFX3GLMHt+DHFPt/U6G?=
 =?us-ascii?Q?u5Kf+3FGBZXeA1vEKrrS2D5chUHd3ELJvdxPTxvDYdv9N9BjTHDUgaxCQn+g?=
 =?us-ascii?Q?I/TmCuyfvZpLJEQNHsCkHSFBaTzWFLtDHESUMZ7TNtP9nLXx7zW74C3pJdDG?=
 =?us-ascii?Q?5kWjzg7PkVIyQlB99KGqEixSYca9pFA0UCpvy5EcaO5oFLVFEZKb+V5lwttA?=
 =?us-ascii?Q?m1qRmFpnesMDch4GcFyJyqsLREyGw4MsXlQpDTnTwk48U2bxNz9bVK90rAOA?=
 =?us-ascii?Q?a3UOgccO5W0+hmsoFTPsj9GUG21iS05mj4c9jJhhK96qkEGDpuyXvxpH5Ajf?=
 =?us-ascii?Q?wJ0JBNJ7l80yRTdZe63KdE7ZH1Bzq/PgPuVnDtVrOBsjFKr+0uwG+A/UskWK?=
 =?us-ascii?Q?4uCvDUefzDCZSotL4mAjoniUbitquCZ5Vr/PuptyMVcFBEV0aRgU0/e9QHFS?=
 =?us-ascii?Q?GHNEAjadxpCvxcSUkNdcTYgOGLFrhcL93KbWEWK/cwnqECsf+phvtQ=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f440b9c-4f5b-4480-179d-08da0bf1b692
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 10:50:00.5804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teESM0Gjc4QiP/xYUZzs+5cXZcV98f0PDjm23d2Rt1B0nMwv/8cZulJhcBmKDuFcdqfh/tK9ghKEQC80Ugfotua50JCKthBRwQTvRYC1Xfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3556
X-Proofpoint-ORIG-GUID: DfJyi05T6-ubsIC482mNuA7r8R8slGs6
X-Proofpoint-GUID: DfJyi05T6-ubsIC482mNuA7r8R8slGs6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_03,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, dgilbert@redhat.com, armbru@redhat.com,
 Kshitij Suri <kshitij.suri@nutanix.com>, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently screendump only supports PPM format, which is un-compressed and not
standard. Added a "format" parameter to qemu monitor screendump capabilites
to support PNG image capture using libpng. The param was added in QAPI schema
of screendump present in ui.json along with png_save() function which converts
pixman_image to PNG. HMP command equivalent was also modified to support the
feature.

Example usage:
{ "execute": "screendump", "arguments": { "filename": "/tmp/image",
"format":"png" } }

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
---
diff to v1:
  - Removed repeated alpha conversion operation.
  - Modified logic to mirror png conversion in vnc-enc-tight.c file.
  - Added a new CONFIG_PNG parameter for libpng support.
  - Changed input format to enum instead of string.
  - Improved error handling.
 hmp-commands.hx    |  11 ++---
 monitor/hmp-cmds.c |  12 +++++-
 qapi/ui.json       |  24 +++++++++--
 ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 136 insertions(+), 12 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8476277aa9..19b7cab595 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -244,11 +244,12 @@ ERST
 
     {
         .name       = "screendump",
-        .args_type  = "filename:F,device:s?,head:i?",
-        .params     = "filename [device [head]]",
-        .help       = "save screen from head 'head' of display device 'device' "
-                      "into PPM image 'filename'",
-        .cmd        = hmp_screendump,
+        .args_type  = "filename:F,format:s?,device:s?,head:i?",
+        .params     = "filename [format] [device [head]]",
+        .help       = "save screen from head 'head' of display device 'device'"
+                      "in specified format 'format' as image 'filename'."
+                      "Currently only 'png' and 'ppm' formats are supported.",
+         .cmd        = hmp_screendump,
         .coroutine  = true,
     },
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 634968498b..2442bfa989 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1720,9 +1720,19 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
     const char *filename = qdict_get_str(qdict, "filename");
     const char *id = qdict_get_try_str(qdict, "device");
     int64_t head = qdict_get_try_int(qdict, "head", 0);
+    const char *input_format  = qdict_get_try_str(qdict, "format");
     Error *err = NULL;
+    ImageFormat format;
 
-    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
+    format = qapi_enum_parse(&ImageFormat_lookup, input_format,
+                              IMAGE_FORMAT_PPM, &err);
+    if (err) {
+        goto end;
+    }
+
+    qmp_screendump(filename, id != NULL, id, id != NULL, head,
+                   input_format != NULL, format, &err);
+end:
     hmp_handle_error(mon, err);
 }
 
diff --git a/qapi/ui.json b/qapi/ui.json
index 664da9e462..e8060d6b3c 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -157,12 +157,27 @@
 ##
 { 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
 
+##
+# @ImageFormat:
+#
+# Supported image format types.
+#
+# @png: PNG format
+#
+# @ppm: PPM format
+#
+# Since: 7.0
+#
+##
+{ 'enum': 'ImageFormat',
+  'data': ['ppm', 'png'] }
+
 ##
 # @screendump:
 #
-# Write a PPM of the VGA screen to a file.
+# Capture the contents of a screen and write it to a file.
 #
-# @filename: the path of a new PPM file to store the image
+# @filename: the path of a new file to store the image
 #
 # @device: ID of the display device that should be dumped. If this parameter
 #          is missing, the primary display will be used. (Since 2.12)
@@ -171,6 +186,8 @@
 #        parameter is missing, head #0 will be used. Also note that the head
 #        can only be specified in conjunction with the device ID. (Since 2.12)
 #
+# @format: image format for screendump is specified. (default: ppm) (Since 7.0)
+#
 # Returns: Nothing on success
 #
 # Since: 0.14
@@ -183,7 +200,8 @@
 #
 ##
 { 'command': 'screendump',
-  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
+  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
+           '*format': 'ImageFormat'},
   'coroutine': true }
 
 ##
diff --git a/ui/console.c b/ui/console.c
index da434ce1b2..f42f64d556 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -37,6 +37,9 @@
 #include "exec/memory.h"
 #include "io/channel-file.h"
 #include "qom/object.h"
+#ifdef CONFIG_PNG
+#include <png.h>
+#endif
 
 #define DEFAULT_BACKSCROLL 512
 #define CONSOLE_CURSOR_PERIOD 500
@@ -291,6 +294,89 @@ void graphic_hw_invalidate(QemuConsole *con)
     }
 }
 
+#ifdef CONFIG_PNG
+/**
+ * png_save: Take a screenshot as PNG
+ *
+ * Saves screendump as a PNG file
+ *
+ * Returns true for success or false for error.
+ *
+ * @fd: File descriptor for PNG file.
+ * @image: Image data in pixman format.
+ * @errp: Pointer to an error.
+ */
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    int width = pixman_image_get_width(image);
+    int height = pixman_image_get_height(image);
+    g_autofree png_struct *png_ptr = NULL;
+    g_autofree png_info *info_ptr = NULL;
+    g_autoptr(pixman_image_t) linebuf =
+                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
+    uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
+    FILE *f = fdopen(fd, "wb");
+    int y;
+    if (!f) {
+        error_setg_errno(errp, errno,
+                         "Failed to create file from file descriptor");
+        return false;
+    }
+
+    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
+                                      NULL, NULL);
+    if (!png_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write struct");
+        fclose(f);
+        return false;
+    }
+
+    info_ptr = png_create_info_struct(png_ptr);
+
+    if (!info_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write info");
+        fclose(f);
+        png_destroy_write_struct(&png_ptr, &info_ptr);
+        return false;
+    }
+
+    png_init_io(png_ptr, f);
+
+    png_set_IHDR(png_ptr, info_ptr, width, height, 8,
+                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
+                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
+
+    png_write_info(png_ptr, info_ptr);
+
+    for (y = 0; y < height; ++y) {
+        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
+        png_write_row(png_ptr, buf);
+    }
+    qemu_pixman_image_unref(linebuf);
+
+    png_write_end(png_ptr, NULL);
+
+    png_destroy_write_struct(&png_ptr, &info_ptr);
+
+    if (fclose(f) != 0) {
+        error_setg_errno(errp, errno,
+                         "PNG creation failed. Unable to close file");
+        return false;
+    }
+
+    return true;
+}
+
+#else /* no png support */
+
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    error_setg(errp, "Enable PNG support with libpng for screendump");
+    return false;
+}
+
+#endif /* CONFIG_PNG */
+
 static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
 {
     int width = pixman_image_get_width(image);
@@ -329,7 +415,8 @@ static void graphic_hw_update_bh(void *con)
 /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
 void coroutine_fn
 qmp_screendump(const char *filename, bool has_device, const char *device,
-               bool has_head, int64_t head, Error **errp)
+               bool has_head, int64_t head,
+               bool has_format, ImageFormat format, Error **errp)
 {
     g_autoptr(pixman_image_t) image = NULL;
     QemuConsole *con;
@@ -385,8 +472,16 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
      * yields and releases the BQL. It could produce corrupted dump, but
      * it should be otherwise safe.
      */
-    if (!ppm_save(fd, image, errp)) {
-        qemu_unlink(filename);
+    if (has_format && format == IMAGE_FORMAT_PNG) {
+        /* PNG format specified for screendump */
+        if (!png_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
+    } else {
+        /* PPM format specified/default for screendump */
+        if (!ppm_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
     }
 }
 
-- 
2.22.3


