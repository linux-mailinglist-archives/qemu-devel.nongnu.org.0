Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC1F16B209
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 22:19:52 +0100 (CET)
Received: from localhost ([::1]:43644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6L8p-00032f-BY
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 16:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jag.raman@oracle.com>) id 1j6Kmt-00089D-LY
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:57:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jag.raman@oracle.com>) id 1j6Kms-00040R-BI
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:57:11 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:45210)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jag.raman@oracle.com>)
 id 1j6Kms-0003zI-2F
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:57:10 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OKrMsA032061;
 Mon, 24 Feb 2020 20:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=lmaqRAdO5l0CBs7Nbf1bisuy3QrUQnsM4khCkN3guhY=;
 b=gNfQKp5s98ZytpVHET8y9aNqcVQzoa9W5LYMXkXJENkXtbdtvgxoYI66XAaV2tjJTYRs
 vbmWCRtZ38AltjuLIFCoAS4/Pa3o7mKu3nqgKP+2u/NhFL5zJo66YxNGa5d+edkmnFkb
 lKx30IMKfeyqdOW+rHwbXW2e0qCwVSNzYBDJlAgPQLLCNG+bBd4bSPbKpMotN+9tSmt3
 OERbVmEJf+0vmW59sUnQ7aL0/My6hRrjwtEKn9JGh7kdhatpfTeaWEtvIjAnHXiNYOJn
 eKbyFidvCIupo7nqsAHGuyVEardrNMJMyt37m7mAk79qtHkJoUmS8m0ESFFFeYf/DOwE 3g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2yauqua0r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 20:57:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OKueug073151;
 Mon, 24 Feb 2020 20:57:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2ybduv6dwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 20:57:03 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01OKv1Cu028884;
 Mon, 24 Feb 2020 20:57:01 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Feb 2020 12:57:01 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 42/50] multi-process/mig: Send VMSD of remote to the Proxy
 object
Date: Mon, 24 Feb 2020 15:55:33 -0500
Message-Id: <74d6f7b67720a31a53c25164f8d9769c32d8c643.1582576372.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1582576372.git.jag.raman@oracle.com>
References: <cover.1582576372.git.jag.raman@oracle.com>
In-Reply-To: <cover.1582576372.git.jag.raman@oracle.com>
References: <cover.1582576372.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9541
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=1
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240154
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9541
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 bulkscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240153
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 liran.alon@oracle.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The remote process sends the VMSD to the Proxy object, on the source
side

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 migration/savevm.c   | 27 +++++++++++++++++++++++++++
 migration/savevm.h   |  2 ++
 remote/remote-main.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index 1d4220e..09af14d 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2942,3 +2942,30 @@ bool vmstate_check_only_migratable(const VMStateDescription *vmsd)
 
     return !(vmsd && vmsd->unmigratable);
 }
+
+int qemu_remote_savevm(QEMUFile *f)
+{
+    SaveStateEntry *se;
+    int ret;
+
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (!se->vmsd || !vmstate_save_needed(se->vmsd, se->opaque)) {
+            continue;
+        }
+
+        save_section_header(f, se, QEMU_VM_SECTION_FULL);
+
+        ret = vmstate_save(f, se, NULL);
+        if (ret) {
+            qemu_file_set_error(f, ret);
+            return ret;
+        }
+
+        save_section_footer(f, se);
+    }
+
+    qemu_put_byte(f, QEMU_VM_EOF);
+    qemu_fflush(f);
+
+    return 0;
+}
diff --git a/migration/savevm.h b/migration/savevm.h
index ba64a7e..0491d3a 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -65,4 +65,6 @@ void qemu_loadvm_state_cleanup(void);
 int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
 
+int qemu_remote_savevm(QEMUFile *f);
+
 #endif
diff --git a/remote/remote-main.c b/remote/remote-main.c
index 58d9905..e97eb76 100644
--- a/remote/remote-main.c
+++ b/remote/remote-main.c
@@ -53,6 +53,16 @@
 #include "qemu/log.h"
 #include "qemu/cutils.h"
 #include "remote-opts.h"
+#include "qapi/error.h"
+#include "io/channel-util.h"
+
+#include "io/channel.h"
+#include "io/channel-socket.h"
+#include "migration/qemu-file-types.h"
+#include "migration/savevm.h"
+#include "migration/qemu-file-channel.h"
+#include "migration/qemu-file.h"
+
 #include "monitor/monitor.h"
 #include "chardev/char.h"
 #include "sysemu/reset.h"
@@ -322,6 +332,36 @@ static int setup_device(MPQemuMsg *msg, Error **errp)
 
 }
 
+static void process_start_mig_out(MPQemuMsg *msg)
+{
+    int wait = msg->fds[1];
+    Error *err = NULL;
+    QIOChannel *ioc;
+    QEMUFile *f;
+
+    ioc = qio_channel_new_fd(msg->fds[0], &err);
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+
+    qio_channel_set_name(QIO_CHANNEL(ioc), "remote-migration-channel");
+
+    f = qemu_fopen_channel_output(ioc);
+
+    bdrv_drain_all();
+    (void)bdrv_flush_all();
+
+    (void)qemu_remote_savevm(f);
+
+    qemu_fflush(f);
+
+    notify_proxy(wait, (uint64_t)qemu_ftell(f));
+    PUT_REMOTE_WAIT(wait);
+
+    qemu_fclose(f);
+}
+
 static void process_msg(GIOCondition cond, MPQemuChannel *chan)
 {
     MPQemuMsg *msg = NULL;
@@ -411,6 +451,9 @@ static void process_msg(GIOCondition cond, MPQemuChannel *chan)
             notify_proxy(msg->fds[0], 0);
         }
         break;
+    case START_MIG_OUT:
+        process_start_mig_out(msg);
+        break;
     default:
         error_setg(&err, "Unknown command");
         goto finalize_loop;
-- 
1.8.3.1


