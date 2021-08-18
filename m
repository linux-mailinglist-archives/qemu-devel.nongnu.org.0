Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE953F0BCC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:30:38 +0200 (CEST)
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRGn-0005JD-FE
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6L-0000jy-1z
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:52 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6J-00008z-Fy
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:48 -0400
Received: by mail-pl1-x631.google.com with SMTP id q2so2408712plr.11
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8K3PazbekoVtI1IlmCNF1igSO6s4agOQzsTD2i63oms=;
 b=xFdgjGSJhptr3CrAe46MUD8r8w0JF6ZXYLxCZtdr2cYj2EWFFOFCDxYRJC3YPE1WXU
 mGmNp/kXxPN45fRd/FyO+2Pb/lIFpOQa/FiOYNCA41VnSnshO7iDEn6i+7HeoL7bVLDM
 pMSNyJerSAOfLX2d4YN//v0Rd9uvAWDeeaqMPhwUXBCM8TC3dg9kBovA/GzkhUE1H108
 dafejDgz/bkqmi2tQlTDx+TuEbigr8SRZaRWRK+2Fy5Wlyb3kXdohRcf6iwZNVz3Eoou
 neIFoBoyKwJrKmr39QhqhyMzwBC+rcdGuu8z6KFiSyx48E8gp2duQmJkGMvB4xR17UXA
 amXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8K3PazbekoVtI1IlmCNF1igSO6s4agOQzsTD2i63oms=;
 b=oCm2a0w7sSJdUSdLUxcEHds4zqO8IOYXLBRULL2lSp71VTlPVBPKOjrWPGQ+n3O+jC
 3fCOuY37nE4CGJ+7ghtbWK3uwjx/6+zirr7oWPUcgQu0wGWvZ8HUVMcHGDfOdEr4SnLl
 2lKd1I2izP7HNuIAMe5g4UotvDJnE5cWN2e4Z68cMg5gLVvow7iwsH2PMP+e9qq76wgH
 T1i2w2+ZGDHpBO03KdvxSiPaEmJOkcsoPxzaz/UCOvW22QFTaG6wa+S7IMAjZRUZ1ox5
 i/xbfcCKjPkuZfcFYDX9+XgtOj995UfBJZHCHAr+QCCxGT+zcN/YkRXCpF6Smz0OozQ/
 W36A==
X-Gm-Message-State: AOAM530L+fQGncc/koVsMqmiIBoljRJlzXUbs4/+bmD/nPjEk88IvxDZ
 pX4ZNoHlOezfmDooGnMKanaxRcGw+/TIgw==
X-Google-Smtp-Source: ABdhPJy3cyKEwltmQcLoZINTyMie9eX8XqIzGalaRYuBf9jW1/7poHyFqgxAJIKOdVb9m7qUCu1fUg==
X-Received: by 2002:a17:902:7444:b029:12d:603b:dd20 with SMTP id
 e4-20020a1709027444b029012d603bdd20mr8462953plt.38.1629314386226; 
 Wed, 18 Aug 2021 12:19:46 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/66] target/sparc: Implement do_unaligned_access for
 user-only
Date: Wed, 18 Aug 2021 09:18:33 -1000
Message-Id: <20210818191920.390759-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 11 +++++++++++
 target/sparc/cpu.c          |  2 +-
 target/sparc/mmu_helper.c   |  4 +++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 02532f198d..612e77807e 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -272,6 +272,17 @@ void cpu_loop (CPUSPARCState *env)
                 queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             }
             break;
+        case TT_UNALIGNED:
+            info.si_signo = TARGET_SIGBUS;
+            info.si_errno = 0;
+            info.si_code = TARGET_BUS_ADRALN;
+#ifdef TARGET_SPARC64
+            info._sifields._sigfault._addr = env->dmmu.sfar;
+#else
+            info._sifields._sigfault._addr = env->mmuregs[4];
+#endif
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            break;
         case EXCP_DEBUG:
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index da6b30ec74..d33d41e837 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -865,11 +865,11 @@ static const struct TCGCPUOps sparc_tcg_ops = {
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .tlb_fill = sparc_cpu_tlb_fill,
+    .do_unaligned_access = sparc_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = sparc_cpu_do_interrupt,
     .do_transaction_failed = sparc_cpu_do_transaction_failed,
-    .do_unaligned_access = sparc_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 2f260b0085..6b4aa32181 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -946,6 +946,7 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     }
     return phys_addr;
 }
+#endif /* CONFIG_USER_ONLY */
 
 void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                  MMUAccessType access_type,
@@ -956,7 +957,9 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     CPUSPARCState *env = &cpu->env;
 
 #ifdef TARGET_SPARC64
+#ifndef CONFIG_USER_ONLY
     env->dmmu.sfsr = build_sfsr(env, mmu_idx, access_type);
+#endif
     env->dmmu.sfar = addr;
 #else
     env->mmuregs[4] = addr;
@@ -964,4 +967,3 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 
     cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
 }
-#endif /* CONFIG_USER_ONLY */
-- 
2.25.1


