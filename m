Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7BC4E3A74
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:21:08 +0100 (CET)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWZlL-0006ZE-Qz
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:21:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWZjQ-0005Ch-3J
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:19:08 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:56916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWZjM-00037Q-JU
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:19:06 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22M4ZEUC011063;
 Tue, 22 Mar 2022 01:18:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=Q7avqCL4v38uLMEB98kRSD7xscOgbJtH8CXp04IB2Ck=;
 b=B9pUktEck/3pKqh7AS76cjRNc39pLv1E/aFzoFBcEnbPU0iHPI1jPxfXIIOrg9BruxRV
 jmLQg98KXVixduGknyy/8PLyAFq2K0YPLfkTh8709+Kfdv9MmdlEDcI187de72LNz2N5
 m7ymBEgwpV/jcLStVBi4mvS4vROx/HFmhMYVRz+RT6hfmUs5oLoIyjsSf58gI0TKZ38j
 izbTf3acGWL8LIvldNTQ9/fS638d1qfeG6iWOBno72GBjy8yZ5/BW7uvcydnd9uhCJCB
 cLRN0+tBTqY0zSLnI3wTU3q+PNwkk+hg6tyjAetj8Au038VVTsbawx3wBdnPPNEERt4N pg== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2168.outbound.protection.outlook.com [104.47.73.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3eweq0nd68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 01:18:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUslZQc+/OSt3VmeY2AWGJgSTt1yEv6LTYot7FCeKoL0ycGNw94B4agZVK8oRe0SpwfApMer4qLQG6tmjgNChE29NNXdLM3dy5XmE6AmmLHoNsj/JWg4mNlYjVahT37FolObO08ljQQiQ7KojtcfUlYll8M/pwRCD1DZ/r73+aaduMIgdzk9JaoxMNcmZkr2M9iEt1phWU/WJn9LXMlvMmNtTUiUfIUDs+VM5p3597uyGeFgHjj6hGaPcNLWc74WlM/6yErGSY+fomG3jCkx/INibJ0xG5a7G4c9TNYBkl2MzKGnfN6qkqXL2s1KrZPDSKE49D9tDQsKSSfmfDqG+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7avqCL4v38uLMEB98kRSD7xscOgbJtH8CXp04IB2Ck=;
 b=lb3YITAVRe92II161XqtgvL6r9zplfJ5gk3BiR4qXyJSxg5OIy4vxV5RwWJV8yPZAcpoEx8hKC2zf2EJGvBTo4HrVVjLDtI2j064PJ/IPtVqzTkowfxaly1sQh1MQMiIT7+gQkdoMxj3r+YK6YaGgluhu1YZTZKAcWg8AuaWq7sW+rD2vKRXaB/Yk6IZ5U9N2hkh6XevO5Qca/GHMnEo8R6okpus7bM8LBjfmoUhfolK16BRN3hDw+jX7J3wt6LL7joRIbl49MptTf93c8joLgRnJTTexVj6+3oJgcu7YD0a9DDvEfyqCQenrbMSPK1/4A8gHe34oRl5jaBFzbLE7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by CO6PR02MB7748.namprd02.prod.outlook.com (2603:10b6:303:a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 22 Mar
 2022 08:18:55 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 08:18:54 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] Added parameter to take screenshot with screendump as
 PNG
Date: Tue, 22 Mar 2022 08:18:45 +0000
Message-Id: <20220322081845.19680-2-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220322081845.19680-1-kshitij.suri@nutanix.com>
References: <20220322081845.19680-1-kshitij.suri@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e7af070-0544-4f20-7733-08da0bdc9afa
X-MS-TrafficTypeDiagnostic: CO6PR02MB7748:EE_
X-Microsoft-Antispam-PRVS: <CO6PR02MB7748736D166691FE45A81A1699179@CO6PR02MB7748.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ga5K7wrOsyLRMK5Miotkv2pnWAWaEPX5I9Arh9lla7BwyzuzA0lKznxKRNzeP1ULOvj3CHimnAkPVRU7FzhCQ/M6jk4j5jON2z7ABEA5jeN2hNiWbflUfiFUPuNGKHT69/Rwo9/MoOMmrfkaL0XTv6rQWH9z01vuFuQxvshnBWV5dm5klFzacnQv5CTUwlPGwYlfpGsuWzN8gtpLbicNE9puUFTbQ6nfp+raPvCpvHyMTljC4W9CCgh9XLf1pUB1RLN430H5ILn6sIoCgs/SK4+jglGmxUtBpXzZ202Ijpeqww5NKsRhbtFJd7z7Ub3siXKFzCRQ2Lbx0sWWOXi0nN/87HKS/ww5P6j9nr9vEOBINLNR+x0XtUA+Ci7rJyySbL88YDTIBJiJAHAvmaC89YSMHv3abtU2UrEtD2kqGsRdtYN00/3w1kvyFqTcoVdQZk2IWiB1XwpvLylAl23f+s1tTom9XObA8ol4xKzp53H9tGAhUzjJMnacfNu+VMN+jb0oAGR+nbZ8oaYagT9TxangUUYu//R8CmsXe0O62C0ptiK3FsxhR7eF6iuwG3JaoQi+XhwV24nU/kesG08qqqs0PH4jP6tM5suO7EWvxGiQ9Uwm/Gh4T0SgESVG2xm01Vj6ZaNKSFB5vkNlt8SSX7PrIZ/DwWeUgWVqT8tCFkYBz5ax7MP6uwWrLWO0zD9lgdnmk2/AyNZMVxagR5AN5WiPQ1sPn5oZ/nC9aMQvHMeyJc0twiqX7dpGm+fRvPwVHn26g9ZP8VPK8sL/nKMCeZ1+NZOa+lFcjM5huPZ/GHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66476007)(66556008)(66946007)(44832011)(86362001)(966005)(316002)(6486002)(83380400001)(36756003)(8676002)(4326008)(6916009)(66574015)(186003)(26005)(2616005)(1076003)(107886003)(38100700002)(38350700002)(8936002)(52116002)(6506007)(6666004)(508600001)(6512007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CoiB/0YzP6zAyzlJQp42e6xHtcRwWMPSl4lVAfGVew13Z8NrO1L85Bu8yEaO?=
 =?us-ascii?Q?I37INHntc0lW2LhaHTdMT+oEuDibWapXsKhX7k50faLfbnXcg9CHm03c6yrr?=
 =?us-ascii?Q?MM/mBAFt0hFKaUrFOBDmEMVWdZNmJLZaJSMGU60lKCcenuxVyjYyF2vz0LWd?=
 =?us-ascii?Q?d23FsiDEXqUuIJ/+tlkRNmvXQjYVld1Wbp5uzLVxs1LcYAeGAEPATWNm1gyf?=
 =?us-ascii?Q?OID0zhU2FLsp3ljxO6uStX4aDsveOwYFhIkWvLNg+T7KNzMuEnAFTc9Wv7dy?=
 =?us-ascii?Q?JqtEmaeCpbKsEp5c+98rSwpyfdvI48HJBmzi8VFhJBBR7ORv/VsAHYHKdxIG?=
 =?us-ascii?Q?q3ZrrToX+0cz2AxZlcw+0QVkXQf54d4+rvKKzFGJol7ZBswDUTRu/LJLty3j?=
 =?us-ascii?Q?3mnhiQ+RVXK51WWFevfI/y8nknJup4fe0aw2SyOcJiNPuEN2vGxU7mwA6fPQ?=
 =?us-ascii?Q?67bJG8m5AbtYMTiJkW+w2GBGJbDHip0Q0SFoijqCIzJOYB1PnkUEhEZSqx7s?=
 =?us-ascii?Q?Rjwm40WQ0tEcgzJp8VZfud6clVwCeyegP7EEqGGYXv7TbG1Bk/OSQgJ2wqMH?=
 =?us-ascii?Q?vYpYHE1066EuBs1lO1Cw6RzN4Kuq+1Jdwe50NWsdbpSjA12Op3Djo1dx+kwv?=
 =?us-ascii?Q?GDOvoDHGxury7bnG8cPhO3qt8/L0sqP343mM5LyPt7RFU7/MlAPOnyV9PlCY?=
 =?us-ascii?Q?H26fuYc7RAB2IPNjGY8MRZjFWLd9iLLgsuO1Q4b2YqSnzV5L5Syq4rNqow8/?=
 =?us-ascii?Q?exiVONYOZz+TdxACyXydZQfJQk2xq6kPBxfU6TM0xib7tXxAoDjDLUxTWgLm?=
 =?us-ascii?Q?5SITC7nZWbZR2g5tvDEWyPaKj5dySeayqG1wtZkdUJBnS3Hbbta9DCnEJotB?=
 =?us-ascii?Q?u/7f/svURQbM6+R+Hk7hefg8pWHQXEQm0XRdY1+1poLm2oypmO2Xeny0Dcab?=
 =?us-ascii?Q?AYW95pfz2AZIXkL2lsnQZ1p+sgRuvSgapd92jfFLIQz6v4rbEMUJzqCJ4Ley?=
 =?us-ascii?Q?gGIH0l23spT91jwpm08N4raQUfD/enxrF0acpL7kHk/ABdXUqfdFOOCP/cll?=
 =?us-ascii?Q?L88n9a5YWVJjmSqNnuTxBzBkWLWg/jFGGlIVO4gW0q/r77baTF2IAjyr/ifx?=
 =?us-ascii?Q?GZXshksDfaPmTQbfZEamr8DUX9Q0N8mqjFnjAfRlngPoltCnK+W7hMIVzOyS?=
 =?us-ascii?Q?atc9iQsVbgFPfUYSmDOIUjTHgKsGmiMwPHDDjZzhx9kz3A14NiYw2tGB+tIF?=
 =?us-ascii?Q?HKEMSL6aoWtrgvfYi4j55cou2DyoMP618utKqgHXRTEbLI6lxXtcfDEOGKKn?=
 =?us-ascii?Q?TsrYVLAq5nB79d8cUKEXQ5n/SCWlnz/ZFEi7mQIyKJcgy3uih2P87LJqYQq4?=
 =?us-ascii?Q?s6KzqDXfdH7RJ1H9uhFK0gUkd6KBjuvsTe7oPfOQh4I6U83Ukq/Z908jzBot?=
 =?us-ascii?Q?rAHkwoXdPVe5KPcE4xtEfgbv9c+rCOwePeD8iXCDonHmSOg/004flA=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7af070-0544-4f20-7733-08da0bdc9afa
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 08:18:54.8725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tAAirho1E2Tk/7Sip8sEDIW4UwiENNpf8XnEFHqgUP32lC/cS0Y6+i7DwkgodozQSMr3Ydgczn00ManhIomyYMedWHr+TmS7xfzlfAbImE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7748
X-Proofpoint-GUID: pjAvL6wm-D7JCXkHgrzdCYqFX8li6Cc5
X-Proofpoint-ORIG-GUID: pjAvL6wm-D7JCXkHgrzdCYqFX8li6Cc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_02,2022-03-21_01,2022-02-23_01
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
 monitor/hmp-cmds.c |  20 ++++++++-
 qapi/ui.json       |  24 +++++++++--
 ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 144 insertions(+), 12 deletions(-)

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
index 634968498b..bf3ba76bd3 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1720,9 +1720,27 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
     const char *filename = qdict_get_str(qdict, "filename");
     const char *id = qdict_get_try_str(qdict, "device");
     int64_t head = qdict_get_try_int(qdict, "head", 0);
+    const char *input_format  = qdict_get_try_str(qdict, "format");
     Error *err = NULL;
+    ImageFormat format;
 
-    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
+    int val = qapi_enum_parse(&ImageFormat_lookup, input_format,
+                              IMAGE_FORMAT_PPM, &err);
+    if (err) {
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
index da434ce1b2..8814d50bcd 100644
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
+       png_write_row(png_ptr, buf);
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


