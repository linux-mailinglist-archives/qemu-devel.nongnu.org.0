Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A583E2B9D6E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:14:32 +0100 (CET)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsCF-0006Ui-DM
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvG-0000ya-AN
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:58 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv1-0004Ec-96
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:57 -0500
Received: by mail-wm1-x341.google.com with SMTP id p22so8566970wmg.3
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ztib3BbeM9JUbGctUP1Ui7NNujTzQdmeDBZWCNALq4Y=;
 b=mUXBV4Y+GEwgY3duB07dfXllNzghYWt8Z2qs1Ffwu7SivtqckZ2A2G9CFDsP8kAsdN
 woUBO8uPbrj7ezmWhc0KnpEyJm6WIJ7p2N1xSJlMwlt9hSjrTmJlUUd1k8zjb6A2qHbD
 YP02FDN3y3BnILNvMEtlraIr9M6WAnX1JNyfms0kTSwqjgMHdEnG1HfMAXw/f20Mr43h
 vodutjC8lSytAyUqlTCBbXNLP6XaGF7hGiQxLTpOig9zN4W4dIjMfUOo5qhm0QsrD2Pj
 mLbfKdXbk+7vMhT3fweZnAkXsGWARfJe4NAUN+4KHbSvqIdm3SW6dBEoTBblOrGB4ZYJ
 PW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ztib3BbeM9JUbGctUP1Ui7NNujTzQdmeDBZWCNALq4Y=;
 b=djLU+2qx+cOFXIDzZRgZz9lCF42AxiSq2F5b4kl+4B8h7nKgGZNoqiCsUZqFaFebgS
 PCQRgLuqbUZHsFhSZIEquKLFW67QBGAjPn+LQH2Af0tTp4qMQxUBIcd1HWIHed3bMi+3
 wKjRaQUjPuBbi7z0aTTy7FzSCYwBgyNY+QTQ4NFRIJIhPVlHMu6uSBaSaCdrT04Vuce/
 g6CDyh+bXMPyc0OW9MeL6P7cwkapCqcUaAMX58z4i0EvClhOMjvfjv2xnm4QJ2B6u23A
 6zEV6eRvZaRpvlG0rOKvqCLnzhgUgwX9BA8MZCTxFxcGq/iB8GQoAQxjLWiH8TaGax+m
 SYhQ==
X-Gm-Message-State: AOAM531qhbYIWaqKgPP3W3ZkDXjNeZ+tiZDpWMOFQ8/rjZTJ2GaPLe32
 g1FHDSBv59eP+1YN7hemUHBtFwP+66U5Vg==
X-Google-Smtp-Source: ABdhPJy5lYRFRQqmheM5QAa2OxDAuhqj9nnrwW/ihm3vwafRVssOdiG0u25fMidyWM4ChSONfBVqfQ==
X-Received: by 2002:a1c:1d51:: with SMTP id d78mr6547219wmd.60.1605823001969; 
 Thu, 19 Nov 2020 13:56:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 19/28] target/arm: Implement new v8.1M NOCP check for
 exception return
Date: Thu, 19 Nov 2020 21:56:08 +0000
Message-Id: <20201119215617.29887-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
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

In v8.1M a new exception return check is added which may cause a NOCP
UsageFault (see rule R_XLTP): before we clear s0..s15 and the FPSCR
we must check whether access to CP10 from the Security state of the
returning exception is disabled; if it is then we must take a fault.

(Note that for our implementation CPPWR is always RAZ/WI and so can
never cause CP10 accesses to fail.)

The other v8.1M change to this register-clearing code is that if MVE
is implemented VPR must also be cleared, so add a TODO comment to
that effect.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 9cdc8a64c29..0bdd3cc10e9 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1515,7 +1515,27 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
             v7m_exception_taken(cpu, excret, true, false);
             return;
         } else {
-            /* Clear s0..s15 and FPSCR */
+            if (arm_feature(env, ARM_FEATURE_V8_1M)) {
+                /* v8.1M adds this NOCP check */
+                bool nsacr_pass = exc_secure ||
+                    extract32(env->v7m.nsacr, 10, 1);
+                bool cpacr_pass = v7m_cpacr_pass(env, exc_secure, true);
+                if (!nsacr_pass) {
+                    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, true);
+                    env->v7m.cfsr[M_REG_S] |= R_V7M_CFSR_NOCP_MASK;
+                    qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
+                        "stackframe: NSACR prevents clearing FPU registers\n");
+                    v7m_exception_taken(cpu, excret, true, false);
+                } else if (!cpacr_pass) {
+                    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
+                                            exc_secure);
+                    env->v7m.cfsr[exc_secure] |= R_V7M_CFSR_NOCP_MASK;
+                    qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
+                        "stackframe: CPACR prevents clearing FPU registers\n");
+                    v7m_exception_taken(cpu, excret, true, false);
+                }
+            }
+            /* Clear s0..s15 and FPSCR; TODO also VPR when MVE is implemented */
             int i;
 
             for (i = 0; i < 16; i += 2) {
-- 
2.20.1


