Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AC26A8F92
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:01:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcx-0007dh-A3; Thu, 02 Mar 2023 21:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcv-0007cY-F8
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:33 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvct-0001pV-RB
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:33 -0500
Received: by mail-pj1-x102b.google.com with SMTP id x34so1210303pjj.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4OngDMFsl9T6YL6fMvNNNnl0dkTUWspPmNYtn7l2lDM=;
 b=M4pHKN3Nlc4yFZavIpROm06Ha2GbYlXhoFLrUNMjY/E1ThP1YzbMs6oiLmuQhT7/J+
 o1NwiwIq1IG9IISWMNMVsS0xESmFI25OoOiZwkFWQqhxOa89wQaRQZWzZtQKHGC1bX3R
 CQ+CcgK4pHg2BGJ7BZ/QzRq9JSgwJag7FZ1IhQXhShEWsPVya5obiNNNjG22BOnBNJ1O
 XVDaIGeKkFeeWw8PK9fORMrL/3/f6KVPtHmlpMb3GyTOeh/qWHESreeJZ5WN5/dNUMqE
 0VsoKNNt2K2jkY2boj8RoJTqNfNvrFKwWlHGh8SZGSS1DJtikm3leYNCXKSBE/aXw5YI
 3Ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4OngDMFsl9T6YL6fMvNNNnl0dkTUWspPmNYtn7l2lDM=;
 b=7Gerj8lPPDDEAZQgdzTpp+7zFhR3ZnQ/Ra2s5XOC/ypBY9tHzAkWkNfbIqiWnQ52GX
 l2FtV4u9N9DQZ5E00FOcJf1sNYdEJlp1jQLt7xlkqqO1eNVlMWV3WaGI4/IUL8BhXub7
 8b9j6UzmWRuD5i1AJUAHiMREmedi7LiuSTQMlqNKmGXiCrqRI5VNte/ULPFgfoXu6Qie
 GYKTJMleWMmjnD9epuW5ka7SIFSpSw8ud4BzCHtO586ShtdGl1Mev8sh3x4yAymVXnhh
 UFA9XYmzWRB9vNnvhXPodqwDahBDJAMdzyv5umsLvMv5g53NYpmkrYYvAZZQIDuajVK3
 S3CQ==
X-Gm-Message-State: AO0yUKW/90SUaD1PfNcFzNpRAxe7lqF0K3RzfFFrWAVyuJRuKqVVwdwB
 p8Rg47Stfqp+ygJrBnf0sbqacCaj1/HRYwandtc=
X-Google-Smtp-Source: AK7set8Gzk1mhWGWfszvndUlwjCOjJZdktl/m5tFeq3yRKuSi6GdTiBoZp0yIDqiIQM85fV3HeMuTQ==
X-Received: by 2002:a17:902:8688:b0:194:7a99:d5ce with SMTP id
 g8-20020a170902868800b001947a99d5cemr425332plo.12.1677812311056; 
 Thu, 02 Mar 2023 18:58:31 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Mads Ynddal <m.ynddal@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4.5 29/29] gdbstub: move update guest debug to accel ops
Date: Thu,  2 Mar 2023 18:58:05 -0800
Message-Id: <20230303025805.625589-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
---
 include/sysemu/accel-ops.h |  1 +
 accel/kvm/kvm-accel-ops.c  |  8 ++++++++
 cpu.c                      | 11 ++++++++---
 3 files changed, 17 insertions(+), 3 deletions(-)

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
2.34.1


