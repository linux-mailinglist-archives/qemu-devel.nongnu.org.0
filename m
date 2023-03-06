Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21CD6AB40A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:52:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyU-0004hC-NS; Sun, 05 Mar 2023 19:45:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxn-000365-LR
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:28 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxk-0007NB-Uj
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:27 -0500
Received: by mail-pj1-x1034.google.com with SMTP id l1so8172331pjt.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vDlCQf31Dj36OEy3Cca/pO3Iy86ZejFTu+whXqMUGRY=;
 b=rewc1ra1+C8sHHZScuEgVjCaFs8OnqiKvqGkodWfEkHmwTga5f5yBAIv+HNJUQBULi
 cmKqf0xdO787PFMV+ZrhXGIx2ody2GJEiUsi3c61qAbu3umWhcFebnhT1LUgjmPVGX6W
 xV1elTSPxVRtFZgJU/lnjxhjRe18cvABh0PGErAcfCeWaiHEk/AKmP7h1WwIGc7W8ylF
 MwT9pywfpB5HiRv0jKG8YoKHfyu/ifc0pYvPxBYjnfZICe9Tm/E9/lojV5qpetNoAJPF
 5EN1IU0sNJ28PHtkZ8XccJ1ErvlEFkuCjhiuj6UVYItgyvT5+fL1tAHgs0CBav8Vdaip
 l2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vDlCQf31Dj36OEy3Cca/pO3Iy86ZejFTu+whXqMUGRY=;
 b=Ja252khoINBin1THPTc8afPJeuTo27bIP2+7CWStIX7hX5Ee4OD7K3WdnyXNQft9e7
 k1DKrSxw9CWtd3XEYNQDpIZsQSGtLZRERt01ZQGFO7NgiMwbsOLz3vXRoct1H4UYV3VW
 Jj82lKyyLynpGDnKqHGObSfq3Rw55tofLk5bEr8zwF2VZe+tE/2zgVpoVi88TIXGN1SW
 xVCVQKZoBtSLWeQ/fep/skGW4t9XAX5lOqTeGU6nmH6dQN4sESxYB1Yltl0uLney4xsw
 pbFhAZbWNCpLDUvGR488hWHwhWH8vl2fAk+5eAe8KZirApFXoz/fV4Y+6VxexVSj/ktn
 STSA==
X-Gm-Message-State: AO0yUKUc/eFTaiTgLMJDFEvqDmJE5DDP1/k1wM4AFmeMN9dMYusMxL/O
 yRaHkF0huTDbbt+ly1MSLP5a6sl/8zjfUIaV+oHdPA==
X-Google-Smtp-Source: AK7set+oE0Jj89nVt58SlzpYwvqbQf0wBa3yTGpX5SNfWYnNMe79RbTJbTxjNz8ATLLeK6LmxjGOZQ==
X-Received: by 2002:a05:6a20:4904:b0:cc:f057:d3e2 with SMTP id
 ft4-20020a056a20490400b000ccf057d3e2mr8966512pzb.9.1678063463594; 
 Sun, 05 Mar 2023 16:44:23 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 76/84] target/riscv: Avoid tcg_const_*
Date: Sun,  5 Mar 2023 16:39:46 -0800
Message-Id: <20230306003954.1866998-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

All uses are strictly read-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                  | 4 ++--
 target/riscv/insn_trans/trans_rvv.c.inc   | 4 ++--
 target/riscv/insn_trans/trans_rvzfh.c.inc | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0485abbf7a..93909207d2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -201,8 +201,8 @@ static void gen_nanbox_h(TCGv_i64 out, TCGv_i64 in)
  */
 static void gen_check_nanbox_h(TCGv_i64 out, TCGv_i64 in)
 {
-    TCGv_i64 t_max = tcg_const_i64(0xffffffffffff0000ull);
-    TCGv_i64 t_nan = tcg_const_i64(0xffffffffffff7e00ull);
+    TCGv_i64 t_max = tcg_constant_i64(0xffffffffffff0000ull);
+    TCGv_i64 t_nan = tcg_constant_i64(0xffffffffffff7e00ull);
 
     tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
 }
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fa3f16eddd..f2e3d38515 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -209,8 +209,8 @@ static bool trans_vsetvli(DisasContext *s, arg_vsetvli *a)
 
 static bool trans_vsetivli(DisasContext *s, arg_vsetivli *a)
 {
-    TCGv s1 = tcg_const_tl(a->rs1);
-    TCGv s2 = tcg_const_tl(a->zimm);
+    TCGv s1 = tcg_constant_tl(a->rs1);
+    TCGv s2 = tcg_constant_tl(a->zimm);
     return do_vsetivli(s, a->rd, s1, s2);
 }
 
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index d2012c2841..74dde37ff7 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -299,7 +299,7 @@ static bool trans_fsgnjn_h(DisasContext *ctx, arg_fsgnjn_h *a)
          * Replace bit 15 in rs1 with inverse in rs2.
          * This formulation retains the nanboxing of rs1.
          */
-        mask = tcg_const_i64(~MAKE_64BIT_MASK(15, 1));
+        mask = tcg_constant_i64(~MAKE_64BIT_MASK(15, 1));
         tcg_gen_not_i64(rs2, rs2);
         tcg_gen_andc_i64(rs2, rs2, mask);
         tcg_gen_and_i64(dest, mask, rs1);
-- 
2.34.1


