Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409354CC8A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:19:34 +0200 (CEST)
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Unt-0008Mk-AY
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOo-0007mg-Ok
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:39 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOm-00016l-Vh
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:38 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE61kR001479;
 Wed, 15 Jun 2022 14:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=+ZzpcwQtt1RTx7/w3kERr/xIGS0RKClA/iA96Fnr5j0=;
 b=X8g1GbX/Q4I185YYXCKAb48trHcdvwA9S5nARPoL/k4MS4IcOLEiN6zrMfIj0BtfAhHI
 MfXmGl84hoaLXIqSSmWvY1+uSVN1eY8qCiXrmP1EVcVeCFuDvtFinb9Bqd/Ke5WYsgku
 cSfzKe700+PO+CkuXkYKMXHz1qfkW0giVno/YY79HkCSbiYX+A2UnpeF4JyhiilqoP1O
 0C1C0/+W0cwLqZE3HV/LqSqhfDF6L9C+EO++KwrPoGv7dSbJBgH8ppDVbwnl+sUyeV4M
 JvZyOzgCLFNGxv36B795aZD63wTsos5g/wOzZZySx+myCtrlno0VkgEwE5TtSAOLrxyg vQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns8tna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:11 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7w6023077; Wed, 15 Jun 2022 14:53:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vq5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:10 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNp018501;
 Wed, 15 Jun 2022 14:53:09 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-35; Wed, 15 Jun 2022 14:53:09 +0000
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
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 34/39] chardev: cpr for simple devices
Date: Wed, 15 Jun 2022 07:52:21 -0700
Message-Id: <1655304746-102776-35-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: olo8Tu0sNfD3jWWvS_34i0NSuKBs2UWn
X-Proofpoint-ORIG-GUID: olo8Tu0sNfD3jWWvS_34i0NSuKBs2UWn
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Set QEMU_CHAR_FEATURE_CPR for devices that trivially support cpr.
char-stdio is slightly less trivial.  Allow the gdb server by
closing it on exec.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-mux.c    |  1 +
 chardev/char-null.c   |  1 +
 chardev/char-serial.c |  1 +
 chardev/char-stdio.c  | 10 ++++++++++
 gdbstub.c             |  1 +
 5 files changed, 14 insertions(+)

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
index 3c64867..520f1db 100644
--- a/chardev/char-stdio.c
+++ b/chardev/char-stdio.c
@@ -27,6 +27,7 @@
 #include "qemu/option.h"
 #include "qemu/sockets.h"
 #include "qapi/error.h"
+#include "migration/cpr.h"
 #include "chardev/char.h"
 
 #ifdef _WIN32
@@ -44,6 +45,7 @@ static int old_fd0_flags;
 static bool stdio_in_use;
 static bool stdio_allow_signal;
 static bool stdio_echo_state;
+static Notifier cpr_notifier;
 
 static void term_exit(void)
 {
@@ -53,6 +55,11 @@ static void term_exit(void)
     }
 }
 
+static void term_cpr_exec_notifier(Notifier *notifier, void *data)
+{
+    term_exit();
+}
+
 static void qemu_chr_set_echo_stdio(Chardev *chr, bool echo)
 {
     struct termios tty;
@@ -117,6 +124,8 @@ static void qemu_chr_open_stdio(Chardev *chr,
 
     stdio_allow_signal = !opts->has_signal || opts->signal;
     qemu_chr_set_echo_stdio(chr, false);
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    cpr_add_notifier(&cpr_notifier, term_cpr_exec_notifier, CPR_NOTIFY_EXEC);
 }
 #endif
 
@@ -147,6 +156,7 @@ static void char_stdio_finalize(Object *obj)
 {
 #ifndef _WIN32
     term_exit();
+    cpr_remove_notifier(&cpr_notifier);
 #endif
 }
 
diff --git a/gdbstub.c b/gdbstub.c
index 88a34c8..7865c3d 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3584,6 +3584,7 @@ int gdbserver_start(const char *device)
         mon_chr = gdbserver_state.mon_chr;
         reset_gdbserver_state();
     }
+    mon_chr->reopen_on_cpr = true;
 
     create_processes(&gdbserver_state);
 
-- 
1.8.3.1


