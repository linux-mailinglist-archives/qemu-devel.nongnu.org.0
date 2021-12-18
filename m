Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A5D479C6B
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:50:40 +0100 (CET)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfj5-0004YD-5u
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:50:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbi-0000ii-5Y
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:02 -0500
Received: from [2607:f8b0:4864:20::1034] (port=36764
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbg-0003Tl-Is
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:01 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so8927913pja.1
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=k1PmKhdxec5NltYpxawSaqCtC9T1nkGzqXVscI3MHeI=;
 b=xXx6a4fOnYGb5Lz51tADCrt+LDCUA2Mn2XN10LRN8kPGS1MZemQ+l0n9l2zFkrG6Vj
 4c2/4lwXqXWuo2XZTZS06AUnJXiRSXxSs0a8TIC/Lv3en+Isnk0xHmIHvk1J13WwQKq7
 TytLwE0zr05vghf7CY7J9Ko3O9ILK6wjqp+76OEq49S09gsMb25jBo6UhJaeU/GamVqE
 imRqSgEGPxkvCQdk9BZlZLQDCfs/FLwGtYAbUDLWinPzGc9rxW4KHwRxANzuDYQ5yZIy
 q3tEmEunltjhuZsrYiigEDsj4Qx3hFDnhfGLXhApQInOy2UBnPah7w4c6J4HWftU0jmo
 2P5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k1PmKhdxec5NltYpxawSaqCtC9T1nkGzqXVscI3MHeI=;
 b=iEaKmVBMs1P5bYu6UE9WLVuoe8TEbxffwqeI2IF4sajh4L20Ke1FM0eWxGO96sY4vS
 mG1tQS+zh5wqeL1BBYuZovh0XNp2e6RDozms5eWpvS2GsgDi4UmQJBskT1l9ZF+30jiE
 nciont4LrOw8yK8dqvYwB2igjxdH2/yiyDx3wIKwLdBOYjH4PrfCn0eJL5kekATobAtf
 qNMVBd18ffU91rxEoOS5YSg6af0kHYsRyWvI+Lu81y8uAYg4LxWgipqKhQqrTM+FzLuf
 gs2gk8KXS/Z7u+4yxzZ3TZSc4j7C6ZPdR9BaswMrKsF+UI8Xw5QVGPP/7SKLkKqyK0Wy
 DuBg==
X-Gm-Message-State: AOAM530WCMi9KEdsd+a4upkIx57SAx4bJYAANVZ/l8FnQPS4sx8D2KvN
 1lY/xW4wiTRCXSRyk6PG57UtOZCohKHnWg==
X-Google-Smtp-Source: ABdhPJy+5ZniaFobziCJf8pTLr42Ap/qlw38ybpAGzJGGjNl0EHcKjQwjxpT9fNmdi81kAF3asZmtQ==
X-Received: by 2002:a17:90a:9291:: with SMTP id
 n17mr10850981pjo.219.1639856579337; 
 Sat, 18 Dec 2021 11:42:59 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/20] tcg/i386: Implement avx512 variable rotate
Date: Sat, 18 Dec 2021 11:42:42 -0800
Message-Id: <20211218194250.247633-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

AVX512VL has VPROLVQ and VPRORVQ.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |  2 +-
 tcg/i386/tcg-target.c.inc | 25 ++++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 38c09fd66c..841b1febab 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -197,7 +197,7 @@ extern bool have_movbe;
 #define TCG_TARGET_HAS_abs_vec          1
 #define TCG_TARGET_HAS_roti_vec         have_avx512vl
 #define TCG_TARGET_HAS_rots_vec         0
-#define TCG_TARGET_HAS_rotv_vec         0
+#define TCG_TARGET_HAS_rotv_vec         have_avx512vl
 #define TCG_TARGET_HAS_shi_vec          1
 #define TCG_TARGET_HAS_shs_vec          1
 #define TCG_TARGET_HAS_shv_vec          have_avx2
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 5ab7c4c0fa..7fd6edb887 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -419,6 +419,10 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPBROADCASTQ (0x59 | P_EXT38 | P_DATA16)
 #define OPC_VPERMQ      (0x00 | P_EXT3A | P_DATA16 | P_VEXW)
 #define OPC_VPERM2I128  (0x46 | P_EXT3A | P_DATA16 | P_VEXL)
+#define OPC_VPROLVD     (0x15 | P_EXT38 | P_DATA16 | P_EVEX)
+#define OPC_VPROLVQ     (0x15 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPRORVD     (0x14 | P_EXT38 | P_DATA16 | P_EVEX)
+#define OPC_VPRORVQ     (0x14 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSLLVW     (0x12 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSLLVD     (0x47 | P_EXT38 | P_DATA16)
 #define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_VEXW)
@@ -2746,6 +2750,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     static int const umax_insn[4] = {
         OPC_PMAXUB, OPC_PMAXUW, OPC_PMAXUD, OPC_UD2
     };
+    static int const rotlv_insn[4] = {
+        OPC_UD2, OPC_UD2, OPC_VPROLVD, OPC_VPROLVQ
+    };
+    static int const rotrv_insn[4] = {
+        OPC_UD2, OPC_UD2, OPC_VPRORVD, OPC_VPRORVQ
+    };
     static int const shlv_insn[4] = {
         OPC_UD2, OPC_VPSLLVW, OPC_VPSLLVD, OPC_VPSLLVQ
     };
@@ -2829,6 +2839,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sarv_vec:
         insn = sarv_insn[vece];
         goto gen_simd;
+    case INDEX_op_rotlv_vec:
+        insn = rotlv_insn[vece];
+        goto gen_simd;
+    case INDEX_op_rotrv_vec:
+        insn = rotrv_insn[vece];
+        goto gen_simd;
     case INDEX_op_shls_vec:
         insn = shls_insn[vece];
         goto gen_simd;
@@ -3181,6 +3197,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
+    case INDEX_op_rotlv_vec:
+    case INDEX_op_rotrv_vec:
     case INDEX_op_shls_vec:
     case INDEX_op_shrs_vec:
     case INDEX_op_sars_vec:
@@ -3293,7 +3311,12 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return 0;
     case INDEX_op_rotlv_vec:
     case INDEX_op_rotrv_vec:
-        return have_avx2 && vece >= MO_32 ? -1 : 0;
+        switch (vece) {
+        case MO_32:
+        case MO_64:
+            return have_avx512vl ? 1 : have_avx2 ? -1 : 0;
+        }
+        return 0;
 
     case INDEX_op_mul_vec:
         if (vece == MO_8) {
-- 
2.25.1


