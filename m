Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1176BF07B9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 22:08:05 +0100 (CET)
Received: from localhost ([::1]:50060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iS63X-00013Q-UY
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 16:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58241)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iS5p3-0000MO-9s
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 15:53:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iS5p1-0001y8-W3
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 15:53:05 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35186
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
 id 1iS5p1-0001xs-RL; Tue, 05 Nov 2019 15:53:03 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA5KpWQK020305; Tue, 5 Nov 2019 15:53:03 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w3ftes68b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 15:53:03 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id xA5Kq7Dg021881;
 Tue, 5 Nov 2019 15:53:02 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w3ftes683-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 15:53:02 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA5Ko0qo018320;
 Tue, 5 Nov 2019 20:53:06 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 2w11e7176h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 20:53:06 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA5Kr1pX39518654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2019 20:53:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D149D124054;
 Tue,  5 Nov 2019 20:53:01 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE948124052;
 Tue,  5 Nov 2019 20:53:01 +0000 (GMT)
Received: from localhost (unknown [9.53.179.218])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  5 Nov 2019 20:53:01 +0000 (GMT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/55] curl: Pass CURLSocket to curl_multi_do()
Date: Tue,  5 Nov 2019 14:52:14 -0600
Message-Id: <20191105205243.3766-27-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105205243.3766-1-mdroth@linux.vnet.ibm.com>
References: <20191105205243.3766-1-mdroth@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911050170
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: qemu-stable@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

curl_multi_do_locked() currently marks all sockets as ready.  That is
not only inefficient, but in fact unsafe (the loop is).  A follow-up
patch will change that, but to do so, curl_multi_do_locked() needs to
know exactly which socket is ready; and that is accomplished by this
patch here.

Cc: qemu-stable@nongnu.org
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190910124136.10565-5-mreitz@redhat.com
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
(cherry picked from commit 9dbad87d25587ff640ef878f7b6159fc368ff541)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 block/curl.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 5838afef99..cf2686218d 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -185,15 +185,15 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
     switch (action) {
         case CURL_POLL_IN:
             aio_set_fd_handler(s->aio_context, fd, false,
-                               curl_multi_do, NULL, NULL, state);
+                               curl_multi_do, NULL, NULL, socket);
             break;
         case CURL_POLL_OUT:
             aio_set_fd_handler(s->aio_context, fd, false,
-                               NULL, curl_multi_do, NULL, state);
+                               NULL, curl_multi_do, NULL, socket);
             break;
         case CURL_POLL_INOUT:
             aio_set_fd_handler(s->aio_context, fd, false,
-                               curl_multi_do, curl_multi_do, NULL, state);
+                               curl_multi_do, curl_multi_do, NULL, socket);
             break;
         case CURL_POLL_REMOVE:
             aio_set_fd_handler(s->aio_context, fd, false,
@@ -392,9 +392,10 @@ static void curl_multi_check_completion(BDRVCURLState *s)
 }
 
 /* Called with s->mutex held.  */
-static void curl_multi_do_locked(CURLState *s)
+static void curl_multi_do_locked(CURLSocket *ready_socket)
 {
     CURLSocket *socket, *next_socket;
+    CURLState *s = ready_socket->state;
     int running;
     int r;
 
@@ -413,12 +414,13 @@ static void curl_multi_do_locked(CURLState *s)
 
 static void curl_multi_do(void *arg)
 {
-    CURLState *s = (CURLState *)arg;
+    CURLSocket *socket = arg;
+    BDRVCURLState *s = socket->state->s;
 
-    qemu_mutex_lock(&s->s->mutex);
-    curl_multi_do_locked(s);
-    curl_multi_check_completion(s->s);
-    qemu_mutex_unlock(&s->s->mutex);
+    qemu_mutex_lock(&s->mutex);
+    curl_multi_do_locked(socket);
+    curl_multi_check_completion(s);
+    qemu_mutex_unlock(&s->mutex);
 }
 
 static void curl_multi_timeout_do(void *arg)
-- 
2.17.1


