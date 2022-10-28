Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FD26117D8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:44:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSQx-0000E5-3P; Fri, 28 Oct 2022 12:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPy-0000Vv-Vm; Fri, 28 Oct 2022 12:41:23 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPr-0008DS-0U; Fri, 28 Oct 2022 12:41:12 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 cy15-20020a056830698f00b0065c530585afso3277645otb.2; 
 Fri, 28 Oct 2022 09:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHcNg0pGqBApqz++yl6LQvL/UqWNCisiJahvXPH3NLs=;
 b=EALs91km60o9N2oMIchg9tK/eHHc0koHWR4XsGSPYGG6fh4Lb+HAj505Jhq/eH6Vsm
 Syu4AAI5wjJg67xEjYbe/NgjC5EnejNlHl3rzHf/uvDzpuocOGP6Sas/T/d3/j/riErF
 UKK9cReeFtD+lJ0iybiJlyZ3JZVmH+EcWY0EfMvqsnDD9u5SxRaE4QvwGnNuGpJezMds
 wGFmb/48CPuLGHEJLF/ofh9+id3/KCeWF3tNXlTmIpq9+Qd6N1ir+dQBPQYzkiFpDzJL
 s7cdIxSJp03KSUbyaYu2pf9ZvCmuXDOZ+b8fV4tT6kTZ5hhzqLrlAFj2ufVgxOhH2L8t
 CYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XHcNg0pGqBApqz++yl6LQvL/UqWNCisiJahvXPH3NLs=;
 b=WLfiqiD+1GYyla5hgKqZDbPgOPtq5IOSV5SRhLk1IgBZw+cwWzxM5y+du0JP5pH1K7
 04kUvjPcrMQ0mnsXo3K74M5YYIPhgEFIeUWhME0ODRfg7v3bX3iHpTh6IGde+txyNDJX
 JCnnhpR4Dlp27yCEdtBadb82ilFezHR0Xq8wwsbqrqdAhugf6Z6S82J5AUi9chFZqqgy
 EToZg3S5hs8d/Eteh6l9RohZiO4hgzu+pipu06+bESsOentRazf1UJ3xBxLmy4La9zVn
 fsoDysfpH5/ft+SWRYRfMqprmm7rTIgDxmt2InLdMs2FJndOjAKvWe16EurPZQx1ZPbN
 I8TQ==
X-Gm-Message-State: ACrzQf3OK8EbPiy5Tjn6HJNr9C9KnJ3EpozUkchDOoRofbk2kYBH/8Sw
 nypoVhsqiXAcxurQD6DmHDxcxZvyKC6pWA==
X-Google-Smtp-Source: AMsMyM70vY7lMgHsQ0LCSzCch2ONPIu3wf+ud7RvGnugShVEkCBDmMJB4fpc/vaz5rpbQbE/zC9A8A==
X-Received: by 2002:a9d:3642:0:b0:655:f25f:be55 with SMTP id
 w60-20020a9d3642000000b00655f25fbe55mr112026otb.13.1666975263600; 
 Fri, 28 Oct 2022 09:41:03 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:41:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 14/62] target/ppc: Use gvec to decode XV[N]ABS[DS]P/XVNEG[DS]P
Date: Fri, 28 Oct 2022 13:39:03 -0300
Message-Id: <20221028163951.810456-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Moved XVABSSP, XVABSDP, XVNABSSP,XVNABSDP, XVNEGSP and XVNEGDP to
decodetree and used gvec to translate them.

xvabssp:
rept    loop    master             patch
8       12500   0,00477900         0,00476000 (-0.4%)
25      4000    0,00442800         0,00353300 (-20.2%)
100     1000    0,00478700         0,00366100 (-23.5%)
500     200     0,00973200         0,00649400 (-33.3%)
2500    40      0,03165200         0,02226700 (-29.7%)
8000    12      0,09315900         0,06674900 (-28.3%)

xvabsdp:
rept    loop    master             patch
8       12500   0,00475000         0,00474400 (-0.1%)
25      4000    0,00355600         0,00367500 (+3.3%)
100     1000    0,00444200         0,00366000 (-17.6%)
500     200     0,00942700         0,00732400 (-22.3%)
2500    40      0,02990000         0,02308500 (-22.8%)
8000    12      0,08770300         0,06683800 (-23.8%)

