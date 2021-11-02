Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463DF443572
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:19:13 +0100 (CET)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyNL-0007sg-V8
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy9w-0005rv-Gp
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:05:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy9p-0004Jv-OJ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635876313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cx1JxCP6yuf+OjKbnYPR7oCnByGL76iEfDP1hJ3wdAA=;
 b=K4Ecca7XbXKdhtCb3cGd6BnaGjQPUjk0yLR2i58e1mGUms8lKKWzBOSLejBDDhP9Beko+w
 w8ryuLSoz+0G5ixB5013UlvsjVBwh2la0N2IHsRC5lHGHb42GDpAzjDgQO5ypd+olSzMOL
 S3uI/EKkhEvXYrLuLv/asbJWyx326a4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-abwloBV7MNeRTXdy7dg4PQ-1; Tue, 02 Nov 2021 14:05:10 -0400
X-MC-Unique: abwloBV7MNeRTXdy7dg4PQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 131098066EF;
 Tue,  2 Nov 2021 18:05:09 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD06019C59;
 Tue,  2 Nov 2021 18:04:38 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/18] qapi: introduce x-query-opcount QMP command
Date: Tue,  2 Nov 2021 17:57:00 +0000
Message-Id: <20211102175700.1175996-19-berrange@redhat.com>
In-Reply-To: <20211102175700.1175996-1-berrange@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a counterpart to the HMP "info opcount" command. It is being
added with an "x-" prefix because this QMP command is intended as an
ad hoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 accel/tcg/cpu-exec.c       | 14 ++++++++++++++
 accel/tcg/hmp.c            |  7 +------
 accel/tcg/translate-all.c  |  4 ++--
 include/exec/cpu-all.h     |  2 +-
 include/tcg/tcg.h          |  2 +-
 qapi/machine.json          | 13 +++++++++++++
 tcg/tcg.c                  | 10 +++++-----
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 4212645cb6..c0620b4cc7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1066,4 +1066,18 @@ HumanReadableText *qmp_x_query_jit(Error **errp)
     return human_readable_text_from_str(buf);
 }
 
+HumanReadableText *qmp_x_query_opcount(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+
+    if (!tcg_enabled()) {
+        error_setg(errp, "Opcode count information is only available with accel=tcg");
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
index 01c767a464..d2ea352655 100644
--- a/accel/tcg/hmp.c
+++ b/accel/tcg/hmp.c
@@ -6,15 +6,10 @@
 #include "monitor/monitor.h"
 #include "sysemu/tcg.h"
 
-static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
-{
-    dump_opcount_info();
-}
-
 static void hmp_tcg_register(void)
 {
     monitor_register_hmp_info_hrt("jit", qmp_x_query_jit);
-    monitor_register_hmp("opcount", true, hmp_info_opcount);
+    monitor_register_hmp_info_hrt("opcount", qmp_x_query_opcount);
 }
 
 type_init(hmp_tcg_register);
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
index 7c8019a9b2..42f5b500ed 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -938,7 +938,7 @@ int tcg_check_temp_count(void);
 
 int64_t tcg_cpu_exec_time(void);
 void tcg_dump_info(GString *buf);
-void tcg_dump_op_count(void);
+void tcg_dump_op_count(GString *buf);
 
 #define TCG_CT_CONST  1 /* any constant of register size */
 
diff --git a/qapi/machine.json b/qapi/machine.json
index 422a44661f..17794ef681 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1449,6 +1449,19 @@
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
index f9ede8e62e..57f17a4649 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4116,15 +4116,15 @@ static void tcg_profile_snapshot_table(TCGProfile *prof)
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
 
@@ -4143,9 +4143,9 @@ int64_t tcg_cpu_exec_time(void)
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
index ea24fde1a3..7f103ea3fd 100644
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


