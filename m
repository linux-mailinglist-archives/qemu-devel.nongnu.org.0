Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DFB4BFE5E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:21:35 +0100 (CET)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXuw-0005QA-7g
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:21:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nMX5e-0007rG-Fl
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:28:34 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:36214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nMX5a-0005TZ-Na
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:28:33 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21MEb4xd021434;
 Tue, 22 Feb 2022 07:28:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=IxprkpzYVyyyXkV7Qq6Wwna9q1Fn0q0+x1bmW7eFnDU=;
 b=D/WQXa5Tfyg2OsirfdG52Mk+49YQD42WYsRwXVQaII3AwS0qrKpkRUMAGScvozWfMmpl
 QJmYiHMVNeRfZFH9lDd7TYA9cC1qL52t+QSJnVvtWTf+aAeC3/F2FSq+MXkkO939vsK/
 QFgRko9E9l4Qj+3RVKYSBHbmqDRMaGG7a6lnWnTzVQOBRIl6qwcUDRXTay8XCFqBqeAp
 q0StId4YCY9Bb1oPNYhScAgLuaaTwtZgLYow3cN9UFtFHtIN5othDDjhu7xtfppeHSId
 MnpjOUJiyX9BoRIHfSJZ/5C38R54+CN5GHjvU3qWmrZATUebqScKkoFwWlbrkdQSIfhy jA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3ecdh6284r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 07:28:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMjqnP+NZpOl81IDeY99ehsk+EYReH9TDVTQke69kB4M9haEMnVjISIxGv9X1tkRAJJpgUi/2OhgOlA2l2IYCyRjxxCDvc5HcSdbyHjZ/2Ew0gKDWEI6yh0M+0a8s0DevIp1B0un1Q4Geiuq31WliaySGX+x5WB+x0r9i3Ncz5ZQHR24oZbuDTeDs5TYGDRbOBtkrYrzbG4bwEQZDTCXgN/4scuY69x+HCWjmkKVg64UYzOrik0dF/SmWBK/7kxqvD31frNj4t0jkvIIa9MoCrZ379UC6C+zuMp7lN69BHHvhwY0davFp9FZa9ks25JBctUrnU46bUYLc/3cl6BOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxprkpzYVyyyXkV7Qq6Wwna9q1Fn0q0+x1bmW7eFnDU=;
 b=OLkWHz4osMXZ2rxytsLYwUsR425e0JBNcS0iDQVe3EKi8ge0ENglUCE3b4tT6lLXtdQX4qi8LnZvMQGtouM1znT3IYlHNBb71n+jgKEHMq4mGG4rMgMI5i2rNToMTZh/IARc83cMUsGiNOGC6cRNXnVPwTUnhbysE725JxtjGdGHs3TXgMS8zQ5HDddDgiJ3LyH4bZw9mJKBKveN51CnLFCsxb4eAuLr7EwQhIqKVuk5AoudpASJQtvCQvl2qPOH2wS/ZnUTXL51YRLg4A/W5grWRm+LzbBufp8P3wX6AxOhUUVcTSmbdOCM5mKoUMxYsHLXjm5nH+Ci0c2HU18Low==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by DM6PR02MB6457.namprd02.prod.outlook.com (2603:10b6:5:1fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 15:28:23 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5017.022; Tue, 22 Feb 2022
 15:28:23 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Added parameter to take screenshot with screendump as PNG
Date: Tue, 22 Feb 2022 15:27:58 +0000
Message-Id: <20220222152758.207415-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0137.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::22) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25f67bca-2c04-49d3-78eb-08d9f617f65a
X-MS-TrafficTypeDiagnostic: DM6PR02MB6457:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB6457FA9E3EF9000DA8973826993B9@DM6PR02MB6457.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: arPIePoVEXxVUIG1ziQJ84XE8OlDUfPfVOEnrEzV6Wo8dIleaOzVyq0VrCJsWSGCx81Wu06gSDn937QtkcWtlKhvkur+v3+fCdFQivhEn1VxUvXtXtjAvHQ+17PNpSEREAOLxhb/amhITGM0yNr59sAkrsvDxASdQHwP67KvGXdt2GDF/s9i+JqWk7BjYY/WukojeoZmAOjckyT8KW8POF9d0+pkzPPZXAc/L/C66yUXRT9i20F/G/UeHttBvq4NOI9UDyXVCmxlWuvsnvJFrNlOGbO+P9tZn6yshhJ+3MY4sSQca9+Aegebmvf8dm8jUHHbLnyZtBeYNYXQNn5PI83oK2Vdh5zjl9fA3mRozfSLPvQloQxUckAtcLK0hQFTY918tQg/w3dqo0xbDXbqWjiwg4sVhLs4swAteCmU8usZnJLnUjQsCJ5j2DkG38QL+Cp/dhqZy+kdWELNAVdiZ0GKLQr3sSfAKWkbYwLcGB/27swdD+WfUMI/ONZWtxtvJ16JDJTD0LSjDBWg57HaQ+W8eotImLw440s8oGiwRRHFSKk9sJpIWSb2DOedXpn9m9wX/77zASvFJ95k/f0XTlS4MV/rMOM2EcqaBxjyHYsnfRNmrH7a+ZzdVbDeyDrdGghNA0HO11+dQCgoo1G8/PpEekg2+uw/h0fqx+Xe3utHxAr7xoab5jrGDF3FzopoyVurnuIdMu/RMgamD8ULZbNDI2A9iR/aeAgrQqu0pxwmHVs1/+iyKhZ6KIbn+G3BXdkk+yPQD8kyVS8pT4t4jTDLB18LSZvD/BVpXKiGFxrx1Smi8lNNq16IqPPyl0my
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(83380400001)(6486002)(966005)(508600001)(66946007)(8676002)(66556008)(6916009)(316002)(66476007)(6512007)(1076003)(8936002)(5660300002)(2616005)(44832011)(107886003)(6666004)(36756003)(26005)(6506007)(86362001)(186003)(52116002)(38350700002)(38100700002)(66574015)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mdIptgnmuS80fleZwldCijuBd9jt0BGIOqoEudf3J4fCz4as4pcdzPY4qGTF?=
 =?us-ascii?Q?M42CYLeRK1g9XykuL2+DuWBxQepvTq/NvPmqHzS9h0149f+7WUyBynAhuUsQ?=
 =?us-ascii?Q?yC3tpiiteyOxJARPrQO+sFEqC9WTiLwS7u19R5WKwLztNblnBSeumEFdBhIx?=
 =?us-ascii?Q?rZbd2kFDT2DxbmYesF5O/WB85dc2gzJh6QIOTWicc9rNMkwzamP7Oh57A9XH?=
 =?us-ascii?Q?k/2GFk+uxA2RQaQM/VQzW3DhXdTGzYEVzQyUc1/aJs5aHO+uAr8UNW4s4HbV?=
 =?us-ascii?Q?PSmhIwlD/QKmF6q/pWZ4Q3wLqK1AmrXMV4XqE92jZz/K5MYWoxh9RkZXUf03?=
 =?us-ascii?Q?iQnoDShIu6j/YNOxw8FgrCEbwjU2mEslCIgj2qURedIiCFg/pS3WyIuIQaCe?=
 =?us-ascii?Q?Iwou3ACnLsVEoZ7hgAYDjbRaLAwh4M09M+SywrNLTwps6qZ9rdIW72iaaIbk?=
 =?us-ascii?Q?SnGHcS3Pigvd9zWIcusyyWP9uxH/Ph2Ei+7jmh6IEjV7dOAM9a1RhKeEI9fT?=
 =?us-ascii?Q?PUdcpdqgXWN4BzvXCFRPfUr7YzdoLi/FB6nXKxZFFMPbKI4w1bDd7dden2i6?=
 =?us-ascii?Q?02gsA938Vj7F76rVW0UfqjVG6Xr+YPEaCUlFWVnDL3kqq3JHFAaPrFq/5AhS?=
 =?us-ascii?Q?QY1NvAsmmJgGTA/n9yzSOC2Y3qQqIKJ+WW2ylHorPfSyu8oas9kGSyRpUzFt?=
 =?us-ascii?Q?coLx16aHsRxcWbNnBIk3bJMvhf2JOBr2/TfNnE33zI9pozB1mXFsNXb6GcC1?=
 =?us-ascii?Q?nh5Hj8VVvT6odaY4yROTqSzuTkghs9JWm2CfA7j1gY6yr1oWhVm34ks45mvc?=
 =?us-ascii?Q?2oshk5vHPeBrsaDYK+/1ly35PN/gWNBsWlnItq8MkrAhxL2JPg/ToaiAWr+K?=
 =?us-ascii?Q?FQHzQxkJiUjWNratN0f3sjYAiX9iwm3zfs0olmztIJsG4FAwK0nnue+NjsR9?=
 =?us-ascii?Q?Ly+EWttdVpEs/1Tw1xJwzFZ1Y5p2o8G3twb/EzYWMjmZPjjhq1+XqWa0qTNB?=
 =?us-ascii?Q?CvIKMEoCMgsmblRhKw8xFC01d2tmN7O9uxEDmfdUPjwQZ14OQQ+sdW4dMw98?=
 =?us-ascii?Q?FX05pObohoWOMFN1LqIIGlGsh4w7tkce/W6acdyFCZ6dOBbJkwwtENn+7xJE?=
 =?us-ascii?Q?lkZ1Mne5jxBToh8dp5SeSHERWXWUJOATURhuueubyOuyoN90XSD6gic2Bkjd?=
 =?us-ascii?Q?hZNoQs8KUu39e0aZnMi9ra9Sh39gtAkI/bqQjoZjq07CTKTJjVFY491Pbooo?=
 =?us-ascii?Q?7Vwgm+9EYQ4bzozz6dswSKVBYLAO43B8dFU2FLyevNvTHwub49MdvKg71z0u?=
 =?us-ascii?Q?p0eLwUTlhdxLUGHhe2U22PHF+Hgj55WzILO9bu/8m3y3rDhqhe6kaSuvp4FH?=
 =?us-ascii?Q?9W0pJtxV9t/qPNAA58pxO+AjsrL0ZI0aL/Yze8cR/IQ/89nFZ8Nn/zvicEPb?=
 =?us-ascii?Q?VmA7sc+xmrOA5/TnK9x/W6FI11haRIwtJfFKB0j6JTzEi43VlyiTo7fWIqLC?=
 =?us-ascii?Q?e4jTZeLo4a2KqduSq4cqjLs8pVK6kfoYWyftpHbioHGawwOGlwwOIb/mr7eM?=
 =?us-ascii?Q?04hlhEIXF6VnsJMgud18a7Z0tWqOaxdd920C1y9mvAX6BapmoHC8qJMbFW4B?=
 =?us-ascii?Q?AhidQzWa7oS4srUWADU85FczQF3ylvPAersJIt+o4R8IpZkY3qsZw0A8Z2g0?=
 =?us-ascii?Q?DdnElaZX6QY/YG06uD7JOlHylJk=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f67bca-2c04-49d3-78eb-08d9f617f65a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 15:28:23.0721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUQdDEhTDzvzTLutsbudJScyQt8weNGb3NMxBXNVybBl+Shs08ZBYHzz5SFuvsSMRe9KWzzjKyViL9DNZZ326iTlsrhpuj4CJvXLPEoFMhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6457
