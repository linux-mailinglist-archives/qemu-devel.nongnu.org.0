Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB06321218
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:37:18 +0100 (CET)
Received: from localhost ([::1]:49272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6iT-0008S8-It
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lE6ev-00022a-2C
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:33:37 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:35365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lE6en-0000uE-Fx
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:33:36 -0500
Received: by mail-lj1-x236.google.com with SMTP id a17so55613314ljq.2
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 00:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+U92T4eMBXtrkCsAYObLV+LYZ+qNL+2eIrn1UY51cEs=;
 b=mt7JL+N64AQtSukg0/DsutGaAa2quCOQD9G9jKphosOlfXo43kl6ySHhkHtpqp5lL4
 yszotH22aKZdeNT1z2Mb9ZxwFI6CQn3aHS6pLqd/rbWGBDzgmEIgySglqm66iOeOnnGP
 gczRhxPxAQuPManRrf2yjz+d1n3aeZsBE73KI+iurP5TKg5RqthKq+OubqLFnktkVtxF
 I85eqptQyLzfNpI4OtI01aJPU1rARH9RL+5lqSXfS5tsw2X7he0BIBU31iWvUDn+wU2g
 y7/dizpzdaJoEu8fxZWHF3j7SjhUsGb11lbWBS8twjdBy9qvkOWLa6QeaESWyDkb2SVz
 bEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+U92T4eMBXtrkCsAYObLV+LYZ+qNL+2eIrn1UY51cEs=;
 b=bb81hSrHQHbprmAuqNnRgHQqyF+PPDKtTY93OhxjD/+A+0v0pSCcPxXYmstSQuOZ2q
 pt679I9C3ciabbqr0ZhWCuXdljT9G/o1mOmY3PklLOvJV23qHn/DCE8IushxtnlVrws0
 1UETdFZUuo9ULSF/R/lt4xe+hMqb5IYAU1sCEDSAKTBfTJ/WNbIHBuMKTXcI487uSotf
 5DghAp/eRl1zutmLtnhqZPMLwuZOf4dltV+nDEaeioCIZ5k02LVCQKwzT11n52SuL32/
 d35StQQdZzefRiEDd1bzV8WBl3AelKwtcosHXbCg0jNPciv7wm3j0nP9jS27Ko9XhmkQ
 S3hw==
X-Gm-Message-State: AOAM5310fdOIQlOfFPAGdLvKCi8GPf5YJpEHCoeOSuIHab15c54Ng7YN
 043BR7ABxaEpK5OoRsOOoDSJzeRlVSx9lQ==
X-Google-Smtp-Source: ABdhPJwW8g7hz8c1vrgk5R7GUW1N4Qbm9v0EhJGlUA1f4NSyxa1KJ0aFnxn9NGuRl2UBCNDN3I25kw==
X-Received: by 2002:a2e:9903:: with SMTP id v3mr4257753lji.409.1613982807695; 
 Mon, 22 Feb 2021 00:33:27 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id f13sm2036378ljo.39.2021.02.22.00.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 00:33:27 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 2/3] target/cris: Let cris_mmu_translate() use MMUAccessType
 access_type
Date: Mon, 22 Feb 2021 09:33:23 +0100
Message-Id: <20210222083324.331908-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222083324.331908-1-edgar.iglesias@gmail.com>
References: <20210222083324.331908-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, f4bug@amsat.org,
 stefans@axis.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

All callers of cris_mmu_translate() provide a MMUAccessType
type. Let the prototype use it as argument, as it is stricter
than an integer. We can remove the documentation as enum
names are self explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-Id: <20210128003223.3561108-3-f4bug@amsat.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/cris/mmu.h |  2 +-
 target/cris/mmu.c | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/cris/mmu.h b/target/cris/mmu.h
index 9ab1642b96..d57386ec6c 100644
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
index 294de7dffd..b574ec6e5b 100644
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
2.25.1


