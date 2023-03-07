Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A136AF7B9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:32:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZesE-0004kI-MJ; Tue, 07 Mar 2023 16:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZesC-0004jd-IP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:28 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes9-0000w0-0X
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:28 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so14608wmi.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=az0WJvPDNNwX+FS1YDgiZdT4GlD39LjQSPuXXv/AFss=;
 b=X8/+OESFJ/59vp1KnCfhSQMVc4y9MfHJ1PtgU66865g0nHK5+V1HlHQWYRwvlAdvcE
 CP3sl3WusiFeZY3OxBbRItGbi6k3Q0AskfAQfRPe3QqAvorGatbKxLHuM1RIiCuINrt9
 FPCAJexAAuIlWTIf0mCZea+BZVx89Z07Suc5PxUAdC/6kw/a6bZJwqMe9v7VD042ITif
 atC4tOTXbLf5D8To5/EB3/guJ7AioWcw7XgLwP8Pffx4dUjKe4U2T4C3i/Le850+fwJq
 wvLYP3/qbHBzZwAF4QZd4WWz2y2kcFjn+p2M6Y5Zgw8VoZHFCIAMDPPz/NGPny8QSN+x
 iT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=az0WJvPDNNwX+FS1YDgiZdT4GlD39LjQSPuXXv/AFss=;
 b=ZafzawERooDi1LTUOigX3nkQ8LdEu4JrVdVCBKHCHRHlg6iyHPY9xv3uxFa1bm7w4v
 eE+sduU2KaM9Md+HuWLsSAqgVYGRuyrZ4twxIUIzsJ8sI/pTohqQ5TdDioKaZv2TDjBt
 F60T/yTxnC4bsNMI16DRRoX46xo8lI4L4SXPO5DVwNvnDiwA2IyhZOCts2+TVW2bBpa/
 fjJRHx5pXx9A5xSK9CgxG5ACJ27jSC+fuEs99Z+NCq76uMsXPv0glcVdaJQwsYhbDWxV
 BsdlY+JwbCB/fPpA9KHlPpuJRriN8DB4Fn8CpxgTM5FZNGPrV2lmHcr0PZSV05hy6yTe
 JOnQ==
X-Gm-Message-State: AO0yUKWyrE8wudnJNGksJDqLUUlooBGCpMMFeSk9B3ngupqJQjOnO9lo
 20XD8oDtnpCEd9T91DGZNZqANMxdzFlTP+Sw8mU=
X-Google-Smtp-Source: AK7set9QpGb6yzdMSpwYT/XsB7GsKcFjLK2kPKxVD0+k/OnaR1peINeXBezOS2vxvW0y/wHw2Y5H3Q==
X-Received: by 2002:a05:600c:470b:b0:3e0:98c:dd93 with SMTP id
 v11-20020a05600c470b00b003e0098cdd93mr14730509wmo.29.1678224563728; 
 Tue, 07 Mar 2023 13:29:23 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c30d300b003db06224953sm13475987wmn.41.2023.03.07.13.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:29:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 75A4D1FFDA;
 Tue,  7 Mar 2023 21:21:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Mads Ynddal <m.ynddal@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: [PULL 30/30] gdbstub: move update guest debug to accel ops
Date: Tue,  7 Mar 2023 21:21:39 +0000
Message-Id: <20230307212139.883112-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mads Ynddal <m.ynddal@samsung.com>

Continuing the refactor of a48e7d9e52 (gdbstub: move guest debug support
check to ops) by removing hardcoded kvm_enabled() from generic cpu.c
code, and replace it with a property of AccelOpsClass.

Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230207131721.49233-1-mads@ynddal.dk>
[AJB: add ifdef around update_guest_debug_ops, fix brace]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-27-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-30-richard.henderson@linaro.org>

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 30690c71bd..3c1fab4b1e 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -48,6 +48,7 @@ struct AccelOpsClass {
 
     /* gdbstub hooks */
     bool (*supports_guest_debug)(void);
+    int (*update_guest_debug)(CPUState *cpu);
     int (*insert_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
     int (*remove_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
     void (*remove_all_breakpoints)(CPUState *cpu);
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index fbf4fe3497..457eafa380 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -86,6 +86,13 @@ static bool kvm_cpus_are_resettable(void)
     return !kvm_enabled() || kvm_cpu_check_are_resettable();
 }
 
+#ifdef KVM_CAP_SET_GUEST_DEBUG
+static int kvm_update_guest_debug_ops(CPUState *cpu)
+{
+    return kvm_update_guest_debug(cpu, 0);
+}
+#endif
+
 static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -99,6 +106,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm;
 
 #ifdef KVM_CAP_SET_GUEST_DEBUG
+    ops->update_guest_debug = kvm_update_guest_debug_ops;
     ops->supports_guest_debug = kvm_supports_guest_debug;
     ops->insert_breakpoint = kvm_insert_breakpoint;
     ops->remove_breakpoint = kvm_remove_breakpoint;
diff --git a/cpu.c b/cpu.c
index e6abc6c76c..567b23af46 100644
--- a/cpu.c
+++ b/cpu.c
@@ -31,8 +31,8 @@
 #include "hw/core/sysemu-cpu-ops.h"
 #include "exec/address-spaces.h"
 #endif
+#include "sysemu/cpus.h"
 #include "sysemu/tcg.h"
-#include "sysemu/kvm.h"
 #include "exec/replay-core.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
@@ -326,9 +326,14 @@ void cpu_single_step(CPUState *cpu, int enabled)
 {
     if (cpu->singlestep_enabled != enabled) {
         cpu->singlestep_enabled = enabled;
-        if (kvm_enabled()) {
-            kvm_update_guest_debug(cpu, 0);
+
+#if !defined(CONFIG_USER_ONLY)
+        const AccelOpsClass *ops = cpus_get_accel();
+        if (ops->update_guest_debug) {
+            ops->update_guest_debug(cpu);
         }
+#endif
+
         trace_breakpoint_singlestep(cpu->cpu_index, enabled);
     }
 }
-- 
2.39.2


