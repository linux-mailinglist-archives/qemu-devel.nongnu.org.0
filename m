Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00DE3F0BD6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:33:14 +0200 (CEST)
Received: from localhost ([::1]:46368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRJK-0001bF-04
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6J-0000hz-TF
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:47 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6I-00008I-E4
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:47 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 j12-20020a17090aeb0c00b00179530520b3so9670376pjz.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N407o9bpjpNHrFay9c2qe28goaY9qdIgGMVcmRi8tog=;
 b=RPHK+IX9gl3c3x7h0A+Xfr4qi3wwFpUvEJRdTHKRf5Ogmg4QoEvPVeJEcUFD4xEdo0
 2g7xIDSWEMTpZ2hczR+VvdNbqMrwwohibfGAW+I/7xWkOHbxFNwNrHgOlpKu2tk29Yff
 fphDJeNmsjbeB0/Gm3oAc1+u7xppA0Mp5S/8AZA+BOKXM9eOqt14JErGfl989SgLDta4
 3MQXCSW3UlGB40oCEfuxkH8VBwz70s66UZcgyiTGat9IM+71FuQVdLnGJIlNz7YQB5wi
 tAFF4BVcAsUXbvPMnEMncFKMIRt6DCICkYW6CEqchIC6oYjbqtuqjcCmXhbwpfusu+Qg
 Sdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N407o9bpjpNHrFay9c2qe28goaY9qdIgGMVcmRi8tog=;
 b=SZtBJZHvR4v0Q0v9TasiqFI4FrEmApIXkmNkr3dUdP9fRVdsEJTfjFgaQ6i/MrNvZY
 4oonTeaCzX4PtxW/4GF4FEPjm+KIqN8IVT9ZYa3Gcp1g8qsD/mMLoufGMBJ/hiCEepFE
 A4pag3AmxJq43rUNsdbSrKfTs+95AsY6lZ2ojYdQIxnyLKGdChLjmuSHGPI1KzA8fUjb
 S/k7nCRcghXawuGNSZdjYnC4be7TqA9DN90kWAJy6Dd1NI9uxCNXVkuevlZXwbiZZAQL
 MIDVlmpdR6xDeYIAHbODXhNh5pZ7enW+6/UNVg/wcSXYYmSz/DlGa4pj3YkukUYmhc6m
 CQxA==
X-Gm-Message-State: AOAM532eHJNxZ67mw2ZMzTndQzNPJ3u/SZ7Cmv/s790M7jsCOqgOMVC9
 ujw8CgVNcgQGDK/vWLjJZdiwr8dqboB0xA==
X-Google-Smtp-Source: ABdhPJwTvvchV5EB/ElGMytqiPrwX1w0SWcT05WvDhh8ydachjAEDHASDwMkOMheuEXIw8BAa+1GRw==
X-Received: by 2002:a17:903:32c2:b0:12d:ac12:6e5e with SMTP id
 i2-20020a17090332c200b0012dac126e5emr8366371plr.44.1629314385167; 
 Wed, 18 Aug 2021 12:19:45 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/66] target/sparc: Set fault address in
 sparc_cpu_do_unaligned_access
Date: Wed, 18 Aug 2021 09:18:32 -1000
Message-Id: <20210818191920.390759-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
 target/sparc/mmu_helper.c  | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 974afea041..ea163200a4 100644
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
index 5b2fda534a..2f260b0085 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -946,4 +946,22 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     }
     return phys_addr;
 }
+
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
 #endif
+
+    cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
+}
+#endif /* CONFIG_USER_ONLY */
-- 
2.25.1


