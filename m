Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B406940B2D3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:18:10 +0200 (CEST)
Received: from localhost ([::1]:48074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQACH-0003yR-NV
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Sm-0007SC-HY
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Sj-0001p6-Mm
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGP7dXbjGWq7ILIEw/l3CktBYMqdeJCapqhh4XsPuqw=;
 b=SEN3yHt0U1Zxum1VPp7JqBunBjC1XAz6YAo0/GaXOmMDpjSlTJ8/PkI3Sw60Tc5DS1AMn/
 KdbZHH9sM88OxmqsV01zSAxuvVHaXgyAe2sXPgYnGtT/q5DmWkBaCdIAyoWWZPl6avkeII
 4mNPMyd5lKE1N0MeQ25qBeuEjQcFU5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-A6dIhPXlOQuOSDTffEcoBQ-1; Tue, 14 Sep 2021 10:30:59 -0400
X-MC-Unique: A6dIhPXlOQuOSDTffEcoBQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D409610144E2;
 Tue, 14 Sep 2021 14:30:55 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9CF65D9DC;
 Tue, 14 Sep 2021 14:30:09 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/53] qapi: introduce x-query-registers QMP command
Date: Tue, 14 Sep 2021 15:20:18 +0100
Message-Id: <20210914142042.1655100-30-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a counterpart to the HMP "info registers" command. It is being
added with an "x-" prefix because this QMP command is intended as an
ad hoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
 monitor/misc.c             | 25 ++++++++++++++++---------
 qapi/common.json           | 11 +++++++++++
 qapi/machine.json          | 15 +++++++++++++++
 4 files changed, 72 insertions(+), 9 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 216fdfaf3a..c4e384f7d5 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -204,3 +204,33 @@ MemdevList *qmp_query_memdev(Error **errp)
     object_child_foreach(obj, query_memdev, &list);
     return list;
 }
+
+HumanReadableText *qmp_x_query_registers(bool has_cpu, int64_t cpu,
+                                         Error **errp)
+{
+    HumanReadableText *ret;
+    g_autoptr(GString) buf = g_string_new("");
+    CPUState *cs = NULL, *tmp;
+
+    if (has_cpu) {
+        CPU_FOREACH(tmp) {
+            if (cpu == tmp->cpu_index) {
+                cs = tmp;
+            }
+        }
+        if (!cs) {
+            error_setg(errp, "CPU %"PRId64" not available", cpu);
+            return NULL;
+        }
+        cpu_format_state(cs, buf, CPU_DUMP_FPU);
+    } else {
+        CPU_FOREACH(cs) {
+            g_string_append_printf(buf, "\nCPU#%d\n", cs->cpu_index);
+            cpu_format_state(cs, buf, CPU_DUMP_FPU);
+        }
+    }
+
+    ret = g_new0(HumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
diff --git a/monitor/misc.c b/monitor/misc.c
index ffe7966870..f25801a1a3 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -67,6 +67,7 @@
 #include "block/block-hmp-cmds.h"
 #include "qapi/qapi-commands-char.h"
 #include "qapi/qapi-commands-control.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-qom.h"
@@ -301,23 +302,29 @@ int monitor_get_cpu_index(Monitor *mon)
 static void hmp_info_registers(Monitor *mon, const QDict *qdict)
 {
     bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
-    CPUState *cs;
+    bool has_cpu = !all_cpus;
+    int64_t cpu = 0;
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = NULL;
 
-    if (all_cpus) {
-        CPU_FOREACH(cs) {
-            monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
-            cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
-        }
-    } else {
-        cs = mon_get_cpu(mon);
+    if (has_cpu) {
+        CPUState *cs = mon_get_cpu(mon);
 
         if (!cs) {
             monitor_printf(mon, "No CPU available\n");
             return;
         }
 
-        cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
+        cpu = cs->cpu_index;
     }
+
+    info = qmp_x_query_registers(has_cpu, cpu, &err);
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 static void hmp_info_sync_profile(Monitor *mon, const QDict *qdict)
diff --git a/qapi/common.json b/qapi/common.json
index 7c976296f0..de7614ca99 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -197,3 +197,14 @@
 { 'enum': 'GrabToggleKeys',
   'data': [ 'ctrl-ctrl', 'alt-alt', 'shift-shift','meta-meta', 'scrolllock',
             'ctrl-scrolllock' ] }
+
+##
+# @HumanReadableText:
+#
+# @human-readable-text: Formatted output intended for humans.
+#
+# Since: 6.2.0
+#
+##
+{ 'struct': 'HumanReadableText',
+  'data': { 'human-readable-text': 'str' } }
diff --git a/qapi/machine.json b/qapi/machine.json
index 157712f006..8737efa865 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1312,3 +1312,18 @@
      '*cores': 'int',
      '*threads': 'int',
      '*maxcpus': 'int' } }
+
+##
+# @x-query-registers:
+#
+# @cpu: the CPU number to query. If omitted, queries all CPUs
+#
+# Query information on the CPU registers
+#
+# Returns: CPU state in an architecture-specific format
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-registers',
+  'data': {'*cpu': 'int' },
+  'returns': 'HumanReadableText' }
-- 
2.31.1


