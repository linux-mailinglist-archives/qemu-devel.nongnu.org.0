Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439386AF0BC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:36:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9p-0003r9-0u; Tue, 07 Mar 2023 13:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9m-0003p4-LO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:26 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9k-0007t6-OX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:26 -0500
Received: by mail-pj1-x102d.google.com with SMTP id y2so14129344pjg.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjOIZ5EQv+mPJcXiKX0Fq4Q7ChwmAlVw5eKwrOnmib8=;
 b=OS7WBG0c8TQ9K4UQDDJuqtfzys+33+GL1RxqUhBJH2sW/XbLnpl0ryedBAYuXnZg70
 o3n1e/ePMy9dfwQRMzC+BKTJ3MB13b2qwkWTPTH7lEepkdoNK+5kpCLZBBgmxMZV6TGm
 pdMwm4fBcM/xR1em6iBn92J0KlcwI1cPGcW/WeRlZ7KOnCTEyHpTFFGjTIq58OE/1HZc
 pMQICVWvYCYoPGfv3Edl7Ik3xI5YBQugA7hSNRay8/E1UT0n7FItJmvfDbIMT3Ot6uy2
 31gPHjrd+qpVj/J69s5Ld6cvWcj/ZEspHXx1SppSc19Cwdk5dtLVtFDIpcMwmM3wAaQ9
 mo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjOIZ5EQv+mPJcXiKX0Fq4Q7ChwmAlVw5eKwrOnmib8=;
 b=RLe/M2i4RH8+DbszhJITYq54JPNt5hY3jfked82XMivlZhDhxSa+xNhQqf6XqSWnDh
 2AnLtK23HFRq3B7rnA5TJWHyxdnB00uri4Vq2UDGxOip5s4FgK9YKE3/K5CEJHc/Wzdd
 krXn4mNg1+ZvFSs/7BbZxcyUwYmmg54d/oBGwS4I1utMLBR0g/exRA42TcSs2NSs79AB
 KTwhq1trQ6H2RmZbUub4qit8J/hz+pE42qrqzB8O31tsGz0mf9Bbw4ldnYFEsH+g9SxC
 VhF13G8Cv4GHNmqUnU4EbLnocQs0aDvxLkocYPx9q2ycL0xWb5HCOEqJLbEaENECntH7
 OR6w==
X-Gm-Message-State: AO0yUKWEZ6fvdozXIqcMrIIGqGihqRn3MQiACXThbXEcWpEJscupKy2m
 AxKNlZefJBsxL1DfAiHbDj+ULpdTaJeAEc/iOBA=
X-Google-Smtp-Source: AK7set81PjmPgTmLA38MOav1XudqxKeslvvz57JyoxQRGTzGJV5l9LeRFR7B79YJqgs+gGb8tZPRjw==
X-Received: by 2002:a17:90b:1b0f:b0:233:ce0b:8655 with SMTP id
 nu15-20020a17090b1b0f00b00233ce0b8655mr16117964pjb.28.1678214123437; 
 Tue, 07 Mar 2023 10:35:23 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 24/25] tcg: Drop tcg_const_*_vec
Date: Tue,  7 Mar 2023 10:35:02 -0800
Message-Id: <20230307183503.2512684-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Replace with tcg_constant_vec*.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         |  4 ----
 tcg/tcg-op-vec.c          | 34 ++--------------------------------
 tcg/i386/tcg-target.c.inc |  9 ++++-----
 3 files changed, 6 insertions(+), 41 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 00c4fbe613..d620012c48 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -999,10 +999,6 @@ void tcg_optimize(TCGContext *s);
 /* Allocate a new temporary and initialize it with a constant. */
 TCGv_i32 tcg_const_i32(int32_t val);
 TCGv_i64 tcg_const_i64(int64_t val);
