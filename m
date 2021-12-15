Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D384753FD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 09:00:54 +0100 (CET)
Received: from localhost ([::1]:55774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxPDU-0005Al-IU
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 03:00:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOnt-0002zL-F4
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOnr-0004IX-UJ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639553659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/GMu5+sgfU4AwTb5A3MF5fWBs+OjGgwm9dFD33nOOE=;
 b=TSJAWIY/qUpOMc4hW37rftUkG7GgkfYJAuIu2wZRvBKkNlsH70wpenR22G6mX222WWWCvN
 5Rjai5lNHkwjUDrYqgd9rQ719HlB2BstFMLTCd4K1YK0WeZc+rg/ME+UkYN1BoCYfrd7p3
 lpnpbMo+honEjIbcJXEa3gBNLnivGLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-TT6-TNdFOi6PzJW0fR2qqg-1; Wed, 15 Dec 2021 02:34:15 -0500
X-MC-Unique: TT6-TNdFOi6PzJW0fR2qqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF25B81CCB4;
 Wed, 15 Dec 2021 07:34:14 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44F1E1092797;
 Wed, 15 Dec 2021 07:34:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/16] tests/qtest: Add a function that gets a list with
 available machine types
Date: Wed, 15 Dec 2021 08:33:53 +0100
Message-Id: <20211215073402.144286-8-thuth@redhat.com>
In-Reply-To: <20211215073402.144286-1-thuth@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the upcoming patches, we will need a way to gets a list with all
available machine types. Refactor the qtest_cb_for_every_machine()
to split the related code out into a separate new function, and
gather the aliases of the various machine types, too.

Message-Id: <20211201104347.51922-4-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.c | 64 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 25aeea385b..7ae2dc4e1d 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1321,16 +1321,29 @@ static bool qtest_is_old_versioned_machine(const char *mname)
     return res;
 }
 
-void qtest_cb_for_every_machine(void (*cb)(const char *machine),
-                                bool skip_old_versioned)
+struct MachInfo {
+    char *name;
+    char *alias;
+};
+
+/*
+ * Returns an array with pointers to the available machine names.
+ * The terminating entry has the name set to NULL.
+ */
+static struct MachInfo *qtest_get_machines(void)
 {
+    static struct MachInfo *machines;
     QDict *response, *minfo;
     QList *list;
     const QListEntry *p;
     QObject *qobj;
     QString *qstr;
-    const char *mname;
     QTestState *qts;
+    int idx;
+
+    if (machines) {
+        return machines;
+    }
 
     qts = qtest_init("-machine none");
     response = qtest_qmp(qts, "{ 'execute': 'query-machines' }");
@@ -1338,25 +1351,54 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
     list = qdict_get_qlist(response, "return");
     g_assert(list);
 
-    for (p = qlist_first(list); p; p = qlist_next(p)) {
+    machines = g_new(struct MachInfo, qlist_size(list) + 1);
+
+    for (p = qlist_first(list), idx = 0; p; p = qlist_next(p), idx++) {
         minfo = qobject_to(QDict, qlist_entry_obj(p));
         g_assert(minfo);
+
         qobj = qdict_get(minfo, "name");
         g_assert(qobj);
         qstr = qobject_to(QString, qobj);
         g_assert(qstr);
-        mname = qstring_get_str(qstr);
-        /* Ignore machines that cannot be used for qtests */
-        if (!strncmp("xenfv", mname, 5) || g_str_equal("xenpv", mname)) {
-            continue;
-        }
-        if (!skip_old_versioned || !qtest_is_old_versioned_machine(mname)) {
-            cb(mname);
+        machines[idx].name = g_strdup(qstring_get_str(qstr));
+
+        qobj = qdict_get(minfo, "alias");
+        if (qobj) {                               /* The alias is optional */
+            qstr = qobject_to(QString, qobj);
+            g_assert(qstr);
+            machines[idx].alias = g_strdup(qstring_get_str(qstr));
+        } else {
+            machines[idx].alias = NULL;
         }
     }
 
     qtest_quit(qts);
     qobject_unref(response);
+
+    memset(&machines[idx], 0, sizeof(struct MachInfo)); /* Terminating entry */
+    return machines;
+}
+
+void qtest_cb_for_every_machine(void (*cb)(const char *machine),
+                                bool skip_old_versioned)
+{
+    struct MachInfo *machines;
+    int i;
+
+    machines = qtest_get_machines();
+
+    for (i = 0; machines[i].name != NULL; i++) {
+        /* Ignore machines that cannot be used for qtests */
+        if (!strncmp("xenfv", machines[i].name, 5) ||
+            g_str_equal("xenpv", machines[i].name)) {
+            continue;
+        }
+        if (!skip_old_versioned ||
+            !qtest_is_old_versioned_machine(machines[i].name)) {
+            cb(machines[i].name);
+        }
+    }
 }
 
 /*
-- 
2.27.0


