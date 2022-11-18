Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC3E62F1E3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:52:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxzh-0007rg-Od; Fri, 18 Nov 2022 04:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxz8-0007Sz-M5
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:38 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxz6-00025o-Dj
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:34 -0500
Received: by mail-pl1-x632.google.com with SMTP id p12so4110869plq.4
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=v1qkRSPQlg7fc/AQ74qQ3P9alwy8MipeuIKQlrtf4KE=;
 b=YojAn+9Aqybx3TDaEWV3UVTSV7lS5Ixo4H6t4IGR8zdRhp0YJIP4AHKsQodjdh1W1k
 K6KDKswmdZHIu4N8BfUJP4zuOPXaeXSLp1KZdgK4pgCfZVOLFz7Pd4Tqc5K8lKoEaec+
 87e6mt2F1xYZJMeIaveMK0rDiCrfCKSA+lvWgD+/xDj52R9P3qQdVPmdpEv00xgq8C8b
 1+xg7q4QuLO2u+nVAwuWzuAOpc/EJ3LdhvtowfSJLH1XLsuPPzWqzDjZJB+dzrIlwpkX
 fXi0uOvPsjLzcwirDlreY4CxTokDEMop6jEeK6pgDByial6tZx1o+UVyESCA9d2SPGne
 xVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1qkRSPQlg7fc/AQ74qQ3P9alwy8MipeuIKQlrtf4KE=;
 b=lcKeZrJ9Fa3Fptjy3fj0VnMOkKw9fDFVTmhkYnicaUvGOYPgo2W/C4/gsqpAzrM79d
 mZPP1QbNfPbJCN/+WquIL1tTo71hpjraOWTy7FOaakOvdxvuYOTkNLo9ZrgI3KP2lR20
 K046dneiU9mpQEpKyceudiMFyD2LHykq9PspfN5A1YDzkdedNn4AkV4Zl6jIxuSsaMEN
 QMul9NS/XsCS5swJqVAwyzJxbl/eUgIcNUnYf7cChFUMuWfYE5sG53UYPRrP3C5sBN5Q
 n36bt+QqDkcK19eEHbQjJeKkUu+LgfIZzsaSH/cSwvmJBp5T9+M6wYqA28PErt9LeyNY
 BEuQ==
X-Gm-Message-State: ANoB5pnQR0dIPxhkdiQqwfYqi5iMBxTuoOlPMV48O4n0vktLosTaOTSh
 3vkqONtXJZw42pRnPjzIX8KWx90UAJOyJw==
X-Google-Smtp-Source: AA0mqf7WTSC/sDpO+ZPfEdxz7qpwNwRP+jVs3/Gp1l4vWGN+1JDh4i05D8bMbmXgQCaa5JlNbbA7KQ==
X-Received: by 2002:a17:902:ec8f:b0:186:9f20:e7e2 with SMTP id
 x15-20020a170902ec8f00b001869f20e7e2mr6453348plg.174.1668764910629; 
 Fri, 18 Nov 2022 01:48:30 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 17/29] tcg/aarch64: Add have_lse, have_lse2
Date: Fri, 18 Nov 2022 01:47:42 -0800
Message-Id: <20221118094754.242910-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
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

Notice when the host has additional atomic instructions.
The new variables will also be used in generated code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  3 +++
 tcg/aarch64/tcg-target.c.inc | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 0dff5807f6..b8f734f371 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -57,6 +57,9 @@ typedef enum {
 #define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
+extern bool have_lse;
+extern bool have_lse2;
+
 /* optional instructions */
 #define TCG_TARGET_HAS_div_i32          1
 #define TCG_TARGET_HAS_rem_i32          1
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 001a71bbc0..cf5ee6f742 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -13,6 +13,8 @@
 #include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 #include "qemu/bitops.h"
+#include <asm/hwcap.h>
+
 
 /* We're going to re-use TCGType in setting of the SF bit, which controls
    the size of the operation performed.  If we know the values match, it
@@ -71,6 +73,9 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
     return TCG_REG_X0 + slot;
 }
 
+bool have_lse;
+bool have_lse2;
+
 #define TCG_REG_TMP TCG_REG_X30
 #define TCG_VEC_TMP TCG_REG_V31
 
@@ -2918,6 +2923,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
 static void tcg_target_init(TCGContext *s)
 {
+    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+
+    have_lse = hwcap & HWCAP_ATOMICS;
+    have_lse2 = hwcap & HWCAP_USCAT;
+
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_V64] = 0xffffffff00000000ull;
-- 
2.34.1


