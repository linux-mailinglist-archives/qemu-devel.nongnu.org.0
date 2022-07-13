Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3DC57342C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 12:29:43 +0200 (CEST)
Received: from localhost ([::1]:45110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBZck-00063L-Vx
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 06:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBZSi-00063y-8L
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 06:19:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBZSg-0007fv-9g
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 06:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657707557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d6c9Dh6DpJEE7vEzrUk2dji3IV6ZaqsRoo9BP1lAldQ=;
 b=X0xR77XvHbUP3YlKCHPMeizR/vsdVhyCvuz5qifyICVa2S/LxAbK9S5EBweztzafsIwsNL
 U74XEK8LpAaKakFvAf4CZ68Zzbw1VVTMROF6ImWO+oa841XTT78g0SI4t/oIdda8UPs/yw
 7/i0pSkaDeAkupKqh8GSHsh5mCQ3MzI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-9Tuc5BycMvyNk_hQ3Rmf7w-1; Wed, 13 Jul 2022 06:19:16 -0400
X-MC-Unique: 9Tuc5BycMvyNk_hQ3Rmf7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E236E3804061;
 Wed, 13 Jul 2022 10:19:15 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.194.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02FE71121314;
 Wed, 13 Jul 2022 10:19:14 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 3/3] qga: add command 'guest-get-cpustats'
Date: Wed, 13 Jul 2022 13:19:08 +0300
Message-Id: <20220713101908.2212307-4-kkostiuk@redhat.com>
In-Reply-To: <20220713101908.2212307-1-kkostiuk@redhat.com>
References: <20220713101908.2212307-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhenwei pi <pizhenwei@bytedance.com>

A vCPU thread always reaches 100% utilization when:
- guest uses idle=poll
- disable HLT vm-exit
- enable MWAIT

Add new guest agent command 'guest-get-cpustats' to get guest CPU
statistics, we can know the guest workload and how busy the CPU is.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20220707005602.696557-3-pizhenwei@bytedance.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-posix.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
 qga/commands-win32.c |  6 +++
 qga/qapi-schema.json | 81 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 0469dc409d..f18530d85f 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2893,6 +2893,90 @@ GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
     return guest_get_diskstats(errp);
 }
 
+GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
+{
+    GuestCpuStatsList *head = NULL, **tail = &head;
+    const char *cpustats = "/proc/stat";
+    int clk_tck = sysconf(_SC_CLK_TCK);
+    FILE *fp;
+    size_t n;
+    char *line = NULL;
+
+    fp = fopen(cpustats, "r");
+    if (fp  == NULL) {
+        error_setg_errno(errp, errno, "open(\"%s\")", cpustats);
+        return NULL;
+    }
+
+    while (getline(&line, &n, fp) != -1) {
+        GuestCpuStats *cpustat = NULL;
+        GuestLinuxCpuStats *linuxcpustat;
+        int i;
+        unsigned long user, system, idle, iowait, irq, softirq, steal, guest;
+        unsigned long nice, guest_nice;
+        char name[64];
+
+        i = sscanf(line, "%s %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu",
+                   name, &user, &nice, &system, &idle, &iowait, &irq, &softirq,
+                   &steal, &guest, &guest_nice);
+
+        /* drop "cpu 1 2 3 ...", get "cpuX 1 2 3 ..." only */
+        if ((i == EOF) || strncmp(name, "cpu", 3) || (name[3] == '\0')) {
+            continue;
+        }
+
+        if (i < 5) {
+            slog("Parsing cpu stat from %s failed, see \"man proc\"", cpustats);
+            break;
+        }
+
+        cpustat = g_new0(GuestCpuStats, 1);
+        cpustat->type = GUEST_CPU_STATS_TYPE_LINUX;
+
+        linuxcpustat = &cpustat->u.q_linux;
+        linuxcpustat->cpu = atoi(&name[3]);
+        linuxcpustat->user = user * 1000 / clk_tck;
+        linuxcpustat->nice = nice * 1000 / clk_tck;
+        linuxcpustat->system = system * 1000 / clk_tck;
+        linuxcpustat->idle = idle * 1000 / clk_tck;
+
+        if (i > 5) {
+            linuxcpustat->has_iowait = true;
+            linuxcpustat->iowait = iowait * 1000 / clk_tck;
+        }
+
+        if (i > 6) {
+            linuxcpustat->has_irq = true;
+            linuxcpustat->irq = irq * 1000 / clk_tck;
+            linuxcpustat->has_softirq = true;
+            linuxcpustat->softirq = softirq * 1000 / clk_tck;
+        }
+
+        if (i > 8) {
+            linuxcpustat->has_steal = true;
+            linuxcpustat->steal = steal * 1000 / clk_tck;
+        }
+
+        if (i > 9) {
+            linuxcpustat->has_guest = true;
+            linuxcpustat->guest = guest * 1000 / clk_tck;
+        }
+
+        if (i > 10) {
+            linuxcpustat->has_guest = true;
+            linuxcpustat->guest = guest * 1000 / clk_tck;
+            linuxcpustat->has_guestnice = true;
+            linuxcpustat->guestnice = guest_nice * 1000 / clk_tck;
+        }
+
+        QAPI_LIST_APPEND(tail, cpustat);
+    }
+
+    free(line);
+    fclose(fp);
+    return head;
+}
+
 #else /* defined(__linux__) */
 
 void qmp_guest_suspend_disk(Error **errp)
