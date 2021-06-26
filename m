Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CBD3B4CC2
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:09:47 +0200 (CEST)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx0Ze-0007Bm-9A
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TN-0006uL-A2
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:17 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TL-0008GM-6V
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:16 -0400
Received: by mail-pg1-x52e.google.com with SMTP id e33so9997784pgm.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Es5BtYJvhqewprYdclINQtXx7YeJnyuEDH0/5n/RZtA=;
 b=iyG4QPHltHZTQkiXN/OJTj3hEQA+55gKZGKTKUkrZwxCA18NvwNGoonRRoE5bbLXPj
 5B0IOYCUqqbHLt90GHmECPW52LE2+Vt5sK5oYvFXdii1jQGKP6h7usuU4INEDrKa+EyC
 pFfK/K6xQjBsHwpvjbSZHbA7PUma/ZtJkMx0O2ns+6oFWsAZF3gcJmvvw7nJh1HevmSO
 yhKPF4OVbOTX0rq6MqaQ6WDHQHIagElBmA82itiSaB0PiD/3lUXwxLLy9b6MjD5f4GiP
 PJWHLmpLk6I+DqvvAlwZ0sff5mPgceBdKDOwIk8tqVEonhZDbtQ7cDEKnd/xIxL35kv7
 1uPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Es5BtYJvhqewprYdclINQtXx7YeJnyuEDH0/5n/RZtA=;
 b=MoGItzmQjvkfAKLRXBXshzwF31++Dkk9b48eEymM1rvldtxY3SrPx6rHT13qFDRujl
 gbkslsDZNBocebdYW0RthmfBDgrGRGPalEErre+SYheru6/8Q/I580Erfb8DzvptKdbz
 BBUJfRUaOvfK6DePBxHCZysIU7sbLjnCVvo2xk08yPplRjTX8tV3/5qFzeuHIzZQZyH9
 GT9hyc1PfbzxBTubk3ZPCPNoo/Za602v3P264DMAUrnqTb8Ebt5owm2F1K6582xqa5vl
 H9Un+MOksraLek13moie4XWtQqwljvY46heP64KALB4Q6Zq7xryDZ0Hxy4L2M4SnG9nB
 dHrg==
X-Gm-Message-State: AOAM530QLFdvTUFUSv8/9LWxQG0cWe9ne13K5NDVtNQp3t5HsI6rRAnK
 puP308d/qY4r6kvYcA65j2deGye5p+sorg==
X-Google-Smtp-Source: ABdhPJzjsICGRt5HjUhegGFEIkFoR5CEAWbzYpZt5KG6mqpzxUjzfW28pyQT3lyjoGCXwaVcK8SPQQ==
X-Received: by 2002:aa7:8d86:0:b029:2ec:82d2:5805 with SMTP id
 i6-20020aa78d860000b02902ec82d25805mr14027763pfr.11.1624683793928; 
 Fri, 25 Jun 2021 22:03:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c62sm7389768pfa.12.2021.06.25.22.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 22:03:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/16] tcg/s390x: Implement TCG_TARGET_HAS_mul_vec
Date: Fri, 25 Jun 2021 22:03:01 -0700
Message-Id: <20210626050307.2408505-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626050307.2408505-1-richard.henderson@linaro.org>
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
 tcg/s390x/tcg-target.h     | 2 +-
 tcg/s390x/tcg-target.c.inc | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index a3d4b5111f..cb14a011c7 100644
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
index 040690abe2..c142279bb8 100644
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
@@ -2664,6 +2665,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_andc_vec:
         tcg_out_insn(s, VRRc, VNC, a0, a1, a2, 0);
         break;
+    case INDEX_op_mul_vec:
+        tcg_out_insn(s, VRRc, VML, a0, a1, a2, vece);
+        break;
     case INDEX_op_or_vec:
         tcg_out_insn(s, VRRc, VO, a0, a1, a2, 0);
         break;
@@ -2713,6 +2717,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return 1;
     case INDEX_op_cmp_vec:
         return -1;
+    case INDEX_op_mul_vec:
+        return vece < MO_64;
     default:
         return 0;
     }
@@ -2949,6 +2955,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_orc_vec:
     case INDEX_op_xor_vec:
     case INDEX_op_cmp_vec:
+    case INDEX_op_mul_vec:
         return C_O1_I2(v, v, v);
 
     default:
-- 
2.25.1


