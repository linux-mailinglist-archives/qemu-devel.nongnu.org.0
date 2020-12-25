Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5052E2C5F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:33:43 +0100 (CET)
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kstmQ-0007NT-Sv
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZP-0003A3-BL
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:15 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:33314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZN-0005DG-EC
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:15 -0500
Received: by mail-pl1-x62a.google.com with SMTP id b8so2737095plx.0
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Xxdlselw+eX7K6I9BjGaSB/WVE8EMZ3le/2fkC19IbY=;
 b=bI7dzE2MA/eD5jnwd7+0e4WVJ5tr+K+nxUEhuj61uWaTUM7ZQf8LSGCKDO1Fbav0uo
 1r3Y4xUEaWJykPP22WShMIHE9MQLxS/5lIHSN1EcmuVxZiOivrAWtaT720HleE46UnFm
 3it08SfYr2yRKfGPhLoZZ5j4zrPCuw9FT9/FAXtPzfTtonCnSJ54JeO9ZbzMZg8qjsgs
 OWgcD9+OaUpjT+pRF7nNJo/YIJkBCl+CGgZlq4w+yjWj5NkQqJOR9iqDICitmTl0qyok
 i1fmlFL7xHZMacEs+y2cBa36JDmVl8fnPMOiWwbH4XacK/btjKmc/tPBsGj008mkCpEE
 2SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xxdlselw+eX7K6I9BjGaSB/WVE8EMZ3le/2fkC19IbY=;
 b=E6lbBcQkre0usBOaA68+ym8tTNOQwK+XqQCXlpM3A4BUSytX2fh/8I1r++DCosBg2S
 RzjxZt33U9VSuSl+MCbWgxAWJd4ghuz15C34tj35z2At/C2+nNy46ggmYlWjhhgmkZg/
 TyjwziNbIxo//bLzh4djxXHLDlCaZIPpTtJ8aGOH9MD+xToX8fgZ3hPsKvIFo00feTET
 6iSG6aTRELEfE7iCHW1gqcXsy9Ctj0wRy4asvUoOM2sT4wu5Fa6fYzaLt/V5fi2S11dg
 nFrP6aIbXlfw4N7Edk9GDcrbIRF5f2s9Ozy8kXlcEiHQ4f/J8BzpEpgc/aONzFi0+y2A
 Kwgg==
X-Gm-Message-State: AOAM532rGZ3Koc/Gfy5k5SiWD+JmCy6u/r9lYVS8IdylmL8jYXuEfXpS
 0zq92eFNnUj2WvWeMhi733ELX/pwz7oRng==
X-Google-Smtp-Source: ABdhPJzy9VsQlkbFUlGVUXuz2lG90uHKrfAmSfdMc7m71jZOf5egXPCwHV/MBt9IyiuzEWjQ8E/rWA==
X-Received: by 2002:a17:90a:5513:: with SMTP id
 b19mr10015827pji.99.1608927611791; 
 Fri, 25 Dec 2020 12:20:11 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.20.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:20:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/16] tcg/s390x: Implement TCG_TARGET_HAS_minmax_vec
Date: Fri, 25 Dec 2020 12:19:52 -0800
Message-Id: <20201225201956.692861-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225201956.692861-1-richard.henderson@linaro.org>
References: <20201225201956.692861-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  2 +-
 tcg/s390x/tcg-target.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index a97738e525..acea745016 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -152,7 +152,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_shv_vec        1
 #define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
-#define TCG_TARGET_HAS_minmax_vec     0
+#define TCG_TARGET_HAS_minmax_vec     1
 #define TCG_TARGET_HAS_bitsel_vec     0
 #define TCG_TARGET_HAS_cmpsel_vec     0
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 259b63d8bc..36e5924353 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -267,6 +267,10 @@ typedef enum S390Opcode {
     VRRc_VESRAV = 0xe77a,
     VRRc_VESRLV = 0xe778,
     VRRc_VML    = 0xe7a2,
+    VRRc_VMN    = 0xe7fe,
+    VRRc_VMNL   = 0xe7fc,
+    VRRc_VMX    = 0xe7ff,
+    VRRc_VMXL   = 0xe7fd,
     VRRc_VN     = 0xe768,
     VRRc_VNC    = 0xe769,
     VRRc_VNO    = 0xe76b,
@@ -2728,6 +2732,19 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, VRRc, VERLLV, a0, a1, a2, vece);
         break;
 
+    case INDEX_op_smin_vec:
+        tcg_out_insn(s, VRRc, VMN, a0, a1, a2, vece);
+        break;
+    case INDEX_op_smax_vec:
+        tcg_out_insn(s, VRRc, VMX, a0, a1, a2, vece);
+        break;
+    case INDEX_op_umin_vec:
+        tcg_out_insn(s, VRRc, VMNL, a0, a1, a2, vece);
+        break;
+    case INDEX_op_umax_vec:
+        tcg_out_insn(s, VRRc, VMXL, a0, a1, a2, vece);
+        break;
+
     case INDEX_op_cmp_vec:
         switch ((TCGCond)args[3]) {
         case TCG_COND_EQ:
@@ -2774,7 +2791,11 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shri_vec:
     case INDEX_op_shrs_vec:
     case INDEX_op_shrv_vec:
+    case INDEX_op_smax_vec:
+    case INDEX_op_smin_vec:
     case INDEX_op_sub_vec:
+    case INDEX_op_umax_vec:
+    case INDEX_op_umin_vec:
     case INDEX_op_xor_vec:
         return 1;
     case INDEX_op_cmp_vec:
@@ -3035,6 +3056,10 @@ static int tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
+    case INDEX_op_smax_vec:
+    case INDEX_op_smin_vec:
+    case INDEX_op_umax_vec:
+    case INDEX_op_umin_vec:
         return C_O1_I2(v, v, v);
     case INDEX_op_rotls_vec:
     case INDEX_op_shls_vec:
-- 
2.25.1


