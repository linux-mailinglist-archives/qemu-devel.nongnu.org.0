Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE1456296D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 05:11:37 +0200 (CEST)
Received: from localhost ([::1]:47382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o774C-0005Et-5m
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 23:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o773C-0004Ud-Gy
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 23:10:34 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o7737-00088V-Kz
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 23:10:31 -0400
Received: by mail-pf1-x434.google.com with SMTP id t21so1229497pfq.1
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L55KpgNyltmEymN2pCyo6kZ6wYw1udyYPDXqBCih7sY=;
 b=RtNuLUmAgfjVZAgp2b95Lqdf30/obgkzxnmqXt+H+x00tzu0Fo2e3MFbpbOlbGHvcN
 nAAoS2kFt/PygUpQ0J3Xqh9xqCm4aZna7+XkATY63q7eDzm2qI6eEkkkoODweSukbtQk
 a8z31pmeRG+xj2RBgNJ4miPo610JrRBcxu1MvnRzQaHRMCNdb2tcTKFIf250fTMd/Gt9
 yFSgM9wad/z2cVroQ9QbT3du0yIiG5GcpvrlmrTgQygUm24sd5gBBojqflUjhtvwl0PW
 BwMfI4vw4ohsiv1inAq+9zw6bjGdw4jaXERbN+VbGGEbxTg2Lvl0PAEaFQCMTuzU/hzd
 PR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L55KpgNyltmEymN2pCyo6kZ6wYw1udyYPDXqBCih7sY=;
 b=zvdnAF92sDmfTgH5/ioy0Msjg8zfUhFke0wg5b2UhtN9zoSh3PNN6626V2wZPlm98C
 SJIAeZTEx7BC5Le2Q3xVWZ2Kb75fwQgRVRZKiPcIW3WcivnEKav+ojzEmhslK2Ssxcut
 YfHo/QQmlaM6v7xvruKH9foEx39WuZSzdh+I8hGwU3icX4aaVpyukEvqkTMJMnRr0OS9
 iMdJWg+XMPojl7kIZ9REtU9Vx3UIuYTxwnFTh/fkjin7CoRImhrgIew8fu7qKnjFadH6
 +o8up/NsnWPNhHVQpUzUg4KFyCeqqis8RH1v3dFRQ/31yvLr9lnrZvz6p4/q46bJKGIX
 LZtg==
X-Gm-Message-State: AJIora+q7LYaOK3te+tQI6dPDbaQjFFfjCi+eIMfVzNfEP5++BpDlzWa
 hrzPjGrqU4e0TD3q7OAFG2BV7A==
X-Google-Smtp-Source: AGRyM1uG0n/v8Q6hrVnA+e1zdO41UEktz1riVKXfzPblu9A9xMTZIYGMa3lzkiCnzLQcNItWHypk3w==
X-Received: by 2002:a63:cd4e:0:b0:411:acda:d3d2 with SMTP id
 a14-20020a63cd4e000000b00411acdad3d2mr4592002pgj.487.1656645027093; 
 Thu, 30 Jun 2022 20:10:27 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a17090a318800b001ed2fae2271sm2736659pjb.31.2022.06.30.20.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 20:10:26 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com,
	kkostiuk@redhat.com
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH] qga: add command 'guest-get-cpustats'
Date: Fri,  1 Jul 2022 11:05:33 +0800
Message-Id: <20220701030533.575255-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x434.google.com
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

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 qga/commands-posix.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
 qga/commands-win32.c |  6 ++++
 qga/qapi-schema.json | 49 ++++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 0469dc409d..2847023876 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2893,6 +2893,73 @@ GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
     return guest_get_diskstats(errp);
 }
 
+GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
+{
+    GuestCpuStatsList *head = NULL, **tail = &head;
+    const char *cpustats = "/proc/stat";
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
+        if (strncmp(name, "cpu", 3) || (name[3] == '\0')) {
+            continue;
+        }
+
+        cpustat = g_new0(GuestCpuStats, 1);
+        cpustat->cpu = atoi(&name[3]);
+        cpustat->has_user = true;
+        cpustat->user = user * 10;
+        cpustat->has_system = true;
+        cpustat->system = system * 10;
+        cpustat->has_idle = true;
+        cpustat->idle = idle * 10;
+
+        /* Linux version >= 2.6 */
+        if (i > 5) {
+            cpustat->has_iowait = true;
+            cpustat->iowait = iowait * 10;
+            cpustat->has_irq = true;
+            cpustat->irq = irq * 10;
+            cpustat->has_softirq = true;
+            cpustat->softirq = softirq * 10;
+        }
+
+        if (i > 8) {
+            cpustat->has_steal = true;
+            cpustat->steal = steal * 10;
+        }
+
+        if (i > 9) {
+            cpustat->has_guest = true;
+            cpustat->guest = guest * 10;
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
@@ -3247,6 +3314,11 @@ GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
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
index 9fa20e791b..4859c887b2 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1576,3 +1576,52 @@
 { 'command': 'guest-get-diskstats',
   'returns': ['GuestDiskStatsInfo']
 }
+
+##
+# @GuestCpuStats:
+#
+# Get statistics of each CPU in millisecond.
+#
+# @cpu: CPU index in guest OS
+#
+# @user: CPU time of user mode
+#
+# @system: CPU time of system mode
+#
+# @idle: CPU time of idle state
+#
+# @iowait: CPU time waiting IO
+#
+# @irq: CPU time of hardware interrupt
+#
+# @softirq: CPU time of soft interrupt
+#
+# @steal: CPU time stolen by host
+#
+# @guest: CPU time of running guest mode
+#
+# Since: 7.1
+##
+{ 'struct': 'GuestCpuStats',
+  'data': {'cpu': 'int',
+           '*user': 'uint64',
+           '*system': 'uint64',
+           '*idle': 'uint64',
+           '*iowait': 'uint64',
+           '*irq': 'uint64',
+           '*softirq': 'uint64',
+           '*steal': 'uint64',
+           '*guest': 'uint64'
+           } }
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


