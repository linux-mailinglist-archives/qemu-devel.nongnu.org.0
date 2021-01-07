Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48EC2EE8F9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:44:07 +0100 (CET)
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxe0k-00032R-Ja
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdiU-0000nJ-J9
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:14 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdiS-0005P2-Sa
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:14 -0500
Received: by mail-wm1-x32e.google.com with SMTP id q75so6840170wme.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6XvVGZx0cqMA0IbQkfNJyPnGsDJniknsO06wunE5/50=;
 b=ezh6a3ocDKcM3HI5iUhq5PBvcWgBK6BAd72QFsj39sGkwnDwvhQdaV5iJJgPxAbjgX
 HnDcp6QHSFr30gEXPigbeRotkjQuy+0x8yOxLQ+vSo7KwCR7kcawa3OOwDFLNLFiQ44X
 BNy8P/+0lKH8gGfuIlLWIBfbOsJFq2sJ3VOpq7huvycAOEukEStVh/ubgtZGZ5jNbFfP
 Kyk5mLSLM7owCBRrzDqeG2CgEsfggdFBXljf7DHJcCLc7d1jGPgej3V3ytbunLn2HZOT
 sWiQ7n6nPysUeqkZwkoDKbfj/3BgMba1pTJuxNLCZKjm9XBbrgi3ckpUkz33L1/W8Jsx
 xF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6XvVGZx0cqMA0IbQkfNJyPnGsDJniknsO06wunE5/50=;
 b=j9jYRHN+YE4QgujGEK5oQc9Vqo/i6RAhUHD0PhW3AUG+q/jGs/41nhsMArF1ZA/CaF
 u4WlIoYpIkJTMfU/oAHPtnszdw1e6+bRfCzP4ssoQz2XqRIhrg5mdePJiTuYf3mQfS4h
 3bLIOQg1FaDKqsCjq+mTI9GeMPgOzUR9nPujGKLfEu3C2rE8fWZWoKCMEODfOEHQL3rn
 jbwaUkzNyCs3GHqgjLzIjn2seNbXz/o0msEnJZfCzocVwdy+rwrqPtzg0vXz2egBXl9b
 48+echeFn9Gf5yg/2j1eMXfNYPuKd5fdxz64pEPLU8eCSQDpzePlqOHkgFkTyV2545IW
 uChQ==
X-Gm-Message-State: AOAM531A29Rl+f+p8yJkut7OfJacezOKwmghYBk2GTaIjSbiNdb3OMeW
 GZK5xnBlCj4por+wpusoeyYhx+F3qAg=
X-Google-Smtp-Source: ABdhPJx6x49t860Ji4WBqZXY+0iRVBS0DuxcRHaO7i+LjJx6y6RwOhS5Mayfg4WzxVVZyQstZYej7w==
X-Received: by 2002:a7b:ce02:: with SMTP id m2mr482037wmc.111.1610058311180;
 Thu, 07 Jan 2021 14:25:11 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id w18sm10304215wrn.2.2021.01.07.14.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:25:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/66] target/mips: Move mmu_init() functions to tlb_helper.c
Date: Thu,  7 Jan 2021 23:22:13 +0100
Message-Id: <20210107222253.20382-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-15-f4bug@amsat.org>
---
 target/mips/internal.h           |  1 +
 target/mips/tlb_helper.c         | 46 ++++++++++++++++++++++++++++++
 target/mips/translate_init.c.inc | 48 --------------------------------
 3 files changed, 47 insertions(+), 48 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index ae1181d2029..9a7698019e2 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -207,6 +207,7 @@ void cpu_mips_start_count(CPUMIPSState *env);
 void cpu_mips_stop_count(CPUMIPSState *env);
 
 /* helper.c */
+void mmu_init(CPUMIPSState *env, const mips_def_t *def);
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index b02c0479e79..082c17928d3 100644
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
index 21ee22c05dc..535d4c0c702 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -935,54 +935,6 @@ void mips_cpu_list(void)
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


