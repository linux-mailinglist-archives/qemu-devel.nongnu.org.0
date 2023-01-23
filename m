Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CDE677CC2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:41:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx03-0006GG-Kw; Mon, 23 Jan 2023 08:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzk-00060j-0z
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:23 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzi-0002Lc-6B
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so10607034wml.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=brguCCskR07IlO3tUdOSX78gsX0q+RbP7/3ek3OIEVI=;
 b=oe00pt1Y7Exut/UqdK4ma9r5e400xIJ9sRy/7fHUKWoA6Y4C3tEDLnC3DZnEBdUuPK
 3K5uJz7qEld9FKcGXHecKalRLakl21bCv2t3cd8IW+Gt0YwNMb5G4mjqBBulY95lPRa5
 Akw9nfaUoigcfUeeQYMm0iyTd++JAnIoFBmu1T55Y6cnXPzf+5NYyQnPlFwm8h2NUPse
 hqc6pwD/ov1Iu01zPaULD6zhN1B4SINYjf7uZCTq2EdFW849hCDD3vgreDq3GUCMit8A
 h7BVLFR6ssJON0S0momCdo+W9gzYnpribaCAwSm7W6U8qRdT5JorUo2ysl6liplkHkC9
 2QyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=brguCCskR07IlO3tUdOSX78gsX0q+RbP7/3ek3OIEVI=;
 b=xIlPXVlcR1/hgSWxr4w4wDC57jFAkgxJ+oRhcmXEtQ9y8sl0zPd3WmrMGY3uEYnr5p
 NKlQyakhnfDKNO+hxpFrM01NvsxuM8LQbfCb328eb+pLShJBLmGogHdlH0oXZTt5heFO
 IJLRzkOjl+ZsVyW/NLJT1eCKxyYbHoYwsE5GHLUmd5bCrF2rtA9nW4JEwPUMOoVgW1f9
 RSC6XFOUttst0m8W4AoW/qgwC9ZZHpujXd18KV2titYZK4ZCFwgnXFiLlD5L8tkmhNqA
 UGWooj0//5SOQCnfV5/cIkTjY+bUc0C5hxsr9G5PzFD6foAbZKw6buHEwf9Ci6/VvN2E
 Lmww==
X-Gm-Message-State: AFqh2kocTKlSiqbnUHWCWmZDJAIFdF2Bsr1ofrq9GjLKZGQvSjaV9ve4
 pGm9bWlj1GyQN2HtX4cYT8njqYYyoyZfkMxo
X-Google-Smtp-Source: AMrXdXvhy5ZMXxbcTbYz5ALHyo+ZLDcDjnPgcKbNkmXuDQwC+yhphRVdEXMX0iEweyaWhsR5oYLf3A==
X-Received: by 2002:a05:600c:3d9b:b0:3db:1afd:ac36 with SMTP id
 bi27-20020a05600c3d9b00b003db1afdac36mr17776682wmb.32.1674480976228; 
 Mon, 23 Jan 2023 05:36:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/26] target/arm: implement DBGCLAIM registers
Date: Mon, 23 Jan 2023 13:35:50 +0000
Message-Id: <20230123133553.2171158-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>

The architecture does not define any functionality for the CLAIM tag bits.
So we will just keep the raw bits, as per spec.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230120155929.32384-2-eiakovlev@linux.microsoft.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h          |  1 +
 target/arm/debug_helper.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f3ddc3b7793..8cf70693be4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -495,6 +495,7 @@ typedef struct CPUArchState {
         uint64_t dbgbcr[16]; /* breakpoint control registers */
         uint64_t dbgwvr[16]; /* watchpoint value registers */
         uint64_t dbgwcr[16]; /* watchpoint control registers */
+        uint64_t dbgclaim;   /* DBGCLAIM bits */
         uint64_t mdscr_el1;
         uint64_t oslsr_el1; /* OS Lock Status */
         uint64_t osdlr_el1; /* OS DoubleLock status */
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 2f6ddc0da57..f95a73329db 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -632,6 +632,24 @@ static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static void dbgclaimset_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    env->cp15.dbgclaim |= (value & 0xFF);
+}
+
+static uint64_t dbgclaimset_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* CLAIM bits are RAO */
+    return 0xFF;
+}
+
+static void dbgclaimclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    env->cp15.dbgclaim &= ~(value & 0xFF);
+}
+
 static const ARMCPRegInfo debug_cp_reginfo[] = {
     /*
      * DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
@@ -715,6 +733,21 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tda,
       .type = ARM_CP_NOP },
+    /*
+     * Dummy DBGCLAIM registers.
+     * "The architecture does not define any functionality for the CLAIM tag bits.",
+     * so we only keep the raw bits
+     */
+    { .name = "DBGCLAIMSET_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 6,
+      .type = ARM_CP_ALIAS,
+      .access = PL1_RW, .accessfn = access_tda,
+      .writefn = dbgclaimset_write, .readfn = dbgclaimset_read },
+    { .name = "DBGCLAIMCLR_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 6,
+      .access = PL1_RW, .accessfn = access_tda,
+      .writefn = dbgclaimclr_write, .raw_writefn = raw_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },
 };
 
 static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
-- 
2.34.1


