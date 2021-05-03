Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF1371FCD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:40:13 +0200 (CEST)
Received: from localhost ([::1]:34064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lddUL-0002an-0C
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQF-0005nu-Hw
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:36:00 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:43691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQ7-0008HD-HM
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:35:59 -0400
Received: by mail-pf1-x42e.google.com with SMTP id e15so4808137pfv.10
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bG59YqOiBpwUsIZ5wzYl9iQn3wU+Jjl9NF3KJfqc/dk=;
 b=kZGiv7BrhIhJFrwTYAzk3QP2wynYwUyK29DMSFjWcSy/+UaVnYojS7aRy0VbKdzGi7
 cKBl75pPx8VXRhXf/I73qiV6YIxAEb5zTO8mIWCc7++oRg7wtm96DPc4JGl+6apxQrA0
 w2tdyXl/WVSzXO5hAxhHtDPbz5aevqgy7m3JY771N5/sP6ib9aycl5EN6+bLhDXg1X5L
 n25fbKGXHSWhLlaHpc6CCBAeMjTZxZZwiNosq5PeRvamKtKh1o/pX3/cmf0gS8s4RTEP
 OSXqf8YHXZ6aHxBplIHs54xi6lcH+g51WIR3i6Nx+MCccCj1njUdyFh+G8zzJ4SBkfgj
 3s7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bG59YqOiBpwUsIZ5wzYl9iQn3wU+Jjl9NF3KJfqc/dk=;
 b=ndT49eLgnEhej8B60Fc2b6dCm5EcWpDjib8fPutGknHjxuachCx0QydIZxV1FuGSJ+
 PsOEi3JCsr/WAyr0DBQTGBFKMZxU28N5/IquyRvQ3ZVAuSvlcMoOfPS4NVa6UtRQXj3R
 JUmjsZiC6QKypMQv4Ue9VtIBxIcez8ZHfis/OllkPYch3TZrGX6GZ0ouh5Ua8GF0ww9R
 6A/g28OEkCXQeUroT3P1Go4cQ2e/HjyctIkfW6AF6NJdBaICKYBiNXtLH/neaAstl2ez
 Fao+uDLdU4MY1ibu/l+qTAkoPCqdu7qi2OyrC4+f6P8w/blrgqy2tZChkyBBl7UOnn6M
 3Q3g==
X-Gm-Message-State: AOAM531ejKwUW/8d3sOqjRI9+mHJ4OUiDNb3zsjwdybCnPyr3I3IEELc
 AwDC9ro7fzAZSA/qzqyzW3okZHosKNZKtA==
X-Google-Smtp-Source: ABdhPJz9o2J5f/LCLYiPdyDUnzgKA2E2sQVW/siGQgyOJjXdZvXLbT6ow5+pmnMGxzDCYFSW/UsaQw==
X-Received: by 2002:a05:6a00:882:b029:24b:afda:acfa with SMTP id
 q2-20020a056a000882b029024bafdaacfamr20033160pfj.72.1620066949155; 
 Mon, 03 May 2021 11:35:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q27sm4251567pfl.41.2021.05.03.11.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 11:35:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/16] tcg/s390x: Implement TCG_TARGET_HAS_mul_vec
Date: Mon,  3 May 2021 11:35:35 -0700
Message-Id: <20210503183541.2014496-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503183541.2014496-1-richard.henderson@linaro.org>
References: <20210503183541.2014496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
 tcg/s390x/tcg-target.h     | 2 +-
 tcg/s390x/tcg-target.c.inc | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index dd11972ed2..13b9918276 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -151,7 +151,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_shi_vec        0
 #define TCG_TARGET_HAS_shs_vec        0
 #define TCG_TARGET_HAS_shv_vec        0
-#define TCG_TARGET_HAS_mul_vec        0
+#define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
 #define TCG_TARGET_HAS_minmax_vec     0
 #define TCG_TARGET_HAS_bitsel_vec     0
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index aca2dc358c..9edb9a48c7 100644
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
@@ -2662,6 +2663,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_andc_vec:
         tcg_out_insn(s, VRRc, VNC, a0, a1, a2, 0);
         break;
+    case INDEX_op_mul_vec:
+        tcg_out_insn(s, VRRc, VML, a0, a1, a2, vece);
+        break;
     case INDEX_op_or_vec:
         tcg_out_insn(s, VRRc, VO, a0, a1, a2, 0);
         break;
@@ -2711,6 +2715,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return 1;
     case INDEX_op_cmp_vec:
         return -1;
+    case INDEX_op_mul_vec:
+        return vece < MO_64;
     default:
         return 0;
     }
@@ -2947,6 +2953,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_orc_vec:
     case INDEX_op_xor_vec:
     case INDEX_op_cmp_vec:
+    case INDEX_op_mul_vec:
         return C_O1_I2(v, v, v);
 
     default:
-- 
2.25.1