X-Proofpoint-ORIG-GUID: LB4n0hlcykiYzQpZ2jodgOn5Mm1393Ao
X-Proofpoint-GUID: LB4n0hlcykiYzQpZ2jodgOn5Mm1393Ao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-22_04,2022-02-21_02,2021-12-02_01
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
X-Mailman-Approved-At: Tue, 22 Feb 2022 10:46:46 -0500
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
 Kshitij Suri <kshitij.suri@nutanix.com>, kraxel@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently screendump only supports PPM format, which is un-compressed and not
standard. Added an "format" parameter to qemu monitor screendump capabilites
to support PNG image capture using libpng. The param was added in QAPI schema
of screendump present in ui.json along with png_save() function which converts
pixman_image to PNG. HMP command equivalent was also modified to support the
feature.

Example usage:
{ "execute": "screendump", "arguments": { "filename": "/tmp/image", "format":"png" } }

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
---
 hmp-commands.hx    |  11 ++--
 monitor/hmp-cmds.c |   4 +-
 qapi/ui.json       |   7 ++-
 ui/console.c       | 153 ++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 165 insertions(+), 10 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 70a9136ac2..2163337f35 100644
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
+                      "Default format for screendump is PPM.",
         .cmd        = hmp_screendump,
         .coroutine  = true,
     },
 
 SRST
 ``screendump`` *filename*
