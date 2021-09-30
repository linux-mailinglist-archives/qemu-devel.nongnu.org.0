Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984B341DB9A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:57:12 +0200 (CEST)
Received: from localhost ([::1]:33722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwYh-000077-9F
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw8m-0006Dj-1C
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:30:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw8k-0002xY-5Z
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633008621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVH8WQbVxKMylHW3f8VHNrC9waZQe5sdhAgJIGnLruk=;
 b=dwnQ5nNBeA4xaNGpKKsYg9pqnI7W/CI7djMEUWtJo4dlymUDsmIStxZCTqwkUiRKf/VQXe
 iCNmvtm8U3txMT1r2H0PvyrLs0cOVBzkzsXl5mAnZBgiWDqG39FZH8F3qBBdc16gZQJMYS
 SHs9YB5ejEv2UvvyKZTWNTxjPZgkaqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-pr79K8JLOhm9qRuuGLA0lw-1; Thu, 30 Sep 2021 09:30:19 -0400
X-MC-Unique: pr79K8JLOhm9qRuuGLA0lw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4F9A804302;
 Thu, 30 Sep 2021 13:30:17 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16D105D9C6;
 Thu, 30 Sep 2021 13:30:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/19] qapi: introduce x-query-opcount QMP command
Date: Thu, 30 Sep 2021 14:23:49 +0100
Message-Id: <20210930132349.3601823-20-berrange@redhat.com>
In-Reply-To: <20210930132349.3601823-1-berrange@redhat.com>
References: <20210930132349.3601823-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a counterpart to the HMP "info opcount" command. It is being
added with an "x-" prefix because this QMP command is intended as an
ad hoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 accel/tcg/cpu-exec.c       | 14 ++++++++++++++
 accel/tcg/hmp.c            | 11 ++++++++++-
 accel/tcg/translate-all.c  |  4 ++--
 include/exec/cpu-all.h     |  2 +-
 include/tcg/tcg.h          |  2 +-
 qapi/machine.json          | 13 +++++++++++++
 tcg/tcg.c                  | 10 +++++-----
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 84e10e0f49..623120d246 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1055,4 +1055,18 @@ HumanReadableText *qmp_x_query_jit(Error **errp)
     return human_readable_text_from_str(buf);
 }
 
+HumanReadableText *qmp_x_query_opcount(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+
+    if (!tcg_enabled()) {
+        error_setg(errp, "JIT information is only available with accel=tcg");
+        return NULL;
+    }
+
+    dump_opcount_info(buf);
+
+    return human_readable_text_from_str(buf);
+}
+
 #endif /* !CONFIG_USER_ONLY */
diff --git a/accel/tcg/hmp.c b/accel/tcg/hmp.c
index 9d7bcd9185..9b049d1e76 100644
--- a/accel/tcg/hmp.c
+++ b/accel/tcg/hmp.c
@@ -22,7 +22,16 @@ static void hmp_info_jit(Monitor *mon, const QDict *qdict)
 
 static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
 {
-    dump_opcount_info();
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = NULL;
+
+    info = qmp_x_query_opcount(&err);
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 static void hmp_tcg_register(void)
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 8f17a91858..bd0bb81d08 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2118,9 +2118,9 @@ void dump_exec_info(GString *buf)
     tcg_dump_info(buf);
 }
 
-void dump_opcount_info(void)
+void dump_opcount_info(GString *buf)
 {
-    tcg_dump_op_count();
+    tcg_dump_op_count(buf);
 }
 
 #else /* CONFIG_USER_ONLY */
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d92f6fa7a9..3c8e24292b 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -432,7 +432,7 @@ static inline bool tlb_hit(target_ulong tlb_addr, target_ulong addr)
 void dump_drift_info(GString *buf);
 /* accel/tcg/translate-all.c */
 void dump_exec_info(GString *buf);
-void dump_opcount_info(void);
+void dump_opcount_info(GString *buf);
 #endif /* CONFIG_TCG */
 
 #endif /* !CONFIG_USER_ONLY */
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 1b56e382b7..cc7f59070b 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -944,7 +944,7 @@ int tcg_check_temp_count(void);
 
 int64_t tcg_cpu_exec_time(void);
 void tcg_dump_info(GString *buf);
-void tcg_dump_op_count(void);
+void tcg_dump_op_count(GString *buf);
 
 #define TCG_CT_CONST  1 /* any constant of register size */
 
diff --git a/qapi/machine.json b/qapi/machine.json
index 568348309c..c735436c47 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1384,6 +1384,19 @@
 { 'command': 'x-query-numa',
   'returns': 'HumanReadableText' }
 
+##
+# @x-query-opcount:
+#
+# Query TCG opcode counters
+#
+# Returns: TCG opcode counters
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-opcount',
+  'returns': 'HumanReadableText',
+  'if': 'CONFIG_TCG' }
+
 ##
 # @x-query-profile:
 #
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 7fcdfd9c0f..d9653990af 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4115,15 +4115,15 @@ static void tcg_profile_snapshot_table(TCGProfile *prof)
     tcg_profile_snapshot(prof, false, true);
 }
 
-void tcg_dump_op_count(void)
+void tcg_dump_op_count(GString *buf)
 {
     TCGProfile prof = {};
     int i;
 
     tcg_profile_snapshot_table(&prof);
     for (i = 0; i < NB_OPS; i++) {
-        qemu_printf("%s %" PRId64 "\n", tcg_op_defs[i].name,
-                    prof.table_op_count[i]);
+        g_string_append_printf(buf, "%s %" PRId64 "\n", tcg_op_defs[i].name,
+                               prof.table_op_count[i]);
     }
 }
 
@@ -4142,9 +4142,9 @@ int64_t tcg_cpu_exec_time(void)
     return ret;
 }
 #else
-void tcg_dump_op_count(void)
+void tcg_dump_op_count(GString *buf)
 {
-    qemu_printf("[TCG profiler not compiled]\n");
+    g_string_append_printf(buf, "[TCG profiler not compiled]\n");
 }
 
 int64_t tcg_cpu_exec_time(void)
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 6aa628691a..251a14ddf7 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -53,6 +53,7 @@ static int query_error_class(const char *cmd)
         { "x-query-usb", ERROR_CLASS_GENERIC_ERROR },
         /* Only valid with accel=tcg */
         { "x-query-jit", ERROR_CLASS_GENERIC_ERROR },
+        { "x-query-opcount", ERROR_CLASS_GENERIC_ERROR },
         { NULL, -1 }
     };
     int i;
-- 
2.31.1


