Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CAB6B2E8B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:22:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMeF-0001aW-WF; Thu, 09 Mar 2023 15:14:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdl-0000Xc-9Z
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:31 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdb-0002HF-9i
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:21 -0500
Received: by mail-pl1-x62c.google.com with SMTP id p20so3193243plw.13
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=abw7O8IdUshPVU1Np0uC8f/uETNNE+lXSi/WAP9UCSk=;
 b=F+iX2M9wKeNL4dcu0oExivSwQTxFrnpZrpmAL+O9AlsGBcjgCtqTAUoU0BJhs9ScCF
 hnz/k1UbkZxV+Cl42eiNXBVi+4AMFkc96B4tBD3slK4R5VpS9/zyGvVIGFAV91Lfz5d3
 cy/ctvGQ36jV2+6beFDG/YkC61v5p0eqO0XoC4WDMrSmNab7THDpbXJbVc8woFP9jU0d
 oaprCx29R4/CvzBOxE13Sk3djtc4vyMt2n9gp6m1f5KrSsi29Nt1c777PuH2Fa8eEqnT
 xmn1x3szQUbMOUaG0iK/GbQ+ff82rnGiIyMFoa8BtVH8cU0EL5ZJX0kbcms2zva4yE3H
 BjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=abw7O8IdUshPVU1Np0uC8f/uETNNE+lXSi/WAP9UCSk=;
 b=6/89IPHAIrypqtBDtx7pUhjoy9YK6EQMIuGDX3HyfB0JQ86DvBYBbeBFOf1BGyacR5
 WeOGUCOwRXanLpGvFUj99a6KKxj90HweKf/OxNp0h0glmzwGP1Gtcs6K5OZYIOdGi0uS
 CyLopkM9PLe4iFs5tN/q6vaZb/zsuULj0S+0mgX23XIY5uNvrjYVd2uwLvSuCxDSd2OH
 SacdSVXuSfSx+OyEH2jsreWQG54PJ8Mot2AMi132QxfByGruHJLgpQtjGjf3Eli9/xFQ
 uITeqKDPNoxVdgno36s/P5wiG9604O1KTSjFKdyZMizcbULYdY/i/pVS5eSt9Gggd0a9
 s5Hg==
X-Gm-Message-State: AO0yUKWcSr8ANXArT/p1THzy6/WfQL6mMJai2XWHz1Teb5FmS8psyQag
 gqrZGNzUoVrBSfik4Zp6pVwI38a6RCxEKVu9MSw=
X-Google-Smtp-Source: AK7set/iFqR3LXixyMT1YyxHLbX4nXwZtZKFXJfDcTqdVeTdBjRQcif9p60GQErOiC734VcJXj3m9A==
X-Received: by 2002:a05:6a20:729b:b0:cd:1ccf:246f with SMTP id
 o27-20020a056a20729b00b000cd1ccf246fmr26778462pzk.34.1678392790371; 
 Thu, 09 Mar 2023 12:13:10 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a62a50f000000b005b02ddd852dsm11867744pfm.142.2023.03.09.12.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:13:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL v2 86/91] target/ppc: Rewrite trans_ADDG6S
Date: Thu,  9 Mar 2023 12:05:45 -0800
Message-Id: <20230309200550.3878088-87-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
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

Compute all carry bits in parallel instead of a loop.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/fixedpoint-impl.c.inc | 44 +++++++++++-----------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 20ea484c3d..02d86b77a8 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -484,33 +484,35 @@ static bool trans_PEXTD(DisasContext *ctx, arg_X *a)
 
 static bool trans_ADDG6S(DisasContext *ctx, arg_X *a)
 {
-    const uint64_t carry_bits = 0x1111111111111111ULL;
-    TCGv t0, t1, carry, zero = tcg_constant_tl(0);
+    const target_ulong carry_bits = (target_ulong)-1 / 0xf;
+    TCGv in1, in2, carryl, carryh, tmp;
+    TCGv zero = tcg_constant_tl(0);
 
     REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
 
-    t0 = tcg_temp_new();
-    t1 = tcg_const_tl(0);
-    carry = tcg_const_tl(0);
+    in1 = cpu_gpr[a->ra];
+    in2 = cpu_gpr[a->rb];
+    tmp = tcg_temp_new();
+    carryl = tcg_temp_new();
+    carryh = tcg_temp_new();
 
-    for (int i = 0; i < 16; i++) {
-        tcg_gen_shri_tl(t0, cpu_gpr[a->ra], i * 4);
-        tcg_gen_andi_tl(t0, t0, 0xf);
-        tcg_gen_add_tl(t1, t1, t0);
+    /* Addition with carry. */
+    tcg_gen_add2_tl(carryl, carryh, in1, zero, in2, zero);
+    /* Addition without carry. */
+    tcg_gen_xor_tl(tmp, in1, in2);
+    /* Difference between the two is carry in to each bit. */
+    tcg_gen_xor_tl(carryl, carryl, tmp);
 
-        tcg_gen_shri_tl(t0, cpu_gpr[a->rb], i * 4);
-        tcg_gen_andi_tl(t0, t0, 0xf);
-        tcg_gen_add_tl(t1, t1, t0);
+    /*
+     * The carry-out that we're looking for is the carry-in to
+     * the next nibble.  Shift the double-word down one nibble,
+     * which puts all of the bits back into one word.
+     */
+    tcg_gen_extract2_tl(carryl, carryl, carryh, 4);
 
-        tcg_gen_andi_tl(t1, t1, 0x10);
-        tcg_gen_setcond_tl(TCG_COND_NE, t1, t1, zero);
-
-        tcg_gen_shli_tl(t0, t1, i * 4);
-        tcg_gen_or_tl(carry, carry, t0);
-    }
-
-    tcg_gen_xori_tl(carry, carry, (target_long)carry_bits);
-    tcg_gen_muli_tl(cpu_gpr[a->rt], carry, 6);
+    /* Invert, isolate the carry bits, and produce 6's. */
+    tcg_gen_andc_tl(carryl, tcg_constant_tl(carry_bits), carryl);
+    tcg_gen_muli_tl(cpu_gpr[a->rt], carryl, 6);
     return true;
 }
 
-- 
2.34.1


