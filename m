Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BA1568561
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:22:53 +0200 (CEST)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o92BI-00040r-Km
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o91lY-0002Sp-M7
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:56:17 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o91lT-0004Fs-HR
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:56:13 -0400
Received: by mail-pf1-x42a.google.com with SMTP id j3so1271818pfb.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 02:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pXRNOcUVQt7ynav6EpX9YWouYeszpJTC/kHPlLkpUOk=;
 b=kw/VRyi+IiiK1/cQHqEMHLZgNwX4z0yOGdl+7gHMx34nkMCzNNM/ovu51cuDi054In
 kQVEbRJmOo973gYt+7GoBYBXMZuEbI0nSY3oPQXbhGplXffNdBkgKu2Y6D5mxu+mLmhH
 i3Ei1SQZf0RkkR65RfUalAfKeG2qWADKqqowfMvoHtJFeWbJCueAWgrC3quR7rF8BYzv
 4RKtjbvLL5fPkU5XHcWGBx+HD+rCjPePWrta5uQUFJ/bGE+s0ojpOBukOqbXPhe4K5xw
 foW8f9XcXfnBmpUC8+xv/7mD0N8T2n4rzYM/24Q0FxfTjcFDaduXkzFyu1rBtTocRv8z
 ljBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pXRNOcUVQt7ynav6EpX9YWouYeszpJTC/kHPlLkpUOk=;
 b=cON6WlgyzpenFtplVkqMJj8kaabkOSOJDaVMER7iKCEgsHHb7CqgOtsBve5RdjIZ71
 tHvH4kpoo2fHP1ST293RVRsfHJAPVdh2QlomEGtGaoB7wEjGKWwoykLl/OAqeN3gPf9Y
 tNJqKLHH93BVlhkD6EoO/ZgCayAM2R+bIhGzXEhipBW88oUQ6nmPrbOavHuGR/TbAel1
 x1W2SWm4VoHEYnimwEXP4CLo90nv9NbFCtalGq6d+mkBb+JlC37MQ6ix0maTSQl7c0p7
 k0cdKj98EbTOvfqYgAbuN4gOv1w7zqhrALK8NRTTtN0YzYdXQgvo/L53036RHWar+oxy
 YPQg==
X-Gm-Message-State: AJIora+wq7hiSGiyKaqfCxq/JCg5+KtpTaWGNlUQeo2bOubNNoitsxEC
 EZqfdqaG140tqUfPq7p7t7LjUw==
X-Google-Smtp-Source: AGRyM1s3irYb4/d7vm9AWXpKd4euBH2KEzXfTfWTwSfYfSMJ0kg8fqwAgyZvcFsi/tm/8HopijZN7g==
X-Received: by 2002:aa7:8018:0:b0:528:9759:30f5 with SMTP id
 j24-20020aa78018000000b00528975930f5mr7753884pfi.33.1657101370049; 
 Wed, 06 Jul 2022 02:56:10 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a056a000d5800b00517c84fd24asm25366818pfv.172.2022.07.06.02.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 02:56:09 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com,
	kkostiuk@redhat.com,
	marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 1/1] qga: add command 'guest-get-cpustats'
Date: Wed,  6 Jul 2022 17:51:11 +0800
Message-Id: <20220706095111.686295-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706095111.686295-1-pizhenwei@bytedance.com>
References: <20220706095111.686295-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42a.google.com
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

To avoid compiling error like:
qga/qga-qapi-types.h:948:28: error: expected member name or ';'
 after declaration specifiers
        GuestLinuxCpuStats linux;
        ~~~~~~~~~~~~~~~~~~ ^
<built-in>:336:15: note: expanded from here

Also add 'linux' into polluted_words.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 qga/commands-posix.c   | 89 ++++++++++++++++++++++++++++++++++++++++++
 qga/commands-win32.c   |  6 +++
 qga/qapi-schema.json   | 81 ++++++++++++++++++++++++++++++++++++++
 scripts/qapi/common.py |  2 +-
 4 files changed, 177 insertions(+), 1 deletion(-)

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
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 489273574a..737b059e62 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -114,7 +114,7 @@ def c_name(name: str, protect: bool = True) -> str:
                      'and', 'and_eq', 'bitand', 'bitor', 'compl', 'not',
                      'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
     # namespace pollution:
-    polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386'])
+    polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386', 'linux'])
     name = re.sub(r'[^A-Za-z0-9_]', '_', name)
     if protect and (name in (c89_words | c99_words | c11_words | gcc_words
                              | cpp_words | polluted_words)
-- 
2.20.1


