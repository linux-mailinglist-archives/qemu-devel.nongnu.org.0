Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A26A65EB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCeG-0007t6-Ly; Tue, 28 Feb 2023 21:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeE-0007sp-S7
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:54 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeC-000319-Qi
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:54 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so41904pjn.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FOIDpCBmqxN7dTd/N4LdxmKL95UwRiMUMMLQLk/A2Mo=;
 b=xB0yxsDeJaMpoLOpMA/wQfwEimDofhf/5GaxIMkDFLeXKCFiFf7Py1SoKGIykBSUyt
 Os8b87vF+JL51wr2BZZKaMiwsSdNW+xY3g2THg7CWFqNXDJBxBMpLoUuyP/hj8fbGcye
 M09vQoLxoDUpesSCUsliMqqOAP9d1SO0ZSVKzoBlIsYnUhS4aBB5IMOFlYhGB4OKbd9B
 Kumlsg2AQ/lZXLaaPdJ7D96xjWQwWaRnBuw1yockTHnDo4NmJOPD6I7ZePq2m5jyqaHK
 KhpAe23V5wN0gLuHMxHrLS0fEBOi0mwQNmmwrWq5zj6Vwi/E5l35WNF4J0Hg0BLzuxI4
 v1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOIDpCBmqxN7dTd/N4LdxmKL95UwRiMUMMLQLk/A2Mo=;
 b=KpErzLvcU5K9kI2r8sbrw1/Y83Ps9VrFYm/kYdNHver0Qf1/8rUQHuCCCR7eRcJ5v6
 dWUYy7+LEwfYgQ4JOlu+ixfjipaMRXNO4LFnolAxwS+ydiY8gr1LmA/vwhkmTsdF/pp0
 jfz/2b1OGjYeaed4i/miPQL7yDR/17+yJ1aPzQBCTS26bV9eQX/IowkO74aYwfzcqVYA
 CXTiBnrX8E2y5QR08FE57MQ9M1ZM2Wo+/CQdXyhYqOEgrSmVphmteP1f5MILJ4RdQ5vw
 EA7KS8vH7er+uHy7tm0retYWahxd2lns0yBL7xByXsG1DCgtvQ7Uu0mZleTX8k+NvEcP
 CkQg==
X-Gm-Message-State: AO0yUKVTQK5iNE9PHVep/ZEGKgpEYMdhxBgEMr5PXUedGjEFN0vWpnm3
 CBHHJ8dKhdUAape6tpkO7dVh14UdOAP4uZPolGs=
X-Google-Smtp-Source: AK7set/8njrs2GY8+Haclvdou3gU80TxTuhkQ2gfgUsTa21xeFyTWv7Bpl5dhgv7TnwFh4zezZqp7w==
X-Received: by 2002:a17:902:daca:b0:19a:945d:e31 with SMTP id
 q10-20020a170902daca00b0019a945d0e31mr6406252plx.13.1677639411299; 
 Tue, 28 Feb 2023 18:56:51 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:56:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 03/62] accel/tcg: Add 'size' param to probe_access_flags()
Date: Tue, 28 Feb 2023 16:55:44 -1000
Message-Id: <20230301025643.1227244-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

probe_access_flags() as it is today uses probe_access_full(), which in
turn uses probe_access_internal() with size = 0. probe_access_internal()
then uses the size to call the tlb_fill() callback for the given CPU.
This size param ('fault_size' as probe_access_internal() calls it) is
ignored by most existing .tlb_fill callback implementations, e.g.
arm_cpu_tlb_fill(), ppc_cpu_tlb_fill(), x86_cpu_tlb_fill() and
mips_cpu_tlb_fill() to name a few.

But RISC-V riscv_cpu_tlb_fill() actually uses it. The 'size' parameter
is used to check for PMP (Physical Memory Protection) access. This is
necessary because PMP does not make any guarantees about all the bytes
of the same page having the same permissions, i.e. the same page can
have different PMP properties, so we're forced to make sub-page range
checks. To allow RISC-V emulation to do a probe_acess_flags() that
covers PMP, we need to either add a 'size' param to the existing
probe_acess_flags() or create a new interface (e.g.
probe_access_range_flags).

There are quite a few probe_* APIs already, so let's add a 'size' param
to probe_access_flags() and re-use this API. This is done by open coding
what probe_access_full() does inside probe_acess_flags() and passing the
'size' param to probe_acess_internal(). Existing probe_access_flags()
callers use size = 0 to not change their current API usage. 'size' is
asserted to enforce single page access like probe_access() already does.

