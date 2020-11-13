Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4892B1A3F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:45:59 +0100 (CET)
Received: from localhost ([::1]:48334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdXWg-0006uc-Nc
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:45:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdXUY-0005cf-K8
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:43:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdXUU-0002KC-SM
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605267822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DeEhGHO5ByzptD8gDgrvny40neuvpTHUKi5C+ACvL5Q=;
 b=UUHDX4UBx4eI1+ABaYERmqXIOJWX7PNx1cR9qXe1zQoZr4Wlbw60mUgkPy4Y7N+0XECbKb
 8WjirkbJ8sSJm3dcA7v+1AwTYXh3PJWE+vyCMZGH1tji6iTjpolKduxPPkU5J+VsM0Xm6u
 JR1qdaHPzJ2dHGGiHEgh10LeZ0i0ju4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-L0YyYJw3Oim40Av0bKgvqQ-1; Fri, 13 Nov 2020 06:43:38 -0500
X-MC-Unique: L0YyYJw3Oim40Av0bKgvqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBC28805EF7;
 Fri, 13 Nov 2020 11:43:37 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BE6919C66;
 Fri, 13 Nov 2020 11:43:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 1/3] hmp: Pass monitor to mon_get_cpu()
Date: Fri, 13 Nov 2020 12:43:24 +0100
Message-Id: <20201113114326.97663-2-kwolf@redhat.com>
In-Reply-To: <20201113114326.97663-1-kwolf@redhat.com>
References: <20201113114326.97663-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, lichun@ruijie.com.cn, dgilbert@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mon_get_cpu() is indirectly called monitor_parse_arguments() where
the current monitor isn't set yet. Instead of using monitor_cur(),
explicitly pass the Monitor pointer to the function.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/monitor/hmp-target.h |  2 +-
 monitor/monitor-internal.h   |  2 +-
 monitor/hmp.c                |  2 +-
 monitor/misc.c               | 18 +++++++++---------
 target/i386/monitor.c        |  2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index 8b7820a3ad..519616d1fb 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -41,7 +41,7 @@ const MonitorDef *target_monitor_defs(void);
 int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval);
 
 CPUArchState *mon_get_cpu_env(void);
-CPUState *mon_get_cpu(void);
+CPUState *mon_get_cpu(Monitor *mon);
 
 void hmp_info_mem(Monitor *mon, const QDict *qdict);
 void hmp_info_tlb(Monitor *mon, const QDict *qdict);
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index ad2e64be13..a6131554da 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -178,7 +178,7 @@ void qmp_send_response(MonitorQMP *mon, const QDict *rsp);
 void monitor_data_destroy_qmp(MonitorQMP *mon);
 void coroutine_fn monitor_qmp_dispatcher_co(void *data);
 
-int get_monitor_def(int64_t *pval, const char *name);
+int get_monitor_def(Monitor *mon, int64_t *pval, const char *name);
 void help_cmd(Monitor *mon, const char *name);
 void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
 int hmp_compare_cmd(const char *name, const char *list);
diff --git a/monitor/hmp.c b/monitor/hmp.c
index c5cd9d372b..1204233999 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -384,7 +384,7 @@ static int64_t expr_unary(Monitor *mon)
                 pch++;
             }
             *q = 0;
-            ret = get_monitor_def(&reg, buf);
+            ret = get_monitor_def(mon, &reg, buf);
             if (ret < 0) {
                 expr_error(mon, "unknown register");
             }
diff --git a/monitor/misc.c b/monitor/misc.c
index 32e6a8c13d..c918d6bd08 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -289,14 +289,14 @@ static CPUState *mon_get_cpu_sync(Monitor *mon, bool synchronize)
     return cpu;
 }
 
-CPUState *mon_get_cpu(void)
+CPUState *mon_get_cpu(Monitor *mon)
 {
-    return mon_get_cpu_sync(monitor_cur(), true);
+    return mon_get_cpu_sync(mon, true);
 }
 
 CPUArchState *mon_get_cpu_env(void)
 {
-    CPUState *cs = mon_get_cpu();
+    CPUState *cs = mon_get_cpu(monitor_cur());
 
     return cs ? cs->env_ptr : NULL;
 }
@@ -319,7 +319,7 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
             cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
         }
     } else {
-        cs = mon_get_cpu();
+        cs = mon_get_cpu(mon);
 
         if (!cs) {
             monitor_printf(mon, "No CPU available\n");
@@ -381,7 +381,7 @@ static void hmp_info_history(Monitor *mon, const QDict *qdict)
 
 static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
 {
-    CPUState *cs = mon_get_cpu();
+    CPUState *cs = mon_get_cpu(mon);
 
     if (!cs) {
         monitor_printf(mon, "No CPU available\n");
@@ -546,7 +546,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
     int l, line_size, i, max_digits, len;
     uint8_t buf[16];
     uint64_t v;
-    CPUState *cs = mon_get_cpu();
+    CPUState *cs = mon_get_cpu(mon);
 
     if (!cs && (format == 'i' || !is_physical)) {
         monitor_printf(mon, "Can not dump without CPU\n");
@@ -711,7 +711,7 @@ static void hmp_gva2gpa(Monitor *mon, const QDict *qdict)
 {
     target_ulong addr = qdict_get_int(qdict, "addr");
     MemTxAttrs attrs;
-    CPUState *cs = mon_get_cpu();
+    CPUState *cs = mon_get_cpu(mon);
     hwaddr gpa;
 
     if (!cs) {
@@ -1663,10 +1663,10 @@ HMPCommand hmp_cmds[] = {
  * Set @pval to the value in the register identified by @name.
  * return 0 if OK, -1 if not found
  */
-int get_monitor_def(int64_t *pval, const char *name)
+int get_monitor_def(Monitor *mon, int64_t *pval, const char *name)
 {
     const MonitorDef *md = target_monitor_defs();
-    CPUState *cs = mon_get_cpu();
+    CPUState *cs = mon_get_cpu(mon);
     void *ptr;
     uint64_t tmp = 0;
     int ret;
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 7abae3c8df..5ca3cab4ec 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -656,7 +656,7 @@ void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
         int id = qdict_get_try_int(qdict, "apic-id", 0);
         cs = cpu_by_arch_id(id);
     } else {
-        cs = mon_get_cpu();
+        cs = mon_get_cpu(mon);
     }
 
 
-- 
2.28.0


