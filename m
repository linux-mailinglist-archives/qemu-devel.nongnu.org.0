Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5D01683AA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 17:36:32 +0100 (CET)
Received: from localhost ([::1]:32866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5BHz-0005M6-7w
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 11:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david.edmondson@oracle.com>) id 1j5BER-00013g-IS
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:32:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david.edmondson@oracle.com>) id 1j5BEQ-0000NJ-Hx
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:32:51 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:35766)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david.edmondson@oracle.com>)
 id 1j5BEN-0000LA-LS; Fri, 21 Feb 2020 11:32:47 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01LGV5bH024253;
 Fri, 21 Feb 2020 16:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=iBNQeoHxQwvpeGKNBw3AigaYz1rA0uTaMhD0FMSxPgc=;
 b=pUD9bgOKifQOoVZmcncUcje5RrJYt8BHUT/MCXqc39xboQPh+wrXpx2SQPxBSAl3qMiy
 VzNgIh020iwyhMoy0on5BUvtYUhT3YPobBhoofSPAJus8MRqSlbIYFEk0RZ/ROHhLwM6
 JpyX69C1akN/jYNRnrlKSUXwCNuGYr5O9NSNaHRxO/YvxqLDxh2lBD5tE8KJ/mcQAXi8
 6HwiV2FGRElDnD/vVsOLgxCraap4IXB0fW7D3fg6SjCutiGIi3Y2zyR01rvjP7fCZI9c
 Piz/eHixEx2eIfByL1VRqos0NjOgpK6MBAvD6jfZyBXmZjQen6XsZQZllTRJjilcUx0+ aA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2y8uddhm1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 16:32:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01LGVsXX124539;
 Fri, 21 Feb 2020 16:32:44 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2y8udnskst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 16:32:44 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01LGWhpL019996;
 Fri, 21 Feb 2020 16:32:43 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 21 Feb 2020 08:32:42 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id a95ab626;
 Fri, 21 Feb 2020 16:32:39 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] block/curl: HTTP header fields allow whitespace around
 values
Date: Fri, 21 Feb 2020 16:32:37 +0000
Message-Id: <20200221163238.60688-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221163238.60688-1-david.edmondson@oracle.com>
References: <20200221163238.60688-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9538
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=996
 phishscore=0 suspectscore=1 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9538
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 impostorscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=1
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210123
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.86
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
Cc: Kevin Wolf <kwolf@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RFC 7230 section 3.2 indicates that whitespace is permitted between
the field name and field value and after the field value.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 block/curl.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index f86299378e38..f9ffb7f4e2bf 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -214,11 +214,34 @@ static size_t curl_header_cb(void *ptr, size_t size, size_t nmemb, void *opaque)
 {
     BDRVCURLState *s = opaque;
     size_t realsize = size * nmemb;
-    const char *accept_line = "Accept-Ranges: bytes";
+    const char *header = (char *)ptr;
+    const char *end = header + realsize;
+    const char *accept_ranges = "Accept-Ranges:";
+    const char *bytes = "bytes";
 
-    if (realsize >= strlen(accept_line)
-        && strncmp((char *)ptr, accept_line, strlen(accept_line)) == 0) {
-        s->accept_range = true;
+    if (realsize >= strlen(accept_ranges)
+        && strncmp(header, accept_ranges, strlen(accept_ranges)) == 0) {
+
+        char *p = strchr(header, ':') + 1;
+
+        /* Skip whitespace between the header name and value. */
+        while (p < end && *p && g_ascii_isspace(*p)) {
+            p++;
+        }
+
+        if (end - p >= strlen(bytes)
+            && strncmp(p, bytes, strlen(bytes)) == 0) {
+
+            /* Check that there is nothing but whitespace after the value. */
+            p += strlen(bytes);
+            while (p < end && *p && g_ascii_isspace(*p)) {
+                p++;
+            }
+
+            if (p == end || !*p) {
+                s->accept_range = true;
+            }
+        }
     }
 
     return realsize;
-- 
2.24.1


