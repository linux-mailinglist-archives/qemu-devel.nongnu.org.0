Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51D32996CC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 20:27:19 +0100 (CET)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX89G-0001Z3-R3
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 15:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kX7yD-0000H6-6x
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 15:15:53 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kX7yB-00086t-Bp
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 15:15:52 -0400
Received: by mail-pf1-f193.google.com with SMTP id e7so6712238pfn.12
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 12:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ShohVanwwwo/2Cgw66CfEDjmU4zemsdfuOcMfMgnMA=;
 b=JOCQiDlnVAtEySRibVRgRkCHPAULmg57xAudMCdU+z1Q5wxmIT9psgdAEaMYqTbvRo
 Y3Icz+BsPGq3YFucyd0N2v+fkWy8CK9mMw2YNWGvro71UYwZ1ejJT4v2Ns9O8iJSV23Z
 y1WqO+wcWXzVFiK2M4w1y033qafPTJD7xmIAhvm8UOqCkY1QQWVybUu7mOvv7L+aE10G
 9Dbvfb3f7sou0J6TLJN1bilHpQ5FGal/4gPwb6NA6mwiLr7hj6KDicV5Re2buUyE18xF
 cSWNfCMq5ZLsG/FIEE1GWwxfN9sTbQcqyLGR5uSO6PJwK/GzPK60Ilcl/Y1eAtDZW7TS
 gQDg==
X-Gm-Message-State: AOAM533uWlmIPRHKDkoGN7lGVLvSpzUfSSaYY7Jh/xj7zunkbZcQMAKc
 j5yx5An+EisL2SoQNYzUaBiA7dlv/so=
X-Google-Smtp-Source: ABdhPJx9xR2CyH1V/GgA79rUpiFu9uuGX3e1wcaXHpxwvMAZGMkK8DTTBdq8W8Q8izvJQHrRd/CxdQ==
X-Received: by 2002:a63:f40a:: with SMTP id g10mr15604642pgi.66.1603739749191; 
 Mon, 26 Oct 2020 12:15:49 -0700 (PDT)
Received: from localhost.localdomain ([73.93.153.41])
 by smtp.gmail.com with ESMTPSA id gb13sm10233191pjb.55.2020.10.26.12.15.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Oct 2020 12:15:48 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 4/4] tcg: make mirror mapped JIT optional
Date: Mon, 26 Oct 2020 12:15:40 -0700
Message-Id: <20201026191540.12434-5-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026191540.12434-1-j@getutm.app>
References: <20201026191540.12434-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.193;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f193.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 15:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Joelle van Dyne <j@getutm.app>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On platforms that support mirror mapping, give the user the option to
disable it. There is a performance penalty for mirror JIT and on some
platforms, system security must be downgraded to use QEMU with mirror JIT
turned off.

To aid in testing, we still enable mirror JIT by default when configured
with --enable-debug-tcg.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 include/sysemu/tcg.h      |  2 +-
 accel/tcg/tcg-all.c       | 31 ++++++++++++++++++++-
 accel/tcg/translate-all.c | 57 ++++++++++++++++++++++++++-------------
 bsd-user/main.c           |  2 +-
 linux-user/main.c         |  2 +-
 qemu-options.hx           | 11 ++++++++
 6 files changed, 82 insertions(+), 23 deletions(-)

diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index d9d3ca8559..569f90b11d 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -8,7 +8,7 @@
 #ifndef SYSEMU_TCG_H
 #define SYSEMU_TCG_H
 
-void tcg_exec_init(unsigned long tb_size);
+void tcg_exec_init(unsigned long tb_size, bool mirror_rwx);
 #ifdef CONFIG_TCG
 extern bool tcg_allowed;
 #define tcg_enabled() (tcg_allowed)
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index fa1208158f..52fccd9097 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -39,6 +39,7 @@ struct TCGState {
 
     bool mttcg_enabled;
     unsigned long tb_size;
+    bool mirror_jit;
 };
 typedef struct TCGState TCGState;
 
@@ -94,6 +95,11 @@ static void tcg_accel_instance_init(Object *obj)
     TCGState *s = TCG_STATE(obj);
 
     s->mttcg_enabled = default_mttcg_enabled();
+#if defined(CONFIG_MIRROR_JIT) && defined(CONFIG_DEBUG_TCG)
+    s->mirror_jit = true;
+#else
+    s->mirror_jit = false;
+#endif
 }
 
 bool mttcg_enabled;
