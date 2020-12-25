Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA52E2C5B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:30:44 +0100 (CET)
Received: from localhost ([::1]:51936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kstjY-0005F3-01
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:30:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZM-00035L-Ql
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:12 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZL-0005CX-5k
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:12 -0500
Received: by mail-pj1-x1030.google.com with SMTP id iq13so2679065pjb.3
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X08V9XmvMW+KNLUQAibo13Y4Y2jKTgkyyKKTZwdBNxA=;
 b=BmfzOR+vHexEsrwLPO4Cji95ScJRTgd7WLNuMaQRiHzTa//lVM9SKVUCAhQoAbe+U7
 hFZKXuhRDseXOJepwS+WPwMGW/dOAV1LMgrUC3Pq3SmhIX4DR6SS/d0vENPyv+9A6adG
 UNmXfZPN8yB1R8HYYrBX8ELISu8/jAPrt+u52pzeYcLxt1BUPkJT08/8TXS45H4Y1nBo
 t846cRoG+7IFm99hGMWqT4jXeF+PB3tFrUiEoQi0d8DhLzST4zmjyg59/kFAR9kp2N7d
 uw/012L6OO62qDxa1tPpaDoBSNZ2XluME1pV53/cOCFKKATDgC7iHc3Kc4TUivAUsc/D
 iGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X08V9XmvMW+KNLUQAibo13Y4Y2jKTgkyyKKTZwdBNxA=;
 b=p1t6qZWmo3yEPoo0fuFi5MwCnq2+YA4+nvSoHkFTZ1LSb/z2qAmxqBdGQ360unKjt7
 wVu42BSZ/ATMX+twICOEhTe3n0riMesQT63Clwic/YS0dufhJQ4o+kPYvRHeSXzbArwy
 9QPVrpY+IXg0qQA4/2ksVoVnmgDWoEoprkLG7+55e/WIr+RaZFX2AXOA5AzrQNavc4ug
 ZEeNXGWdrHLLlh2FOjGt2fHs5OYJ7IuKVZ8NfYtIUjq8/DOzBEhg/PTKUuWN+WhPklDZ
 /fg8tUPXEUa9xcHzSZSAdBslNY45AsuRInle4NsbFc/fTHBk9M4prESLkjN666TvfGRt
 l4NQ==
X-Gm-Message-State: AOAM533Q9errGZ9Z6edM4eRSCswJ0L3KImciXZ7+SjTVOyXx47mmtga/
 yBX4Uu4RuXTjX8RGsrXCgzQMMLfH2Dz4qw==
X-Google-Smtp-Source: ABdhPJycSKlI/SSqt47qesd2EyFa5x0ZL7kV6X4tU0U7jiHuJKcxqnveuFaPJnuUqtzTuSVAL2KwQg==
X-Received: by 2002:a17:90a:7e88:: with SMTP id
 j8mr9875480pjl.217.1608927609588; 
 Fri, 25 Dec 2020 12:20:09 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.20.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:20:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/16] tcg/s390x: Implement TCG_TARGET_HAS_mul_vec
Date: Fri, 25 Dec 2020 12:19:50 -0800
Message-Id: <20201225201956.692861-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225201956.692861-1-richard.henderson@linaro.org>
References: <20201225201956.692861-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
 tcg/s390x/tcg-target.h     | 2 +-
 tcg/s390x/tcg-target.c.inc | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index f4a1de931a..3f0be23323 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -150,7 +150,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_shi_vec        0
 #define TCG_TARGET_HAS_shs_vec        0
 #define TCG_TARGET_HAS_shv_vec        0
-#define TCG_TARGET_HAS_mul_vec        0
+#define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
 #define TCG_TARGET_HAS_minmax_vec     0
 #define TCG_TARGET_HAS_bitsel_vec     0
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 6c16ae0fcf..c5c17adc0c 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -262,6 +262,7 @@ typedef enum S390Opcode {
     VRRc_VCEQ   = 0xe7f8,   /* we leave the m5 cs field 0 */
     VRRc_VCH    = 0xe7fb,   /* " */
     VRRc_VCHL   = 0xe7f9,   /* " */
+    VRRc_VML    = 0xe7a2,
     VRRc_VN     = 0xe768,
     VRRc_VNC    = 0xe769,
     VRRc_VNO    = 0xe76b,
@@ -2657,6 +2658,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_andc_vec:
         tcg_out_insn(s, VRRc, VNC, a0, a1, a2, 0);
         break;
+    case INDEX_op_mul_vec:
+        tcg_out_insn(s, VRRc, VML, a0, a1, a2, vece);
+        break;
     case INDEX_op_or_vec:
         tcg_out_insn(s, VRRc, VO, a0, a1, a2, 0);
         break;
@@ -2706,6 +2710,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return 1;
     case INDEX_op_cmp_vec:
         return -1;
+    case INDEX_op_mul_vec:
+        return vece < MO_64;
     default:
         return 0;
     }
@@ -2942,6 +2948,7 @@ static int tcg_target_op_def(TCGOpcode op)
     case INDEX_op_orc_vec:
     case INDEX_op_xor_vec:
     case INDEX_op_cmp_vec:
+    case INDEX_op_mul_vec:
         return C_O1_I2(v, v, v);
 
     default:
-- 
2.25.1


