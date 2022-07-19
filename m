Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013D85794DB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:06:54 +0200 (CEST)
Received: from localhost ([::1]:41738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiFp-0007wZ-45
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oDiA5-0001J2-B9
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:00:59 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oDi9x-0003KD-4y
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:00:53 -0400
Received: by mail-pl1-x62a.google.com with SMTP id 5so11253172plk.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2pFY0fHeDSrWmFGa24W8cymcmr9ZbawTu6Ym3r4zaf8=;
 b=W6HZXvxZs2mbkfBtpRb457yLCC4B5XASbxVR8Pd35MFNIi8zZ5lGIyfoH5WBj+6Gyt
 spQrmQZzT9Gy1BPG0r1HF5o8oJETBVc+PysAZfUvRSRehLog7OuNli9+jx7bDNdjlw1T
 Untd4/Ke+eOo506z9B44DwtfkQJgetGILQ6xlPzyhSzrW11gAZHz5bre+sQEQZf0sku6
 tzW0MhM2hhg1Py/LnNnsAVABjucpG09AtBcojpsYg5PG2Y4Y1rN0Jq596mwguTGq8Eew
 TMM1suFADuXbjKy3LG1yxVM5VdT7k+tTuTQaq87tTaRHECClGwiybZO75PCuEaLfywzI
 ZHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2pFY0fHeDSrWmFGa24W8cymcmr9ZbawTu6Ym3r4zaf8=;
 b=xxToXBRmqM2ENWQxq51K3PPWcXLTQDIYTudtPk6yjvw1pNDV9251UvFPWhD3AflFNC
 leAe0PZsVNhZixIVMM7fUEEWf/BY/cK+I3Rr1CJRyZqsDwnixUJqUSC67aUDL5Tg6O84
 26+KITIDOtZWAsctQEYqfcwxZVdB14gA1n0bwT/WOxXxP7+esEmeE1VbrHhhtN62A5Sg
 X1Smm/5QGs0IGYoGMcbvm/w01rpg/86O1lCsZWJq3exviKyzJ/6TGFn6vctEVhXeXZSw
 HCrVwIPby9RA0l9NVM5YMkkDVtFhBTu6STtEb746DjSlM+hL4tGCMYKgCjHEjHR9Y+fe
 cxeg==
X-Gm-Message-State: AJIora9QVHm2CwzOQLipd2C4tZr5mUH4IjINSOkmXMEoHHVwwrphgmN3
 Aks3Mp9T/PnZ/ILlywj5CwxiBg==
X-Google-Smtp-Source: AGRyM1utFhsuEtTpNa4UFhveKO9p4FD1M2nkhNZMoTnbDF0GLJAzC7O1JO6WthssAZDjPAuwjrOldA==
X-Received: by 2002:a17:902:dacb:b0:16c:4f39:f846 with SMTP id
 q11-20020a170902dacb00b0016c4f39f846mr30485544plx.169.1658217647168; 
 Tue, 19 Jul 2022 01:00:47 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a17090a294200b001f20d9a547asm43941pjf.22.2022.07.19.01.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 01:00:46 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: dgilbert@redhat.com
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH] monitor: Support specified vCPU registers
Date: Tue, 19 Jul 2022 15:55:44 +0800
Message-Id: <20220719075544.932927-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62a.google.com
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

Originally we have to get all the vCPU registers and parse the
specified one. To improve the performance of this usage, allow user
specified vCPU id to query registers.

Run a VM with 16 vCPU, use bcc tool to track the latency of
'hmp_info_registers':
'info registers -a' uses about 3ms;
'info register 12' uses about 150us.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hmp-commands-info.hx |  6 +++---
 monitor/misc.c       | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 3ffa24bd67..6023e2b5c5 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -100,9 +100,9 @@ ERST
 
     {
         .name       = "registers",
-        .args_type  = "cpustate_all:-a",
-        .params     = "[-a]",
-        .help       = "show the cpu registers (-a: all - show register info for all cpus)",
+        .args_type  = "cpustate_all:-a,vcpu:i?",
+        .params     = "[-a] [vcpu]",
+        .help       = "show the cpu registers (-a: all - show register info for all cpus; vcpu: vCPU to query)",
         .cmd        = hmp_info_registers,
     },
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 3d2312ba8d..b12309faad 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -307,6 +307,7 @@ int monitor_get_cpu_index(Monitor *mon)
 static void hmp_info_registers(Monitor *mon, const QDict *qdict)
 {
     bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
+    int vcpu = qdict_get_try_int(qdict, "vcpu", -1);
     CPUState *cs;
 
     if (all_cpus) {
@@ -314,6 +315,24 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
             cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
         }
+    } else if (vcpu >= 0) {
+        CPUState *target_cs = NULL;
+
+        CPU_FOREACH(cs) {
+            if (cs->cpu_index == vcpu) {
+                target_cs = cs;
+                break;
+            }
+        }
+
+        if (!target_cs) {
+            monitor_printf(mon, "CPU#%d not available\n", vcpu);
+            return;
+        }
+
+        monitor_printf(mon, "\nCPU#%d\n", target_cs->cpu_index);
+        cpu_dump_state(target_cs, NULL, CPU_DUMP_FPU);
+        return;
     } else {
         cs = mon_get_cpu(mon);
 
-- 
2.20.1


