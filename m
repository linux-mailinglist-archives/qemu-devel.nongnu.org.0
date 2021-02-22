Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FEE321216
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:36:00 +0100 (CET)
Received: from localhost ([::1]:42290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6hD-0005Hc-45
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lE6eu-000222-NA
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:33:36 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:44667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lE6en-0000tI-Fg
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:33:36 -0500
Received: by mail-lj1-x232.google.com with SMTP id o16so50937478ljj.11
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 00:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pL6PS6Y/n0IqcP+rWQ6sckSkexCo41onRq00Z5SNgCY=;
 b=ry1uvHMOWfu5flHf7EQ9MQB8wDyPapjBckCW+s3fh2dc/U8H9Zr8uMkIJAOVapCwUb
 lJAnj/JDQ7OdEyqOkkSVn2+/WMXeTotxEzao+yythThMqrBhixNgNCxxWrsk4QcpG+Zb
 czHPizFhJgDnDwNmnsQ3qe/CBM0ZZMGae8O0Yx20vqICgWhrSa9+uGeTzPqEIL9Oz5zK
 IY+Q6Hh5Pqagd7ldJIWNlNYMlUyfwPDPrzUKht/B1hq1gkCiM82g0OQmKDRYmfoypz8t
 hFNpdvC4F7JhatWDtJURQ+7AkVHGj/4+TfQYw+OU53vIetWygdHsThB8+mUVUzpvtrBy
 RP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pL6PS6Y/n0IqcP+rWQ6sckSkexCo41onRq00Z5SNgCY=;
 b=DH0CNoKgbDZzckKGvXeVevIKu/ZcRqr09pF8AwpIj3gsZEmDqqGeQsZdATi21nRxKN
 UA+Kfhap/m7Te23wejEJ6tQTsaFuMUGV13IQsAa/YqGuyVUesUBBYz9qhyw538krwGW3
 ytEkDzy07iX/51kWL9dBafx63vq+3TRfwMrzaHvjdmvTsk+hC1IO8Gdj3AofEg5uXhjh
 Rxi6ezADCRFJ5nEQkyLO4Lw+OaolyqX6Tb/TWDyf//2mwc4qc3qo4gRRbedAnXCLOaD9
 rNOqWd3Lx/9M98WN06PNIpMljVGfqf5YS4BwU/77e2llZpf/v47Mu6sBanDNjH0Qg5LT
 x9fw==
X-Gm-Message-State: AOAM5328P9JqYCaIICXBpmMJPA1elMUzqzKvNY5ZH2eXijRtD7qdpYcl
 vV2EMDw4k9h86qry1KR86U7svfDsNEvLEg==
X-Google-Smtp-Source: ABdhPJwhdktdGU3jz2Or5A9IAcxSi+kySAXgGmOSKfY6PPdWEjIb91nTjmUaUsVc4ksY4x31eMztew==
X-Received: by 2002:a05:651c:54a:: with SMTP id
 q10mr13359512ljp.454.1613982806786; 
 Mon, 22 Feb 2021 00:33:26 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id a30sm1833344lfo.56.2021.02.22.00.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 00:33:26 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 1/3] target/cris: Use MMUAccessType enum type when possible
Date: Mon, 22 Feb 2021 09:33:22 +0100
Message-Id: <20210222083324.331908-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222083324.331908-1-edgar.iglesias@gmail.com>
References: <20210222083324.331908-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x232.google.com
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

Replace the 0/1/2 magic values by the corresponding MMUAccessType.
We can remove a comment as enum names are self explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-Id: <20210128003223.3561108-2-f4bug@amsat.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/cris/helper.c |  4 ++--
 target/cris/mmu.c    | 13 ++++++-------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/cris/helper.c b/target/cris/helper.c
index 7e3bb58fe1..911867f3b4 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -275,10 +275,10 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
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
index a279b7f1b6..294de7dffd 100644
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
2.25.1


