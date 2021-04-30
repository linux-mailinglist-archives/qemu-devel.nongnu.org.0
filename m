Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26F436F3C3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:38:53 +0200 (CEST)
Received: from localhost ([::1]:35042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI7J-0002IX-0S
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlZ-0003Mr-MC
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:25 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlB-0007cU-NG
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:25 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q10so48360157pgj.2
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z0G20m3/HQxhX+4xgzOfpR38gUGqllNoyp55v0Hp1U0=;
 b=ndXqGUNR12On3KTAaclE+f5iOb60i3PFjEQ3Hj3wZO7XfrUsvZYTCtJipy4R55QWzr
 xV1MmNXLPsTKu9DOlK0D1udAH4qsxiDme3VBIgR1PRhj6ObPpmJmF4ZF4LgNQFXmDNJv
 cKBPErC6Sase3HkGenZEJkQpmXrL1h67PxmFqzUzZ6RbaSeE2ckwItvUUm2TbuEKvR50
 St4g3+xAXsHplPniO45D0S2i8TboNPqw1wqt0etMHU6/R+wT+sym/QJ4r8sgCV2ajte/
 YIcqRbqX4FJMNTZGgYw8C6EuwxzLmmtF35Ad+tLJTaiO1YWhk1mGzoWwzEXml5To9lIK
 NWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z0G20m3/HQxhX+4xgzOfpR38gUGqllNoyp55v0Hp1U0=;
 b=CuUDX30cDAkrmreV3NEx9kNqToR8cQk5i3V4djKngTMK5WZ1IRgACx1akXQ9KwXwYh
 koJMXw8uV5QiHgjZ+LyRCjPgiOHMsx5SBlLZawo0MzF9fEVeTVKrjEd7Zq8ysGye9RTU
 DyPjv2bgzVTjW6P0lvTO+lxTrfhGzvUaXXirG/m4E0/Pe1WSO/UjpNzvLpiT3eXd8ugy
 Gni8oV3kcLQ4asZXFm5P7fpTZJ9XsKyI+evIO6CrsDh9VVzlgV+RZHFVK593EBzdDz6S
 YP3Sru/VXZ6nIExCgrBoOaXKNbdz23osnHmfyzfIwBBHi6LWu2lzRPnfpsBD3dPeFhJR
 Q2aQ==
X-Gm-Message-State: AOAM533Nr5x4MAUV3nnfKScOxsE16XSv3lq/yS3jxBci5gwn/D6sLZg+
 l4AtXvUbt4Hbyya0HyGpx3IKZnqFJW+NpQ==
X-Google-Smtp-Source: ABdhPJxhNsQgsBiGUcT5IGhE42C12wCDeRkmauWlMm4achlH2aAy9Dq87Xd23xlqyL94+9m6hsynvg==
X-Received: by 2002:a63:6486:: with SMTP id y128mr2294576pgb.414.1619745360220; 
 Thu, 29 Apr 2021 18:16:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/30] target/ppc: Add infrastructure for prefixed insns
Date: Thu, 29 Apr 2021 18:15:36 -0700
Message-Id: <20210430011543.1017113-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Move page crossing check to its own patch,
    fold in ISA310 check to is_prefix_insn
