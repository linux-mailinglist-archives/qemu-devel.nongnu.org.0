Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125232DDE04
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 06:25:59 +0100 (CET)
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8H8-0002U0-1G
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 00:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8FD-0001eB-Kn
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:24:00 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:43226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8Eu-0005Qm-VD
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:23:59 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5JuvQ046294;
 Fri, 18 Dec 2020 05:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=kcb4JMB5mX3hd6Jcp0uagYEYIeCXPWbLJDwKbuEvCfw=;
 b=spSZwjejhoDyDWcThXx7XZKMRR2kKHECl06g+m7onKdCWTo2NQqWZimcAx9ptTq+fHPG
 pITDtauAkYkQhfJ5TVFWA271FFKCwQVvb4Z0LHoctnCpHoY/fg04YnEOzHoW4xCnYg3c
 /Bx5j/1ldnkuC++DMcdS5JYT6QLeKC6lUeatfsHf0CbZWGOlNtH+n05WRRxXKHWwC5Az
 fA9tVjvp2XnsCUBEhVCEtMq6SCTGRp3ls5f/mGywLtLIH+hdbm0gQ2KBoTfhWI33zp2Z
 6+TctJQMXWbyGn5jEM0gFSB3I4CM8jZ9+tOaKcUwBsQFHod4AxpiwAc4F28Y/5SSUszb ig== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35cntmgmwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 05:23:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5LL2L127207;
 Fri, 18 Dec 2020 05:21:33 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 35d7erv1w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 05:21:33 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BI5LWsT014953;
 Fri, 18 Dec 2020 05:21:32 GMT
Received: from flaka.hsd1.ca.comcast.net (/10.159.131.68)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 21:21:32 -0800
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v14 RESEND 04/21] socket: export socket_get_fd() function
Date: Thu, 17 Dec 2020 21:20:57 -0800
Message-Id: <8b5f13cc11701ed8a61273aef88eeee0f0aa44c6.1608263018.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1608263017.git.elena.ufimtseva@oracle.com>
References: <cover.1608263017.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180038
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180038
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jagannathan Raman <jag.raman@oracle.com>

Export socket_get_fd() helper function. The function protorype is
changed to be more generic. Use monitor_fd_param() instead of
monitor_fd_get() in order to support named fds as well.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 include/qemu/sockets.h    |  1 +
 stubs/monitor.c           |  2 +-
 tests/test-util-sockets.c |  2 +-
 util/qemu-sockets.c       | 18 ++++++++++--------
 4 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 7d1f813576..d87cf9f1c5 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -41,6 +41,7 @@ int unix_listen(const char *path, Error **errp);
 int unix_connect(const char *path, Error **errp);
 
 SocketAddress *socket_parse(const char *str, Error **errp);
+int socket_get_fd(const char *fdstr, Error **errp);
 int socket_connect(SocketAddress *addr, Error **errp);
 int socket_listen(SocketAddress *addr, int num, Error **errp);
 void socket_listen_cleanup(int fd, Error **errp);
diff --git a/stubs/monitor.c b/stubs/monitor.c
index 20786ac4ff..6e6850cd3a 100644
--- a/stubs/monitor.c
+++ b/stubs/monitor.c
@@ -3,7 +3,7 @@
 #include "monitor/monitor.h"
 #include "../monitor/monitor-internal.h"
 
-int monitor_get_fd(Monitor *mon, const char *name, Error **errp)
+int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
 {
     error_setg(errp, "only QEMU supports file descriptor passing");
     return -1;
diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c
index 67486055ed..e790a0af25 100644
--- a/tests/test-util-sockets.c
+++ b/tests/test-util-sockets.c
@@ -54,7 +54,7 @@ static int mon_fd = -1;
 static const char *mon_fdname;
 __thread Monitor *cur_mon;
 
-int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)
+int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
 {
     g_assert(cur_mon);
     g_assert(mon == cur_mon);
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8af0278f15..694552cb7d 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1116,16 +1116,12 @@ fail:
     return NULL;
 }
 
-static int socket_get_fd(const char *fdstr, int num, Error **errp)
+int socket_get_fd(const char *fdstr, Error **errp)
 {
     Monitor *cur_mon = monitor_cur();
     int fd;
-    if (num != 1) {
-        error_setg_errno(errp, EINVAL, "socket_get_fd: too many connections");
-        return -1;
-    }
     if (cur_mon) {
-        fd = monitor_get_fd(cur_mon, fdstr, errp);
+        fd = monitor_fd_param(cur_mon, fdstr, errp);
         if (fd < 0) {
             return -1;
         }
@@ -1159,7 +1155,7 @@ int socket_connect(SocketAddress *addr, Error **errp)
         break;
 
     case SOCKET_ADDRESS_TYPE_FD:
-        fd = socket_get_fd(addr->u.fd.str, 1, errp);
+        fd = socket_get_fd(addr->u.fd.str, errp);
         break;
 
     case SOCKET_ADDRESS_TYPE_VSOCK:
@@ -1177,6 +1173,12 @@ int socket_listen(SocketAddress *addr, int num, Error **errp)
     int fd;
 
     trace_socket_listen(num);
+
+    if (num != 1) {
+        error_setg_errno(errp, EINVAL, "socket_get_fd: too many connections");
+        return -1;
+    }
+
     switch (addr->type) {
     case SOCKET_ADDRESS_TYPE_INET:
         fd = inet_listen_saddr(&addr->u.inet, 0, num, errp);
@@ -1187,7 +1189,7 @@ int socket_listen(SocketAddress *addr, int num, Error **errp)
         break;
 
     case SOCKET_ADDRESS_TYPE_FD:
-        fd = socket_get_fd(addr->u.fd.str, num, errp);
+        fd = socket_get_fd(addr->u.fd.str, errp);
         break;
 
     case SOCKET_ADDRESS_TYPE_VSOCK:
-- 
2.25.GIT


