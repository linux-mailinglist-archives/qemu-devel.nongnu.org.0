Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154582EB154
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:26:22 +0100 (CET)
Received: from localhost ([::1]:45418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwq68-0000qH-Je
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0X-0002OO-0o
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:34 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0S-0006bA-Cw
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:32 -0500
Received: by mail-pf1-x42f.google.com with SMTP id x126so117676pfc.7
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WLJ+IEp8InEElHssOjuTaax0u1zPSDB8mKgJLbPbdu0=;
 b=BBUIolrnpnEVXpI9yXcBCYdi+vR2JFyhHCHVS6hEsPgmx3cuITBq+wG2h2SIkDDWqn
 zdCO0cmbqhou+tfAlE8HjVtPYJsAlB6UgH31SthAUV9/O74TIXNI5DV0+79GTlr/JSO9
 a/ln3SZ8EKyCafDSzGkyjQNdM2HR/LIPjoeAlEqglNA/sJ571uNtkjeyxwG0vr5y4JjO
 vfUnpQQYy0k+P2lCfDKOVJNdtlswXdwHLG7IDDMOQWKBaVyJYZGsorWof1DuNxLa3ceR
 HqZD0uARWAiHzkagQoNeWCUId2Ir2nOWdSOS/ilijDcQi4bYLtwO+37QEA7Pcr+m+3ym
 K17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WLJ+IEp8InEElHssOjuTaax0u1zPSDB8mKgJLbPbdu0=;
 b=V6tpTxVE+UUh4ppPI33ZW5/Nh18k5zwKTBWeLwashlIpdc5+6X0ctyzYXE6s65mbUZ
 fXURtj+s0JJ3o7ItIDZN4OBWjxTbQhtYSZIXrK9F0/wYPUrlENitcQNnBDQlgz/mizoa
 Hs551t4cLJyyIO+I7VfX13Sve2orohz/r2dZ88byirNmnOfkHV/0YtMJ9l57HClfJfHy
 TeQ9yuAZI+GdbkEdgw1TvBRKIEOQtAvt6qRPUny6YgA/iCnu/jzQlAkoyYKedq8DOm8w
 lwpFF/Vki7eJbDntNyh7Hd3QYMC4kG2nAvzxN1Vb7vjDOwL+WXZdOjLfE9qTHc7/WDvx
 aZ7w==
X-Gm-Message-State: AOAM532fIFfit2GaaDUswRXrmPeXYAVb8SVHii6PWjJjEtqBKwjyxmYY
 faJIFUVwocH11VagCy+wqxxJnrcOH99P6w==
X-Google-Smtp-Source: ABdhPJwl6PKG4TRCudvenMiPYWMdxAd7ZNQwnK40oprKAXw82BDkuePDovUJa+CjOOnAhLaWqmkiQQ==
X-Received: by 2002:a63:f010:: with SMTP id k16mr377694pgh.28.1609867226221;
 Tue, 05 Jan 2021 09:20:26 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/43] tcg: Add --accel tcg,split-wx property
Date: Tue,  5 Jan 2021 07:19:24 -1000
Message-Id: <20210105171950.415486-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
 qemu-options.hx           |  7 +++++++
 15 files changed, 72 insertions(+), 12 deletions(-)

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
index 5ec30dba25..23bf87db3d 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -155,5 +155,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 8d1fee6327..494837d128 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -142,5 +142,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 #endif
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index b693d3692d..73aa45a665 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -235,5 +235,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 #endif
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index c2c32fb38f..fbfe775fb4 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -201,6 +201,7 @@ extern bool use_mips32r2_instructions;
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index d1339afc66..ba61a31b3e 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -185,5 +185,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 #endif
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 727c8df418..6263af4dd1 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -171,5 +171,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
+#define TCG_TARGET_SUPPORT_MIRROR   0
 
 #endif
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 641464eea4..b8f4296e4b 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -159,5 +159,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 #endif
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 95ab9af955..6f6cefaa15 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -172,5 +172,6 @@ extern bool use_vis3_instructions;
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_SUPPORT_MIRROR       0
 
 #endif
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index bb784e018e..d8c78d1dc7 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -198,6 +198,7 @@ void tci_disas(uint8_t opc);
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
index 77444ddbbd..0c1801b034 100644
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
index 9c700c6234..65163e1396 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -909,7 +909,7 @@ int main(int argc, char **argv)
     }
 
     /* init tcg before creating CPUs and to get qemu_host_page_size */
-    tcg_exec_init(0);
+    tcg_exec_init(0, false);
 
     cpu_type = parse_cpu_option(cpu_model);
     cpu = cpu_create(cpu_type);
diff --git a/linux-user/main.c b/linux-user/main.c
index 750a01118f..bb4e55e8fc 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -701,7 +701,7 @@ int main(int argc, char **argv, char **envp)
     cpu_type = parse_cpu_option(cpu_model);
 
     /* init tcg before creating CPUs and to get qemu_host_page_size */
-    tcg_exec_init(0);
+    tcg_exec_init(0, false);
 
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
diff --git a/qemu-options.hx b/qemu-options.hx
index 459c916d3d..1698a0c751 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -115,6 +115,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "                igd-passthru=on|off (enable Xen integrated Intel graphics passthrough, default=off)\n"
     "                kernel-irqchip=on|off|split controls accelerated irqchip support (default=on)\n"
     "                kvm-shadow-mem=size of KVM shadow MMU in bytes\n"
+    "                split-wx=on|off (enable TCG split w^x mapping)\n"
     "                tb-size=n (TCG translation block cache size)\n"
     "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
 SRST
@@ -140,6 +141,12 @@ SRST
     ``kvm-shadow-mem=size``
         Defines the size of the KVM shadow MMU.
 
+    ``split-wx=on|off``
+        Controls the use of split w^x mapping for the TCG code generation
+        buffer. Some operating systems require this to be enabled, and in
+        such a case this will default on. On other operating systems, this
+        will default off, but one may enable this for testing or debugging.
+
     ``tb-size=n``
         Controls the size (in MiB) of the TCG translation block cache.
 
-- 
2.25.1


