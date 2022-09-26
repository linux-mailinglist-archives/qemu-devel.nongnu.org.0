Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB65EA818
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:13:36 +0200 (CEST)
Received: from localhost ([::1]:38170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocorX-00070u-Cm
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKb-0002UO-CM
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:33 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKL-0005eN-3p
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:33 -0400
Received: by mail-wr1-x436.google.com with SMTP id n12so10259886wrx.9
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=vjojPbAZCZTm66THKz2INVh3tZm0jABrqXmO5V1a0wU=;
 b=wexBxmB/+F7WpA4XCpQWiP1Rrs6Z3ERduhyLAQUDh/dWQohA03uXYxPG6Sirmf1gsA
 mRuRwsEZ3/oGSgnN4R+qSi2nFzQnxNxhc4S7TeiFDRSMgjbnELMfNp5T77vQ2RRB3sZ+
 3717+FXb3fFCqUJrBTk30MyGg5QD1aZmFE3yXxBYGMk8pXtqt0n9X+DZ3vFAJO1Gy87G
 y2We++AuLr472gg0N5hdAD2+xGirI3IKqFHhJI1SM7tyfdppqbcbZoBLOJTTRz2fns76
 gjqOmDZckZupk5gkcMTWZ7LAeo0/+TSut/6buzQd9iZCWeqb7tcvYUc0VGUQzXlImroy
 7ZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vjojPbAZCZTm66THKz2INVh3tZm0jABrqXmO5V1a0wU=;
 b=gl7OjMjqdhAhJALR8QDMMEruoJfwOiM6mH4Io8NK12aKOrUsncTL/frV9OdUGwSDoe
 bXA9eqNIsunSSwd9TJ4UMQOd7OweLx5oaUIkdrqgxhJZ13sQJ8eyOW77NBU/cCrrEgRd
 1i4oPqMEMfOHPQnoAy9IFuByAgvNsDlyWUDFwK/FyqP6rYODG5MtRe/BA05qZPC5S1J5
 yL4SvRv2f7iSrtaTlV2Ulo6wAK+SvCKa4nj2YYVt6Q5J2/L07dqSz7vk+ErDwpileY1e
 kqO+twsl6nt2DQIHj1eCxoMQCBr94xn5PJ45ZHVPm44XnHValNoHPi76ulGt2VfrE8B4
 WY7g==
X-Gm-Message-State: ACrzQf3pT7Xk9HBwDU7O/gsZauNLGXf/mDICBOTKcZHRt5JO736abuF9
 6nxo9v9yXYubLWHCwakCj4HmZQ==
X-Google-Smtp-Source: AMsMyM7ssUGFVInjKfHCMVavAD1DR68ajFIpqqd/rYkJ4cXD+Vw9ape9qEWil+xk1Ln/SfnV1v/plA==
X-Received: by 2002:a5d:5259:0:b0:22c:8c3b:31f2 with SMTP id
 k25-20020a5d5259000000b0022c8c3b31f2mr9207067wrc.150.1664199555021; 
 Mon, 26 Sep 2022 06:39:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a05600c3b0a00b003b47b913901sm25520688wms.1.2022.09.26.06.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:39:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E5BE1FFC3;
 Mon, 26 Sep 2022 14:39:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: [PATCH  v2 11/11] gdbstub: move guest debug support check to ops
Date: Mon, 26 Sep 2022 14:39:04 +0100
Message-Id: <20220926133904.3297263-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926133904.3297263-1-alex.bennee@linaro.org>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This removes the final hard coding of kvm_enabled() in gdbstub and
moves the check to an AccelOps.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Mads Ynddal <mads@ynddal.dk>
---
 accel/kvm/kvm-cpus.h       | 1 +
 gdbstub/internals.h        | 1 +
 include/sysemu/accel-ops.h | 1 +
 include/sysemu/kvm.h       | 7 -------
 accel/kvm/kvm-accel-ops.c  | 1 +
 accel/kvm/kvm-all.c        | 6 ++++++
 accel/tcg/tcg-accel-ops.c  | 6 ++++++
 gdbstub/gdbstub.c          | 5 ++---
 gdbstub/softmmu.c          | 9 +++++++++
 gdbstub/user.c             | 6 ++++++
 10 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
index 33e435d62b..fd63fe6a59 100644
--- a/accel/kvm/kvm-cpus.h
+++ b/accel/kvm/kvm-cpus.h
@@ -18,6 +18,7 @@ void kvm_destroy_vcpu(CPUState *cpu);
 void kvm_cpu_synchronize_post_reset(CPUState *cpu);
 void kvm_cpu_synchronize_post_init(CPUState *cpu);
 void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu);
+bool kvm_supports_guest_debug(void);
 int kvm_insert_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len);
 int kvm_remove_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len);
 void kvm_remove_all_breakpoints(CPUState *cpu);
diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 41e2e72dbf..eabb0341d1 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -9,6 +9,7 @@
 #ifndef _INTERNALS_H_
 #define _INTERNALS_H_
 
+bool gdb_supports_guest_debug(void);
 int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
 void gdb_breakpoint_remove_all(CPUState *cs);
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 86794ac273..8cc7996def 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -47,6 +47,7 @@ struct AccelOpsClass {
     int64_t (*get_elapsed_ticks)(void);
 
     /* gdbstub hooks */
+    bool (*supports_guest_debug)(void);
     int (*insert_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwaddr len);
     int (*remove_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwaddr len);
     void (*remove_all_breakpoints)(CPUState *cpu);
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 21d3f1d01e..6e1bd01725 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -46,7 +46,6 @@ extern bool kvm_readonly_mem_allowed;
 extern bool kvm_direct_msi_allowed;
 extern bool kvm_ioeventfd_any_length_allowed;
 extern bool kvm_msi_use_devid;
-extern bool kvm_has_guest_debug;
 
 #define kvm_enabled()           (kvm_allowed)
 /**
@@ -168,11 +167,6 @@ extern bool kvm_has_guest_debug;
  */
 #define kvm_msi_devid_required() (kvm_msi_use_devid)
 
-/*
- * Does KVM support guest debugging
- */
-#define kvm_supports_guest_debug() (kvm_has_guest_debug)
-
 #else
 
 #define kvm_enabled()           (0)
@@ -190,7 +184,6 @@ extern bool kvm_has_guest_debug;
 #define kvm_direct_msi_enabled() (false)
 #define kvm_ioeventfd_any_length_enabled() (false)
 #define kvm_msi_devid_required() (false)
-#define kvm_supports_guest_debug() (false)
 
 #endif  /* CONFIG_KVM_IS_POSSIBLE */
 
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 5c0e37514c..fbf4fe3497 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -99,6 +99,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm;
 
 #ifdef KVM_CAP_SET_GUEST_DEBUG
+    ops->supports_guest_debug = kvm_supports_guest_debug;
     ops->insert_breakpoint = kvm_insert_breakpoint;
     ops->remove_breakpoint = kvm_remove_breakpoint;
     ops->remove_all_breakpoints = kvm_remove_all_breakpoints;
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index b8c734fe3a..6ebff6e5a6 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3287,6 +3287,12 @@ int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
     return data.err;
 }
 
+bool kvm_supports_guest_debug(void)
+{
+    /* probed during kvm_init() */
+    return kvm_has_guest_debug;
+}
+
 int kvm_insert_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len)
 {
     struct kvm_sw_breakpoint *bp;
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 965c2ad581..19cbf1db3a 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -93,6 +93,11 @@ void tcg_handle_interrupt(CPUState *cpu, int mask)
     }
 }
 
+static bool tcg_supports_guest_debug(void)
+{
+    return true;
+}
+
 /* Translate GDB watchpoint type to a flags value for cpu_watchpoint_* */
 static inline int xlat_gdb_type(CPUState *cpu, int gdbtype)
 {
@@ -198,6 +203,7 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
         }
     }
 
+    ops->supports_guest_debug = tcg_supports_guest_debug;
     ops->insert_breakpoint = tcg_insert_breakpoint;
     ops->remove_breakpoint = tcg_remove_breakpoint;
     ops->remove_all_breakpoints = tcg_remove_all_breakpoints;
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index ff9f3f9586..be88ca0d71 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -45,7 +45,6 @@
 
 #include "qemu/sockets.h"
 #include "sysemu/hw_accel.h"
-#include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "semihosting/semihost.h"
 #include "exec/exec-all.h"
@@ -3447,8 +3446,8 @@ int gdbserver_start(const char *device)
         return -1;
     }
 
-    if (kvm_enabled() && !kvm_supports_guest_debug()) {
-        error_report("gdbstub: KVM doesn't support guest debugging");
+    if (!gdb_supports_guest_debug()) {
+        error_report("gdbstub: current accelerator doesn't support guest debugging");
         return -1;
     }
 
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 4e73890379..f208c6cf15 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -15,6 +15,15 @@
 #include "sysemu/cpus.h"
 #include "internals.h"
 
+bool gdb_supports_guest_debug(void)
+{
+    const AccelOpsClass *ops = cpus_get_accel();
+    if (ops->supports_guest_debug) {
+        return ops->supports_guest_debug();
+    }
+    return false;
+}
+
 int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len)
 {
     const AccelOpsClass *ops = cpus_get_accel();
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 42652b28a7..033e5fdd71 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -14,6 +14,12 @@
 #include "hw/core/cpu.h"
 #include "internals.h"
 
+bool gdb_supports_guest_debug(void)
+{
+    /* user-mode == TCG == supported */
+    return true;
+}
+
 int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len)
 {
     CPUState *cpu;
-- 
2.34.1


