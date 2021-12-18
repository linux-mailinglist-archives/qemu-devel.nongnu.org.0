Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5967479C70
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:53:19 +0100 (CET)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfld-0000VC-HF
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:53:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbd-0000SH-4t
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:57 -0500
Received: from [2607:f8b0:4864:20::635] (port=46837
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbb-0003Rt-NA
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:56 -0500
Received: by mail-pl1-x635.google.com with SMTP id p18so4740603pld.13
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=S0JZ9ByDKVmFQ12ne9IM9idva919FSGMdL7rWL2jTDQ=;
 b=a3FSJF4b6TDSpmegrKdIj7mtTDwhnEXg9pFYZB8qffelpxW3vpkE6UeQYLsM5uVggN
 44/833DnlhZPwS7a/LZsSDUiROZr676ZgPSVbwDBRtCPrHa9ZOS+XpoJA9kaRb2Z5lUR
 GKjsgfza08bvkL7FZua8ngbA+5kBQUlRHJnpV+fQgQ3fmPdGomjhTmIWbA0HUVEms5Gu
 9xpymel1vttoX72ysB2ODB6pXrS4I94NDLFJsAhLdz7Ow6TdZcoT+PeL4GrZJKK5atki
 SzciohLmq2zsILnSGoEwspsNerigzWVaNkL1pCB7W2nwby4K7/kTZctQwSaRl2JufEnt
 d+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S0JZ9ByDKVmFQ12ne9IM9idva919FSGMdL7rWL2jTDQ=;
 b=vGOd54vK5yLK+dWQScMm3Tqxs5wEk3/QbptjkrgP3WDn3DhpfQYXczr3ip9TkRsope
 EEUH1Vhn3yIqe25CA786fjav8y+OTwlGusXbeTqlraeJIVFPOu7+Qoxjcmnk9sjVpj+l
 f5JMB/G7vhyD7/QoguKVFvS5F3TWIGBKJCb1qNJu+KaucOMZFM1UH7x9N6Hlx2eEZTDX
 yPXfNbZB5jN714+qvEdSkusQ17e4qitmlFl4eDGk10HGbr1BslvdIOybiUiEO8pRtQJ5
 rJ0PC0sE+XgHarVr8mFOc3BZCNFq1Xxt4OE9BELLBuCbMuHcI7eL3wp5uj8u1rcKjJRp
 qABg==
X-Gm-Message-State: AOAM53068yz6G+yN9nBZHfGfT865f+IaJvm0blnQ6U72ZjJIjlkY6nIz
 7cKs7loVvpM8YRk1xYxyRuoDOsQ+/15TOQ==
X-Google-Smtp-Source: ABdhPJy9D6fjJS+CnRV62tp8h/VMoTviwBdhmoM7oApErrnSNaYPahbL+rVjDBodc1NPWbKMRIqgeA==
X-Received: by 2002:a17:902:ed85:b0:148:adf6:cbe1 with SMTP id
 e5-20020a170902ed8500b00148adf6cbe1mr8995341plj.170.1639856574439; 
 Sat, 18 Dec 2021 11:42:54 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/20] tcg/s390x: Implement vector NAND, NOR, EQV
Date: Sat, 18 Dec 2021 11:42:34 -0800
Message-Id: <20211218194250.247633-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  6 +++---
 tcg/s390x/tcg-target.c.inc | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index ad29e62b16..fef227b0fe 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -145,9 +145,9 @@ extern uint64_t s390_facilities[3];
 
 #define TCG_TARGET_HAS_andc_vec       1
 #define TCG_TARGET_HAS_orc_vec        HAVE_FACILITY(VECTOR_ENH1)
-#define TCG_TARGET_HAS_nand_vec       0
-#define TCG_TARGET_HAS_nor_vec        0
-#define TCG_TARGET_HAS_eqv_vec        0
+#define TCG_TARGET_HAS_nand_vec       HAVE_FACILITY(VECTOR_ENH1)
+#define TCG_TARGET_HAS_nor_vec        1
+#define TCG_TARGET_HAS_eqv_vec        HAVE_FACILITY(VECTOR_ENH1)
 #define TCG_TARGET_HAS_not_vec        1
 #define TCG_TARGET_HAS_neg_vec        1
 #define TCG_TARGET_HAS_abs_vec        1
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 57e803e339..5a90b892cb 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -288,7 +288,9 @@ typedef enum S390Opcode {
     VRRc_VMXL   = 0xe7fd,
     VRRc_VN     = 0xe768,
     VRRc_VNC    = 0xe769,
+    VRRc_VNN    = 0xe76e,
     VRRc_VNO    = 0xe76b,
+    VRRc_VNX    = 0xe76c,
     VRRc_VO     = 0xe76a,
     VRRc_VOC    = 0xe76f,
     VRRc_VPKS   = 0xe797,   /* we leave the m5 cs field 0 */
@@ -2750,6 +2752,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_xor_vec:
         tcg_out_insn(s, VRRc, VX, a0, a1, a2, 0);
         break;
+    case INDEX_op_nand_vec:
+        tcg_out_insn(s, VRRc, VNN, a0, a1, a2, 0);
+        break;
+    case INDEX_op_nor_vec:
+        tcg_out_insn(s, VRRc, VNO, a0, a1, a2, 0);
+        break;
+    case INDEX_op_eqv_vec:
+        tcg_out_insn(s, VRRc, VNX, a0, a1, a2, 0);
+        break;
 
     case INDEX_op_shli_vec:
         tcg_out_insn(s, VRSa, VESL, a0, a2, TCG_REG_NONE, a1, vece);
@@ -2846,7 +2857,10 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_and_vec:
     case INDEX_op_andc_vec:
     case INDEX_op_bitsel_vec:
+    case INDEX_op_eqv_vec:
+    case INDEX_op_nand_vec:
     case INDEX_op_neg_vec:
+    case INDEX_op_nor_vec:
     case INDEX_op_not_vec:
     case INDEX_op_or_vec:
     case INDEX_op_orc_vec:
@@ -3191,6 +3205,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_or_vec:
     case INDEX_op_orc_vec:
     case INDEX_op_xor_vec:
+    case INDEX_op_nand_vec:
+    case INDEX_op_nor_vec:
+    case INDEX_op_eqv_vec:
     case INDEX_op_cmp_vec:
     case INDEX_op_mul_vec:
     case INDEX_op_rotlv_vec:
-- 
2.25.1


