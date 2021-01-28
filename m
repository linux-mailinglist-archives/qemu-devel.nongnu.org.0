Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196683068AF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 01:35:24 +0100 (CET)
Received: from localhost ([::1]:45660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4vHO-0001TT-K4
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 19:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4vEl-0007rF-Bo
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 19:32:39 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4vEj-0005Px-Oa
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 19:32:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id c128so3173190wme.2
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 16:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yynSOShwN9kYTyasc4+k8fP/Bg0LH0sQO2BWUJ68Bgc=;
 b=EOxvEYSyc71H1nqvxHzJXATcrCbyMZOEMynzWfGitn7i1idl08kvvxDrrGuAT9iLH2
 64seFAZHVLxY02toANzY9pZVzllUrBffZxYYAopD30Ki0/mHLN+JHyRKHUlw6fz1/yrb
 CN3P6oGNNFLhu5b3qKjqRh2gWmi4Wc5ZvXq3oj9mCrpHc1R2IKpSE4YKg7r8ZCgSm1P0
 eSfOdEzxPZMInkhRSIuYCjybwm4FVXzu0dvn2T1az6QWuys9iuKgQWSDEgM6nEE6zeer
 yY+0ytrOMABr4h67cDNWCixsW+sVtYMv50nF7SNPK1TGKfKs/a5u02HxLU0Hz4zudXGS
 /Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yynSOShwN9kYTyasc4+k8fP/Bg0LH0sQO2BWUJ68Bgc=;
 b=UC/T2PZJb5DxjyVCgR1GgxglpvECaEFVejp2QZQR/M9EJaSpULUjXSqg5fexff5dNG
 XXy0pyq+JO5mBrQO2f+a0wRuHyEewDH+ifTsLhOhdSdmIIGivnKfsnL+B1bQ5aU9+o76
 +romoY/DVqG49hrRM2mE/htVwastcYagh+/kLKzH9ImRtyCh4bHm/ujfeFYLhRMkDJ1v
 zwXQO1d6jqSUbq13Yl6+qPAGO/3xHLJPiFBoRRssPApxkl4q2+e1tqEu2vwkcdFDAauC
 drUWRcSqJmyZo4szc8F2Rzvl5AcrGgiJ7J9MA+xgXfNgq0BV+6xFDfncTtUIr+V3Qcaa
 /pcA==
X-Gm-Message-State: AOAM532SBAsAkKvN9T4Oc5A6ClyzKbhkq6peC9jFh8AclLu24WX2qKGE
 LmY7LNuh8aaKSM16f34bztMT5/FVrE0=
X-Google-Smtp-Source: ABdhPJzZa8lB8u/RHuGBoAT7KIlMYqXA745IC+4eY+QykPP16XC9qdr9AeN8Gr5dR35a59hRrnhmEA==
X-Received: by 2002:a1c:b68b:: with SMTP id g133mr6273446wmf.7.1611793956057; 
 Wed, 27 Jan 2021 16:32:36 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x1sm4248415wmi.14.2021.01.27.16.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 16:32:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/cris: Let cris_mmu_translate() use MMUAccessType
 access_type
Date: Thu, 28 Jan 2021 01:32:23 +0100
Message-Id: <20210128003223.3561108-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128003223.3561108-1-f4bug@amsat.org>
References: <20210128003223.3561108-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All callers of cris_mmu_translate() provide a MMUAccessType
type. Let the prototype use it as argument, as it is stricter
than an integer. We can remove the documentation as enum
names are self explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/cris/mmu.h |  2 +-
 target/cris/mmu.c | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/cris/mmu.h b/target/cris/mmu.h
index 9ab1642b964..d57386ec6cd 100644
--- a/target/cris/mmu.h
+++ b/target/cris/mmu.h
@@ -17,6 +17,6 @@ void cris_mmu_init(CPUCRISState *env);
 void cris_mmu_flush_pid(CPUCRISState *env, uint32_t pid);
 int cris_mmu_translate(struct cris_mmu_result *res,
                        CPUCRISState *env, uint32_t vaddr,
-                       int rw, int mmu_idx, int debug);
+                       MMUAccessType access_type, int mmu_idx, int debug);
 
 #endif
