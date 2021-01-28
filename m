Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE543068AC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 01:33:50 +0100 (CET)
Received: from localhost ([::1]:42538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4vFt-0000C9-IJ
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 19:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4vEf-0007hQ-Un
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 19:32:34 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4vEe-0005Pc-Cj
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 19:32:33 -0500
Received: by mail-wm1-x329.google.com with SMTP id c127so3159823wmf.5
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 16:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOrjCu/dik44rI4Ge8eVp4+/I8vK1Mod6NSjpLVJ5tA=;
 b=ekBd8a6OPcWilY1i8GFNlj27POCgBjQ7gG+TwHZ/HiG65leTzjeWDWyH/loIrVJ1zE
 TYOtwSa1fjg5oXdR9cHiVUBfjrcD5mtCgiPjf1x3zPEA9BgFvjk7ff/FqBvyDQJBJquU
 Yak83OBMNdUr5lkWOTzIJ0q/a/7N8uHrVN31kUpxDvJed4XREbpaCsyt5moZbG2Qp56K
 L3CpxW6yXTVCnHiB9+QKSQr2/16/xZ6IqI0S2CcWyUaGsh/010zllaCWRdC47c18HWJK
 b81FwSBcU7UBYb6pR8XKeQCR62AU5rz4S5MrmYtrB6qUSCCduL+lcXPvoxSNy2yv+eMn
 N/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KOrjCu/dik44rI4Ge8eVp4+/I8vK1Mod6NSjpLVJ5tA=;
 b=XVNcXDrm01HJkM2Bbx0cInl4LtUYldQfQSmi+Pt0Eq+TlcNvIT96B0znt0DMHK+ENX
 jyzDQwpmIZcgL+ZwYBwBBIKfh1plBp3QeEMcRckAbpqusmE8GK3fDCI1IBj6q0PYaA/9
 1kpKgr3JULBY6sjl0edC+pMen2mrW/lrbgN0c/0EOhY3rWRIskV0MxnN6/cIf19lseWz
 r7cXejbyJgVt7DI+cZeTqeKR44EqFbExOFlMKyERwOuam23YsNRgtO9Jzh6Jxqa0uYNg
 /yjnQAXUIUZlyvXt3zNV07rOz+DfrIvcykG5K+8RVhKLTqD1svr9QrtTrtIS8JA0P0WZ
 LXqQ==
X-Gm-Message-State: AOAM530Wjnhqlu7Y7aRvvj6xWjtmeupYOTWR1QFo7SqUO+3rKjmKBHO9
 LQ7WSBIJNumBKdNXI188Y0fqELg/mm0=
X-Google-Smtp-Source: ABdhPJwcIKSimdke07yRjsXKN+kiL8siLzWVK5murHOhzrHEs5c7W64lhxPNhUgVU5d0zsf4cX1Lng==
X-Received: by 2002:a1c:4b14:: with SMTP id y20mr6439561wma.166.1611793950854; 
 Wed, 27 Jan 2021 16:32:30 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p18sm59605wrx.84.2021.01.27.16.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 16:32:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/cris: Use MMUAccessType enum type when possible
Date: Thu, 28 Jan 2021 01:32:22 +0100
Message-Id: <20210128003223.3561108-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128003223.3561108-1-f4bug@amsat.org>
References: <20210128003223.3561108-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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

Replace the 0/1/2 magic values by the corresponding MMUAccessType.
We can remove a comment as enum names are self explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/cris/helper.c |  4 ++--
 target/cris/mmu.c    | 13 ++++++-------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/cris/helper.c b/target/cris/helper.c
index ed45c3d9b70..cc110f1154d 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -274,10 +274,10 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     struct cris_mmu_result res;
     int miss;
 
-    miss = cris_mmu_translate(&res, &cpu->env, addr, 0, 0, 1);
+    miss = cris_mmu_translate(&res, &cpu->env, addr, MMU_DATA_LOAD, 0, 1);
     /* If D TLB misses, try I TLB.  */
     if (miss) {
-        miss = cris_mmu_translate(&res, &cpu->env, addr, 2, 0, 1);
+        miss = cris_mmu_translate(&res, &cpu->env, addr, MMU_INST_FETCH, 0, 1);
     }
 
     if (!miss) {
diff --git a/target/cris/mmu.c b/target/cris/mmu.c
index a279b7f1b60..294de7dffd5 100644
--- a/target/cris/mmu.c
+++ b/target/cris/mmu.c
@@ -152,15 +152,15 @@ static int cris_mmu_translate_page(struct cris_mmu_result *res,
     pid = env->pregs[PR_PID] & 0xff;
 
     switch (rw) {
-    case 2:
+    case MMU_INST_FETCH:
         rwcause = CRIS_MMU_ERR_EXEC;
         mmu = 0;
         break;
-    case 1:
+    case MMU_DATA_STORE:
         rwcause = CRIS_MMU_ERR_WRITE;
         break;
     default:
-    case 0:
+    case MMU_DATA_LOAD:
         rwcause = CRIS_MMU_ERR_READ;
         break;
     }
@@ -219,13 +219,13 @@ static int cris_mmu_translate_page(struct cris_mmu_result *res,
                      vaddr, lo, env->pc));
             match = 0;
             res->bf_vec = vect_base + 2;
-        } else if (rw == 1 && cfg_w && !tlb_w) {
+        } else if (rw == MMU_DATA_STORE && cfg_w && !tlb_w) {
             D(printf("tlb: write protected %x lo=%x pc=%x\n",
                      vaddr, lo, env->pc));
             match = 0;
             /* write accesses never go through the I mmu.  */
             res->bf_vec = vect_base + 3;
-        } else if (rw == 2 && cfg_x && !tlb_x) {
+        } else if (rw == MMU_INST_FETCH && cfg_x && !tlb_x) {
             D(printf("tlb: exec protected %x lo=%x pc=%x\n",
                      vaddr, lo, env->pc));
             match = 0;
@@ -329,8 +329,7 @@ int cris_mmu_translate(struct cris_mmu_result *res,
 
     old_srs = env->pregs[PR_SRS];
 
-    /* rw == 2 means exec, map the access to the insn mmu.  */
-    env->pregs[PR_SRS] = rw == 2 ? 1 : 2;
+    env->pregs[PR_SRS] = rw == MMU_INST_FETCH ? 1 : 2;
 
     if (!cris_mmu_enabled(env->sregs[SFR_RW_GC_CFG])) {
         res->phy = vaddr;
-- 
2.26.2


