Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E79726E9BC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 02:04:07 +0200 (CEST)
Received: from localhost ([::1]:50166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJ3sk-0002yP-53
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 20:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kJ3mQ-0003rD-Eg
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 19:57:34 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kJ3mL-0006eN-Bi
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 19:57:34 -0400
Received: by mail-pl1-x643.google.com with SMTP id q12so1981990plr.12
 for <qemu-devel@nongnu.org>; Thu, 17 Sep 2020 16:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U6fE0rS6g/PgpT0BfNKV2MVny74HOKVIxnGhNrYyK/8=;
 b=paVyLvqkUpPo6A0HhT0885UlO5hdOBlxDtK/BJx7m4oUzHB/dJbEV6I+mWcHLEfTnO
 LOgqDg46ax/9qYACPUgY8EKPeveyCCf+V8xCNTfmku1wx5enPsMxGpmNWjWRH9ecEhop
 GtZElnClStPtj2BRIt41ZmlNwSTWh2aLbWLFL/bGTI3z5/0Glg2bpIZqMKVLpcLQfUfx
 80lQaVpmF+c11tNUwTrHZkHZGfS/LOPICyBvFGKtlhaa/fhjqRbX7CylSFMVUNYxnsTl
 e5HgwQaUKKP0x1QpnPgd0BsE3PxjRyuaRp8Rjqn5GXu9PKtfU0s1sxi/wJyl67DTt9oo
 mu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U6fE0rS6g/PgpT0BfNKV2MVny74HOKVIxnGhNrYyK/8=;
 b=EdMChsmJvndcsuzwTQG1f8RKyu3kbe9YpTqHh8gXliToviaZxyTSg2pEHLV55K/f9N
 omOTKNg0BinyrJLSU9CXVDi5SYdGbOB3cBDFGgfSDBJnWhvltj99peVerI5Z82risxy2
 rtvJul0cSKljqpZxTmYmDD5rzn8tnzEQ+JuJJ5DWebiAKHuVGs6RKdtpj3zcywpmd72C
 /CdcSMPAX5mrKyM33o8Bw0eMeG0C3uRNUmjiUgmQL8OWNhek2SefsQOeyt5OuDFgoyER
 jcm2qjXN8aYfII02DbGpv4Fw66ckNBBCOJga5kzBBmQtKS4GXKWTfiFv+z4qIhirccf+
 wk1g==
X-Gm-Message-State: AOAM530EEook1Ic6ZpGJ3vgLMV6Cg5gYLk7axR/kEj2M17xS6uHRxwLn
 2+1qnIoBcJVcUD2oY/C1B3bLYqQhbC8f2Q==
X-Google-Smtp-Source: ABdhPJyAwk+4Ns5d43zIJy4yI+eXdrTo8lVx3pUJVUK+vgHzgcjXOQjdm9HkuEnmLzsNcla3uVZD3g==
X-Received: by 2002:a17:902:9692:b029:d1:e5e7:be18 with SMTP id
 n18-20020a1709029692b02900d1e5e7be18mr12313497plp.75.1600387047197; 
 Thu, 17 Sep 2020 16:57:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m13sm772699pfk.103.2020.09.17.16.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 16:57:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/10] disas: Clean up CPUDebug initialization
Date: Thu, 17 Sep 2020 16:57:14 -0700
Message-Id: <20200917235720.2685978-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917235720.2685978-1-richard.henderson@linaro.org>
References: <20200917235720.2685978-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename several functions, dropping "generic" and making "host"
vs "target" clearer.  Make a bunch of functions static that are
not used outside this file. Replace INIT_DISASSEMBLE_INFO with
a trio of functions.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/disas/dis-asm.h |  62 --------
 disas.c                 | 326 ++++++++++++++++++----------------------
 2 files changed, 148 insertions(+), 240 deletions(-)

diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 9856bf7921..dda247eaf2 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -406,7 +406,6 @@ typedef struct disassemble_info {
 
 } disassemble_info;
 
-
 /* Standard disassemblers.  Disassemble one instruction at the given
    target address.  Return number of bytes processed.  */
 typedef int (*disassembler_ftype) (bfd_vma, disassemble_info *);
