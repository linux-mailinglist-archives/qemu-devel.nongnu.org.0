Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891316F5222
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:45:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rH-0004h0-8f; Wed, 03 May 2023 03:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qA-00022e-49
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:58 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q6-0001Rd-SJ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:53 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3062d764455so2214387f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098630; x=1685690630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gu0FMVL4IRu2j+OcVz9pgQBYO7uSxOc/GKbBxvX+rBc=;
 b=Lyk6hAHnqCuOYQPESjoEwTBCSvWooAB2DfrDpghqRWPFw7wqPp0KY+s7sJsETE1P7g
 vUEjk66PQXWhz6MnzyzKvBsOdq1wF2eeMIUTeZjNwhq78Btz7QM4gOefa8xZ1jrfT5r7
 eMB/oOrHOXUKBAuTnlRByrZqviwOmvOn2gBqeygwzWbyNADgIm4bs6mX29Wnh5vqQEqx
 5KOQxInfQRXXfNYXp1FZ6PUo523AS5q6y0LpuS17D9Dh/AnutpPni8JYtj9KnuSGw76a
 4J9VVVpZ57S+QPJWrxfZr2ll0Bec6KiHyLTgdpSVPXZi2HOXE++HUaa71ekUZCgT8e8I
 eQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098630; x=1685690630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gu0FMVL4IRu2j+OcVz9pgQBYO7uSxOc/GKbBxvX+rBc=;
 b=b+A9g2Nc8nxWCTosRnfBWIbPwQkYlVhMgZlPj36UW2uFA7sgBIjMxpSLSNs30E4rim
 pIuZx677Vv16hf67+pA8xcCU7R/8F5xY83L6lRhGPrZ/6kj1yb0U0nLuADSndYXB+err
 tWp0TQmCZRfCAJBu5QQpHGMBQqcuUHl+hmP6bT0G9NV+9i8v0XmXxkYFhiAXc6tIKb1f
 PeBNPQDTUShQWes+qA0OkB1RXJyT1AY5zQA2idhbs5brkrbiio9Q8LGlxaYBlg6+N0GE
 PPlfOu5NEuaLtChduSfwRINUQJMmAIJBpKGkh91dy/luFN2vQnftefd+1REJ+2s2h8Nx
 DOTg==
X-Gm-Message-State: AC+VfDxL9jo3Ye2ZsS5bCoNvo+DAvz+0dSjgWoHtdSBJS6VqSz9Jtul2
 8LcDnrCgNVLvV98r9uUpBr/aFoAhinZiJeAKtazmCA==
X-Google-Smtp-Source: ACHHUZ69hyv6MrbykO7hctti9vlScaO7VHIg2EMrDGBLbBw4xA4VTKyx7L6h+fUXv0Msce5N/AOHRw==
X-Received: by 2002:adf:edc6:0:b0:2fa:2e64:7d10 with SMTP id
 v6-20020adfedc6000000b002fa2e647d10mr14001961wro.28.1683098629963; 
 Wed, 03 May 2023 00:23:49 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 21/84] tcg/aarch64: Remove USE_GUEST_BASE
Date: Wed,  3 May 2023 08:22:28 +0100
Message-Id: <20230503072331.1747057-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Eliminate the test vs TARGET_LONG_BITS by considering this
predicate to be always true, and simplify accordingly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index dc448f3f4b..fa1e5fb4ec 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -85,11 +85,6 @@ bool have_lse2;
 #define TCG_VEC_TMP0 TCG_REG_V31
 
 #ifndef CONFIG_SOFTMMU
-/* Note that XZR cannot be encoded in the address base register slot,
-   as that actaully encodes SP.  So if we need to zero-extend the guest
-   address, via the address index register slot, we need to load even
-   a zero guest base into a register.  */
-#define USE_GUEST_BASE     (guest_base != 0 || TARGET_LONG_BITS == 32)
 #define TCG_REG_GUEST_BASE TCG_REG_X28
 #endif
 
@@ -1762,7 +1757,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
     }
 
-    if (USE_GUEST_BASE) {
+    if (guest_base || addr_type == TCG_TYPE_I32) {
         h->base = TCG_REG_GUEST_BASE;
         h->index = addr_reg;
         h->index_ext = addr_type;
@@ -3176,10 +3171,14 @@ static void tcg_target_qemu_prologue(TCGContext *s)
                   CPU_TEMP_BUF_NLONGS * sizeof(long));
 
 #if !defined(CONFIG_SOFTMMU)
-    if (USE_GUEST_BASE) {
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_GUEST_BASE, guest_base);
-        tcg_regset_set_reg(s->reserved_regs, TCG_REG_GUEST_BASE);
-    }
+    /*
+     * Note that XZR cannot be encoded in the address base register slot,
+     * as that actaully encodes SP.  Depending on the guest, we may need
+     * to zero-extend the guest address via the address index register slot,
+     * therefore we need to load even a zero guest base into a register.
+     */
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_GUEST_BASE, guest_base);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_GUEST_BASE);
 #endif
 
     tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0, tcg_target_call_iarg_regs[0]);
-- 
2.34.1


