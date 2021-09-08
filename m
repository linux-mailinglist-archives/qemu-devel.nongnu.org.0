Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3622740382F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:48:50 +0200 (CEST)
Received: from localhost ([::1]:54752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNv8K-0004nU-4V
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNuxO-0000p5-Vb
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:37:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNuxL-0003yQ-Uu
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631097446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gr3ePbRsec0D0Q8wPR3TkoswcYi2RmAmEO3Z1GwQXjo=;
 b=IM/8aqK9BYVCa/h3UqNO5Y8ms3vj3JIn9ZlWxwxze67PbhjLZf5HuzEGlumFGEwG303CFX
 PnO6/loJt69BJyCZiVBMEeMXxaxAZxhoI4d0g8fmGy0LQK3epxcDS8LAKedzarQoq5IWJc
 Pb9rPdJFKCNzllbHZGGm0pFCpOgED6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-MQLjeFkuP_GG6N4XQmx-CQ-1; Wed, 08 Sep 2021 06:37:25 -0400
X-MC-Unique: MQLjeFkuP_GG6N4XQmx-CQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8717835DE0;
 Wed,  8 Sep 2021 10:37:24 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44EE35C1BB;
 Wed,  8 Sep 2021 10:37:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] monitor: rewrite 'info registers' in terms of
 'x-query-registers'
Date: Wed,  8 Sep 2021 11:37:11 +0100
Message-Id: <20210908103711.683940-6-berrange@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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

Now that we have a QMP command 'x-query-registers', the HMP counterpart
'info registers' can be refactored to call the former.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 monitor/misc.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index ffe7966870..f0b94c3084 100644
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
+    Error *local_err = NULL;
+    g_autoptr(RegisterInfo) info = NULL;
 
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
+    }
+
+    info = qmp_x_query_registers(has_cpu, cpu, &local_err);
+    if (!info) {
+        error_report_err(local_err);
+        return;
     }
+
+    monitor_printf(mon, "%s", info->state);
 }
 
 static void hmp_info_sync_profile(Monitor *mon, const QDict *qdict)
-- 
2.31.1


