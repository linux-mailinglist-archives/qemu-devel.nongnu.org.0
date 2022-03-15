Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672374DA431
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 21:46:00 +0100 (CET)
Received: from localhost ([::1]:42664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUE3L-0000HF-Fu
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 16:45:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUE0l-0006VZ-RU
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:43:19 -0400
Received: from [2a00:1450:4864:20::42b] (port=33383
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUE0d-0008Fr-Pv
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:43:16 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j17so311217wrc.0
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 13:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WycAF8d80bSEEtTzMR7OOBpkMnt1IEDbms0IgFG2ZfY=;
 b=qTrH1bKMHvU3tp4DRJ1MgFeGljvV30cJQwSJ62GKNVgJrvO+X/mu+71Sjw2O94ynuD
 G4w/oU8A1RbslVnbVvoCPE66OPb1A7txgvqOcgGXNSjDUWThN3pj+aLSF4DBe13HCoCO
 oJzspgsaM/RpWJh8zZ1Qdow/H1RxSdW9g0uDD6RNuSJndU2zmys2oTq8SolFDQmtn7I4
 LAmYrWBQ8VjwxjC+HpCknbCeYeifnOlJYRwiGG0CSkkVyTcyxev7QESqKZUZAlE3jFIX
 e7Y/d4NhRwyLAdd8NOVwBPYPgTMy0tZE+l8SKD0IwS7Ccje1RJpCPUaoZA6G2vlMhVhz
 1CFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WycAF8d80bSEEtTzMR7OOBpkMnt1IEDbms0IgFG2ZfY=;
 b=MxbBJe8z/SbiD8OZ45W8YDB/4K+S3K6bVjRFrx8Q5lRUnwwEu9hEK4yHmAGCyObpcC
 m3BUVKGDbHjVvId/VDeG8B09mfK+n7s72nDI3QCbSEpiNMJfWd4GhzxyIAd1Xf7WPJTr
 RtYG1PnFZebHM8+hZAJ2e/FHaruG8VsWD2K30bptITW11eA6rF8m6Z8hr445Ngob+Bq5
 UMO81ovKckv1L8z9GguMiHaC2TUNiLVHYviTujvRFq8vKTTcdcft5ZU9MCCY+4mO1nbn
 c6LfW5kwb8MpSnbFU/ZjJ4XXMGJn0eg3FQr/btU9ZwHD/KW0BcCTQ5OobEZqocNvBgQZ
 eI9w==
X-Gm-Message-State: AOAM531Nt02vI9+Dwlmh2dtfiGWBadKqLLO8W/NAy9XGLRqvwkAktAQ2
 5JTBKGPSpQNhOd6UaoQflda1NhXQ5/RK2A==
X-Google-Smtp-Source: ABdhPJw9XhHEYR7zj89fhTGYneqzLI+1L4aYRNIBwgaj7WTVD9VlXXJBQqR77UjIwBFu5TqVrFV88Q==
X-Received: by 2002:a05:6000:12cf:b0:1f0:6875:9577 with SMTP id
 l15-20020a05600012cf00b001f068759577mr21141924wrx.304.1647376990443; 
 Tue, 15 Mar 2022 13:43:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a05600c414b00b0038c6c3eaee9sm465208wmm.1.2022.03.15.13.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 13:43:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm: Log fault address for M-profile faults
Date: Tue, 15 Mar 2022 20:43:06 +0000
Message-Id: <20220315204306.2797684-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315204306.2797684-1-peter.maydell@linaro.org>
References: <20220315204306.2797684-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For M-profile, the fault address is not always exposed to the guest
in a fault register (for instance the BFAR bus fault address register
is only updated for bus faults on data accesses, not instruction
accesses).  Currently we log the address only if we're putting it
into a particular guest-visible register.  Since we always have it,
log it generically, to make logs of i-side faults a bit clearer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 3bd16c0c465..b7a0fe01141 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2272,7 +2272,13 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
          * Note that for M profile we don't have a guest facing FSR, but
          * the env->exception.fsr will be populated by the code that
          * raises the fault, in the A profile short-descriptor format.
+         *
+         * Log the exception.vaddress now regardless of subtype, because
+         * logging below only logs it when it goes into a guest visible
+         * register.
          */
+        qemu_log_mask(CPU_LOG_INT, "...at fault address 0x%x\n",
+                      (uint32_t)env->exception.vaddress);
         switch (env->exception.fsr & 0xf) {
         case M_FAKE_FSR_NSC_EXEC:
             /*
-- 
2.25.1


