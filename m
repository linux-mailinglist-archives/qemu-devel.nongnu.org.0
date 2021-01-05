Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794672EAFD2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:16:06 +0100 (CET)
Received: from localhost ([::1]:55280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwp09-0005A3-D4
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwote-00044l-A9
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:23 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:39410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotc-00043m-3B
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:22 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105Fsx4k031239;
 Tue, 5 Jan 2021 16:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=S07JfmMvaCJerb+6p+jaw2Rx/bLMc7vXTS8xdm2naTk=;
 b=im9hYnSVrsWPaObIhauSCO/rVfiEbV31Nc0FsXXyKmvquFO1Ghl1tb3ryudk17plQ7Os
 ADcY1LSb7/PQGWrrKjQEGrrzCsA0IEMPa7qwOYplGINfDIgKrGR2g+Kl899y0K1oTYcK
 EbHIPSJhFOMFzC9MymJv/0dKByYrI2tO1dnS/kjdiMKUtGOlnEduvpaeSf26LDgLjTRC
 i07re718/jMkkfASIHsl89IK+2tb9TbXMBEuGHFBUMF/DKv4U1JrUqfzx6OO24SCphdD
 2quiR3Sifvsnx3E9xuSsbNb3WYJGUVsdtjPeTe6773S4JUs/Jn65Wuj/1mVIfIAje5kZ gg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35tgsksg4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FuODD029126;
 Tue, 5 Jan 2021 16:09:16 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 35uxnsvb8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:16 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105G9FGi018418;
 Tue, 5 Jan 2021 16:09:15 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:14 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 18/22] chardev: cpr for sockets
Date: Tue,  5 Jan 2021 07:42:06 -0800
Message-Id: <1609861330-129855-19-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=steven.sistare@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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

Define qio_channel_socket_reuse to initialize a channel based on an existing
socket fd.  Save accepted socket fds in the environment before cprsave, and
look for fds in the environment after cprload.  Reject cprsave if a socket
enables the TLS or websocket option.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-socket.c       | 30 ++++++++++++++++++++++++++++++
 include/io/channel-socket.h | 12 ++++++++++++
 io/channel-socket.c         |  9 +++++++++
 stubs/Makefile.objs         |  1 +
 stubs/cpr.c                 |  3 +++
 5 files changed, 55 insertions(+)
 create mode 100644 stubs/cpr.c

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index ef62dbf..0965305 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -36,6 +36,7 @@
 #include "qapi/qapi-visit-sockets.h"
 
 #include "chardev/char-io.h"
+#include "qemu/env.h"
 
 /***********************************************************/
 /* TCP Net console */
@@ -400,6 +401,7 @@ static void tcp_chr_free_connection(Chardev *chr)
     SocketChardev *s = SOCKET_CHARDEV(chr);
     int i;
 
+    unsetenv_fd(chr->label);
     if (s->read_msgfds_num) {
         for (i = 0; i < s->read_msgfds_num; i++) {
             close(s->read_msgfds[i]);
@@ -1157,6 +1159,25 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
     return false;
 }
 
+static void load_char_socket_fd(Chardev *chr)
+{
+    SocketChardev *sockchar = SOCKET_CHARDEV(chr);
+    QIOChannelSocket *sioc;
+    int fd = getenv_fd(chr->label);
+
+    if (fd != -1) {
+        sockchar = SOCKET_CHARDEV(chr);
+        sioc = qio_channel_socket_reuse(fd, NULL);
+        if (sioc) {
+            tcp_chr_accept(sockchar->listener, sioc, chr);
+        } else {
+            error_printf("error: could not restore socket for %s\n",
+                         chr->label);
+        }
+    } else if (sockchar->sioc && !chr->close_on_cpr) {
+        setenv_fd(chr->label, sockchar->sioc->fd);
+    }
+}
 
 static int qmp_chardev_open_socket_server(Chardev *chr,
                                           bool is_telnet,
@@ -1360,6 +1381,13 @@ static void qmp_chardev_open_socket(Chardev *chr,
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
     }
 
+    if (!s->tls_creds && !s->is_websock) {
+        qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    } else if (only_cpr_capable) {
+        error_setg(errp, "error: socket %s is not cpr capable due to %s option",
+                   chr->label, (s->tls_creds ? "TLS" : "websocket"));
+    }
+
     /* be isn't opened until we get a connection */
     *be_opened = false;
 
@@ -1375,6 +1403,8 @@ static void qmp_chardev_open_socket(Chardev *chr,
             return;
         }
     }
+
+    load_char_socket_fd(chr);
 }
 
 static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index 777ff59..e425a01 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -260,5 +260,17 @@ QIOChannelSocket *
 qio_channel_socket_accept(QIOChannelSocket *ioc,
                           Error **errp);
 
+/**
+ * qio_channel_socket_reuse:
+ * @fd: existing client socket descriptor
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Construct a client channel using @fd.
+ *
+ * Returns: the new client channel, or NULL on error
+ */
+QIOChannelSocket *
+qio_channel_socket_reuse(int fd,
+                         Error **errp);
 
 #endif /* QIO_CHANNEL_SOCKET_H */
diff --git a/io/channel-socket.c b/io/channel-socket.c
index de49880..07981be 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -400,6 +400,15 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
     return NULL;
 }
 
+QIOChannelSocket *
+qio_channel_socket_reuse(int fd,
+                         Error **errp)
+{
+    QIOChannelSocket *cioc = qio_channel_socket_new();
+    cioc->fd = fd;
+    return qio_channel_socket_post_accept(cioc, errp) ? 0 : cioc;
+}
+
 static void qio_channel_socket_init(Object *obj)
 {
     QIOChannelSocket *ioc = QIO_CHANNEL_SOCKET(obj);
diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index d42046a..f6c335b 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -1,5 +1,6 @@
 stub-obj-y += blk-commit-all.o
 stub-obj-y += cmos.o
+stub-obj-y += cpr.o
 stub-obj-y += cpu-get-clock.o
 stub-obj-y += cpu-get-icount.o
 stub-obj-y += dump.o
diff --git a/stubs/cpr.c b/stubs/cpr.c
new file mode 100644
index 0000000..aaa189e
--- /dev/null
+++ b/stubs/cpr.c
@@ -0,0 +1,3 @@
+#include "qemu/osdep.h"
+
+bool only_cpr_capable;
-- 
1.8.3.1


