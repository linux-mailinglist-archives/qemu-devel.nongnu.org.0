Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF902D99F7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:29:54 +0100 (CET)
Received: from localhost ([::1]:33456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koorJ-0007lE-8U
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSC-0001tZ-7p
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:56 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS5-0003x2-4R
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:55 -0500
Received: by mail-oi1-x241.google.com with SMTP id s2so19254751oij.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yJVJ7UYmMW4FjJF/lEzZ9AF4DC4CJTVYJENroIAg6mE=;
 b=bN+5eSc/MwQS0xfwvOXHp5qNNqrKeiM4DfSg7c0Lv4AkiL5gjb+kzlyRnbCpU3msiJ
 L4hCx9OZDaAziZ4p/V2oIRpzaNrDr/KgZHHDnX1PCQvPnmEjMT1TdAit7oPDfAJsASgd
 0LH8ak/R9Oj/1NMTi2yFgjzCMR36zG+8PDc3m6u0AhEngwMEeMqKjvF/1VpWrHxcK7k2
 5m8eUvAMz4lAlA9kx4JunjaNSPBNOK2Z+rkmHOPS3LpVJC8WNPshT3pGvvR7hpAaYKTT
 tZzSzXQsVK4a1Kft4ElUMNZPvyM8PB3XaGuVSeJITBP/3VCdk9oyb9yH5Gr83D584Ndi
 3s8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yJVJ7UYmMW4FjJF/lEzZ9AF4DC4CJTVYJENroIAg6mE=;
 b=Sd5dV0SKixf82la0fTQDqzSSv8m267ovdelDb9T4MHf2iq34khhIb9af0HuFk+6lil
 gMpx8TEbbj/QK1IXe43ucpX9Z7XIjmHCn+6mZ/vQ/4dMv1sOp9QfmzELc6E7dD1INWY+
 07b7fCCSXwq+G2OjN+t+dO4qDqWlHkHdswWg44VCIbpdKX/RJ4apHc4aZWJZx2Rzb8yG
 Z7abRu77mYxzc4t/KujJlUQEh/QVciP2CfmUzfnm4QquHSRkn/FBeDs0Jxv7CVwOKwwY
 P2SfRTnU7hg5eXkHhd/NoEkfcG7h5CClBYOtEfJXbg9O+FkwkGjq/f8PBHy1AR8RRBNE
 YcPQ==
X-Gm-Message-State: AOAM530zkIaw1XY/FoHrAQAoNAEIfsaiXVIFD1TDbT2BKFtcMk+2prfE
 2jgqYvqmRlkLEIKOvu9FPZtF8AML/kQIvL0E
X-Google-Smtp-Source: ABdhPJyuzaJjnkHrRaaBcI4zlWFtaTwpJ1iEkZ1bcMw08DQtXSkFmQJiXlKU3lCN7F61xdG0i20/Dw==
X-Received: by 2002:aca:3151:: with SMTP id x78mr13741788oix.39.1607954626665; 
 Mon, 14 Dec 2020 06:03:46 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/43] tcg: Add --accel tcg,split-wx property
Date: Mon, 14 Dec 2020 08:02:48 -0600
Message-Id: <20201214140314.18544-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Plumb the value through to alloc_code_gen_buffer.  This is not
supported by any os or tcg backend, so for now enabling it will
result in an error.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/sysemu/tcg.h      |  3 ++-
 tcg/aarch64/tcg-target.h  |  1 +
 tcg/arm/tcg-target.h      |  1 +
 tcg/i386/tcg-target.h     |  1 +
 tcg/mips/tcg-target.h     |  1 +
 tcg/ppc/tcg-target.h      |  1 +
 tcg/riscv/tcg-target.h    |  1 +
 tcg/s390/tcg-target.h     |  1 +
 tcg/sparc/tcg-target.h    |  1 +
 tcg/tci/tcg-target.h      |  1 +
 accel/tcg/tcg-all.c       | 26 +++++++++++++++++++++++++-
 accel/tcg/translate-all.c | 35 +++++++++++++++++++++++++++--------
 bsd-user/main.c           |  2 +-
 linux-user/main.c         |  2 +-
 14 files changed, 65 insertions(+), 12 deletions(-)

diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index d9d3ca8559..00349fb18a 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -8,7 +8,8 @@
 #ifndef SYSEMU_TCG_H
 #define SYSEMU_TCG_H
 
-void tcg_exec_init(unsigned long tb_size);
+void tcg_exec_init(unsigned long tb_size, int splitwx);
+
 #ifdef CONFIG_TCG
 extern bool tcg_allowed;
 #define tcg_enabled() (tcg_allowed)
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 6ba248f447..92aefc32d3 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -154,5 +154,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 6ca4537ca6..7e04755428 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -141,5 +141,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 #endif
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 0dcaed7fe6..04eefbfb90 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -231,5 +231,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 #endif
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index d23baf7cda..d6dff897bf 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -200,6 +200,7 @@ extern bool use_mips32r2_instructions;
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index c41d10142b..8fc2672bf0 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -184,5 +184,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 #endif
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 3d0745c70c..785fe37f9b 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -170,5 +170,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
+#define TCG_TARGET_SUPPORT_MIRROR   0
 
 #endif
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 3750952598..fed3329e51 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -158,5 +158,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 #endif
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 9c15c91d39..21e7e2f56f 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -171,5 +171,6 @@ extern bool use_vis3_instructions;
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 #endif
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index fcec2e70db..768153fd02 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -197,6 +197,7 @@ void tci_disas(uint8_t opc);
 #define TCG_TARGET_DEFAULT_MO  (0)
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
                                             uintptr_t jmp_rw, uintptr_t addr)
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 1ac0b76515..2eea8c32ee 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -38,6 +38,7 @@ struct TCGState {
     AccelState parent_obj;
 
     bool mttcg_enabled;
+    int splitwx_enabled;
     unsigned long tb_size;
 };
 typedef struct TCGState TCGState;
@@ -94,6 +95,13 @@ static void tcg_accel_instance_init(Object *obj)
     TCGState *s = TCG_STATE(obj);
 
     s->mttcg_enabled = default_mttcg_enabled();
+
+    /* If debugging enabled, default "auto on", otherwise off. */
+#ifdef CONFIG_DEBUG_TCG
+    s->splitwx_enabled = -1;
+#else
+    s->splitwx_enabled = 0;
+#endif
 }
 
 bool mttcg_enabled;
@@ -102,7 +110,7 @@ static int tcg_init(MachineState *ms)
 {
     TCGState *s = TCG_STATE(current_accel());
 
-    tcg_exec_init(s->tb_size * 1024 * 1024);
+    tcg_exec_init(s->tb_size * 1024 * 1024, s->splitwx_enabled);
     mttcg_enabled = s->mttcg_enabled;
 
     /*
@@ -179,6 +187,18 @@ static void tcg_set_tb_size(Object *obj, Visitor *v,
     s->tb_size = value;
 }
 
+static bool tcg_get_splitwx(Object *obj, Error **errp)
+{
+    TCGState *s = TCG_STATE(obj);
+    return s->splitwx_enabled;
+}
+
+static void tcg_set_splitwx(Object *obj, bool value, Error **errp)
+{
+    TCGState *s = TCG_STATE(obj);
+    s->splitwx_enabled = value;
+}
+
 static void tcg_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
@@ -196,6 +216,10 @@ static void tcg_accel_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "tb-size",
         "TCG translation block cache size");
 
+    object_class_property_add_bool(oc, "split-wx",
+        tcg_get_splitwx, tcg_set_splitwx);
+    object_class_property_set_description(oc, "split-wx",
+        "Map jit pages into separate RW and RX regions");
 }
 
 static const TypeInfo tcg_accel_type = {
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 2824b3e387..a29cb4a42e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1015,13 +1015,19 @@ static inline void *split_cross_256mb(void *buf1, size_t size1)
 static uint8_t static_code_gen_buffer[DEFAULT_CODE_GEN_BUFFER_SIZE]
     __attribute__((aligned(CODE_GEN_ALIGN)));
 
-static bool alloc_code_gen_buffer(size_t tb_size, Error **errp)
+static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
 {
-    void *buf = static_code_gen_buffer;
-    void *end = static_code_gen_buffer + sizeof(static_code_gen_buffer);
+    void *buf, *end;
     size_t size;
 
+    if (splitwx > 0) {
+        error_setg(errp, "jit split-wx not supported");
+        return false;
+    }
+
     /* page-align the beginning and end of the buffer */
+    buf = static_code_gen_buffer;
+    end = static_code_gen_buffer + sizeof(static_code_gen_buffer);
     buf = QEMU_ALIGN_PTR_UP(buf, qemu_real_host_page_size);
     end = QEMU_ALIGN_PTR_DOWN(end, qemu_real_host_page_size);
 
@@ -1050,9 +1056,16 @@ static bool alloc_code_gen_buffer(size_t tb_size, Error **errp)
     return true;
 }
 #elif defined(_WIN32)
