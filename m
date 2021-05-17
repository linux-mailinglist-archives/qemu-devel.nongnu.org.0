Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1872B382B88
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:55:15 +0200 (CEST)
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libq6-0002GH-4m
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIQ-0006B5-AK
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIL-0006Ou-Dk
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nq6MneSJCUgeeGSVIZEZ9HDFPRr4yopXist94cFf99A=;
 b=RpHNsW0hCK+JDF6QxmNn4EhSZCQsO5EHFA+Q6j4kRvDqoGVc6wxnsu8+WyiaiZEgporyp4
 8JJ6VbfpsjhaMSaJvnthsLetV6Q/TVMnutKB+37C/uh0ugA1oifQxcn4sGC2QKN554yDiJ
 gOj7zQOCv5KSvH6IeyjN23tx1LkQnJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-U_-5cIz5PPa6QU7FcKhURQ-1; Mon, 17 May 2021 07:20:18 -0400
X-MC-Unique: U_-5cIz5PPa6QU7FcKhURQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 009A18189E4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:20:18 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF63E163D4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:20:17 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/20] qtest: add a QOM object for qtest
Date: Mon, 17 May 2021 07:19:50 -0400
Message-Id: <20210517112001.2564006-10-pbonzini@redhat.com>
In-Reply-To: <20210517112001.2564006-1-pbonzini@redhat.com>
References: <20210517112001.2564006-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qtest server right now can only be created using the -qtest
and -qtest-log options.  Allow an alternative way to create it
using "-object qtest,chardev=...,log=...".

This is part of the long term plan to make more (or all) of
QEMU configurable through QMP and preconfig mode.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/qom.json   |  17 +++++
 softmmu/qtest.c | 185 +++++++++++++++++++++++++++++++++++++++++++++---
 softmmu/vl.c    |   5 +-
 3 files changed, 196 insertions(+), 11 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index f1e243dbe5..bcb7e6ba51 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -644,6 +644,21 @@
 { 'struct': 'PrManagerHelperProperties',
   'data': { 'path': 'str' } }
 
+##
+# @QtestProperties:
+#
+# Properties for qtest objects.
+#
+# @chardev: the chardev to be used to receive qtest commands on.
+#
+# @log: the path to a log file
+#
+# Since: 6.0
+##
+{ 'struct': 'QtestProperties',
+        'data': { 'chardev': 'str',
+                  '*log': 'str' } }
+
 ##
 # @RemoteObjectProperties:
 #
@@ -769,6 +784,7 @@
     'memory-backend-ram',
     'pef-guest',
     'pr-manager-helper',
+    'qtest',
     'rng-builtin',
     'rng-egd',
     'rng-random',
@@ -825,6 +841,7 @@
                                       'if': 'defined(CONFIG_LINUX)' },
       'memory-backend-ram':         'MemoryBackendProperties',
       'pr-manager-helper':          'PrManagerHelperProperties',
+      'qtest':                      'QtestProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
       'rng-random':                 'RngRandomProperties',
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 130c366615..72751e1fd8 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -27,6 +27,8 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
+#include "qapi/qmp/qerror.h"
+#include "qom/object_interfaces.h"
 #include CONFIG_DEVICES
 #ifdef CONFIG_PSERIES
 #include "hw/ppc/spapr_rtas.h"
@@ -34,11 +36,25 @@
 
 #define MAX_IRQ 256
 
+#define TYPE_QTEST "qtest"
+
+OBJECT_DECLARE_SIMPLE_TYPE(QTest, QTEST)
+
+struct QTest {
+    Object parent;
+
+    bool has_machine_link;
+    char *chr_name;
+    Chardev *chr;
+    CharBackend qtest_chr;
+    char *log;
+};
+
 bool qtest_allowed;
 
 static DeviceState *irq_intercept_dev;
 static FILE *qtest_log_fp;
-static CharBackend qtest_chr;
+static QTest *qtest;
 static GString *inbuf;
 static int irq_levels[MAX_IRQ];
 static qemu_timeval start_time;
@@ -320,7 +336,7 @@ static void qtest_irq_handler(void *opaque, int n, int level)
     qemu_set_irq(old_irq, level);
 
     if (irq_levels[n] != level) {
-        CharBackend *chr = &qtest_chr;
+        CharBackend *chr = &qtest->qtest_chr;
         irq_levels[n] = level;
         qtest_send_prefix(chr);
         qtest_sendf(chr, "IRQ %s %d\n",
@@ -849,18 +865,39 @@ static void qtest_event(void *opaque, QEMUChrEvent event)
         break;
     }
 }
