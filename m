Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E07A58750C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 03:26:51 +0200 (CEST)
Received: from localhost ([::1]:44988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIggC-00052H-GY
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 21:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oIgcv-0002BD-3D
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 21:23:17 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oIgco-00068F-As
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 21:23:13 -0400
Received: by mail-pf1-x429.google.com with SMTP id c139so12184552pfc.2
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 18:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dMEwAoov+izqB+yRtqlJs0q2KpV5RgF1bP+51bMfC6I=;
 b=BG+J82KCbXn7ED3HhRnjOlCNfP4KXhzYhJSlTcaWT0l+465+OqWfFa+b5vPap3HiUj
 dKiUj3yO+Zv4dkNgPpqgdk8t5/xA05bnagM6nOdZUvP261lQBF20I7f5hlgfB9rMsXAP
 KOYKWaXgKeXylNXVqhBsV+vrjY8Eoe8Rk+6wdHeFtHSDooDiH1Ilx9cUD0BVOhsPF4UO
 ATR2sHHYmGJQpxQJU164w43GEkAau2jVfJZNf1rp3vMczG6er2uCrItFvP7LY8YcrnK2
 LYmGH4u3VdqpZz/DLiBZz/QDzwuLLgUKnvVp2gguVu+tBJi/nXEOzDZz2nm0boxZzUQ2
 38Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dMEwAoov+izqB+yRtqlJs0q2KpV5RgF1bP+51bMfC6I=;
 b=LiNmzC7XKf9abicQJVLCECYpVpg2pPB17HruAw5B/uE7afKmqENIyEFJJdad3aRj+z
 0MjR1Fvm+IzeSu1eMaocef8oH9s+mGD+/KpzsRc8CKA15slZckCbLzaBdxFqmNBtyeIY
 gsog/SAY+Woo1ezm4F9oKXvO/Fqu9HtLxm+eRVaWh8ZlrqUVm+QLp8qVD8OPZFj0WCFw
 HS4vKIGOF4nbLjulz6aidz0vqLifs3xo1mZbhqZeb4QMQhUnLBhXIl2/rO625q37LJFD
 GNC4vo1VzPPR4boyG2E+a2SmUmBTib6jciWEDJPsbwQhdG50nbhfbNwtoGwW1MyqHJqH
 N9JQ==
X-Gm-Message-State: AJIora86xMnGbOMjcGJqCDFH1yyMB6mSgnOiicl0/GXwv14QfGlfRs86
 Lk0pzyJnF0mKLOGDb1vDFUWIlg==
X-Google-Smtp-Source: AGRyM1vlnXBeIk50LT9ja4mnYq2frD+jXZzU4otD+lcYqDYi/TtneqJwPcSeFKzeC5F+MQ3vty42Rw==
X-Received: by 2002:a05:6a00:1901:b0:4fa:fa9e:42e6 with SMTP id
 y1-20020a056a00190100b004fafa9e42e6mr18719533pfi.1.1659403389049; 
 Mon, 01 Aug 2022 18:23:09 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a63fc53000000b0040d22243295sm8289865pgk.79.2022.08.01.18.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 18:23:08 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: dgilbert@redhat.com,
	armbru@redhat.com
Cc: qemu-devel@nongnu.org, darren.kenny@oracle.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 1/1] monitor: Support specified vCPU registers
Date: Tue,  2 Aug 2022 09:17:56 +0800
Message-Id: <20220802011756.1227808-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802011756.1227808-1-pizhenwei@bytedance.com>
References: <20220802011756.1227808-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x429.google.com
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
 hmp-commands-info.hx |  8 +++++---
 monitor/misc.c       | 10 ++++++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 188d9ece3b..dee072ac37 100644
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
+        .help       = "show the cpu registers (-a: all - show register info for all cpus;"
+                      " vcpu: specific vCPU to query; show the current CPU's registers if"
+                      " no argument is specified)",
         .cmd        = hmp_info_registers,
     },
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 3d2312ba8d..74f7c4ea36 100644
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
+                monitor_printf(mon, "\nCPU#%d not available\n", vcpu);
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


