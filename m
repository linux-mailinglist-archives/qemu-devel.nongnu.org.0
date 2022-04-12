Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324364FC96E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 02:44:46 +0200 (CEST)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4eD-0001Jt-9W
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 20:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TW-0001tc-1k
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:42 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TT-0001qd-Ib
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:41 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso947914pjb.5
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dtTGUMiSnFk96I625AJId4KHgbX9clvONkgy858IMl4=;
 b=kZ28dxrfHx3bNs4mON+0J38Vn00gfc3gAEQoai0tGz9dnd9JSsqO77qIRLIEue5Z9l
 zSOy8AaEcivvdrGBFI80NZGoqjgCAIGESvh4XxZG01afAka5co3Ad1HGSeb8D0LtzD+K
 FghvytqIigYO7AlSgVZRk/DjeacTUzFaxxAbu5lEUIEOw18ob3RY+0ZnYxvq5DN8jK6y
 /XBouTWJU6fXKAohZvWJEIjhKQ3qqikc1+dmHRNeVWpHHxpMZhLygEkuqfhDsZD7N7hl
 DNr1DL5NRm4Zc0SwbyJLNx390gYCAAXlc/vlnIAuooDsKgb5JVmOjFN5zBtC6ZLPAq7/
 +84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dtTGUMiSnFk96I625AJId4KHgbX9clvONkgy858IMl4=;
 b=bMDukrkOMBe9NmtVUdTrNPFMs6EG2BcGg5DdeHpWKVADqlOsYQX3Q4Gyun+6UxbOSN
 Sl37JyZLAMYUHSQ5cTHavmCAd48wAl8uQ6KO50TiUufl+SQn/Um1zNMqhc1EiVJjTvfG
 Hl95eyfuJrkraUNM+Svyj9CExqdm5WJlbYLfxfpTVTkitwlx/eo8KShUpm16vvxrnGp4
 aYOq25MMwULQkBZFJz0NGzPTqZvMPk0CnI3OJywKagILnXcsZFbDkl4LFLCZ54FVD6qV
 Y4BIOYgYZA+SWsgPVcwl0ub8A1j/MY26HqW/5//Zj7y9TGnGFGgO3HTpi4MM2rJlYAyP
 afCg==
X-Gm-Message-State: AOAM532zsmbtN3tSnjJWCCaKj/fhvz301AlrHwb6r2ldhqeCFLKXnbxe
 HDf5Rs5YS6AhqoAWQeWETRUik4R3YuMkvg==
X-Google-Smtp-Source: ABdhPJwbXH438hGT9lld7wnOJP5xMDJCaUbF9QmtpGPc0aF9RPw2nXWYFrTajilMcYVr3gLU4nzFTA==
X-Received: by 2002:a17:902:ef4d:b0:156:82dc:b7e1 with SMTP id
 e13-20020a170902ef4d00b0015682dcb7e1mr35105530plx.78.1649723617264; 
 Mon, 11 Apr 2022 17:33:37 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/24] target/arm: Enable FEAT_Debugv8p4 for -cpu max
Date: Mon, 11 Apr 2022 17:33:12 -0700
Message-Id: <20220412003326.588530-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
index 035f7cf9d0..c89c344de1 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -14,6 +14,7 @@ the following architecture extensions:
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
+- FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 33570c3b6d..9bed76342f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -797,7 +797,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
-    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index e719696412..4ff4f30e89 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -75,8 +75,8 @@ void arm32_max_features(ARMCPU *cpu)
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
2.25.1


