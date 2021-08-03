Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1613DE553
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:27:15 +0200 (CEST)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAm1K-00035R-8G
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpd-0003Ge-I1
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:09 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpb-0002Fr-Rj
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:09 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d1so22182876pll.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xGZBdvWjHQiXY4K5k1WScv2Tqrm7hbHaiNTVWCb/4H0=;
 b=KGTdXalg5FO2LasDz03dou/lPnIgyJM6PU2Zv+/0KZhWwKVLvuhSvT4rKXSQj8XPZG
 INrSAYk/9TbmskmpHZu5Tm2KL/XjpQlgelmMTX4ppSOUsKNVfNrOX6V1FO/60R4t8vi7
 5EbgpPpXMEM591GXhbEMstSOTkF7nhBFw7spcy9g2ey8oB4wVBI4sYZlRFnbva+8voZf
 QmvQUQqTOX0lujsiel3e2HF1fkwYaZQUzzS6Fu1Yzpm7HulD8h/dt3iPVDN0nCsuw4jW
 m1lrVAOJNc0nC7EINjyUgyDuEOosMBzTEWdWF7r4NvirP41rp0u/f9BDQpJJcOLeNSWy
 +BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xGZBdvWjHQiXY4K5k1WScv2Tqrm7hbHaiNTVWCb/4H0=;
 b=ECuvbhywcOqG9As0EnILkasfAiGDNWPAP8tYeZKIsTBDwhkh9WIDEMrLxflG8uGmFa
 GGQppnK2XaR8eA5NXzNnVzieMwCbsuMjc4kpUpBv6vZUrlVN6rvjcLvl2e1wOEsumekr
 CTrEDLj/Ly0OY1O+X2b4gvi56PLLt+orrjKHPtK6IhhV1DLdysmPfP3tjUF2OS43mDQn
 y3vkss+P8DFj8/HZ2QLoKtwdHiyGOuyVj+TmJUr4Ap9/R8t+vK5jTzLaxpfHoHhP4rcR
 Irt5jnubEH45K1iHrp6QjBk0AV0ZhTyvsjJAjzBdLvnhG+N/3pO/4XUoCo15oZygjXJo
 bdTA==
X-Gm-Message-State: AOAM530eAe0wC5C68A07XvBPSAnLqBAkc7md6hffTINoeMs3f+NQpoZo
 d6gbM9sT079d9VSBpIa0aLOVF8Gy46HreA==
X-Google-Smtp-Source: ABdhPJxBwKrTTuQNEfYAFnldnVB4UcbDz8gFS3W6e3UJtPxNoMYtoXRm4GGnOuwRnZJaeodmnB2bdg==
X-Received: by 2002:aa7:9436:0:b029:30b:30ba:5942 with SMTP id
 y22-20020aa794360000b029030b30ba5942mr19924042pfo.47.1627964106735; 
 Mon, 02 Aug 2021 21:15:06 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/55] target/sparc: Implement do_unaligned_access for
 user-only
Date: Mon,  2 Aug 2021 18:14:06 -1000
Message-Id: <20210803041443.55452-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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


