Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19F44079B3
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:02:58 +0200 (CEST)
Received: from localhost ([::1]:46620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6P3-0003Uu-Q4
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6He-0006t3-V7
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:18 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Hd-0002Sw-Hc
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:18 -0400
Received: by mail-wr1-x434.google.com with SMTP id m9so7506204wrb.1
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=geqo+TfqXlGgpu7vXFZNKLzFP6S151+7irB5AEU8QIk=;
 b=IDFzf7nGI4NuCEO7ATmtnY0sLQSx9mJ+m6h0qthylyFe9fRKnXhJZyGmu70yE4BFha
 QzHBfYILyFfZoBA6BxixN1JCdTafMXE6ivxR6cy7VMD8ICVvDRtbvWm82E+8a3EwyOn6
 h4TeUxTSK0/LNBdbdnPU+nAtTJcwRtWUXppDGLihME9ybwl9kK/TsHhhNMqwKbrUj8f6
 k04lLLdQYKFVa7fgT/gRWqGsW91+//PLhn9Sr7Eaaz9TWPo5YHZOb47XgDVttD6PPNmM
 0NrifKSEio7vA6nC0QW8gaq8UjUUu7loPpE0SpNpKNiZGfbc9KzQMq67WzX8vNcp5KkL
 vf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=geqo+TfqXlGgpu7vXFZNKLzFP6S151+7irB5AEU8QIk=;
 b=7M1TX2Yi9vOf5NubVHyi/LcwiAK5UKFtp8jnx9hsdDHTG0uUCXpYRFWYN79ScwZKg9
 YIfAjyDp5EmnnTnFksb1caWqcXBPy9tx4omt7ILDRfq7/ibPCkCWdzTlw063lFUAzYDW
 3yRTci1xJn/pBpnKvsqjXB2Hb1FZnITH6QItBi1OP0SJi1H7p8NlLDI7bCFvfuLFVLg9
 wApAqlt0p3RD6b5BYJiubB9oWKYdrjI7rz2k5I5ilOEofb3gYIOqYs22aOUyyzLooDl4
 E3k8qcXQIlrLKmUHnDJqGk3Y/tdoJLx37E6FMUVNtQlAWehBkrRrXk0X+duStTs8vAaw
 7Lig==
X-Gm-Message-State: AOAM533EonTx9yayarH0ivGT2qcSp1YRWJ66LU1Ks021vcCxDVotmpLR
 FwoQqCUqPwSxHtmib7n+dHF/sCD9Vrk=
X-Google-Smtp-Source: ABdhPJw9bHA7HE3lakYAFtA/OMyqeWbPmJ+IZkvlG7vNkN+U9u9wIYJTE44598EPQR3/CnW6n7pBBg==
X-Received: by 2002:adf:9d4b:: with SMTP id o11mr3836952wre.29.1631379316117; 
 Sat, 11 Sep 2021 09:55:16 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l124sm2023427wml.8.2021.09.11.09.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:55:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/24] target/cris: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sat, 11 Sep 2021 18:54:18 +0200
Message-Id: <20210911165434.531552-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/cris/cpu.h    |  2 +-
 target/cris/cpu.c    |  4 ++--
 target/cris/helper.c | 17 ++---------------
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index d3b64929096..be021899ae8 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -185,11 +185,11 @@ struct CRISCPU {
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_cris_cpu;
-#endif
 
 void cris_cpu_do_interrupt(CPUState *cpu);
 void crisv10_cpu_do_interrupt(CPUState *cpu);
 bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif
 
 void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 70932b1f8c7..c2e7483f5bd 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -205,20 +205,20 @@ static const struct SysemuCPUOps cris_sysemu_ops = {
 
 static const struct TCGCPUOps crisv10_tcg_ops = {
     .initialize = cris_initialize_crisv10_tcg,
-    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = crisv10_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
 
 static const struct TCGCPUOps crisv32_tcg_ops = {
     .initialize = cris_initialize_tcg,
-    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = cris_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/cris/helper.c b/target/cris/helper.c
index 911867f3b48..36926faf323 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -41,20 +41,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void cris_cpu_do_interrupt(CPUState *cs)
-{
-    CRISCPU *cpu = CRIS_CPU(cs);
-    CPUCRISState *env = &cpu->env;
-
-    cs->exception_index = -1;
-    env->pregs[PR_ERP] = env->pc;
-}
-
-void crisv10_cpu_do_interrupt(CPUState *cs)
-{
-    cris_cpu_do_interrupt(cs);
-}
-
 bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr)
@@ -287,7 +273,6 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     D(fprintf(stderr, "%s %x -> %x\n", __func__, addr, phy));
     return phy;
 }
-#endif
 
 bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -319,3 +304,5 @@ bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
     return ret;
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


