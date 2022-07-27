Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F9E581CE2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 03:01:25 +0200 (CEST)
Received: from localhost ([::1]:54720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGVQS-0000yn-NL
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 21:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oGVLq-0004KO-PM
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 20:56:38 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oGVLp-0004UZ-24
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 20:56:38 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x1so13062022plb.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 17:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oJtzbWnfMv8rTJc5i0inF4KBXy+GPpRhVUvn7ujv64M=;
 b=nPpwkHfbocwRxSQCowxlA/apMX2v1fDVWq/BEpM1j9tDvCoMKwxsAhbSrSw4bOD9VP
 uaQjSIp7oE33GTQ8ua82tFXGEXLJttaOGc77ydAgC0OHaIClmbLZvMI5eZkyR/RQOXDm
 xZkN3rqlp31anX0un8leLapEvSHmAMnggXsh8p5luqzWtFibT2v9B7gEE6IC44psrnYf
 /yvLxuE06T8CMJOENhmxbaw2mKsLWsx08RCWSFGQT8B5ViAzClLDLLSccGPPRSyiX9yZ
 DNSi6cc8ETaAywh+Sx0WTZBtmFYNqfEOKWKuhiK/jfZarvBZEON+3tIO6Nkxf8WV0Ym9
 /MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJtzbWnfMv8rTJc5i0inF4KBXy+GPpRhVUvn7ujv64M=;
 b=pNwnzHnH9DmVxO4W/3TaxeDEnYERXIcmhCpeBngsotj4hqwZA0nUDqCHhWnWxK3oDh
 9v7b6cGN/rRM3P/oB2TnNCWjC3MfM2wOCJ24vyiOHF4PHwwJaqhXoJUJDw64pbnkEtdm
 7b3gEZKv+L9lZ20nm65SwQ7/CdPSxzZJcQR15rf1a+dL7z/0sBuRV6yfd3ahL2pHQZqZ
 6jUeRnxd8GJiesPMJnnep54FrtvNBQh3Qc4o5lmoWldj3b5shsplEuZT6L0t7YsxxKBQ
 WZU0FpFwqCOMwsgdSMyZCbIBdKarFUYvHypWC3E5wvbuL0ZoHMeyDXUxf/VJ5fcuOcug
 badg==
X-Gm-Message-State: AJIora/ce14DZfefC/zWTZb7404DOkTp3N6xGKAoIH0vr9PDtqoVSe3k
 VsbBuSdq9CG3hd5901Q2aryXOw==
X-Google-Smtp-Source: AGRyM1uJjHDSzeXWxu0dSh/3HGacwziU5GY5ug2SygfCQHNkc3T0zGj+EBNxuyfZcI+cwJQklINBuQ==
X-Received: by 2002:a17:902:f70c:b0:16d:20ef:7e42 with SMTP id
 h12-20020a170902f70c00b0016d20ef7e42mr19148227plo.54.1658883395792; 
 Tue, 26 Jul 2022 17:56:35 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a62a201000000b005289ef6db79sm12311859pff.32.2022.07.26.17.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 17:56:34 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: dgilbert@redhat.com
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>,
 Darren Kenny <darren.kenny@oracle.com>
Subject: [PATCH v2 1/1] monitor: Support specified vCPU registers
Date: Wed, 27 Jul 2022 08:51:23 +0800
Message-Id: <20220727005123.1093478-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727005123.1093478-1-pizhenwei@bytedance.com>
References: <20220727005123.1093478-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62c.google.com
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
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hmp-commands-info.hx |  7 ++++---
 monitor/misc.c       | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 3ffa24bd67..7a00b4ded3 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -100,9 +100,10 @@ ERST
 
     {
         .name       = "registers",
-        .args_type  = "cpustate_all:-a",
-        .params     = "[-a]",
-        .help       = "show the cpu registers (-a: all - show register info for all cpus)",
+        .args_type  = "cpustate_all:-a,vcpu:i?",
+        .params     = "[-a|vcpu]",
+        .help       = "show the cpu registers (-a: all - show register info for all cpus;"
+                      " vcpu: specific vCPU to query)",
         .cmd        = hmp_info_registers,
     },
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 3d2312ba8d..8e1d4840f2 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -307,6 +307,7 @@ int monitor_get_cpu_index(Monitor *mon)
 static void hmp_info_registers(Monitor *mon, const QDict *qdict)
 {
     bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
+    int vcpu = qdict_get_try_int(qdict, "vcpu", -1);
     CPUState *cs;
 
     if (all_cpus) {
@@ -314,6 +315,23 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
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
     } else {
         cs = mon_get_cpu(mon);
 
-- 
2.20.1


