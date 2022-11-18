Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A9C62F0EB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:20:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxX1-0001Km-2d; Fri, 18 Nov 2022 04:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWt-0001Dd-1D
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:26 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWp-0005wJ-P7
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:22 -0500
Received: by mail-pl1-x635.google.com with SMTP id io19so4047259plb.8
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFfgs3OCmiINOoIxkAFBJxh98qGAkPlN373hocZd7nU=;
 b=SraggbNbOXppVluWWPdaxMnqM0dBKiF87StwDWA9shT2a1i0pxlII16CmLLimS8ez1
 udbroKWCGLBb+1OMtIKUejsPkK3W/bjnZWV5LCB4bID7cLDXqgoWRecHj11zqIcJioO7
 /4JtVtdeCsQxB/JuIm2kt8RdufMrqMFbnBpxQHenSdH5o0vgtbCZh0LyJoq25zUBXDM9
 GC3OGj6IaGHipO6wcofw4cvCELq5e3Sa0H/MSCKUyKGNgH5Cspm4CQod9zJN3UL5xAEX
 O3Se3HTW2r+nWsWKIMCgv/9k4/m9Fuiin4xQpPPr/FiA1/1RPUN5+LCsOaOhthv5HH5l
 P/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pFfgs3OCmiINOoIxkAFBJxh98qGAkPlN373hocZd7nU=;
 b=uPlW7xT0VFoT0/U66lgtccNEV+dlYncrcAw4F3bXTZrVwmuJBrDWjsnh79Qc2hgAH5
 ip4/L2kl1eYM4a+hAJQZnVc6ZHEURSuSDhHs3pSSLMcDYYgDObjbDao26XXklDLirmgd
 3vG/9Tn8+XwOUaqNN9jkN7+Cxe5NWAsVXOTphDT8vLWUpQ1syVcYbupX+ZCnDWg3ck8f
 Cs1i9U75ABD23ontRGKKtyJO1MPx/gr9QGh9QUtN1IA6WcGPEv6A7xZhUcLAP+P+H4Fh
 0xWEKCv7ZrRjV0hLd/GaqkcnsAbes+S9ylNOohBl0zxUtYa3YB3A2hr62bkkqfmy5V2M
 eRrg==
X-Gm-Message-State: ANoB5plwW/XWvh5zUmmXObGDsAZsuUUASKpI6M9aStq5k/3mzHDuTjiY
 3QqpDj21ng1Bs+XykJ5WiuTHb/7XqTMRtQ==
X-Google-Smtp-Source: AA0mqf5TQPHZITuWKf24CSYstsRAWjZVTlq3FK726nX7iG4C+8t81JDBNCRFakDGqjZrmEi8vVf0cA==
X-Received: by 2002:a17:903:1351:b0:186:5f82:3812 with SMTP id
 jl17-20020a170903135100b001865f823812mr6859173plb.51.1668763148770; 
 Fri, 18 Nov 2022 01:19:08 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 a27-20020aa794bb000000b0056e8eb09d57sm2672305pfl.63.2022.11.18.01.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:19:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 4/7] target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 cpu_interrupt_exittb
Date: Fri, 18 Nov 2022 01:18:55 -0800
Message-Id: <20221118091858.242569-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118091858.242569-1-richard.henderson@linaro.org>
References: <20221118091858.242569-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In addition, use tcg_enabled instead of !kvm_enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: qemu-ppc@nongnu.org
---
 target/ppc/helper_regs.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index c0aee5855b..779e7db513 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -22,6 +22,7 @@
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "helper_regs.h"
 #include "power8-pmu.h"
 #include "cpu-models.h"
@@ -203,17 +204,10 @@ void cpu_interrupt_exittb(CPUState *cs)
 {
     /*
      * We don't need to worry about translation blocks
-     * when running with KVM.
+     * unless running with TCG.
      */
-    if (kvm_enabled()) {
-        return;
-    }
-
-    if (!qemu_mutex_iothread_locked()) {
-        qemu_mutex_lock_iothread();
-        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
-        qemu_mutex_unlock_iothread();
-    } else {
+    if (tcg_enabled()) {
+        QEMU_IOTHREAD_LOCK_GUARD();
         cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
     }
 }
-- 
2.34.1


