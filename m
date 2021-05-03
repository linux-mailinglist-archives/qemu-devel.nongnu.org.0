Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B00C371FE9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:49:30 +0200 (CEST)
Received: from localhost ([::1]:56310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldddJ-0003k9-Nr
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQJ-0005pr-2X
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:36:04 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQA-0008IL-99
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:36:02 -0400
Received: by mail-pl1-x62f.google.com with SMTP id v13so3311794ple.9
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vNzJ8efgD30GIsKbrzz5c93oH3/8c8uS8ydCb4RBpRg=;
 b=xjUw6UQS17OGvyig0KJCTjIF+QIr5Yuup2nwSOhy7xnXzJq2R5WvsoPRSi03nSoPa7
 wGezfERxxM0MQNLxvqe3qycE0//5FHqN+b4XmUgCG4X8p7lwopy1VAKnp3JQeZ93OkZv
 ajxeC8XocZDmQ/qUXoEuCf+HWlfCJqFP7Yo3SWIOmxIyFa80yqmhUnHWADCP2eBUrsZV
 lWB4TPZAchKm+GDxqKkgpLAXq8AO5Vvkad8Q62sLfNBl1dDF+0LCHssqzmyjqBGEtYM9
 I0cgp3IFbzDtDbRt6KQ7sn7lmINp3kpxJtwNgTNDHKyUbP3n7giFtnt3M94csdwyETrh
 u3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vNzJ8efgD30GIsKbrzz5c93oH3/8c8uS8ydCb4RBpRg=;
 b=b0yXOvP3V0nyzW9BlLBrFjpMc7oefoj/9KqtvnJAK4fO85msS/iRg/fJ7Sg8hMrSMU
 DrYCBJnZwfOYbukrAGKdLrSj5mN8yS7zN5RCshBiJL4uFauiiGi8KbGCr1MpDWiEPlOH
 AYVqKuTfXsmGmF6ts84MooZILWVR6YYkSW7CAoiZqsGVWxMZ2IAVM/7UNgLVKvJ00OUK
 LjnRKzO4DgPmFsWq22BoQ6izr15h+NvdY5x2ptgSPt49tPqeBiPGLHYq7zQIYfOEjn8P
 aq4MSV4odFJN2Rz/7CbramSnnBVl8+MBkHYfL2KNiWwp2TZ5dnWODuUcYh+vOoGWHDPu
 AO7w==
X-Gm-Message-State: AOAM530kzQzQTM98mQu0p9gXq7ME4Ag5j7ehPwvyNzmBJM8BedFslBjR
 HK68ddOHDBOhQw/cXM+LQNjYjGe6xMDdPQ==
X-Google-Smtp-Source: ABdhPJxMFAbKyKYZFRuSsIRouT6PkVI3lhD7WNXF2LViCr7U41cKuuBk9kfBCoUKf9gjGoCk7aTxuA==
X-Received: by 2002:a17:902:4d:b029:ec:94df:c9aa with SMTP id
 71-20020a170902004db02900ec94dfc9aamr22086091pla.7.1620066952403; 
 Mon, 03 May 2021 11:35:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q27sm4251567pfl.41.2021.05.03.11.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 11:35:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/16] tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec
Date: Mon,  3 May 2021 11:35:40 -0700
Message-Id: <20210503183541.2014496-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503183541.2014496-1-richard.henderson@linaro.org>
References: <20210503183541.2014496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
 tcg/s390x/tcg-target-con-set.h |  1 +
 tcg/s390x/tcg-target.h         |  2 +-
 tcg/s390x/tcg-target.c.inc     | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 49b98f33b9..426dd92e51 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -26,6 +26,7 @@ C_O1_I2(r, r, ri)
 C_O1_I2(r, rZ, r)
 C_O1_I2(v, v, r)
 C_O1_I2(v, v, v)
+C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, r, 0)
 C_O1_I4(r, r, ri, rI, 0)
 C_O2_I2(b, a, 0, r)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index efa32f348c..127ccd30af 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -154,7 +154,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
 #define TCG_TARGET_HAS_minmax_vec     1
-#define TCG_TARGET_HAS_bitsel_vec     0
+#define TCG_TARGET_HAS_bitsel_vec     1
 #define TCG_TARGET_HAS_cmpsel_vec     0
 
 /* used for function call generation */
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index a6121c2f40..178b992b78 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -296,6 +296,7 @@ typedef enum S390Opcode {
     VRRa_VUPH   = 0xe7d7,
     VRRa_VUPL   = 0xe7d6,
     VRRc_VX     = 0xe76d,
+    VRRe_VSEL   = 0xe78d,
     VRRf_VLVGP  = 0xe762,
 
     VRSa_VERLL  = 0xe733,
@@ -635,6 +636,18 @@ static void tcg_out_insn_VRRc(TCGContext *s, S390Opcode op,
     tcg_out16(s, (op & 0x00ff) | RXB(v1, v2, v3, 0) | (m4 << 12));
 }
 
+static void tcg_out_insn_VRRe(TCGContext *s, S390Opcode op,
+                              TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
+{
+    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
+    tcg_debug_assert(v2 >= TCG_REG_V0 && v2 <= TCG_REG_V31);
+    tcg_debug_assert(v3 >= TCG_REG_V0 && v3 <= TCG_REG_V31);
+    tcg_debug_assert(v4 >= TCG_REG_V0 && v4 <= TCG_REG_V31);
+    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | (v2 & 15));
+    tcg_out16(s, v3 << 12);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, v2, v3, v4) | ((v4 & 15) << 12));
+}
+
 static void tcg_out_insn_VRRf(TCGContext *s, S390Opcode op,
                               TCGReg v1, TCGReg r2, TCGReg r3)
 {
@@ -2753,6 +2766,10 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, VRRc, VMXL, a0, a1, a2, vece);
         break;
 
+    case INDEX_op_bitsel_vec:
+        tcg_out_insn(s, VRRe, VSEL, a0, a1, a2, args[3]);
+        break;
+
     case INDEX_op_cmp_vec:
         switch ((TCGCond)args[3]) {
         case TCG_COND_EQ:
@@ -2793,6 +2810,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_add_vec:
     case INDEX_op_and_vec:
     case INDEX_op_andc_vec:
+    case INDEX_op_bitsel_vec:
     case INDEX_op_neg_vec:
     case INDEX_op_not_vec:
     case INDEX_op_or_vec:
@@ -3134,6 +3152,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shrs_vec:
     case INDEX_op_sars_vec:
         return C_O1_I2(v, v, r);
+    case INDEX_op_bitsel_vec:
+        return C_O1_I3(v, v, v, v);
 
     default:
         g_assert_not_reached();
-- 
2.25.1