@@ -102,7 +108,7 @@ static int tcg_init(MachineState *ms)
 {
     TCGState *s = TCG_STATE(current_accel());
 
-    tcg_exec_init(s->tb_size * 1024 * 1024);
+    tcg_exec_init(s->tb_size * 1024 * 1024, s->mirror_jit);
     mttcg_enabled = s->mttcg_enabled;
     cpus_register_accel(&tcg_cpus);
 
@@ -168,6 +174,22 @@ static void tcg_set_tb_size(Object *obj, Visitor *v,
     s->tb_size = value;
 }
 
+#ifdef CONFIG_MIRROR_JIT
+static bool tcg_get_mirror_jit(Object *obj, Error **errp)
+{
+    TCGState *s = TCG_STATE(obj);
+
+    return s->mirror_jit;
+}
+
+static void tcg_set_mirror_jit(Object *obj, bool value, Error **errp)
+{
+    TCGState *s = TCG_STATE(obj);
+
+    s->mirror_jit = value;
+}
+#endif
+
 static void tcg_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
@@ -185,6 +207,13 @@ static void tcg_accel_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "tb-size",
         "TCG translation block cache size");
 
+#ifdef CONFIG_MIRROR_JIT
+    object_class_property_add_bool(oc, "mirror-jit",
+        tcg_get_mirror_jit, tcg_set_mirror_jit);
+    object_class_property_set_description(oc, "mirror-jit",
+        "JIT pages mapped into separate RW and RX regions");
+#endif
+
 }
 
 static const TypeInfo tcg_accel_type = {
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bfb856ac1a..2144433024 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1027,12 +1027,15 @@ static inline void *split_cross_256mb(void *buf1, size_t size1)
 static uint8_t static_code_gen_buffer[DEFAULT_CODE_GEN_BUFFER_SIZE]
     __attribute__((aligned(CODE_GEN_ALIGN)));
 
-static inline void *alloc_code_gen_buffer(void)
+static inline void *alloc_code_gen_buffer(bool mirror_jit)
 {
     void *buf = static_code_gen_buffer;
     void *end = static_code_gen_buffer + sizeof(static_code_gen_buffer);
     size_t size;
 
+    /* not applicable */
+    assert(!mirror_jit);
+
     /* page-align the beginning and end of the buffer */
     buf = QEMU_ALIGN_PTR_UP(buf, qemu_real_host_page_size);
     end = QEMU_ALIGN_PTR_DOWN(end, qemu_real_host_page_size);
@@ -1061,14 +1064,15 @@ static inline void *alloc_code_gen_buffer(void)
     return buf;
 }
 #elif defined(_WIN32)
-static inline void *alloc_code_gen_buffer(void)
+static inline void *alloc_code_gen_buffer(bool mirror_jit)
 {
     size_t size = tcg_ctx->code_gen_buffer_size;
+    assert(!mirror_jit); /* not applicable */
     return VirtualAlloc(NULL, size, MEM_RESERVE | MEM_COMMIT,
                         PAGE_EXECUTE_READWRITE);
 }
 #else
-static inline void *alloc_code_gen_buffer(void)
+static inline void *alloc_code_gen_buffer(bool mirror_jit)
 {
     int prot = PROT_READ | PROT_EXEC;
     int flags = 0;
@@ -1078,16 +1082,22 @@ static inline void *alloc_code_gen_buffer(void)
 
 #if defined(CONFIG_MIRROR_JIT)
 #if defined(CONFIG_LINUX)
-    fd = qemu_memfd_create("tcg-jit", size, false, 0, 0, NULL);
-    if (fd < 0) {
-        return NULL;
+    if (mirror_jit) {
+        fd = qemu_memfd_create("tcg-jit", size, false, 0, 0, NULL);
+        if (fd < 0) {
+            return NULL;
+        }
+        tcg_ctx->code_gen_buffer_fd = fd;
+        flags |= MAP_SHARED;
+    } else {
+        prot |= PROT_WRITE;
+        flags |= MAP_ANONYMOUS | MAP_PRIVATE;
     }
-    tcg_ctx->code_gen_buffer_fd = fd;
-    flags |= MAP_SHARED;
 #else /* defined(CONFIG_LINUX) */
 #error "Mirror JIT unimplemented for this platform."
 #endif /* defined(CONFIG_LINUX) */
 #else /* defined(CONFIG_MIRROR_JIT) */
+    assert(!mirror_jit);
     prot |= PROT_WRITE;
     flags |= MAP_ANONYMOUS | MAP_PRIVATE;
 #endif /* defined(CONFIG_MIRROR_JIT) */
@@ -1162,7 +1172,7 @@ static inline void *alloc_jit_rw_mirror(void)
 static inline void code_gen_alloc(size_t tb_size, bool mirror_jit)
 {
     tcg_ctx->code_gen_buffer_size = size_code_gen_buffer(tb_size);
-    tcg_ctx->code_gen_buffer = alloc_code_gen_buffer();
+    tcg_ctx->code_gen_buffer = alloc_code_gen_buffer(mirror_jit);
     if (tcg_ctx->code_gen_buffer == NULL) {
         fprintf(stderr, "Could not allocate dynamic translator buffer\n");
         exit(1);
@@ -1170,13 +1180,20 @@ static inline void code_gen_alloc(size_t tb_size, bool mirror_jit)
 #if defined(CONFIG_MIRROR_JIT)
     void *mirror;
 
-    /* For platforms that need a mirror mapping for code execution */
-    mirror = alloc_jit_rw_mirror();
-    if (mirror == NULL) {
-        fprintf(stderr, "Could not remap code buffer mirror\n");
-        exit(1);
+    if (mirror_jit) {
+        /* For platforms that need a mirror mapping for code execution */
+        mirror = alloc_jit_rw_mirror();
+        if (mirror == NULL) {
+            fprintf(stderr, "Could not remap code buffer mirror\n");
+            exit(1);
+        }
+    } else {
+        /* If we disable mirror mapping run option */
+        mirror = tcg_ctx->code_gen_buffer;
     }
     tcg_ctx->code_rw_mirror_diff = mirror - tcg_ctx->code_gen_buffer;
+#else
+    assert(!mirror_jit);
 #endif /* CONFIG_MIRROR_JIT */
 }
 
@@ -1201,16 +1218,18 @@ static void tb_htable_init(void)
     qht_init(&tb_ctx.htable, tb_cmp, CODE_GEN_HTABLE_SIZE, mode);
 }
 
-/* Must be called before using the QEMU cpus. 'tb_size' is the size
-   (in bytes) allocated to the translation buffer. Zero means default
-   size. */
-void tcg_exec_init(unsigned long tb_size)
+/*
+ * Must be called before using the QEMU cpus. 'tb_size' is the size
+ * (in bytes) allocated to the translation buffer. Zero means default
+ * size. mirror_jit separates RX and RW allocations.
+ */
+void tcg_exec_init(unsigned long tb_size, bool mirror_jit)
 {
     tcg_allowed = true;
     cpu_gen_init();
     page_init();
     tb_htable_init();
-    code_gen_alloc(tb_size);
+    code_gen_alloc(tb_size, mirror_jit);
 #if defined(CONFIG_SOFTMMU)
     /* There's no guest base to take into account, so go ahead and
        initialize the prologue now.  */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index ac40d79bfa..ffd4888a26 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -910,7 +910,7 @@ int main(int argc, char **argv)
     }
 
     /* init tcg before creating CPUs and to get qemu_host_page_size */
-    tcg_exec_init(0);
+    tcg_exec_init(0, false);
 
     cpu_type = parse_cpu_option(cpu_model);
     cpu = cpu_create(cpu_type);
diff --git a/linux-user/main.c b/linux-user/main.c
index 75c9785157..3856b2611d 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -705,7 +705,7 @@ int main(int argc, char **argv, char **envp)
     cpu_type = parse_cpu_option(cpu_model);
 
     /* init tcg before creating CPUs and to get qemu_host_page_size */
-    tcg_exec_init(0);
+    tcg_exec_init(0, false);
 
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
diff --git a/qemu-options.hx b/qemu-options.hx
index 2c83390504..d7c6df1af4 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -115,6 +115,9 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "                igd-passthru=on|off (enable Xen integrated Intel graphics passthrough, default=off)\n"
     "                kernel-irqchip=on|off|split controls accelerated irqchip support (default=on)\n"
     "                kvm-shadow-mem=size of KVM shadow MMU in bytes\n"
+#ifdef CONFIG_MIRROR_JIT
+    "                mirror-jit=on|off (JIT pages mapped into separate RW and RX regions, default=off)\n"
+#endif
     "                tb-size=n (TCG translation block cache size)\n"
     "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
 SRST
@@ -140,6 +143,14 @@ SRST
     ``kvm-shadow-mem=size``
         Defines the size of the KVM shadow MMU.
 
+#ifdef CONFIG_MIRROR_JIT
+    ``mirror-jit=on|off``
+        Useful for debugging TCG or running on a strict W^X platform. When
+        enabled, TB code is written to a mirror mapped RW address separate from
+        the RX address that is executed. (default=off, but on if built with
+        TCG debugging)
+
+#endif
     ``tb-size=n``
         Controls the size (in MiB) of the TCG translation block cache.
 
-- 
2.28.0


