Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94BF55B92A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:36:24 +0200 (CEST)
Received: from localhost ([::1]:45788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5m6Q-000064-U4
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltJ-0002JJ-1k
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:49 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltG-0004sK-4a
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 o16-20020a05600c379000b003a02eaea815so4625465wmr.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N45XJR7lvYA9N61Vw6ZzkFDcUGDF5yKoYKPb5Cpl1mY=;
 b=c9fxjm2R953G/D3g2S2gKQOzGVIvnPAOEBcbZ3ZjUX0Bz3f/jeED9LppfYU5JErpJD
 tGXqkhwTxcAdW0/lAu78S851DfZqTACpC63FOim5b/l4SCUFX0na0SIagUUlcg+Fs/5n
 fnIhCSWG39SvX+tEa+tF2hI1pf6UTfzCFDyM9SBicChyCFpYJfbkRKDTaw5xL3A/SGdx
 TE+1jU+a2qBxtSpv4Yu8Ib4jUbjJjim26TD1OSHqZ1uJ7m54STqYmTuM6f9r4WZ244K+
 iuE2JDiOYEcoWq00xSQUoncXqdc8fa7StedP86XfmU1FOd9hV6hT3gl3zBLv9V28xQ6T
 ZywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N45XJR7lvYA9N61Vw6ZzkFDcUGDF5yKoYKPb5Cpl1mY=;
 b=HHjxls9xuwg8fTKDP8jC4Ar1jQaZ+BPXX/Gbp1koQL5S4yc32/Do9HoAM3Rjtrtkvr
 FgVhTXE47Rmq5KMkGNmy3qcYGtIAUtxVlHG79wwsHeD/MUuGxWMDmJ68+pnkUj+ow19V
 Af8Btl/VtGyyQkQqbRB87ZUgXEn6QpYdvrU3R4k2ZOGtvTFGhunzV3woFfPMQk96i5ew
 aT3zymigJsvqk0WzJcaQKeLfd4dpCtYdDx3JZaIVA0BosBfCSpWhigsl3U6IW0Rc5A4G
 gR7cPEsVJMDgGTDeKyJOqnQqStUIXGmyDtUQxL7ERh5rUkU+9n7l8hLn3uT5SBJhtF/l
 m0Nw==
X-Gm-Message-State: AJIora8Hi4a2/DvGE0iutdVuI30N60WasCZ68TM1w9136lS9fE5i0vtJ
 TPez64acowe0KIe+TCPzmyR+zB+sH1pnLw==
X-Google-Smtp-Source: AGRyM1uwbM6SWHImGxS7JoRqtvXRPU/RD86DZ4BDG7zR2tAkkLAVcwj/U7mMBmbqxgMX3MbBZDGTJw==
X-Received: by 2002:a05:600c:4f14:b0:39c:8612:a95e with SMTP id
 l20-20020a05600c4f1400b0039c8612a95emr18660334wmq.107.1656325364453; 
 Mon, 27 Jun 2022 03:22:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/25] target/arm: Add SVCR
Date: Mon, 27 Jun 2022 11:22:19 +0100
Message-Id: <20220627102236.3097629-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

This cpreg is used to access two new bits of PSTATE
that are not visible via any other mechanism.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  6 ++++++
 target/arm/helper.c | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e99de180978..bb8cb959d12 100644
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
index 2c080c6cac0..3acc1dc378a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6349,11 +6349,24 @@ static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
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
2.25.1