@@ -3247,6 +3331,11 @@ GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
     return NULL;
 }
 
+GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
 
 #endif /* CONFIG_FSFREEZE */
 
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 36f94c0f9c..7ed7664715 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2543,3 +2543,9 @@ GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
     error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
+
+GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 9fa20e791b..869399ea1a 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1576,3 +1576,84 @@
 { 'command': 'guest-get-diskstats',
   'returns': ['GuestDiskStatsInfo']
 }
+
+##
+# @GuestCpuStatsType:
+#
+# An enumeration of OS type
+#
+# Since: 7.1
+##
+{ 'enum': 'GuestCpuStatsType',
+  'data': [ 'linux' ] }
+
+
+##
+# @GuestLinuxCpuStats:
+#
+# CPU statistics of Linux
+#
+# @cpu: CPU index in guest OS
+#
+# @user: Time spent in user mode
+#
+# @nice: Time spent in user mode with low priority (nice)
+#
+# @system: Time spent in system mode
+#
+# @idle: Time spent in the idle task
+#
+# @iowait: Time waiting for I/O to complete (since Linux 2.5.41)
+#
+# @irq: Time servicing interrupts (since Linux 2.6.0-test4)
+#
+# @softirq: Time servicing softirqs (since Linux 2.6.0-test4)
+#
+# @steal: Stolen time by host (since Linux 2.6.11)
+#
+# @guest: ime spent running a virtual CPU for guest operating systems under
+#         the  control of the Linux kernel (since Linux 2.6.24)
+#
+# @guestnice: Time spent running a niced guest (since Linux 2.6.33)
+#
+# Since: 7.1
+##
+{ 'struct': 'GuestLinuxCpuStats',
+  'data': {'cpu': 'int',
+           'user': 'uint64',
+           'nice': 'uint64',
+           'system': 'uint64',
+           'idle': 'uint64',
+           '*iowait': 'uint64',
+           '*irq': 'uint64',
+           '*softirq': 'uint64',
+           '*steal': 'uint64',
+           '*guest': 'uint64',
+           '*guestnice': 'uint64'
+           } }
+
+##
+# @GuestCpuStats:
+#
+# Get statistics of each CPU in millisecond.
+#
+# - @linux: Linux style CPU statistics
+#
+# Since: 7.1
+##
+{ 'union': 'GuestCpuStats',
+  'base': { 'type': 'GuestCpuStatsType' },
+  'discriminator': 'type',
+  'data': { 'linux': 'GuestLinuxCpuStats' } }
+
+##
+# @guest-get-cpustats:
+#
+# Retrieve information about CPU stats.
+# Returns: List of CPU stats of guest.
+#
+# Since: 7.1
+##
+{ 'command': 'guest-get-cpustats',
+  'returns': ['GuestCpuStats']
+}
-- 
2.25.1