diff --git a/target/cris/mmu.c b/target/cris/mmu.c
index 294de7dffd5..b574ec6e5b9 100644
--- a/target/cris/mmu.c
+++ b/target/cris/mmu.c
@@ -129,10 +129,10 @@ static void dump_tlb(CPUCRISState *env, int mmu)
 }
 #endif
 
-/* rw 0 = read, 1 = write, 2 = exec.  */
 static int cris_mmu_translate_page(struct cris_mmu_result *res,
-				   CPUCRISState *env, uint32_t vaddr,
-				   int rw, int usermode, int debug)
+                                   CPUCRISState *env, uint32_t vaddr,
+                                   MMUAccessType access_type,
+                                   int usermode, int debug)
 {
     unsigned int vpage;
     unsigned int idx;
@@ -151,7 +151,7 @@ static int cris_mmu_translate_page(struct cris_mmu_result *res,
     r_cfg = env->sregs[SFR_RW_MM_CFG];
     pid = env->pregs[PR_PID] & 0xff;
 
-    switch (rw) {
+    switch (access_type) {
     case MMU_INST_FETCH:
         rwcause = CRIS_MMU_ERR_EXEC;
         mmu = 0;
@@ -219,13 +219,13 @@ static int cris_mmu_translate_page(struct cris_mmu_result *res,
                      vaddr, lo, env->pc));
             match = 0;
             res->bf_vec = vect_base + 2;
-        } else if (rw == MMU_DATA_STORE && cfg_w && !tlb_w) {
+        } else if (access_type == MMU_DATA_STORE && cfg_w && !tlb_w) {
             D(printf("tlb: write protected %x lo=%x pc=%x\n",
                      vaddr, lo, env->pc));
             match = 0;
             /* write accesses never go through the I mmu.  */
             res->bf_vec = vect_base + 3;
-        } else if (rw == MMU_INST_FETCH && cfg_x && !tlb_x) {
+        } else if (access_type == MMU_INST_FETCH && cfg_x && !tlb_x) {
             D(printf("tlb: exec protected %x lo=%x pc=%x\n",
                      vaddr, lo, env->pc));
             match = 0;
@@ -272,9 +272,9 @@ static int cris_mmu_translate_page(struct cris_mmu_result *res,
         D(printf("refill vaddr=%x pc=%x\n", vaddr, env->pc));
     }
 
-    D(printf("%s rw=%d mtch=%d pc=%x va=%x vpn=%x tlbvpn=%x pfn=%x pid=%x"
+    D(printf("%s access=%u mtch=%d pc=%x va=%x vpn=%x tlbvpn=%x pfn=%x pid=%x"
              " %x cause=%x sel=%x sp=%x %x %x\n",
-             __func__, rw, match, env->pc,
+             __func__, access_type, match, env->pc,
              vaddr, vpage,
              tlb_vpn, tlb_pfn, tlb_pid,
              pid,
@@ -319,8 +319,8 @@ void cris_mmu_flush_pid(CPUCRISState *env, uint32_t pid)
 }
 
 int cris_mmu_translate(struct cris_mmu_result *res,
-		       CPUCRISState *env, uint32_t vaddr,
-		       int rw, int mmu_idx, int debug)
+                       CPUCRISState *env, uint32_t vaddr,
+                       MMUAccessType access_type, int mmu_idx, int debug)
 {
     int seg;
     int miss = 0;
@@ -329,7 +329,7 @@ int cris_mmu_translate(struct cris_mmu_result *res,
 
     old_srs = env->pregs[PR_SRS];
 
-    env->pregs[PR_SRS] = rw == MMU_INST_FETCH ? 1 : 2;
+    env->pregs[PR_SRS] = access_type == MMU_INST_FETCH ? 1 : 2;
 
     if (!cris_mmu_enabled(env->sregs[SFR_RW_GC_CFG])) {
         res->phy = vaddr;
@@ -346,7 +346,7 @@ int cris_mmu_translate(struct cris_mmu_result *res,
         res->phy = base | (0x0fffffff & vaddr);
         res->prot = PAGE_BITS;
     } else {
-        miss = cris_mmu_translate_page(res, env, vaddr, rw,
+        miss = cris_mmu_translate_page(res, env, vaddr, access_type,
                                        is_user, debug);
     }
  done:
-- 
2.26.2


