Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF465A8F8E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:16:25 +0200 (CEST)
Received: from localhost ([::1]:45742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeR6-0007KR-NH
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4O-0005wW-Qr
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:02 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4J-0003G6-T3
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:54 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c7so14348646wrp.11
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=M8k7INWbeFTVJiul2ENAwHhs/2Kfd59wQP99Hj3ZwhA=;
 b=FHqQJ3KF+JOwafQ6KEIh6z7Kyj7ISkA2TPydJOp9I3W0rlq9DEXm/XA7FuCf2Ptdz+
 Tb8K9a6TGFAdRtrLvfnnQu1zcbeZjJRoXZDFBNUuad5KfsdMDH71QYj44mxvJd3uhyZy
 EfCXjfg1DIsOX3e/amKDTsKAGRaMufYJaU+cfZkVKnhDsd7H4wGQVIAAhHE9xPD3M1Or
 E8Vldsx4GVripCsi3a4WXWF49sTWklHKE1hF4KDiOqIEitHYmsvhYxYZSo9BWikgLTTz
 h19pRU7R45CMwN9NOvOTDLGowYNtidQdS28U5Mziq3lWnP+gNJlsCEGKOI7zx13vnEbM
 p7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=M8k7INWbeFTVJiul2ENAwHhs/2Kfd59wQP99Hj3ZwhA=;
 b=AwPLA2v2tPMp+Kbtj/emP5J+uPII6fEvMygMKTt6DJpiIkzAvXUIKjmcoc2s3hXWSj
 US/jdziEyCVlXtYas2+IBXqixeCln27dTIp5wNY8s7WDXwQTtzBx5nNJogZnld5ZYhV2
 wp9p/z8w8jbrqmPmZPmZvyzjunrkOpHiUhHZQHsJCxJ4lAhKNFQho7TcqPAkH+8zROjo
 AWHzku8QcQ4UxUCisU+BOEXnL9yu6Hmyff2+THUzbGCf679xjNHGq4gNsIe7s8atYXHe
 oYFIFzDChQoCasq9BIsoKh2r2p/tjFq4LbvyqgcjsNaaccJLGYh75luTQnSzKUnhGgeR
 nZmg==
X-Gm-Message-State: ACgBeo1JZTzjuprxkr2ziM17Q0U6kJFFNI5obWB8CfJ1F4zXq2XWHkH0
 Amum5tVHKU0SOzYLDJlMFdLUMy1qnI0DFBha
X-Google-Smtp-Source: AA6agR4upyhWD18SQfy0qNBORDA2E0wckyP3ztpgp0z9zXsKWLVPM/A2MbFkaxJ0ASQfiNtGdOzO6w==
X-Received: by 2002:a5d:424f:0:b0:226:d206:cd6e with SMTP id
 s15-20020a5d424f000000b00226d206cd6emr12870542wrr.554.1662015169351; 
 Wed, 31 Aug 2022 23:52:49 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 08/20] accel/tcg: Properly implement get_page_addr_code for
 user-only
Date: Thu,  1 Sep 2022 07:51:58 +0100
Message-Id: <20220901065210.117081-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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
 accel/tcg/user-exec.c   | 14 +++++++
 3 files changed, 42 insertions(+), 62 deletions(-)

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
index 20ada5472b..2bc4394b80 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -199,6 +199,20 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
+tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
+                                        void **hostp)
+{
+    int flags;
+
+    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, false, 0);
+    g_assert(flags == 0);
+
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


