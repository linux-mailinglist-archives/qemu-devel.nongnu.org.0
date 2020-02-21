Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF43168396
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 17:34:21 +0100 (CET)
Received: from localhost ([::1]:32814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5BFr-0002ey-Ky
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 11:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49435)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david.edmondson@oracle.com>) id 1j5BER-00013X-C2
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:32:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david.edmondson@oracle.com>) id 1j5BEQ-0000ND-CQ
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:32:51 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:45414)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david.edmondson@oracle.com>)
 id 1j5BEN-0000LM-Lo; Fri, 21 Feb 2020 11:32:47 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01LGVe7Q104073;
 Fri, 21 Feb 2020 16:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=dMx0ZLYFM2GPQghj/Kt4dIRM5hEYlRsBsdw8Mdx6+Io=;
 b=XsQbS9dowjIo17DY2krbmseQCzb6AvOeBgq/XKj9Po5e/7x8ftNmymllUMAKC0L406xd
 lNaYioeVHo00RiLAvqxglzm0slRANeCyW1vcdicaI2ug79/kx7p336YPhFlOTLETtmV/
 puk8sY7TGyR2kV8QAXSkQFVlqG241IMvDSGdR2sEKU7V5Wecv+0zYu/ZJVqwxESQ+mMK
 81VB7F4+BWRQQidt2jlbWYdB0z3OFot3q1ZD3GyLnNnj8Az4mAZ1Sw9ntinJEDeuqAtH
 Z0GShLdk2B1SeSJ1eNJlh2YUOOu/URili0QEgGErfYFhat4uJIymKyJFhIgH9f7cRRqG WA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2y8udkskbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 16:32:45 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01LGVhn8086015;
 Fri, 21 Feb 2020 16:32:44 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2y8ud710wb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 16:32:44 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01LGWi7Q019999;
 Fri, 21 Feb 2020 16:32:44 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 21 Feb 2020 08:32:43 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 42591949;
 Fri, 21 Feb 2020 16:32:39 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] block/curl: HTTP header field names are case
 insensitive
Date: Fri, 21 Feb 2020 16:32:38 +0000
Message-Id: <20200221163238.60688-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221163238.60688-1-david.edmondson@oracle.com>
References: <20200221163238.60688-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9538
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=1 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9538
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=1
 spamscore=0 priorityscore=1501 adultscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 phishscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002210123
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.78
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

RFC 7230 section 3.2 indicates that HTTP header field names are case
insensitive.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 block/curl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index f9ffb7f4e2bf..1421e8fb9815 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -216,11 +216,11 @@ static size_t curl_header_cb(void *ptr, size_t size, size_t nmemb, void *opaque)
     size_t realsize = size * nmemb;
     const char *header = (char *)ptr;
     const char *end = header + realsize;
-    const char *accept_ranges = "Accept-Ranges:";
+    const char *accept_ranges = "accept-ranges:";
     const char *bytes = "bytes";
 
     if (realsize >= strlen(accept_ranges)
-        && strncmp(header, accept_ranges, strlen(accept_ranges)) == 0) {
+        && g_ascii_strncasecmp(header, accept_ranges, strlen(accept_ranges)) == 0) {
 
         char *p = strchr(header, ':') + 1;
 
-- 
2.24.1


