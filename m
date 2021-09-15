Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E5940CEF6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:44:20 +0200 (CEST)
Received: from localhost ([::1]:58880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQchX-0001UP-7f
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV7-0003hC-KK
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:29 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV5-0003NE-RZ
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:29 -0400
Received: by mail-pl1-x634.google.com with SMTP id d17so2435676plr.12
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3L4V7jrQTj2VAptBwGguXAPOCVzUlnPEm/E02vYLZxo=;
 b=a1RLojNQkSk0sA5vX/LMkNpKtb/vEsQ9HS2EL2s0z3pYuckoXXv45qqseqLB50R/9s
 g/Q9xpRbUrwo/0VsYMupynxl7o+Di0DGsv2vjIZZtNHs0QsBp4YriFGL4wntOtNyPALP
 EkbYrb5ArrZd3wmrxFmhoKLwNB1uej6pFILVV+15PZgHO+zAbGS5naqpbQYf9RzwYRp7
 8b9CtLCxZ0mJGZzGT7VrRFdk5O6u7387mr2AbB1DJbWutY8xKQgEOxceyHipmyZoNZEK
 t94ADJnz439rzbry52Ma418jBJtVwMg1wr5+mkVSci6gD1zddEXf0MaG8LE6B0pTgE5Y
 /w0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3L4V7jrQTj2VAptBwGguXAPOCVzUlnPEm/E02vYLZxo=;
 b=ZbeNrTwIrMzYsIQsJq6g13e9LxIz7+Poi8U+PMCifOPqPzX9nFKwrlPknm9oT9jyGW
 URssHNJXXPE09inK8D3N2BKYq4P1WT6AW9s/NWUFeqmAdqUt6rngzokYFWnTbf9d+8rG
 1lqj5ja1ypVzyOZCj0HQcAlO1R3QcZ7WBnzdyIhAhIZnFl3vcPpkfFcfe8UmXpRkjeV7
 NIeRBkNvI0DNDnlQNLyRTv4dE3ej3ZddhIbrqqmhZM6BXOUmdf9Adqv4rs5HK0x9Q1T7
 by8HT1hYOAqvqdSXgt+yDHNptg3GfYXu6U9j+N7csqsnhHxBzC02Lq+DG73qcReuPhpg
 ZhTw==
X-Gm-Message-State: AOAM5300oZUf4L0gY4ntUj/d1Q3uJi3cm4OuNvUxOtDG31Qqkoz1c1vi
 Wu8gE2TrYhQvlZrrxcd6Rg/KvJUH/64LsA==
X-Google-Smtp-Source: ABdhPJwGhY0il1h/FD6eluSUWMhfRBBO0/jbgQjgAWaHRw20ItkuqrE6i63RnN9AUMa2PBbmmGpluA==
X-Received: by 2002:a17:902:d2c9:b0:13b:721d:f790 with SMTP id
 n9-20020a170902d2c900b0013b721df790mr1483804plc.11.1631741486557; 
 Wed, 15 Sep 2021 14:31:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q20sm837879pgu.31.2021.09.15.14.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:31:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/16] tcg/s390x: Implement TCG_TARGET_HAS_mul_vec
Date: Wed, 15 Sep 2021 14:31:09 -0700
Message-Id: <20210915213114.1923776-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915213114.1923776-1-richard.henderson@linaro.org>
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
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

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     | 2 +-
 tcg/s390x/tcg-target.c.inc | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index a42074e451..1c581a2f60 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -154,7 +154,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_shi_vec        0
 #define TCG_TARGET_HAS_shs_vec        0
 #define TCG_TARGET_HAS_shv_vec        0
-#define TCG_TARGET_HAS_mul_vec        0
+#define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
 #define TCG_TARGET_HAS_minmax_vec     0
 #define TCG_TARGET_HAS_bitsel_vec     0
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index fa4a142818..aa75d779be 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -277,6 +277,7 @@ typedef enum S390Opcode {
     VRRc_VCEQ   = 0xe7f8,   /* we leave the m5 cs field 0 */
     VRRc_VCH    = 0xe7fb,   /* " */
     VRRc_VCHL   = 0xe7f9,   /* " */
+    VRRc_VML    = 0xe7a2,
     VRRc_VN     = 0xe768,
     VRRc_VNC    = 0xe769,
     VRRc_VNO    = 0xe76b,
@@ -2696,6 +2697,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_andc_vec:
         tcg_out_insn(s, VRRc, VNC, a0, a1, a2, 0);
         break;
+    case INDEX_op_mul_vec:
+        tcg_out_insn(s, VRRc, VML, a0, a1, a2, vece);
+        break;
     case INDEX_op_or_vec:
         tcg_out_insn(s, VRRc, VO, a0, a1, a2, 0);
         break;
@@ -2745,6 +2749,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return 1;
     case INDEX_op_cmp_vec:
         return -1;
+    case INDEX_op_mul_vec:
+        return vece < MO_64;
     default:
         return 0;
     }
@@ -2981,6 +2987,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_orc_vec:
     case INDEX_op_xor_vec:
     case INDEX_op_cmp_vec:
+    case INDEX_op_mul_vec:
         return C_O1_I2(v, v, v);
 
     default:
-- 
2.25.1


