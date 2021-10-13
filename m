Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3273542B2EA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:52:47 +0200 (CEST)
Received: from localhost ([::1]:33676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUNq-00023N-9N
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHj-0004bK-Kv
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:27 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHh-0004ug-S2
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:27 -0400
Received: by mail-pf1-x429.google.com with SMTP id k26so1157870pfi.5
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cpKP9lLV+B3lJJVGxWZYd41x3ok2BfFIwAyas9V94EU=;
 b=qNbgAgtsmxcP/dppXY9myvaF/cqSMVldOv19fEi7f07XGiyc7IuyOTWDOQ4VGs/hgY
 wdzEK0nErQVlzJCgwfmOyxT5uLi7HwdQT9Cj1fav2BGNMMMJynTvUwcNE0cvjF/vbVFw
 Fr1B5B4KutUfTDEN4Ug96eyjov9VnC+a1PY2chl3MoA38y0x2wHeE99o4EqSR36AJ5aW
 WRdw+fqzE7SqXvAKk2wj8t+fYhqx92Lw3YjmvCf1L/FNqT3Fbsrrv5xAMdsv9HCoHOce
 CgzCnjugRG/nNsq4X6aYraCxDjgWUprWfItAm5zWOeR/melPlRtGj+opTSNZDpMF5CCT
 n+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cpKP9lLV+B3lJJVGxWZYd41x3ok2BfFIwAyas9V94EU=;
 b=R0PbaMD70jN9xLsxBsQhr+2buMj9SuCeoX6JeIC6GIGtucZOcOeuRV64PgZESBWjyp
 e3A6fG/2hSOiLrf5wDuAcjiCoWlE1i5n8lUkCfAghwMNUIlbLeRoRwzRyYJdL7qkSGc5
 4z40/X5sp/XJGDPSarByTcJxL8EPoR0Vv+43kmznhagDkuN3wQWHLYGcGgUtcS5CLPZJ
 p+Ci+VA/XsEY7NeqLeerh1yhN8fJJbhrn8O0a1OW32eXWuiB9GX0op0emZxOMfp7bLH9
 xtZSi/Ku2MkMeAfISRY37gyvPurnzKU60Kjyw8gxe4OvhfR2d9rTskWoXubqbEav28DN
 rpXg==
X-Gm-Message-State: AOAM531Cq/5W4oR86PGlw8SFkpMGiYiQ3tJ2cbiJd85CfsfhC7Y4mPO0
 TjITRsEqBi8UDm3XeW4uTUPMRPCcZKc1tg==
X-Google-Smtp-Source: ABdhPJwHEQ6wg5FeHGQ7JWdcoZsMmCi/MIG863XpR4KxhAzy9GqbF77EPOHCYft8rONE5WVAX+nr8A==
X-Received: by 2002:a63:191a:: with SMTP id z26mr25169692pgl.373.1634093184614; 
 Tue, 12 Oct 2021 19:46:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/48] target/sparc: Set fault address in
 sparc_cpu_do_unaligned_access
Date: Tue, 12 Oct 2021 19:45:34 -0700
Message-Id: <20211013024607.731881-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.  Move the function to mmu_helper.c, so
that we can re-use code shared with get_physical_address_data.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 13 -------------
 target/sparc/mmu_helper.c  | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 2d0d180ea6..299fc386ea 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -1953,16 +1953,3 @@ void sparc_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                           is_asi, size, retaddr);
 }
 #endif
-
-#if !defined(CONFIG_USER_ONLY)
-void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                                 MMUAccessType access_type,
-                                                 int mmu_idx,
-                                                 uintptr_t retaddr)
-{
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
-
-    cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
-}
-#endif
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 014601e701..f2668389b0 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -922,3 +922,23 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     }
     return phys_addr;
 }
+
+#ifndef CONFIG_USER_ONLY
+void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                                 MMUAccessType access_type,
+                                                 int mmu_idx,
+                                                 uintptr_t retaddr)
+{
+    SPARCCPU *cpu = SPARC_CPU(cs);
+    CPUSPARCState *env = &cpu->env;
+
+#ifdef TARGET_SPARC64
+    env->dmmu.sfsr = build_sfsr(env, mmu_idx, access_type);
+    env->dmmu.sfar = addr;
+#else
+    env->mmuregs[4] = addr;
+#endif
+
+    cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
+}
+#endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


