Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12DE4D4686
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:12:48 +0100 (CET)
Received: from localhost ([::1]:42636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHex-00067C-Mu
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:12:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxe-00065D-6Z
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:02 -0500
Received: from [2607:f8b0:4864:20::52f] (port=42544
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxc-00080R-HR
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:01 -0500
Received: by mail-pg1-x52f.google.com with SMTP id o8so4480933pgf.9
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Bkn+M8H5Sg7KsSEJjzM7NcRnu8uA0epSOYEx1aHzNA=;
 b=XmJyrFeH3FCnsweb9OB80hyfGlrS4hcMEAeHrT7uRfkYCpYS/hwQr16W7mnPOPtW4q
 tcAU+Gsek5hKjxBDXp2XoRlXX5BbiRiaZxfF94ESM+9zV+Oyzatk5HOOwTYkiNk181wZ
 s4guo0dUAXXjzNR0mspMRB9R1+36pTVG3mVsRbM8MUi76d3CNbKCheRYgbANttvdXJ6e
 CerWfr9TmJ1J/VYy3xD9vuiHLptz7LgY+H9F5ycwDyP6UadsxsMWwyJasr6V1/a81RJg
 YCcQQWgmDycQHMEY3i7C+QNtQwe/7+QR/LVuX0BxtrzCOOytXptHU5K3J5vMaDRrxz9E
 HSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Bkn+M8H5Sg7KsSEJjzM7NcRnu8uA0epSOYEx1aHzNA=;
 b=6ZFyHYzzxV9NMq0H637iKLDVlmxIKRb1mwW0Zeehpi1q5ADJVbWrksZAwwREy3+7ij
 MKKW965UkDY7l+Rqdf0rE0jjIET6KBHWeqrmYBCveb9uAGiW8/gndEa9ZyCPQHXiIf9+
 XvGy4S3G4zf6MVtHTySndXOS3J3L4nksv7aSmGok/PxFcIrZjGvhTd/J08EvqKnd5Hr0
 bZbJFNMA7OVIlrWPD5srQDDq6pYcLx+zddcRrs9NWIqzOcnXCf+6KkvximhJSZOWH8Nf
 H0dCLOztSqJb2Pzm11eWo3POyfQNHRGHpFVLGoD3cmAvU+ZAv5sDj6E6CXi09WKHHFLj
 iFsg==
X-Gm-Message-State: AOAM533xT7dMNcUoQxBmncssMQ0+40bnEHH19cSM1QScSK+y2pQ6ejJU
 LZ7JbRB3XNl/TNwjf5Yd31oZUTJZNoecUg==
X-Google-Smtp-Source: ABdhPJx5aF8+UO+veZ8Rrqk9ZD1tFuiCCvsg9pNSVfpMupQs0+KvQdyljvZKH05zA9lUouAqHCunWA==
X-Received: by 2002:a63:1665:0:b0:378:ba21:ddb9 with SMTP id
 37-20020a631665000000b00378ba21ddb9mr3659626pgw.268.1646911679120; 
 Thu, 10 Mar 2022 03:27:59 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 28/48] target/nios2: Implement CR_STATUS.RSIE
Date: Thu, 10 Mar 2022 03:27:05 -0800
Message-Id: <20220310112725.570053-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without EIC, this bit is RES1.  So set the bit at reset,
and add it to the readonly fields of CR_STATUS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index d491360973..64dc916ed2 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -56,9 +56,9 @@ static void nios2_cpu_reset(DeviceState *dev)
     memset(env->ctrl, 0, sizeof(env->ctrl));
 #if defined(CONFIG_USER_ONLY)
     /* Start in user mode with interrupts enabled. */
-    env->ctrl[CR_STATUS] = CR_STATUS_U | CR_STATUS_PIE;
+    env->ctrl[CR_STATUS] = CR_STATUS_RSIE | CR_STATUS_U | CR_STATUS_PIE;
 #else
-    env->ctrl[CR_STATUS] = 0;
+    env->ctrl[CR_STATUS] = CR_STATUS_RSIE;
 #endif
 
     env->regs[R_ZERO] = 0;
@@ -109,6 +109,7 @@ static void nios2_cpu_initfn(Object *obj)
     WR_REG(CR_BADADDR);
 
     /* TODO: These control registers are not present with the EIC. */
+    RO_FIELD(CR_STATUS, RSIE);
     WR_REG(CR_IENABLE);
     RO_REG(CR_IPENDING);
 
-- 
2.25.1


