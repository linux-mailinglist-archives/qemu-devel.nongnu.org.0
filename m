Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E17376568
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:43:51 +0200 (CEST)
Received: from localhost ([::1]:37692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezpe-0004Sj-Ku
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbZ-0000ua-Oe
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:18 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbV-0001Xn-G8
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:17 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CEE7C096919;
 Fri, 7 May 2021 12:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=z5xKbEJAlAVR4RVNr9CaGx/H1ESy+tpLGhwVIjQTbp4=;
 b=ucgSLJwtjalz/rES225hRJgiOyJZxW0KC0mCj/uHyFLW1/AEQWg/2QkDI/XeNy+PFcKG
 5ixkK1d5xfbMeVnWRJN9zdwyvIkiJ3gnXT02pzLXH9GDDWSoILCaGrrllWfNa15FZg8y
 dUK9BqR2ctKm6Z56lCggTMVjhPJP4w6G6SQk3CkWXu6VQP/rXDQmhe/2k8xeqBmz3UKa
 Q5ZU2rpW6sqqn1HeRlfdC6uHSi7mE9oJ7dBKOWZczHiA2n3Pz1fRk3LqnPVTZR0tqLzW
 3Wp1OK5YEwDbsCfYl+H1FOx5WDtHF+Rl/ifEkoePG2b2f5c6e234WNgd+Vemp994v+YX 1w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 38ctd89d1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CGOWk173606;
 Fri, 7 May 2021 12:29:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38csrtb6c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:08 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CT8Pk028387;
 Fri, 7 May 2021 12:29:08 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 38csrtb6bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:08 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 147CT6Dn011732;
 Fri, 7 May 2021 12:29:06 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:29:05 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 19/22] chardev: cpr for sockets
Date: Fri,  7 May 2021 05:25:17 -0700
Message-Id: <1620390320-301716-20-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: KMl-NKj3bJhg7O_XqHwJIg1g7qu8gPWE
X-Proofpoint-ORIG-GUID: KMl-NKj3bJhg7O_XqHwJIg1g7qu8gPWE
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Save accepted socket fds in the environment before cprsave, and look for
fds in the environment after cprload.  Reject cprsave if a socket enables
the TLS or websocket option.  Allow a monitor socket by closing it on exec.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-socket.c | 31 +++++++++++++++++++++++++++++++
 monitor/hmp.c         |  3 +++
 monitor/qmp.c         |  3 +++
 3 files changed, 37 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index daa89fe..110f263 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -27,7 +27,9 @@
 #include "io/channel-socket.h"
 #include "io/channel-tls.h"
 #include "io/channel-websock.h"
+#include "qemu/env.h"
 #include "io/net-listener.h"
+#include "qemu/env.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
@@ -414,6 +416,7 @@ static void tcp_chr_free_connection(Chardev *chr)
     SocketChardev *s = SOCKET_CHARDEV(chr);
     int i;
 
+    unsetenv_fd(chr->label);
     if (s->read_msgfds_num) {
         for (i = 0; i < s->read_msgfds_num; i++) {
             close(s->read_msgfds[i]);
@@ -976,6 +979,10 @@ static void tcp_chr_accept(QIONetListener *listener,
                                QIO_CHANNEL(cioc));
     }
     tcp_chr_new_client(chr, cioc);
+
+    if (s->sioc && !chr->close_on_cpr) {
+        setenv_fd(chr->label, s->sioc->fd);
+    }
 }
 
 
@@ -1231,6 +1238,24 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
     return false;
 }
 
+static void load_char_socket_fd(Chardev *chr, Error **errp)
+{
+    SocketChardev *sockchar = SOCKET_CHARDEV(chr);
+    QIOChannelSocket *sioc;
+    int fd = getenv_fd(chr->label);
+
+    if (fd != -1) {
+        sockchar = SOCKET_CHARDEV(chr);
+        sioc = qio_channel_socket_new_fd(fd, errp);
+        if (sioc) {
+            tcp_chr_accept(sockchar->listener, sioc, chr);
+            object_unref(OBJECT(sioc));
+        } else {
+            error_setg(errp, "error: could not restore socket for %s",
+                       chr->label);
+        }
+    }
+}
 
 static int qmp_chardev_open_socket_server(Chardev *chr,
                                           bool is_telnet,
@@ -1441,6 +1466,10 @@ static void qmp_chardev_open_socket(Chardev *chr,
     }
     s->registered_yank = true;
 
+    if (!s->tls_creds && !s->is_websock) {
+        qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    }
+
     /* be isn't opened until we get a connection */
     *be_opened = false;
 
@@ -1456,6 +1485,8 @@ static void qmp_chardev_open_socket(Chardev *chr,
             return;
         }
     }
+
+    load_char_socket_fd(chr, errp);
 }
 
 static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 6c0b33a..63700b3 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1451,4 +1451,7 @@ void monitor_init_hmp(Chardev *chr, bool use_readline, Error **errp)
     qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read, monitor_read,
                              monitor_event, NULL, &mon->common, NULL, true);
     monitor_list_append(&mon->common);
+
+    /* monitor cannot yet be preserved across cpr */
+    chr->close_on_cpr = true;
 }
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 2b0308f..495d68f 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -531,4 +531,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
                                  NULL, &mon->common, NULL, true);
         monitor_list_append(&mon->common);
     }
+
+    /* Monitor cannot yet be preserved across cpr */
+    chr->close_on_cpr = true;
 }
-- 
1.8.3.1


