Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C854A2F1E9B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:08:32 +0100 (CET)
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2YJ-0003IK-Rb
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RP-0005gU-BV
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:23 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RN-0006Mx-Cf
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:23 -0500
Received: by mail-pl1-x632.google.com with SMTP id r4so321242pls.11
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+W6xF9BlSZ0veTM9KZDcL7jHpIjRPVY9kjtTlwGlZ0M=;
 b=JxfD0fC1AGe/Scuvi00ucHUFMSFQBMfGuuHGNG9umnt4bKy0EzUM/LSpN9+mFPGvp/
 8jafBDdWC6ijhrPTwJBxFFyJQwM/c9VCotR5fBiW8Bl9VrAwWLtCIOZ75SmxBOIRtmkJ
 ANXx7OO0A89AouZkmEmD3KnNlJiPzNygtVgKWOfaUqc6Rt/czqdFwpSl7xeUb7cwbtyb
 merjP1I6RdHXK5sPIpgqb418XhJb7Cwu6nQDhHiiG708MXGEcKuKuW/m1S06FCKAF9pG
 SNPPgf3O/iRPDDWdlp5WcBBVOuMH0gilQSKqOkirbG7JO9EeDKUebmOiE6uu8mj1K0xx
 OtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+W6xF9BlSZ0veTM9KZDcL7jHpIjRPVY9kjtTlwGlZ0M=;
 b=rG0fzPHs2WKWCdYF6WlCj8zeG/yNKBFgEBoZNtlj/Rq9KFq4p+QMq3f5J/fDiDsNt6
 vw8glMU33tqLO5/+i11QuQqUSWfttlsQzkZdectHL1L5SiMpvCm+/5Wvm4SH3SaB7zmq
 YOPSgKb0M6DtGXDRVHwd7110eQuZf2kKc69EkIORF+ZdXOB5KHuQ+nJc2OAqEo3CioUY
 ob9GY1mmpH29rTUQvH1iH3GhzTGoc1Ha2LaD7tTaeMmeMdJ3PggCiXPGC60yw37BnAW3
 tjf1y62MlTV/W/SttP/RVdrrcew6OToruwTrKuWPdStfygwWot3Iq2DRMbwUNIYVpsOK
 cexA==
X-Gm-Message-State: AOAM532asNuT4lEA1UDGJGPC4vbc5ypPUVRApL+FtSmnXry2beYBh25k
 79C2nL/5TmXqR7aORzyHBfA/je2zbHG/Zg==
X-Google-Smtp-Source: ABdhPJxU8/97v+fEY2TZ46UjpQ9sLuy6x8u8YSQH2bu2ivql8FPrBBXAci0PSrPlE0s3AvqkWhAPug==
X-Received: by 2002:a17:90a:674c:: with SMTP id
 c12mr302602pjm.98.1610391679789; 
 Mon, 11 Jan 2021 11:01:19 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/30] target/arm: Rename TBFLAG_A32, SCTLR_B
Date: Mon, 11 Jan 2021 09:00:45 -1000
Message-Id: <20210111190113.303726-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

We're about to rearrange the macro expansion surrounding tbflags,
and this field name will be expanded using the bit definition of
the same name, resulting in a token pasting error.

So SCTLR_B -> SCTLR__B in the 3 uses, and document it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 2 +-
 target/arm/helper.c    | 2 +-
 target/arm/translate.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7e6c881a7e..aa0bc6e281 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3293,7 +3293,7 @@ FIELD(TBFLAG_A32, VECSTRIDE, 12, 2)     /* Not cached. */
  */
 FIELD(TBFLAG_A32, XSCALE_CPAR, 12, 2)
 FIELD(TBFLAG_A32, VFPEN, 14, 1)         /* Partially cached, minus FPEXC. */
-FIELD(TBFLAG_A32, SCTLR_B, 15, 1)
+FIELD(TBFLAG_A32, SCTLR__B, 15, 1)      /* Cannot overlap with SCTLR_B */
 FIELD(TBFLAG_A32, HSTR_ACTIVE, 16, 1)
 /*
  * Indicates whether cp register reads and writes by guest code should access
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d077dd9ef5..0d70b37adc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12762,7 +12762,7 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
     bool sctlr_b = arm_sctlr_b(env);
 
     if (sctlr_b) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, 1);
+        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR__B, 1);
     }
     if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
         flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f5acd32e76..460476384c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8842,7 +8842,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
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