xvnabssp:
rept    loop    master             patch
8       12500   0,00494500         0,00492900 (-0.3%)
25      4000    0,00397700         0,00338600 (-14.9%)
100     1000    0,00421400         0,00353500 (-16.1%)
500     200     0,01048000         0,00707100 (-32.5%)
2500    40      0,03251500         0,02238300 (-31.2%)
8000    12      0,08889100         0,06469800 (-27.2%)

xvnabsdp:
rept    loop    master             patch
8       12500   0,00511000         0,00492700 (-3.6%)
25      4000    0,00398800         0,00381500 (-4.3%)
100     1000    0,00390500         0,00365900 (-6.3%)
500     200     0,00924800         0,00784600 (-15.2%)
2500    40      0,03138900         0,02391600 (-23.8%)
8000    12      0,09654200         0,05684600 (-41.1%)

xvnegsp:
rept    loop    master             patch
8       12500   0,00493900         0,00452800 (-8.3%)
25      4000    0,00369100         0,00366800 (-0.6%)
100     1000    0,00371100         0,00380000 (+2.4%)
500     200     0,00991100         0,00652300 (-34.2%)
2500    40      0,03025800         0,02422300 (-19.9%)
8000    12      0,09251100         0,06457600 (-30.2%)

xvnegdp:
rept    loop    master             patch
8       12500   0,00474900         0,00454400 (-4.3%)
25      4000    0,00353100         0,00325600 (-7.8%)
100     1000    0,00398600         0,00366800 (-8.0%)
500     200     0,01032300         0,00702400 (-32.0%)
2500    40      0,03125000         0,02422400 (-22.5%)
8000    12      0,09475100         0,06173000 (-34.9%)

This one to me seemed the opposite of the previous instructions, as it
looks like there was an improvement in the translation time (itself not
a surprise as operations were done twice before so there was the need to
translate twice as many TCGop)

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221019125040.48028-9-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode            |  9 ++++
 target/ppc/translate/vsx-impl.c.inc | 73 ++++++++++++++++++++++++++---
 target/ppc/translate/vsx-ops.c.inc  |  6 ---
 3 files changed, 76 insertions(+), 12 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 1214af7394..395339ce40 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -754,6 +754,15 @@ STXVRHX         011111 ..... ..... ..... 0010101101 .   @X_TSX
 STXVRWX         011111 ..... ..... ..... 0011001101 .   @X_TSX
 STXVRDX         011111 ..... ..... ..... 0011101101 .   @X_TSX
 
+## VSX Vector Binary Floating-Point Sign Manipulation Instructions
+
+XVABSDP         111100 ..... 00000 ..... 111011001 ..   @XX2
+XVABSSP         111100 ..... 00000 ..... 110011001 ..   @XX2
+XVNABSDP        111100 ..... 00000 ..... 111101001 ..   @XX2
+XVNABSSP        111100 ..... 00000 ..... 110101001 ..   @XX2
+XVNEGDP         111100 ..... 00000 ..... 111111001 ..   @XX2
+XVNEGSP         111100 ..... 00000 ..... 110111001 ..   @XX2
+
 ## VSX Scalar Multiply-Add Instructions
 
 XSMADDADP       111100 ..... ..... ..... 00100001 . . . @XX3
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index e6e5c45ffd..8717e20d08 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -782,15 +782,76 @@ static void glue(gen_, name)(DisasContext *ctx)                  \
         tcg_temp_free_i64(sgm);                                  \
     }
 
-VSX_VECTOR_MOVE(xvabsdp, OP_ABS, SGN_MASK_DP)
-VSX_VECTOR_MOVE(xvnabsdp, OP_NABS, SGN_MASK_DP)
-VSX_VECTOR_MOVE(xvnegdp, OP_NEG, SGN_MASK_DP)
 VSX_VECTOR_MOVE(xvcpsgndp, OP_CPSGN, SGN_MASK_DP)
-VSX_VECTOR_MOVE(xvabssp, OP_ABS, SGN_MASK_SP)
-VSX_VECTOR_MOVE(xvnabssp, OP_NABS, SGN_MASK_SP)
-VSX_VECTOR_MOVE(xvnegsp, OP_NEG, SGN_MASK_SP)
 VSX_VECTOR_MOVE(xvcpsgnsp, OP_CPSGN, SGN_MASK_SP)
 
