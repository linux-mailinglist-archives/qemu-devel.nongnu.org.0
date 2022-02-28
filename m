Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6E14C629E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 06:25:35 +0100 (CET)
Received: from localhost ([::1]:55656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOYXM-0001kG-Rn
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 00:25:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nOYUY-00010e-DW
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 00:22:38 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:14060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nOYUV-00050N-Je
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 00:22:37 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21REL14W030157;
 Sun, 27 Feb 2022 21:22:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=NYCMju0WDUbq3rzKzdyYFCVY2lTv4dpl2JCLkXoRvQE=;
 b=JLfkLAZYp1t+AAtKnbZ4GOL8j+RZoMq6W1dFRxfHqnZ9//GPzXDI/zIX4+7ENG2MZnyj
 UFOEojcsMRdIbDI6XnUCLcJ6ljHbLi8gfYlSrKMBw6AQ0nHbdEWiNrlz5bJTN3LtcTve
 eQICBhfKccwfgs7tv0OrFmVvrhDkLlmVa6NpXwbo2EdW2mmBa4urx0y+yX8n/TJVwHyF
 imWTJmQjbmCxu1/BrBLS10koQEijM128fecy5UMv71vGND4yiTg3NXsz6GUyJqnv6S6k
 yu5Q41oAGNkNKoLKcSQWiqORw4dzMdv7LwBcAjzciHqHaPosXbcq9HDjAZKNW4BQqtEm cA== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3efjmd2sna-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Feb 2022 21:22:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsv5uM2rP0xJIxO2mCn/Erb1JMe55KPzpIb1NftwQwN2bkTOCb4+SUsb3uvPQzCG2VSjChm39VL8cDC26j/KoioBuAs/o/8426lw1pLi5SPk7HBB15zxmtKGqnachxDMifHjF6u64Rwe3mSiCsoCMueU8mdujuZDLNlE67UeNfLOYT8X+4BAvdvP1hxW8Db92ml3r/kBQmDNtGgmKUxf9D8d4jEw/SLRVWnCI/uYlvDa+ES8WdyIpXeVP7Q96m0yINFJeTYX0xKoIo94p9Sk18LcTUvXBY/bBJ0BrOahMipcxysb78/Xn4ZbgEng81hrJorITUmk0K0IkCOBKJgCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYCMju0WDUbq3rzKzdyYFCVY2lTv4dpl2JCLkXoRvQE=;
 b=HPdBcNuoPNlVW4/eV0XlgQsc8Cxt3PDi3HMff4F/kylG2UqadL5+wAUn1rRCNrOMX98/PxNHXvEVC37VT7Odbbm+MLvpWNJV7PijYKKWwVkx96Y1uYV6HJTO6L6gKu7qBeVizNnQ8aX/d9PglveIWiGSlfB25ZSrzwOTFLbOsyS19buygUoFNx1K8pcE24zDD9YHtbx2JmgHYplBY7YK/aTpKRPrbrvG31pZ6jxbiB+21zr3gflHUxx8xt7wrZ2mFWdjNswVAFpb/UOdExjAzGNBHuR2ykLt/AeMYSwRtw+2nBI1K+i/h2HPcvvcLmofql0aCUOhTTehHHrfXvnw2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by DM6PR02MB5707.namprd02.prod.outlook.com (2603:10b6:5:7e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Mon, 28 Feb
 2022 05:22:29 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 05:22:29 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] Added parameter to take screenshot with screendump as
 PNG.
Date: Mon, 28 Feb 2022 05:22:22 +0000
Message-Id: <20220228052222.138890-2-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220228052222.138890-1-kshitij.suri@nutanix.com>
References: <20220228052222.138890-1-kshitij.suri@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::29) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 300eadf1-e517-40dd-e82f-08d9fa7a5076
X-MS-TrafficTypeDiagnostic: DM6PR02MB5707:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB57078BEED235844907DDE51F99019@DM6PR02MB5707.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lYRs12GaoR4hK3QwO1xvRskyvAS/b5oxcNlhMlVcKzOshhMYwgDH/AcfatM2/Bmdlbk66h/DjH+r7vecjb5EPVvrEcg1PBcbwpdnA+yiCj5lNj3X47CZaR6I/SieQHrl3bJo14HjN1NSNldSFLzVQb2/atkJtGXQee1gn5DWiDW9BE5bwk0OmAviquZZXTCVERrWDDEQPZQMm2FXYv72obCk+up4aG+LyKDJmM5nH7Z6cHl1QN6UGFLVzrf3fpNId8O4jn9Ki7rBeNLI5tPzA22waC/MJVbr9rwxCcp3hCk+Rkk12K1AP+4JtskcoPtSevvnhy805TKG9xfADLnTs1MwGoImv5EzJGZ1UBui6xbXvoZ5LEpe/TQ8+v5HKbgJ14aROUTI/W4ObTWAFbLC4uN5654uRcbzP4DmxS044mAODdS9K11L7Dt0zxPXJkiz7W/uoQNTxKD81stTLKQtRMioh45OYoevcoqvYiRwv9Te/sNezwXd2QBFq0ZIHAMo0++EngYCJAhxOYcBfHzQ1ZREl67IPUh2EhwOrFI8VBUZXmiDQGRZuAHhQv4OKn2VMuOetgZl2kYr78uhiCfrKGjVbRBGmuoddNcsmXzKSkjX+0361HP8g4Rk8DuER3DS7tsHYUaf050F1ojdRzg6nNOwzS9g3G0gHFjQyGCrk9sAQE33derqR4kzLm1GkOfBIAQv3eo6Roukks0G4zZnvXdR5MZd0J9ce0EFWz2FkC52pcZONO9GLKUNg05XHO+ZHXJG4pR0BAaCpE7j08iEvYI+uuF0Y4fdr4vJpp/BLBU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(66556008)(66476007)(66946007)(36756003)(5660300002)(8936002)(107886003)(83380400001)(2906002)(8676002)(4326008)(186003)(26005)(2616005)(1076003)(38100700002)(66574015)(38350700002)(6486002)(966005)(86362001)(316002)(6916009)(6506007)(6512007)(6666004)(508600001)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qIjKlMdjDOZfhZ8DWpN87nOuHQ0/RM34ST4i6hpjV252f87bYHjxWkvNg1Ft?=
 =?us-ascii?Q?nLg28KnBWi6lmjQRZvo6MJxb1BSBWhuzqwk7HNGp5S9BY3jloCNjN6I1XpD+?=
 =?us-ascii?Q?W9BrC8Wad8DvcmfWuYMmUpd33oWDy6LOz/09NIZceDDsfni7HfPt9NH6nOTG?=
 =?us-ascii?Q?4AKeLsQwADNeUtkI7WdnP/qsyrl+yrPYv3JhhvVnndToGiRMY4Gs1NgPYOJv?=
 =?us-ascii?Q?Ly9BBBSzqwPxQA7Ou1dzJ/v0+GSrzr8MY+uJB5K6gJ5TQjHrpPhSfigyFmhp?=
 =?us-ascii?Q?rw4MaMi5GYPgTDwqL1ve8sxMkj4R9nBy8A43pJ6jNlecqgaUS9KVQyiGSfeA?=
 =?us-ascii?Q?kyKvI1thHz3kFSkGhjWMtFNbj1AuIZEedhH6jGRAkKenGVhvDdE1q5dyoBTo?=
 =?us-ascii?Q?vuQDnJXzux6AssgMGk+wQzHjHqXoHRJpGfUkijbwtqaTP5wz0B3G5M8XHWhS?=
 =?us-ascii?Q?ztt5PfhcmN+BMZCVJtmWyAxBuSmGr82F0iC2py9X/Roi0fLk+Ol8qM2jHtxm?=
 =?us-ascii?Q?FjM7mWyqrQZx5oYQj5/6hxluvSCvt8BrTwPUzYIDq4n2rb1nh5eGE56VjnlH?=
 =?us-ascii?Q?6bAiIjkqqFsZqx9i61f9lVPnqT1zSMHiknl2XhCBX+F+PkFzslUtFpnSJkiL?=
 =?us-ascii?Q?v/kVFwQFnyfoFKqUb4LqvdwUanfmKV1STqmLhlX2ILadk/o9KL0bmeIomCcB?=
 =?us-ascii?Q?t6ofly9zikW+Jtg0vJQVgrzMemdWpD6yF2LJrPN8/gWA0fLeqPWdsMElKa/z?=
 =?us-ascii?Q?suRpiSCJNo1CJgGVyA84MEW+XaBjpJFM8RQv/rN7PXHJMp+UZOino/ekRN40?=
 =?us-ascii?Q?1vGVJZnVY0Iqblwor/BNcwLvuG1yr1MutET3adNQWN904n7Kpc6HIlY4XgVh?=
 =?us-ascii?Q?SU3S+VJwIZxKJe7lphowiRKD6UoWvFhMM0aIfgBKyNTH6WpdU52nGZCkUGr5?=
 =?us-ascii?Q?585r2MRfJwjn4A2/KLQBHepa5c5kvangG8+TjqPCJqf3SXw8PuWpipijOfAC?=
 =?us-ascii?Q?gft1jo8lSG6wf/kdk9Or+M8knp+HG6pokgI0RsQwogn+CFqAWD06Ozes3GDO?=
 =?us-ascii?Q?WfwUK6SgkwcxDeCG2hcKuXVf7xDJ/xwX3PN1vqQ2YdgbGURMguM3S98OLmpD?=
 =?us-ascii?Q?N5gjzsYXIGSHc3eaZCdj+k0fq2T1U1Ym8xwHsT/7SQmJvv+YCbMZ8aPKLGPQ?=
 =?us-ascii?Q?laDrF/d60geYUBb3hdFazPnArWZgGGFI3EnM3PIlvZJlqpIzFkx1q97Iy+hR?=
 =?us-ascii?Q?cezJ4CWhjWtMt7WtsEapSgif8vuexc6NHBkCEZJ3w5IgirwtjQJByvJfvk5v?=
 =?us-ascii?Q?bqK6UIA3ZL+lY2/fztXiQh7yKtzoXMojFmRBSDR3zlkK5gLon4XOwTgybf3V?=
 =?us-ascii?Q?bBIxXy0JQW7d1ptp65Ug6303lXGSuVMmgqLfashd9LKtmbrXeSUXZgvxck9H?=
 =?us-ascii?Q?0CNGNzSIhWcJHjo2sB5a/ZLB7sge2Cou3UzfaIOehUdZKRAwWYNe10OMjPQ3?=
 =?us-ascii?Q?B4JkSaV0a9S1gNNaLCM2DZ5pogwEt3RoI4vWzCFHx6ZPsDkuVk7lbDEFaOUc?=
 =?us-ascii?Q?dN0ovU+VxuxkOsahXVRS52GwI+X9BlytEkKCA0J5nTuPCOgcqFMZKGlkBwEw?=
 =?us-ascii?Q?31/TkdNXlHDFTgVCZi6jLmfXUoCnsg0n5t6KUTUzjDOGyujKIwKqbEptKzj6?=
 =?us-ascii?Q?PJWQLRfQKWn0TfAuOcKo1JY1PL4=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 300eadf1-e517-40dd-e82f-08d9fa7a5076
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 05:22:29.4122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeP5klhVaxrkpZu7Gf/hlggsto1uD/DRfQxq7bUYgdYOUQeBwb557BIpmntsNBcoHWD/VLht+w/stFZTHXYKRpS60NsG/tKM21T/JfIKp8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5707
X-Proofpoint-GUID: AXNTMPtnSS_4TxH0WHVLpLa1EBR0m1hS
X-Proofpoint-ORIG-GUID: AXNTMPtnSS_4TxH0WHVLpLa1EBR0m1hS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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


