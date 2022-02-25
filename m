Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA774C443C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 13:05:35 +0100 (CET)
Received: from localhost ([::1]:44408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNZLp-0006d3-QC
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 07:05:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNZFZ-0004MK-Hp
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:59:05 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:57970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNZFW-0004Te-Hn
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:59:04 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21P5OpxI004420;
 Fri, 25 Feb 2022 03:58:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=noO1kpx6tXFU4adVkgauV9+QSdMxCvGu2WaUOGZbsFk=;
 b=I9rpNsZfzFZcCk/RkWurYbeqy1qhAn+ARAKOgZRYXeYbGtjwtDz29J356K87DPOZUFr1
 TNUSmHYrz3WNDrHhyPKMMbR6Hbsw7KnSZrCs8KX04CjU78ZMBi5Rila5CzTEYn09fBOU
 ZuQoGJbR4ZTTaSS1W45QFhZ/lxkODVCXImfK6BOn4lXZKVpFTexKINsX0Gnkxu2iGWKD
 ZCMSAHzFV9Il/5ckT7WV+NTJVURv/JZBb2Bw+9x9RluEsi140rJpZ6OhdOf7W3LzfDNP
 otChTN9ztsduG9ukAWF7L8eGOs2x9rdrW4alCml8PT8Cl6LpFPYh+WK6y7B/cF5bwzDc sA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3eerxqgqqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 03:58:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UM6Z4gMlmMt58hBtYCpnt/0tDRDRRTN2/g0pTshJG3JPwTGbJvs+RrppIQsvFG1dJaauQHh8HDX5X7JO3hOia3VdEqOwckQFPtgubLIRUQImZQl47206dRwV9kJyYqG9wQz2Jn5mBSM3hbE2jJ9WzawB2BMrZEiBf380gQmvbu1VvjXRZ4YudVBEsFeuS/Ajo93WXyihU5Wb8m+FOQ5k5EBaMtN6ZmvN1mocz4Ed9Cn5DGstr3UqO7qPFz00lfRrqsg4PQ+GqMQZ0QeTgjtiEkG9yGRpFl+hUP6yDitigeMm9kvQSkmlOxzPM+n7OPrEMiwtNDsVDTZLC4eysuiN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noO1kpx6tXFU4adVkgauV9+QSdMxCvGu2WaUOGZbsFk=;
 b=SFEA26BYxM1dhfraHAT3YhqpcIAlPdWEob64tmVpiVUteHLsTF3rVZ9UwTZGiaPrp7zT1bbb+h+yY8k2Q+tpLb8xsrLq0JlFh57koBDGMKJ/RmGlaxm7ioYK77LEBoGSIpmr7i93jtHfiI17EsAUsA6hXggphdO7O7l0RiZ2tEdjWvJ8ff9ZH0L8LCtiRVmPwrtn9StRUc0kewBK/dyACTzq29pqSkpl3s4Wmr7QegdsG1LJajyjGlVURv3hmDYGcsoomz/bOYfrzreF1UrWY06esZF01KYw3DBd+H3hLfMuuU/bODfZC3GjVjP9JnYqx5nvZawN0okelHcpkDtlHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by SN6PR02MB4639.namprd02.prod.outlook.com (2603:10b6:805:ab::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 11:58:46 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 11:58:46 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] Added parameter to take screenshot with screendump as PNG
Date: Fri, 25 Feb 2022 11:58:30 +0000
Message-Id: <20220225115830.177899-2-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220225115830.177899-1-kshitij.suri@nutanix.com>
References: <20220225115830.177899-1-kshitij.suri@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::14) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c505567-9079-4f61-db08-08d9f8562d3f
X-MS-TrafficTypeDiagnostic: SN6PR02MB4639:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB4639A2BE1ACBF9F2620490A6993E9@SN6PR02MB4639.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 39h9ojnGne/LR97GSbZaLhxzMJAPBi7J2/S/VcT4LsSSZmWT4iTGY0TjHMySVXl0dGSMT7E9+wSPPXAfHyS2m2HQjdIPHIGeOHFrg/XgJG/1ugy934zc7gViYrzo6r8ScnJ7adi2pC4g3Fip9QS6+08EV5aBAHmjEg1D96HsDVdo54k0Axit7Mrx5S6IjnGLSWVo/qKqzX4Xvg/llrOJTYEfXNBHptS9pb79LZSI0YRpROm4mgILkzTQSxJE0z1LCGtaXs1layzZ3+pEaIS3MjLYTOFFzQ0u6hMDj1XhHdNBVkXNE3BacwkljfufT9ik/kZkeqfGaDaEtmROrHeRb2ln3S5hFoG2qHDNtddZcm2ecpKBO/BvvYZmwd75yW8NEW4rpfiPbfP8Yt0NQ5lSlUW/GxbpJbM9TQwYYy41WOEImGWvfXlTw629T8DmOOpOg5YCPo5zudhQDx7mZjGwT+lmgT0KTUzEnJ8rqFI7GDkm5GekJXqlU6C5B8EXwxQ59IM3g8HsVAQ988uF3coNcaO2P1VXoJkyMMckU7iAeJ1QOmRDokQD4RYZ1pUJkZ7IgIxLhqCUWsgiUtNy/Hj24KpbMOevYIejNIOVXFRDa8+nJR5VGtsHiBBdMxnM2oXIx0Wlq2o/gVPWUNlXJYqx7cQJJNvISZNvXDAlS1arKwgv84hqyS7QRgITT7a+s0VDSj29Pr+Y+KykMnqxhjL/ZMPh4/7NEDUjc8DLDrldgcZnRxFMIuaRePkz4julH/CXOL9Afayf9GNILcwQGpI0e/rDbhURMuv6GeW6lKRLBwE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(86362001)(38350700002)(316002)(6916009)(508600001)(36756003)(6486002)(5660300002)(44832011)(8676002)(966005)(66476007)(66556008)(107886003)(66574015)(66946007)(83380400001)(6512007)(6506007)(6666004)(52116002)(2906002)(4326008)(26005)(186003)(1076003)(2616005)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ah1QRxgCoV/iQi0kfvKgZf0sZ7Mufpz5Mz9Tq5gBXqch+SWqTgzX88PL9ztD?=
 =?us-ascii?Q?wzqlH6XAqkJXC8a8tqw/Trn6OxGigwH3x1iQUv4KnLupwkz9axiTpkbBOV+E?=
 =?us-ascii?Q?ZvLa/RHVcjmJf/RpzhxcHb+cgTya55gB43VS+tw6jHZYNfNZfJasbpaIoI5T?=
 =?us-ascii?Q?vthOAdt8U6R9HsAChXpfTgT7AIgcIv/ZrdCJq5ZoY5xM4aPLuuvZo2Uaottq?=
 =?us-ascii?Q?gu8iUtQp7VCnt6aBwBySM732Pm6ulLxMsI93aqozAEmSKzthubJazApMSBLk?=
 =?us-ascii?Q?Np4PflI774wkgeI9YgWgtnmmI+bGpy0oyD6qcz5vzfd4NAynDPMsdvR5Hrnl?=
 =?us-ascii?Q?oF219InZ4kOAXXe2Tz6f2lH83PRVi36fmHC8AD+hdodQpK9C+V9/3YQNOemq?=
 =?us-ascii?Q?diVJFFUoBx2JmLNRLy6oJgceWhMKXmTtnEoJ2qClP2t9VpsZwhnPXhMhccJp?=
 =?us-ascii?Q?fxVtKee+7ayzEQALh1lbQ4/SK3BKZHVKEcEBg6AsW+ZXs+0ZlCjUkbfmR7Wx?=
 =?us-ascii?Q?tACEOFVg26swj+PfyNLIQeqDPmsfblJxoGE5PL0DifCPFYf+r0y2xdLyJFcx?=
 =?us-ascii?Q?u2bPs1xERE/QuemolUXnU6itg4zVb7/xvY/kOuKgmwqYj25YSVbJVW2jlWk9?=
 =?us-ascii?Q?oWxcyMqGGIsWIYa6V3qr9j77Szjtgjskg/gwp+V4HkZ1ZnOXou8tyBlSZ5M8?=
 =?us-ascii?Q?uHbTYBbEF22ftZoq67Xl4Qc2kyCmoc7lY8A1iGaCzhzvoAEIFBkScQsTPWIC?=
 =?us-ascii?Q?v22/3iT/OhLXhqIKISOdQapeBizoj70hjjJhhzrVwkYfh3kTHqfgQaiMtl0j?=
 =?us-ascii?Q?sLsMHDJlLKu9Yj74MuKX1sU7NSikTcPhT2fxaOhlJNKP8+KMry0xStdjCVAQ?=
 =?us-ascii?Q?859l9p/XsiBvmqd1yy4IIttoCbES/NKBCo3o6b105X75SIHJI43s0pE/iKPK?=
 =?us-ascii?Q?JBvFpPT3mOajQzVBu8eCHuDu3u67AScL/lQDSeTXYeJgO13yZVQqQIiEMJuh?=
 =?us-ascii?Q?33qE4FcyxIWvQ/vUFEk9WgzCDJhNDTJNwBwVaevKE8Bt+hLmUEa71OZL8zIs?=
 =?us-ascii?Q?VxmSu/rTuxIQqs3I9zi4/ZgLSQAfyETIjI7UCyyQvwPrzXTqG0MzF1ympj9t?=
 =?us-ascii?Q?u2+Lsv6HBDeQ9w3VfQEvSMJdTP/ao+Yb+pjhaSXeW1pS7L3duCNNvX6vxGEi?=
 =?us-ascii?Q?ZFGcOAoREwGumE/UuUYyfMA+FzZPDD02WdwwL35KwTVIXKRAG9YDT4dmyeav?=
 =?us-ascii?Q?Hh9FmvKN2ut/4EpXz3O6EKrbehfbxkSJh1pmGa1ROpTDmW1WJ2FSHqoFnCgJ?=
 =?us-ascii?Q?nPudBekHxDRU5qSMwJvufMKGBi/fRtwkn7dLrgrWpK9xeXzuIdTD1YKgGhPV?=
 =?us-ascii?Q?gIELqHGvGF+NCaiuicwT7eCR8/vjFeyGIBGC+XDZfcQgEZGH5/7as4swUiwy?=
 =?us-ascii?Q?bhr69fWf/b6wYdBhLcYOJwJM6u9hYmbprQ3JOERIuBxI9+9X/mQtzMNpdoDy?=
 =?us-ascii?Q?xKXwEkDbMiDoHnCATw8io9ezfHCvsB2vWDlALi5JH2Z9+Yn0nwuImHDmImTU?=
 =?us-ascii?Q?JV2uIijNOBeZ+whaMyDTE+DS+oTMpEtTxsvYk6F+sfvrlGaWcRiOTD8tx9i6?=
 =?us-ascii?Q?uIWZhhJA2PxdDwSgxNxXXJw6pMe1AxNZYpJgcWBgJ+tYseN+Pizio4LgxvJy?=
 =?us-ascii?Q?N9vampWTtgs3Yyc2q9vM/1WdDHU=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c505567-9079-4f61-db08-08d9f8562d3f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 11:58:46.1077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nd16yjPgNCxFLohyqzQ/Gg7ooa93XqfwRQPPJduXVj/gYsIlMAyDe6zrkR2O0C/nF5OeSHPDT0JwbqDSw4R7TaL+evt9KIq0anafi5YpW+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4639
