Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B827569721
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 03:03:45 +0200 (CEST)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Fvk-00047G-Ae
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 21:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o9FtJ-0002te-KY
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 21:01:13 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o9FtE-0000R2-M2
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 21:01:10 -0400
Received: by mail-pf1-x436.google.com with SMTP id n12so16303026pfq.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 18:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhCxsYSHLosXl7V9PSYQ6mQg0PRKB1tVYcws6yF4v4k=;
 b=GrQOhDXoofmaI+yDVyZfovbBZsbC+6R2B3dqpoZIpCZkwM8Lt+pZbkKNyDNalg/MuH
 zdL7gX4GYZhrZJomMS5nweoyk4KMrRQNk7EZJe9Nd3EIZWW2t243r2LGqRgoc9+2xvQG
 42CXmlSXu+t8HGUcbr5L58LttQlRInmPAf/6F4v91XE77VdNPGV6Pxho0LOQcBwLj3fj
 a/nOLDpqOCVZPC6+h+7iGUhB/XMv0sFI/+BFzfIIXc93GBaHn88ODj6/1geX6aV3A4yV
 8zwplZr9boOmSnG5GQdj05NA/4T+luH80ZOCRSLK6fadYNaQY2yYRMxGkrFlRrpCPWSD
 Q0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhCxsYSHLosXl7V9PSYQ6mQg0PRKB1tVYcws6yF4v4k=;
 b=3pYX7IbXzH1UJhFI4p1A4o6Bwk1bAsnVH3EH7dFyhtuWqKNj3S/aqPSAgFhrDpAgXH
 X0dduCA5XPMEltXsrWPlR669HvOH22hsGCsy+sQz5WU/Kce5bxoFJMi2Ikbax1hADNMn
 I9p+bVyOsza5608jZIG53kdCe7jQCskIBGwv/W2q3iNco+5SJPzHvcesMEilO+nDALwE
 slmdw/j6+XvMndm9+VhObM9dZs1KSYakflssgG2/udqRh+u070HQSOkZ2hN0EsRWl+9J
 vjzhDaAqhytnjC+V1nOHKbs/mQ4c//4Z3+KFtQlFjf34gJr5XD2Zr+igY5f2puTO3zNm
 DMrQ==
X-Gm-Message-State: AJIora833JCqNtexq4JXDaCkoSvzZngRrcfef72uKDy45VayHOv2Zfg2
 5Al9wkqb2IGeIDZY3tBamNvrjw==
X-Google-Smtp-Source: AGRyM1stUtMigCHSX434iH5is9SQ77A5dM6pnKI/1P303bDKZ4yOW//N2WCq/e6ggEZXwu8txQO/xg==
X-Received: by 2002:a63:5121:0:b0:412:6f70:53e8 with SMTP id
 f33-20020a635121000000b004126f7053e8mr10224086pgb.68.1657155667372; 
 Wed, 06 Jul 2022 18:01:07 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 7-20020a620607000000b00528c26c84a3sm982445pfg.64.2022.07.06.18.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 18:01:06 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com, kkostiuk@redhat.com, marcandre.lureau@redhat.com,
 armbru@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v4 2/2] qga: add command 'guest-get-cpustats'
Date: Thu,  7 Jul 2022 08:56:02 +0800
Message-Id: <20220707005602.696557-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707005602.696557-1-pizhenwei@bytedance.com>
References: <20220707005602.696557-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

A vCPU thread always reaches 100% utilization when:
- guest uses idle=poll
- disable HLT vm-exit
- enable MWAIT

Add new guest agent command 'guest-get-cpustats' to get guest CPU
statistics, we can know the guest workload and how busy the CPU is.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
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
2.20.1


