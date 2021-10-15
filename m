Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B5542E7FF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:44:24 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF4x-0002wO-Oy
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcF-0006ub-95
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:45 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:37551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcD-0002w2-KU
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:42 -0400
Received: by mail-pf1-x433.google.com with SMTP id q19so7313409pfl.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=muffzeHX3yZuoAcxrWs0UhKgv9u/j8rmCNk7xQHU/Hc=;
 b=W4LeJ9a2EKradOZjo4wTuB8xqkNzf2KdkMde9V6GZwVepTf93PrFCJ7GPovl6AMirM
 midF8TuBN6hjPUiNdG1PF5HSd0HpGw8r2+F25/rLP/SiFkktHj7/RE5UY6VpA0iRVP05
 mKwe+lvis30h42xwgbYNYrl+GO7EqM4hxg2Ad64jqliABa1Lbg594rNd1jMvZtKwB6fh
 8DnywRUl/WMPkVvS8ZY5OP2ikhv1AesClKhjY5I/gkKd1K9DKIl8X79hgn5onURepMMP
 awkRuMvS6nEyNJ8TwhyBWjCgm3M1k4QzMAH2UrX7Nf6MMcwq3Ja7yv8WE6C9vIrdrkoj
 vYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=muffzeHX3yZuoAcxrWs0UhKgv9u/j8rmCNk7xQHU/Hc=;
 b=j3Sm+Qtq+3xxFwZ8Ra7KMi7y1yktYJ2UTSp9XNhh+YVEKOE/UXMziGjEJKZopGbfPT
 RA0RKMdPpZBgyhYJUqCU3sP1bsr8OukfuLhhS8NdQ/5gD8eR64LpYlUy5dkzzLd88yTJ
 6kRyjue59g7jAnk+ybgUSd3taafvIZrYl0tTgF9spTiNOI6heycFrfBlIfmX/4qicdqH
 HNUZq2/yf3a0MUkOszvGq4sgNjdKg/nmM62bO27LkmkuRoPA4THLWS2nq2ZCkP3cuq7B
 uuuUpdc9V9r68wO9wGwhcs4IHr2tqzqu4eAPs/NUwGNfh9jBpIpi3+QREr1Kh6H+jw2R
 h+yw==
X-Gm-Message-State: AOAM531vOxn8ZVup055L4N7jCgZKAXONVYppO5Qg2P4pdHIAOWi86Xi5
 It03T7PJzvg7o/WCZWgkXOl67NOMK64zkA==
X-Google-Smtp-Source: ABdhPJyRALf14qi93sh71sMo0PVj3s2Myq763fLTP2I0AItLKY7NIVT1WMz4yJHgYU59gr8++pdP4A==
X-Received: by 2002:a65:6aa8:: with SMTP id x8mr7419834pgu.136.1634271280135; 
 Thu, 14 Oct 2021 21:14:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 57/67] target/sparc: Set fault address in
 sparc_cpu_do_unaligned_access
Date: Thu, 14 Oct 2021 21:10:43 -0700
Message-Id: <20211015041053.2769193-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com
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
index 0549b6adf1..a3e1cf9b6e 100644
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