@@ -461,67 +460,6 @@ int print_insn_riscv32          (bfd_vma, disassemble_info*);
 int print_insn_riscv64          (bfd_vma, disassemble_info*);
 int print_insn_rx(bfd_vma, disassemble_info *);
 
-#if 0
-/* Fetch the disassembler for a given BFD, if that support is available.  */
-disassembler_ftype disassembler(bfd *);
-#endif
-
-
-/* This block of definitions is for particular callers who read instructions
-   into a buffer before calling the instruction decoder.  */
-
-/* Here is a function which callers may wish to use for read_memory_func.
-   It gets bytes from a buffer.  */
-int buffer_read_memory(bfd_vma, bfd_byte *, int, struct disassemble_info *);
-
-/* This function goes with buffer_read_memory.
-   It prints a message using info->fprintf_func and info->stream.  */
-void perror_memory(int, bfd_vma, struct disassemble_info *);
-
-
-/* Just print the address in hex.  This is included for completeness even
-   though both GDB and objdump provide their own (to print symbolic
-   addresses).  */
-void generic_print_address(bfd_vma, struct disassemble_info *);
-
-/* Always true.  */
-int generic_symbol_at_address(bfd_vma, struct disassemble_info *);
-
-/* Macro to initialize a disassemble_info struct.  This should be called
-   by all applications creating such a struct.  */
-#define INIT_DISASSEMBLE_INFO(INFO, STREAM, FPRINTF_FUNC) \
-  (INFO).flavour = bfd_target_unknown_flavour, \
-  (INFO).arch = bfd_arch_unknown, \
-  (INFO).mach = 0, \
-  (INFO).endian = BFD_ENDIAN_UNKNOWN, \
-  INIT_DISASSEMBLE_INFO_NO_ARCH(INFO, STREAM, FPRINTF_FUNC)
-
-/* Call this macro to initialize only the internal variables for the
-   disassembler.  Architecture dependent things such as byte order, or machine
-   variant are not touched by this macro.  This makes things much easier for
-   GDB which must initialize these things separately.  */
-
-#define INIT_DISASSEMBLE_INFO_NO_ARCH(INFO, STREAM, FPRINTF_FUNC) \
-  (INFO).fprintf_func = (FPRINTF_FUNC), \
-  (INFO).stream = (STREAM), \
-  (INFO).symbols = NULL, \
-  (INFO).num_symbols = 0, \
-  (INFO).private_data = NULL, \
-  (INFO).buffer = NULL, \
-  (INFO).buffer_vma = 0, \
-  (INFO).buffer_length = 0, \
-  (INFO).read_memory_func = buffer_read_memory, \
-  (INFO).memory_error_func = perror_memory, \
-  (INFO).print_address_func = generic_print_address, \
-  (INFO).print_insn = NULL, \
-  (INFO).symbol_at_address_func = generic_symbol_at_address, \
-  (INFO).flags = 0, \
-  (INFO).bytes_per_line = 0, \
-  (INFO).bytes_per_chunk = 0, \
-  (INFO).display_endian = BFD_ENDIAN_UNKNOWN, \
-  (INFO).disassembler_options = NULL, \
-  (INFO).insn_info_valid = 0
-
 #ifndef ATTRIBUTE_UNUSED
 #define ATTRIBUTE_UNUSED __attribute__((unused))
 #endif
diff --git a/disas.c b/disas.c
index a4304e8137..7bc8e9a037 100644
--- a/disas.c
+++ b/disas.c
@@ -16,78 +16,66 @@ typedef struct CPUDebug {
 /* Filled in by elfload.c.  Simplistic, but will do for now. */
 struct syminfo *syminfos = NULL;
 
-/* Get LENGTH bytes from info's buffer, at target address memaddr.
-   Transfer them to myaddr.  */
-int
-buffer_read_memory(bfd_vma memaddr, bfd_byte *myaddr, int length,
-                   struct disassemble_info *info)
+/*
+ * Get LENGTH bytes from info's buffer, at host address memaddr.
+ * Transfer them to myaddr.
+ */
+static int host_read_memory(bfd_vma memaddr, bfd_byte *myaddr, int length,
+                            struct disassemble_info *info)
 {
     if (memaddr < info->buffer_vma
-        || memaddr + length > info->buffer_vma + info->buffer_length)
+        || memaddr + length > info->buffer_vma + info->buffer_length) {
         /* Out of bounds.  Use EIO because GDB uses it.  */
         return EIO;
+    }
     memcpy (myaddr, info->buffer + (memaddr - info->buffer_vma), length);
     return 0;
 }
 
