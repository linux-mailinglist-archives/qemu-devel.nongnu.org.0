Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A743449E844
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:01:41 +0100 (CET)
Received: from localhost ([::1]:57414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD89U-0002BC-H0
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:01:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zT-0006oN-3V
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:16 -0500
Received: from [2a00:1450:4864:20::434] (port=46896
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zN-0008OP-PB
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:14 -0500
Received: by mail-wr1-x434.google.com with SMTP id l25so5501243wrb.13
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uro/87OmdJ9VYj+C+oygu8t7WovRg4G1f/DHiBXFt7o=;
 b=IkeAIzHivng1HQ/nQ+S4sRI/FdGS4WUcsT3ZPfGKELg/79p2zACQpbTe93SjwI2Eui
 hYiqU8+GxrXnFstorrGt03sfHelkLjvmLVNzyh1a/jSi3cwZm42++tq/lAStK55WOtGQ
 /NvwfOlgGCX8p+wjhsD5yUo3DOhmrsG1JkZWRYp4epB9xZCWzyUQp8YzyXtVQ8y/xbzI
 Ks07KgN71UooYqLYY+5sKx/0/+lk9YlcoQefRJVT20JrYst4y3NIrfhThZ7mZu9n0fVF
 WUJjh2YRGbhShrKMYEBWJaAvDVJfIphS8dvhEEbwVVsurX/9XdiXeDSGS/79748gTzie
 Meew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uro/87OmdJ9VYj+C+oygu8t7WovRg4G1f/DHiBXFt7o=;
 b=TVZhzyf9VKCI6MZ3N3h/MUdD2uByPWcaqEq6d99OYCmUQw3u7IBXTKeaRkuyVle+Uw
 +MWNfO6ceu51NQOM5oLR0A38b7qDRipQke7ZOnocJSwJpqWYSJrHtB3UQWN5+RAKlYf1
 e+U2EkVnkcRbcR1SGI9w9uXiMrGUa26jUU7z9WzHYfxYOzRb16LjK9cqD5sVpniX5yiE
 xsS40bCPWBy7dfchW/6UNI3puc8fwIbi44fQOx1UG8jHQuLyqmHi0v8oVH05/25rOyVd
 NF4Q+q2Hm9Ls9kK09QkoUC+UmOBGBbTdJ/dIwzszEI7OGSPErQ6SktqFrjhVENPzfMvn
 AAbg==
X-Gm-Message-State: AOAM532UYkjhFI2igBBvl+/nHIoduq4VV67rHc3ad2weDEq6KYMPhxaB
 23tHkbbLoVk3BIMrORCKWaP2Zw==
X-Google-Smtp-Source: ABdhPJyp6HkHmPzDWR8YSwaOmwxkbjTrFwLsJefClygZi5d1vrpNSyDxmNxCmyXMcqLeM8yog47vYA==
X-Received: by 2002:adf:e54e:: with SMTP id z14mr3593821wrm.490.1643298423277; 
 Thu, 27 Jan 2022 07:47:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:47:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/16] Revert "Revert "arm: tcg: Adhere to SMCCC 1.3 section
 5.2""
Date: Thu, 27 Jan 2022 15:46:33 +0000
Message-Id: <20220127154639.2090164-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have arranged for all the affected board models
to not enable the PSCI emulation if they are running guest code
at EL3, we can revert commit 4825eaae4fdd56fba0f, thus
reinstating commit 9fcd15b9193e819b, without bringing back the
regressions that caused us to revert it.

For clarity, here is the original commit message of 9fcd15b9193e819b:

The SMCCC 1.3 spec section 5.2 says

  The Unknown SMC Function Identifier is a sign-extended value of (-1)
  that is returned in the R0, W0 or X0 registers. An implementation must
  return this error code when it receives:

    * An SMC or HVC call with an unknown Function Identifier
    * An SMC or HVC call for a removed Function Identifier
    * An SMC64/HVC64 call from AArch32 state

To comply with these statements, let's always return -1 when we encounter
an unknown HVC or SMC call.

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
2.25.1


