Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EEBF07B7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 22:08:02 +0100 (CET)
Received: from localhost ([::1]:50056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iS63U-0000vW-Sv
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 16:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iS5p5-0000QS-JE
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 15:53:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iS5p4-0001zi-4u
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 15:53:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19708)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
 id 1iS5p3-0001yu-SU; Tue, 05 Nov 2019 15:53:06 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA5KpZ9U138564; Tue, 5 Nov 2019 15:53:05 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w3dqspbca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 15:53:04 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id xA5Kqs3Z141794;
 Tue, 5 Nov 2019 15:53:04 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w3dqspbbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 15:53:04 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA5Knv35006016;
 Tue, 5 Nov 2019 20:53:03 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 2w11e7hgcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 20:53:03 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA5Kr2C643778346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2019 20:53:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F27C124054;
 Tue,  5 Nov 2019 20:53:02 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CB1B124052;
 Tue,  5 Nov 2019 20:53:02 +0000 (GMT)
Received: from localhost (unknown [9.53.179.218])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  5 Nov 2019 20:53:02 +0000 (GMT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/55] curl: Report only ready sockets
Date: Tue,  5 Nov 2019 14:52:15 -0600
Message-Id: <20191105205243.3766-28-mdroth@linux.vnet.ibm.com>
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
X-Received-From: 148.163.156.1
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

Instead of reporting all sockets to cURL, only report the one that has
caused curl_multi_do_locked() to be called.  This lets us get rid of the
QLIST_FOREACH_SAFE() list, which was actually wrong: SAFE foreaches are
only safe when the current element is removed in each iteration.  If it
possible for the list to be concurrently modified, we cannot guarantee
that only the current element will be removed.  Therefore, we must not
use QLIST_FOREACH_SAFE() here.

Fixes: ff5ca1664af85b24a4180d595ea6873fd3deac57
Cc: qemu-stable@nongnu.org
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190910124136.10565-6-mreitz@redhat.com
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
(cherry picked from commit 9abaf9fc474c3dd53e8e119326abc774c977c331)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 block/curl.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index cf2686218d..fd70f1ebc4 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -392,24 +392,19 @@ static void curl_multi_check_completion(BDRVCURLState *s)
 }
 
 /* Called with s->mutex held.  */
-static void curl_multi_do_locked(CURLSocket *ready_socket)
+static void curl_multi_do_locked(CURLSocket *socket)
 {
-    CURLSocket *socket, *next_socket;
-    CURLState *s = ready_socket->state;
+    BDRVCURLState *s = socket->state->s;
     int running;
     int r;
 
-    if (!s->s->multi) {
+    if (!s->multi) {
         return;
     }
 
-    /* Need to use _SAFE because curl_multi_socket_action() may trigger
-     * curl_sock_cb() which might modify this list */
-    QLIST_FOREACH_SAFE(socket, &s->sockets, next, next_socket) {
-        do {
-            r = curl_multi_socket_action(s->s->multi, socket->fd, 0, &running);
-        } while (r == CURLM_CALL_MULTI_PERFORM);
-    }
+    do {
+        r = curl_multi_socket_action(s->multi, socket->fd, 0, &running);
+    } while (r == CURLM_CALL_MULTI_PERFORM);
 }
 
 static void curl_multi_do(void *arg)
-- 
2.17.1


