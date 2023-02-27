Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD246A3AD7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:51:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWN3-00039h-1K; Mon, 27 Feb 2023 00:48:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMa-000051-LP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:52 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMS-00073L-Oz
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:52 -0500
Received: by mail-pl1-x62c.google.com with SMTP id ky4so5588337plb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVJSO2h9tfQcb+TtXx2WZrUSZTfG/Y+e52Wp9jBRA8w=;
 b=ISLHfyMRU/+WDpTjnPft+E6v9lWzTbrl8FOqrdLr8eXVjwQeAAQja6dqt+KbS+xZxR
 ovLu6VotnRTaka08dwlkS92INEgypjfPjEhKRrpiLWXkSe30TM8N0k0y83pGNTBZkO6q
 o7Of3nbYVbDEduZalXPR7yj8HVC7lw3FfyLm3yiGtP6LInDwcPn/UD5+6cyW2dUfeeCN
 I9/WDvRXZpT1MJmDGn72jNj3/qoEMchqlL3fEVenHt6rlSx21IcDkb/Qn5EOmR+aMYuC
 +R2X3k5Qf+6Y8+Mb51hTJc6EJ9BoWbG7bszL7+H79lxXeJsJSwn/dD5ruoKscSUCWKic
 SuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aVJSO2h9tfQcb+TtXx2WZrUSZTfG/Y+e52Wp9jBRA8w=;
 b=e11xlGw6m6aroN6R7NuWjdwoU8SM3UaqJrQpk0p0xXs3tANIbzaQdRVc0ycydkpDyp
 BNdkMybkI0QrNJJO7/n8nHsC/twU4i3aTn1Un3iSEPjqRL9kAigTN1Kdiaj7ZrqIvYrP
 EuTpgotNkONpXERNQNYWiSb4bwgDAyzHzjoecW9moKrS6ibBqFq6RgoFfz3QhyApGhaC
 O6GgBOSEwC5XaKOQpJE7PGIF+E8+O67Kod76I2RjST5kZ8C/YwSFgYyZnM+KqrugPG1O
 DtVfd/dBcIac8M9kysMTxBHd0/W4wnPE1OphAIx86sdyBWnyT+IYpJbHlg1BTQGYWUhO
 0OGw==
X-Gm-Message-State: AO0yUKUe40+S2Ac9+0DXsCcXsZhMtEzP7g10U2L+dxe/EkQ+brpXESui
 flTjfazjwZi4z3vlvCLj+UPsDpouPzWPaYCbmuk=
X-Google-Smtp-Source: AK7set/NtvskgEVEtvG9vsxMsp3m3zVcTcDo2Nv1VvOCNwb83gW/puRQEJqYiYcVwV3WdqeVe+cphA==
X-Received: by 2002:a17:902:f685:b0:19d:1ffd:1485 with SMTP id
 l5-20020a170902f68500b0019d1ffd1485mr843921plg.66.1677476863953; 
 Sun, 26 Feb 2023 21:47:43 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 45/70] target/riscv: Avoid tcg_const_*
Date: Sun, 26 Feb 2023 19:42:08 -1000
Message-Id: <20230227054233.390271-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                  | 4 ++--
 target/riscv/insn_trans/trans_rvv.c.inc   | 4 ++--
 target/riscv/insn_trans/trans_rvzfh.c.inc | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 180fa5d30d..5c558a6f5f 100644
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
index 0607eff5e6..cee793a440 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -237,8 +237,8 @@ static bool trans_vsetvli(DisasContext *s, arg_vsetvli *a)
 
 static bool trans_vsetivli(DisasContext *s, arg_vsetivli *a)
 {
-    TCGv s1 = tcg_const_tl(a->rs1);
-    TCGv s2 = tcg_const_tl(a->zimm);
+    TCGv s1 = tcg_constant_tl(a->rs1);
+    TCGv s2 = tcg_constant_tl(a->zimm);
     return do_vsetivli(s, a->rd, s1, s2);
 }
 
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 03773e2aa8..a563cac97a 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -300,7 +300,7 @@ static bool trans_fsgnjn_h(DisasContext *ctx, arg_fsgnjn_h *a)
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