-/* Get LENGTH bytes from info's buffer, at target address memaddr.
-   Transfer them to myaddr.  */
-static int
-target_read_memory (bfd_vma memaddr,
-                    bfd_byte *myaddr,
-                    int length,
-                    struct disassemble_info *info)
+/*
+ * Get LENGTH bytes from info's buffer, at target address memaddr.
+ * Transfer them to myaddr.
+ */
+static int target_read_memory(bfd_vma memaddr, bfd_byte *myaddr, int length,
+                              struct disassemble_info *info)
 {
     CPUDebug *s = container_of(info, CPUDebug, info);
-    int r;
-
-    r = cpu_memory_rw_debug(s->cpu, memaddr, myaddr, length, 0);
-
+    int r = cpu_memory_rw_debug(s->cpu, memaddr, myaddr, length, 0);
     return r ? EIO : 0;
 }
 
 /* Print an error message.  We can assume that this is in response to
-   an error return from buffer_read_memory.  */
-void
-perror_memory (int status, bfd_vma memaddr, struct disassemble_info *info)
+   an error return from {host,target}_read_memory.  */
+static void perror_memory(int status, bfd_vma memaddr,
+                          struct disassemble_info *info)
 {
-  if (status != EIO)
-    /* Can't happen.  */
-    (*info->fprintf_func) (info->stream, "Unknown error %d\n", status);
-  else
-    /* Actually, address between memaddr and memaddr + len was
-       out of bounds.  */
-    (*info->fprintf_func) (info->stream,
-			   "Address 0x%" PRIx64 " is out of bounds.\n", memaddr);
+    if (status != EIO) {
+        /* Can't happen.  */
+        info->fprintf_func(info->stream, "Unknown error %d\n", status);
+    } else {
+        /* Address between memaddr and memaddr + len was out of bounds.  */
+        info->fprintf_func(info->stream,
+			   "Address 0x%" PRIx64 " is out of bounds.\n",
+                           memaddr);
+    }
 }
 
-/* This could be in a separate file, to save minuscule amounts of space
-   in statically linked executables.  */
-
-/* Just print the address is hex.  This is included for completeness even
-   though both GDB and objdump provide their own (to print symbolic
-   addresses).  */
-
-void
-generic_print_address (bfd_vma addr, struct disassemble_info *info)
+/* Print address in hex. */
+static void print_address(bfd_vma addr, struct disassemble_info *info)
 {
-    (*info->fprintf_func) (info->stream, "0x%" PRIx64, addr);
+    info->fprintf_func(info->stream, "0x%" PRIx64, addr);
 }
 
 /* Print address in hex, truncated to the width of a host virtual address. */
-static void
-generic_print_host_address(bfd_vma addr, struct disassemble_info *info)
+static void host_print_address(bfd_vma addr, struct disassemble_info *info)
 {
-    uint64_t mask = ~0ULL >> (64 - (sizeof(void *) * 8));
-    generic_print_address(addr & mask, info);
+    print_address((uintptr_t)addr, info);
 }
 
-/* Just return the given address.  */
-
-int
-generic_symbol_at_address (bfd_vma addr, struct disassemble_info *info)
+/* Stub prevents some fruitless earching in optabs disassemblers. */
+static int symbol_at_address(bfd_vma addr, struct disassemble_info *info)
 {
-  return 1;
+    return 1;
 }
 
 bfd_vma bfd_getl64 (const bfd_byte *addr)
@@ -423,36 +411,116 @@ static bool cap_disas_monitor(disassemble_info *info, uint64_t pc, int count)
 # define cap_disas_plugin(i, p, c) false
 #endif /* CONFIG_CAPSTONE */
 
