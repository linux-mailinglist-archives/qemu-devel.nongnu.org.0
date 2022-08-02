Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC4358782E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 09:47:50 +0200 (CEST)
Received: from localhost ([::1]:34948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oImd3-0003g5-4e
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 03:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oImY4-0008Rw-Vq
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:42:41 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oImXy-0004eK-B2
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:42:36 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 w17-20020a17090a8a1100b001f326c73df6so12888305pjn.3
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 00:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+s2f/I9kyvn+CYAYhIKYntc94ugQoOyMWp7qiyL9Zfw=;
 b=j0Ts1BxmWSTTOUGY00k4aQqersuOvBgNQ6QGE7cLL3vB+kMwvsTFfF5z1FmxNMDyQK
 FxHtcmIfZvLZWrghst6B10mVQFuGGSv90a/eRAXQIe1QyIObtx8DuHTlF9LNRBdwQ3rZ
 pWzW8TUqukY5pPlWBE8bivHwAM++V31aqgCqumHTL19BxcsXScughKNOs27HknRiOVij
 +HcG08KUWJ5qvS2p3GbGCN5yagYzzxCTJGHLhf7fTLoxGuZslrmtlhFOElOWbmOLvg4+
 EL/3OJ8Vd2SSMWMVq4XxL1vK3kwe62sWM9MD5u8OI8y7DKwf36hXCkyrCc/Pk69dEBId
 210w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+s2f/I9kyvn+CYAYhIKYntc94ugQoOyMWp7qiyL9Zfw=;
 b=vUeq+0T6/toKNYH6j0g5MuFEwv4lhazkTYDGkND8yYLKRyMIDKiWCtZ/trFJ34EzH8
 44AMAI4K8V3+WNkY/A3BwdBWl4vDVbpce0yrJHp9cLMcGC1SRsqTwOxFnNqTCaVmFf3s
 wU9EGRDGWpXmvKHmGIgDqsiMo8QzX/4tzPlvdCZv/tBAkcLN6RVYA4AgWOynjeaUoqaW
 QsjTeeX2/v09qP75eX57AxUiemAO3kwI98RzypVQLSPp5tsork1RSjKhc/l66Uw8KfqH
 3cIHNHso+FvJuWe0/bikbWG/tuQRBBjKRgK/kLS02nDbQ92nYnM/f344UF4MMRDdOuKu
 L1XA==
X-Gm-Message-State: ACgBeo2GLe5soH58TPO7avlDbk6GikzW+smV3fBIw7D55UhSuxcDs+lY
 0PAq9yQWISF/21hsMIi0JEYStQ==
X-Google-Smtp-Source: AA6agR6ZQtJt7NYJ4E5Y24EpWRHOoZznWf2Q+aBOLkXr3NiuTqMMkeQnbhc/Ki3++x2X2ElhJesz/A==
X-Received: by 2002:a17:902:8508:b0:16c:46ff:53c8 with SMTP id
 bj8-20020a170902850800b0016c46ff53c8mr20147469plb.29.1659426152851; 
 Tue, 02 Aug 2022 00:42:32 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a17090301c800b0016dc44459a8sm10996623plh.12.2022.08.02.00.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 00:42:32 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: dgilbert@redhat.com,
	armbru@redhat.com
Cc: qemu-devel@nongnu.org, darren.kenny@oracle.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v4 1/1] monitor: Support specified vCPU registers
Date: Tue,  2 Aug 2022 15:37:20 +0800
Message-Id: <20220802073720.1236988-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802073720.1236988-1-pizhenwei@bytedance.com>
References: <20220802073720.1236988-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1029.google.com
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
'info registers 12' uses about 150us.

Cc: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hmp-commands-info.hx |  8 +++++---
 monitor/misc.c       | 10 ++++++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 188d9ece3b..e012035541 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -100,9 +100,11 @@ ERST
 
     {
         .name       = "registers",
-        .args_type  = "cpustate_all:-a",
-        .params     = "[-a]",
-        .help       = "show the cpu registers (-a: all - show register info for all cpus)",
+        .args_type  = "cpustate_all:-a,vcpu:i?",
+        .params     = "[-a|vcpu]",
+        .help       = "show the cpu registers (-a: show register info for all cpus;"
+                      " vcpu: specific vCPU to query; show the current CPU's registers if"
+                      " no argument is specified)",
         .cmd        = hmp_info_registers,
     },
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 3d2312ba8d..6436a8786b 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -307,6 +307,7 @@ int monitor_get_cpu_index(Monitor *mon)
 static void hmp_info_registers(Monitor *mon, const QDict *qdict)
 {
     bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
+    int vcpu = qdict_get_try_int(qdict, "vcpu", -1);
     CPUState *cs;
 
     if (all_cpus) {
@@ -315,13 +316,18 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
             cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
         }
     } else {
-        cs = mon_get_cpu(mon);
+        cs = vcpu >= 0 ? qemu_get_cpu(vcpu) : mon_get_cpu(mon);
 
         if (!cs) {
-            monitor_printf(mon, "No CPU available\n");
+            if (vcpu >= 0) {
+                monitor_printf(mon, "CPU#%d not available\n", vcpu);
+            } else {
+                monitor_printf(mon, "No CPU available\n");
+            }
             return;
         }
 
+        monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
         cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
     }
 }
-- 
2.20.1


