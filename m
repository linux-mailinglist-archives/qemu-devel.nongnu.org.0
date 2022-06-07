Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD8D541732
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:02:12 +0200 (CEST)
Received: from localhost ([::1]:48888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygL5-0003K7-Uf
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfte-0000Ll-Mc
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:50 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftL-0007Bo-6C
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:49 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso16461281pjg.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PXODLC2IHauVSpNYetn9TZRjqsCN3EktuiLVX88MFHQ=;
 b=ZfUg08x841UKB/paTcDNbBiIoQDYtJK8r06r26gYcMRXvs3ghdj5X+/aE9guSjIs8k
 9Jt5i5F7F+0vi7b4mUylTFrMzJ+uMJ7GgJ4UA8Y6nxG4E9s+uMvd5giVTtHjnCcE41xi
 l1q9WzKrQPtPzklqdO5KGnl3Mfc5yFvDLApBHwuBifwBInRCe/jWFkMTI77UZbOgM+iu
 uWBKHNMksgC6W+ldb8/svj4no6bCHPKCwDy+W092UVQO8fuHBH1oUsAtufnwADkx3y0Y
 9tzYwdSV+gHWyGFstRYK/9Ul+jQdI8apPcmHs3+lz4dLQ2aZ5qCo7mVZPeE0Unme0exf
 duNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PXODLC2IHauVSpNYetn9TZRjqsCN3EktuiLVX88MFHQ=;
 b=6QLMW5kSXvH7sOcmm01GFsF8c/J9njAPsc3FSR+XrVmCRwxwgXvOEgfANeDNjDP/TN
 2MzJtci43IPWfAzVOPA5JVWDpHLDmeL0cSTUUFyt6gSsB8I7jJeuY8l3Df8+P5WOZSgD
 EH16y4YTPhTQ4MxxYEc36lyV+bi5xY+Isqiio+RKKqPi5h4+6Cn5z5uH85Owjxzg0Dji
 YcaQ/Dh7nbSsIGFy8W8tcF7Q3rkl5Sjti6sFUKeb2w/q0l4aL63MRCzOySLY0cyHvrmF
 xAq97gOEhJ0ZPruvPbpqUx4bV3UAReWrzUW4LJROI82pJTw+7uYTSg5v5aCBIFe5kSx3
 u8tQ==
X-Gm-Message-State: AOAM530T0PfyMhgY220Z/nycTXHQJ6VWDM166AZibOkN1Ow+ewvIBSDm
 lKRuIOsN4SBsDGzWzaIxaOtstD9rvXnuMA==
X-Google-Smtp-Source: ABdhPJwFLyyG9yiTt/IHQvsVpm3nEu+/HBmvgk/DoSG/HSJFhVs+Qu4AwHZccgkvaQrSsdqMcH4NEQ==
X-Received: by 2002:a17:902:8b8b:b0:167:4e55:2dac with SMTP id
 ay11-20020a1709028b8b00b001674e552dacmr22523389plb.132.1654634010346; 
 Tue, 07 Jun 2022 13:33:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 25/71] target/arm: Add SVCR
Date: Tue,  7 Jun 2022 13:32:20 -0700
Message-Id: <20220607203306.657998-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This cpreg is used to access two new bits of PSTATE
that are not visible via any other mechanism.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  6 ++++++
 target/arm/helper.c | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 511c30d7d7..f1a459af8b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -258,6 +258,7 @@ typedef struct CPUArchState {
      *  nRW (also known as M[4]) is kept, inverted, in env->aarch64
      *  DAIF (exception masks) are kept in env->daif
      *  BTYPE is kept in env->btype
+     *  SM and ZA are kept in env->svcr
      *  all other bits are stored in their correct places in env->pstate
      */
     uint32_t pstate;
@@ -292,6 +293,7 @@ typedef struct CPUArchState {
     uint32_t condexec_bits; /* IT bits.  cpsr[15:10,26:25].  */
     uint32_t btype;  /* BTI branch type.  spsr[11:10].  */
     uint64_t daif; /* exception masks, in the bits they are in PSTATE */
+    uint64_t svcr; /* PSTATE.{SM,ZA} in the bits they are in SVCR */
 
     uint64_t elr_el[4]; /* AArch64 exception link regs  */
     uint64_t sp_el[4]; /* AArch64 banked stack pointers */
@@ -1428,6 +1430,10 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 #define PSTATE_MODE_EL1t 4
 #define PSTATE_MODE_EL0t 0
 
+/* PSTATE bits that are accessed via SVCR and not stored in SPSR_ELx. */
+FIELD(SVCR, SM, 0, 1)
+FIELD(SVCR, ZA, 1, 1)
+
 /* Write a new value to v7m.exception, thus transitioning into or out
  * of Handler mode; this may result in a change of active stack pointer.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e0123dce67..e2d6d89a5d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6353,11 +6353,24 @@ static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                       uint64_t value)
+{
+    value &= R_SVCR_SM_MASK | R_SVCR_ZA_MASK;
+    /* TODO: Side effects. */
+    env->svcr = value;
+}
+
 static const ARMCPRegInfo sme_reginfo[] = {
     { .name = "TPIDR2_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 5,
       .access = PL0_RW, .accessfn = access_tpidr2,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr2_el0) },
+    { .name = "SVCR", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 2,
+      .access = PL0_RW, .type = ARM_CP_SME,
+      .fieldoffset = offsetof(CPUARMState, svcr),
+      .writefn = svcr_write, .raw_writefn = raw_write },
 };
 #endif /* TARGET_AARCH64 */
 
-- 
2.34.1


