Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBA72D0828
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:43:42 +0100 (CET)
Received: from localhost ([::1]:44932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3gr-0007rL-Jc
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3eN-00065U-4M
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:07 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3eL-0007x1-FT
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:06 -0500
Received: by mail-wm1-x344.google.com with SMTP id a6so10029940wmc.2
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9BTcPOXtMinT5k5T7nbhCeBg4W/whtqBwxpgGRzVoyY=;
 b=p1ImZNoX4v6fBw9lo2pGVP8nMu+w46ELoCV73YAIp/1d9sIVbh1woMrH1j3snMxYEA
 wy0gU0kXFYAdYRyTIKgugP2PLQPbtwznDcum4hVGcexRqYkHTz93hfKB3CveJeUwSq7R
 tZGFvjompEjCuuRkBug4qH0MUMqZYwozVdTNnf9SDNgPQHXKz0TN2XbnfrcEjpemBsmg
 jAF4toEcpyobeg7ideT76ByL6fNJWs1HCPhgRrtJmd2aVf28aftuEqBKCGoFkfrQf9GV
 xOOEa3yct3SlohOo70dj3INCCbJknj5kl0dy2U+XtMqQZcrP6C1PMRpiHgJLc+T9xIgg
 MPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9BTcPOXtMinT5k5T7nbhCeBg4W/whtqBwxpgGRzVoyY=;
 b=APn6WOUhCm//KnpnMRuHQ9MEXYpZ+ryLQRNu7xlvcYxjjBYKLTWPGJAEiIh9RoHHqO
 CSmTHjUFlp9cxMN+0uJEPBOTh8u5SfMJn/vz6v+dgaWJK/evapiHX2eRo06/ov/01F2I
 3o5zUO6M+UVn1miKIelgF+G/2gEgj0e5FVsRAQU073rOJM/HRBSW6wJNbbRLFQiWFMvr
 5q3v6MuYFtsS9vGbDMrXErRZVGJYA4amYZeQpuD1U0tPI4/Sa1+GQArpOsGlNFnnrkZu
 7cXwatzOL2Zh+ZWKruhikpevHSaa9PaWUxDfp0UQvjvQlGz++m9BcGdDJV9obYEF/15p
 VQdg==
X-Gm-Message-State: AOAM530+2+r/2yrrrtoaDiVU3d9Yu24mdr3qi4H3+yg+FNKc5NYe+09b
 fsLu873MbAP3bJUdhu6m3wZs9AoUeqs=
X-Google-Smtp-Source: ABdhPJyVKaO41xs/ZdGIjNsXWgL4LX7SEpCdFwq82VDdLgPrMv5YbGnDkrWWhrqsb65YgsYipg8XQw==
X-Received: by 2002:a1c:43c6:: with SMTP id q189mr15741827wma.7.1607298063900; 
 Sun, 06 Dec 2020 15:41:03 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z64sm8420316wme.10.2020.12.06.15.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:41:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/19] target/mips: Move mmu_init() functions to tlb_helper.c
Date: Mon,  7 Dec 2020 00:39:44 +0100
Message-Id: <20201206233949.3783184-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h           |  1 +
 target/mips/tlb_helper.c         | 46 ++++++++++++++++++++++++++++++
 target/mips/translate_init.c.inc | 48 --------------------------------
 3 files changed, 47 insertions(+), 48 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 76b7a85cbb3..142fa3e5007 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -218,6 +218,7 @@ void cpu_mips_start_count(CPUMIPSState *env);
 void cpu_mips_stop_count(CPUMIPSState *env);
 
 /* helper.c */
+void mmu_init(CPUMIPSState *env, const mips_def_t *def);
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 7022be13ae4..366cc526a14 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -120,6 +120,52 @@ int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
     return TLBRET_NOMATCH;
 }
 
