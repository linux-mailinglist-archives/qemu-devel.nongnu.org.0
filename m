Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDCE581826
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 19:11:56 +0200 (CEST)
Received: from localhost ([::1]:39938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGO68-0005Pz-04
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 13:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNB5-0004gN-Om
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNB2-0006OW-I1
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:58 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFnE4S024578;
 Tue, 26 Jul 2022 16:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=TUmorKeflFpmI5VFZReXi35EpmdOkVvMmjfUaEiC4Ks=;
 b=VE6bHdrV30FyRmPHjadTE1ZbC5vyFVd9mx6POXZWfhyfjEXVND/zm3gvsxussh6DxIRx
 hriDoGxGEslRSh5boHoW+anV3Mj2CBkLgX33keNnG1xAWmEQwkrczkR9BgTJGGgh71xf
 tHuSsaDROA4x7Mi23ctTX+WTCDueANzbqeWTndNCoPnVVuecMXEKYdUmHIvlttT58LwF
 fJsBm+XfMf9jYDW+K1zR6PXXYnn6665c/+Si7Or0VMxr13aZfA9pyRY7r6fDWUD/R1RC
 Ju8S6DH4EZlSCM56CCVpWvXpkP7EEej1MDqs1t7mGNZIBOcV/FWBWGGN9l6gp8n31mzv wg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9hsq2p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:42 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QFAO7f006435; Tue, 26 Jul 2022 16:11:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq2pc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:42 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uTR023334;
 Tue, 26 Jul 2022 16:11:41 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-40; Tue, 26 Jul 2022 16:11:41 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 39/46] chardev: cpr for sockets
Date: Tue, 26 Jul 2022 09:10:36 -0700
Message-Id: <1658851843-236870-40-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-ORIG-GUID: OxNYsLM8uec00QlwhrlYauXQOd9TqHRn
X-Proofpoint-GUID: OxNYsLM8uec00QlwhrlYauXQOd9TqHRn
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Save accepted socket fds before cpr-exec, and look for them after.
Block cpr-exec if a socket enables the TLS or websocket option.
Allow a monitor socket by closing it on exec.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-socket.c         | 48 +++++++++++++++++++++++++++++++++++++++++++
 include/chardev/char-socket.h |  1 +
 monitor/hmp.c                 |  3 +++
 monitor/qmp.c                 |  4 ++++
 4 files changed, 56 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index dc4e218..f93bae8 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -26,6 +26,8 @@
 #include "chardev/char.h"
 #include "io/channel-socket.h"
 #include "io/channel-websock.h"
+#include "migration/blocker.h"
+#include "migration/cpr-state.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
@@ -33,6 +35,7 @@
 #include "qapi/clone-visitor.h"
 #include "qapi/qapi-visit-sockets.h"
 #include "qemu/yank.h"
+#include "sysemu/sysemu.h"
 
 #include "chardev/char-io.h"
 #include "chardev/char-socket.h"
@@ -358,6 +361,11 @@ static void tcp_chr_free_connection(Chardev *chr)
     SocketChardev *s = SOCKET_CHARDEV(chr);
     int i;
 
+    if (chr->cpr_enabled) {
+        cpr_delete_fd(chr->label, 0);
+    }
+    migrate_del_blocker(&s->cpr_blocker);
+
     if (s->read_msgfds_num) {
         for (i = 0; i < s->read_msgfds_num; i++) {
             close(s->read_msgfds[i]);
@@ -923,6 +931,10 @@ static void tcp_chr_accept(QIONetListener *listener,
                                QIO_CHANNEL(cioc));
     }
     tcp_chr_new_client(chr, cioc);
+
+    if (s->sioc && chr->cpr_enabled) {
+        cpr_resave_fd(chr->label, 0, s->sioc->fd);
+    }
 }
 
 
@@ -1178,6 +1190,27 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
     return false;
 }
 
+static int load_char_socket_fd(Chardev *chr, Error **errp)
+{
+    ERRP_GUARD();
+    SocketChardev *sockchar = SOCKET_CHARDEV(chr);
+    QIOChannelSocket *sioc;
+    const char *label = chr->label;
+    int fd = cpr_find_fd(label, 0);
+
+    if (fd != -1) {
+        sockchar = SOCKET_CHARDEV(chr);
+        sioc = qio_channel_socket_new_fd(fd, errp);
+        if (sioc) {
+            tcp_chr_accept(sockchar->listener, sioc, chr);
+            object_unref(OBJECT(sioc));
+        } else {
+            error_prepend(errp, "could not restore socket for %s", label);
+            return -1;
+        }
+    }
+    return 0;
+}
 
 static int qmp_chardev_open_socket_server(Chardev *chr,
                                           bool is_telnet,
@@ -1388,6 +1421,19 @@ static void qmp_chardev_open_socket(Chardev *chr,
     }
     s->registered_yank = true;
 
+    if (!s->tls_creds && !s->is_websock) {
+        qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    } else if (!chr->reopen_on_cpr) {
+        s->cpr_blocker = NULL;
+        error_setg(&s->cpr_blocker,
+                   "error: socket %s is not cpr capable due to %s option",
+                   chr->label, (s->tls_creds ? "TLS" : "websocket"));
+        if (migrate_add_blockers(&s->cpr_blocker, errp, MIG_MODE_CPR_EXEC,
+                                 -1)) {
+            return;
+        }
+    }
+
     /* be isn't opened until we get a connection */
     *be_opened = false;
 
@@ -1403,6 +1449,8 @@ static void qmp_chardev_open_socket(Chardev *chr,
             return;
         }
     }
+
+    load_char_socket_fd(chr, errp);
 }
 
 static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
diff --git a/include/chardev/char-socket.h b/include/chardev/char-socket.h
index 0708ca6..1c3abf7 100644
--- a/include/chardev/char-socket.h
+++ b/include/chardev/char-socket.h
@@ -78,6 +78,7 @@ struct SocketChardev {
     bool connect_err_reported;
 
     QIOTask *connect_task;
+    Error *cpr_blocker;
 };
 typedef struct SocketChardev SocketChardev;
 
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 15ca047..75e6739 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1501,4 +1501,7 @@ void monitor_init_hmp(Chardev *chr, bool use_readline, Error **errp)
     qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read, monitor_read,
                              monitor_event, NULL, &mon->common, NULL, true);
     monitor_list_append(&mon->common);
+
+    /* monitor cannot yet be preserved across cpr */
+    chr->reopen_on_cpr = true;
 }
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 092c527..0b3aac6 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -535,4 +535,8 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
                                  NULL, &mon->common, NULL, true);
         monitor_list_append(&mon->common);
     }
+
+    /* Monitor cannot yet be preserved across cpr */
+    chr->reopen_on_cpr = true;
+    chr->cpr_enabled = false;
 }
-- 
1.8.3.1


