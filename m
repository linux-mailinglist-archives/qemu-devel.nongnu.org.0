Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71F12E291D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:56:07 +0100 (CET)
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZWg-0004ru-Sv
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMS-00021f-Op
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:36 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMQ-0008Li-HA
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:32 -0500
Received: by mail-pl1-x633.google.com with SMTP id r4so1804988pls.11
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pjxg4XUKPRZdCgpcbVtNrmcfhuCNTQ4S7bGgZjeSe+o=;
 b=tO+OOCU1NNkPUK1zaMw9R2Xr9iW+q2oSd23EP/5VYY+uMHPfSy7iPAyHri8HGvJ1VN
 AxjHxv2WbYVv7LBE+siECFaIqGa4lWCsGsOE/jhC2S7k+S/nQW0yyw7WmUXpk4tdUI16
 JHINrTOnTo3YWDoUChTveTDN6SG1+UDqklUDLm6qxE/BWyeCo1Jc5c84KDZ5vzdbbb8K
 bD6UfumyekSRecij1NiwOYUp9uHHbkS48wHz3aza4Y+JzfdUnT1NAf42S/nbeqgsE4AW
 416QcArfjLSqBJketueAXO4ogq/VqkTd8ledRmSfdFRaDv8SMc/kRfiOpY65/51YW7GD
 MgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pjxg4XUKPRZdCgpcbVtNrmcfhuCNTQ4S7bGgZjeSe+o=;
 b=gIsTjE0+yO44k+Zs0kk0JlaHys/ES/kV/aobZPgv6/I5U+SRBt1biVBDz81hjOT6UJ
 HjrZoLu0qVjvCNGFZP8L/JXLcDh+UMhJXkfRJk0x4Gfl5ZKSxWYtH08QMpiBihbm3v5+
 gJVdxFF703cs533wIll+6RowsCBvRRl+SN6tSUC2nlghHkxp8rz0EPO82ZoxX4v7C9u7
 +yLc01QEarA6TQxGKqAX/GY/SpWLIgzQMv8Ncl0VBHohJwRd41na6Vak3cYWVBsF40oe
 4Ae8mIUMAi8q2+et/FIhtOrjLNXTy1rLXDArkx4eqvW/0nISO4w1t2tMotxeYpR964st
 bVBA==
X-Gm-Message-State: AOAM531f8nvqZvLUIC7bXADGcK33H4UNFsbGt/84ItyBBcmTBv2SbO55
 VUIIVicTBtp2NlFRRxbUzSGE9qLgOgxHPg==
X-Google-Smtp-Source: ABdhPJyfzFcsasXtOe0vuWmbuYbpiUhK+kTc4iXgBb/68h0AzZ8BZwT1GJB0Dzqmw1GV9+bK3XxuUw==
X-Received: by 2002:a17:902:778e:b029:da:feef:8f2d with SMTP id
 o14-20020a170902778eb02900dafeef8f2dmr31365070pll.25.1608849928927; 
 Thu, 24 Dec 2020 14:45:28 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/15] tcg/arm: Implement TCG_TARGET_HAS_bitsel_vec
Date: Thu, 24 Dec 2020 14:45:11 -0800
Message-Id: <20201224224514.626561-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

NEON has 3 instructions implementing this 4 argument operation,
with each insn overlapping a different logical input onto the
destination register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-conset.h |  1 +
 tcg/arm/tcg-target.h        |  2 +-
 tcg/arm/tcg-target.c.inc    | 22 ++++++++++++++++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/tcg/arm/tcg-target-conset.h b/tcg/arm/tcg-target-conset.h
index f32bf44f8b..30a5953621 100644
--- a/tcg/arm/tcg-target-conset.h
+++ b/tcg/arm/tcg-target-conset.h
@@ -29,6 +29,7 @@ C_O1_I2(w, w, w)
 C_O1_I2(w, w, wO)
 C_O1_I2(w, w, wV)
 C_O1_I2(w, w, wZ)
+C_O1_I3(w, w, w, w)
 C_O1_I4(r, r, r, rI, rI)
 C_O1_I4(r, r, rIN, rIK, 0)
 C_O2_I1(r, r, l)
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index e3c533f00f..7463be8f27 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -168,7 +168,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_mul_vec          1
 #define TCG_TARGET_HAS_sat_vec          1
 #define TCG_TARGET_HAS_minmax_vec       1
-#define TCG_TARGET_HAS_bitsel_vec       0
+#define TCG_TARGET_HAS_bitsel_vec       1
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
 #define TCG_TARGET_DEFAULT_MO (0)
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 6e17082df2..aea3d2cf8f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -216,6 +216,10 @@ typedef enum {
     INSN_VSARI     = 0xf2800010,  /* VSHR.S */
     INSN_VSHRI     = 0xf3800010,  /* VSHR.U */
 
+    INSN_VBSL      = 0xf3100110,
+    INSN_VBIT      = 0xf3200110,
+    INSN_VBIF      = 0xf3300110,
+
     INSN_VTST      = 0xf2000810,
 
     INSN_VDUP_G    = 0xee800b10,  /* VDUP (ARM core register) */
@@ -2400,7 +2404,8 @@ static int tcg_target_op_def(TCGOpcode op)
         return C_O1_I2(w, w, wV);
     case INDEX_op_cmp_vec:
         return C_O1_I2(w, w, wZ);
-
+    case INDEX_op_bitsel_vec:
+        return C_O1_I3(w, w, w, w);
     default:
         g_assert_not_reached();
     }
@@ -2721,7 +2726,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
 {
     TCGType type = vecl + TCG_TYPE_V64;
     unsigned q = vecl;
-    TCGArg a0, a1, a2;
+    TCGArg a0, a1, a2, a3;
     int cmode, imm8;
 
     a0 = args[0];
@@ -2872,6 +2877,18 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         }
         return;
 
+    case INDEX_op_bitsel_vec:
+        a3 = args[3];
+        if (a0 == a3) {
+            tcg_out_vreg3(s, INSN_VBIT, q, 0, a0, a2, a1);
+        } else if (a0 == a2) {
+            tcg_out_vreg3(s, INSN_VBIF, q, 0, a0, a3, a1);
+        } else {
+            tcg_out_mov(s, type, a0, a1);
+            tcg_out_vreg3(s, INSN_VBSL, q, 0, a0, a2, a3);
+        }
+        return;
+
     case INDEX_op_mov_vec:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_dup_vec:  /* Always emitted via tcg_out_dup_vec.  */
     default:
@@ -2897,6 +2914,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_sssub_vec:
     case INDEX_op_usadd_vec:
     case INDEX_op_ussub_vec:
+    case INDEX_op_bitsel_vec:
         return 1;
     case INDEX_op_abs_vec:
     case INDEX_op_cmp_vec:
-- 
2.25.1


