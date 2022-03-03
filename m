Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B84A4CC7A8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:12:07 +0100 (CET)
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsk2-0001Zk-GP
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:12:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYH-0005Si-TB
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:57 -0500
Received: from [2607:f8b0:4864:20::42e] (port=42978
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYG-00043L-CB
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:57 -0500
Received: by mail-pf1-x42e.google.com with SMTP id a5so5785989pfv.9
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iz3qFqZ6syttnMIonSrIWrfGNkbxAI11UgZmBPXKCFo=;
 b=Gdx+4k1JY98lKYzFkNjiuBtdwtPoNBd9q9nGj8DmCaCz4M0Bb/7Iy6K8JK4X9c0ZzH
 Ly5BW6XubrDpWKEm3bg7kFUoJtjdlRbB6J9GZkSPgmY0666BI16/akGZ6wBWjF20JgTh
 3WJNVHkaywfnpB7Jqql18nLrLT0iRjK8HN3JbWrBr/rfZoRAltGYq8hSp/bvoTXwug3o
 c6Y9OELtk3xJVVCsiViNh15bhy7kCrn6KnaqKDNyIUkHbu3vaITAqX8BM7/yFMwpOuB2
 9TFCsOc/i9y4wF02RMHgSYdDtTJhciECnKWyI9gx5bzr3AxiS/1qBpScb37fCkZDda9S
 tvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iz3qFqZ6syttnMIonSrIWrfGNkbxAI11UgZmBPXKCFo=;
 b=WsXomDVs0M7ODtvGv5Znpv2/w/jtGrlbHuVSnAYkPjDYxw33IP0OrBx9UvnKeZv0xM
 TaZs9YeubRmC4xoSMKcfevUZSaJGnydqf+tI5h0Ct7ub3xWppApHNT7RvW4r9lFsuimj
 p3OPG1U4CTXbcNF/DYSIEWPw9IOXmmDVZwGIu3H3HejIu0E88MWossvk77T4KOr/vf0d
 3HKhCu5L+P7wJQLmDVPRjc6ZMTtymR8ZXbksAmJTtNTABlO6nDQRlDMDfoNTnVW5ujmy
 Hoe1FaHGrZDGZ3s7o1QYdYpGV67ee3vOwzKWDDYsg3+vkDR/x6AlFoIQ/MJ2wAxwhyab
 UZFw==
X-Gm-Message-State: AOAM533TElqDz6tRuOfJwjnsgZ3mJhTSCOzjQ9ejXXnE3F4XQbCoWOyx
 IwjRLbHe8Kr4xPYigPNLE5whMkX3J3iQVA==
X-Google-Smtp-Source: ABdhPJy44xZp16O2+iYX3KbFfQ/m2iwcFO/8rR1qideluRrK5cvZqsUn0sAy0R0slKhvXO1feTOhbg==
X-Received: by 2002:a05:6a00:1795:b0:4e1:6e1f:5aed with SMTP id
 s21-20020a056a00179500b004e16e1f5aedmr39799685pfg.70.1646341195050; 
 Thu, 03 Mar 2022 12:59:55 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.12.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:59:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/30] tcg/s390x: Implement vector NAND, NOR, EQV
Date: Thu,  3 Mar 2022 10:59:19 -1000
Message-Id: <20220303205944.469445-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  6 +++---
 tcg/s390x/tcg-target.c.inc | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 94ccb179b8..23e2063667 100644
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
index d56c1e51e4..6e65828c09 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -290,7 +290,9 @@ typedef enum S390Opcode {
     VRRc_VMXL   = 0xe7fd,
     VRRc_VN     = 0xe768,
     VRRc_VNC    = 0xe769,
+    VRRc_VNN    = 0xe76e,
     VRRc_VNO    = 0xe76b,
+    VRRc_VNX    = 0xe76c,
     VRRc_VO     = 0xe76a,
     VRRc_VOC    = 0xe76f,
     VRRc_VPKS   = 0xe797,   /* we leave the m5 cs field 0 */
@@ -2805,6 +2807,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2901,7 +2912,10 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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
@@ -3246,6 +3260,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


