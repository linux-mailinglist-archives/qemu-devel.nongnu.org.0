Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD5B3D9AA8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 02:57:46 +0200 (CEST)
Received: from localhost ([::1]:53422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uMr-0002bt-U5
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 20:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCX-0004Ca-9b
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:05 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCV-0002Ty-GO
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:05 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so12930213pjb.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ulvQvyyu32hA2aH3pV4brLU8E+6uLdo/bjuR1ObgTKw=;
 b=R5MET2FmieqvuvZYpdd2KAzG2YP84mW3gAsUnjwIuhiXYnUOa03VQCJlOBC0IPj1z9
 o+ga+8Ux/2zWZgZiq1llgfvyAV+r94sN8ar+d+IzPIMtekWOMSO/IFdHT+FOkHlLfU2p
 abrOUCLV9Y0akrK0BQMYpmBTgIfwS1KUJ0sT2Gb2X+/yRptMzpjU/Kd/pPEImKC/Dh2q
 yIoVdZETrkx74CKPWVdcL7ouHtM1LfRUfCVYzDpGQuW74otXBh2OBpfdQFPnRf4mcPcL
 /OrQW1aio491AUL4oLSVCGGWF+RXJs+YW3YZh5Xx9WJEoUPwRjPa9YK50wOs6TPvlc3E
 LVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ulvQvyyu32hA2aH3pV4brLU8E+6uLdo/bjuR1ObgTKw=;
 b=ARB+KfdVmSgnp8ZGztjjl5RrPjHjWaHeRk/Aaa+k8UcBm3fzReU1DSYoVkyz7Sd/ej
 fRAFj1PK1Dg3DulZ5fq/XH22PC8CIrtuoP7Lwh3/tjGy4UpEFr6mWwD3eX8oeoRmSc34
 GBM8hLskZid5L8QNnYRuEphrqpCHbMwrhqalmCXIXbt/HkakzgKDfcvxPXLemEXcl9r7
 bi7Yzk4MCGkAH1dsefM2EK2xIfpqV300Bwv81i1sILQ3vIzPaeC44bFhl5kRQpmefkOf
 kF/hqcT1l8uiE3q+mjHvh0bD090/fiJm5u/6WMICg34Nh5jlOEhqu6WupMZnqSvlHU/6
 yJaw==
X-Gm-Message-State: AOAM531WklNwWQ6CgbH2k7mrtzN7inF60J0N3f/VegcD+RF0Z70OtnzY
 7VTRRmxL8rYUhfV44CyhF3zNZcoDgxtRWA==
X-Google-Smtp-Source: ABdhPJxpQAEhYzT+zeUHUX1CxbUliKog7Rjrq5Fn8GzL2OqIjlc8zfW/DudJLokd26EJ/i38l1dmSA==
X-Received: by 2002:a17:902:b40b:b029:12b:997f:5677 with SMTP id
 x11-20020a170902b40bb029012b997f5677mr2107776plr.11.1627519622110; 
 Wed, 28 Jul 2021 17:47:02 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 10/43] target/s390x: Implement do_unaligned_access for
 user-only
Date: Wed, 28 Jul 2021 14:46:14 -1000
Message-Id: <20210729004647.282017-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-s390x@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu.c             |  2 +-
 target/s390x/tcg/excp_helper.c | 28 +++++++++++++++-------------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b7b05f1d3..9d8cfb37cd 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -267,12 +267,12 @@ static void s390_cpu_reset_full(DeviceState *dev)
 static const struct TCGCPUOps s390_tcg_ops = {
     .initialize = s390x_translate_init,
     .tlb_fill = s390_cpu_tlb_fill,
+    .do_unaligned_access = s390x_cpu_do_unaligned_access,
 
 #if !defined(CONFIG_USER_ONLY)
     .cpu_exec_interrupt = s390_cpu_exec_interrupt,
     .do_interrupt = s390_cpu_do_interrupt,
     .debug_excp_handler = s390x_cpu_debug_excp_handler,
-    .do_unaligned_access = s390x_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index a61917d04f..9cbe160f66 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -82,6 +82,21 @@ void HELPER(data_exception)(CPUS390XState *env, uint32_t dxc)
     tcg_s390_data_exception(env, dxc, GETPC());
 }
 
+/*
+ * Unaligned accesses are only diagnosed with MO_ALIGN.  At the moment,
+ * this is only for the atomic operations, for which we want to raise a
+ * specification exception.
+ */
+void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                   MMUAccessType access_type,
+                                   int mmu_idx, uintptr_t retaddr)
+{
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
+    tcg_s390_program_interrupt(env, PGM_SPECIFICATION, retaddr);
+}
+
 #if defined(CONFIG_USER_ONLY)
 
 void s390_cpu_do_interrupt(CPUState *cs)
@@ -602,19 +617,6 @@ void s390x_cpu_debug_excp_handler(CPUState *cs)
     }
 }
 
-/* Unaligned accesses are only diagnosed with MO_ALIGN.  At the moment,
-   this is only for the atomic operations, for which we want to raise a
-   specification exception.  */
-void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, uintptr_t retaddr)
-{
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
-
-    tcg_s390_program_interrupt(env, PGM_SPECIFICATION, retaddr);
-}
-
 static void QEMU_NORETURN monitor_event(CPUS390XState *env,
                                         uint64_t monitor_code,
                                         uint8_t monitor_class, uintptr_t ra)
-- 
2.25.1


