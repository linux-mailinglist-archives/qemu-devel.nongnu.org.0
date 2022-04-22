Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19E750BEE1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:39:28 +0200 (CEST)
Received: from localhost ([::1]:40758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxFf-0003TZ-P3
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXY-0002N0-F3
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:52 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXW-0007N1-GC
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:51 -0400
Received: by mail-pf1-x42d.google.com with SMTP id i24so8523477pfa.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xZiQ5sI/cjyhT5QWt0cEWlmc3OyTlqSds1eKWRRIBd0=;
 b=Y6lOq6ZSMPEkjSV/xMW/R9WFVry/sbF14huSQPMuC144hbzCqEJJBhJZBz7TluAtcD
 vVGv2Rf9kHQ5qEoPjzItff+0nji+NnLv9IARTwUTfr6tjYUSVJ+DK0Qbj+EHlDHpb3hC
 NQSWn9KcUfXazI4BZuq7dbo7S87oBbISCq6APg7+wdGBVsIMIV1KzAP94UpkK/P6mmDt
 GGzkjF6JMOfVr39kTcBFyA+xkfom7O0Wq1wVMs0Nh+GL+8rqnirDz3koFNK3QOAZ0vO8
 h/KWn8I9SsZmrjPvxXO1hHwrI0L5aWKmdyIj1w4tVauqSX0Zlg9LJFU4lMRlm1FtJndc
 IaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xZiQ5sI/cjyhT5QWt0cEWlmc3OyTlqSds1eKWRRIBd0=;
 b=VjZ5gUr78daDeLTBlTwv2swYx0UIIpomSbWRcjkDh5bwE13QH/xEegeWMxSJZPRe/B
 qrE/G6zGTkqpZxP9VNuBYO8A0Nt7I+DfO+1hdDAnx23MOR+JocmCsJr8fEhzy6zrk+TB
 Y8uEwCmkr1HgZ+1bZdDfoo8Y+nU9xcxtTJTDfh8XW3QHw8D5wND/46mLVGFzXcJgDRw5
 0MT9JBjsia9+p6S/fasmhT+UVDwcrrfaiIyGkONjQXjl2WPPXbpMWEifPU55JJy2BfIv
 xEmkH9i0xgC6iq4ViUKIwHxtPJITf/0UZ3EdJdtUyAveoI5Cod0wgcpBUXP+mLsvOW/i
 3TMA==
X-Gm-Message-State: AOAM530/LG/pmGcQ1/sqEqgHK+O6jvZI1D4I/60awYODaWLWJ2WUiM6A
 +EzO7ONhgubs4is39ClT36CqvNkr9htBNBCf
X-Google-Smtp-Source: ABdhPJxVeJmnS/6R12tkTaqCkQz3dKzsrZGN/33Sgv7rVGt8aSbKcipEEmRGsn3WqbAEMAN3HsPlHg==
X-Received: by 2002:a63:5b22:0:b0:39c:c5a2:b683 with SMTP id
 p34-20020a635b22000000b0039cc5a2b683mr4749046pgb.279.1650646428694; 
 Fri, 22 Apr 2022 09:53:48 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 39/68] target/nios2: Implement CR_STATUS.RSIE
Date: Fri, 22 Apr 2022 09:52:09 -0700
Message-Id: <20220422165238.1971496-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Without EIC, this bit is RES1.  So set the bit at reset,
and add it to the readonly fields of CR_STATUS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-40-richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index a0c3e97d72..7d734280d1 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -54,9 +54,9 @@ static void nios2_cpu_reset(DeviceState *dev)
 
 #if defined(CONFIG_USER_ONLY)
     /* Start in user mode with interrupts enabled. */
-    env->ctrl[CR_STATUS] = CR_STATUS_U | CR_STATUS_PIE;
+    env->ctrl[CR_STATUS] = CR_STATUS_RSIE | CR_STATUS_U | CR_STATUS_PIE;
 #else
-    env->ctrl[CR_STATUS] = 0;
+    env->ctrl[CR_STATUS] = CR_STATUS_RSIE;
 #endif
 }
 
@@ -127,6 +127,7 @@ static void realize_cr_status(CPUState *cs)
     WR_REG(CR_BADADDR);
 
     /* TODO: These control registers are not present with the EIC. */
+    RO_FIELD(CR_STATUS, RSIE);
     WR_REG(CR_IENABLE);
     RO_REG(CR_IPENDING);
 
-- 
2.34.1


