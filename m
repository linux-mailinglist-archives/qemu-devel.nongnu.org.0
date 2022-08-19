Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CB7599394
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:39:17 +0200 (CEST)
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsqq-0007EB-Sf
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseZ-00020s-PP
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:35 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseY-0002ld-1v
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:35 -0400
Received: by mail-pg1-x531.google.com with SMTP id s206so2772724pgs.3
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=f/BmtYXHXXDyvRAaPO8I+i1wpfPbVTFf5Oe//TMPEv0=;
 b=EFbonJP8GXaTFymqq/dBXyPHBFsW3rdXW3JVGrYyGNQNOHaSd+mO7qFkCQEnFZtOsJ
 uNzaAVQrSQbAizPQDVID6/Htl1/9jVtmFJwxMVm+pwbwzkBLvvghBQIxuExoNfzJvg9I
 gelxhCvyF/XEH+Nuj+neG0yuFrNwcxVmVx6yLZFaPawoDwF/ZjDiiM7TGywRkJs10z6t
 /Qk7qEc8TV0Kme31IRuOPvM029TSADXle6N797ip7kFEyUhADxgOVbJLPCrOJR0yc2fx
 ggAvI2VbeBX+5MPfqh9PsrQqJX+JKhVE4zY+azOgYBTMW920LfQCsoT5jb8D+B2lpZIA
 nxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=f/BmtYXHXXDyvRAaPO8I+i1wpfPbVTFf5Oe//TMPEv0=;
 b=Xy4tWGW+es1WdhRg0PGPLoKswn0HRoF0GoEtp5fQ3FEvWCknwUmGdT5gC3ggr2UiOx
 UNudgG0ykiTH3WK6138sH+JaIeE44dAKHmvcX2yc/uiEJIZkGZUSzqoumJNU6/gjVyWU
 JExqNOGXM+YWj+jZ1vu5AJpcaJ8+5Esj5BQB/xm8PbPblGuJNe0Q4laARjr2EIOCZKZE
 MT2bqnrxAowTgviaTcsVUP74XK2XaZ0hs/l/c4TFMyRwybof+IXWk2djK0PpuMExUZaG
 AG+0vClrAV9n9sNweVc7L4ChW+ukNmbGYcE2roAAS8AOoSXigwdpIw/eMycvPG9cPp6F
 n6Mg==
X-Gm-Message-State: ACgBeo3iyZNlVFJ0VQwyMH/eRYF+q6aCG+FLXZIbvKZTnV0XuRguqBHZ
 24oEWDrOEpc9KSEAg1uwelsQw5hPXyo6hg==
X-Google-Smtp-Source: AA6agR7vnGS8AQmJL4yDaNuuODKE1ruC2iE5TJciEYaQvp0nEMcQozgCN34iWz3WWJk2WNQORaJ2cg==
X-Received: by 2002:a63:2ac4:0:b0:41d:95d8:45b6 with SMTP id
 q187-20020a632ac4000000b0041d95d845b6mr4856264pgq.132.1660879591721; 
 Thu, 18 Aug 2022 20:26:31 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 13/21] accel/tcg: Add nofault parameter to
 get_page_addr_code_hostp
Date: Thu, 18 Aug 2022 20:26:07 -0700
Message-Id: <20220819032615.884847-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
index 58edd33896..e7fec960c2 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -197,11 +197,11 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
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


