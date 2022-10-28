Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5676117B8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:41:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSQR-00048c-B8; Fri, 28 Oct 2022 12:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPY-0006Bq-Ah; Fri, 28 Oct 2022 12:40:57 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPW-00082S-9X; Fri, 28 Oct 2022 12:40:47 -0400
Received: by mail-oi1-x231.google.com with SMTP id y67so6717043oiy.1;
 Fri, 28 Oct 2022 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A8o0YYzfiE7PvuA9z+aNAz3Kkpq0pvrGYF+dBSjiwC4=;
 b=fkTPVzePzxjy4eo1oL6rYWSC1mk8frhwv5nI/Dbmo481BWNDT2n9q/MFgM1H+4aC8C
 ZCR+rR2Pk5PHH835hplKIqZkpptI5uY3rCGeENtzqXW4ssXxDGLhyQ0/kH7UqK5jLqMX
 e/kCd5xxMrAr9BwseuSkc8PbN7ZRGNyu0GdLMXuUq1/zZY8hFWzXasxR5p2zjQOOHWxD
 tDZO5VHPSutTTnszG3ka68ZeSNzXQDyAeWUXga2cWgq1Ba1KMLWzSkWFJBQ3HNtIzPMS
 UK/iMj2sqIOIWNHLjn+jZN2to9TdcUWyO735E+ZjUj9isd2ldxR1s+DuNuZB9DjXebSj
 cyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A8o0YYzfiE7PvuA9z+aNAz3Kkpq0pvrGYF+dBSjiwC4=;
 b=QQ7hUCGjlvXh97CIJ5ou9CYfM1aLQZ3MmP54dnWpUSiEVMKaa3QaK96Yl6shMMwXb6
 /xIX6OrioHpT8F735ePJGFEPQlPTkPudeq51bdDTd4DKYy6Itd6zJbAbanFuLmO4Ygta
 csHJShXIy3bOnnr8fnHdXd8QjEqMOaJjAfa06xwLEnJ+AfpZ+gWyi2BNttaEdE4dZfod
 pAmh1KeLeSJNWGHl+rkVQnY5JhWF48pMH+R2moei3v4uWwvdQY4z/D8RK0tWYOaaY3lj
 knfLa5VQMe6jXouhr40NS1CpN/WgwHiedkGdWeqgsHiy+pOoKR8i1top2qRQoW7ImTsx
 B/Zw==
X-Gm-Message-State: ACrzQf2chlDIgMqu87yfl17fvidoGX1Oj4onqJ5wIzt/vijmJzQywVql
 u2FVqEJuKfkHyjc86hLl1CJL8TdK54Io9g==
X-Google-Smtp-Source: AMsMyM6Ui9wyXKpDcKkt6eEmdOZgTMUi9GioF0V9wXkEc5V9ZtbvPLGgRXixUAJxdBJp7iXS8l5yXA==
X-Received: by 2002:a05:6808:1205:b0:354:2815:4f3c with SMTP id
 a5-20020a056808120500b0035428154f3cmr8696549oil.26.1666975244421; 
 Fri, 28 Oct 2022 09:40:44 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:40:43 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 10/62] target/ppc: Move VNEG[WD] to decodtree and use gvec
Date: Fri, 28 Oct 2022 13:38:59 -0300
Message-Id: <20221028163951.810456-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Moved the instructions VNEGW and VNEGD to decodetree and used gvec to
decode it.

vnegw:
rept    loop    master             patch
8       12500   0,01053200         0,00548400 (-47.9%)
25      4000    0,01030500         0,00390000 (-62.2%)
100     1000    0,01096300         0,00395400 (-63.9%)
500     200     0,01472000         0,00712300 (-51.6%)
2500    40      0,03809000         0,02147700 (-43.6%)
8000    12      0,09957100         0,06202100 (-37.7%)