-static bool alloc_code_gen_buffer(size_t size, Error **errp)
+static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
 {
-    void *buf = VirtualAlloc(NULL, size, MEM_RESERVE | MEM_COMMIT,
+    void *buf;
+
+    if (splitwx > 0) {
+        error_setg(errp, "jit split-wx not supported");
+        return false;
+    }
+
+    buf = VirtualAlloc(NULL, size, MEM_RESERVE | MEM_COMMIT,
                              PAGE_EXECUTE_READWRITE);
     if (buf == NULL) {
         error_setg_win32(errp, GetLastError(),
@@ -1065,12 +1078,17 @@ static bool alloc_code_gen_buffer(size_t size, Error **errp)
     return true;
 }
 #else
-static bool alloc_code_gen_buffer(size_t size, Error **errp)
+static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
 {
     int prot = PROT_WRITE | PROT_READ | PROT_EXEC;
     int flags = MAP_PRIVATE | MAP_ANONYMOUS;
     void *buf;
 
+    if (splitwx > 0) {
+        error_setg(errp, "jit split-wx not supported");
+        return false;
+    }
+
     buf = mmap(NULL, size, prot, flags, -1, 0);
     if (buf == MAP_FAILED) {
         error_setg_errno(errp, errno,
@@ -1145,7 +1163,7 @@ static void tb_htable_init(void)
 /* Must be called before using the QEMU cpus. 'tb_size' is the size
    (in bytes) allocated to the translation buffer. Zero means default
    size. */
-void tcg_exec_init(unsigned long tb_size)
+void tcg_exec_init(unsigned long tb_size, int splitwx)
 {
     bool ok;
 
@@ -1154,7 +1172,8 @@ void tcg_exec_init(unsigned long tb_size)
     page_init();
     tb_htable_init();
 
-    ok = alloc_code_gen_buffer(size_code_gen_buffer(tb_size), &error_fatal);
+    ok = alloc_code_gen_buffer(size_code_gen_buffer(tb_size),
+                               splitwx, &error_fatal);
     assert(ok);
 
 #if defined(CONFIG_SOFTMMU)
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 0a918e8f74..086351fc6f 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -908,7 +908,7 @@ int main(int argc, char **argv)
     }
 
     /* init tcg before creating CPUs and to get qemu_host_page_size */
-    tcg_exec_init(0);
+    tcg_exec_init(0, false);
 
     cpu_type = parse_cpu_option(cpu_model);
     cpu = cpu_create(cpu_type);
diff --git a/linux-user/main.c b/linux-user/main.c
index 24d1eb73ad..5ff8100770 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -703,7 +703,7 @@ int main(int argc, char **argv, char **envp)
     cpu_type = parse_cpu_option(cpu_model);
 
     /* init tcg before creating CPUs and to get qemu_host_page_size */
-    tcg_exec_init(0);
+    tcg_exec_init(0, false);
 
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
-- 
2.25.1


