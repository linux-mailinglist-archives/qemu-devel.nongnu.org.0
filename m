Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D0A442D8C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:10:35 +0100 (CET)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhscc-0003Fu-Vz
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhI-0001gL-K8
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:20 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:34475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhD-00021C-RU
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:17 -0400
Received: by mail-qt1-x82f.google.com with SMTP id u7so68531qtc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=muffzeHX3yZuoAcxrWs0UhKgv9u/j8rmCNk7xQHU/Hc=;
 b=Lj+prjzCkRKwr8A/CCwy6qMqerbsh4bGMMvVIfAIG9Cr/VpQQorVXp0P/SDBLTrwF2
 rDbQT3drlrBWj5UF8s0doENaizgjANjY+8T4rUAPqN+FWEpVQVEv3sDg+9spXN8NlbHT
 Yh0Of6TP62GxSCwqrYJ34svgqFhSNe8I7VoABmHqjGNTPC2DfLkGYFruNq73YeFnJtAj
 ulyRxzyho14ZCfTwtR8cl4tehOhOI385odNFreIKDi5m6WIM36Cl9JEoXK1sWoeqS3rg
 DX9eIcWNMc1jxhVfURpVAyq6dHDz5k1u2tK26xFaH68IHfNoafGBc93F6YPwwZCrtAl3
 tzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=muffzeHX3yZuoAcxrWs0UhKgv9u/j8rmCNk7xQHU/Hc=;
 b=hMfAotcs8r1PP3K2tCf+o0+ddA8/6s0OhZ8iPmhv8axs/+IJqFnjugx6oDXiDNU0zT
 on+5GwRP432kNz7MLsEg6Z2PTddSmINjhOZ+NgU1+rjox85kheD5LaTqgnM23ITioEcX
 yB5najqyp3xM4ikT7phIOaJYbbf7kzPspf5/EXwDZaPbJyVO13boopJ/bDHz2qCBg6hM
 BEAmXsyw+qOonl0CIOVHtAzPEzcflP+e7RCuJQQn5I0RQPIQipjovEoTf483GZmWQAc5
 WSMp0Rtkq1PbkaKOE+6BqofAWi1vV7M32h4GxFQ9rQM6KecAVIFCCIvZwjgEzDM20ZVJ
 FSow==
X-Gm-Message-State: AOAM5326mnT+HbmDJco8f2VLemkzviJ1H87FpyCn6mQ1f5dLrTO7PCIs
 I7cFYP4J4YHsuEIY/HrlDe1CtPGa8EHdjg==
X-Google-Smtp-Source: ABdhPJzP1lqnDiXmfJCJOllmrxpWoPfqSGgVBDxEiTdQpVgvZglMBjg16+hIEnZqUKFAlakQ89ZVPQ==
X-Received: by 2002:a05:622a:148d:: with SMTP id
 t13mr36195317qtx.393.1635851475059; 
 Tue, 02 Nov 2021 04:11:15 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 56/60] target/sparc: Set fault address in
 sparc_cpu_do_unaligned_access
Date: Tue,  2 Nov 2021 07:07:36 -0400
Message-Id: <20211102110740.215699-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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