vnegd:
rept    loop    master             patch
8       12500   0,00594600         0,00543800 (-8.5%)
25      4000    0,00575200         0,00396400 (-31.1%)
100     1000    0,00676100         0,00394800 (-41.6%)
500     200     0,01149300         0,00709400 (-38.3%)
2500    40      0,03441500         0,02169600 (-37.0%)
8000    12      0,09516900         0,06337000 (-33.4%)

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221019125040.48028-5-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  2 --
 target/ppc/insn32.decode            |  3 +++
 target/ppc/int_helper.c             | 12 ------------
 target/ppc/translate/vmx-impl.c.inc | 15 +++++++++++++--
 target/ppc/translate/vmx-ops.c.inc  |  2 --
 5 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f7047ed2aa..b2e910b089 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -229,8 +229,6 @@ DEF_HELPER_FLAGS_2(VSTRIBL, TCG_CALL_NO_RWG, i32, avr, avr)
 DEF_HELPER_FLAGS_2(VSTRIBR, TCG_CALL_NO_RWG, i32, avr, avr)
 DEF_HELPER_FLAGS_2(VSTRIHL, TCG_CALL_NO_RWG, i32, avr, avr)
 DEF_HELPER_FLAGS_2(VSTRIHR, TCG_CALL_NO_RWG, i32, avr, avr)
-DEF_HELPER_FLAGS_2(vnegw, TCG_CALL_NO_RWG, void, avr, avr)
-DEF_HELPER_FLAGS_2(vnegd, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_FLAGS_2(vupkhpx, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_FLAGS_2(vupklpx, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_FLAGS_2(vupkhsb, TCG_CALL_NO_RWG, void, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index c985f8f1bf..2fafde075b 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -629,6 +629,9 @@ VEXTSH2D        000100 ..... 11001 ..... 11000000010    @VX_tb
 VEXTSW2D        000100 ..... 11010 ..... 11000000010    @VX_tb
 VEXTSD2Q        000100 ..... 11011 ..... 11000000010    @VX_tb
 
+VNEGD           000100 ..... 00111 ..... 11000000010    @VX_tb
+VNEGW           000100 ..... 00110 ..... 11000000010    @VX_tb
+
 ## Vector Mask Manipulation Instructions
 
 MTVSRBM         000100 ..... 10000 ..... 11001000010    @VX_tb
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index f8dd12e8ae..c7fd0d1faa 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1928,18 +1928,6 @@ XXBLEND(W, 32)
 XXBLEND(D, 64)
 #undef XXBLEND
 
-#define VNEG(name, element)                                         \
-void helper_##name(ppc_avr_t *r, ppc_avr_t *b)                      \
-{                                                                   \
-    int i;                                                          \
-    for (i = 0; i < ARRAY_SIZE(r->element); i++) {                  \
-        r->element[i] = -b->element[i];                             \
-    }                                                               \
-}
-VNEG(vnegw, s32)
-VNEG(vnegd, s64)
-#undef VNEG
-
 void helper_vsro(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     int sh = (b->VsrB(0xf) >> 3) & 0xf;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index f52485a5f1..b9a9e83ab3 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2625,8 +2625,19 @@ GEN_VXFORM_NOA(vclzb, 1, 28)
 GEN_VXFORM_NOA(vclzh, 1, 29)
 GEN_VXFORM_TRANS(vclzw, 1, 30)
 GEN_VXFORM_TRANS(vclzd, 1, 31)
-GEN_VXFORM_NOA_2(vnegw, 1, 24, 6)
-GEN_VXFORM_NOA_2(vnegd, 1, 24, 7)
+
+static bool do_vneg(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_neg(vece, avr_full_offset(a->vrt), avr_full_offset(a->vrb),
+                     16, 16);
+    return true;
+}
+
+TRANS(VNEGW, do_vneg, MO_32)
+TRANS(VNEGD, do_vneg, MO_64)
 
 static void gen_vexts_i64(TCGv_i64 t, TCGv_i64 b, int64_t s)
 {
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index ded0234123..27908533dd 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -181,8 +181,6 @@ GEN_VXFORM_300_EXT(vextractd, 6, 11, 0x100000),
 GEN_VXFORM(vspltisb, 6, 12),
 GEN_VXFORM(vspltish, 6, 13),
 GEN_VXFORM(vspltisw, 6, 14),
-GEN_VXFORM_300_EO(vnegw, 0x01, 0x18, 0x06),
-GEN_VXFORM_300_EO(vnegd, 0x01, 0x18, 0x07),
 GEN_VXFORM_300_EO(vctzb, 0x01, 0x18, 0x1C),
 GEN_VXFORM_300_EO(vctzh, 0x01, 0x18, 0x1D),
 GEN_VXFORM_300_EO(vctzw, 0x01, 0x18, 0x1E),
-- 
2.37.3


