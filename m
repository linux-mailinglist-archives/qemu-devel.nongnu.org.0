Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339243D40E6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:36:45 +0200 (CEST)
Received: from localhost ([::1]:32958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m70yS-0000Ke-8A
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wj-0006D1-8E
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:34:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wh-0002MX-LW
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627068895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cNXEr+T+XapNQFW5Dh4TjsXCTgxO/qnoJkHQYagRHIo=;
 b=dqIeMfk6Ob9Dj+xXiKNWMXSwVmt47oEA/3JJLhBg665yeW9AnA/NSIp/wZINZ1ZE4j67s9
 KWkbhiJRzzBHEzyl4XV9fuzkHWFpuKL8xS/xOzskw52il77R2ZccTLPMg9vzi/r7KsnOoX
 KBzzXWpv8rwItWMJf3+z53zt+P/ssko=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-LU8ejLzrP4SWbm3Oh3S7Hw-1; Fri, 23 Jul 2021 15:34:53 -0400
X-MC-Unique: LU8ejLzrP4SWbm3Oh3S7Hw-1
Received: by mail-qk1-f200.google.com with SMTP id
 k5-20020a05620a4145b02903b8eff05707so1934339qko.5
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cNXEr+T+XapNQFW5Dh4TjsXCTgxO/qnoJkHQYagRHIo=;
 b=s9aX0FnFO4djDGBdMHpebP/8q46WuxV3raLO/Wf8fDmLfQiKLm/H6XhQYBIgtO/gfv
 swdTmRqWS5p4xtphEb4h2E9Cj7EXGwHEFBImCazlgiu9jAGeOcqbfsEkBnm/cNAEW2Dx
 +S/eOlLhnhLvXejiex7wzEVhOw1woki62l8/dm8XZuuFGyfYtMYPnWhmA93beo8lb8xl
 cNctCrnV1Jkf2A8Ct2581lwDNCZWbkzhxW4+NNgU67SFO5FVcvJJeDKRjwljKr/VTqI+
 C7o7dUs/PgR0bJnBPHNpw3uOam1fg16VbCVQ1wiFjOFL+0H1SLaA5an1zNNp3r92pODE
 4hxA==
X-Gm-Message-State: AOAM530pFGBtUSZGcGiqNgnR9A5xW0Y/pKUCv7+hlonCM4xsD0Stuuhp
 TtmXzPZLj24r9gDpqau4FYsR0uKmd9WlfWWS+UjAW5cjEebN9ksNWmz4X0KLs6TV7rngeGTt4Q5
 R0VrS+ATMEeX63pNsC1PEa/Xkl3pcKkPpsFrR9db5znNyj0uZ4ILAvICaGwEtm06t
X-Received: by 2002:a05:622a:1995:: with SMTP id
 u21mr5379597qtc.77.1627068892357; 
 Fri, 23 Jul 2021 12:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVFEj+pRNDkG5aMg/y96+Jory/NmN8qzGAfjNytehFwJt4SJBOfrK1mlaJKFa4EKJbiKpQ/g==
X-Received: by 2002:a05:622a:1995:: with SMTP id
 u21mr5379579qtc.77.1627068892112; 
 Fri, 23 Jul 2021 12:34:52 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o2sm12659104qkm.109.2021.07.23.12.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:34:50 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/9] cpus: Move do_run_on_cpu into softmmu/cpus.c
Date: Fri, 23 Jul 2021 15:34:37 -0400
Message-Id: <20210723193444.133412-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723193444.133412-1-peterx@redhat.com>
References: <20210723193444.133412-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 peterx@redhat.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's only used by softmmu binaries not linux-user ones.  Make it static and
drop the definition in the header too.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 cpus-common.c         | 25 -------------------------
 include/hw/core/cpu.h | 12 ------------
 softmmu/cpus.c        | 26 ++++++++++++++++++++++++++
 3 files changed, 26 insertions(+), 37 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index d814b2439a..670826363f 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -124,31 +124,6 @@ void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi)
     qemu_cpu_kick(cpu);
 }
 
-void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
-                   QemuMutex *mutex)
-{
-    struct qemu_work_item wi;
-
-    if (qemu_cpu_is_self(cpu)) {
-        func(cpu, data);
-        return;
-    }
-
-    wi.func = func;
-    wi.data = data;
-    wi.done = false;
-    wi.free = false;
-    wi.exclusive = false;
-
-    queue_work_on_cpu(cpu, &wi);
-    while (!qatomic_mb_read(&wi.done)) {
-        CPUState *self_cpu = current_cpu;
-
-        qemu_cond_wait(&qemu_work_cond, mutex);
-        current_cpu = self_cpu;
-    }
-}
-
 void async_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
 {
     struct qemu_work_item *wi;
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index f62ae88524..711ecad62f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -689,18 +689,6 @@ void qemu_cpu_kick(CPUState *cpu);
  */
 bool cpu_is_stopped(CPUState *cpu);
 
-/**
- * do_run_on_cpu:
- * @cpu: The vCPU to run on.
- * @func: The function to be executed.
- * @data: Data to pass to the function.
- * @mutex: Mutex to release while waiting for @func to run.
- *
- * Used internally in the implementation of run_on_cpu.
- */
-void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
-                   QemuMutex *mutex);
-
 /**
  * run_on_cpu:
  * @cpu: The vCPU to run on.
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 071085f840..52adc98d39 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -382,6 +382,32 @@ void qemu_init_cpu_loop(void)
     qemu_thread_get_self(&io_thread);
 }
 
+static void
+do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
+              QemuMutex *mutex)
+{
+    struct qemu_work_item wi;
+
+    if (qemu_cpu_is_self(cpu)) {
+        func(cpu, data);
+        return;
+    }
+
+    wi.func = func;
+    wi.data = data;
+    wi.done = false;
+    wi.free = false;
+    wi.exclusive = false;
+
+    queue_work_on_cpu(cpu, &wi);
+    while (!qatomic_mb_read(&wi.done)) {
+        CPUState *self_cpu = current_cpu;
+
+        qemu_cond_wait(&qemu_work_cond, mutex);
+        current_cpu = self_cpu;
+    }
+}
+
 void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
 {
     do_run_on_cpu(cpu, func, data, &qemu_global_mutex);
-- 
2.31.1


