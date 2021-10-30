Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5182440B4B
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:36:19 +0200 (CEST)
Received: from localhost ([::1]:56266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgtDG-0001rt-U4
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs20-0001dP-3s
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:36 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1u-0002FM-8e
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:35 -0400
Received: by mail-pf1-x435.google.com with SMTP id g11so925738pfv.7
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=muffzeHX3yZuoAcxrWs0UhKgv9u/j8rmCNk7xQHU/Hc=;
 b=OuWHDlUPC4yeA0vCAwp4rucFVp+b5FyGJ0mNq2QCx77hvUMFr/5Y8nftABDMhv+gIy
 74oQRgfDoGEq8EX+JphlewuQzTh3RAh1Hqlc/wV1b/6jnBVdFxh7XNTQqvjbddRD2G3p
 yqqvVnNRj9b/tMiQBEDxfJIheXWpN3SekIOgusKAIX8DOw/XilskWIq/A+dUnhttzz3t
 Q+k2K4rr7h5I8nvYm4BM/txVTqVrSKnIT93mdY8lfq9FQfBhT3JN6U/Ugx7/lvIhXQ1b
 +VtUzwRtr9qAsXw4+baANx5NAHHBG0WDuRAG89vpOTIEMmPt2AO6ZUmAGw65yN3PDSpn
 6RHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=muffzeHX3yZuoAcxrWs0UhKgv9u/j8rmCNk7xQHU/Hc=;
 b=gGItJUVNEy5an4F53Cmedw57fIwXYuRZSDhl8Dkx/YCNFtuG4bZ8Q9/N94Ksv3SW30
 tyzN6/oUXFwBMFimbCpKotHdLCcdPJTkm5seiBY++7n269FREqqOjw/DHIeP5O4stdXT
 Zy8kLhTJlZTHnJbkDZhB5nL6oWz+B3BoRDEWJOxR/I4LWfpC52nLFH4RB5UAa0WcE4Nd
 uPF51mGYYphN2ZLnDl4ci0So4WdJQ/IQyHkRRwkIBsbT7qaBrkQfneGoz061CRSjbqgt
 YD4OkCH8kIXSropeV391QJECX3BU8VCmuUAWvfoQMYKxIyY1GVDZJrV8jBralOKtzWRn
 1U6g==
X-Gm-Message-State: AOAM532ozdKYyiR0QwhHU4diuClxbpaJjojMDKIW6EbqeduD6/yIpEyu
 ApKMYOsmSNv6ffOlW/UzdCkoHsQ09l1Ozg==
X-Google-Smtp-Source: ABdhPJwfS6uurXSYmMBitBRZYZELkPgjZ8kHmgAWzXMNfTV0ZDlpT6Mwz2+jloppvDKKjytZr93qOA==
X-Received: by 2002:a63:da0a:: with SMTP id c10mr13320198pgh.333.1635614428300; 
 Sat, 30 Oct 2021 10:20:28 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 56/66] target/sparc: Set fault address in
 sparc_cpu_do_unaligned_access
Date: Sat, 30 Oct 2021 10:16:25 -0700
Message-Id: <20211030171635.1689530-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
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


