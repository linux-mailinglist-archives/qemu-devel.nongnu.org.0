Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20FD283BF9
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 18:05:14 +0200 (CEST)
Received: from localhost ([::1]:60256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPSzB-0006AL-Ex
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 12:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kPStP-00006d-GH
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:59:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kPStN-00027r-2E
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601913552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJ/TXGssTZ/x86vLmpi3fesf+kz5sbh47LqCnysdpzI=;
 b=aHcVZfO3F4QomDQKlI60MK9aRE+nOdEJ0jp4WL/wfLgNxEtsEZv3ulLPCTeepQWPAWCmnK
 3AjXU7hQEnQChTRN5w6kIoly85c7RkyQrqFoXi/7yJ1s99sCNvVSbT52xJgwucvlx6KwXA
 9B48/qBrY14w9RooIF0PLuYBQwTxXC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-OUUZfKkxPeeYrLrBTDhH6w-1; Mon, 05 Oct 2020 11:59:10 -0400
X-MC-Unique: OUUZfKkxPeeYrLrBTDhH6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E4D864094;
 Mon,  5 Oct 2020 15:59:09 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-145.ams2.redhat.com
 [10.36.113.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFDCC68432;
 Mon,  5 Oct 2020 15:59:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 01/14] monitor: Add Monitor parameter to monitor_set_cpu()
Date: Mon,  5 Oct 2020 17:58:42 +0200
Message-Id: <20201005155855.256490-2-kwolf@redhat.com>
In-Reply-To: <20201005155855.256490-1-kwolf@redhat.com>
References: <20201005155855.256490-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, marcandre.lureau@gmail.com, armbru@redhat.com,
 stefanha@redhat.com, qemu-devel@nongnu.org
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
index c0170773d4..04f472ac4f 100644
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
index dc0de39219..0c0a03f824 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -998,7 +998,7 @@ void hmp_cpu(Monitor *mon, const QDict *qdict)
     /* XXX: drop the monitor_set_cpu() usage when all HMP commands that
             use it are converted to the QAPI */
     cpu_index = qdict_get_int(qdict, "index");
-    if (monitor_set_cpu(cpu_index) < 0) {
+    if (monitor_set_cpu(mon, cpu_index) < 0) {
         monitor_printf(mon, "invalid CPU index\n");
     }
 }
diff --git a/monitor/misc.c b/monitor/misc.c
index 6e0da0cb96..25b42593cc 100644
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


