Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B6C263045
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 17:14:34 +0200 (CEST)
Received: from localhost ([::1]:57920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG1ns-00050X-VW
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 11:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kG1lX-0000u3-9Y
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 11:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kG1lU-0003kW-00
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 11:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599664323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIDc3ykYJbs2CF6012HrA58e9+NyCuGJq9BhqyU/RYc=;
 b=c4FFtqhtoN3wIxm3E6DGl/1j4Zj/M/GIFxj2zLwIQ/ZJFta8xijy4vMt4iBN4WhhzdGjeC
 3JFD3KN9bPZQ9MAll28L7ywEGk363pQ1g8LjJ7de2rb383Xld4tztEIkiwdrg6oQI73Mne
 GydI+TjdtZrB+NTvdG2e3V7fUwmPWr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-jCe5qny3NTi47aucPKLMGQ-1; Wed, 09 Sep 2020 11:12:01 -0400
X-MC-Unique: jCe5qny3NTi47aucPKLMGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3380B10059A7;
 Wed,  9 Sep 2020 15:12:00 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-221.ams2.redhat.com
 [10.36.113.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B28F660BEC;
 Wed,  9 Sep 2020 15:11:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 01/13] monitor: Add Monitor parameter to monitor_set_cpu()
Date: Wed,  9 Sep 2020 17:11:37 +0200
Message-Id: <20200909151149.490589-2-kwolf@redhat.com>
In-Reply-To: <20200909151149.490589-1-kwolf@redhat.com>
References: <20200909151149.490589-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 07:20:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most callers actually don't have to rely on cur_mon, but already know
for which monitor they call monitor_set_cpu().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/monitor/monitor.h |  2 +-
 monitor/hmp-cmds.c        |  2 +-
 monitor/misc.c            | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 1018d754a6..0dcaefd4f9 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -33,7 +33,7 @@ int monitor_vprintf(Monitor *mon, const char *fmt, va_list ap)
     GCC_FMT_ATTR(2, 0);
 int monitor_printf(Monitor *mon, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
 void monitor_flush(Monitor *mon);
-int monitor_set_cpu(int cpu_index);
+int monitor_set_cpu(Monitor *mon, int cpu_index);
 int monitor_get_cpu_index(void);
 
 void monitor_read_command(MonitorHMP *mon, int show_prompt);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 7711726fd2..f608b5b27b 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -996,7 +996,7 @@ void hmp_cpu(Monitor *mon, const QDict *qdict)
     /* XXX: drop the monitor_set_cpu() usage when all HMP commands that
             use it are converted to the QAPI */
     cpu_index = qdict_get_int(qdict, "index");
-    if (monitor_set_cpu(cpu_index) < 0) {
+    if (monitor_set_cpu(mon, cpu_index) < 0) {
         monitor_printf(mon, "invalid CPU index\n");
     }
 }
diff --git a/monitor/misc.c b/monitor/misc.c
index e847b58a8c..b4f779b8d3 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -129,7 +129,7 @@ char *qmp_human_monitor_command(const char *command_line, bool has_cpu_index,
     cur_mon = &hmp.common;
 
     if (has_cpu_index) {
-        int ret = monitor_set_cpu(cpu_index);
+        int ret = monitor_set_cpu(&hmp.common, cpu_index);
         if (ret < 0) {
             cur_mon = old_mon;
             error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cpu-index",
@@ -255,7 +255,7 @@ static void monitor_init_qmp_commands(void)
 }
 
 /* Set the current CPU defined by the user. Callers must hold BQL. */
-int monitor_set_cpu(int cpu_index)
+int monitor_set_cpu(Monitor *mon, int cpu_index)
 {
     CPUState *cpu;
 
@@ -263,8 +263,8 @@ int monitor_set_cpu(int cpu_index)
     if (cpu == NULL) {
         return -1;
     }
-    g_free(cur_mon->mon_cpu_path);
-    cur_mon->mon_cpu_path = object_get_canonical_path(OBJECT(cpu));
+    g_free(mon->mon_cpu_path);
+    mon->mon_cpu_path = object_get_canonical_path(OBJECT(cpu));
     return 0;
 }
 
@@ -285,7 +285,7 @@ static CPUState *mon_get_cpu_sync(bool synchronize)
         if (!first_cpu) {
             return NULL;
         }
-        monitor_set_cpu(first_cpu->cpu_index);
+        monitor_set_cpu(cur_mon, first_cpu->cpu_index);
         cpu = first_cpu;
     }
     assert(cpu != NULL);
-- 
2.25.4


