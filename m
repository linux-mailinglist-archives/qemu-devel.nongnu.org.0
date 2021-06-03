Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6527D39A591
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:15:29 +0200 (CEST)
Received: from localhost ([::1]:40388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loq0G-0007mC-8W
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl3-0001e3-42
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:45 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl1-0007GK-8H
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:44 -0400
Received: by mail-wr1-x429.google.com with SMTP id u7so939724wrs.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kjTsF2ypUW0HZAIutISGi0AwlU/2vgJVMA90PMqCH8M=;
 b=etxw9GArWuanxZ9gkNfuUJuhHJoXKiL3UR8zf2bHfnWlnZmpeMQmmAFkku8GlFHY9J
 A6bCtbfYHG5qvFgT7RE+wDkevSmv/Ht7v35pRsOZWLbUasI0h7yVOwFMe8lM3Dt8WiMY
 Jl0R2tlIb6H5PSfUMFe3W929AU7H/2XxUuh9Dy+g5Wg8sHdVZD7G+TM25/ZpO+EOgbEV
 o9fI765EYhvkI3KeBa8VHeEoldGjTYgL7il3cX7F7BC93T33yn/xtSm5UrN/UsaabRux
 yPP5bDinBfAoTEUllp8iEX/YdZ1fhnQUhf9P0UHhYMKNKl0+ytIxRN0R4ZH57cyWop4c
 WkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kjTsF2ypUW0HZAIutISGi0AwlU/2vgJVMA90PMqCH8M=;
 b=S27ro/wjEOhmrB4u/F7q2R6T3gVOqTpJecIx1Xx0gHX4Yr8V6E6s513R2g1bCUBEbn
 6pkeHDN3JqB5vyxR8MAW7H2A8wuUjpeOd09pFj7g5aBBR/E0sQbUJ+eY6KwhZv7l8BRl
 rVOb5Gd5pSOTTvls+Ho6Ff+XZWnjyaonbUJgTevOt7EQTpxO1QR7RkJPfZmopkmM5IkT
 njOLfkq2aibZiBDHKov3Cc+PqSYhd/j/jDlKjHsmxVyQl9QMbp7HgWllfMi+D+VBiJyG
 HE7kzStCmjgEiHsxKfMEL2ndXooef51wW5S9So7b9ptHMqVJzzyuSLq+Rnqzx0x991/t
 gHrg==
X-Gm-Message-State: AOAM530UpfQr9FyaLD69Tecd59E3MlhXU+JJRV91+YYdMBdBHuK85o5p
 +w0xWccl6XpbV/qJ2BCUu7m27Y7fn4rc8+63
X-Google-Smtp-Source: ABdhPJwKuSFpoHG6nxNbdPk6OU+pQYMnelvEtQGYp9+0OhRXrHRvg1t9gJPL2O27+p6A7ThSICibiQ==
X-Received: by 2002:adf:e401:: with SMTP id g1mr600272wrm.415.1622735981892;
 Thu, 03 Jun 2021 08:59:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/45] hvf: Use cpu_synchronize_state()
Date: Thu,  3 Jun 2021 16:58:54 +0100
Message-Id: <20210603155904.26021-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

There is no reason to call the hvf specific hvf_cpu_synchronize_state()
when we can just use the generic cpu_synchronize_state() instead. This
allows us to have less dependency on internal function definitions and
allows us to make hvf_cpu_synchronize_state() static.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20210519202253.76782-9-agraf@csgraf.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/hvf/hvf-accel-ops.h | 1 -
 accel/hvf/hvf-accel-ops.c | 2 +-
 target/i386/hvf/x86hvf.c  | 9 ++++-----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.h b/accel/hvf/hvf-accel-ops.h
index 09fcf220676..f6192b56f0c 100644
--- a/accel/hvf/hvf-accel-ops.h
+++ b/accel/hvf/hvf-accel-ops.h
@@ -13,7 +13,6 @@
 #include "sysemu/cpus.h"
 
 int hvf_vcpu_exec(CPUState *);
-void hvf_cpu_synchronize_state(CPUState *);
 void hvf_cpu_synchronize_post_reset(CPUState *);
 void hvf_cpu_synchronize_post_init(CPUState *);
 void hvf_cpu_synchronize_pre_loadvm(CPUState *);
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index b262efd8b6c..3b599ac57ce 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -200,7 +200,7 @@ static void do_hvf_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
     }
 }
 
-void hvf_cpu_synchronize_state(CPUState *cpu)
+static void hvf_cpu_synchronize_state(CPUState *cpu)
 {
     if (!cpu->vcpu_dirty) {
         run_on_cpu(cpu, do_hvf_cpu_synchronize_state, RUN_ON_CPU_NULL);
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 2b99f3eaa2d..cc381307ab9 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -26,14 +26,13 @@
 #include "cpu.h"
 #include "x86_descr.h"
 #include "x86_decode.h"
+#include "sysemu/hw_accel.h"
 
 #include "hw/i386/apic_internal.h"
 
 #include <Hypervisor/hv.h>
 #include <Hypervisor/hv_vmx.h>
 
-#include "accel/hvf/hvf-accel-ops.h"
-
 void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr)
 {
@@ -437,7 +436,7 @@ int hvf_process_events(CPUState *cpu_state)
     env->eflags = rreg(cpu_state->hvf_fd, HV_X86_RFLAGS);
 
     if (cpu_state->interrupt_request & CPU_INTERRUPT_INIT) {
-        hvf_cpu_synchronize_state(cpu_state);
+        cpu_synchronize_state(cpu_state);
         do_cpu_init(cpu);
     }
 
@@ -451,12 +450,12 @@ int hvf_process_events(CPUState *cpu_state)
         cpu_state->halted = 0;
     }
     if (cpu_state->interrupt_request & CPU_INTERRUPT_SIPI) {
-        hvf_cpu_synchronize_state(cpu_state);
+        cpu_synchronize_state(cpu_state);
         do_cpu_sipi(cpu);
     }
     if (cpu_state->interrupt_request & CPU_INTERRUPT_TPR) {
         cpu_state->interrupt_request &= ~CPU_INTERRUPT_TPR;
-        hvf_cpu_synchronize_state(cpu_state);
+        cpu_synchronize_state(cpu_state);
         apic_handle_tpr_access_report(cpu->apic_state, env->eip,
                                       env->tpr_access_type);
     }
-- 
2.20.1


