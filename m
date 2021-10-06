Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0114241B2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:45:26 +0200 (CEST)
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY96j-0002QF-KL
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8jB-0002hV-IB
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:21:06 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8io-0007sT-Vm
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:21:05 -0400
Received: by mail-pf1-x42d.google.com with SMTP id s16so2702917pfk.0
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rbtcEb8mlQvQus8bNdjwHjiWP119WKMM5P6E48gohk4=;
 b=iKLYE1O0wARsjD710O8tcscC9QzQ7uwehGYC2rTdrq3ggt8RJQOjIcMIShVOjTDIq2
 2d+Hj/c36sug87G/uL2IIjHd855s4eHL61KMo2Hv1CPz7q76WmYNy1z7rv401GyrhIig
 qY8kZ6cOknxNcpCR1nCXqHTCLwFudfPv8kEyNX8lRt02F7iNMDfYpR+yGy5VHDHVqcDx
 6D50q3OozDJpuxC1OZnONgFpJTMu3v8nnqYKSbbacjxcTWj+CNNmAQ3BHq/8W8GEL66O
 8UO2G3qgLBaF8dOB74c1Q/uYpckHnZEC6QcdI0ruK4DpUudGZPX8mYBw7wlzNxQuNu90
 HMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rbtcEb8mlQvQus8bNdjwHjiWP119WKMM5P6E48gohk4=;
 b=r2IJggsYVN+fwpARrOz9GpPDZtDxzhkMREun0fiCQNHcuV4kj0KoLJmX/lJB2u189X
 lC2+STqNlkzTTjOacKuqJc8DNDfpKq9Oe6SfIYyl3HGTF7MbI1y66Ef1z0sae+XzhE/B
 vBd0vPjs44x5GB2/AhH6Ya1uN94obSs/Yb32Ougoqq8M9fAQjkpP5yU9rQBKEStkvwbw
 BOfoMr3OUp20s3MvTk3Iu7SemXf/upPObG0m/E6DwHu9SneRMvwPmy8cWJe7xnuYliQ8
 hStO2Y7or4ZpHb8r65BGO5rHQecfjTzbgdyY91UbFsyuM65F6avM55XORuE1s0hynKYL
 SHIQ==
X-Gm-Message-State: AOAM5312UEcWUsBDs+yTit6N2i81EKvXRo78IYJDTZJboF+5TXgu1aTZ
 KwVjlyp2EQ3/UYBD5ZmY0EfswXM0hPMjTQ==
X-Google-Smtp-Source: ABdhPJwq9m2GI4jsFoq/Ye5W/3kpU5I52fdrMtNEWLN2nKkcYkpuLWJGf/NSfataAA8/xUGvEbn8Nw==
X-Received: by 2002:a63:950f:: with SMTP id p15mr20897963pgd.265.1633533636490; 
 Wed, 06 Oct 2021 08:20:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/28] tcg/s390x: Implement TCG_TARGET_HAS_mul_vec
Date: Wed,  6 Oct 2021 08:20:09 -0700
Message-Id: <20211006152014.741026-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>
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
index cbad88271a..85178c93d3 100644
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


