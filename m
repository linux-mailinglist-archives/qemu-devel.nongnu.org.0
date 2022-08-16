Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C115963DA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 22:43:16 +0200 (CEST)
Received: from localhost ([::1]:40800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3PA-0002Hj-03
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 16:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Go-0004pC-NP
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:38 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:47094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Gl-0004U1-0A
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:37 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1168e046c85so12927625fac.13
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3ksd7LzYDwg4KZFpTxKEvut5zUiua6xn62cdmeCd4NI=;
 b=Xe9/AQOJQcDrIkOLYznYz6OyhBfMxzNRT/L7VHVGO0UzygcWPY8sF5Os3EjhNnUu7K
 MjD9NjImtaa37lMEPyYzruSlTBcyA6SkjjHUsmD32+1o6MwGEFV6C/T1WKUeK6yf1RWk
 E5q4Kq4QF7az/AGSoXjSa46Km051+7Xl00Zeh9df+Hc/bnRycLliEB2E4E2/O0MdTokw
 wD9JWyEGpTr3XR+UwJxCcS0siIxn9Amplc4zMdxbT96+L9cnaZEcwZzU9CHk8vpBMqKE
 G2IZbT/5rkX5I8IexV4koPv89fpQ/JC66eYqvZ0swik2R52Itd05EGbwd2SXiScqVD2k
 bX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3ksd7LzYDwg4KZFpTxKEvut5zUiua6xn62cdmeCd4NI=;
 b=uONE3sJetm6XoW6kPrbRe692wRAAttfEX3gh7TiBtmWPaxFvXI8hN07anglhsn2XQo
 Z6gUbMXj27pcHz65W9FrGwbAVTu8EAJjzQUYF850WnbJjlrIMevPl3pQvnk7wgdu7b6Y
 ZqYR3t+9BJjP0wgdWkZMjoSEj+TpNWGcA+NYDZS0LYJaFvH/VUv7EcH1zNHjDSDfLD71
 v2Z7bzvLnEq+GrYG9wHE8vmEExzw4LtZxCftHt2+9sOJYSjGg36S6fMZW5UDk5AjTNjw
 2P2zr44ThTmE2zfuTEaCjpR/XYy4hh3LETJRKQ56M0eGU1QQCjy31vQCq75s0fZAt7Cd
 m6JQ==
X-Gm-Message-State: ACgBeo0AafjDeyCYWI3hnNFrWltoD1pglfaehCT8LSWQ35UBnPAzSj+b
 +o8tD2F6SX+BTrCiqBGCng7TkU+f+lzrDg==
X-Google-Smtp-Source: AA6agR7ycAVYd6pHVH1FBpQX1vmLrna6Z9X+/vXpR8C3fmBBiL+kNoyX0wz34woyeLhnBjSOCS/RdA==
X-Received: by 2002:a05:6870:1485:b0:11c:46b6:7b81 with SMTP id
 k5-20020a056870148500b0011c46b67b81mr126823oab.233.1660682074216; 
 Tue, 16 Aug 2022 13:34:34 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 12/33] accel/tcg: Add nofault parameter to
 get_page_addr_code_hostp
Date: Tue, 16 Aug 2022 15:33:39 -0500
Message-Id: <20220816203400.161187-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 10 +++++-----
 accel/tcg/cputlb.c      |  8 ++++----
 accel/tcg/plugin-gen.c  |  4 ++--
 accel/tcg/user-exec.c   |  4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9f35e3b7a9..7a6dc44d86 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -599,6 +599,8 @@ struct MemoryRegionSection *iotlb_to_section(CPUState *cpu,
  * get_page_addr_code_hostp()
  * @env: CPUArchState
  * @addr: guest virtual address of guest code
+ * @nofault: do not raise an exception
+ * @hostp: output for host pointer
  *
  * See get_page_addr_code() (full-system version) for documentation on the
  * return value.
@@ -607,10 +609,10 @@ struct MemoryRegionSection *iotlb_to_section(CPUState *cpu,
  * If the return value is -1, sets *@hostp to NULL. Otherwise, sets *@hostp
  * to the host address where @addr's content is kept.
  *
- * Note: this function can trigger an exception.
+ * Note: Unless @nofault, this function can trigger an exception.
  */
 tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
-                                        void **hostp);
+                                        bool nofault, void **hostp);
 
 /**
  * get_page_addr_code()
@@ -620,13 +622,11 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
  * If we cannot translate and execute from the entire RAM page, or if
  * the region is not backed by RAM, returns -1. Otherwise, returns the
  * ram_addr_t corresponding to the guest code at @addr.
- *
- * Note: this function can trigger an exception.
  */
 static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
                                                 target_ulong addr)
 {
-    return get_page_addr_code_hostp(env, addr, NULL);
+    return get_page_addr_code_hostp(env, addr, true, NULL);
 }
 
 #if defined(CONFIG_USER_ONLY)
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 2dc2affa12..ae7b40dd51 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1644,16 +1644,16 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
  * of RAM.  This will force us to execute by loading and translating
  * one insn at a time, without caching.
  *
- * NOTE: This function will trigger an exception if the page is
- * not executable.
+ * NOTE: Unless @nofault, this function will trigger an exception
+ * if the page is not executable.
  */
 tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
-                                        void **hostp)
+                                        bool nofault, void **hostp)
 {
     void *p;
 
     (void)probe_access_internal(env, addr, 1, MMU_INST_FETCH,
-                                cpu_mmu_index(env, true), true, &p, 0);
+                                cpu_mmu_index(env, true), nofault, &p, 0);
     if (p == NULL) {
         return -1;
     }
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 3d0b101e34..8377c15383 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -872,7 +872,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool mem_onl
 
         ptb->vaddr = tb->pc;
         ptb->vaddr2 = -1;
-        get_page_addr_code_hostp(cpu->env_ptr, tb->pc, &ptb->haddr1);
+        get_page_addr_code_hostp(cpu->env_ptr, tb->pc, true, &ptb->haddr1);
         ptb->haddr2 = NULL;
         ptb->mem_only = mem_only;
 
@@ -902,7 +902,7 @@ void plugin_gen_insn_start(CPUState *cpu, const DisasContextBase *db)
         unlikely((db->pc_next & TARGET_PAGE_MASK) !=
                  (db->pc_first & TARGET_PAGE_MASK))) {
         get_page_addr_code_hostp(cpu->env_ptr, db->pc_next,
-                                 &ptb->haddr2);
+                                 true, &ptb->haddr2);
         ptb->vaddr2 = db->pc_next;
     }
     if (likely(ptb->vaddr2 == -1)) {
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a20234fb02..1b3403a064 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -200,11 +200,11 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
 }
 
 tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
-                                        void **hostp)
+                                        bool nofault, void **hostp)
 {
     int flags;
 
-    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, true, 0);
+    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, nofault, 0);
     if (unlikely(flags)) {
         return -1;
     }
-- 
2.34.1


