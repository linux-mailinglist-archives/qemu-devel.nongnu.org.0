Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5DF6C0E63
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:12:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCTb-0003mT-SU; Mon, 20 Mar 2023 06:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTR-0003ke-94
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:42 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTP-0000CO-94
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:41 -0400
Received: by mail-wr1-x42d.google.com with SMTP id y14so9756927wrq.4
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679307037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lkGhHF/Bbg/xrVEDUpY4Rq5VsWgFg/qhGJTCVRi4OCI=;
 b=B/qIpmA+PwpepOvsnR7yA/h9x7ITqpE2H8ciuXD6XjIoWk2PHhlZU/72Y7cr/UzN43
 Xtg9SRiKnMZ38REdxOd181X9Yx1ehkiHqoqzzaba9ZRZsjyijzvslwd7wJQkqMeYJAom
 D2UX/h8V5/Nss/MZFL6dLD8uIYaG+hS9ZPGPwrfxd7Ikqibasn5df/h0SXlFlKe14/Xa
 ETLDlY1UGxRbE3D8EHtjlkPivfV/FJbFX9vZ8qsvw0Y1lgqQGXdAUwBfDkQXAVN092pz
 GkBHPdKaIiEJJXuQOT96VHFf0xHbrldejHdcYSuX9qlNnbomkRLqSYV+rrmxDuGnvsIg
 qwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lkGhHF/Bbg/xrVEDUpY4Rq5VsWgFg/qhGJTCVRi4OCI=;
 b=5c3b8hmp1F1rXPe7+pO89gkDVj2KpVMlLuQevPVooBcF8odmPlfAF+vuQXneMJMFuF
 9/Fyv81PdKOickIBrcgbV3qoCRYmHUa0OPOGTlQhbMST7kiKY7uayCADEW8JJuf5lZOF
 tOTMgEx4bKhh9vNylir6NgPh2q+Ba8z8PKFIRf2G12fq0wnqI+aKkcGD/a7hfXWfbpgC
 7PZ42+X2PCDRfJPu+YgecsR2b0gvBjMNYeSIORADZmHt2wwWbDjcY6mmVrhnpfwcv1p/
 d9Aa7uId9dqlaZlr6fL/+UUYj1/oyOnpAddGgAx7LhGYr8DsibRdGUfL6Ok/VEVAMUQU
 C3HQ==
X-Gm-Message-State: AO0yUKWd7nd2c34C/LT2xBaJI+MRq7X2AaW2SP4+INvxp0Datnr9cxF2
 PZJVMfKe1Pwttkje1eSq1gjCIbODmya5MTsF/iA=
X-Google-Smtp-Source: AK7set8gYCBBg+C7M0WqP/CHE74Ztr2wLZo6MzG6GJQJK4IUg9aoTqJQN1Oxn3kgnlWM3fiyXY/NHQ==
X-Received: by 2002:a5d:4090:0:b0:2cf:aa6e:3ade with SMTP id
 o16-20020a5d4090000000b002cfaa6e3ademr13175365wrp.15.1679307037009; 
 Mon, 20 Mar 2023 03:10:37 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a05600010c900b002c7163660a9sm8495893wrx.105.2023.03.20.03.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:10:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0BB361FFBA;
 Mon, 20 Mar 2023 10:10:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 02/10] accel/tcg: move cpu_reloading_memory_map into
 cpu-exec-softmmu
Date: Mon, 20 Mar 2023 10:10:27 +0000
Message-Id: <20230320101035.2214196-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320101035.2214196-1-alex.bennee@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

This doesn't save much as cpu-exec-common still needs to be built
per-target for its knowledge of CPUState but this helps with keeping
things organised.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cpu-exec-common.c  | 30 ----------------------
 accel/tcg/cpu-exec-softmmu.c | 50 ++++++++++++++++++++++++++++++++++++
 accel/tcg/meson.build        | 10 ++++++++
 3 files changed, 60 insertions(+), 30 deletions(-)
 create mode 100644 accel/tcg/cpu-exec-softmmu.c

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index e7962c9348..c6b0ad303e 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -32,36 +32,6 @@ void cpu_loop_exit_noexc(CPUState *cpu)
     cpu_loop_exit(cpu);
 }
 
