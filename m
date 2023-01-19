Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6059E673AE1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:58:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVPX-00007u-3l; Thu, 19 Jan 2023 08:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIVPU-0008Sg-FX; Thu, 19 Jan 2023 08:56:56 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIVPS-0006BG-OY; Thu, 19 Jan 2023 08:56:56 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D3FB3F42A;
 Thu, 19 Jan 2023 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674136613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CmwGZPr+sEROw2OjOLTe6Bx+FJD/SCltpgT+RRPahk=;
 b=HM8HQ183fGd3HqzVC+futzJ6PlOjsTcnotl/IkcnGukT8gl9fTfCrM5eHL6YbVfbxhkurd
 pf4ev+fLOz8j3W1aURnzhfu+Ff2uilB6DZ79ghDsHCcbPZVc+BdK3yA6CcsKu0IMoU/VVp
 ZNeGGtFr2sSCa8x6YW5G4B7T+EAaqzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674136613;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CmwGZPr+sEROw2OjOLTe6Bx+FJD/SCltpgT+RRPahk=;
 b=sHSc3urze9GKBSplZ6yge/8bqDgxR9vbGGYjoZEyV4Qj7f+kFvSxqboLIlCeMWSaw2xa1u
 kUqYUVxktgugm2Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFAFB134F5;
 Thu, 19 Jan 2023 13:56:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uPHMJCFMyWOCFAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:56:49 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v4 06/15] tests/qtest: Add qtest_get_machine_args
Date: Thu, 19 Jan 2023 10:54:15 -0300
Message-Id: <20230119135424.5417-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QEMU machines might not have a default value defined for the -cpu
option. Add a custom init function that takes care of selecting the
default cpu in case the test did not specify one. For the machines
that do not have a default, the value MUST be provided by the test.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/libqtest.c | 99 ++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/libqtest.h | 11 +++++
 2 files changed, 110 insertions(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 5cb38f90da..db8a40f0c7 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1265,8 +1265,57 @@ static bool qtest_is_old_versioned_machine(const char *mname)
 struct MachInfo {
     char *name;
     char *alias;
+    char *default_cpu;
 };
 
+static char *qtest_get_cpu_name(QString *type)
+{
+    QDict *response, *cpuinfo;
+    QList *list;
+    const QListEntry *p;
+    QObject *qobj;
+    QString *qstr;
+    QTestState *qts;
+    char *cname = NULL;
+
+    qts = qtest_init("-machine none");
+    response = qtest_qmp(qts, "{ 'execute': 'query-cpu-definitions' }");
+    g_assert(response);
+    list = qdict_get_qlist(response, "return");
+
+    if (!list) {
+        /* Not all architectures implement query-cpu-definitions */
+        goto out;
+    }
+
+    for (p = qlist_first(list); p; p = qlist_next(p)) {
+        cpuinfo = qobject_to(QDict, qlist_entry_obj(p));
+        g_assert(cpuinfo);
+
+        qobj = qdict_get(cpuinfo, "typename");
+        g_assert(qobj);
+        qstr = qobject_to(QString, qobj);
+        g_assert(qstr);
+
+        if (g_str_equal(qstring_get_str(qstr),
+                        qstring_get_str(type))) {
+            qobj = qdict_get(cpuinfo, "name");
+            g_assert(qobj);
+            qstr = qobject_to(QString, qobj);
+            g_assert(qstr);
+
+            cname = g_strdup(qstring_get_str(qstr));
+            break;
+        }
+    }
+
+out:
+    qtest_quit(qts);
+    qobject_unref(response);
+
+    return cname;
+}
+
 /*
  * Returns an array with pointers to the available machine names.
  * The terminating entry has the name set to NULL.
@@ -1312,6 +1361,15 @@ static struct MachInfo *qtest_get_machines(void)
         } else {
             machines[idx].alias = NULL;
         }
+
+        qobj = qdict_get(minfo, "default-cpu-type");
+        if (qobj) {                           /* The default cpu is optional */
+            qstr = qobject_to(QString, qobj);
+            g_assert(qstr);
+            machines[idx].default_cpu = qtest_get_cpu_name(qstr);
+        } else {
+            machines[idx].default_cpu = NULL;
+        }
     }
 
     qtest_quit(qts);
@@ -1321,6 +1379,47 @@ static struct MachInfo *qtest_get_machines(void)
     return machines;
 }
 
+static const char *qtest_get_default_cpu(const char* machine)
+{
+    struct MachInfo *machines;
+    char *cpu = NULL;
+    int i;
+
+    if (g_str_equal(machine, "none")) {
+        return cpu;
+    }
+
+    machines = qtest_get_machines();
+
+    for (i = 0; machines[i].name != NULL; i++) {
+        if (g_str_equal(machines[i].name, machine)) {
+            cpu = machines[i].default_cpu;
+            break;
+        }
+    }
+
+    return cpu;
+}
+
+char *qtest_get_machine_args(const char *mname, const char *cname,
+                             const char *extra_args)
+{
+    const char *cpu;
+
+    cpu = cname ?: qtest_get_default_cpu(mname);
+    if (!cpu) {
+        /*
+         * There is no default cpu and the test did not provide a cpu
+         * name for this architecture/machine combination. The QEMU
+         * binary might still know how to select a cpu, so leave the
+         * -cpu option out.
+         */
+        return g_strdup_printf("-machine %s %s", mname, extra_args ?: "");
+    }
+    return g_strdup_printf("-machine %s -cpu %s %s", mname, cpu,
+                           extra_args ?: "");
+}
+
 void qtest_cb_for_every_machine(void (*cb)(const char *machine),
                                 bool skip_old_versioned)
 {
diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index fcf1c3c3b3..f86f876c17 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -75,6 +75,17 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args);
  */
 QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd);
 
+/**
+ * qtest_get_machine_args:
+ * @mname: the machine name.
+ * @cname: the cpu name.
+ * @extra_args: other arguments to concatenated in the args string.
+ *
+ * Returns: pointer to args.
+ */
+char *qtest_get_machine_args(const char *mname, const char *cname,
+                             const char *extra_args);
+
 /**
  * qtest_wait_qemu:
  * @s: #QTestState instance to operate on.
-- 
2.35.3


