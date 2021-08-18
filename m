Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C5F3F0CDA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:35:51 +0200 (CEST)
Received: from localhost ([::1]:55576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSHu-0005Lo-8O
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2N-00088v-IF
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:47 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2M-0006Hv-8B
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:47 -0400
Received: by mail-pf1-x436.google.com with SMTP id t13so3334893pfl.6
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vdoMbOjvjUbRTDz6SRu0t7kZ7lZlYLcBKfY5+VwkcJ4=;
 b=x2dw2Q7xMf6DyJ7W0SwNtlW0ZELQwJ6BBHcO0o9MmEorzx+fBI+BW0W36bSKg9F3RM
 wTMr1kKhhVqQRHUGZgmMTsfB5K91WzjwQN5FnD8HjxO7nqq4CFKDmWOhFqnRsej/irGR
 XY/QHJv6kxrsUaOLsK2SsPb3HGJmQHt7D3nPzdAZGhSou4KE91zIwWNBsWiplcSnTgFY
 Fif7XLvfP1iJxymXM2LP0j2IGDc2c37Fnks4aU80+XAY+BISo/85u3WLpiCkvkMUC+HR
 4hDAg5bw0G/QdaB+/84CYXFuMVVOSb1GOX8owLc6PfJPVjWKTriRBZaY4Rk1wD4oqTJr
 xhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vdoMbOjvjUbRTDz6SRu0t7kZ7lZlYLcBKfY5+VwkcJ4=;
 b=JoF/5iXbG9KTQT/8b3ko8gTNXz8Stsm8hEqXCx9e+QycYqaKO1qGozbFZJnShGmmVx
 fZnL5IGz5lOK3qLFQvjzUgLNHuPispW3bf6cfezA3GrQLJWOf2XTXMzgnV4it1wKfglu
 qluKmoRvGPCJzYeWzgNiqUQw4JMqa3wkOggItgYofxW/yXnYNk8B3e5qwK4x5S8DcinI
 i3tnqwlQjf/5oYRaGqV58mj4wDjeQXAYq91/uKoeUKEtHy1RbaBtJOWKTGS2PXqb+xN6
 AWo/7cUg9eQjwz+oHCK2XucBF8hAjr0c5sBV+uWhWnCebzjJeUxXBHgrQtkNdYsT2v4I
 WaBA==
X-Gm-Message-State: AOAM533YNjx3c06PIwSEMXHi0ZOItlHDBz5RhSgeP24kmrLNOl7Z3Vyx
 jHpC6mayg+uuldFejGWQkXZX4COLDlJmUQ==
X-Google-Smtp-Source: ABdhPJzbXJJkiR9EuntQuHCgnwjNj4vcsmF0lCW+JpOZB1dwdR5w7nZA8xjX0uIUFBQCVrTo6Ds/Tw==
X-Received: by 2002:a63:da14:: with SMTP id c20mr10555663pgh.155.1629317984919; 
 Wed, 18 Aug 2021 13:19:44 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/16] tcg/mips: Split out tcg_out_movi_one
Date: Wed, 18 Aug 2021 10:19:26 -1000
Message-Id: <20210818201931.393394-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Emit all constants that can be loaded in exactly one insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 333b9572d0..b32edd5a7a 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -524,20 +524,34 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
     return true;
 }
 
+static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
+{
+    if (arg == (int16_t)arg) {
+        tcg_out_opc_imm(s, OPC_ADDIU, ret, TCG_REG_ZERO, arg);
+        return true;
+    }
+    if (arg == (uint16_t)arg) {
+        tcg_out_opc_imm(s, OPC_ORI, ret, TCG_REG_ZERO, arg);
+        return true;
+    }
+    if (arg == (int32_t)arg && (arg & 0xffff) == 0) {
+        tcg_out_opc_imm(s, OPC_LUI, ret, TCG_REG_ZERO, arg >> 16);
+        return true;
+    }
+    return false;
+}
+
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
     if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
         arg = (int32_t)arg;
     }
-    if (arg == (int16_t)arg) {
-        tcg_out_opc_imm(s, OPC_ADDIU, ret, TCG_REG_ZERO, arg);
-        return;
-    }
-    if (arg == (uint16_t)arg) {
-        tcg_out_opc_imm(s, OPC_ORI, ret, TCG_REG_ZERO, arg);
+
+    if (tcg_out_movi_one(s, ret, arg)) {
         return;
     }
+
     if (TCG_TARGET_REG_BITS == 32 || arg == (int32_t)arg) {
         tcg_out_opc_imm(s, OPC_LUI, ret, TCG_REG_ZERO, arg >> 16);
     } else {
-- 
2.25.1


