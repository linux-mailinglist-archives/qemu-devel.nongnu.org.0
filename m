Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA662F1E2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:52:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxzl-000800-7K; Fri, 18 Nov 2022 04:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzS-0007kK-NJ
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:57 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzP-000293-BM
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:53 -0500
Received: by mail-pl1-x634.google.com with SMTP id k7so4104132pll.6
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zrlVrOpeCBe1Y6fxW7Q9Kia6e+buM0YiUwHFQiodiXk=;
 b=ihOdz1hnNemjhufe722R1BTKPGUIFb+31U6eAEeIpiqLS1lkQDBOLUsEr4OrtbkwXH
 ftw5+pcoSfx5yxY8wYByR9NYnDF+WA3Vtlyrus1b10mGA5xFqVHEjAwmfSpasfVT2c+E
 WAfFpnrXsXjUEpCljp17gATQEZTivwtOZUQ3W1aPhRZqyAGlpWqAzZacLh4u9Z9DyvBb
 /ZSbxD6BzbrvLH1wvFLZXP2hnq0Vihqbv7LqIwpYTqVTSCDx/Ujh0yGoWTlkzxSeZq/j
 iSMoR64QJafjRLUCZJ58yBUhgE0eXnfcOTl3kXFKdMj6h6YxJu0aAtaDHqwdq3FViwqD
 zhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zrlVrOpeCBe1Y6fxW7Q9Kia6e+buM0YiUwHFQiodiXk=;
 b=swDXGwbZiibd5XF6+Pe/c1kraWjbZ+Xj0BFNCoCECbk30zpQ9IVhjW6kNOm+AXi4J/
 wecUxuJUeEhg2zbuEZc2AbMAIyNfv4iNrCWfgxaWD6JAt6Sql6K6oJIC1HZv0vnqOhUR
 SZGTiFEAMx/j3+Zr2tyGSw5OSqXTpnSV+1thQXY3hs6MhOjRkW8Dk57z79NhNM5wKoRL
 YUbJhPHGhjjmWls16HtszQV6yuxuEPrNJC9sdNBvQeN5agUidbqMT3RYA3scOoI5m1Kd
 3716gd4NA/EkM1X+nehRwZfjTFmQK9xIlEffEWczxlsOZ2p8hc2Rjag9yMhL/nv0putV
 DyXg==
X-Gm-Message-State: ANoB5pnydKebuE2LCS6bYlyw/sJ07NlCmbGw7HEaK9opdA6Pkbh4rUyh
 JXKeOBx2pDGmVPgEczWuxiHTIVq1FezIbw==
X-Google-Smtp-Source: AA0mqf7HK5Bw+p8/KbcqGVksyy+O06mcoJX+FKYYKSYWgwRSq6BYerZWTLcUxp2VCu775IcHuFwzLQ==
X-Received: by 2002:a17:903:1c4:b0:187:12cc:d6f1 with SMTP id
 e4-20020a17090301c400b0018712ccd6f1mr6715884plh.63.1668764929477; 
 Fri, 18 Nov 2022 01:48:49 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 29/29] tcg/i386: Honor 64-bit atomicity in 32-bit mode
Date: Fri, 18 Nov 2022 01:47:54 -0800
Message-Id: <20221118094754.242910-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Use one of the coprocessors to perform 64-bit stores.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 119 +++++++++++++++++++++++++++++++++-----
 1 file changed, 106 insertions(+), 13 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 3f0cb4bc66..3d3ee4b20a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -472,6 +472,10 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_GRP5        (0xff)
 #define OPC_GRP14       (0x73 | P_EXT | P_DATA16)
 
+#define OPC_ESCDF       (0xdf)
+#define ESCDF_FILD_m64  5
+#define ESCDF_FISTP_m64 7
+
 /* Group 1 opcode extensions for 0x80-0x83.
    These are also used as modifiers for OPC_ARITH.  */
 #define ARITH_ADD 0