-  Save screen into PPM image *filename*.
+  Save screen as image *filename*.
 ERST
 
     {
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2669156b28..3fb1394561 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1665,9 +1665,11 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
     const char *filename = qdict_get_str(qdict, "filename");
     const char *id = qdict_get_try_str(qdict, "device");
     int64_t head = qdict_get_try_int(qdict, "head", 0);
+    const char *format  = qdict_get_str(qdict, "format");
     Error *err = NULL;
 
-    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
+    qmp_screendump(filename, id != NULL, id, id != NULL, head,
+                   format != NULL, format, &err);
     hmp_handle_error(mon, err);
 }
 
diff --git a/qapi/ui.json b/qapi/ui.json
index 9354f4c467..9fdb56b60b 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -76,7 +76,7 @@
 ##
 # @screendump:
 #
-# Write a PPM of the VGA screen to a file.
+# Write a screenshot of the VGA screen to a file.
 #
 # @filename: the path of a new PPM file to store the image
 #
@@ -87,6 +87,9 @@
 #        parameter is missing, head #0 will be used. Also note that the head
 #        can only be specified in conjunction with the device ID. (Since 2.12)
 #
+# @format: image format for screendump is specified. Currently only PNG and
+#             PPM are supported.
+#
 # Returns: Nothing on success
 #
 # Since: 0.14
