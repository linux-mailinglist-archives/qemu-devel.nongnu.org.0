Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E72F4C845C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 07:50:38 +0100 (CET)
Received: from localhost ([::1]:60720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOwLD-0001CC-Ir
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 01:50:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nOwFd-00081a-LR
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 01:44:49 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:45554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nOwFa-0006V7-Ji
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 01:44:48 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21SJ6rSd015219;
 Mon, 28 Feb 2022 22:44:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=NYCMju0WDUbq3rzKzdyYFCVY2lTv4dpl2JCLkXoRvQE=;
 b=ngN+vfJWTWmEASZyhHzzgIQAhCoT4G8PzOQANjENBch6LslKVrS6v28q5z/frqsIEycL
 7MP1RCWpYyPFfPJoLdjwkdDqcLvORXt1wnxGr8EJFK7KXLP3CwVRzjNzn6TmCIP7grD+
 j7tI0KtieNbyA1wv9IMeXjFD8+lO/0GUCONA0xbKpaQv1tjedoFvCWBY8N4otepPBKT7
 m4YmMEmwseuwCO5BiTM/98GKUtNSkvd8Fp6RMF4mgXdvEVC0rFQgLdhrt8CRiK8aKA7h
 MnCIgsI3hohACh1JmLweLWNPI+aEJ2vHY4m2ocTkPSaA635RINJlLTFco+jp4xr/ISqO Mg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3egue3j7b3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 22:44:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQA7QlSo6I+eiWghhsCu9xVIgRiSGBELqs6l0O3S42Dt2pxz+tsyECsWsBZshutCz4hi4l2/UJqI2ko1zgPCT+OJ15h5iHqmkyb/0ebAFChxwV3JguXpE6oZYKZLNSBIBWc9gzwHqH31aaN+RPRsbCixS6rf8kHgBV/5I3qa3uTxB3gZa2Q2+qzzvhwk1eeFCLyr3Yg4yCwav+LOeOxc19TJuLjTHzhUmXYqTjBO5HKwZ1uACKKE6c8lOv7DMmXg1T5bbhSPJMSpdJhZCMCaZjDepvN5x9OZZ4LKfiJh72c2337z/FcyCU0Gmc17Jnrlhxswrgh84SGG2lZxpGKleg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYCMju0WDUbq3rzKzdyYFCVY2lTv4dpl2JCLkXoRvQE=;
 b=JK6VQowkxW0JsKoaE1VbkGKq2xLjTVP+Hkrebiy+/Ds9UdH8UZDmzyNAaBJYVHzrFpDw4Tb1Rkt9qME6EszconmothOIl98+3A0dXsEOf4jN0fL9GCwa4QQ+nSHB1iJNevXFJ8KWnzU3r1zdSY8L9mimMNpgX4ePs28N0YHfiSWh/NUtPXDf+qXTcax4+JXwcmdNmIPv+1fAXvsRKR4V0rTulGHF3yDogrMWom5S05TM9pVxyY7+O3h7QReqCA8Pci8ZvGg/TQhCjSTXg3hUMCFfVRUCYy0/EewiLL7UdzqAwpSfRTqxYDOZUfurtm3q+f34lk2s86IHrZUKQatkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4048.namprd02.prod.outlook.com (2603:10b6:805:2c::26)
 by BY5PR02MB7011.namprd02.prod.outlook.com (2603:10b6:a03:23c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 06:44:30 +0000
Received: from SN6PR02MB4048.namprd02.prod.outlook.com
 ([fe80::94d7:26e1:9b7a:657f]) by SN6PR02MB4048.namprd02.prod.outlook.com
 ([fe80::94d7:26e1:9b7a:657f%5]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 06:44:30 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] Added parameter to take screenshot with screendump as
 PNG.
Date: Tue,  1 Mar 2022 06:44:24 +0000
Message-Id: <20220301064424.136234-2-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220301064424.136234-1-kshitij.suri@nutanix.com>
References: <20220301064424.136234-1-kshitij.suri@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0208.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::33) To SN6PR02MB4048.namprd02.prod.outlook.com
 (2603:10b6:805:2c::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff4ca65d-6f75-4e5d-3eb1-08d9fb4ef03c
X-MS-TrafficTypeDiagnostic: BY5PR02MB7011:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB70114D2C8C47937B67F080A099029@BY5PR02MB7011.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5eU0ucUMcf8w/pcGoFC9TyZ5/pI8NeLdas/DSj7vklhq5XZdN3fwizWQDIoQFJn9Cwv8QRUjjljP+aoJ/VQquFW7lspy8y2FEFOcH7LdtgP4t61ocnGqPErVJn+qakhD3673M0P6hGwzvmdAQl19q8PPAwFrqQrGkamRRoc2LmY0mUKJA/zZXDfYmnKQdQ9W8pw9QwsfLXHajBr0nOFy48pFYghdm0i6DHVedyDYrponIyZGsltPjnrzI3PJDND3rZXioP058x6w+p0V4hs0Dc4Mj94FjyoK3e6+U6JrS4guvAX3DPe8OqgcS6Q1di99//gwhZgbAtqoWcc/8WzbkbmOQ5Qm1gPb3TnkKDGSdtiOVbgbwAtxb9n5j2iC6mpkqvKEh+eqFp6AFmfK8lpBbvWIQNkIceDKARgd4udGFjHd5S9/8EWnpuhiIEYfinsG4bIswVF9UOHhlYTQRURKpR3e32yI9JxWlh+uQmdBqzXTGo2UUhXLuYDe4EfwDssIgcNnaSi6qnufvDTU8xgc/DeXwEWdiELBbT5ZvoUmNveI2tG1MGTmuxQtVA/5ShIyWABgyH9KaUuMdz9O3KBlfy9j62448jPB6uYRQCJgmh3W9JaFpliWt6lLxr6BJW7G8HmCOJr/RBmBU2d5m0rueIBGYYcAmAzIjigcvWXQk2QPhoBvV4/0Qp2NRIkeLgOZcCAf6EMvSFqSoKN1ZrGf67JnKBTMKinjBAw+Gftfp3TS0ai1xpS+9G3f1nlwW9RQoEpXkN0ZFH0+0N7F3pg5sgfT34VZ7qaAJ9AX1UOphXQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4048.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(186003)(66574015)(6512007)(6666004)(83380400001)(6506007)(6916009)(1076003)(2616005)(26005)(6486002)(966005)(316002)(52116002)(8936002)(5660300002)(44832011)(508600001)(2906002)(86362001)(38100700002)(38350700002)(36756003)(4326008)(66946007)(66556008)(66476007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Mgly0ISWVBOAAJxyXeVcxOxKnIf8HvouytPluzFP9OELLwgadTxcupZdwbp?=
 =?us-ascii?Q?jGd+adIKSP4x5Iu3Rf4icx3iLXvaOj+yr+fZ1q1xtXo5kfyYV8vcUk2n4yb+?=
 =?us-ascii?Q?VdQj6TRsp6NJJ4Rjpy58gJPYWK4CDTz44NAs4IR3dh4XN1LcTzF0t/CBnxlG?=
 =?us-ascii?Q?6sgZXD0fyrSPoixbyvhNKiZfLSSXUnmzsC43IbouKqZ5ao1IgZF4xc0+hvuB?=
 =?us-ascii?Q?Ir6cbI15bjzil9YP05fLL28oBlF4v94G5GzNv9MS7qwdpePRxbpkOrfUFPLG?=
 =?us-ascii?Q?Wxe/IIxTb2JG9k2mvopVUzsNOUDc4BcTuBExfazTUSia/XBGr5GPx3MmMuVW?=
 =?us-ascii?Q?Sdu+Abio9cOAGy1lameJYm79vdP+Dudqm1jV0/8qfgdBLbIXFIxip8yOv2Rb?=
 =?us-ascii?Q?kEEvgrxC8V2t5wnmuGauGVqv3A521S66STcUQU5R4WWgcUy+fThO1YjcVMwD?=
 =?us-ascii?Q?4DeB5bN1PCRgtHEMXtKyYhcIll/+l4WJE4+OG7QuVru3zIP8E+6bMEKRdzmM?=
 =?us-ascii?Q?v0Mb6ed0VCnJUHylf0//7YnNXAathFp02MrO3KQQePkyMAzdErgy4B7pAVbF?=
 =?us-ascii?Q?OpK+6UUvj2WIif1+aGgQ+Sbr6vVrCSTOGMpll1l8DMPOtNbQPYIOMyLxa8mb?=
 =?us-ascii?Q?eXxlBPyVwlghuDb7Yr9g7tZe3PEIEBiDBoarMES/0NSPRfRW8UcwAJ/jTetc?=
 =?us-ascii?Q?wdxNtp9ZDKtISlaL6noXpATHMyOCiAWjGHIK1ci0No9wHxdVrdGD+cLfaZco?=
 =?us-ascii?Q?DNvhEWxhfpiECf/XSw6FwWm//utPWAN9L3btIsMWhD1rUGhlk0YwQbq3mZn7?=
 =?us-ascii?Q?Z9tbwhXTjxG1LDUnDfiOlkO1Un4yF28Hd/Q1M+Aq18+7YuC9Ai163Y0lgili?=
 =?us-ascii?Q?TXtZNxZDobPeHFSZZ0HVpufII0kplMck405uqusgT7jXzTzV82o4lmyaL3nw?=
 =?us-ascii?Q?SYBUrA1zTHyJHhC2VdSxu2eq6bX2Jyie4YgoYno4z8ujKndxDI2y6BVRTL5F?=
 =?us-ascii?Q?dNda9aOXJOEch/vQOuB+mKQjXbWCc3Xcn8G5+o7AEFOLhx5ibe6ICjiNk+hO?=
 =?us-ascii?Q?a0PudgIS81qO4VTn94NPeRnSL2kLMtRw2cCGta+nKoGFV68LvJjlGkBk9qLU?=
 =?us-ascii?Q?c6TcgpQeQEKtmqdyIJOyl4D2ZgUWnQMK+0z/eJhvvz1yH++PoRFV/6adlwgB?=
 =?us-ascii?Q?nHBxK7i+GjlLz0+5cJE8xHz4Ss1W9g7xw9C/EVaKuFUrRXJah8h+0Y5u5/8k?=
 =?us-ascii?Q?H4pZMkwKd8/oGJxD+oEroNsGVOIP/bd1BZ1ziL/s5xCmsfAhVSQg/rZn0frl?=
 =?us-ascii?Q?Um48gc4aK6o4N+PirLZQX963HX7JzABCZ/BsJNgRJ4NvXKIpPMTY6qa3PWEx?=
 =?us-ascii?Q?JCaNWGtl4/++trVtyAV72LD5zI+bMgmZPm1icWUFJTZJKJ0sdxRkb2TIlpy0?=
 =?us-ascii?Q?y83SMpoNP3iUDcpAplHpiWYSKpluxjHjOLkb/0eDvT5M6kAuZT7/O2ma/Vfx?=
 =?us-ascii?Q?i396ud9gt7yyyykTpmFsVlT7GnQ+8bKAzSDiYQxbT2bj1NrfYbnMgRkf871W?=
 =?us-ascii?Q?YgkblFfucuY94pymui1WTUbdKy4rB9vSDFy0a3AORrXILjbAFtEbAvyo74J/?=
 =?us-ascii?Q?GbCU4gXSia8Sb88+hHsTFMl+Doj2LXEPwUx1oTNDziirgJRjWrQTg9DmvfWE?=
 =?us-ascii?Q?7AYBaxV9qzxOqT+K7WNP0pw75uU=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4ca65d-6f75-4e5d-3eb1-08d9fb4ef03c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4048.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 06:44:30.7855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZAuS8fveYv4UFOC1aER5bksR4RYqyorh05zOH+LjH/s04Gan1+qRwCiZUfjYAV4OkjflFuv4jVdhICRc+Vz7Xj04ix11I3wIva+LUDI7gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7011
X-Proofpoint-GUID: D_rHlupy_GreORQ6pFLGLCTOa3MHpMiK
X-Proofpoint-ORIG-GUID: D_rHlupy_GreORQ6pFLGLCTOa3MHpMiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 dgilbert@redhat.com, armbru@redhat.com,
 Kshitij Suri <kshitij.suri@nutanix.com>, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
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
 monitor/hmp-cmds.c |  19 ++++++++-
 qapi/ui.json       |  25 +++++++++--
 ui/console.c       | 102 +++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 145 insertions(+), 12 deletions(-)

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
index 9354f4c467..6aa0dd7c1b 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -73,12 +73,27 @@
 ##
 { 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
 
+##
+# @ImageFormat:
+#
+# Available list of supported types.
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
@@ -87,6 +102,9 @@
 #        parameter is missing, head #0 will be used. Also note that the head
 #        can only be specified in conjunction with the device ID. (Since 2.12)
 #
+# @format: image format for screendump is specified. ppm is the set as the
+#          default format. (Since 7.0)
+#
 # Returns: Nothing on success
 #
 # Since: 0.14
@@ -99,7 +117,8 @@
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


