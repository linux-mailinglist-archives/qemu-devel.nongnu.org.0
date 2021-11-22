Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231EC458FAC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:46:59 +0100 (CET)
Received: from localhost ([::1]:53694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9es-0007Rl-8h
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:46:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp9bp-0005wj-LO
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:43:49 -0500
Received: from [2a00:1450:4864:20::32e] (port=36860
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp9bm-0002yh-UE
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:43:49 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso16824915wml.1
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QtycwYKH46ndmhVQ28QqqPnj2RqndVlu0g56ghXJQdM=;
 b=epy863vdNnoYzOwBS2htxhMP24nTpGODMegNgptHpBFVVN/7jCZnx01uLyrxNZsi9t
 gx2X/SeHG8/NaYcbqITlcmPFp+bOjOt+AdGT8yU+doga5IBlVhTZlVNQtKSlyzg5Ejzp
 6vwqSpiFxVpMpwj2JLqiocCBBcS+wfma7Qf/GI2PNLw2jtwhChtSksmW1zhrpbTOrDG/
 Mxk52YHxR0kP3PxQahaYWM0D4NjpxdJmx2G4YzN3p5jRJQLTMvMcWSIcIZiShHtixbz2
 aueRFv0mixMMno7xwVHFxWIoN9LmZhdj6XQFG9vPCBsWZIwZ7G5znEddZSCYRaj8qnuz
 sXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QtycwYKH46ndmhVQ28QqqPnj2RqndVlu0g56ghXJQdM=;
 b=CLwHNrzMFColI/LfJ/a+FzmTPn8fwg2iXCY7NEO/0Tq+8v6SWKkMoP83iU7EeR5+YE
 X9sqloaeLsZuT3ppRJAoeoKf0PcQxgiEr8M+6sk1wq4O3JG7eN3TMg8sDG87r/tYe6mn
 +fYj21jJvVz/MVt/rAsfooDqLiYFFSoueGOlNrMU6gi8kfYvr5G68KXWicbQiS+yy/9/
 mo6lNpCfQGlRUQvj+CZcX0Nir5itNVyeYg+izbOaDQsZROcsDUPKzcY+AHUoGtSolwUO
 by0GSqfQlsse6ID+gjcA6miZ2TPlAhOBdvIpYEta8rNTbYxlIdfUOMd4brPuhjGcp29/
 9RkQ==
X-Gm-Message-State: AOAM532c+aUDwyxoXLunJjwY0SOTh8hNgBv+SE2JZFhJiAMhqWR+aPYl
 GaObI89tBCRH6m79RiA8ghZbOHPyteIitw==
X-Google-Smtp-Source: ABdhPJxYGUkAXlfBn1/hYKoOcKpnRmjVu6FQDaxfZFu0Bj0NeZpQ5iTz9LlWy4td2cZCupwT6Ikimg==
X-Received: by 2002:a05:600c:2149:: with SMTP id
 v9mr30600269wml.59.1637588625495; 
 Mon, 22 Nov 2021 05:43:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t11sm8931474wrz.97.2021.11.22.05.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 05:43:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] Revert "arm: tcg: Adhere to SMCCC 1.3 section 5.2"
Date: Mon, 22 Nov 2021 13:43:42 +0000
Message-Id: <20211122134342.660953-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122134342.660953-1-peter.maydell@linaro.org>
References: <20211122134342.660953-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 9fcd15b9193e819b6cc2fd0a45e3506148812bb4.

This change turns out to cause regressions, for instance on the
imx6ul boards as described here:
https://lore.kernel.org/qemu-devel/c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net/

The primary cause of that regression is that the guest code running
at EL3 expects SMCs (not related to PSCI) to do what they would if
our PSCI emulation was not present at all, but after this change
they instead set a value in R0/X0 and continue.

We could fix that by a refactoring that allowed us to only turn on
the PSCI emulation if we weren't booting the guest at EL3, but there
is a more tangled problem with the highbank board, which:
 (1) wants to enable PSCI emulation
 (2) has a bit of guest code that it wants to run at EL3 and
     to perform SMC calls that trap to the monitor vector table:
     this is the boot stub code that is written to memory by
     arm_write_secure_board_setup_dummy_smc() and which the
     highbank board enables by setting bootinfo->secure_board_setup

We can't satisfy both of those and also have the PSCI emulation
handle all SMC instruction executions regardless of function
identifier value.

This is too tricky to try to sort out before 6.2 is released;
revert this commit so we can take the time to get it right in
the 7.0 release.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20211119163419.557623-1-peter.maydell@linaro.org
---
 target/arm/psci.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/target/arm/psci.c b/target/arm/psci.c
index b279c0b9a45..6709e280133 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -27,13 +27,15 @@
 
 bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
 {
-    /*
-     * Return true if the exception type matches the configured PSCI conduit.
-     * This is called before the SMC/HVC instruction is executed, to decide
-     * whether we should treat it as a PSCI call or with the architecturally
+    /* Return true if the r0/x0 value indicates a PSCI call and
+     * the exception type matches the configured PSCI conduit. This is
+     * called before the SMC/HVC instruction is executed, to decide whether
+     * we should treat it as a PSCI call or with the architecturally
      * defined behaviour for an SMC or HVC (which might be UNDEF or trap
      * to EL2 or to EL3).
      */
+    CPUARMState *env = &cpu->env;
+    uint64_t param = is_a64(env) ? env->xregs[0] : env->regs[0];
 
     switch (excp_type) {
     case EXCP_HVC:
@@ -50,7 +52,27 @@ bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
         return false;
     }
 
-    return true;
+    switch (param) {
+    case QEMU_PSCI_0_2_FN_PSCI_VERSION:
+    case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
+    case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
+    case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
+    case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
+    case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
+    case QEMU_PSCI_0_1_FN_CPU_ON:
+    case QEMU_PSCI_0_2_FN_CPU_ON:
+    case QEMU_PSCI_0_2_FN64_CPU_ON:
+    case QEMU_PSCI_0_1_FN_CPU_OFF:
+    case QEMU_PSCI_0_2_FN_CPU_OFF:
+    case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
+    case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
+    case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
+    case QEMU_PSCI_0_1_FN_MIGRATE:
+    case QEMU_PSCI_0_2_FN_MIGRATE:
+        return true;
+    default:
+        return false;
+    }
 }
 
 void arm_handle_psci_call(ARMCPU *cpu)
@@ -172,9 +194,10 @@ void arm_handle_psci_call(ARMCPU *cpu)
         break;
     case QEMU_PSCI_0_1_FN_MIGRATE:
     case QEMU_PSCI_0_2_FN_MIGRATE:
-    default:
         ret = QEMU_PSCI_RET_NOT_SUPPORTED;
         break;
+    default:
+        g_assert_not_reached();
     }
 
 err:
-- 
2.25.1