X-Proofpoint-ORIG-GUID: XTxzItPPPC_CZVKd2ktFivN_Qr0UxcyV
X-Proofpoint-GUID: XTxzItPPPC_CZVKd2ktFivN_Qr0UxcyV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_07,2022-02-25_01,2022-02-23_01
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
 hmp-commands.hx    |  11 ++---
 monitor/hmp-cmds.c |   8 +++-
 qapi/ui.json       |  25 ++++++++++--
 ui/console.c       | 100 +++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 132 insertions(+), 12 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 70a9136ac2..e43c9954b5 100644
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
+  Save screen as an image *filename*.
 ERST
 
     {
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 8c384dc1b2..c300545f34 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1677,9 +1677,15 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
     const char *filename = qdict_get_str(qdict, "filename");
     const char *id = qdict_get_try_str(qdict, "device");
     int64_t head = qdict_get_try_int(qdict, "head", 0);
+    const char *input_format  = qdict_get_str(qdict, "format");
     Error *err = NULL;
+    ImageFormat format = IMAGE_FORMAT_PPM;
+    if (input_format != NULL && strcmp(input_format, "png") == 0) {
+        format = IMAGE_FORMAT_PNG;
+    }
 
-    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
+    qmp_screendump(filename, id != NULL, id, id != NULL, head,
+                   input_format != NULL, format, &err);
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
index 40eebb6d2c..6180d293e6 100644
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
@@ -289,6 +292,87 @@ void graphic_hw_invalidate(QemuConsole *con)
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
+        error_setg(errp, "Failed to create file from file descriptor");
+        return false;
+    }
+
+    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
+                                           NULL, NULL);
+    if (!png_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write struct");
+        free(f);
+        return false;
+    }
+
+    info_ptr = png_create_info_struct(png_ptr);
+
+    if (!info_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write info");
+        free(f);
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
+        error_setg(errp, "PNG creation failed. Unable to close file");
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
@@ -327,7 +411,8 @@ static void graphic_hw_update_bh(void *con)
 /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
 void coroutine_fn
 qmp_screendump(const char *filename, bool has_device, const char *device,
-               bool has_head, int64_t head, Error **errp)
+               bool has_head, int64_t head, bool has_format,
+               ImageFormat format, Error **errp)
 {
     g_autoptr(pixman_image_t) image = NULL;
     QemuConsole *con;
@@ -383,8 +468,17 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
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


