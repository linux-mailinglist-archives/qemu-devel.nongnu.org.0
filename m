Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D954944D29E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 08:43:41 +0100 (CET)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml4kG-000571-Lh
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 02:43:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ml4d6-0003f8-2w
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:36:16 -0500
Received: from [2a00:1450:4864:20::52e] (port=42968
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ml4d3-00079H-0d
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:36:15 -0500
Received: by mail-ed1-x52e.google.com with SMTP id v11so20689812edc.9
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 23:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c76gKdka3+70DvRFkGRLX7+gFfnrCbIIFnpyii1x3Ts=;
 b=DH88N2SoIoqMT4HxyLHhIQ/D2/QgiF+YJwCtv7Or2yvpS/tPQiszib7wZV8MEoGDz8
 zQhaSytOaI/ujpoaUK6EgWuxngO1qV1cbsIBS+Be+2M8Ut04XhPzi7T41Y/iI88ce13z
 dT1S86sAxtQvhk1WQ35nAiRucViZP1Xiyuln3jhqAv04WD5L+WE+xm+qu5pyc6V8nMG5
 zjtOxwbicAAPEEkSERVG7huNXYRjXZFhV8YMxUUFldtl3UlANmjQWs5n+XRsDT6qNC4a
 p/WYM48qgbruGI4WBF6YV8otBNpS6EQRMXzrdXVRyNz7MifPTFmhGpd91l9MZWQsjany
 DdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=c76gKdka3+70DvRFkGRLX7+gFfnrCbIIFnpyii1x3Ts=;
 b=V8pUA1VeJ6SEnjTp70Ggus9OAaTo4zBeFbI1Qc7lZvXv1lTTx0rQxhb+NJKBMYJVOC
 FR2e4tSl3uPLBo3Pt1HGlzGZFL2AHGcDLu7VCA/WSa6hoNOh4AHeZM2ZsAhiNNySSUPs
 MUrjjLJCllPpU91KfqLRKHQMXj7z+EmMd29ZKTVVA3FQAzdfTfFmJF3qPePmYHpykXGB
 QKketxGaSRDEXDFm2aUNSr7Dpl4vrAHocHhuv7fS0yQ5Zrc3ndhWSxdNYvn745kn4puC
 gzrCLvo1zEv4lWRJoddbTZb9/vU7LPXu5FbSetfdnz9mwDvkW+CkKgyuyFZB0aTw9X0t
 x/dg==
X-Gm-Message-State: AOAM532xtRGAW8obr9RZB5kDQ8GujeeKqUHsTVLSh690nxzqWg8RupRC
 3A7aiblpZRRM80YWQolJZaqLqv7Mwzo=
X-Google-Smtp-Source: ABdhPJxm32R9g2K+FEClMeQ76Omp7yKifrjnCVydffVp9SHLV8bkbyplq8eZ2iANGCwEJbJtHlu3xA==
X-Received: by 2002:a17:907:1c15:: with SMTP id
 nc21mr6765508ejc.260.1636616171195; 
 Wed, 10 Nov 2021 23:36:11 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id w1sm1062098edd.49.2021.11.10.23.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 23:36:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] accel/tcg: Register a force_rcu notifier
Date: Thu, 11 Nov 2021 08:36:05 +0100
Message-Id: <20211111073607.195697-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111073607.195697-1-pbonzini@redhat.com>
References: <20211111073607.195697-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

A TCG vCPU doing a busy loop systematicaly hangs the QEMU monitor
if the user passes 'device_add' without argument. This is because
drain_cpu_all() which is called from qmp_device_add() cannot return
if readers don't exit read-side critical sections. That is typically
what busy-looping TCG vCPUs do:

int cpu_exec(CPUState *cpu)
{
[...]
    rcu_read_lock();
[...]
    while (!cpu_handle_exception(cpu, &ret)) {
        // Busy loop keeps vCPU here
    }
[...]
    rcu_read_unlock();

    return ret;
}

