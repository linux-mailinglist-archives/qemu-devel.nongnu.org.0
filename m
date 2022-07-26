Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1C658180C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 19:04:26 +0200 (CEST)
Received: from localhost ([::1]:53196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNyr-0002WZ-3e
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 13:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNA1-0003JE-PD
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:1398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9z-0006GO-Im
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:53 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFnLSW026363;
 Tue, 26 Jul 2022 16:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=FdjfbToNENcHoYA83g7aexkqA3oeeEMO7cPYRQj8ZGw=;
 b=u8oXxhSl26NuBXwroxpNQx/VC7snH9HpJpxXTtJoikSbwaSUrfZO3DLOcykU/DB+Ki07
 T2sNrcS3eLy2Kz1A8CAM8IPmzGo/P3uvvyCDcfWrX5jLLWy5xroh59QQJERz0u0M6eM0
 tK1mUC+MsTI8fdDLLoYur8ZnZV8QIHzwAqUpOeLALA9/YbYK8xcPizYzk71Iz9JUwl9d
 75/Vi1yqf8i6rsKqvgPcDQ4eF7GNUTSdlFNWZ0qxoqFVet945ApA+FvbsqzbfWe8P+RK
 MRPBc3wkSSlsuYYYK4ySjGghqJuCmVtZvRrVwZ4Q+nPJjCfMXhM5ggWty+F65h+noTWf qQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg94gevyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:39 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QF22xG006237; Tue, 26 Jul 2022 16:11:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq2kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:39 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uTN023334;
 Tue, 26 Jul 2022 16:11:38 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-38; Tue, 26 Jul 2022 16:11:38 +0000
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
Subject: [PATCH V9 37/46] chardev: cpr for simple devices
Date: Tue, 26 Jul 2022 09:10:34 -0700
Message-Id: <1658851843-236870-38-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-GUID: CuSK1GkKfdIACEotwsCtrNY_1QFMFhPu
X-Proofpoint-ORIG-GUID: CuSK1GkKfdIACEotwsCtrNY_1QFMFhPu
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

Set QEMU_CHAR_FEATURE_CPR for devices that trivially support cpr-exec.
char-stdio is slightly less trivial.  Allow the gdb server by
closing it on exec.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS           |  1 +
 chardev/char-mux.c    |  1 +
 chardev/char-null.c   |  1 +
 chardev/char-serial.c |  1 +
 chardev/char-stdio.c  | 31 +++++++++++++++++++++++++++++++
 gdbstub.c             |  1 +
 stubs/meson.build     |  1 +
 stubs/migration.c     | 33 +++++++++++++++++++++++++++++++++
 8 files changed, 70 insertions(+)
 create mode 100644 stubs/migration.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3af099a..b93b0bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3038,6 +3038,7 @@ F: tests/qtest/migration-test.c
 F: docs/devel/migration.rst
 F: qapi/migration.json
 F: tests/migration/
+F: stubs/migration.c
 
 D-Bus
 M: Marc-André Lureau <marcandre.lureau@redhat.com>
diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index ee2d47b..d47fa31 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -337,6 +337,7 @@ static void qemu_chr_open_mux(Chardev *chr,
      */
     *be_opened = muxes_opened;
     qemu_chr_fe_init(&d->chr, drv, errp);
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 
 static void qemu_chr_parse_mux(QemuOpts *opts, ChardevBackend *backend,
diff --git a/chardev/char-null.c b/chardev/char-null.c
index 1c6a290..02acaff 100644
--- a/chardev/char-null.c
+++ b/chardev/char-null.c
@@ -32,6 +32,7 @@ static void null_chr_open(Chardev *chr,
                           Error **errp)
 {
     *be_opened = false;
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 
 static void char_null_class_init(ObjectClass *oc, void *data)
diff --git a/chardev/char-serial.c b/chardev/char-serial.c
index 4b0b83d..7aa2042 100644
--- a/chardev/char-serial.c
+++ b/chardev/char-serial.c
@@ -277,6 +277,7 @@ static void qmp_chardev_open_serial(Chardev *chr,
     }
     tty_serial_init(fd, 115200, 'N', 8, 1);
 
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
     qemu_chr_open_fd(chr, fd, fd);
 }
 #endif /* __linux__ || __sun__ */
diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
index 3c64867..7a96bdc 100644
--- a/chardev/char-stdio.c
+++ b/chardev/char-stdio.c
@@ -27,6 +27,7 @@
 #include "qemu/option.h"
 #include "qemu/sockets.h"
 #include "qapi/error.h"
+#include "migration/misc.h"
 #include "chardev/char.h"
 
 #ifdef _WIN32
@@ -40,19 +41,46 @@
 #ifndef _WIN32
 /* init terminal so that we can grab keys */
 static struct termios oldtty;
+static struct termios newtty;
 static int old_fd0_flags;
+static int new_fd0_flags;
 static bool stdio_in_use;
 static bool stdio_allow_signal;
 static bool stdio_echo_state;
+static Notifier cpr_notifier;
 
 static void term_exit(void)
 {
     if (stdio_in_use) {
+        tcgetattr(0, &newtty);
+        new_fd0_flags = fcntl(0, F_GETFL);
+
         tcsetattr(0, TCSANOW, &oldtty);
         fcntl(0, F_SETFL, old_fd0_flags);
     }
 }
 
+static void term_reenter(void)
+{
+    if (stdio_in_use) {
+        tcsetattr(0, TCSANOW, &newtty);
+        fcntl(0, F_SETFL, new_fd0_flags);
+    }
+}
+
+static void term_cpr_exec_notifier(Notifier *notifier, void *data)
+{
+    MigrationState *s = data;
+
+    if (migrate_mode_of(s) == MIG_MODE_CPR_EXEC) {
+        if (migration_has_finished(s)) {
+            term_exit();
+        } else if (migration_has_failed(s)) {
+            term_reenter();
+        }
+    }
+}
+
 static void qemu_chr_set_echo_stdio(Chardev *chr, bool echo)
 {
     struct termios tty;
@@ -117,6 +145,8 @@ static void qemu_chr_open_stdio(Chardev *chr,
 
     stdio_allow_signal = !opts->has_signal || opts->signal;
     qemu_chr_set_echo_stdio(chr, false);
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    migration_add_notifier(&cpr_notifier, term_cpr_exec_notifier);
 }
 #endif
 
@@ -147,6 +177,7 @@ static void char_stdio_finalize(Object *obj)
 {
 #ifndef _WIN32
     term_exit();
+    migration_remove_notifier(&cpr_notifier);
 #endif
 }
 
diff --git a/gdbstub.c b/gdbstub.c
index cf869b1..08b3d80 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3616,6 +3616,7 @@ int gdbserver_start(const char *device)
         mon_chr = gdbserver_state.mon_chr;
         reset_gdbserver_state();
     }
+    mon_chr->reopen_on_cpr = true;
 
     create_processes(&gdbserver_state);
 
diff --git a/stubs/meson.build b/stubs/meson.build
index 392b1b5..a1eda95 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -27,6 +27,7 @@ if libaio.found()
   stub_ss.add(files('linux-aio.c'))
 endif
 stub_ss.add(files('migr-blocker.c'))
+stub_ss.add(files('migration.c'))
 stub_ss.add(files('module-opts.c'))
 stub_ss.add(files('monitor.c'))
 stub_ss.add(files('monitor-core.c'))
diff --git a/stubs/migration.c b/stubs/migration.c
new file mode 100644
index 0000000..f2f79bd
--- /dev/null
+++ b/stubs/migration.c
@@ -0,0 +1,33 @@
+/*
+ * Copyright (c) 2021, 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "migration/misc.h"
+
+void migration_add_notifier(Notifier *notify,
+                            void (*cb)(Notifier *notifier, void *data))
+{
+}
+
+void migration_remove_notifier(Notifier *notify)
+{
+}
+
+bool migration_has_finished(MigrationState *s)
+{
+    return false;
+}
+
+bool migration_has_failed(MigrationState *s)
+{
+    return false;
+}
+
+MigMode migrate_mode_of(MigrationState *s)
+{
+    return 0;
+}
-- 
1.8.3.1


