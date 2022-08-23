Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5C359EEBA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:11:38 +0200 (CEST)
Received: from localhost ([::1]:56134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQc7V-0002ub-MJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc23-0008Ur-8N
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:59 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc1z-0001Qf-PE
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:58 -0400
Received: by mail-pj1-x102e.google.com with SMTP id m15so7195613pjj.3
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0BJKKX794+u71rVuTIcDWaChSDHlbW9A5LJBctnpTGM=;
 b=Ykbt7e8cHY80y0kCc8EqMB7111RllaIrbpg0dNgode//zbQ1le0cX+MTGBoKLd4CGG
 jFYVCiQpDGu1Kp8HKfXgU+YyQ+sHZVHY/ruOMnU8OQD6T0PE8JrbyhtL5uGVTr0GJfj4
 G2xx3DWoG/UB77CyGczv+Jc2XwHEet3ZSSbkoVF6XD86zg4zcrUJGdrYwHKHVZ4TXmxW
 uV+zr0UcosHphxHcoi5CFdNjFfnErsXe09UNLT0cDT0w5zcvRvnBra5dbxJiocoMKfzD
 KTdUZ/Noe7DPK9+cZXN+JZb8td0MYLMuemCiSeK30W7ieYiV3Kok0+g3XIivU0+/0etY
 h5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0BJKKX794+u71rVuTIcDWaChSDHlbW9A5LJBctnpTGM=;
 b=gn8DtjFBRCtaMrPC8PFN+I6BqJvumaswKfbn2h2ffRAMmXPxrtxbL8pn1gLKAG9ir4
 E4zIJjfPU3PvVT3zAmrtjFBhmMW8diWb/FGN8rzwMukP6N8vf6BpbzbbtUWJG8nKH62Z
 THHXsnSyNjkvuy1NcwqpkOgjlKpysEvvlPIGpflE60Hw0odkZg5Vj1pLpc37X7laHANj
 OgOXNCj7ES6myJRvhYYoqMI0yR+yo5c1Nq7rDOZp9zWB+VxeJStw/ArnRXVhfDefd7ZW
 LPgG7VvjbYIC6jioOZVa8I3Hrd7EmO5t7rJJXPzNJPDjCS9DR4ljemblPFLhc3I0yFRF
 To+w==
X-Gm-Message-State: ACgBeo1p7oMPXvmZTJ9/MlppfDf6KeesX0RwNZhdPeS/eebK2QZcsF5j
 qZ4rKO/xj9NNKPCij91sDJPe0FFbq+5cHw==
X-Google-Smtp-Source: AA6agR6GK4wmWQByLm8Otn2pomrcKJZc6S9391ldFtep2/nRHO96Ode3uTQWQLB2zBAsd+0RYayvgg==
X-Received: by 2002:a17:90a:19d:b0:1f7:2b1a:947a with SMTP id
 29-20020a17090a019d00b001f72b1a947amr5298230pjc.118.1661292354175; 
 Tue, 23 Aug 2022 15:05:54 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:05:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com, laurent@vivier.eu, alex.bennee@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 08/20] accel/tcg: Properly implement get_page_addr_code for
 user-only
Date: Tue, 23 Aug 2022 15:05:30 -0700
Message-Id: <20220823220542.1993395-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

The current implementation is a no-op, simply returning addr.
This is incorrect, because we ought to be checking the page
permissions for execution.

Make get_page_addr_code inline for both implementations.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 85 ++++++++++++++---------------------------
 accel/tcg/cputlb.c      |  5 ---
 accel/tcg/user-exec.c   | 15 ++++++++
 3 files changed, 43 insertions(+), 62 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 311e5fb422..0475ec6007 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -598,43 +598,44 @@ struct MemoryRegionSection *iotlb_to_section(CPUState *cpu,
                                              hwaddr index, MemTxAttrs attrs);
 #endif
 
-#if defined(CONFIG_USER_ONLY)
-void mmap_lock(void);
-void mmap_unlock(void);
-bool have_mmap_lock(void);
-
 /**
- * get_page_addr_code() - user-mode version
+ * get_page_addr_code_hostp()
  * @env: CPUArchState
  * @addr: guest virtual address of guest code
  *
- * Returns @addr.
+ * See get_page_addr_code() (full-system version) for documentation on the
+ * return value.
+ *
+ * Sets *@hostp (when @hostp is non-NULL) as follows.
+ * If the return value is -1, sets *@hostp to NULL. Otherwise, sets *@hostp
+ * to the host address where @addr's content is kept.
+ *
+ * Note: this function can trigger an exception.
+ */
+tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
+                                        void **hostp);
+
+/**
+ * get_page_addr_code()
+ * @env: CPUArchState
+ * @addr: guest virtual address of guest code
+ *
+ * If we cannot translate and execute from the entire RAM page, or if
+ * the region is not backed by RAM, returns -1. Otherwise, returns the
+ * ram_addr_t corresponding to the guest code at @addr.
+ *
+ * Note: this function can trigger an exception.
  */
 static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
                                                 target_ulong addr)
 {
-    return addr;
+    return get_page_addr_code_hostp(env, addr, NULL);
 }
 
-/**
- * get_page_addr_code_hostp() - user-mode version
- * @env: CPUArchState
- * @addr: guest virtual address of guest code
- *
- * Returns @addr.
- *
- * If @hostp is non-NULL, sets *@hostp to the host address where @addr's content
- * is kept.
- */
-static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
-                                                      target_ulong addr,
-                                                      void **hostp)
-{
-    if (hostp) {
-        *hostp = g2h_untagged(addr);
-    }
-    return addr;
-}
+#if defined(CONFIG_USER_ONLY)
+void mmap_lock(void);
+void mmap_unlock(void);
+bool have_mmap_lock(void);
 
 /**
  * adjust_signal_pc:
@@ -691,36 +692,6 @@ G_NORETURN void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
 static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
 
-/**
- * get_page_addr_code() - full-system version
- * @env: CPUArchState
- * @addr: guest virtual address of guest code
- *
- * If we cannot translate and execute from the entire RAM page, or if
- * the region is not backed by RAM, returns -1. Otherwise, returns the
- * ram_addr_t corresponding to the guest code at @addr.
- *
- * Note: this function can trigger an exception.
- */
-tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr);
-
-/**
- * get_page_addr_code_hostp() - full-system version
- * @env: CPUArchState
- * @addr: guest virtual address of guest code
- *
- * See get_page_addr_code() (full-system version) for documentation on the
- * return value.
- *
- * Sets *@hostp (when @hostp is non-NULL) as follows.
- * If the return value is -1, sets *@hostp to NULL. Otherwise, sets *@hostp
- * to the host address where @addr's content is kept.
- *
- * Note: this function can trigger an exception.
- */
-tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
-                                        void **hostp);
-
 void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a46f3a654d..43bd65c973 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1544,11 +1544,6 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
     return qemu_ram_addr_from_host_nofail(p);
 }
 
-tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
-{
-    return get_page_addr_code_hostp(env, addr, NULL);
-}
-
 static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
                            CPUIOTLBEntry *iotlbentry, uintptr_t retaddr)
 {
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 20ada5472b..cd232967e6 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -199,6 +199,21 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
+tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
+                                        void **hostp)
+{
+    int flags;
+
+    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, false, 0);
+    if (unlikely(flags)) {
+        return -1;
+    }
+    if (hostp) {
+        *hostp = g2h_untagged(addr);
+    }
+    return addr;
+}
+
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
 /*
-- 
2.34.1


