Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E6347C4B0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:07:24 +0100 (CET)
Received: from localhost ([::1]:56874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzibj-0007IS-Uz
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:07:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ7-0000qM-Vp
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:09 -0500
Received: from [2607:f8b0:4864:20::52d] (port=45848
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIw-0007e3-LJ
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:09 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 2so6016855pgb.12
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zozyKTalGzaNsX7sRaTPXbvLzGeDnY64efJNy5c8mNI=;
 b=sUBGTFML4qY2wz2qFthdH7oEbO4Pb7FXaScfAs+hdvqiw9fnbiCCl38w4lRDmCd4oU
 k3x1BY5LVNOF+ZVd69nDXvvCEDX4fOUr/UT+rajsFLTXSFEj9KkxnIT8MLFiHpMX+bAW
 tgMnj1QoTW0Cq7CUv7YzmDP0Wyfi4yHaa0eV6UmEQXMS+MBgZH8s3Sn377t7/Ql7bCyF
 MnbyxTtow0JzUq/oTVv2AvuEfLgXoL8NHFlUjvmhoQIwrLgf4mVMxGSpH1WJrHvOmwD7
 yuPoVfp+VDb0R2K7FlfCNXEF8dPubKUGU8IwVWpg3z9z7uAx3wIW+PP0oC2LCHQ3dJH4
 W6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zozyKTalGzaNsX7sRaTPXbvLzGeDnY64efJNy5c8mNI=;
 b=dOz3x9ovbYJ4WxFqGxFrZj2XthMnRaufWR5Kigi7JiGe++uLFwmX3VSOIz+QcqSsdR
 WR08NBcDRh1My3FAP30cDWjBXtNRLh1VtfH5hSBl8vV5S7S2Zn6JQty5gbrRQ2ObafK8
 jFltke+CUln8Zxqeuskr3Hk7zNWAB6Y0Gs3Y7vKb0cyOD6dIl4YIFgPHfkuSHB7Dyxsu
 3diaG8uUnvDK1N1dm0THC4XfNFVnpX0hdnRAj04e0N0EJSWgqppYOLZVzk1K8aNEmIst
 pKMCN/uPSFIAma1VxyWyOlORtnuqj7sVBzE5apo5uom3aUxaf06yvs7dfUJ6cducP+K2
 3LIw==
X-Gm-Message-State: AOAM531a92pVlHavBJs6tjiFNMDOWRYlxvHcPUDKKSzbFmQ8GjWdHTj/
 1MJPB+GsInmN3MYzGhxMwDcLZA6o69SUYg==
X-Google-Smtp-Source: ABdhPJxjf9zHcPRdeUkZ1ucZ85EL6SrWnuseDTuzAoWbC0JoWtABFGeFG2webDd3CaZUBcLCazYkmg==
X-Received: by 2002:a63:5651:: with SMTP id g17mr3679821pgm.275.1640105277412; 
 Tue, 21 Dec 2021 08:47:57 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/31] tcg/loongarch64: Implement setcond ops
Date: Tue, 21 Dec 2021 08:47:26 -0800
Message-Id: <20211221164737.1076007-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221054105.178795-21-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.c.inc     | 69 ++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 367689c2e2..a2ec61237e 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -22,6 +22,7 @@ C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rU)
 C_O1_I2(r, r, rW)
+C_O1_I2(r, r, rZ)
 C_O1_I2(r, 0, rZ)
 C_O1_I2(r, rZ, rN)
 C_O1_I2(r, rZ, rZ)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index aedfc0df84..23c151f473 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -434,6 +434,66 @@ static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
     tcg_out_opc_or(s, a0, TCG_REG_TMP0, a0);
 }
 
+static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
+                            TCGReg arg1, TCGReg arg2, bool c2)
+{
+    TCGReg tmp;
+
+    if (c2) {
+        tcg_debug_assert(arg2 == 0);
+    }
+
+    switch (cond) {
+    case TCG_COND_EQ:
+        if (c2) {
+            tmp = arg1;
+        } else {
+            tcg_out_opc_sub_d(s, ret, arg1, arg2);
+            tmp = ret;
+        }
+        tcg_out_opc_sltui(s, ret, tmp, 1);
+        break;
+    case TCG_COND_NE:
+        if (c2) {
+            tmp = arg1;
+        } else {
+            tcg_out_opc_sub_d(s, ret, arg1, arg2);
+            tmp = ret;
+        }
+        tcg_out_opc_sltu(s, ret, TCG_REG_ZERO, tmp);
+        break;
+    case TCG_COND_LT:
+        tcg_out_opc_slt(s, ret, arg1, arg2);
+        break;
+    case TCG_COND_GE:
+        tcg_out_opc_slt(s, ret, arg1, arg2);
+        tcg_out_opc_xori(s, ret, ret, 1);
+        break;
+    case TCG_COND_LE:
+        tcg_out_setcond(s, TCG_COND_GE, ret, arg2, arg1, false);
+        break;
+    case TCG_COND_GT:
+        tcg_out_setcond(s, TCG_COND_LT, ret, arg2, arg1, false);
+        break;
+    case TCG_COND_LTU:
+        tcg_out_opc_sltu(s, ret, arg1, arg2);
+        break;
+    case TCG_COND_GEU:
+        tcg_out_opc_sltu(s, ret, arg1, arg2);
+        tcg_out_opc_xori(s, ret, ret, 1);
+        break;
+    case TCG_COND_LEU:
+        tcg_out_setcond(s, TCG_COND_GEU, ret, arg2, arg1, false);
+        break;
+    case TCG_COND_GTU:
+        tcg_out_setcond(s, TCG_COND_LTU, ret, arg2, arg1, false);
+        break;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+}
+
 /*
  * Branch helpers
  */
@@ -815,6 +875,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_mod_du(s, a0, a1, a2);
         break;
 
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
+        tcg_out_setcond(s, args[3], a0, a1, a2, c2);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -901,6 +966,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ctz_i64:
         return C_O1_I2(r, r, rW);
 
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
+        return C_O1_I2(r, r, rZ);
+
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
         /* Must deposit into the same register as input */
-- 
2.25.1


