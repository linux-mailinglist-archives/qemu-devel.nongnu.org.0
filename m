Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A0730E372
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:44:41 +0100 (CET)
Received: from localhost ([::1]:58134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7O4u-0002ne-5R
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NP1-0007du-3t
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:23 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOr-0001pg-K1
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:22 -0500
Received: by mail-pf1-x431.google.com with SMTP id w14so438040pfi.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EwcrKH1NrGFZArzgiK/QBy4uHtN2oVX1PxAv1FeIOOw=;
 b=KGxnUJ9qDsrFTKjk25EcVGJVMOzNbvgfGFRnhNksKCNKzfP5n1ZcHlfOs+onsCkE0L
 5LblwcCxDCMqhe80Rw6nm/MPkAs/cK5uO0iMYYKjh3nfly3MPmUWkSZ5tHnKBgHBVqMk
 Bt9T2VExF9ZC4sqdL/P1kIME/764hsiFKool2hciqRS9Cg+rW1MZFtRI603Q4C893DlV
 g/CoNCR2idriTiyWabyPH5jEhOJtNFXf7Na2GhEGee89t+jvN46J5/I+y4SoZQg0gbUW
 1htMXB0g3fASjSNShqpS4aJFCgZWLoIFrtos4MMdF5JdV2cBjCRcRERCY3LbTLKFfOMP
 rflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EwcrKH1NrGFZArzgiK/QBy4uHtN2oVX1PxAv1FeIOOw=;
 b=AAb9k0oDqMzboKgC9Y9hY9Wi9QnqWpWb+vQSTy2B3UZ8w0E9GDvvMNi/PFXyNVWCVM
 xr8o8sQwFU/nHOmlh0oN1Jy0Y2rJEfM1J7VdGQWz1UHf2gn48S0/3GEpnKBRBpNb+DnH
 WkB1ptTrE+usOQYxH3nd2RcI/3GtrczWCYq/Xm00tgDAkAw5o8IM36s2tbdlljm9Cpbg
 I/wXDQt++DJ/D9FHc39DPKCYzHaffXnkgDyuRIhF4erbL+BKkDRpj3wQob07sSxA1d2f
 zyRXyhxg0D1tPtiMUibtYJOjwEPfNPDkCwNa9q7T3BEsnRBsDZS4a93RlLa0vQpVlepQ
 4k2A==
X-Gm-Message-State: AOAM533jHgHq0GVxtxEM7SyaLISn/dg0bPsD774V3ogWpiLsaklc8Lhy
 7DRdHoQ37hjJX2IVsMpGTHauCqIqHBymbUim
X-Google-Smtp-Source: ABdhPJz5FpHBfKEPNssEERXY7zG18GPbflRPOxtrU3cLSn1YWcq3ncw/dek6Zpk0060LzEh5sE4PMw==
X-Received: by 2002:aa7:9585:0:b029:1c5:10ce:ba7f with SMTP id
 z5-20020aa795850000b02901c510ceba7fmr4354677pfj.79.1612378869073; 
 Wed, 03 Feb 2021 11:01:09 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:01:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 27/31] linux-user/aarch64: Signal SEGV_MTESERR for sync tag
 check fault
Date: Wed,  3 Feb 2021 09:00:06 -1000
Message-Id: <20210203190010.759771-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h | 2 ++
 linux-user/aarch64/cpu_loop.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index ddd73169f0..777fb667fe 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -21,5 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
+
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif /* AARCH64_TARGET_SIGNAL_H */
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 4e43906e66..b6a2e65593 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -134,6 +134,9 @@ void cpu_loop(CPUARMState *env)
             case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
                 info.si_code = TARGET_SEGV_ACCERR;
                 break;
+            case 0x11: /* Synchronous Tag Check Fault */
+                info.si_code = TARGET_SEGV_MTESERR;
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.25.1