-TCGv_vec tcg_const_zeros_vec(TCGType);
-TCGv_vec tcg_const_ones_vec(TCGType);
-TCGv_vec tcg_const_zeros_vec_matching(TCGv_vec);
-TCGv_vec tcg_const_ones_vec_matching(TCGv_vec);
 
 /*
  * Locate or create a read-only temporary that is a constant.
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 0f023f42c6..aeeb2435cb 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -229,32 +229,6 @@ void tcg_gen_mov_vec(TCGv_vec r, TCGv_vec a)
     }
 }
 
-TCGv_vec tcg_const_zeros_vec(TCGType type)
-{
-    TCGv_vec ret = tcg_temp_new_vec(type);
-    tcg_gen_dupi_vec(MO_64, ret, 0);
-    return ret;
-}
-
-TCGv_vec tcg_const_ones_vec(TCGType type)
-{
-    TCGv_vec ret = tcg_temp_new_vec(type);
-    tcg_gen_dupi_vec(MO_64, ret, -1);
-    return ret;
-}
-
-TCGv_vec tcg_const_zeros_vec_matching(TCGv_vec m)
-{
-    TCGTemp *t = tcgv_vec_temp(m);
-    return tcg_const_zeros_vec(t->base_type);
-}
-
-TCGv_vec tcg_const_ones_vec_matching(TCGv_vec m)
-{
-    TCGTemp *t = tcgv_vec_temp(m);
-    return tcg_const_ones_vec(t->base_type);
-}
-
 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec r, uint64_t a)
 {
     TCGTemp *rt = tcgv_vec_temp(r);
@@ -431,9 +405,7 @@ void tcg_gen_not_vec(unsigned vece, TCGv_vec r, TCGv_vec a)
     const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
 
     if (!TCG_TARGET_HAS_not_vec || !do_op2(vece, r, a, INDEX_op_not_vec)) {
-        TCGv_vec t = tcg_const_ones_vec_matching(r);
-        tcg_gen_xor_vec(0, r, a, t);
-        tcg_temp_free_vec(t);
+        tcg_gen_xor_vec(0, r, a, tcg_constant_vec_matching(r, 0, -1));
     }
     tcg_swap_vecop_list(hold_list);
 }
@@ -446,9 +418,7 @@ void tcg_gen_neg_vec(unsigned vece, TCGv_vec r, TCGv_vec a)
     hold_list = tcg_swap_vecop_list(NULL);
 
     if (!TCG_TARGET_HAS_neg_vec || !do_op2(vece, r, a, INDEX_op_neg_vec)) {
-        TCGv_vec t = tcg_const_zeros_vec_matching(r);
-        tcg_gen_sub_vec(vece, r, t, a);
-        tcg_temp_free_vec(t);
+        tcg_gen_sub_vec(vece, r, tcg_constant_vec_matching(r, vece, 0), a);
     }
     tcg_swap_vecop_list(hold_list);
 }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 4060a35cf6..4444eb9234 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3651,6 +3651,7 @@ static void expand_vec_sari(TCGType type, unsigned vece,
         break;
 
     case MO_64:
+        t1 = tcg_temp_new_vec(type);
         if (imm <= 32) {
             /*
              * We can emulate a small sign extend by performing an arithmetic
@@ -3659,24 +3660,22 @@ static void expand_vec_sari(TCGType type, unsigned vece,
              * does not, so we have to bound the smaller shift -- we get the
              * same result in the high half either way.
              */
-            t1 = tcg_temp_new_vec(type);
             tcg_gen_sari_vec(MO_32, t1, v1, MIN(imm, 31));
             tcg_gen_shri_vec(MO_64, v0, v1, imm);
             vec_gen_4(INDEX_op_x86_blend_vec, type, MO_32,
                       tcgv_vec_arg(v0), tcgv_vec_arg(v0),
                       tcgv_vec_arg(t1), 0xaa);
-            tcg_temp_free_vec(t1);
         } else {
             /* Otherwise we will need to use a compare vs 0 to produce
              * the sign-extend, shift and merge.
              */
-            t1 = tcg_const_zeros_vec(type);
-            tcg_gen_cmp_vec(TCG_COND_GT, MO_64, t1, t1, v1);
+            tcg_gen_cmp_vec(TCG_COND_GT, MO_64, t1,
+                            tcg_constant_vec(type, MO_64, 0), v1);
             tcg_gen_shri_vec(MO_64, v0, v1, imm);
             tcg_gen_shli_vec(MO_64, t1, t1, 64 - imm);
             tcg_gen_or_vec(MO_64, v0, v0, t1);
-            tcg_temp_free_vec(t1);
         }
+        tcg_temp_free_vec(t1);
         break;
 
     default:
-- 
2.34.1


