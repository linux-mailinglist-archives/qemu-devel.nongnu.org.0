Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CCE5F1CC6
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:29:33 +0200 (CEST)
Received: from localhost ([::1]:56794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedUi-0001oy-5O
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCR-0003Jc-ER
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:39 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:43700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCK-0004Gt-JO
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:39 -0400
Received: by mail-qk1-x734.google.com with SMTP id o7so4408084qkj.10
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rhU6prNr5k+kysecBHvIxaXnfM3j+gbXRvuZ+nCGy2U=;
 b=VATeLhGCm6uzxT6B/S0CPTrKdtJ0mJtBEZA3KDFiAmDgnWQyqYMF+4/Q//H8YiiAFG
 e/EY4TU/Rux1mnpmrQtkr2xKqVZzwcbC1yVfmUXg00hwM07Lrbcdwdcq4NrNFqjCAhsj
 lFzms2mbSg3aXt4/lwB95kAJfRtD6o0XL/TyWBfpNrS97uPN8NMQbyWtUeQGwJMD3WTq
 tI71Nv7FXLqarNVaBQVRfO9/EmKraP+su7blMRUBT+46D01DrJG8SFbZB0d2d+kNtwOF
 RfMJrmQxf2E0lxemJipZBwqbGOGn3dwAL8GjZ/usWsAPOeezcorrcNScNSxfS2/+DZNN
 Bu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rhU6prNr5k+kysecBHvIxaXnfM3j+gbXRvuZ+nCGy2U=;
 b=LimsWtXsRTGzOfK8b32rqdsChPW/BG631BadlAD1D1AA/jhRvWQCDG9YgBuL9mwlk/
 /jqk7qrxgGYRKnerH/35yEzcKTG6DkadoaWxGuBSArZ4+h8oTQ7+i2coEB5muV74z8JM
 uxD86ZmFRyQxguUj7Vy71K1shjGG+W/jN5G4KvIHrk31wqrxRB0EO00bof3e+TPIZB9A
 ZZbhfQUhGZwiToX2cZ+QiXV9DeqAq5Q4LliXTvjKSSZt52UGOgh/bSmENSzqHoBm2JlO
 baH93+cCWjKe7ABbwx5Qh2hfNmGkWrYrl8EkYaSpgOmORJCIFJWAN67o6Sj7ZzYf6kvw
 q/xg==
X-Gm-Message-State: ACrzQf1bSufMHe82RfeL5AzBYkvRpJRA27B/ZSsl+oX/kAvgXdKdOzkN
 3a+lsGAqcdMWL4MNhgRPlEIE+Ikw9QzvQ7FI
X-Google-Smtp-Source: AMsMyM7H/qUrNO8o9vqCZnw1luzsNOawdribEoibpVn41Uw/OcDxiE7Fd7JobpgDOPNtCrj3aUu7eQ==
X-Received: by 2002:a37:a982:0:b0:6cf:6de9:1bee with SMTP id
 s124-20020a37a982000000b006cf6de91beemr9339301qke.423.1664633430713; 
 Sat, 01 Oct 2022 07:10:30 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 21/26] target/i386: Remove MemOp argument to gen_op_j*_ecx
Date: Sat,  1 Oct 2022 07:09:30 -0700
Message-Id: <20221001140935.465607-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These functions are always passed aflag, so we might as well
read it from DisasContext directly.  While we're at it, use
a common subroutine for these two functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index cf23ae6e5e..9294f12f66 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -676,20 +676,21 @@ static void gen_exts(MemOp ot, TCGv reg)
     gen_ext_tl(reg, reg, ot, true);
 }
 
-static inline
-void gen_op_jnz_ecx(DisasContext *s, MemOp size, TCGLabel *label1)
+static void gen_op_j_ecx(DisasContext *s, TCGCond cond, TCGLabel *label1)
 {
     tcg_gen_mov_tl(s->tmp0, cpu_regs[R_ECX]);
-    gen_extu(size, s->tmp0);
-    tcg_gen_brcondi_tl(TCG_COND_NE, s->tmp0, 0, label1);
+    gen_extu(s->aflag, s->tmp0);
+    tcg_gen_brcondi_tl(cond, s->tmp0, 0, label1);
 }
 
-static inline
-void gen_op_jz_ecx(DisasContext *s, MemOp size, TCGLabel *label1)
+static inline void gen_op_jz_ecx(DisasContext *s, TCGLabel *label1)
 {
-    tcg_gen_mov_tl(s->tmp0, cpu_regs[R_ECX]);
-    gen_extu(size, s->tmp0);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, s->tmp0, 0, label1);
+    gen_op_j_ecx(s, TCG_COND_EQ, label1);
+}
+
+static inline void gen_op_jnz_ecx(DisasContext *s, TCGLabel *label1)
+{
+    gen_op_j_ecx(s, TCG_COND_NE, label1);
 }
 
 static void gen_helper_in_func(MemOp ot, TCGv v, TCGv_i32 n)
@@ -1183,7 +1184,7 @@ static TCGLabel *gen_jz_ecx_string(DisasContext *s)
 {
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
-    gen_op_jnz_ecx(s, s->aflag, l1);
+    gen_op_jnz_ecx(s, l1);
     gen_set_label(l2);
     gen_jmp_rel_csize(s, 0, 1);
     gen_set_label(l1);
@@ -1286,7 +1287,7 @@ static void gen_repz(DisasContext *s, MemOp ot,
      * before rep string_insn
      */
     if (s->repz_opt) {
-        gen_op_jz_ecx(s, s->aflag, l2);
+        gen_op_jz_ecx(s, l2);
     }
     gen_jmp_rel_csize(s, -cur_insn_len(s), 0);
 }
@@ -1306,7 +1307,7 @@ static void gen_repz2(DisasContext *s, MemOp ot, int nz,
     gen_update_cc_op(s);
     gen_jcc1(s, (JCC_Z << 1) | (nz ^ 1), l2);
     if (s->repz_opt) {
-        gen_op_jz_ecx(s, s->aflag, l2);
+        gen_op_jz_ecx(s, l2);
     }
     gen_jmp_rel_csize(s, -cur_insn_len(s), 0);
 }
@@ -7397,16 +7398,16 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             case 0: /* loopnz */
             case 1: /* loopz */
                 gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
-                gen_op_jz_ecx(s, s->aflag, l2);
+                gen_op_jz_ecx(s, l2);
                 gen_jcc1(s, (JCC_Z << 1) | (b ^ 1), l1);
                 break;
             case 2: /* loop */
                 gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
-                gen_op_jnz_ecx(s, s->aflag, l1);
+                gen_op_jnz_ecx(s, l1);
                 break;
             default:
             case 3: /* jcxz */
-                gen_op_jz_ecx(s, s->aflag, l1);
+                gen_op_jz_ecx(s, l1);
                 break;
             }
 
-- 
2.34.1


