Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC9F4C58F2
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 03:09:57 +0100 (CET)
Received: from localhost ([::1]:49754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO90W-0001vh-9K
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 21:09:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8vd-00033A-BD
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:53 -0500
Received: from [2607:f8b0:4864:20::42d] (port=46754
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8vP-0007TJ-Tt
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:52 -0500
Received: by mail-pf1-x42d.google.com with SMTP id i21so7942546pfd.13
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 18:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ho2jnp9wAsj5SBP8tX6ESXDweHDs0USlRJ9dHfy8f/A=;
 b=KU+EWlGkQ0XR+qzYWE3RzOQp+DSmVlpFOjjDYia9HMFhKBPQWogyTReBDXXbt0NnBm
 1qvOkLqc7GHYeU13lvRPJ/NKpoTAYJ3s7qnRuWd0vWad9ZEO6s2Q+fRcTekCOBAetI9K
 iEjENsLVMBhfSr6GHBrmJuToUf8ZFicH7Tl25phvX19M3mHGN7Y/Zk8alyfYYrq5w8g3
 vJ30Zs4jTzC6Yz+jpyvItxbdvCHXsoXtSMSmC5ligLR4Z5zW9yZtHllFrPvYH/JyiGmp
 HiNoIMyDeU4FmUikEtJndgVk9SRqEDIVIa54Ii0lvcZmzoZSGe1BcLCNoz6lBPlRGM4f
 sHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ho2jnp9wAsj5SBP8tX6ESXDweHDs0USlRJ9dHfy8f/A=;
 b=z3XutDY91WfgrVezh8CZReYFDzNMfTzTtPl5G5sHl1jX0ZWpAIaSvwjH3f9X3fubje
 2FxXwwbVf178Yx6Y702+bIjWCFBR1ZgR59CTfGCrXuSEQpMu5ohHwCIYTcDfxWJUYsGX
 KCtQmVlYdBQOs08WxJzV0Kp1942y08v4Ot5s+DeegELjSfeIGSycq/myvQdjGRCte5qi
 OeEj6tbfiIjolUhTVv7xL/D3aVGUjze4VrTaaxnGtB8L/D4PbmBkWvCo9N3YO92gnViV
 rs59gPJMgyqBjsgGa6xjvIyg6y325txiJ8W0f2SlkgCAM/L2ZsA84EPugSJ5+wkkFEo6
 yYMA==
X-Gm-Message-State: AOAM532mb67axKfYqLRrRH77MlzuD+8wv1pNkJ12az8VbuThDTxNlVn/
 PRSe3y94IUzOHHy3BuhFMy31C1A3dtveQxXS
X-Google-Smtp-Source: ABdhPJz9KbtezB6+LMBNyQluHLS3QlsQE0tEVLzKhEb4YI5OdYkrq8rf9JqICHj4rk1eYQt1ztZ/4g==
X-Received: by 2002:a62:7846:0:b0:4c7:f23e:1fd7 with SMTP id
 t67-20020a627846000000b004c7f23e1fd7mr14932903pfc.67.1645927467134; 
 Sat, 26 Feb 2022 18:04:27 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm8304021pfj.43.2022.02.26.18.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 18:04:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] tcg/riscv: Support TCG_TARGET_SIGNED_ADDR32
Date: Sat, 26 Feb 2022 16:04:12 -1000
Message-Id: <20220227020413.11741-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227020413.11741-1-richard.henderson@linaro.org>
References: <20220227020413.11741-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All RV64 32-bit operations sign-extend the output, so we are easily
able to keep TCG_TYPE_I32 values sign-extended in host registers.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-sa32.h | 6 +++++-
 tcg/riscv/tcg-target.c.inc  | 8 ++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tcg/riscv/tcg-target-sa32.h b/tcg/riscv/tcg-target-sa32.h
index cb185b1526..703467b37a 100644
--- a/tcg/riscv/tcg-target-sa32.h
+++ b/tcg/riscv/tcg-target-sa32.h
@@ -1 +1,5 @@
-#define TCG_TARGET_SIGNED_ADDR32 0
+/*
+ * Do not set TCG_TARGET_SIGNED_ADDR32 for RV32;
+ * TCG expects this to only be set for 64-bit hosts.
+ */
+#define TCG_TARGET_SIGNED_ADDR32  (__riscv_xlen == 64)
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 6409d9c3d5..c999711494 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -951,10 +951,6 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
     tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
 
     /* TLB Hit - translate address using addend.  */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, addrl);
-        addrl = TCG_REG_TMP0;
-    }
     tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
 }
 
@@ -1175,7 +1171,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
@@ -1247,7 +1243,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
-- 
2.25.1