@@ -99,7 +102,7 @@
 #
 ##
 { 'command': 'screendump',
-  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
+  'data': {'filename': 'str', '*device': 'str', '*head': 'int', '*format': 'str'},
   'coroutine': true }
 
 ##
diff --git a/ui/console.c b/ui/console.c
index 40eebb6d2c..7813b195ac 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -37,6 +37,9 @@
 #include "exec/memory.h"
 #include "io/channel-file.h"
 #include "qom/object.h"
+#ifdef CONFIG_VNC_PNG
+#include "png.h"
+#endif
 
 #define DEFAULT_BACKSCROLL 512
 #define CONSOLE_CURSOR_PERIOD 500
@@ -289,6 +292,137 @@ void graphic_hw_invalidate(QemuConsole *con)
     }
 }
 
+#ifdef CONFIG_VNC_PNG
+/**
+ * a8r8g8b8_to_rgba: Convert a8r8g8b8 to rgba format
+ *
+ * @dst: Destination pointer.
+ * @src: Source pointer.
+ * @n_pixels: Size of image.
+ */
+static void a8r8g8b8_to_rgba(uint32_t *dst, uint32_t *src, int n_pixels)
+{
+    uint8_t *dst8 = (uint8_t *)dst;
+    int i;
+
+    for (i = 0; i < n_pixels; ++i) {
+        uint32_t p = src[i];
+        uint8_t a, r, g, b;
+
+        a = (p & 0xff000000) >> 24;
+        r = (p & 0x00ff0000) >> 16;
+        g = (p & 0x0000ff00) >> 8;
+        b = (p & 0x000000ff) >> 0;
+
+        if (a != 0) {
+            #define DIVIDE(c, a) \
+            do { \
+                int t = ((c) * 255) / a; \
+                (c) = t < 0 ? 0 : t > 255 ? 255 : t; \
+            } while (0)
+
+            DIVIDE(r, a);
+            DIVIDE(g, a);
+            DIVIDE(b, a);
+            #undef DIVIDE
+        }
+
+        *dst8++ = r;
+        *dst8++ = g;
+        *dst8++ = b;
+        *dst8++ = a;
+    }
+}
+
+/**
+ * png_save: Take a screenshot as PNG
+ *
+ * Saves screendump as a PNG file
+ *
+ * Returns true for success or false for error.
+ * Inspired from png test utils from https://github.com/aseprite/pixman
+ *
+ * @fd: File descriptor for PNG file.
+ * @image: Image data in pixman format.
+ * @errp: Pointer to an error.
+ */
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    int width = pixman_image_get_width(image);
+    int height = pixman_image_get_height(image);
+    int stride = width * 4;
+    g_autofree uint32_t *src_data = g_malloc(height * stride);
+    g_autofree uint32_t *dest_data = g_malloc(height * stride);
+    g_autoptr(pixman_image_t) src_copy;
+    g_autoptr(pixman_image_t) dest_copy;
+    g_autofree png_struct *write_struct;
+    g_autofree png_info *info_struct;
+    g_autofree png_bytep *row_pointers = g_malloc(height * sizeof(png_bytep));
+    FILE *f = fdopen(fd, "wb");
+    int y;
+    if (!f) {
+        error_setg(errp, "Failed to create file from file descriptor");
+        return false;
+    }
+
+    src_copy = pixman_image_create_bits(PIXMAN_a8r8g8b8, width, height,
+                                        src_data, stride);
+
+    pixman_image_composite32(PIXMAN_OP_SRC, image, NULL, src_copy, 0, 0, 0, 0,
+                             0, 0, width, height);
+
+    memcpy(dest_data, src_data, sizeof(*src_data));
+
+    a8r8g8b8_to_rgba(dest_data, src_data, height * width);
+
+    for (y = 0; y < height; ++y) {
+        row_pointers[y] = (png_bytep)(src_data + y * width);
+    }
+
+    write_struct = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
+                                                 NULL, NULL);
+    if (!write_struct) {
+        error_setg(errp, "PNG creation failed. Unable to write struct");
+        return false;
+    }
+
+    info_struct = png_create_info_struct(write_struct);
+
+    if (!info_struct) {
+        error_setg(errp, "PNG creation failed. Unable to write info");
+        return false;
+    }
+
+    png_init_io(write_struct, f);
+
+    png_set_IHDR(write_struct, info_struct, width, height, 8,
+                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
+                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
+
+    png_write_info(write_struct, info_struct);
+
+    png_write_image(write_struct, row_pointers);
+
+    png_write_end(write_struct, NULL);
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
+    error_setg(errp, "Enable VNC PNG support for png screendump");
+    return false;
+}
+
+#endif /* CONFIG_VNC_PNG */
+
 static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
 {
     int width = pixman_image_get_width(image);
@@ -327,7 +461,8 @@ static void graphic_hw_update_bh(void *con)
 /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
 void coroutine_fn
 qmp_screendump(const char *filename, bool has_device, const char *device,
-               bool has_head, int64_t head, Error **errp)
+               bool has_head, int64_t head, bool has_format,
+               const char *format, Error **errp)
 {
     g_autoptr(pixman_image_t) image = NULL;
     QemuConsole *con;
@@ -383,8 +518,22 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
      * yields and releases the BQL. It could produce corrupted dump, but
      * it should be otherwise safe.
      */
-    if (!ppm_save(fd, image, errp)) {
+
+    if (has_format && strcmp(format, "png") == 0) {
+        /* PNG format specified for screendump */
+        if (!png_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
+    } else if (!has_format || (has_format && strcmp(format, "ppm") == 0)) {
+        /* PPM format specified/default for screendump */
+        if (!ppm_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
+    } else {
+        /* Invalid specified for screendump */
+        error_setg(errp, "Invalid format provided for screendump.");
         qemu_unlink(filename);
+        return;
     }
 }
 
-- 
2.22.3