+static void no_mmu_init(CPUMIPSState *env, const mips_def_t *def)
+{
+    env->tlb->nb_tlb = 1;
+    env->tlb->map_address = &no_mmu_map_address;
+}
+
+static void fixed_mmu_init(CPUMIPSState *env, const mips_def_t *def)
+{
+    env->tlb->nb_tlb = 1;
+    env->tlb->map_address = &fixed_mmu_map_address;
+}
+
+static void r4k_mmu_init(CPUMIPSState *env, const mips_def_t *def)
+{
+    env->tlb->nb_tlb = 1 + ((def->CP0_Config1 >> CP0C1_MMU) & 63);
+    env->tlb->map_address = &r4k_map_address;
+    env->tlb->helper_tlbwi = r4k_helper_tlbwi;
+    env->tlb->helper_tlbwr = r4k_helper_tlbwr;
+    env->tlb->helper_tlbp = r4k_helper_tlbp;
+    env->tlb->helper_tlbr = r4k_helper_tlbr;
+    env->tlb->helper_tlbinv = r4k_helper_tlbinv;
+    env->tlb->helper_tlbinvf = r4k_helper_tlbinvf;
+}
+
+void mmu_init(CPUMIPSState *env, const mips_def_t *def)
+{
+    env->tlb = g_malloc0(sizeof(CPUMIPSTLBContext));
+
+    switch (def->mmu_type) {
+    case MMU_TYPE_NONE:
+        no_mmu_init(env, def);
+        break;
+    case MMU_TYPE_R4000:
+        r4k_mmu_init(env, def);
+        break;
+    case MMU_TYPE_FMT:
+        fixed_mmu_init(env, def);
+        break;
+    case MMU_TYPE_R3000:
+    case MMU_TYPE_R6000:
+    case MMU_TYPE_R8000:
+    default:
+        cpu_abort(env_cpu(env), "MMU type not supported\n");
+    }
+}
+
 static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
 {
     /*
diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index 535b52b5444..f3daf451a63 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -931,54 +931,6 @@ void mips_cpu_list(void)
     }
 }
 
-#ifndef CONFIG_USER_ONLY
-static void no_mmu_init(CPUMIPSState *env, const mips_def_t *def)
-{
-    env->tlb->nb_tlb = 1;
-    env->tlb->map_address = &no_mmu_map_address;
-}
-
-static void fixed_mmu_init(CPUMIPSState *env, const mips_def_t *def)
-{
-    env->tlb->nb_tlb = 1;
-    env->tlb->map_address = &fixed_mmu_map_address;
-}
-
-static void r4k_mmu_init(CPUMIPSState *env, const mips_def_t *def)
-{
-    env->tlb->nb_tlb = 1 + ((def->CP0_Config1 >> CP0C1_MMU) & 63);
-    env->tlb->map_address = &r4k_map_address;
-    env->tlb->helper_tlbwi = r4k_helper_tlbwi;
-    env->tlb->helper_tlbwr = r4k_helper_tlbwr;
-    env->tlb->helper_tlbp = r4k_helper_tlbp;
-    env->tlb->helper_tlbr = r4k_helper_tlbr;
-    env->tlb->helper_tlbinv = r4k_helper_tlbinv;
-    env->tlb->helper_tlbinvf = r4k_helper_tlbinvf;
-}
-
-static void mmu_init(CPUMIPSState *env, const mips_def_t *def)
-{
-    env->tlb = g_malloc0(sizeof(CPUMIPSTLBContext));
-
-    switch (def->mmu_type) {
-    case MMU_TYPE_NONE:
-        no_mmu_init(env, def);
-        break;
-    case MMU_TYPE_R4000:
-        r4k_mmu_init(env, def);
-        break;
-    case MMU_TYPE_FMT:
-        fixed_mmu_init(env, def);
-        break;
-    case MMU_TYPE_R3000:
-    case MMU_TYPE_R6000:
-    case MMU_TYPE_R8000:
-    default:
-        cpu_abort(env_cpu(env), "MMU type not supported\n");
-    }
-}
-#endif /* CONFIG_USER_ONLY */
-
 static void fpu_init (CPUMIPSState *env, const mips_def_t *def)
 {
     int i;
-- 
2.26.2


