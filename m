Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189BB5993A0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:42:03 +0200 (CEST)
Received: from localhost ([::1]:46686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOstW-00049e-7J
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseg-0002KT-8a
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:42 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseQ-0002kW-RA
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:41 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso3723707pjh.5
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5GSPfEvyPrLUpGcs/m51zVSigrM1xnBlAzjMxTS+rak=;
 b=qvJFw+DepXhf//4bPRSI4BnaZbzkmsfdDancYmwaZFrFeNWe9V08zl0XslsDX0aurg
 Ha3jg3BfSR2KqfwEgsaKr4Mm+s0epCkScXqfDoVA2IKkCh/IttbbGCYKyeThfl0Lw2Gf
 QE2YN0vpTlpc9nzKiUkKyQk8JnL8SlqIdJ5bHMo5zj+UBR2LGAQEZewvpXlK3c7ujs5V
 NyMNjmJ6imt2DP8zJtdY+HXD1oDF6j4+vgwwNKemUb60Agyi7vMTYs/t/xpMpTjJjjzT
 LiazQGsVFL5b+vPEr6Ay0+dEuXYCZYxfOadxA7hsGc07V/TM0CzIiwJnXkMMuN1goP3X
 90fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5GSPfEvyPrLUpGcs/m51zVSigrM1xnBlAzjMxTS+rak=;
 b=iwRw8gHWjAnQ+b1G53DV6+1HER9b8v4o9XT8pJDXaQkCs2u4kxPVg6bz+IyNtuUYe8
 aQygFUPa/6u/4f5RCYG5ZbO/eoD8AvuaU9LT3+SyxDxkPYIMnlRO6YYeh9s+9dkI+hQV
 4r8df6hyyy/7XF+Ufs4WlLhLl55UltjvyvBBeRv5JdYfPjxAVGbhH0bcPga10SZfs9x7
 9nEYYRLlGvva0/rm/FXL3N9OX6P27S1zfq8sb2I/8eGo5YoMZnyEHEGR1WXXAewq6xuO
 qAO29Y5AojVvZOobyXTl3YQg7hzNnzApTOCxvEKIqJPgsNOfE4QSrl8JcsWYbWJHrOnE
 lf1A==
X-Gm-Message-State: ACgBeo1uClWAiPL8kX31UhALjzCsTYhdZBPRh6Hxmb/gJsrhUGdTjZQd
 ujliJsriFrsjpr0EYCPeHGT5TzDhr/DmSg==
X-Google-Smtp-Source: AA6agR4riB1Mogc+4e2+vc9mIClL1ftOF9F22Hi+YOG1zNHIriK0RmWYjL3AF9/e1bTBKt0m6TLrdQ==
X-Received: by 2002:a17:90b:4c8d:b0:1f5:29ef:4a36 with SMTP id
 my13-20020a17090b4c8d00b001f529ef4a36mr6307631pjb.127.1660879585451; 
 Thu, 18 Aug 2022 20:26:25 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 08/21] accel/tcg: Properly implement get_page_addr_code for
 user-only
Date: Thu, 18 Aug 2022 20:26:02 -0700
Message-Id: <20220819032615.884847-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index 20ada5472b..a20234fb02 100644
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
+    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, true, 0);
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


