Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1C9364B24
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:29:07 +0200 (CEST)
Received: from localhost ([::1]:36750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaW2-0004GF-Gv
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQG-0006iX-02
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:08 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:36692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQE-0002Oe-8q
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:07 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id i9so17367562qvo.3
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uB71NFP/4FTiJdlqsyK1CbRRQcPRZoxgK7u/yhfJE24=;
 b=GNnPpgFwKyv5elUZB0zU22ZmSpv5m4ZAVovnQGvhkuL1myKK10G4mkfB9uBcUxcURh
 /2sRsH5C7Gf00ZVnEFoTsBQb/8JIzlMB1lTbRLpySv8PWqByyGHlYdi+XO9Mh15xdUq/
 O78BObTy2WDBsfDtARgYT9C1gSrcuhY7Z6gWU/4mJj9pAZe3zL2FpeYNMdFJ1oc8CKfF
 TQn9kv/yvoH3iyxaDaQssY2yyLeQ89swEeKLhvYguYm2Wqdf1oK3BvLUw0x3/t17k7bS
 dyB7J6Dl4U+FaH6V/xyK2EIlhtmuJ0swQ0YxkuWsHunEyz2i31l1EkksaUuub4gNfjTB
 DpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uB71NFP/4FTiJdlqsyK1CbRRQcPRZoxgK7u/yhfJE24=;
 b=iuXVlW8asnBiVTPs7A+9eBXdXpE3/GqTFvfNXBe9cccIouF3rB1qcgGs8SbBnFU1Ow
 OPBKpBgpT3vVp7K1s4YlmqsSYDoO3xZBTckM4QTENFNHDjp6yG6ce+BaN9WsFMENPjmW
 P/EQQBJCNnY71YPmH2BVf0mj1KfVcqwut1u5uw5+O+yetWEEFH8n6CrklP4xPj2RfZq3
 HglKfVp78pzkARGcuTPs76o7gnzfb/4q6qiFUekpcmUnOyBdgF1pgCTetkjSrs0DgjFX
 ZoOGkY1D6MR3lSTkuMgfWBc4ZfJYS342EqxdXAL5JRJO4l4ARA9Qoa02a9ysqTc8hyb1
 KLuA==
X-Gm-Message-State: AOAM532kBQgagKvhc81yyvWd7Mz8dcPeeGer0znCaT6xOWccto5/8kEQ
 GiD/Bmm/txd0hAV/mvnJxusSxR5MpKgGU5Wj
X-Google-Smtp-Source: ABdhPJzenkVGPW4xqimoDQQ2h7hNQLH2Wgs2mpx46iFlNrTLf0M+F4iJOrnbXoAz0UEoIm/6vracOA==
X-Received: by 2002:a05:6214:36d:: with SMTP id
 t13mr23295606qvu.49.1618863785293; 
 Mon, 19 Apr 2021 13:23:05 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/31] target/arm: Rename TBFLAG_A32, SCTLR_B
Date: Mon, 19 Apr 2021 13:22:28 -0700
Message-Id: <20210419202257.161730-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to rearrange the macro expansion surrounding tbflags,
and this field name will be expanded using the bit definition of
the same name, resulting in a token pasting error.

So SCTLR_B -> SCTLR__B in the 3 uses, and document it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 2 +-
 target/arm/helper.c    | 2 +-
 target/arm/translate.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 193a49ec7f..304e0a6af3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3423,7 +3423,7 @@ FIELD(TBFLAG_A32, VECSTRIDE, 12, 2)     /* Not cached. */
  */
 FIELD(TBFLAG_A32, XSCALE_CPAR, 12, 2)
 FIELD(TBFLAG_A32, VFPEN, 14, 1)         /* Partially cached, minus FPEXC. */
-FIELD(TBFLAG_A32, SCTLR_B, 15, 1)
+FIELD(TBFLAG_A32, SCTLR__B, 15, 1)      /* Cannot overlap with SCTLR_B */
 FIELD(TBFLAG_A32, HSTR_ACTIVE, 16, 1)
 /*
  * Indicates whether cp register reads and writes by guest code should access
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d9220be7c5..556b9d4f0a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13003,7 +13003,7 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
     bool sctlr_b = arm_sctlr_b(env);
 
     if (sctlr_b) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, 1);
+        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR__B, 1);
     }
     if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
         flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7103da2d7a..0b56e060a5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8879,7 +8879,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
             FIELD_EX32(tb_flags, TBFLAG_ANY, BE_DATA) ? MO_BE : MO_LE;
         dc->debug_target_el =
             FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
-        dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR_B);
+        dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR__B);
         dc->hstr_active = FIELD_EX32(tb_flags, TBFLAG_A32, HSTR_ACTIVE);
         dc->ns = FIELD_EX32(tb_flags, TBFLAG_A32, NS);
         dc->vfp_enabled = FIELD_EX32(tb_flags, TBFLAG_A32, VFPEN);
-- 
2.25.1


