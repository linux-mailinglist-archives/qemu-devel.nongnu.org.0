Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C761D1610
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 15:42:44 +0200 (CEST)
Received: from localhost ([::1]:57524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYrel-000534-Ak
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 09:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eyal.moscovici@oracle.com>)
 id 1jYrb9-0000zP-4G; Wed, 13 May 2020 09:38:59 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:35194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eyal.moscovici@oracle.com>)
 id 1jYrb8-0005DR-2m; Wed, 13 May 2020 09:38:58 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04DDX9Wq023635;
 Wed, 13 May 2020 13:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=2YvLZRapzNNUWA58DYlojtp/pTZjH7rlMhyMwFTHNVw=;
 b=zNYO7tM/zwQWfWtL5iKkxKIidz4BDoCKByTwGSkKQdbC1IM2apYV6Su9CluZO5gEb4Ys
 DpiDVHeKvtK3R1vVY7haWYsGLdWn4sXNPtcIbMBm/mVynDeRAgJcaM7HXdbXwqFjC7wy
 CAcMLclr3BtQkqF2L+SN4n0jrxvGdGlbIZavptKSRhOXFW37h4ROyVJTdVy/s0lekSUl
 OcsISgg7homzyjOr+X1NIUIONvtcrzUO/UuRbK82Im/nsjY5PH/pGdBJHEFq4QPMgSRl
 lXerZ8H1XpD6uInPc7x5ke4BfHLla17DW+Wx+UpOvg9ImeHiGD68KRlPONAl+Ark7Jh2 nA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 3100xwc816-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 13 May 2020 13:38:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04DDY2W9113567;
 Wed, 13 May 2020 13:36:55 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 3100yek9nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 May 2020 13:36:55 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04DDaswg015458;
 Wed, 13 May 2020 13:36:54 GMT
Received: from localhost.localdomain (/10.74.123.68)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 May 2020 06:36:53 -0700
From: Eyal Moscovici <eyal.moscovici@oracle.com>
To: 
Subject: [PATCH v3 4/4] qemu-img: Add --start-offset and --max-length to map
Date: Wed, 13 May 2020 16:36:29 +0300
Message-Id: <20200513133629.18508-5-eyal.moscovici@oracle.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20200513133629.18508-1-eyal.moscovici@oracle.com>
References: <20200513133629.18508-1-eyal.moscovici@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9619
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005130121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9619
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 cotscore=-2147483648
 mlxscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005130121
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=eyal.moscovici@oracle.com; helo=aserp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 08:03:36
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Eyal Moscovici <eyal.moscovici@oracle.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 liran.alon@oracle.com, Yoav Elnekave <yoav.elnekave@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mapping operation of large disks especially ones stored over a
long chain of QCOW2 files can take a long time to finish.
Additionally when mapping fails there was no way recover by
restarting the mapping from the failed location.

The new options, --start-offset and --max-length allows the user to
divide these type of map operations into shorter independent tasks.

Reviewed-by: Eric Blake <eblake@redhat.com>
Acked-by: Mark Kanda <mark.kanda@oracle.com>
Co-developed-by: Yoav Elnekave <yoav.elnekave@oracle.com>
Signed-off-by: Yoav Elnekave <yoav.elnekave@oracle.com>
Signed-off-by: Eyal Moscovici <eyal.moscovici@oracle.com>
---
 docs/tools/qemu-img.rst |  2 +-
 qemu-img-cmds.hx        |  4 ++--
 qemu-img.c              | 22 +++++++++++++++++++++-
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 0080f83a76..f4ffe528ea 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -519,7 +519,7 @@ Command description:
     ``ImageInfoSpecific*`` QAPI object (e.g. ``ImageInfoSpecificQCow2``
     for qcow2 images).
 
-.. option:: map [--object OBJECTDEF] [--image-opts] [-f FMT] [--output=OFMT] [-U] FILENAME
+.. option:: map [--object OBJECTDEF] [--image-opts] [-f FMT] [--start-offset=OFFSET] [--max-length=LEN] [--output=OFMT] [-U] FILENAME
 
   Dump the metadata of image *FILENAME* and its backing file chain.
   In particular, this commands dumps the allocation state of every sector
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index c9c54de1df..35f832816f 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -63,9 +63,9 @@ SRST
 ERST
 
 DEF("map", img_map,
-    "map [--object objectdef] [--image-opts] [-f fmt] [--output=ofmt] [-U] filename")
+    "map [--object objectdef] [--image-opts] [-f fmt] [--start-offset=offset] [--max-length=len] [--output=ofmt] [-U] filename")
 SRST
-.. option:: map [--object OBJECTDEF] [--image-opts] [-f FMT] [--output=OFMT] [-U] FILENAME
+.. option:: map [--object OBJECTDEF] [--image-opts] [-f FMT] [--start-offset=OFFSET] [--max-length=LEN] [--output=OFMT] [-U] FILENAME
 ERST
 
 DEF("measure", img_measure,
diff --git a/qemu-img.c b/qemu-img.c
index 80340cb218..bce7b49799 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3008,6 +3008,8 @@ static int img_map(int argc, char **argv)
     int ret = 0;
     bool image_opts = false;
     bool force_share = false;
+    int64_t start_offset = 0;
+    int64_t max_length = -1;
 
     fmt = NULL;
     output = NULL;
@@ -3020,9 +3022,11 @@ static int img_map(int argc, char **argv)
             {"object", required_argument, 0, OPTION_OBJECT},
             {"image-opts", no_argument, 0, OPTION_IMAGE_OPTS},
             {"force-share", no_argument, 0, 'U'},
+            {"start-offset", required_argument, 0, 's'},
+            {"max-length", required_argument, 0, 'l'},
             {0, 0, 0, 0}
         };
-        c = getopt_long(argc, argv, ":f:hU",
+        c = getopt_long(argc, argv, ":f:s:l:hU",
                         long_options, &option_index);
         if (c == -1) {
             break;
@@ -3046,6 +3050,18 @@ static int img_map(int argc, char **argv)
         case OPTION_OUTPUT:
             output = optarg;
             break;
+        case 's':
+            start_offset = cvtnum("start offset", optarg);
+            if (start_offset < 0) {
+                return 1;
+            }
+            break;
+        case 'l':
+            max_length = cvtnum("max length", optarg);
+            if (max_length < 0) {
+                return 1;
+            }
+            break;
         case OPTION_OBJECT: {
             QemuOpts *opts;
             opts = qemu_opts_parse_noisily(&qemu_object_opts,
@@ -3096,7 +3112,11 @@ static int img_map(int argc, char **argv)
         error_report("Failed to get size for '%s'", filename);
         return 1;
     }
+    if (max_length != -1) {
+        length = MIN(start_offset + max_length, length);
+    }
 
+    curr.start = start_offset;
     while (curr.start + curr.length < length) {
         int64_t offset = curr.start + curr.length;
         int64_t n;
-- 
2.17.2 (Apple Git-113)


