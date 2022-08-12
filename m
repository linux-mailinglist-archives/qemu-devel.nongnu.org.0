Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E3B59158A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:39:00 +0200 (CEST)
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZYg-0000wr-Ux
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ5D-0003c9-7x
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:31 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ5A-0006Yp-Cf
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:29 -0400
Received: by mail-pj1-x1030.google.com with SMTP id t22so1686576pjy.1
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=71zJ9JVsNe4pIZ3KVbgGd+9ZJfblxCtFtXmI8ZHhp6w=;
 b=mkb1J/QOk3b+Z223YUHiXzJmkTKxLzVoOSPb77oSqdMZsQ0gjOcP7jHEkAnbFYoawM
 e6DXjbAHVAA8DAJR+kyymexWXpvYQHWJTyEdTuKIfbAwvhRoxOc1rAuqhRVTg/tyX76T
 H5U1E2Ck8YRHvMQRVq420dJ7SVGW3EZfgRcHtNxFgLxcapthLmy9AMsNVMhSoUBvaD2i
 bahYREDjTVg8xnT4ScMXxjOFk1FL/qzdkOwIyEaldbxEd+ly3Xr5gxdNYrGXEDMlUQtQ
 ZdKrRww6p+axvghd6HvC1ko6HCdz6fcX1H8JYN6sF9jZH43gVcFBDokcIozqLjXfK4Xt
 PRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=71zJ9JVsNe4pIZ3KVbgGd+9ZJfblxCtFtXmI8ZHhp6w=;
 b=X0mGu+DJZ/nhCqxGGfn/g4d+B3kFnRmK2d5m9YNv7bFmNmjRYFU8e7PGP1FHo3QpKq
 NQ5zjNIjlimXCgg7hOegqFXmpqekJMoBboDRVUyBX+DvHyMhdKTyw18qMJ7+LWh6EoqI
 vmtbub1niIhqIV1NUFf0lLDV5wTBq+0DvF2+8YIRscxdnJBIobCg3KdvQpadUMttlDo/
 iYKNm5MLopH5Je/5ueHFiPGvmE2r/AcvNqWq8AilZeZ2O5vze8xhg0JEIHuuli7LW+Dz
 Z75/ICteTOiS1UASyWQV2KgjAjerQBCFvzTY2ITgXdOKk2QkliuwLcdGupa7xiY4CPIE
 5qOg==
X-Gm-Message-State: ACgBeo2nMUsr7cspWXAGj3lGXVYVaVPIVzQ9TzJqc6yRAFuiJ6EVBfhT
 H5gCqOLFSXWkQDbjPG7j8o3capraSpTKzg==
X-Google-Smtp-Source: AA6agR7275vWVTSm38u6jwFhZ1yIEDZ4i17rdrNmDK1ZbI7R1EDQh93NsmXK9OVtNgWd4GgxwuFw+g==
X-Received: by 2002:a17:902:6b82:b0:16d:d268:3842 with SMTP id
 p2-20020a1709026b8200b0016dd2683842mr5235852plk.16.1660327707080; 
 Fri, 12 Aug 2022 11:08:27 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 15/21] accel/tcg: Hoist get_page_addr_code out of
 tb_gen_code
Date: Fri, 12 Aug 2022 11:08:00 -0700
Message-Id: <20220812180806.2128593-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reuse the result that we just used with tb_lookup.
Pass in host_pc while touching these lines, to be used shortly.
We must widen the scope of the mmap_lock, so that the page table
lookup that is finally used is covered by the lock.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      |  7 ++++---
 accel/tcg/cpu-exec.c      | 20 ++++++++++++--------
 accel/tcg/translate-all.c |  5 ++---
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 3092bfa964..920d35e8bb 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -11,9 +11,10 @@
 
 #include "exec/exec-all.h"
 
-TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
-                              target_ulong cs_base, uint32_t flags,
-                              int cflags);
+TranslationBlock *tb_gen_code(CPUState *cpu,
+                              tb_page_addr_t phys_pc, void *host_pc,
+                              target_ulong pc, target_ulong cs_base,
+                              uint32_t flags, int cflags);
 G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 void page_init(void);
 void tb_htable_init(void);
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 889355b341..5278d1837b 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -485,6 +485,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
     target_ulong cs_base, pc;
     uint32_t flags, cflags;
     tb_page_addr_t phys_pc;
+    void *host_pc;
     int tb_exit;
 
     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
@@ -507,17 +508,17 @@ void cpu_exec_step_atomic(CPUState *cpu)
          * Any breakpoint for this insn will have been recognized earlier.
          */
 
-        phys_pc = get_page_addr_code(env, pc);
+        mmap_lock();
+        phys_pc = get_page_addr_code_hostp(env, pc, true, &host_pc);
         if (phys_pc == -1) {
             tb = NULL;
         } else {
             tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags, cflags);
         }
         if (tb == NULL) {
-            mmap_lock();
-            tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
-            mmap_unlock();
+            tb = tb_gen_code(cpu, phys_pc, host_pc, pc, cs_base, flags, cflags);
         }
+        mmap_unlock();
 
         cpu_exec_enter(cpu);
         /* execute the generated code */
@@ -958,6 +959,7 @@ int cpu_exec(CPUState *cpu)
             target_ulong cs_base, pc;
             uint32_t flags, cflags;
             tb_page_addr_t phys_pc;
+            void *host_pc;
 
             cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags);
 
@@ -979,22 +981,24 @@ int cpu_exec(CPUState *cpu)
                 break;
             }
 
-            phys_pc = get_page_addr_code(cpu->env_ptr, pc);
+            mmap_lock();
+            phys_pc = get_page_addr_code_hostp(cpu->env_ptr, pc,
+                                               true, &host_pc);
             if (phys_pc == -1) {
                 tb = NULL;
             } else {
                 tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags, cflags);
             }
             if (tb == NULL) {
-                mmap_lock();
-                tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
-                mmap_unlock();
+                tb = tb_gen_code(cpu, phys_pc, host_pc, pc,
+                                 cs_base, flags, cflags);
                 /*
                  * We add the TB in the virtual pc hash table
                  * for the fast lookup
                  */
                 qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
             }
+            mmap_unlock();
 
 #ifndef CONFIG_USER_ONLY
             /*
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 65a23f47d6..86e7644c1b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1326,12 +1326,13 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
 
 /* Called with mmap_lock held for user mode emulation.  */
 TranslationBlock *tb_gen_code(CPUState *cpu,
+                              tb_page_addr_t phys_pc, void *host_pc,
                               target_ulong pc, target_ulong cs_base,
                               uint32_t flags, int cflags)
 {
     CPUArchState *env = cpu->env_ptr;
     TranslationBlock *tb, *existing_tb;
-    tb_page_addr_t phys_pc, phys_page2;
+    tb_page_addr_t phys_page2;
     target_ulong virt_page2;
     tcg_insn_unit *gen_code_buf;
     int gen_code_size, search_size, max_insns;
@@ -1343,8 +1344,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     assert_memory_lock();
     qemu_thread_jit_write();
 
-    phys_pc = get_page_addr_code(env, pc);
-
     if (phys_pc == -1) {
         /* Generate a one-shot TB with 1 insn in it */
         cflags = (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
-- 
2.34.1


