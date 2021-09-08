Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6116940384F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:55:25 +0200 (CEST)
Received: from localhost ([::1]:47040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNvEi-0001mU-F0
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNuxL-0000ca-Lz
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNuxJ-0003x3-DY
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631097444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0zamBHuSyhxCwxRjHzc1VsYhStYmDG6F1Vgs4R3B4U=;
 b=HhxlkGRy2yWQWTG2dXTAgC30OceyR6BzW7ehaq8oYxrdnjx6HzL1BCZKLaRMDl2Nn7ZcZ5
 TjsSOBrNirTReKPBKyQp6htKB45zUmpGfjfZf6nL9uW1PPnltzCLJLtzw5aQLLLRaquO4J
 c35TpnJLw9pMXLz8yM8eI6cZtmv5+ZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-nOZSJRwVMpqTpBT3P88lCw-1; Wed, 08 Sep 2021 06:37:23 -0400
X-MC-Unique: nOZSJRwVMpqTpBT3P88lCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF29680196C;
 Wed,  8 Sep 2021 10:37:22 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87E0F5C1BB;
 Wed,  8 Sep 2021 10:37:21 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] qapi: introduce x-query-registers QMP command
Date: Wed,  8 Sep 2021 11:37:10 +0100
Message-Id: <20210908103711.683940-5-berrange@redhat.com>
In-Reply-To: <20210908103711.683940-1-berrange@redhat.com>
References: <20210908103711.683940-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a counterpart to the HMP "info registers" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 28 ++++++++++++++++++++++++++++
 qapi/machine.json          | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 216fdfaf3a..0d9943ff60 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -204,3 +204,31 @@ MemdevList *qmp_query_memdev(Error **errp)
     object_child_foreach(obj, query_memdev, &list);
     return list;
 }
+
+RegisterInfo *qmp_x_query_registers(bool has_cpu, int64_t cpu, Error **errp)
+{
+    RegisterInfo *info = g_new0(RegisterInfo, 1);
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
+    info->state = g_steal_pointer(&buf->str);
+    return info;
+}
diff --git a/qapi/machine.json b/qapi/machine.json
index 157712f006..27b922f2ce 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1312,3 +1312,40 @@
      '*cores': 'int',
      '*threads': 'int',
      '*maxcpus': 'int' } }
+
+##
+# @RegisterParams:
+#
+# Information about the CPU to query state of
+#
+# @cpu: the CPU number to query. If omitted, queries all CPUs
+#
+# Since: 6.2.0
+#
+##
+{ 'struct': 'RegisterParams', 'data': {'*cpu': 'int' } }
+
+##
+# @RegisterInfo:
+#
+# Information about the CPU state
+#
+# @state: the CPU state in an architecture specific format
+#
+# Since: 6.2.0
+#
+##
+{ 'struct': 'RegisterInfo', 'data': {'state': 'str' } }
+
+##
+# @x-query-registers:
+#
+# Return information on the CPU registers
+#
+# Returns: the CPU state
+#
+# Since: 6.2.0
+##
+{ 'command': 'x-query-registers',
+  'data': 'RegisterParams',
+  'returns': 'RegisterInfo' }
-- 
2.31.1


