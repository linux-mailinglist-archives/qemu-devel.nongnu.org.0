Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EED363870
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:05:46 +0200 (CEST)
Received: from localhost ([::1]:34844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGU5-0000ut-Fn
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGHA-0003ma-IX
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:52:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGH9-0000uX-4b
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:52:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id s7so31942231wru.6
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=geOP9G38qi4/IaR8dUmOJpZc93rPkbR63KeVQBk2OII=;
 b=LYX5ygUGFSa8mlF9W/1IYwNbj/WlaK9Z+XtrS2O+146C73BlK+my0R55Oxcp4kTADg
 mr4yu0J/J05+1wPULtR7NpMxuCBYDWSB5koxAgcj6TtNdxPKT/q9WIYWgHsJQRfCAn+M
 QNbS0JcmGDro6eCczaa3GWpA5a1VVKrfs4YtajJRBucyyGKMmjQ9A0dUFTcJTl14wsAO
 DsT6ppCPl+GTNLV52zQrmfR3dqk1oWhBR9dWGKG7ZdkN+7QiShidGfgQzajf0XATGc+k
 eOeidqlluw5pQL8DJrQ5hk9R44nHaznjm14rv3ur/W2DD1VuwCDJ1467RuJvWzu93IQ6
 KHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=geOP9G38qi4/IaR8dUmOJpZc93rPkbR63KeVQBk2OII=;
 b=gfw1CmR7I6f8gyp/yk5PwzQQ7wX7kxg4/Cw05IpT2UWxoQx0roaeOazsi0AbIHT1qC
 zDX8lrLwxCsxLlzwnTpJroz8nNAAJRFHn+u6hTBpa2xzmx85zY9dBwSqk9Qepcg6Q3nf
 gybDf45/B8PdWVauLxq7HBfLAdMEiysXDgFaqyUHxPqR/9FIRht5WXeUrlEqt/jbXBnZ
 R9bxoZ0rqxBlXjfVjRiTdbhJyxSNQkQN2q9NU/nSrq+ZAyJfkCJkqwwKU4YP2JDM5N9n
 egBZwwfsprqUQj8CQfPRUqXMMaiEcNV8rsum20icYP7VAAXMDr1gvyAHv9dG+/O+lF5w
 jI9g==
X-Gm-Message-State: AOAM530QC5zM9UXRjIauST2U2FVDbWQ8OeMhmx5wAZovfc2FAVpaAscq
 uzAACUM8EzLVddCVOozgMmzRyZMIbUnKmw==
X-Google-Smtp-Source: ABdhPJzPEMwEgDqzK2Tlisy2e4ChSC5RLq4l7TCxeZeREoy/XSGYynrjNCeyuhjLebxFKsf60o5W9Q==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr11132817wrx.295.1618786341707; 
 Sun, 18 Apr 2021 15:52:21 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l9sm19630742wrz.7.2021.04.18.15.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:52:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/29] target/mips: Restrict cpu_mips_get_random() /
 update_pagemask() to TCG
Date: Mon, 19 Apr 2021 00:50:46 +0200
Message-Id: <20210418225058.1257014-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h         | 4 ----
 target/mips/tcg/tcg-internal.h | 9 +++++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 8789ffb319f..d7980ba9a94 100644
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
 static inline void mips_cpu_set_error_pc(CPUMIPSState *env,
                                          target_ulong error_pc)
 {
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


