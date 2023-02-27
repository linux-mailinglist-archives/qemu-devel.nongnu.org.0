Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE566A4D48
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:34:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWl84-0007Ey-IE; Mon, 27 Feb 2023 16:33:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl82-0007EI-DX
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:50 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl80-0004K5-Se
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:50 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so7018304pjg.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MvN6MH9XtbRDVN7/usi5kmILWEamfWIGeSaIRJTwC88=;
 b=n0wJg8dooAPjYYANl4Zs0R8tvA4FgrUvQZ/sJIzxBmFoeFleQoOesaaxwwbJbCTw5i
 E2x3Zx+6myEP3+vJGR23vm2x5x+94Rm9thvlYZFRz1Z1hGpnP0R2I9G6zHS+8KX9C7e8
 0W10K+hizPTOuc986iLq/mWu64Hk47GoR4rJTPjpLmks4OTKTia/iUyAsHhP0jQCJ4l/
 z/s2ozZ/9Sdwq949vKsMYVp6S0dWJvDtmlxPaE1l5H1wx0TAjpJLexkAbsj7xFhIUrv8
 fRVn2hTDMM4eyHGsnSkUVc1LxCRimWJnTXakHINLvR30uNm2UpzPw4SasJeYYA1oaN1L
 sH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MvN6MH9XtbRDVN7/usi5kmILWEamfWIGeSaIRJTwC88=;
 b=F6zw2XgfHoJ+kXTRoywYHerFfRxIG2jcn+4F8DeOLxZoL+CElUN0P1+enrEEtJe01E
 OsejBhVbzRu3dhggtNwXDr2pogp0bW4qX4z/RQlHjqcna6dBfi/gx0I8n2X9NoR523ny
 Wx5GIIndLiC7s+LTaMMolN32dvBYVRr8APWk2HyLKZCjLCt5wLX+26idRHcBkdUWqilH
 KJ0f5GM6bSgRLZO6vKpH+6giS07RX8045Zn7c3joXFXMNZRDoyHX15TXBfZdG3FDUtzT
 bdoC6cmGjRUqzanTwhhijlTymUgFmEQcQaOhVpdriqnRCNAl1Rl/Fy4gISKHf7SGsz4M
 PmVA==
X-Gm-Message-State: AO0yUKX9oG23g+y6t6Lc7JOhKh42tEF8m1YE05FzAhwIQ/UQPo2Sm543
 zpq97bYUM6vH6qGiHtq2EmMH6747Qi81B3gBtlU=
X-Google-Smtp-Source: AK7set82pGsBNiPGQnTCTBEwWYf5jf6P25CFDTdyfYKiZZ0hxlz+O+5+D0VaAHy6nVaN1Vh0ssEWqg==
X-Received: by 2002:a05:6a20:bc8f:b0:cc:606a:4349 with SMTP id
 fx15-20020a056a20bc8f00b000cc606a4349mr716607pzb.8.1677533627633; 
 Mon, 27 Feb 2023 13:33:47 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 10/14] target/arm: Create pauth_ptr_mask
Date: Mon, 27 Feb 2023 11:33:25 -1000
Message-Id: <20230227213329.793795-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Keep the logic for pauth within pauth_helper.c, and expose
a helper function for use with the gdbstub pac extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h        | 10 ++++++++++
 target/arm/tcg/pauth_helper.c | 26 ++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 725244d72d..c02dd59743 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1366,6 +1366,16 @@ int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
 
+/**
+ * pauth_ptr_mask:
+ * @env: cpu context
+ * @ptr: selects between TTBR0 and TTBR1
+ * @data: selects between TBI and TBID
+ *
+ * Return a mask of the bits of @ptr that contain the authentication code.
+ */
+uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
+
 /* Add the cpreg definitions for debug related system registers */
 void define_debug_regs(ARMCPU *cpu);
 
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index d0483bf051..20f347332d 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -339,14 +339,32 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     return pac | ext | ptr;
 }
 
-static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
+static uint64_t pauth_ptr_mask_internal(ARMVAParameters param)
 {
-    /* Note that bit 55 is used whether or not the regime has 2 ranges. */
-    uint64_t extfield = sextract64(ptr, 55, 1);
     int bot_pac_bit = 64 - param.tsz;
     int top_pac_bit = 64 - 8 * param.tbi;
 
-    return deposit64(ptr, bot_pac_bit, top_pac_bit - bot_pac_bit, extfield);
+    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
+}
+
+static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
+{
+    uint64_t mask = pauth_ptr_mask_internal(param);
+
+    /* Note that bit 55 is used whether or not the regime has 2 ranges. */
+    if (extract64(ptr, 55, 1)) {
+        return ptr | mask;
+    } else {
+        return ptr & ~mask;
+    }
+}
+
+uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
+{
+    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+
+    return pauth_ptr_mask_internal(param);
 }
 
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
-- 
2.34.1


