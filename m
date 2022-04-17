Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAB45048FE
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:43:40 +0200 (CEST)
Received: from localhost ([::1]:48744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9s3-0007uz-7N
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90Y-0004m5-BB
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:22 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90W-00046s-KT
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:22 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so736730pji.4
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ra+HmlDmjq5MC1Bo0b0qUr7KsvywnTjoaMfVjleqeaE=;
 b=B5l28oZWCEaPX16JktO6lmO5Gg+6b++FQW/pRoaRiT3pmR6WbHSzmdhBF+JcFoPxJr
 e4vHea6LIEz+69Sy3oc8QKdn9L7hHrFX1P/jCRd3TTgEw2bIlX1jpt0zifUSQFqFd19d
 bbmZMNxPF7ahYoS1D8Ddnlf/hTa9Rz6/og4nRprVGnr53qWweEymRp9CAb0ieU7oFwxh
 d5aYOR0j8IMm5OR+FOfWowNE52DlkiorhYmwq4RU1o9UxCl8PSERY+dPona7/mLPpFlY
 4xJgt/HjTLncszBMkEVBgS4BsR100Rmn6qOyRe7SE/jdQZs/bMzjG7veCpZcqFY8sSRG
 T38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ra+HmlDmjq5MC1Bo0b0qUr7KsvywnTjoaMfVjleqeaE=;
 b=gvN9y5M8B4ChxLS5KNS+mOGkdDNBJuFd6MELJL+xIyOyWny0YLYOmfH69ajslzl/DP
 WvijPzUW+hOpsJGhz6e8rGZHvGJCiJEO3N69Wwnbw3lFkvpuihxArBj4bj0f4zuI3prq
 MAImwFz+WLJg9bKThIgwDlrE3sADNheUAJMn5mO+6doIkKPxn5XKT+Is4F1zSReiGLSK
 067UdstJqac36fuKghdSIgGlPsWJzQYsJR9w1dXs8r/yZv2EBqC1vtUoQtZL86EL7N0T
 ddz6q6X+nAFNPaFquwL4oMAQ/YKWtg9Nz3BqrbI1N6sIiKSYK/e8HMdJ7cMPp50Fsgdc
 OP1Q==
X-Gm-Message-State: AOAM533qKR1oojcpuZWqhCyq8b6HzasNMy0UPFQvoZv6oseBf88WJJm9
 LhvbiMTkqZASNO0HeX6/y2LN3nR27ZAcRw==
X-Google-Smtp-Source: ABdhPJwvzgIc0n5lqFqm9ZNqNwnhmldHHPIUtbElFcBImJiP+CtRq/k0J9HvPuJy+61bTkx4G0FJqQ==
X-Received: by 2002:a17:90b:390d:b0:1d2:7a7d:170e with SMTP id
 ob13-20020a17090b390d00b001d27a7d170emr5351329pjb.230.1650217699222; 
 Sun, 17 Apr 2022 10:48:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 57/60] target/arm: Enable FEAT_CSV3 for -cpu max
Date: Sun, 17 Apr 2022 10:44:23 -0700
Message-Id: <20220417174426.711829-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This extension concerns cache speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index aebe3be1ba..f75f0fc110 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -15,6 +15,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
+- FEAT_CSV3 (Cache speculation variant 3)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6ccbcb857d..6139f51267 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -749,6 +749,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 762b961707..ea4eccddc3 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -74,6 +74,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
     cpu->isar.id_pfr2 = t;
 
-- 
2.25.1


