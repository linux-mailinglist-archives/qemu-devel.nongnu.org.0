Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F94591576
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:28:38 +0200 (CEST)
Received: from localhost ([::1]:44354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZOf-0006ED-G2
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ56-0003Wg-4c
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:24 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ54-0006Xc-CV
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:23 -0400
Received: by mail-pl1-x634.google.com with SMTP id p8so1377023plq.13
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xPtGK6M1TngwtnTnZLI8rBr9bzgA002Z+efjpC+i5Pw=;
 b=Vr854AMYF+hAsbiUTdu6Yep/C7YnKhK0o0SvL+PHmsvIk0iuUItOvNnX3JrXYZz0Nm
 xh1eCNi72KacDEgxe/2EnZQStoBLWhPKeV8OhMdmNXdc1b0bGWH/CeZrHNHTwg+Ohj5s
 jG8EluKsxSjocu2c/MY3sCTycThT0XBvvlOdb0FNr83uOw7mIi4I8gx1EFQzUA/MKuG8
 KocFrxu1GbRnZi355p8pe3IEK2OBpb/vcHBT+1ct6Fg9mAzXk5GcAwW1FPi+jH6IFEdn
 jelhZrYDdo6O9DPuasVg8jecbq07rMQqPjd35wncwDdHfYtDoRav7wAiUK10nr/lK1Ev
 DEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xPtGK6M1TngwtnTnZLI8rBr9bzgA002Z+efjpC+i5Pw=;
 b=f/WEneT8wrE3/wcaqOO2qVNya/Q50eYWwj98dshhqNGdGbqsr+7UonYJzB4Cf2DHe8
 1dZznaZLdTNHnwmouUXKyrl25ctkbYSqPDdlDque43FjluNxHeP+pK35c+Dj/bbygvsw
 uHjMVXR5euTPIJyazLz7rDzC4RIjzWQlFnOaPLNkQDZw5QJVdye9JtxEXU8Cvn/EEoAy
 sR3NLVvruUyVhiSapXr05WDNfVYVDVpA1ADtdckXyg2HQ9bbemrfjJjp25bDFKgFxeQE
 hLk3gUndlbjBFYAzC8ODWdhvVW3rEg/3HzcoC5RGeYVLbl6HOifvIsX3ZIvz4zs6lz0/
 k0dg==
X-Gm-Message-State: ACgBeo3KPMUyI3cspX0EmutyeTkTSHLh0bJ+RG5wsnHuUjAhbZxHQmzp
 k4CePqv1YfM/jwsYn6pnBawOyAgaQDgm+g==
X-Google-Smtp-Source: AA6agR5ywOKobRYH3ALILjm6OVAXhqnDjaAJm+aTFSoNjCEDZup+1oH3t5bHziuWJL7AqMe84o0Whw==
X-Received: by 2002:a17:902:ca05:b0:16d:cf59:2aff with SMTP id
 w5-20020a170902ca0500b0016dcf592affmr5331930pld.105.1660327701038; 
 Fri, 12 Aug 2022 11:08:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 10/21] accel/tcg: Properly implement
 get_page_addr_code for user-only
Date: Fri, 12 Aug 2022 11:07:55 -0700
Message-Id: <20220812180806.2128593-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 85 ++++++++++++++---------------------------
 accel/tcg/cputlb.c      |  5 ---
 accel/tcg/user-exec.c   | 15 ++++++++
 3 files changed, 43 insertions(+), 62 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e7e30d55b8..9f35e3b7a9 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -595,43 +595,44 @@ struct MemoryRegionSection *iotlb_to_section(CPUState *cpu,
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
@@ -688,36 +689,6 @@ G_NORETURN void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
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
index 5db56bcd1e..80a3eb4f1c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1532,11 +1532,6 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
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


