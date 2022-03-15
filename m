Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3B44D936E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 05:49:19 +0100 (CET)
Received: from localhost ([::1]:37038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTz7W-0004OM-Di
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 00:49:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nTz6C-0002nA-Fc
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 00:47:56 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:65490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nTz69-0000Jl-Th
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 00:47:55 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22EIxiIa021114;
 Mon, 14 Mar 2022 21:47:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=P8iTfvTgCnoh84Yc0jdtVexAVrs565Hgi8uawx7c5ac=;
 b=R95/QLImaW8Hllvxd0VFQWaoVaxt+4MJGYx0V1ibbM0B5TMLO3J8j+QvpnieOlwwwZtP
 55TIwe+SNUXzZDfkgu9PovNeDH4EiilF1wf3sIHWq1wtQ6LgEfhYCvkS53/haujeXBqt
 ybxF2mM9vidz2UBPF9zognd6BL8qX8rxLVNpAJTWJ3oUSms6a4uMqVLVAkbGCQLRniR6
 Fp9MA4OcbaRKU98R+EuAJNigQyCSO2IX2iC0ZCWj5gyRI9nKQUOv+nAFQN4Wzq3HjCsA
 4zwFmzP1UXCkxF6DKdQr/PtKT2mND+YVcfN8Ew6f7oMKQDxmtKjZj6idhcwhBzE382X0 tw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3et64m1nnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 21:47:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSdcR+npyKsDQdbP9C4wvql48OYcXkJJlsMx2o/bvSaUa5UblP+fS4Lkv57aaQ8t9dLDFe66v6NK0Kgkie4TsEmQ76s9oTm8fVMrCDjMT7VSDaYjUuwb3kN0eFYmk4C5gEyBnYb+DazqzhdvwfUWbPMV+Q5XAEurDs3V6cbjhdg3TmdaoxQaVAzO6DsrOk3sNxwModvmoCT1TuXsGBrpmgp3qlaeLnMDlJxHbBdAOPXHs0GKHGoiQHrA7hXRd8gh/RbadWMAGjoVm2UMTVzwEGYQW7GrBn+wbqXphwXqn86+GInyaIbTtgRBAKZTgSRsHW82SEoW2/sAfuHwrkh69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8iTfvTgCnoh84Yc0jdtVexAVrs565Hgi8uawx7c5ac=;
 b=gU7C1I9W+SOk91clKRnqBIo+Q7Gu4Ud5SFxSg8WlnCPewSb3Pte7SjavpoWrXYCnsEeRLx2D1JrRhCv56Q0GJg6CvEdlfIHYuK8YaQLeChhIkmiK3c+3NOWMoQ8Illt/f4cfktwhxo3Yvb7pJtgXuyZPmOil+K89I7K58n03Wf3AggXYZTHMX22S1TO9aB27VBEFsjqKtjRMUCXZX3du29Vw+zexg1+OGo+kc266DKSjVHNDgDVRpCshXkJQClrCjDIb0TT7acKT/PGPWQSyvO3+9eKfe0buNYQxB7gEwOYomZ4ZY1aWpf4JN+MjkVPuybfB00RC6RnekHXBDyZT3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by DM5PR02MB3210.namprd02.prod.outlook.com (2603:10b6:4:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Tue, 15 Mar
 2022 04:47:49 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 04:47:49 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] Added parameter to take screenshot with screendump as
Date: Tue, 15 Mar 2022 04:47:40 +0000
Message-Id: <20220315044740.155268-2-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220315044740.155268-1-kshitij.suri@nutanix.com>
References: <20220315044740.155268-1-kshitij.suri@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::7) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8d16d7f-53a2-4b36-1ef1-08da063ef501
X-MS-TrafficTypeDiagnostic: DM5PR02MB3210:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB3210BA56738650B5E89BC63D99109@DM5PR02MB3210.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hsDjlgDVDtJ4NKxiBKf0uebY7qqKFfUuIkWVJw36l12wL+yo1rQyMksVrROlG/9pq/2lPb/ntWKK6nyHND0vFLhi0LhgHvV+rcRPrPi426vGVgM78v2nz9PhOTvBytSnph+TID4Yad+LNj9DpLZR7lxHDybO3DSIvTPjjHhpuA3b3U3G3gdzQ3m7mSMb4cMVF3GkIrN/+M/BekEA080rwbWwQ7Pu6tlhTgG7qT50PcYtjuzH4JA4SUjiuUX069obdq0rxClmC0iZ16Wt0w9ukKEA5KNjSDUW1SPTBIzgXcq5ULSPJSc3psBvv6LcwtGdFTdk8q/xfBlbZ8lFy3+7R5Ttmd2tUJkrsfoIGD94iPbVD0TwizEtWn0TtbF8K0k5NVz5KFHRCi98hK5cezrAbRTHuUm4Hy+mV2sNBX08C+fxQ62HM6Er9XvdvZppZslAAqmjhiin4kHCmXaXIQtXhPQlHnwxsETUMhcgaxdugUufAF4cRd8fsvGnNQbnVgfqy0X4Im7QmdZWXTVUOkl31he8F1zVhqveQfGE/KDO092BoSTZfGG/MqPcv7THuu3kV9BZbTxnN6k9B8VHpm3FPle7zguVPFCOSJm3Y9v+P3FjMcj/hFXfNsBoWpfoiG4L7zB6NPsIsMNKo3DZ04w16JvVDbVBwiOc6IYpApc7oRbBT270oInfI35VSWg16KitvEprixV1hLWnt+QmN2g9tZdMvsfeniKx9T//ExmeomckKfB3lZTbwSfBBcxchX8CavdGeklplwI1OFIYPZLaUofoWNpp3G7cor3iOl+gxSo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38350700002)(38100700002)(83380400001)(8676002)(316002)(26005)(186003)(4326008)(6916009)(1076003)(6512007)(2616005)(86362001)(107886003)(6486002)(966005)(6666004)(44832011)(5660300002)(2906002)(66574015)(66946007)(6506007)(66476007)(66556008)(52116002)(508600001)(36756003)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mlbGo0z0Qjp7CA+y5pWI8nbjqh3cRQmL4/ncJtXKduuKBoWt44bhOfB1fVBH?=
 =?us-ascii?Q?NXhivKLRKjck3xZQ4nZoStlYSOYfJWaoU89nz9343QxpCMvBaEZWBGs449EJ?=
 =?us-ascii?Q?BSCMBBb89TXhFYu3UBN87cPf/BqCMSWZnfeF+GknSvOs1HnqOAgEs13QqEil?=
 =?us-ascii?Q?39jteOn1er2OXy6aY2A4zpHwXUOp1p55KlmTsFc1qMPdw0ZC75zKuMO40uZm?=
 =?us-ascii?Q?DIOpo064v/L+3Ggo9W3peB72/K9O5FFOEMpOLbhTibLKbft+dFXFOmLBJz5e?=
 =?us-ascii?Q?s46fW+HS4xmyLYO+SdXK3Lfqqv29QPSa+mFYd7l3MUGZpDRiv9znVXaD91Cv?=
 =?us-ascii?Q?Xyhqm/5Oq8ajjEi/gU4L032itXchLZA0dkqFUBPiPM3z0JFJ4csqIMYLtrHb?=
 =?us-ascii?Q?HLIt5g5XcdzlWV88oJAlA91SyFX7b+qaYLdpZWx/kLo+D+MsjbDLw1W1x3xL?=
 =?us-ascii?Q?kZ6TmLsURDraQ8JKwi024gDwAWLtf+BVL7lMQzzAgzeKvpTGAruEenrldOjS?=
 =?us-ascii?Q?uW4m//E3TC4xjlwDKm8US73qrz1QbMMhE4tZgc1gZGsc6cdqWLTPdXQiZG+Q?=
 =?us-ascii?Q?BCWNdzGLmgUpBqLQtr5ZrVFxX7wG5fKbxpbRzAL0He/XnYBPxHRySs6LHhf2?=
 =?us-ascii?Q?TG6uV1U6kari0XOcX8tlvPELkflSYPjqGGVA+QGMFoKExc5IEVj5qGUBvfT4?=
 =?us-ascii?Q?h7tTcqcCGSOWWenkxRmrIXB9xxCofh59XRvwwD9A100nHdw6s54a0P1bPsmp?=
 =?us-ascii?Q?k8Xzf1aglj4B9d9cyiJRAvZh2fV0RZN/spBqr1MnEQw008W3CLE+cAP5PE/g?=
 =?us-ascii?Q?GGnZ1eYjvI8pzNOOWN1nULStXpKkmZwqb0TF1YNUFyJALgnyHr9Ip1nYq3Ct?=
 =?us-ascii?Q?2MFZ00OhpPr0UCX3j3kDYphd9T3Q+Few3bMUg/wuY10tIh34m97/W2vnBpUb?=
 =?us-ascii?Q?z6VcxeaRsGIIipPrA1Pj104xSKO5iKKKO8A7veXdVGIoEYtlRFYYOPJzkHQA?=
 =?us-ascii?Q?0h5aM5oXjoFnXIEyYbENJGYS+jWxwdLcTaMzdSKxgYnv5mf1oSpew01nVD36?=
 =?us-ascii?Q?u8kw8H9DV+5/DBF52rwspH+31Zg/+w2fidbi+jRVK2q/LGlpVgU7UmuHQHeW?=
 =?us-ascii?Q?W44IZHR5g+ZkVCQhRFCV55B+d2Gi+v5bQHVOp4kuzA/KN3tmP0gQd+9TgwnD?=
 =?us-ascii?Q?p2jOHXZnRkjtc3v4g8WtvjlkJSmx7NgzZOCEZMc27RNH9qvoj50d0jlvnS3/?=
 =?us-ascii?Q?KHFDoL7+aEYrF3qyeeAyUSgGddwjQYC8Ktp1ZXY+CK6fJE+IeSIs1asy4OQY?=
 =?us-ascii?Q?HyeW1v3bjnhL12uhXm9PLuR9+AcagrDlnq1spbr1NNLr6O1r72G83WzVW/No?=
 =?us-ascii?Q?ykzKT0GFoS7KKNR/9fPNRmgX6yustU4bqAj40vk6ICu8G/3wCxb7yX814qMK?=
 =?us-ascii?Q?k4Ntl3Bv+aivaN3Wx+avh01Fy8ezua43nZaadzJvL9UVj9lGiRcCIw=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d16d7f-53a2-4b36-1ef1-08da063ef501
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 04:47:49.6139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yyGc9z/FCEstjekUox4fGxHF8uy3TsVgmBv7bjRLmg12ITQfo/urXAmQLTou5FXDNhPHcaUmfeOGtUibHrdIj6bRL9xa4dewrbMy5hcPSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3210
X-Proofpoint-ORIG-GUID: 0kv5lSB-BdMLvtUaXgFD2s3oFwKYkQ5a
X-Proofpoint-GUID: 0kv5lSB-BdMLvtUaXgFD2s3oFwKYkQ5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
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
 "kshitij.suri" <kshitij.suri@nutanix.com>, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "kshitij.suri" <kshitij.suri@nutanix.com>

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
 monitor/hmp-cmds.c |  19 ++++++++-
 qapi/ui.json       |  24 +++++++++--
 ui/console.c       | 102 +++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 144 insertions(+), 12 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 70a9136ac2..5eda4eeb24 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -244,17 +244,18 @@ ERST
 
     {
         .name       = "screendump",
-        .args_type  = "filename:F,device:s?,head:i?",
-        .params     = "filename [device [head]]",
-        .help       = "save screen from head 'head' of display device 'device' "
-                      "into PPM image 'filename'",
+        .args_type  = "filename:F,device:s?,head:i?,format:f?",
+        .params     = "filename [device [head]] [format]",
+        .help       = "save screen from head 'head' of display device 'device'"
+                      "in specified format 'format' as image 'filename'."
+                      "Currently only 'png' and 'ppm' formats are supported.",
         .cmd        = hmp_screendump,
         .coroutine  = true,
     },
 
 SRST
 ``screendump`` *filename*
