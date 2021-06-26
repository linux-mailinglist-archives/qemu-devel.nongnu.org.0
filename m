Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FA33B4CC3
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:11:02 +0200 (CEST)
Received: from localhost ([::1]:37858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx0ar-0001My-BP
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TP-0006z5-0k
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:19 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TM-0008Ha-NM
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:18 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x22so5777094pll.11
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=efBLLD49qr2p/LDJOapeQP0oKHtNvdFQQbTOrF6f0FM=;
 b=KxXU1DPUhbaFYpbICG4QVSc7ObSRfOFu26NsfTlAKBM65H6vTaC6kciKhocgZ9SJ0M
 Wa2Q9PrF3FVTFauseshO2MR6q0fo5Gr60S2jfecFEdHWuXYmxSFazzsXqWhusIdLEKVf
 8EuXhowNAwcCDr5vxXWIwcAod/DLp3oTZBGdqufw6UIG1Q9DxmQQGeIduzSMl+E2a4rl
 7YKNZdzjulNUpTi0QEnu5Zt6hJ32Wz4tjF9IulxjgfTfy6sUv3ymSa0e7m9D3/2OeMTS
 Ej27cbN+I+c9uD0vrrjLYSFKXJ36WJEQ9kgkAUKskRxzMaXA3Exa7AvrKZt+XNJ1fQWk
 PZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=efBLLD49qr2p/LDJOapeQP0oKHtNvdFQQbTOrF6f0FM=;
 b=M+6cqKQeHBg5larp/GaX6dBudVQzCdWS2oKak48MEDN3zs2T/iIuZk/9zfAZyoCzWk
 je8iYjnjXXwL7ssrvktSle1O9mpOvjUfIEEACilT+Asgpa3fZfi/elUySTQqL3HwjUPO
 W/P55IDcbGiRdFcTcMGkrnG3DjgT+YF3IqoFmbbTz8/LOhF6P3mXP5jDKBuorizYAjcq
 mCPSYqK8XD3hAbhmXPiO/F4jnAP3xMve576ZqaVAHAG8xzxelg4+zEjv8+l+4m65oXhQ
 W4sJiXWjaMgDMiXuvn2UZGQ6PbXdqRqpzW/UMClvBvggshmthzDj8M3nnpH7V8JTok7F
 7sQA==
X-Gm-Message-State: AOAM530yo5nrWqgqx/JmlLfgWfw8BY9yzHihf7UZIl8LGdjDxqOCRx+v
 hxuRjBfYnc2mfn3EsvFjbPoE8n6W8WbyVQ==
X-Google-Smtp-Source: ABdhPJwM3N9OsnfD/rEjm3k/nfypHn0WwdkwmHGzRY/gktv1ct8P9aId9/Tj7lDmnEFIZBSviO1XXw==
X-Received: by 2002:a17:90a:420b:: with SMTP id
 o11mr14551385pjg.201.1624683795157; 
 Fri, 25 Jun 2021 22:03:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c62sm7389768pfa.12.2021.06.25.22.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 22:03:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/16] tcg/s390x: Implement TCG_TARGET_HAS_minmax_vec
Date: Fri, 25 Jun 2021 22:03:03 -0700
Message-Id: <20210626050307.2408505-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626050307.2408505-1-richard.henderson@linaro.org>
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  2 +-
 tcg/s390x/tcg-target.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 8dce6af5af..275f980cee 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -156,7 +156,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_shv_vec        1
 #define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
-#define TCG_TARGET_HAS_minmax_vec     0
+#define TCG_TARGET_HAS_minmax_vec     1
 #define TCG_TARGET_HAS_bitsel_vec     0
 #define TCG_TARGET_HAS_cmpsel_vec     0
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index b9d12e579b..b96128760f 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -282,6 +282,10 @@ typedef enum S390Opcode {
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
@@ -2735,6 +2739,19 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2781,7 +2798,11 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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
@@ -3042,6 +3063,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


