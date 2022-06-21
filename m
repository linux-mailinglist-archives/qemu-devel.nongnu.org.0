Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20B7552F15
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:47:53 +0200 (CEST)
Received: from localhost ([::1]:55864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3aUC-00022H-Fy
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQf-0007Qk-84; Tue, 21 Jun 2022 05:44:13 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:44758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQd-0007Lc-H1; Tue, 21 Jun 2022 05:44:12 -0400
Received: by mail-oi1-x22f.google.com with SMTP id h65so15954926oia.11;
 Tue, 21 Jun 2022 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5oF3ZxrdLxJnDLEJTp838Mko4uONefYWsE38B6sxYYI=;
 b=XMOB2zXnk7KNiGSiVmcKvbs5UQKrYGRDLBGnpm8MSQBAo/fTjwDE9TkcdzAKgsc1kj
 2D/zAAzmPgyiBRqPs8/6FFVwNGrDL+3DtNDoyWeC3ldDm8rybVO51r2KCmwDI8YV5USA
 fjCrbY1sapZvytyOH8laERZSM041rpoKku3aJWBuo/kbqtwDyRTDQqwvVDVpXiTcJb8N
 6Eg+YesYLxyTk3xjWc02PnNSXWR0J+ZaLe9kNqKbyfU8V1El7OKtzWFOxdBjE+MjIzHO
 SELSbr/hORE0BbF7UwuypJqx3/eMhvlhpd30BuyTrRDIk4sYT6zOejDVNc/BTnadORmg
 5naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5oF3ZxrdLxJnDLEJTp838Mko4uONefYWsE38B6sxYYI=;
 b=WbXd4hwQsAfPygo6EZJUFr8jeOc7Cf0oxry1ujjF9DTJFGnLUwbAP+RZfK1btbtDX9
 08FYDifZtg6OdH0jRgSzsMnolhX+7mFlt++e+0vwjnC79zX+CKSjbRJBwpgyGY+NyZxX
 LdQRPsEJHzn1+p3OXNm6ccPOD58lHVIKffngESgWnnQtANfS7C1lc+/T3acuRuYjJfNp
 BZgzsg/UMI9p0oihtOq01qrjTKoJLIjFOwAb6OYD9yNgmjB4JfVaTF2T7Tyq0ILSteFS
 eMZwBjnub+RPWNbCCrLM2G4Os+6n5R1y23SiRFkfNwpN+w4zqyoJs8Rl69jcaXZUPU1v
 ZRSg==
X-Gm-Message-State: AJIora/GZHLA0AqcNUo+THy30kHUO4KU7wbMbEpXBJwhZNAdQFNXhQSD
 fcyTuYcv6PmgXJtBO/qtLLLOhE/WOtt4KA==
X-Google-Smtp-Source: AGRyM1syD/CKs7peruujV/ZNqUb1wPeXyS/jcyOe5OwJXF3JndB/HWOI9BCzZ3USY5LTWLDNoI/Xeg==
X-Received: by 2002:a05:6808:1a0c:b0:32f:6a3b:5164 with SMTP id
 bk12-20020a0568081a0c00b0032f6a3b5164mr13752197oib.227.1655804648510; 
 Tue, 21 Jun 2022 02:44:08 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 01/15] target/ppc: Implemented vector divide instructions
Date: Tue, 21 Jun 2022 06:43:46 -0300
Message-Id: <20220621094400.122800-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
vdivsw: Vector Divide Signed Word
vdivuw: Vector Divide Unsigned Word
vdivsd: Vector Divide Signed Doubleword
vdivud: Vector Divide Unsigned Doubleword

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220525134954.85056-2-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode            |  7 +++
 target/ppc/translate/vmx-impl.c.inc | 85 +++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 18a94fa3b5..6df405e398 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -786,3 +786,10 @@ XVF64GERPP      111011 ... -- .... 0 ..... 00111010 ..-  @XX3_at xa=%xx_xa_pair
 XVF64GERPN      111011 ... -- .... 0 ..... 10111010 ..-  @XX3_at xa=%xx_xa_pair
 XVF64GERNP      111011 ... -- .... 0 ..... 01111010 ..-  @XX3_at xa=%xx_xa_pair
 XVF64GERNN      111011 ... -- .... 0 ..... 11111010 ..-  @XX3_at xa=%xx_xa_pair