-  Save screen into PPM image *filename*.
+  Save screen as an image *filename*, with default format of PPM.
 ERST
 
     {
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 8c384dc1b2..9a640146eb 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1677,9 +1677,26 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
     const char *filename = qdict_get_str(qdict, "filename");
     const char *id = qdict_get_try_str(qdict, "device");
     int64_t head = qdict_get_try_int(qdict, "head", 0);
+    const char *input_format  = qdict_get_str(qdict, "format");
     Error *err = NULL;
+    ImageFormat format;
 
-    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
+    int val = qapi_enum_parse(&ImageFormat_lookup, input_format, -1, &err);
+    if (val < 0) {
+        goto end;
+    }
+
+    switch (val) {
+    case IMAGE_FORMAT_PNG:
+        format = IMAGE_FORMAT_PNG;
+        break;
+    default:
+        format = IMAGE_FORMAT_PPM;
+    }
+
+    qmp_screendump(filename, id != NULL, id, id != NULL, head,
+                   input_format != NULL, format, &err);
+end:
     hmp_handle_error(mon, err);
 }
 
diff --git a/qapi/ui.json b/qapi/ui.json
index 9354f4c467..a6d994ba2c 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -73,12 +73,27 @@
 ##
 { 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
 
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
+# Write a screenshot of the VGA screen to a file.
 #
-# @filename: the path of a new PPM file to store the image
+# @filename: the path of a new file to store the image
 #
 # @device: ID of the display device that should be dumped. If this parameter
 #          is missing, the primary display will be used. (Since 2.12)
@@ -87,6 +102,8 @@
 #        parameter is missing, head #0 will be used. Also note that the head
 #        can only be specified in conjunction with the device ID. (Since 2.12)
 #
+# @format: image format for screendump is specified. (default: ppm) (Since 7.0)
+#
 # Returns: Nothing on success
 #
 # Since: 0.14
@@ -99,7 +116,8 @@
 #
 ##
 { 'command': 'screendump',
-  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
+  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
+           '*format': 'ImageFormat'},
   'coroutine': true }
 
 ##
diff --git a/ui/console.c b/ui/console.c
index 40eebb6d2c..aab561e1ac 100644
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
@@ -289,6 +292,89 @@ void graphic_hw_invalidate(QemuConsole *con)
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
@@ -327,7 +413,8 @@ static void graphic_hw_update_bh(void *con)
 /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
 void coroutine_fn
 qmp_screendump(const char *filename, bool has_device, const char *device,
-               bool has_head, int64_t head, Error **errp)
+               bool has_head, int64_t head, bool has_format,
+               ImageFormat format, Error **errp)
 {
     g_autoptr(pixman_image_t) image = NULL;
     QemuConsole *con;
@@ -383,8 +470,17 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
      * yields and releases the BQL. It could produce corrupted dump, but
      * it should be otherwise safe.
      */
-    if (!ppm_save(fd, image, errp)) {
-        qemu_unlink(filename);
+
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