---
 target/ppc/cpu.h                           |  1 +
 target/ppc/insn32.decode                   | 18 ++++++++++++
 target/ppc/insn64.decode                   | 18 ++++++++++++
 target/ppc/translate.c                     | 34 +++++++++++++++++++---
 target/ppc/translate/fixedpoint-impl.c.inc | 18 ++++++++++++
 target/ppc/meson.build                     |  9 ++++++
 6 files changed, 94 insertions(+), 4 deletions(-)
 create mode 100644 target/ppc/insn32.decode
 create mode 100644 target/ppc/insn64.decode
 create mode 100644 target/ppc/translate/fixedpoint-impl.c.inc

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 5b22eb64dc..82a2bf1e58 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -144,6 +144,7 @@ enum {
     POWERPC_EXCP_ALIGN_PROT    = 0x04,  /* Access cross protection boundary  */
     POWERPC_EXCP_ALIGN_BAT     = 0x05,  /* Access cross a BAT/seg boundary   */
     POWERPC_EXCP_ALIGN_CACHE   = 0x06,  /* Impossible dcbz access            */
+    POWERPC_EXCP_ALIGN_INSN    = 0x07,  /* Pref. insn x-ing 64-byte boundary */
     /* Exception subtypes for POWERPC_EXCP_PROGRAM                           */
     /* FP exceptions                                                         */
     POWERPC_EXCP_FP            = 0x10,
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
new file mode 100644
index 0000000000..b175441209
--- /dev/null
+++ b/target/ppc/insn32.decode
@@ -0,0 +1,18 @@
+#
+# Power ISA decode for 32-bit insns (opcode space 0)
+#
+# Copyright (c) 2021 Luis Pires <luis.pires@eldorado.org.br>
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+#
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
new file mode 100644
index 0000000000..9fc45d0614
--- /dev/null
+++ b/target/ppc/insn64.decode
@@ -0,0 +1,18 @@
+#
+# Power ISA decode for 64-bit prefixed insns (opcode space 0 and 1)
+#
+# Copyright (c) 2021 Luis Pires <luis.pires@eldorado.org.br>
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+#
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index cde12e9d38..65848463ea 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6902,6 +6902,10 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
 # define REQUIRE_64BIT(CTX)  REQUIRE_INSNS_FLAGS(CTX, 64B)
 #endif
 
+#include "decode-insn32.c.inc"
+#include "decode-insn64.c.inc"
+#include "translate/fixedpoint-impl.c.inc"
+
 #include "translate/fp-impl.c.inc"
 
 #include "translate/vmx-impl.c.inc"
@@ -8047,11 +8051,18 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
     return true;
 }
 
+static bool is_prefix_insn(DisasContext *ctx, uint32_t insn)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    return opc1(insn) == 1;
+}
+
 static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = cs->env_ptr;
+    target_ulong pc;
     uint32_t insn;
     bool ok;
 
@@ -8059,11 +8070,26 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     LOG_DISAS("nip=" TARGET_FMT_lx " super=%d ir=%d\n",
               ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
 
-    ctx->cia = ctx->base.pc_next;
-    insn = translator_ldl_swap(env, ctx->base.pc_next, need_byteswap(ctx));
-    ctx->base.pc_next += 4;
+    ctx->cia = pc = ctx->base.pc_next;
+    insn = translator_ldl_swap(env, pc, need_byteswap(ctx));
+    ctx->base.pc_next = pc += 4;
 
-    ok = decode_legacy(cpu, ctx, insn);
+    if (!is_prefix_insn(ctx, insn)) {
+        ok = (decode_insn32(ctx, insn) ||
+              decode_legacy(cpu, ctx, insn));
+    } else if ((pc & 63) == 0) {
+        /*
+         * Power v3.1, section 1.9 Exceptions:
+         * attempt to execute a prefixed instruction that crosses a
+         * 64-byte address boundary (system alignment error).
+         */
+        gen_exception_err(ctx, POWERPC_EXCP_ALIGN, POWERPC_EXCP_ALIGN_INSN);
+        ok = true;
+    } else {
+        uint32_t insn2 = translator_ldl_swap(env, pc, need_byteswap(ctx));
+        ctx->base.pc_next = pc += 4;
+        ok = decode_insn64(ctx, deposit64(insn2, 32, 32, insn));
+    }
     if (!ok) {
         gen_invalid(ctx);
     }
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
new file mode 100644
index 0000000000..b740083605
--- /dev/null
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -0,0 +1,18 @@
+/*
+ * Power ISA decode for Fixed-Point Facility instructions
+ *
+ * Copyright (c) 2021 Luis Pires <luis.pires@eldorado.org.br>
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
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index bbfef90e08..e604e56c6a 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -15,6 +15,15 @@ ppc_ss.add(files(
 
 ppc_ss.add(libdecnumber)
 
+gen = [
+  decodetree.process('insn32.decode',
+                     extra_args: '--static-decode=decode_insn32'),
+  decodetree.process('insn64.decode',
+                     extra_args: ['--static-decode=decode_insn64',
+                                  '--insnwidth=64']),
+]
+ppc_ss.add(gen)
+
 ppc_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 ppc_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user_only_helper.c'))
 
-- 
2.25.1