+#define TCG_OP_IMM_i64(FUNC, OP, IMM)                           \
+    static void FUNC(TCGv_i64 t, TCGv_i64 b)                    \
+    {                                                           \
+        OP(t, b, IMM);                                          \
+    }
+
+TCG_OP_IMM_i64(do_xvabssp_i64, tcg_gen_andi_i64, ~SGN_MASK_SP)
+TCG_OP_IMM_i64(do_xvnabssp_i64, tcg_gen_ori_i64, SGN_MASK_SP)
+TCG_OP_IMM_i64(do_xvnegsp_i64, tcg_gen_xori_i64, SGN_MASK_SP)
+TCG_OP_IMM_i64(do_xvabsdp_i64, tcg_gen_andi_i64, ~SGN_MASK_DP)
+TCG_OP_IMM_i64(do_xvnabsdp_i64, tcg_gen_ori_i64, SGN_MASK_DP)
+TCG_OP_IMM_i64(do_xvnegdp_i64, tcg_gen_xori_i64, SGN_MASK_DP)
+#undef TCG_OP_IMM_i64
+
+static void xv_msb_op1(unsigned vece, TCGv_vec t, TCGv_vec b,
+                 void (*tcg_gen_op_vec)(unsigned, TCGv_vec, TCGv_vec, TCGv_vec))
+{
+    uint64_t msb = (vece == MO_32) ? SGN_MASK_SP : SGN_MASK_DP;
+    tcg_gen_op_vec(vece, t, b, tcg_constant_vec_matching(t, vece, msb));
+}
+
+static void do_xvabs_vec(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    xv_msb_op1(vece, t, b, tcg_gen_andc_vec);
+}
+
+static void do_xvnabs_vec(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    xv_msb_op1(vece, t, b, tcg_gen_or_vec);
+}
+
+static void do_xvneg_vec(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    xv_msb_op1(vece, t, b, tcg_gen_xor_vec);
+}
+
+static bool do_vsx_msb_op(DisasContext *ctx, arg_XX2 *a, unsigned vece,
+                          void (*vec)(unsigned, TCGv_vec, TCGv_vec),
+                          void (*i64)(TCGv_i64, TCGv_i64))
+{
+    static const TCGOpcode vecop_list[] = {
+        0
+    };
+
+    const GVecGen2 op = {
+       .fni8 = i64,
+       .fniv = vec,
+       .opt_opc = vecop_list,
+       .vece = vece
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, VSX);
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb),
+                   16, 16, &op);
+
+    return true;
+}
+
+TRANS(XVABSDP, do_vsx_msb_op, MO_64, do_xvabs_vec, do_xvabsdp_i64)
+TRANS(XVNABSDP, do_vsx_msb_op, MO_64, do_xvnabs_vec, do_xvnabsdp_i64)
+TRANS(XVNEGDP, do_vsx_msb_op, MO_64, do_xvneg_vec, do_xvnegdp_i64)
+TRANS(XVABSSP, do_vsx_msb_op, MO_32, do_xvabs_vec, do_xvabssp_i64)
+TRANS(XVNABSSP, do_vsx_msb_op, MO_32, do_xvnabs_vec, do_xvnabssp_i64)
+TRANS(XVNEGSP, do_vsx_msb_op, MO_32, do_xvneg_vec, do_xvnegsp_i64)
+
 #define VSX_CMP(name, op1, op2, inval, type)                                  \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index bff14bbece..b77324e0a8 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -165,13 +165,7 @@ GEN_XX3FORM(name, opc2, opc3 | 1, fl2)
 GEN_XX2FORM_DCMX(xvtstdcdp, 0x14, 0x1E, PPC2_ISA300),
 GEN_XX2FORM_DCMX(xvtstdcsp, 0x14, 0x1A, PPC2_ISA300),
 
-GEN_XX2FORM(xvabsdp, 0x12, 0x1D, PPC2_VSX),
-GEN_XX2FORM(xvnabsdp, 0x12, 0x1E, PPC2_VSX),
-GEN_XX2FORM(xvnegdp, 0x12, 0x1F, PPC2_VSX),
 GEN_XX3FORM(xvcpsgndp, 0x00, 0x1E, PPC2_VSX),
-GEN_XX2FORM(xvabssp, 0x12, 0x19, PPC2_VSX),
-GEN_XX2FORM(xvnabssp, 0x12, 0x1A, PPC2_VSX),
-GEN_XX2FORM(xvnegsp, 0x12, 0x1B, PPC2_VSX),
 GEN_XX3FORM(xvcpsgnsp, 0x00, 0x1A, PPC2_VSX),
 
 GEN_XX3FORM(xsadddp, 0x00, 0x04, PPC2_VSX),
-- 
2.37.3


