Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A732B59158C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:39:48 +0200 (CEST)
Received: from localhost ([::1]:33834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZZT-00020r-PD
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ5C-0003bd-2t
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:30 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ56-0006Y6-Rd
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:29 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 q9-20020a17090a2dc900b001f58bcaca95so9019079pjm.3
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3ksd7LzYDwg4KZFpTxKEvut5zUiua6xn62cdmeCd4NI=;
 b=hV2AIM3RRflnLn+PdgCU6UbyhlqiQYkzpD59dLHapnA6zTozGnkUmOT3S/6OksRpos
 hpaA0j5cR2M1Nv1haTo7ZR1hijOmR3tApiws42AHnCd2w2x+Aph0ac0jWSjH6UXBEEre
 L8iUSZMy2a1KsAJ1NdoS0is+E5QO7WLQGbdox6nkwcvKnDI7bzFfZwmS0xBHYmFkjZQm
 b5deGlbgh5YPWNiXTKmicsYrAzr3T7OC+6dr71lsHpB+44P+P/4SRmJ2OdveVoYn+JUw
 4cfwVFRk9aujxvVdYQmnFXdDLofEkr0zQ1nic+8BZMsF5vuULo2alnhbS6MXQAi6Rllq
 D0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3ksd7LzYDwg4KZFpTxKEvut5zUiua6xn62cdmeCd4NI=;
 b=7qR2Ls6JD4KAR79LPXMJSMqZMaMyCL2cNveZZbmON31p+IvSZy6/9tDJDLujxPMeLy
 TXoZpEGtZaWyH10rKy7Wu4j29LHAi3sAXQGQxnwao1S9SB4+BJddu/cCnmwc09/7rWnw
 BNVvjTbxG0oYdkwldJ0DGmpjw6Wmdr+QDo+JGxuhPc+/Y1rW5jH9PZEkzh2kY7z0OgiP
 0nNiyav8PTk0uuFq35/ql9EuGKPWSuneau9rdbbGDJP1mfyt4ETLJHAq655rR59X+hXC
 BgLiStom9BwyLESJAJgndXHz0Wxj5YmAzq84NpLm/0JfWdCS8TiHsGFx4SYexRJ+LQD6
 oj2g==
X-Gm-Message-State: ACgBeo1TuTUUZ+8q7jhl13YDdb4lk4hKv9nfWtWWSnrRO5566kOFeVMP
 OjDd2dQJau/Ik6QYCLUJKTPnEw7R2KheKQ==
X-Google-Smtp-Source: AA6agR5ZyrDihXNqUy1WVyCpuCU8VMoYwQQdjrFtKFR5BSB4GiTUqrglEPCMmhTxuFLLXMZZIq5Huw==
X-Received: by 2002:a17:902:7c05:b0:16e:e96c:e91e with SMTP id
 x5-20020a1709027c0500b0016ee96ce91emr5176088pll.89.1660327703555; 
 Fri, 12 Aug 2022 11:08:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 12/21] accel/tcg: Add nofault parameter to
 get_page_addr_code_hostp
Date: Fri, 12 Aug 2022 11:07:57 -0700
Message-Id: <20220812180806.2128593-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