@@ -2400,21 +2404,65 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
             tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
                                      base, index, 0, ofs);
         } else {
+            TCGLabel *l1 = NULL, *l2 = NULL;
+            bool use_pair = atom < MO_64;
+
             if (use_movbe) {
                 TCGReg t = datalo;
                 datalo = datahi;
                 datahi = t;
             }
-            if (base != datalo) {
-                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
-                                         base, index, 0, ofs);
-                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                         base, index, 0, ofs + 4);
-            } else {
-                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                         base, index, 0, ofs + 4);
-                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
+
+            if (!use_pair) {
+                /*
+                 * Atomicity requires that we use use a single 8-byte load.
+                 * For simplicity, and code size, always use the FPU for this.
+                 * Similar insns using SSE/AVX are merely larger.
+                 * Load from memory in one go, then store back to the stack,
+                 * from whence we can load into the correct integer regs.
+                 *
+                 * If we've already checked for 8-byte alignment, or not
+                 * checked for alignment at all, that's all we need.
+                 * If we arrive here with lesser but non-zero alignment,
+                 * then we have determined that subalignment can be
+                 * satisfied with two 4-byte loads.
+                 */
+                if (align > MO_8 && align < MO_64) {
+                    use_pair = true;
+                    l1 = gen_new_label();
+                    l2 = gen_new_label();
+
+                    tcg_out_testi(s, base, align == MO_32 ? 4 : 7);
+                    tcg_out_jxx(s, JCC_JNE, l2, true);
+                }
+
+                tcg_out_modrm_sib_offset(s, OPC_ESCDF + seg, ESCDF_FILD_m64,
                                          base, index, 0, ofs);
+                tcg_out_modrm_offset(s, OPC_ESCDF, ESCDF_FISTP_m64,
+                                     TCG_REG_ESP, 0);
+                tcg_out_modrm_offset(s, movop, datalo, TCG_REG_ESP, 0);
+                tcg_out_modrm_offset(s, movop, datahi, TCG_REG_ESP, 4);
+
+                if (use_pair) {
+                    tcg_out_jxx(s, JCC_JMP, l1, true);
+                    tcg_out_label(s, l2);
+                }
+            }
+            if (use_pair) {
+                if (base != datalo) {
+                    tcg_out_modrm_sib_offset(s, movop + seg, datalo,
+                                             base, index, 0, ofs);
+                    tcg_out_modrm_sib_offset(s, movop + seg, datahi,
+                                             base, index, 0, ofs + 4);
+                } else {
+                    tcg_out_modrm_sib_offset(s, movop + seg, datahi,
+                                             base, index, 0, ofs + 4);
+                    tcg_out_modrm_sib_offset(s, movop + seg, datalo,
+                                             base, index, 0, ofs);
+                }
+            }
+            if (l1) {
+                tcg_out_label(s, l1);
             }
         }
         break;
@@ -2577,20 +2625,65 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
     case MO_32:
         tcg_out_modrm_sib_offset(s, movop + seg, datalo, base, index, 0, ofs);
         break;
+
     case MO_64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
                                      base, index, 0, ofs);
         } else {
+            TCGLabel *l1 = NULL, *l2 = NULL;
+            bool use_pair = atom < MO_64;
+
             if (use_movbe) {
                 TCGReg t = datalo;
                 datalo = datahi;
                 datahi = t;
             }
-            tcg_out_modrm_sib_offset(s, movop + seg, datalo,
-                                     base, index, 0, ofs);
-            tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                     base, index, 0, ofs + 4);
+
+            if (!use_pair) {
+                /*
+                 * Atomicity requires that we use use one 8-byte store.
+                 * For simplicity, and code size, always use the FPU for this.
+                 * Similar insns using SSE/AVX are merely larger.
+                 * Assemble the 8-byte quantity in required endianness
+                 * on the stack, load to coproc unit, and store.
+                 *
+                 * If we've already checked for 8-byte alignment, or not
+                 * checked for alignment at all, that's all we need.
+                 * If we arrive here with lesser but non-zero alignment,
+                 * then we have determined that subalignment can be
+                 * satisfied with two 4-byte stores.
+                 */
+                if (align > MO_8 && align < MO_64) {
+                    use_pair = true;
+                    l1 = gen_new_label();
+                    l2 = gen_new_label();
+
+                    tcg_out_testi(s, base, align == MO_32 ? 4 : 7);
+                    tcg_out_jxx(s, JCC_JNE, l2, true);
+                }
+
+                tcg_out_modrm_offset(s, movop, datalo, TCG_REG_ESP, 0);
+                tcg_out_modrm_offset(s, movop, datahi, TCG_REG_ESP, 4);
+                tcg_out_modrm_offset(s, OPC_ESCDF, ESCDF_FILD_m64,
+                                     TCG_REG_ESP, 0);
+                tcg_out_modrm_sib_offset(s, OPC_ESCDF + seg, ESCDF_FISTP_m64,
+                                         base, index, 0, ofs);
+
+                if (use_pair) {
+                    tcg_out_jxx(s, JCC_JMP, l1, true);
+                    tcg_out_label(s, l2);
+                }
+            }
+            if (use_pair) {
+                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
+                                         base, index, 0, ofs);
+                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
+                                         base, index, 0, ofs + 4);
+            }
+            if (l1) {
+                tcg_out_label(s, l1);
+            }
         }
         break;
 
-- 
2.34.1


