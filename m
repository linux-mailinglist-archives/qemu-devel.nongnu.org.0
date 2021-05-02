Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18444370DF9
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:31:24 +0200 (CEST)
Received: from localhost ([::1]:51204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldF07-0002Zw-1P
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmz-0006ct-Aw
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:50 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmx-0007vk-BL
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:48 -0400
Received: by mail-wm1-x329.google.com with SMTP id g65so1923700wmg.2
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f2/r+v8OBN50e281PkjAHi4aV1Dtg/lHhfSfC51VxTU=;
 b=E0YAffU2QoMyXe5DrhjeFNsHHSVCVQ9a0MDo0plsjlniKipWy/a/bM6ecrZ10Jrf+d
 uDAmxDEp0aE21VPnqNaEF7WE13AbARC1bmTrgvCsoX3Hs2uaooWahZqsat7OBGa7Xe0V
 9U8W2DlV+J4g+aAqTQtWb0TFh35XT3V8g2f2u3izcgZ8ck9JYH64YAVL+vPsXalGKjNa
 tiazqqMheO0xFdEbbaGLmlpIE/jHoKWBdjAQUQoptdWXTlvExTLS2FZR5svzkCm9drgm
 DbkqnLDkKJnUaXaJ6FdjmIyDZlYYfm/oFkc4t7F/RyMKeMcG3vmeT9LcMaCTx7Q8Sywk
 6w5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=f2/r+v8OBN50e281PkjAHi4aV1Dtg/lHhfSfC51VxTU=;
 b=cfckUGZ+8LW6bYHKD56aTr9AssD2bfDr8vP0CNjfJ2gnCSIqWUwHrfUBRcRitpJEhD
 fZ5B/7a8G3zmv+a8e0iHgTovKNsyXiP5TjhFaVRKhAfyqmfPHHszX7/ebNovdjB15Nk/
 zadBFEQGvICC9k8AFpyb21xfq5URXmvYxiixv8GCwCv2naC6PPn9ilN5UlAyOsccHl2c
 3Cdg+ukMlHB2bKiQQ8rYH32DPPtRhE0RaNCjaj2Mxu/QM4AYj3gzemMUtHtddplZ8X0v
 4vBto/qrJUuuIbhjJsGmlOB43OMEEXk5uNN7E6CTVFJR8gDpU5PaDkaWZoT2ED07juLp
 hDdg==
X-Gm-Message-State: AOAM532OupoQy1vt0th7MO6h+fGLhDQ0HL+rcqOlW2okibswlVrlSaZA
 mrVG4XpVktFA3tqlYVPHPzfjX1Hjx+hcBZWT
X-Google-Smtp-Source: ABdhPJyfGBn8TKFQJp39BXw9GI2XOno687c1VtT/sABYyJtkusacdjOij7FsyJe4DdBWByQkHybHFQ==
X-Received: by 2002:a05:600c:3544:: with SMTP id
 i4mr16724397wmq.38.1619972265430; 
 Sun, 02 May 2021 09:17:45 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id d2sm9322823wrs.10.2021.05.02.09.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:17:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/36] target/mips: Restrict cpu_mips_get_random() /
 update_pagemask() to TCG
Date: Sun,  2 May 2021 18:15:26 +0200
Message-Id: <20210502161538.534038-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Message-Id: <20210428170410.479308-19-f4bug@amsat.org>
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


