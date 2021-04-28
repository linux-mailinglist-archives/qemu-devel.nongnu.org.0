Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D7336DE0D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:18:06 +0200 (CEST)
Received: from localhost ([::1]:37884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnp7-0004a3-Pc
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndc-00018v-MH
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:12 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndb-0006ZC-6A
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:12 -0400
Received: by mail-wr1-x436.google.com with SMTP id h4so54794362wrt.12
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmC/c7HfZL6KsbHDqY+pDUb4saJpKTFpx4rhG/OKbHA=;
 b=VQL53lUmOnj3UECIR1qJ2QhPFhB0YffT49pk6s8T+dQ4CLZCai1TIqPuurlX4ATaZZ
 2BNO+0pOEZdzDEAQzsynYNsnRyHTfip0IhVrJYIGc6OKYKEwD2val8a+dzfc/xslMvqa
 j6WOrJL10CPciDo8BrksiMflWAbMluFRBQE4lmyxr6P73vzPbeRsn3/LPLkP8T/uCh3D
 OTyhQwlR9GLhTOQEoUW5tnIEBn8oKvreFp/s0Q2nq1dFJ7YYy4jGZ3KSt8sd/NOTbLYS
 owNwU7qTCi/yNzwSa6HI21BcEyiIJ6rJuX/BJIWl++BYeZDWW12HLsJnCbCkxZgBzh2+
 ikAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kmC/c7HfZL6KsbHDqY+pDUb4saJpKTFpx4rhG/OKbHA=;
 b=Fdm29vpyxOCziPQFWhKQ2GxEVLQ9KULkbczgipGAirsD4bXAEMfi0B4zHuyIUizNz6
 r0We9HbLhH90Ah13ieOE0TM9i8bdk0ZUQdm/BbarsoXjub8DEtvTxHaCy4K5/YeOjHY/
 oVx6ZJm7oSZhxMuYppXo0ptTR+7yZQP0Z47VaOj9+te2bpyUxWF8Bf4cKE3zWHnkzi0N
 ud7Kyv2IJx+SvncIaOdT4oEOFmZipWfVXCwphzzT5+U4pnw6bJCbnDBhGYWE8oW4nul3
 fUqVz0MEB5bd3fm1PdC/tXzu+/akz+aY0dp6JZzDYDuEPnw0Ftt02+F5zF79ytThL/MU
 gI/Q==
X-Gm-Message-State: AOAM532ZQPc0fsTAqjF+2giGlYXCdkXOQf+uJsiPBwRQD7QRMgY6AfkT
 v1N1LCLvU7pXoyvGxjVbXUyUuFg7WlPFDQ==
X-Google-Smtp-Source: ABdhPJyssGiowuYhER2dF5TReqE/kDhFgnZB23s/r4cvAa7IR3fSYXIJyRqaBcjN6gud1TWhM0RH/Q==
X-Received: by 2002:adf:e404:: with SMTP id g4mr2298612wrm.240.1619629569374; 
 Wed, 28 Apr 2021 10:06:09 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j13sm409561wrw.93.2021.04.28.10.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:06:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/30] target/mips: Restrict cpu_mips_get_random() /
 update_pagemask() to TCG
Date: Wed, 28 Apr 2021 19:03:58 +0200
Message-Id: <20210428170410.479308-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h         | 4 ----
 target/mips/tcg/tcg-internal.h | 9 +++++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index be32102a2ac..6bac8ef704a 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -165,7 +165,6 @@ void r4k_helper_tlbr(CPUMIPSState *env);
 void r4k_helper_tlbinv(CPUMIPSState *env);
 void r4k_helper_tlbinvf(CPUMIPSState *env);
 void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra);
-uint32_t cpu_mips_get_random(CPUMIPSState *env);
 
 void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     vaddr addr, unsigned size,
@@ -237,9 +236,6 @@ void cpu_mips_stop_count(CPUMIPSState *env);
 /* helper.c */
 void mmu_init(CPUMIPSState *env, const mips_def_t *def);
 
-/* op_helper.c */
-void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
-
 static inline void mips_env_set_pc(CPUMIPSState *env, target_ulong value)
 {
     env->active_tc.PC = value & ~(target_ulong)1;
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 24438667f47..b65580af211 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -11,10 +11,19 @@
 #define MIPS_TCG_INTERNAL_H
 
 #include "hw/core/cpu.h"
+#include "cpu.h"
 
 void mips_cpu_do_interrupt(CPUState *cpu);
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
 
+#if !defined(CONFIG_USER_ONLY)
+
+void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
+
+uint32_t cpu_mips_get_random(CPUMIPSState *env);
+
+#endif /* !CONFIG_USER_ONLY */
+
 #endif
-- 
2.26.3


