Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB2041DD49
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:22:10 +0200 (CEST)
Received: from localhost ([::1]:45074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxsv-000680-Rg
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjE-0008WT-TQ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjC-0003tR-CG
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:08 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t8so10711990wri.1
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0GE2AGcFHy79W+XlJkL7M8hbutjaw0ssS0YKptIt1WQ=;
 b=byq43GK5WXv51v9fdv3pVuZScJxE6hi+pEh5wM12U+r8+pUn+VQMRxvWD8VtY6pyYl
 VD1Vf/JAuml3wEMfS7kKOH8w2q7Gyd1uusGeHHpQNshroQzMaa9Qjk+zlW4FptvioASA
 g/VcJVnN2ZGU+8itKrNaLC7rP9kDS3EpucUcUuXzt5b0nC7Acag/9rZiYbcX5bi4NX+R
 ps6Yex2HLD5feQ1uTzrxuSqws0L2Fk3FPACI6CBPzvNsBNC+cgfoHMIgJrSLC9jOnm6O
 Gd+mD46tHenUnITO9wj6qT6geUkWLJ3gcHLqAEAJDnK1SRNtjFiZUdpo9fLW1cVXHze1
 cAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0GE2AGcFHy79W+XlJkL7M8hbutjaw0ssS0YKptIt1WQ=;
 b=J6j9FZk3D9xqjUGFbF+RarrBZV5+lD/cSYhRcrpt6Do8Ks4TKqLTVIZPIoSR4Qha4Q
 clkQzwwx9PkEuQ2n2rqIpaLsCODlaoarFROD6ycCdkD4VpjGcY1Ecl6XqH2KL/zG7Tru
 jEuQgppJtQwYgVCJHEsJlPZ1PMql8sS9b6uLDeCD2lEeWCaD3ZAkIRp03iiZoZ9NCD1E
 GSkPs0UJsjrydWgHEjbLzVUb46RApdDwDQWitwB2CGYYL9nlpckDtBowXFdDhHmRkxR5
 IAH9edpLVZo6dX2RiFK4Q2ZSpUSgVm0dxe2Fjk2IEDz05i/I6c47roMsCTdyMZOyBSrn
 cfDQ==
X-Gm-Message-State: AOAM531VPmlBUZWAAthHOTTzmLoBzgz0EcyTpeJqa0zenX3oeq019uJ3
 8eHK0JC0l6AgePRQHcaLGPYFuQ+gDYNMmw==
X-Google-Smtp-Source: ABdhPJzsU90/k108fQxQJF/r47sucdhvhWkrrPL2pekPXr/ZL+GpSQj0wuYx1Rv8NsdM6LN5AT1ksw==
X-Received: by 2002:adf:d1c9:: with SMTP id b9mr6990510wrd.426.1633014724921; 
 Thu, 30 Sep 2021 08:12:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/22] arm: tcg: Adhere to SMCCC 1.3 section 5.2
Date: Thu, 30 Sep 2021 16:11:41 +0100
Message-Id: <20210930151201.9407-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

The SMCCC 1.3 spec section 5.2 says

  The Unknown SMC Function Identifier is a sign-extended value of (-1)
  that is returned in the R0, W0 or X0 registers. An implementation must
  return this error code when it receives:

    * An SMC or HVC call with an unknown Function Identifier
    * An SMC or HVC call for a removed Function Identifier
    * An SMC64/HVC64 call from AArch32 state

To comply with these statements, let's always return -1 when we encounter
an unknown HVC or SMC call.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/psci.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/target/arm/psci.c b/target/arm/psci.c
index 6709e280133..b279c0b9a45 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -27,15 +27,13 @@
 
 bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
 {
-    /* Return true if the r0/x0 value indicates a PSCI call and
-     * the exception type matches the configured PSCI conduit. This is
-     * called before the SMC/HVC instruction is executed, to decide whether
-     * we should treat it as a PSCI call or with the architecturally
+    /*
+     * Return true if the exception type matches the configured PSCI conduit.
+     * This is called before the SMC/HVC instruction is executed, to decide
+     * whether we should treat it as a PSCI call or with the architecturally
      * defined behaviour for an SMC or HVC (which might be UNDEF or trap
      * to EL2 or to EL3).
      */
-    CPUARMState *env = &cpu->env;
-    uint64_t param = is_a64(env) ? env->xregs[0] : env->regs[0];
 
     switch (excp_type) {
     case EXCP_HVC:
@@ -52,27 +50,7 @@ bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
         return false;
     }
 
-    switch (param) {
-    case QEMU_PSCI_0_2_FN_PSCI_VERSION:
-    case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
-    case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
-    case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
-    case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
-    case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
-    case QEMU_PSCI_0_1_FN_CPU_ON:
-    case QEMU_PSCI_0_2_FN_CPU_ON:
-    case QEMU_PSCI_0_2_FN64_CPU_ON:
-    case QEMU_PSCI_0_1_FN_CPU_OFF:
-    case QEMU_PSCI_0_2_FN_CPU_OFF:
-    case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
-    case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
-    case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
-    case QEMU_PSCI_0_1_FN_MIGRATE:
-    case QEMU_PSCI_0_2_FN_MIGRATE:
-        return true;
-    default:
-        return false;
-    }
+    return true;
 }
 
 void arm_handle_psci_call(ARMCPU *cpu)
@@ -194,10 +172,9 @@ void arm_handle_psci_call(ARMCPU *cpu)
         break;
     case QEMU_PSCI_0_1_FN_MIGRATE:
     case QEMU_PSCI_0_2_FN_MIGRATE:
+    default:
         ret = QEMU_PSCI_RET_NOT_SUPPORTED;
         break;
-    default:
-        g_assert_not_reached();
     }
 
 err:
-- 
2.20.1