+static void initialize_debug(CPUDebug *s)
+{
+    memset(s, 0, sizeof(*s));
+    s->info.arch = bfd_arch_unknown;
+    s->info.cap_arch = -1;
+    s->info.cap_insn_unit = 4;
+    s->info.cap_insn_split = 4;
+    s->info.memory_error_func = perror_memory;
+    s->info.symbol_at_address_func = symbol_at_address;
+}
+
+static void initialize_debug_target(CPUDebug *s, CPUState *cpu)
+{
+    initialize_debug(s);
+
+    s->cpu = cpu;
+    s->info.read_memory_func = target_read_memory;
+    s->info.print_address_func = print_address;
+#ifdef TARGET_WORDS_BIGENDIAN
+    s->info.endian = BFD_ENDIAN_BIG;
+#else
+    s->info.endian = BFD_ENDIAN_LITTLE;
+#endif
+
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    if (cc->disas_set_info) {
+        cc->disas_set_info(cpu, &s->info);
+    }
+}
+
+static void initialize_debug_host(CPUDebug *s)
+{
+    initialize_debug(s);
+
+    s->info.read_memory_func = host_read_memory;
+    s->info.print_address_func = host_print_address;
+#ifdef HOST_WORDS_BIGENDIAN
+    s->info.endian = BFD_ENDIAN_BIG;
+#else
+    s->info.endian = BFD_ENDIAN_LITTLE;
+#endif
+#if defined(CONFIG_TCG_INTERPRETER)
+    s->info.print_insn = print_insn_tci;
+#elif defined(__i386__)
+    s->info.mach = bfd_mach_i386_i386;
+    s->info.print_insn = print_insn_i386;
+    s->info.cap_arch = CS_ARCH_X86;
+    s->info.cap_mode = CS_MODE_32;
+    s->info.cap_insn_unit = 1;
+    s->info.cap_insn_split = 8;
+#elif defined(__x86_64__)
+    s->info.mach = bfd_mach_x86_64;
+    s->info.print_insn = print_insn_i386;
+    s->info.cap_arch = CS_ARCH_X86;
+    s->info.cap_mode = CS_MODE_64;
+    s->info.cap_insn_unit = 1;
+    s->info.cap_insn_split = 8;
+#elif defined(_ARCH_PPC)
+    s->info.disassembler_options = (char *)"any";
+    s->info.print_insn = print_insn_ppc;
+    s->info.cap_arch = CS_ARCH_PPC;
+# ifdef _ARCH_PPC64
+    s->info.cap_mode = CS_MODE_64;
+# endif
+#elif defined(__riscv) && defined(CONFIG_RISCV_DIS)
+#if defined(_ILP32) || (__riscv_xlen == 32)
+    s->info.print_insn = print_insn_riscv32;
+#elif defined(_LP64)
+    s->info.print_insn = print_insn_riscv64;
+#else
+#error unsupported RISC-V ABI
+#endif
+#elif defined(__aarch64__) && defined(CONFIG_ARM_A64_DIS)
+    s->info.print_insn = print_insn_arm_a64;
+    s->info.cap_arch = CS_ARCH_ARM64;
+#elif defined(__alpha__)
+    s->info.print_insn = print_insn_alpha;
+#elif defined(__sparc__)
+    s->info.print_insn = print_insn_sparc;
+    s->info.mach = bfd_mach_sparc_v9b;
+#elif defined(__arm__)
+    /* TCG only generates code for arm mode.  */
+    s->info.print_insn = print_insn_arm;
+    s->info.cap_arch = CS_ARCH_ARM;
+#elif defined(__MIPSEB__)
+    s->info.print_insn = print_insn_big_mips;
+#elif defined(__MIPSEL__)
+    s->info.print_insn = print_insn_little_mips;
+#elif defined(__m68k__)
+    s->info.print_insn = print_insn_m68k;
+#elif defined(__s390__)
+    s->info.print_insn = print_insn_s390;
+#elif defined(__hppa__)
+    s->info.print_insn = print_insn_hppa;
+#endif
+}
+
 /* Disassemble this for me please... (debugging).  */
 void target_disas(FILE *out, CPUState *cpu, target_ulong code,
                   target_ulong size)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     target_ulong pc;
     int count;
     CPUDebug s;
 