-#if defined(CONFIG_SOFTMMU)
-void cpu_reloading_memory_map(void)
-{
-    if (qemu_in_vcpu_thread() && current_cpu->running) {
-        /* The guest can in theory prolong the RCU critical section as long
-         * as it feels like. The major problem with this is that because it
-         * can do multiple reconfigurations of the memory map within the
-         * critical section, we could potentially accumulate an unbounded
-         * collection of memory data structures awaiting reclamation.
-         *
-         * Because the only thing we're currently protecting with RCU is the
-         * memory data structures, it's sufficient to break the critical section
-         * in this callback, which we know will get called every time the
-         * memory map is rearranged.
-         *
-         * (If we add anything else in the system that uses RCU to protect
-         * its data structures, we will need to implement some other mechanism
-         * to force TCG CPUs to exit the critical section, at which point this
-         * part of this callback might become unnecessary.)
-         *
-         * This pair matches cpu_exec's rcu_read_lock()/rcu_read_unlock(), which
-         * only protects cpu->as->dispatch. Since we know our caller is about
-         * to reload it, it's safe to split the critical section.
-         */
-        rcu_read_unlock();
-        rcu_read_lock();
-    }
-}
-#endif
-
 void cpu_loop_exit(CPUState *cpu)
 {
     /* Undo the setting in cpu_tb_exec.  */
diff --git a/accel/tcg/cpu-exec-softmmu.c b/accel/tcg/cpu-exec-softmmu.c
new file mode 100644
index 0000000000..2318dd8c7d
--- /dev/null
+++ b/accel/tcg/cpu-exec-softmmu.c
@@ -0,0 +1,50 @@
+/*
+ *  Emulator main CPU execution loop, softmmu bits
+ *
+ *  Copyright (c) 2003-2005 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/core/cpu.h"
+#include "sysemu/cpus.h"
+
+void cpu_reloading_memory_map(void)
+{
+    if (qemu_in_vcpu_thread() && current_cpu->running) {
+        /* The guest can in theory prolong the RCU critical section as long
+         * as it feels like. The major problem with this is that because it
+         * can do multiple reconfigurations of the memory map within the
+         * critical section, we could potentially accumulate an unbounded
+         * collection of memory data structures awaiting reclamation.
+         *
+         * Because the only thing we're currently protecting with RCU is the
+         * memory data structures, it's sufficient to break the critical section
+         * in this callback, which we know will get called every time the
+         * memory map is rearranged.
+         *
+         * (If we add anything else in the system that uses RCU to protect
+         * its data structures, we will need to implement some other mechanism
+         * to force TCG CPUs to exit the critical section, at which point this
+         * part of this callback might become unnecessary.)
+         *
+         * This pair matches cpu_exec's rcu_read_lock()/rcu_read_unlock(), which
+         * only protects cpu->as->dispatch. Since we know our caller is about
+         * to reload it, it's safe to split the critical section.
+         */
+        rcu_read_unlock();
+        rcu_read_lock();
+    }
+}
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index aeb20a6ef0..bdc086b90d 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -1,3 +1,9 @@
+#
+# Currently most things here end up in specific_ss eventually because
+# they need knowledge of CPUState. Stuff that that doesn't can live in
+# common user, softmmu or overall code
+#
+
 tcg_ss = ss.source_set()
 tcg_ss.add(files(
   'tcg-all.c',
@@ -9,6 +15,7 @@ tcg_ss.add(files(
   'translate-all.c',
   'translator.c',
 ))
+
 tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
 tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
 tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
@@ -27,3 +34,6 @@ tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'tcg-accel-ops-icount.c',
   'tcg-accel-ops-rr.c',
 ))
+
+# Common softmmu code
+softmmu_ss.add(files('cpu-exec-softmmu.c'))
-- 
2.39.2


