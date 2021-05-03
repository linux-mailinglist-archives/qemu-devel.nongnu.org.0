Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1265D371FD9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:44:31 +0200 (CEST)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lddYU-000090-2c
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQI-0005pO-T0
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:36:03 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQ8-0008HS-NB
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:36:02 -0400
Received: by mail-pg1-x529.google.com with SMTP id d29so3499183pgd.4
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p3VKizM86ApFuWdh3B1dTH/2FVU2Zs3uvg5vUpds1po=;
 b=Gz/9/lVGXSkKvBJzYcm6IryNfbuyxvrx3dn7zjDikzA/Fso8+nEBmFoaDTDzCd5n3n
 AIp/4JMaxTfvwE2+2kdpWF06yfnei+aLwya3tM6QfhhNgeB2TRxyd2sk/yIr801gSlSI
 IbzdWjwwkpIqg0LMbdtd7LJrtx5TeCY++bYRhRBV0YR/bgtRNNRzM+CsGeuSHgmWs6Et
 Di2g4r6rnOf8eI9L/AwUZXs1qOHRuJx5wWce1jEUr3iddT9JAcV8PP2rkDFMeCsqbKge
 nLmOv4hj/KudlY8M7Fg3zaQaWmsGtUlm/JDnL0LoiPXEJWn8OBz41ZHiSTyAh2n6E8xp
 wONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p3VKizM86ApFuWdh3B1dTH/2FVU2Zs3uvg5vUpds1po=;
 b=cDCodOwjQrHrhjumqs6PFZ68fF0l9rhtC+hhxjwnAASH33TAUmzGs+4FYUDNCQXh6S
 v2yjSdVwzIIDX8io36dc/S1+QemuYHakaVVYnnSYYn5iUSnzls39dSVV5mKbPAI1QOUi
 OWtKlusrBiBgt5XpFbIpD6XpIYqWH/s+H68hz1KiaBf5+eGf8YY42RmPdjX3UpRHhCEi
 nhYMpAJ06U3QJ8rZIt0AbQzfDU4b36blp8D2GQTGhKZn5tB5kW3fyGEI/YNxK76iP8YU
 f4LhPtDdMNip1hmmYo8PdeB15mhkz9Q84ATXxqi4uNVRseoSRnjeojI6pYXeEBxzPpEk
 0hIA==
X-Gm-Message-State: AOAM531w5bUfPAKD/RWZMlO7o+y5xIvQAgGDHwU6u3QJQhYGW5VaAFLp
 jNg36yUYmtiJgLXeN/4vQHLvI6et2u0lew==
X-Google-Smtp-Source: ABdhPJx4AkJnhBR3hSFtz8Afd0jowRs+AVog1EPW+2W4MSQm52jr2cF48+iPAIsZgZknCaQd00HU0g==
X-Received: by 2002:a62:5ec7:0:b029:227:3253:3f62 with SMTP id
 s190-20020a625ec70000b029022732533f62mr20216934pfb.54.1620066950314; 
 Mon, 03 May 2021 11:35:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q27sm4251567pfl.41.2021.05.03.11.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 11:35:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/16] tcg/s390x: Implement TCG_TARGET_HAS_minmax_vec
Date: Mon,  3 May 2021 11:35:37 -0700
Message-Id: <20210503183541.2014496-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503183541.2014496-1-richard.henderson@linaro.org>
References: <20210503183541.2014496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: thuth@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  2 +-
 tcg/s390x/tcg-target.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 3026a4d8c4..efa32f348c 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -153,7 +153,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_shv_vec        1
 #define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
-#define TCG_TARGET_HAS_minmax_vec     0
+#define TCG_TARGET_HAS_minmax_vec     1
 #define TCG_TARGET_HAS_bitsel_vec     0
 #define TCG_TARGET_HAS_cmpsel_vec     0
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 3ad6dbab2d..07a86f4392 100644
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
@@ -2733,6 +2737,19 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2779,7 +2796,11 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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
@@ -3040,6 +3061,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


