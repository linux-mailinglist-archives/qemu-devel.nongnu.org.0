Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2C939A5DB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:38:18 +0200 (CEST)
Received: from localhost ([::1]:34180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqML-0005Tj-IJ
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl6-0001sy-LA
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:48 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl4-0007IL-KQ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:48 -0400
Received: by mail-wr1-x435.google.com with SMTP id l2so6391937wrw.6
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qtE21tz0j/XuMTe0sitQ70UbPqN5imUOWXQe5LhVK1Q=;
 b=ZHGerY4o50xyISuWhrJ3KszUJudtYUf2KA3+ncS9sh0C/RMEMqTtgZ/ZsqEIwutNPx
 3VrJB+SJlkSeNqwt9ih7jw5htumcCWOxeSDstsq1hvIC4hpxKNRbIQwpXC/0TuEdQFBB
 wTkOut0QDOWt+9nOyhIO0PExz+K2qJg/ZXA2JU+341seDoiqF4+FlZqwiHk3ydb7IcA6
 ouTN/Z6jtktS8oNJS/kQNnsOCP6Y04ggavgcJyIejAJz202T6Q0yKCO32dZAOhu1YfKY
 d04gMIiM2TRrmiHm+/CT6+XEPMzJC2K4WNgLbUo1tpfimKlZ/EqA0Jj1iGgFMSG7azWa
 NSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qtE21tz0j/XuMTe0sitQ70UbPqN5imUOWXQe5LhVK1Q=;
 b=Fv35mYTt2gukuQquflS6zJn3ElFLIYfjB8X9SOG+PhF0IBCSgB3ia9D2NPPnirvnRf
 htP3o7lq4asAVaY7xLQYrGyqFqKRPv1voFJZd3Nbvu38USU20dUTTK8BQFv+TZtqlX73
 cYrFlstxwU6RdXA0e0Z6s1xUiBDexZU9dpMyJo3G4HZNdSo38jQw0Eo5kCvlckZO+h4Z
 sTADXyYsCgU1MH00K6aoM5wcYnvwLpnUBSnkBHgrEkyAqHGLTBvogT0ZEk199coj+NyI
 PMhLZzixGEgxP6u+2lQPgHFJcjS7nmAUXmX/6x3SYRBMngqpmOcnKXnixNqwqzvygTE1
 tq0Q==
X-Gm-Message-State: AOAM532dGYSXKnIf3UQ/8ptBeN/9e0YJfjr4pn3fBqIrGghzaeG5QfNp
 oD1NsUCDUfebf4ByqAwazHjpG7pW5PUeLu3R
X-Google-Smtp-Source: ABdhPJztqYPIn2V3gU20o4i7QvXWF8Fwka3PmSqTRDtoY/Y8ZmlJ4R/XtV4c7DROQ9gp4iHLDU6crg==
X-Received: by 2002:a5d:4dc2:: with SMTP id f2mr682293wru.124.1622735985352;
 Thu, 03 Jun 2021 08:59:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/45] hvf: Simplify post reset/init/loadvm hooks
Date: Thu,  3 Jun 2021 16:58:58 +0100
Message-Id: <20210603155904.26021-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

The hooks we have that call us after reset, init and loadvm really all
just want to say "The reference of all register state is in the QEMU
vcpu struct, please push it".

We already have a working pushing mechanism though called cpu->vcpu_dirty,
so we can just reuse that for all of the above, syncing state properly the
next time we actually execute a vCPU.

This fixes PSCI resets on ARM, as they modify CPU state even after the
post init call has completed, but before we execute the vCPU again.

To also make the scheme work for x86, we have to make sure we don't
move stale eflags into our env when the vcpu state is dirty.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20210519202253.76782-13-agraf@csgraf.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/hvf/hvf-accel-ops.c | 27 +++++++--------------------
 target/i386/hvf/x86hvf.c  |  5 ++++-
 2 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index ded918c443d..d1691be9896 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -205,39 +205,26 @@ static void hvf_cpu_synchronize_state(CPUState *cpu)
     }
 }
 
-static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
-                                              run_on_cpu_data arg)
+static void do_hvf_cpu_synchronize_set_dirty(CPUState *cpu,
+                                             run_on_cpu_data arg)
 {
-    hvf_put_registers(cpu);
-    cpu->vcpu_dirty = false;
+    /* QEMU state is the reference, push it to HVF now and on next entry */
+    cpu->vcpu_dirty = true;
 }
 
 static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
 {
-    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
-}
-
-static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
-                                             run_on_cpu_data arg)
-{
-    hvf_put_registers(cpu);
-    cpu->vcpu_dirty = false;
+    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
 
 static void hvf_cpu_synchronize_post_init(CPUState *cpu)
 {
-    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
-}
-
-static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
-                                              run_on_cpu_data arg)
-{
-    cpu->vcpu_dirty = true;
+    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
 
 static void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
 {
-    run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
+    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
 
 static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 28cfee4f608..2ced2c24784 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -433,7 +433,10 @@ int hvf_process_events(CPUState *cpu_state)
     X86CPU *cpu = X86_CPU(cpu_state);
     CPUX86State *env = &cpu->env;
 
-    env->eflags = rreg(cpu_state->hvf->fd, HV_X86_RFLAGS);
+    if (!cpu_state->vcpu_dirty) {
+        /* light weight sync for CPU_INTERRUPT_HARD and IF_MASK */
+        env->eflags = rreg(cpu_state->hvf->fd, HV_X86_RFLAGS);
+    }
 
     if (cpu_state->interrupt_request & CPU_INTERRUPT_INIT) {
         cpu_synchronize_state(cpu_state);
-- 
2.20.1