+
 void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **errp)
 {
+    ERRP_GUARD();
     Chardev *chr;
+    Object *qtest;
 
     chr = qemu_chr_new("qtest", qtest_chrdev, NULL);
-
     if (chr == NULL) {
         error_setg(errp, "Failed to initialize device for qtest: \"%s\"",
                    qtest_chrdev);
         return;
     }
 
+    qtest = object_new(TYPE_QTEST);
+    object_property_set_str(qtest, "chardev", "qtest", &error_abort);
+    if (qtest_log) {
+        object_property_set_str(qtest, "log", qtest_log, &error_abort);
+    }
+    object_property_add_child(qdev_get_machine(), "qtest", qtest);
+    user_creatable_complete(USER_CREATABLE(qtest), errp);
+    if (*errp) {
+        object_unparent(qtest);
+    }
+    object_unref(OBJECT(chr));
+    object_unref(qtest);
+}
+
+static bool qtest_server_start(QTest *q, Error **errp)
+{
+    Chardev *chr = q->chr;
+    const char *qtest_log = q->log;
+
     if (qtest_log) {
         if (strcmp(qtest_log, "none") != 0) {
             qtest_log_fp = fopen(qtest_log, "w+");
@@ -869,16 +906,20 @@ void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **
         qtest_log_fp = stderr;
     }
 
-    qemu_chr_fe_init(&qtest_chr, chr, errp);
-    qemu_chr_fe_set_handlers(&qtest_chr, qtest_can_read, qtest_read,
-                             qtest_event, NULL, &qtest_chr, NULL, true);
-    qemu_chr_fe_set_echo(&qtest_chr, true);
+    if (!qemu_chr_fe_init(&q->qtest_chr, chr, errp)) {
+        return false;
+    }
+    qemu_chr_fe_set_handlers(&q->qtest_chr, qtest_can_read, qtest_read,
+                             qtest_event, NULL, &q->qtest_chr, NULL, true);
+    qemu_chr_fe_set_echo(&q->qtest_chr, true);
 
     inbuf = g_string_new("");
 
     if (!qtest_server_send) {
-        qtest_server_set_send_handler(qtest_server_char_be_send, &qtest_chr);
+        qtest_server_set_send_handler(qtest_server_char_be_send, &q->qtest_chr);
     }
+    qtest = q;
+    return true;
 }
 
 void qtest_server_set_send_handler(void (*send)(void*, const char*),
@@ -890,7 +931,7 @@ void qtest_server_set_send_handler(void (*send)(void*, const char*),
 
 bool qtest_driver(void)
 {
-    return qtest_chr.chr != NULL;
+    return qtest && qtest->qtest_chr.chr != NULL;
 }
 
 void qtest_server_inproc_recv(void *dummy, const char *buf)
@@ -905,3 +946,129 @@ void qtest_server_inproc_recv(void *dummy, const char *buf)
         g_string_truncate(gstr, 0);
     }
 }
+
+static void qtest_complete(UserCreatable *uc, Error **errp)
+{
+    QTest *q = QTEST(uc);
+    if (qtest) {
+        error_setg(errp, "Only one instance of qtest can be created");
+        return;
+    }
+    if (!q->chr_name) {
+        error_setg(errp, "No backend specified");
+        return;
+    }
+
+    if (OBJECT(uc)->parent != qdev_get_machine()) {
+        q->has_machine_link = true;
+        object_property_add_const_link(qdev_get_machine(), "qtest", OBJECT(uc));
+    } else {
+        /* -qtest was used.  */
+    }
+
+    qtest_server_start(q, errp);
+}
+
+static void qtest_unparent(Object *obj)
+{
+    QTest *q = QTEST(obj);
+
+    if (qtest == q) {
+        qemu_chr_fe_disconnect(&q->qtest_chr);
+        assert(!qtest_opened);
+        qemu_chr_fe_deinit(&q->qtest_chr, false);
+        if (qtest_log_fp) {
+            fclose(qtest_log_fp);
+            qtest_log_fp = NULL;
+        }
+        qtest = NULL;
+    }
+
+    if (q->has_machine_link) {
+        object_property_del(qdev_get_machine(), "qtest");
+        q->has_machine_link = false;
+    }
+}
+
+static void qtest_set_log(Object *obj, const char *value, Error **errp)
+{
+    QTest *q = QTEST(obj);
+
+    if (qtest == q) {
+        error_setg(errp, QERR_PERMISSION_DENIED);
+    } else {
+        g_free(q->log);
+        q->log = g_strdup(value);
+    }
+}
+
+static char *qtest_get_log(Object *obj, Error **errp)
+{
+    QTest *q = QTEST(obj);
+
+    return g_strdup(q->log);
+}
+
+static void qtest_set_chardev(Object *obj, const char *value, Error **errp)
+{
+    QTest *q = QTEST(obj);
+    Chardev *chr;
+
+    if (qtest == q) {
+        error_setg(errp, QERR_PERMISSION_DENIED);
+        return;
+    }
+
+    chr = qemu_chr_find(value);
+    if (!chr) {
+        error_setg(errp, "Cannot find character device '%s'", value);
+        return;
+    }
+
+    g_free(q->chr_name);
+    q->chr_name = g_strdup(value);
+
+    if (q->chr) {
+        object_unref(q->chr);
+    }
+    q->chr = chr;
+    object_ref(chr);
+}
+
+static char *qtest_get_chardev(Object *obj, Error **errp)
+{
+    QTest *q = QTEST(obj);
+
+    return g_strdup(q->chr_name);
+}
+
+static void qtest_class_init(ObjectClass *oc, void *data)
+{
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
+
+    oc->unparent = qtest_unparent;
+    ucc->complete = qtest_complete;
+
+    object_class_property_add_str(oc, "chardev",
+                                  qtest_get_chardev, qtest_set_chardev);
+    object_class_property_add_str(oc, "log",
+                                  qtest_get_log, qtest_set_log);
+}
+
+static const TypeInfo qtest_info = {
+    .name = TYPE_QTEST,
+    .parent = TYPE_OBJECT,
+    .class_init = qtest_class_init,
+    .instance_size = sizeof(QTest),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void register_types(void)
+{
+    type_register_static(&qtest_info);
+}
+
+type_init(register_types);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 93e78469bc..11ac3750d8 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1758,8 +1758,9 @@ static bool object_create_early(const char *type)
      * add one, state the reason in a comment!
      */
 
-    /* Reason: rng-egd property "chardev" */
-    if (g_str_equal(type, "rng-egd")) {
+    /* Reason: property "chardev" */
+    if (g_str_equal(type, "rng-egd") ||
+        g_str_equal(type, "qtest")) {
         return false;
     }
 
-- 
2.27.0



