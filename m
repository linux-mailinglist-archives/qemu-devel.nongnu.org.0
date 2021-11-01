Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A56441FFB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:23:55 +0100 (CET)
Received: from localhost ([::1]:39372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbyM-0005dC-Qm
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9I-0008Ci-Cs
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:08 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:44611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9E-0001Fl-TK
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:07 -0400
Received: by mail-qk1-x735.google.com with SMTP id bj20so5971416qkb.11
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=muffzeHX3yZuoAcxrWs0UhKgv9u/j8rmCNk7xQHU/Hc=;
 b=IZii9fkJSqj9VrARGRXj9xIOsxlm8xoV0Eln16pxKBywa+lboZudamj8dKEbGdys47
 HmgDgYAr0A1j55ahfC3PNrtDsXHinL2fhOJlqysIELcjnrBCMkdrpV6wtdwl89LSklpw
 hk40Qyvtujr1As50GaWL1mviIohe/Kkf+gP841tt778FTHsjiINkLHOE9bFMYEonVafa
 l6E+eMoPvLCWwWLkZbzjw51+v+C2BX7lsf3VbaLiyem44Zi4neKjyy5QXLukg2w3o2pM
 udcSaTblaxlVdTGUfHaELtAaIUkwvGJeaeqKb7XdspPiJXh7g4kIgGA3WZvc9Rw6vU5R
 D2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=muffzeHX3yZuoAcxrWs0UhKgv9u/j8rmCNk7xQHU/Hc=;
 b=7pLlFaGCM+KwdDoyMA2AksLmSrzwv61X8CoOmWrTiUSZ3gkCaepaiN0ZJKygFG3ZUy
 sWNkStJEskUmkGanKtIz7DmFZjmDci9+9ckkM287JECtxDMicp655UkL2qL/kWXbEnqI
 UlaQxd3KJcpYovOu0HV3ndaKvX3GZBgEOA/A3RmSIeAkcd3HpWp8/YFf7XeldCKya2Bp
 ro4+Co7/9A9qTIDbWug66YzH8+d4910v8Bgvro57pm7oMZXwQB+YcLLW/3UsYZp5VLfP
 tOSLWsmSDK6w5Nx6xNUE4mrtSqnAiQie6NqGCLvm+qtGjXWHRQbRO3tB7Y8DDn5y/0ZW
 PRcQ==
X-Gm-Message-State: AOAM530UxoU3KHgWsQnc5De5XyMCTzDZ19DxtUywNrKfZFIbIg3oEqtl
 qVF3jUTFiAq9p/Iay5nLThfSxkSSFRDQ0g==
X-Google-Smtp-Source: ABdhPJxVGGN1OoNWS5Cd3mXE7BwHLp1OvbC7nOSSUkHGNyo+LZf8mD71fSP+oy+8WxUQ7Y1E1wbmHw==
X-Received: by 2002:a05:620a:414a:: with SMTP id
 k10mr8156132qko.309.1635787863987; 
 Mon, 01 Nov 2021 10:31:03 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:31:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 56/60] target/sparc: Set fault address in
 sparc_cpu_do_unaligned_access
Date: Mon,  1 Nov 2021 13:27:25 -0400
Message-Id: <20211101172729.23149-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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


