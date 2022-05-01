Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0088A516243
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:40:16 +0200 (CEST)
Received: from localhost ([::1]:45758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3Fg-00070X-2Y
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U6-00071x-M0
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:08 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:34643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U3-0001PI-Tg
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:06 -0400
Received: by mail-pg1-x531.google.com with SMTP id z21so9509726pgj.1
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NgxsvnW311osB1m0PaTzB1/zyzTpUBL9MpOPjCAC0zA=;
 b=rUOWgaS4vwR8VVvkrEvuhKIa7e1UdDZddaGjJek5fnPe9pFwWKkBWiX91H1aqAKuc4
 o+akn8esQQieNVMXFK2q/Jnoz2PoKtrFlI3XW79A4aJbllbo9DR6Ug3FFs/mpbbFr/hL
 2k/+T9gqGKgE26fBhoyMts2ZGfjtZZEaTI1PuUHrvpIBiH9tlMNEZ8gK/MKQ/OXnCgG2
 qEP8SEUUokr1aFMQeg3FmdjsF8v41DWyTsTm6OuXa/WsKLuKerTKd6BXZ9iACgwHT81z
 +RqVR6gcls8C6KP7X97HMaApkflDjN7FINGLIcrQngBRFkGU7FvuSCJ+i+MPLwhu3bFD
 6bNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NgxsvnW311osB1m0PaTzB1/zyzTpUBL9MpOPjCAC0zA=;
 b=hpKFSwbkMiAWiHHlpiNuDmtr959NaqyjZUx2QUumFqVpQI4fQk+33TQxuoydReJ4Ed
 0mmYvHhycff91XtkHcvPNyNQGqemBTWiUblRssnXXx2LBI4I2jV4TbB91byB8SLyCz37
 fkdbLRC2pl29VtKexf9GJ2TtWaVE+EIhppPYdTE9mb9YoJTuJYrHWwE9CBf5QHbITT4g
 vc1CZHFUO9Rn9yTQXnIm4KpcGCSFFt/WKvKa/HAG8LB4SMh2hIdK0MXNTq+TlR/7LU1K
 +WTmL6nf94TT90XbGPoPuX7PKnBFJUrucs0Fon0C7NR5n+oHlnMnz8uoiR++P1c6n007
 oV1g==
X-Gm-Message-State: AOAM533OGf8ADmTHvNn8u+tnrXnL3TkM58zrxWokE/KOHHRlXJ9JGTxx
 j7jI+bKMqImkZh4t9b/ZYop7H3rul5FoJQ==
X-Google-Smtp-Source: ABdhPJwg6m66RLxQ4Gyr6mbBR3MdFxtklTRzox96eIpkMJStFVWE901OF82IAykbvEMSfFUuU7txCw==
X-Received: by 2002:a62:170b:0:b0:50a:6901:b633 with SMTP id
 11-20020a62170b000000b0050a6901b633mr6221375pfx.34.1651384260981; 
 Sat, 30 Apr 2022 22:51:00 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:51:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 32/45] target/arm: Enable FEAT_Debugv8p4 for -cpu max
Date: Sat, 30 Apr 2022 22:50:14 -0700
Message-Id: <20220501055028.646596-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

This extension concerns changes to the External Debug interface,
with Secure and Non-secure access to the debug registers, and all
of it is outside the scope of QEMU.  Indicating support for this
is mandatory with FEAT_SEL2, which we do implement.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 2 +-
 target/arm/cpu_tcg.c          | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 965f35d8c9..0acac6347c 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -15,6 +15,7 @@ the following architecture extensions:
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
+- FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 202fd5c46e..88d3cef93e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -799,7 +799,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
-    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index b6fc3752f2..337598e949 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -76,8 +76,8 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
-    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
-    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.34.1


