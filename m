Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C722D9F85
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:50:11 +0100 (CET)
Received: from localhost ([::1]:38608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kosvC-0000R2-PG
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjt-0008Tx-Ed
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:29 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjo-0007Rx-LV
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:29 -0500
Received: by mail-wr1-x435.google.com with SMTP id w5so13718921wrm.11
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pxw5yz+fseWQ/dQcwxqgNwkSctI6l6EW+pu9mjED4a0=;
 b=eG+rZt31DsZsT8XFwZ5zWXKppwa4lzEcEGnNBXebed7vDj4MxqtXSGUsR4eixHW6pm
 F3ExTzKgY2hVmLcA3Y/+M+pFCCt38W0keXX9wK3Cv3DL94W5Dl+wZkmAM6Q5BYHeC/uq
 Fw6kUyCzIjcIHR/cjpLO/lBUgMhkO1nTIP/lLf6fINpRKhD1j8odvqEWMT7oO2HPQhWz
 Y58qS5FvhifFEjWdVGKBIKj8m+/ZChqwnfdRFnXrmdxB+oOvoIuc3J56FVZjwifkdqXQ
 F2ysxu2Xu+2pRtQQC+DEtw5Mvrl4Tr7Km/4Aal9bAH4Hky2pwOiCzdCS84N6KiU5q0BD
 NKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Pxw5yz+fseWQ/dQcwxqgNwkSctI6l6EW+pu9mjED4a0=;
 b=HhiABY++cmGRw/2CJRBv7clYUw2MDyjra4rXMUcTxk+26h2hA1pLcTTZfzw3nOtpa5
 ItFbWtH1l2K1WiIVJyRxhw/1R043i176GOh8pSltFIWQKUKMrLg+3gx3yAOAIICZKhsL
 quL2SyvswTLCv7n3WwV/vpTczYivQc42VE85iHwKAsYUivmXl8pstIR8lalBsV6rQW4c
 Z69JPMjWBQULDB9Zq8R1rIuRMlzvFEEaeHc5P882aPlRZomin/n9Er333d+Inwmw/ab5
 G8/pPDDNArwDV5W6Pcswn6pP+OH0OpS09Y53qmQUeLwmOcJIfsTpu+F8uoGD7HaykKnP
 +kdw==
X-Gm-Message-State: AOAM530lC6ZC0iX5dHRPNpY2dXMw4UN5XCBHdgDCk1IrKNx46XYUTjGD
 ZInPJhFfMYcybiqAOTotvr9htUGVPHw=
X-Google-Smtp-Source: ABdhPJziMYXAnUWCqbPBIaNucXK2KRgqogVbVQ+OduRyvXOkAxSuRmEn6ZfGwHWYFMs9FiPSOATzPg==
X-Received: by 2002:a5d:43c3:: with SMTP id v3mr6016210wrr.184.1607971102985; 
 Mon, 14 Dec 2020 10:38:22 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id e16sm36965915wra.94.2020.12.14.10.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:38:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/16] target/mips: Move mmu_init() functions to
 tlb_helper.c
Date: Mon, 14 Dec 2020 19:37:31 +0100
Message-Id: <20201214183739.500368-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
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
index c1401492c46..968a3a8db8f 100644
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
index 2e52539a511..94a482e3dbe 100644
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
index ff14502529b..a788f5a6b6d 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -933,54 +933,6 @@ void mips_cpu_list(void)
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