No behavioral changes intended.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230223234427.521114-2-dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h       |  3 ++-
 accel/stubs/tcg-stub.c        |  2 +-
 accel/tcg/cputlb.c            | 17 ++++++++++++++---
 accel/tcg/user-exec.c         |  5 +++--
 semihosting/uaccess.c         |  2 +-
 target/arm/ptw.c              |  2 +-
 target/arm/tcg/sve_helper.c   |  2 +-
 target/s390x/tcg/mem_helper.c |  2 +-
 8 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 0e36f4d063..165b050872 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -447,6 +447,7 @@ static inline void *probe_read(CPUArchState *env, target_ulong addr, int size,
  * probe_access_flags:
  * @env: CPUArchState
  * @addr: guest virtual address to look up
+ * @size: size of the access
  * @access_type: read, write or execute permission
  * @mmu_idx: MMU index to use for lookup
  * @nonfault: suppress the fault
@@ -461,7 +462,7 @@ static inline void *probe_read(CPUArchState *env, target_ulong addr, int size,
  * Do handle clean pages, so exclude TLB_NOTDIRY from the returned flags.
  * For simplicity, all "mmio-like" flags are folded to TLB_MMIO.
  */
-int probe_access_flags(CPUArchState *env, target_ulong addr,
+int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr);
 
diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index c1b05767c0..96af23dc5d 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -25,7 +25,7 @@ void tcg_flush_jmp_cache(CPUState *cpu)
 {
 }
 
-int probe_access_flags(CPUArchState *env, target_ulong addr,
+int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr)
 {
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4812d83961..fc27e34457 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1606,14 +1606,25 @@ int probe_access_full(CPUArchState *env, target_ulong addr,
     return flags;
 }
 
-int probe_access_flags(CPUArchState *env, target_ulong addr,
+int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr)
 {
     CPUTLBEntryFull *full;
+    int flags;
 
-    return probe_access_full(env, addr, access_type, mmu_idx,
-                             nonfault, phost, &full, retaddr);
+    g_assert(-(addr | TARGET_PAGE_MASK) >= size);
+
+    flags = probe_access_internal(env, addr, size, access_type, mmu_idx,
+                                  nonfault, phost, &full, retaddr);
+
+    /* Handle clean RAM pages. */
+    if (unlikely(flags & TLB_NOTDIRTY)) {
+        notdirty_write(env_cpu(env), addr, 1, full, retaddr);
+        flags &= ~TLB_NOTDIRTY;
+    }
+
+    return flags;
 }
 
 void *probe_access(CPUArchState *env, target_ulong addr, int size,
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index ae67d84638..7b37fd229e 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -761,13 +761,14 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     cpu_loop_exit_sigsegv(env_cpu(env), addr, access_type, maperr, ra);
 }
 
-int probe_access_flags(CPUArchState *env, target_ulong addr,
+int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t ra)
 {
     int flags;
 
-    flags = probe_access_internal(env, addr, 0, access_type, nonfault, ra);
+    g_assert(-(addr | TARGET_PAGE_MASK) >= size);
+    flags = probe_access_internal(env, addr, size, access_type, nonfault, ra);
     *phost = flags ? NULL : g2h(env_cpu(env), addr);
     return flags;
 }
diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
index 8018828069..7505eb6d1b 100644
--- a/semihosting/uaccess.c
+++ b/semihosting/uaccess.c
@@ -37,7 +37,7 @@ ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
         /* Find the number of bytes remaining in the page. */
         left_in_page = TARGET_PAGE_SIZE - (addr & ~TARGET_PAGE_MASK);
 
-        flags = probe_access_flags(env, addr, MMU_DATA_LOAD,
+        flags = probe_access_flags(env, addr, 0, MMU_DATA_LOAD,
                                    mmu_idx, true, &h, 0);
         if (flags & TLB_INVALID_MASK) {
             return -1;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index be0cc6bc15..cf3f2fd703 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -411,7 +411,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
         void *discard;
 
         env->tlb_fi = fi;
-        flags = probe_access_flags(env, ptw->out_virt, MMU_DATA_STORE,
+        flags = probe_access_flags(env, ptw->out_virt, 0, MMU_DATA_STORE,
                                    arm_to_core_mmu_idx(ptw->in_ptw_idx),
                                    true, &discard, 0);
         env->tlb_fi = NULL;
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 521fc9b969..51909c44ac 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -5352,7 +5352,7 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
     addr = useronly_clean_ptr(addr);
 
 #ifdef CONFIG_USER_ONLY
-    flags = probe_access_flags(env, addr, access_type, mmu_idx, nofault,
+    flags = probe_access_flags(env, addr, 0, access_type, mmu_idx, nofault,
                                &info->host, retaddr);
 #else
     CPUTLBEntryFull *full;
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index e51a0db0fe..6835c26dda 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -145,7 +145,7 @@ static inline int s390_probe_access(CPUArchState *env, target_ulong addr,
                                     int mmu_idx, bool nonfault,
                                     void **phost, uintptr_t ra)
 {
-    int flags = probe_access_flags(env, addr, access_type, mmu_idx,
+    int flags = probe_access_flags(env, addr, 0, access_type, mmu_idx,
                                    nonfault, phost, ra);
 
     if (unlikely(flags & TLB_INVALID_MASK)) {
-- 
2.34.1


