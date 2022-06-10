Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273C0546A46
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:21:54 +0200 (CEST)
Received: from localhost ([::1]:58464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhOT-0005lN-8f
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB6-0007ld-AX
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:05 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB1-0007HU-SN
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k19so37123983wrd.8
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PTKcpTgabAiFMHgyhQ3dFAFEIJg9vmipCiuWLa2KbuU=;
 b=hTLetWyv83+n5PrqZd68p1In7wwV2gjcU0xc1wWvSwMAtZBkQwuFHF/zKE8OV5AHGM
 3SjZHOneMOJ3MyDqm+wiU3JYdYeLUAxKUrPzq9u3iArAsxnC+ihMGwz81dbFBB5P3hWM
 1x409yTYdMlb8NGzMkXUvQcljY0yBN8aY83tksP9KbbOm0DxIsbTk48CdE8kVo/ioI+9
 AqtRvgzKSPMWrOdfohb8q6UXVpkjzQhlITfllzA5hi3sXV1DhmtrOJ5M4QInosM/Sgdz
 8XSs+LPMTivt9npr5hgNGLNU7dedL8ngwl3dFyM+BKbjt8RK90nwuZBHJlTuOxwEvcnW
 bJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PTKcpTgabAiFMHgyhQ3dFAFEIJg9vmipCiuWLa2KbuU=;
 b=N3TxHbXMWxPmERSIqW4c7cUFCdo+S0gLcJhuTPmcKrl13TGm+DXFZHtPvu+nsA/A8k
 5BfwAVeRZqOuzp32WT4hTmafxnY1/Z7GSu+Na0x7MC8aKg7pqLySHD8VcJ2DPKqLkk/5
 7Fev1P+1MnwhhWOi1gBCEx5RbnWFYaYgrw0ichwcxzmdwLEpIRLh4gCdQ8/VQ+ILYCZv
 9utEEyusYvFyLyNRC5nH1KuxWSHWV8k+HAdxHpMzwgIDpW2t0uOsM3zcjazGyXXitAon
 JP/7XupJpo/6yw9GNOxR3mNVP4S26gNXOQSMWiL1e2iXoZfLREASM6z0FDmuNKyWidJW
 UnLw==
X-Gm-Message-State: AOAM530bAKobQN3zRW4ekxkZrN6NEOY4L9uoElb0Udwqe42A15aPR/Xs
 3CS/UPY+Nr5w7FXnofJhbR/aDnsK+/diug==
X-Google-Smtp-Source: ABdhPJwb+RAQnnRWZkiJkLngScZjbe0kReEXFaiL1ITMvTcXJ9W6t7ZnYbIpNVh/57U0Rml8R+d0FA==
X-Received: by 2002:a5d:67c9:0:b0:218:4a6a:298e with SMTP id
 n9-20020a5d67c9000000b002184a6a298emr23295963wrw.153.1654877278347; 
 Fri, 10 Jun 2022 09:07:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/28] target/arm: Remove default_exception_el
Date: Fri, 10 Jun 2022 17:07:30 +0100
Message-Id: <20220610160738.2230762-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This function is no longer used.  At the same time, remove
DisasContext.secure_routed_to_el3, as it in turn becomes unused.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-21-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h     | 16 ----------------
 target/arm/translate-a64.c |  5 -----
 target/arm/translate.c     |  5 -----
 3 files changed, 26 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 850bcdc155e..88dc18a034b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -43,8 +43,6 @@ typedef struct DisasContext {
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
     int vl;          /* current vector length in bytes */
-    /* Flag indicating that exceptions from secure mode are routed to EL3. */
-    bool secure_routed_to_el3;
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
     int vec_len;
     int vec_stride;
@@ -199,20 +197,6 @@ static inline int get_mem_index(DisasContext *s)
     return arm_to_core_mmu_idx(s->mmu_idx);
 }
 
-/* Function used to determine the target exception EL when otherwise not known
- * or default.
- */
-static inline int default_exception_el(DisasContext *s)
-{
-    /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
-     * there is no secure EL1, so we route exceptions to EL3.  Otherwise,
-     * exceptions can only be routed to ELs above 1, so we target the higher of
-     * 1 or the current EL.
-     */
-    return (s->mmu_idx == ARMMMUIdx_SE10_0 && s->secure_routed_to_el3)
-            ? 3 : MAX(1, s->current_el);
-}
-
 static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 {
     /* We don't need to save all of the syndrome so we mask and shift
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4f6181a5483..4c64546090c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14585,11 +14585,6 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->condjmp = 0;
 
     dc->aarch64 = true;
-    /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
-     * there is no secure EL1, so we route exceptions to EL3.
-     */
-    dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
-                               !arm_el_is_aa64(env, 3);
     dc->thumb = false;
     dc->sctlr_b = 0;
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 81c27e7c70c..6617de775fd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9319,11 +9319,6 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->condjmp = 0;
 
     dc->aarch64 = false;
-    /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
-     * there is no secure EL1, so we route exceptions to EL3.
-     */
-    dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
-                               !arm_el_is_aa64(env, 3);
     dc->thumb = EX_TBFLAG_AM32(tb_flags, THUMB);
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
     condexec = EX_TBFLAG_AM32(tb_flags, CONDEXEC);
-- 
2.25.1