For MTTCG, have all vCPU threads register a force_rcu notifier that will
kick them out of the loop using async_run_on_cpu(). The notifier is called
with the rcu_registry_lock mutex held, using async_run_on_cpu() ensures
there are no deadlocks.

For RR, a single thread runs all vCPUs. Just register a single notifier
that kicks the current vCPU to the next one.

For MTTCG:
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>

For RR:
Suggested-by: Richard Henderson <richard.henderson@linaro.org>

Fixes: 7bed89958bfb ("device_core: use drain_call_rcu in in qmp_device_add")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/650
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211109183523.47726-3-groug@kaod.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/tcg-accel-ops-mttcg.c | 26 ++++++++++++++++++++++++++
 accel/tcg/tcg-accel-ops-rr.c    | 10 ++++++++++
 2 files changed, 36 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index 847d2079d2..29632bd4c0 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -28,6 +28,7 @@
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
 #include "qemu/main-loop.h"
+#include "qemu/notify.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
 #include "hw/boards.h"
@@ -35,6 +36,26 @@
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
 
+typedef struct MttcgForceRcuNotifier {
+    Notifier notifier;
+    CPUState *cpu;
+} MttcgForceRcuNotifier;
+
+static void do_nothing(CPUState *cpu, run_on_cpu_data d)
+{
+}
+
+static void mttcg_force_rcu(Notifier *notify, void *data)
+{
+    CPUState *cpu = container_of(notify, MttcgForceRcuNotifier, notifier)->cpu;
+
+    /*
+     * Called with rcu_registry_lock held, using async_run_on_cpu() ensures
+     * that there are no deadlocks.
+     */
+    async_run_on_cpu(cpu, do_nothing, RUN_ON_CPU_NULL);
+}
+
 /*
  * In the multi-threaded case each vCPU has its own thread. The TLS
  * variable current_cpu can be used deep in the code to find the
@@ -43,12 +64,16 @@
 
 static void *mttcg_cpu_thread_fn(void *arg)
 {
+    MttcgForceRcuNotifier force_rcu;
     CPUState *cpu = arg;
 
     assert(tcg_enabled());
     g_assert(!icount_enabled());
 
     rcu_register_thread();
+    force_rcu.notifier.notify = mttcg_force_rcu;
+    force_rcu.cpu = cpu;
+    rcu_add_force_rcu_notifier(&force_rcu.notifier);
     tcg_register_thread();
 
     qemu_mutex_lock_iothread();
@@ -100,6 +125,7 @@ static void *mttcg_cpu_thread_fn(void *arg)
 
     tcg_cpus_destroy(cpu);
     qemu_mutex_unlock_iothread();
+    rcu_remove_force_rcu_notifier(&force_rcu.notifier);
     rcu_unregister_thread();
     return NULL;
 }
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index a5fd26190e..bf59f53dbc 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -28,6 +28,7 @@
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
 #include "qemu/main-loop.h"
+#include "qemu/notify.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
 
@@ -133,6 +134,11 @@ static void rr_deal_with_unplugged_cpus(void)
     }
 }
 
+static void rr_force_rcu(Notifier *notify, void *data)
+{
+    rr_kick_next_cpu();
+}
+
 /*
  * In the single-threaded case each vCPU is simulated in turn. If
  * there is more than a single vCPU we create a simple timer to kick
@@ -143,10 +149,13 @@ static void rr_deal_with_unplugged_cpus(void)
 
 static void *rr_cpu_thread_fn(void *arg)
 {
+    Notifier force_rcu;
     CPUState *cpu = arg;
 
     assert(tcg_enabled());
     rcu_register_thread();
+    force_rcu.notify = rr_force_rcu;
+    rcu_add_force_rcu_notifier(&force_rcu);
     tcg_register_thread();
 
     qemu_mutex_lock_iothread();
@@ -255,6 +264,7 @@ static void *rr_cpu_thread_fn(void *arg)
         rr_deal_with_unplugged_cpus();
     }
 
+    rcu_remove_force_rcu_notifier(&force_rcu);
     rcu_unregister_thread();
     return NULL;
 }
-- 
2.33.1