-    INIT_DISASSEMBLE_INFO(s.info, out, fprintf);
-
-    s.cpu = cpu;
-    s.info.read_memory_func = target_read_memory;
+    initialize_debug_target(&s, cpu);
+    s.info.fprintf_func = fprintf;
+    s.info.stream = out;
     s.info.buffer_vma = code;
     s.info.buffer_length = size;
-    s.info.print_address_func = generic_print_address;
-    s.info.cap_arch = -1;
-    s.info.cap_mode = 0;
-    s.info.cap_insn_unit = 4;
-    s.info.cap_insn_split = 4;
-
-#ifdef TARGET_WORDS_BIGENDIAN
-    s.info.endian = BFD_ENDIAN_BIG;
-#else
-    s.info.endian = BFD_ENDIAN_LITTLE;
-#endif
-
-    if (cc->disas_set_info) {
-        cc->disas_set_info(cpu, &s.info);
-    }
 
     if (s.info.cap_arch >= 0 && cap_disas_target(&s.info, code, size)) {
         return;
@@ -540,34 +608,17 @@ bool cap_disas_plugin(disassemble_info *info, uint64_t pc, size_t size)
  */
 char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     int count;
     CPUDebug s;
     GString *ds = g_string_set_size(&plugin_disas_output, 0);
 
     g_assert(ds == &plugin_disas_output);
 
-    INIT_DISASSEMBLE_INFO(s.info, NULL, plugin_printf);
-
-    s.cpu = cpu;
-    s.info.read_memory_func = target_read_memory;
+    initialize_debug_target(&s, cpu);
+    s.info.fprintf_func = plugin_printf;
     s.info.buffer_vma = addr;
     s.info.buffer_length = size;
     s.info.print_address_func = plugin_print_address;
-    s.info.cap_arch = -1;
-    s.info.cap_mode = 0;
-    s.info.cap_insn_unit = 4;
-    s.info.cap_insn_split = 4;
-
-#ifdef TARGET_WORDS_BIGENDIAN
-    s.info.endian = BFD_ENDIAN_BIG;
-#else
-    s.info.endian = BFD_ENDIAN_LITTLE;
-#endif
-
-    if (cc->disas_set_info) {
-        cc->disas_set_info(cpu, &s.info);
-    }
 
     if (s.info.cap_arch >= 0 && cap_disas_plugin(&s.info, addr, size)) {
         return g_strdup(ds->str);
@@ -593,89 +644,24 @@ void disas(FILE *out, void *code, unsigned long size)
     uintptr_t pc;
     int count;
     CPUDebug s;
-    int (*print_insn)(bfd_vma pc, disassemble_info *info) = NULL;
-
-    INIT_DISASSEMBLE_INFO(s.info, out, fprintf);
-    s.info.print_address_func = generic_print_host_address;
 
+    initialize_debug_host(&s);
+    s.info.fprintf_func = fprintf;
+    s.info.stream = out;
     s.info.buffer = code;
     s.info.buffer_vma = (uintptr_t)code;
     s.info.buffer_length = size;
-    s.info.cap_arch = -1;
-    s.info.cap_mode = 0;
-    s.info.cap_insn_unit = 4;
-    s.info.cap_insn_split = 4;
-
-#ifdef HOST_WORDS_BIGENDIAN
-    s.info.endian = BFD_ENDIAN_BIG;
-#else
-    s.info.endian = BFD_ENDIAN_LITTLE;
-#endif
-#if defined(CONFIG_TCG_INTERPRETER)
-    print_insn = print_insn_tci;
-#elif defined(__i386__)
-    s.info.mach = bfd_mach_i386_i386;
-    print_insn = print_insn_i386;
-    s.info.cap_arch = CS_ARCH_X86;
-    s.info.cap_mode = CS_MODE_32;
-    s.info.cap_insn_unit = 1;
-    s.info.cap_insn_split = 8;
-#elif defined(__x86_64__)
-    s.info.mach = bfd_mach_x86_64;
-    print_insn = print_insn_i386;
-    s.info.cap_arch = CS_ARCH_X86;
-    s.info.cap_mode = CS_MODE_64;
-    s.info.cap_insn_unit = 1;
-    s.info.cap_insn_split = 8;
-#elif defined(_ARCH_PPC)
-    s.info.disassembler_options = (char *)"any";
-    print_insn = print_insn_ppc;
-    s.info.cap_arch = CS_ARCH_PPC;
-# ifdef _ARCH_PPC64
-    s.info.cap_mode = CS_MODE_64;
-# endif
-#elif defined(__riscv) && defined(CONFIG_RISCV_DIS)
-#if defined(_ILP32) || (__riscv_xlen == 32)
-    print_insn = print_insn_riscv32;
-#elif defined(_LP64)
-    print_insn = print_insn_riscv64;
-#else
-#error unsupported RISC-V ABI
-#endif
-#elif defined(__aarch64__) && defined(CONFIG_ARM_A64_DIS)
-    print_insn = print_insn_arm_a64;
-    s.info.cap_arch = CS_ARCH_ARM64;
-#elif defined(__alpha__)
-    print_insn = print_insn_alpha;
-#elif defined(__sparc__)
-    print_insn = print_insn_sparc;
-    s.info.mach = bfd_mach_sparc_v9b;
-#elif defined(__arm__)
-    print_insn = print_insn_arm;
-    s.info.cap_arch = CS_ARCH_ARM;
-    /* TCG only generates code for arm mode.  */
-#elif defined(__MIPSEB__)
-    print_insn = print_insn_big_mips;
-#elif defined(__MIPSEL__)
-    print_insn = print_insn_little_mips;
-#elif defined(__m68k__)
-    print_insn = print_insn_m68k;
-#elif defined(__s390__)
-    print_insn = print_insn_s390;
-#elif defined(__hppa__)
-    print_insn = print_insn_hppa;
-#endif
 
     if (s.info.cap_arch >= 0 && cap_disas_host(&s.info, code, size)) {
         return;
     }
 
-    if (print_insn == NULL) {
-        print_insn = print_insn_od_host;
+    if (s.info.print_insn == NULL) {
+        s.info.print_insn = print_insn_od_host;
     }
     for (pc = (uintptr_t)code; size > 0; pc += count, size -= count) {
         fprintf(out, "0x%08" PRIxPTR ":  ", pc);
-        count = print_insn(pc, &s.info);
+        count = s.info.print_insn(pc, &s.info);
         fprintf(out, "\n");
         if (count < 0) {
             break;
@@ -720,31 +706,15 @@ physical_read_memory(bfd_vma memaddr, bfd_byte *myaddr, int length,
 void monitor_disas(Monitor *mon, CPUState *cpu,
                    target_ulong pc, int nb_insn, int is_physical)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     int count, i;
     CPUDebug s;
 
-    INIT_DISASSEMBLE_INFO(s.info, NULL, qemu_fprintf);
-
-    s.cpu = cpu;
-    s.info.read_memory_func
-        = (is_physical ? physical_read_memory : target_read_memory);
-    s.info.print_address_func = generic_print_address;
-    s.info.buffer_vma = pc;
-    s.info.cap_arch = -1;
-    s.info.cap_mode = 0;
-    s.info.cap_insn_unit = 4;
-    s.info.cap_insn_split = 4;
-
-#ifdef TARGET_WORDS_BIGENDIAN
-    s.info.endian = BFD_ENDIAN_BIG;
-#else
-    s.info.endian = BFD_ENDIAN_LITTLE;
-#endif
-
-    if (cc->disas_set_info) {
-        cc->disas_set_info(cpu, &s.info);
+    initialize_debug_target(&s, cpu);
+    s.info.fprintf_func = qemu_fprintf;
+    if (is_physical) {
+        s.info.read_memory_func = physical_read_memory;
     }
+    s.info.buffer_vma = pc;
 
     if (s.info.cap_arch >= 0 && cap_disas_monitor(&s.info, pc, nb_insn)) {
         return;
-- 
2.25.1


