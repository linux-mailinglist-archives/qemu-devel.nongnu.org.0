Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE4150A515
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:16:19 +0200 (CEST)
Received: from localhost ([::1]:46586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZTe-0006X8-7t
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcx-0005Qv-4K
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:58 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:36635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcq-00074l-KE
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:50 -0400
Received: by mail-il1-x131.google.com with SMTP id k12so3257733ilv.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAOBAdpFirowQkrpBHBZFvb0hegnnbNMVmy07bqALLY=;
 b=Kqwr4mAJ74f1H4L1GpISBM0R6FH/kR0JtD2twdp28reN76GoLV5Ogt0aOM/rUHDtAP
 ivhFaBdZgVxWdwaE+qKiL5PeRoT/IJkhUF1o9PWz4XS2owcVHzh35nXE733V6Lc/3FZ3
 nb4iSJBeeEWUe+i418ExHRY/LyJaKa0iBKEPwM9lTjBumqXdP29iF/+315hCNlJyD/UR
 ZSFz/1M9Sq10wvHSoPTFrpW1DiRJ2wzSTnQx26zhZuMQOXFbUxyIqgZbRCsbCmTvKgfF
 KnAkQedSt19BbLmUjscj9KsnYOiOMeRHEx74yrjwStVvvxX6VeBzVdvXN6YUGKuKQrcj
 MAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAOBAdpFirowQkrpBHBZFvb0hegnnbNMVmy07bqALLY=;
 b=QXHB+XPUNvpTXA3d9MB7Gf8DBGXPbe4BkycrFfzfNi0lhTV458yRzO7LfUmHBn6n75
 tiad4dOqQw3ZlAKRMiqJsqvxJ9COvuRE5dGwby2oGeAiv2puFFI2/+sTmCC8QGX8+Zp/
 Dzqxu4d1EEtv+rAaUoBFOTybeTDVcNsyUymcD+gBtC7xCpnIndZXVmgMP6R/I3kxvs1J
 w917C2mLPLfDZS27SLnU4kKaa7Rw6hAcuKHH5Pet6CFf/nLEPGbjmMmWBDHCkGqRXLWF
 VI9hp+H78oEGaZyQqhLLQA//z/17XlBEogQrVWImbeJCumhCYM1JIOBqKcNLgy9aPwiY
 /ing==
X-Gm-Message-State: AOAM533hnSNaqtswIjGCv2VcLmLEqEyM/3cvZAIjf1TJ8mhkHgBreP6A
 zEWvgtuDO6xom8edn41bltGxJ08mrwetdQ==
X-Google-Smtp-Source: ABdhPJzN2+l7gbuppidfQ0p0iavn4wxUQxEO0GaZhA+1rpxxcimo0gfMDh6hrBz8MXP97gg/bJ4nZQ==
X-Received: by 2002:a92:ca06:0:b0:2cc:3a47:e5d with SMTP id
 j6-20020a92ca06000000b002cc3a470e5dmr79595ils.115.1650554501504; 
 Thu, 21 Apr 2022 08:21:41 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 40/64] target/nios2: Remove CPU_INTERRUPT_NMI
Date: Thu, 21 Apr 2022 08:17:11 -0700
Message-Id: <20220421151735.31996-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This interrupt bit is never set, so testing it in
nios2_cpu_has_work is pointless.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 2 --
 target/nios2/cpu.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 5f6b9242a2..5403eeae54 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -177,8 +177,6 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 #define EXCP_MPUI     16
 #define EXCP_MPUD     17
 
-#define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
-
 struct CPUArchState {
     uint32_t regs[NUM_GP_REGS];
     uint32_t ctrl[NUM_CR_REGS];
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 7d734280d1..58e6ad0462 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -36,7 +36,7 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
 
 static bool nios2_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
+    return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
 static void nios2_cpu_reset(DeviceState *dev)
-- 
2.34.1


