Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D4E698ABF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:58:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTQ-0003YW-73; Wed, 15 Feb 2023 21:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTO-0003Xb-DW
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:14 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTM-0005iW-GF
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:14 -0500
Received: by mail-pf1-x434.google.com with SMTP id 16so576463pfo.8
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1rrupK/ncvdfd5iG8nRgJ9I313hi/PeeTY/lxXxrncs=;
 b=dLDyBiknSW0lbT/Tjn5iwDXKNqC5ENREnWYXF4LUK3zx/48k4SIEvgSQLVxKW8Ulfq
 /DCj2WjCAcQVpLH0o4Td+9DNxZzuho77I1AZN8T0+k2+wnN0THJwpCKCBN7tPVB7K6pS
 l8tMb8Of1pzhqS5gPqm76auO8cSzyMfblP2xe2K0UhF7fW2mlxjuHRYP8QWbiyJMyto5
 dq/aFBjdD1JPEMeCvRgvMpGk/2EDCjZjCCxVMCA613dJi5SzGJeJmbrHMAvssxX0OzaZ
 ZcrQtSBC0K6Tovc5mL0Y9ndJ4AynLImSRo9jfK7jDZr/kBt3it1G96Cqf9RovvJate3E
 Nsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1rrupK/ncvdfd5iG8nRgJ9I313hi/PeeTY/lxXxrncs=;
 b=pb2V53nQfkmInTmDtJWx1Sq61OlwDhw2U2IbF9rvKQAq/QTjaNPNcLnwJ/SbAeTNhD
 LMKIHJ+FynfJdmuHDTLq6lFZAe4RtVsz2O1wm9vupH78u6DmxaXjXLPzvNLbOg5TA/bH
 Tp2aPlJzZgjDHZNYeh5pLvxuUXAROGYCshMurYdLwx7Dn4XHjQlojBrtvjJhHYpgWj5r
 K0KfA03XunYyJlcggV9OrdI1T2eUXdc8bSiCQTuwoMHtrnnCDymxZI5QP9BGLALT0k2O
 GcgTxJkfrADPPFxtxuLVl6mt2AtzPm+/Z0Z/tno1r8eTB29PLc7hgw9UzzamRlWHBLK0
 izFg==
X-Gm-Message-State: AO0yUKVpuHR4AAPvcV27Vx3hn9bI1v5kScET40DJZb4Q0tCzssCv4DCJ
 5An3zgY0hzo2vvhwlcV1gZ8jKeBEVclotEDhf7o=
X-Google-Smtp-Source: AK7set/Oz7AdgF06Li8/mhM1HaLSJe4NwQDh9I8frOUyqx9yPEZDOD6v2BTI5ozG/V0WPbfaoVJ5WQ==
X-Received: by 2002:a62:170f:0:b0:5a8:d364:62ab with SMTP id
 15-20020a62170f000000b005a8d36462abmr3584685pfx.17.1676516291684; 
 Wed, 15 Feb 2023 18:58:11 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:58:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 22/30] tcg/i386: Introduce tcg_out_mov2
Date: Wed, 15 Feb 2023 16:57:31 -1000
Message-Id: <20230216025739.1211680-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Create a helper for data movement minding register overlap.
Use the more general xchg instruction, which consumes one
extra byte, but simplifies the more general function.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 977650263b..5547f47a26 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -461,6 +461,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPTERNLOGQ  (0x25 | P_EXT3A | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VZEROUPPER  (0x77 | P_EXT)
 #define OPC_XCHG_ax_r32	(0x90)
+#define OPC_XCHG_EvGv   (0x87)
 
 #define OPC_GRP3_Eb     (0xf6)
 #define OPC_GRP3_Ev     (0xf7)
@@ -1880,6 +1881,24 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
     }
 }
 
+/* Move src1 to dst1 and src2 to dst2, minding possible overlap. */
+static void tcg_out_mov2(TCGContext *s,
+                         TCGType type1, TCGReg dst1, TCGReg src1,
+                         TCGType type2, TCGReg dst2, TCGReg src2)
+{
+    if (dst1 != src2) {
+        tcg_out_mov(s, type1, dst1, src1);
+        tcg_out_mov(s, type2, dst2, src2);
+    } else if (dst2 != src1) {
+        tcg_out_mov(s, type2, dst2, src2);
+        tcg_out_mov(s, type1, dst1, src1);
+    } else {
+        /* dst1 == src2 && dst2 == src1 -> xchg. */
+        int w = (type1 == TCG_TYPE_I32 && type2 == TCG_TYPE_I32 ? 0 : P_REXW);
+        tcg_out_modrm(s, OPC_XCHG_EvGv + w, dst1, dst2);
+    }
+}
+
 /*
  * Generate code for the slow path for a load at the end of block
  */
@@ -1947,13 +1966,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     case MO_UQ:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_RAX);
-        } else if (data_reg == TCG_REG_EDX) {
-            /* xchg %edx, %eax */
-            tcg_out_opc(s, OPC_XCHG_ax_r32 + TCG_REG_EDX, 0, 0, 0);
-            tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EAX);
         } else {
-            tcg_out_mov(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX);
-            tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EDX);
+            tcg_out_mov2(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX,
+                         TCG_TYPE_I32, l->datahi_reg, TCG_REG_EDX);
         }
         break;
     default:
-- 
2.34.1


