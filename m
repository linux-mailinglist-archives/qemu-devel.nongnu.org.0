Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C646A6647
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCik-0003f5-Tl; Tue, 28 Feb 2023 22:01:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCib-0002YE-Dz
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:25 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiY-0004Ll-Bh
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:23 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so4542913pjg.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vU83YYyrnZO9CSiEIwUngfuoHOOKNpuPtr+zuP2063w=;
 b=bgHU20WtLwBU+H5L2fe7TAItEsZZQo3bT2api9oghFznY25S4q+hpCgslmJCOFJfrE
 kVSoBTnqAaLB+x9TvQMfmUpsCida2eDnfbDeR0plfdZKDCAry/H1q9nZ2qhZlTH4KpBj
 18adwNFykSUwutSah9L+AQuRbkpX7zQKI/CdIJrtLo2OhFifCHPK0nMZDeo8V4qUqUL/
 P2XBsWPtpbhWlchUZNfNfzoOKGVuXSff9dRjbyyagIZEeVAdN7uzo8m07V2P82gOkCkW
 KTS7KpatF+RKDcGTLdpei1rw1e8p2ijCHPaQoSQUJ2fLgtlxkCGidY/fv+NC+XiCwcdk
 F4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vU83YYyrnZO9CSiEIwUngfuoHOOKNpuPtr+zuP2063w=;
 b=wJ+KsW9LL2jUSgwrMFGqWt7dWUsw3aqjK5hNGKo/f2x3Vniye0IadNsrbh8+tvq7B1
 06vBLYU0S9MjlCPIJ8cekNtlbpPK8VDoEA5iXUznIz4B3cp+cqbtbLMz2xAFh4t20G6T
 wB28kyhoTZgHV539kXvThAzMssSAY0QMfyV70q42OTv/xOGBy53e1jF8Tu4yDa0plv6X
 gFKTi6vs3jxVXPcOLinS0yUU2mU+9sBLx9flt6f/bVuU8FYdPCl/I9vqwA8yNXqGoAAT
 78EwalTRxdO7+I5W13OptElSeav9/KTC6aQ8BACxE7VR25l7hHMLPPo7gmkm13DS2cSa
 aeMg==
X-Gm-Message-State: AO0yUKVjk/8jz3+9VPLXS7b386gknEw8ZZuuolSCogtlGuX8zbhj3+7a
 UuqUYnLPsrCeR1m9Brch7McfRZPPwVNp3JvHTxE=
X-Google-Smtp-Source: AK7set8yliMcVgbZPZJDwxnhZxASN2ktTUT5Ayd+gqh1T4qLb33+psOnbVN/b3sZ5zpZrDdov0mF2g==
X-Received: by 2002:a17:903:1207:b0:19c:bcb7:a3f4 with SMTP id
 l7-20020a170903120700b0019cbcb7a3f4mr5038261plh.54.1677639680817; 
 Tue, 28 Feb 2023 19:01:20 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 56/62] target/i386: Don't use tcg_temp_local_new
Date: Tue, 28 Feb 2023 16:56:37 -1000
Message-Id: <20230301025643.1227244-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Since tcg_temp_new is now identical, use that.
In some cases we can avoid a copy from A0 or T0.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index f88d0e3671..defbc43deb 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3426,13 +3426,10 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 if (mod == 3) {
                     goto illegal_op;
                 }
-                a0 = tcg_temp_local_new();
-                t0 = tcg_temp_local_new();
+                a0 = s->A0;
+                t0 = s->T0;
                 label1 = gen_new_label();
 
-                tcg_gen_mov_tl(a0, s->A0);
-                tcg_gen_mov_tl(t0, s->T0);
-
                 gen_set_label(label1);
                 t1 = tcg_temp_new();
                 t2 = tcg_temp_new();
@@ -3444,9 +3441,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_brcond_tl(TCG_COND_NE, t0, t2, label1);
 
                 tcg_temp_free(t2);
-                tcg_temp_free(a0);
                 tcg_gen_neg_tl(s->T0, t0);
-                tcg_temp_free(t0);
             } else {
                 tcg_gen_neg_tl(s->T0, s->T0);
                 if (mod != 3) {
@@ -6248,13 +6243,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #endif
         {
             TCGLabel *label1;
-            TCGv t0, t1, t2, a0;
+            TCGv t0, t1, t2;
 
             if (!PE(s) || VM86(s))
                 goto illegal_op;
-            t0 = tcg_temp_local_new();
-            t1 = tcg_temp_local_new();
-            t2 = tcg_temp_local_new();
+            t0 = tcg_temp_new();
+            t1 = tcg_temp_new();
+            t2 = tcg_temp_new();
             ot = MO_16;
             modrm = x86_ldub_code(env, s);
             reg = (modrm >> 3) & 7;
@@ -6263,11 +6258,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_op_ld_v(s, ot, t0, s->A0);
-                a0 = tcg_temp_local_new();
-                tcg_gen_mov_tl(a0, s->A0);
             } else {
                 gen_op_mov_v_reg(s, ot, t0, rm);
-                a0 = NULL;
             }
             gen_op_mov_v_reg(s, ot, t1, reg);
             tcg_gen_andi_tl(s->tmp0, t0, 3);
@@ -6280,8 +6272,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_movi_tl(t2, CC_Z);
             gen_set_label(label1);
             if (mod != 3) {
-                gen_op_st_v(s, ot, t0, a0);
-                tcg_temp_free(a0);
+                gen_op_st_v(s, ot, t0, s->A0);
            } else {
                 gen_op_mov_reg_v(s, ot, rm, t0);
             }
@@ -6304,7 +6295,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             modrm = x86_ldub_code(env, s);
             reg = ((modrm >> 3) & 7) | REX_R(s);
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
-            t0 = tcg_temp_local_new();
+            t0 = tcg_temp_new();
             gen_update_cc_op(s);
             if (b == 0x102) {
                 gen_helper_lar(t0, cpu_env, s->T0);
@@ -7052,7 +7043,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->tmp2_i32 = tcg_temp_new_i32();
     dc->tmp3_i32 = tcg_temp_new_i32();
     dc->tmp4 = tcg_temp_new();
-    dc->cc_srcT = tcg_temp_local_new();
+    dc->cc_srcT = tcg_temp_new();
 }
 
 static void i386_tr_tb_start(DisasContextBase *db, CPUState *cpu)
-- 
2.34.1