+
+## Vector Division Instructions
+
+VDIVSW          000100 ..... ..... ..... 00110001011    @VX
+VDIVUW          000100 ..... ..... ..... 00010001011    @VX
+VDIVSD          000100 ..... ..... ..... 00111001011    @VX
+VDIVUD          000100 ..... ..... ..... 00011001011    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index d7524c3204..4c0b1a32ec 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3238,6 +3238,91 @@ TRANS(VMULHSD, do_vx_mulh, true , do_vx_vmulhd_i64)
 TRANS(VMULHUW, do_vx_mulh, false, do_vx_vmulhw_i64)
 TRANS(VMULHUD, do_vx_mulh, false, do_vx_vmulhd_i64)
 
+static bool do_vdiv_vmod(DisasContext *ctx, arg_VX *a, const int vece,
+                         void (*func_32)(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b),
+                         void (*func_64)(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b))
+{
+    const GVecGen3 op = {
+        .fni4 = func_32,
+        .fni8 = func_64,
+        .vece = vece
+    };
+
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &op);
+
+    return true;
+}
+
+#define DIVU32(NAME, DIV)                                               \
+static void NAME(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)                    \
+{                                                                       \
+    TCGv_i32 zero = tcg_constant_i32(0);                                \
+    TCGv_i32 one = tcg_constant_i32(1);                                 \
+    tcg_gen_movcond_i32(TCG_COND_EQ, b, b, zero, one, b);               \
+    DIV(t, a, b);                                                       \
+}
+
+#define DIVS32(NAME, DIV)                                               \
+static void NAME(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)                    \
+{                                                                       \
+    TCGv_i32 t0 = tcg_temp_new_i32();                                   \
+    TCGv_i32 t1 = tcg_temp_new_i32();                                   \
+    tcg_gen_setcondi_i32(TCG_COND_EQ, t0, a, INT32_MIN);                \
+    tcg_gen_setcondi_i32(TCG_COND_EQ, t1, b, -1);                       \
+    tcg_gen_and_i32(t0, t0, t1);                                        \
+    tcg_gen_setcondi_i32(TCG_COND_EQ, t1, b, 0);                        \
+    tcg_gen_or_i32(t0, t0, t1);                                         \
+    tcg_gen_movi_i32(t1, 0);                                            \
+    tcg_gen_movcond_i32(TCG_COND_NE, b, t0, t1, t0, b);                 \
+    DIV(t, a, b);                                                       \
+    tcg_temp_free_i32(t0);                                              \
+    tcg_temp_free_i32(t1);                                              \
+}
+
+#define DIVU64(NAME, DIV)                                               \
+static void NAME(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)                    \
+{                                                                       \
+    TCGv_i64 zero = tcg_constant_i64(0);                                \
+    TCGv_i64 one = tcg_constant_i64(1);                                 \
+    tcg_gen_movcond_i64(TCG_COND_EQ, b, b, zero, one, b);               \
+    DIV(t, a, b);                                                       \
+}
+
+#define DIVS64(NAME, DIV)                                               \
+static void NAME(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)                    \
+{                                                                       \
+    TCGv_i64 t0 = tcg_temp_new_i64();                                   \
+    TCGv_i64 t1 = tcg_temp_new_i64();                                   \
+    tcg_gen_setcondi_i64(TCG_COND_EQ, t0, a, INT64_MIN);                \
+    tcg_gen_setcondi_i64(TCG_COND_EQ, t1, b, -1);                       \
+    tcg_gen_and_i64(t0, t0, t1);                                        \
+    tcg_gen_setcondi_i64(TCG_COND_EQ, t1, b, 0);                        \
+    tcg_gen_or_i64(t0, t0, t1);                                         \
+    tcg_gen_movi_i64(t1, 0);                                            \
+    tcg_gen_movcond_i64(TCG_COND_NE, b, t0, t1, t0, b);                 \
+    DIV(t, a, b);                                                       \
+    tcg_temp_free_i64(t0);                                              \
+    tcg_temp_free_i64(t1);                                              \
+}
+
+DIVS32(do_divsw, tcg_gen_div_i32)
+DIVU32(do_divuw, tcg_gen_divu_i32)
+DIVS64(do_divsd, tcg_gen_div_i64)
+DIVU64(do_divud, tcg_gen_divu_i64)
+
+TRANS_FLAGS2(ISA310, VDIVSW, do_vdiv_vmod, MO_32, do_divsw, NULL)
+TRANS_FLAGS2(ISA310, VDIVUW, do_vdiv_vmod, MO_32, do_divuw, NULL)
+TRANS_FLAGS2(ISA310, VDIVSD, do_vdiv_vmod, MO_64, NULL, do_divsd)
+TRANS_FLAGS2(ISA310, VDIVUD, do_vdiv_vmod, MO_64, NULL, do_divud)
+
+#undef DIVS32
+#undef DIVU32
+#undef DIVS64
+#undef DIVU64
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
-- 
2.36.1


