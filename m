Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C6047C49F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:04:52 +0100 (CET)
Received: from localhost ([::1]:47962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziZH-0001DU-GX
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:04:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIy-0000Qe-A0
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:00 -0500
Received: from [2607:f8b0:4864:20::529] (port=35548
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIs-0007dK-VX
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:00 -0500
Received: by mail-pg1-x529.google.com with SMTP id v25so7743992pge.2
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7lh8DkVyt2XOdj/tVSgnWpNqZRWhx88hWU6njdp9RQk=;
 b=Bg9306y+OdD6RGUuriQUnu6Z7IOJ0KEZWjsAeJjP8EJ4gjHl/Z7JS1F4XsZPE8Ga+d
 tG+6YP3Y6OUs0fCsEc/aobdpZJ1ZmdBpS1S3YxZHHYezh2kHDnrf40FNzLg2dwkNNSx6
 9Ud27XJhnbVdwTXJx6QzCyZyf+8AUhG6trLNYfwkhPwIaHs8g7g3EP4H73mnKV3wXO2n
 S+gjYs7AOemNAtBLp0ZBb7pDLjUqH9/g2ZBm81C5LOEDQVDJtKPkVixIJxZUpjNGHVzd
 Rw+fYO14OdI15JwcLEjlkyQHlgR6dl9YHL6BVo+nerCY9XWc4WsF3lWT8gVnxAPnAAZ9
 phVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7lh8DkVyt2XOdj/tVSgnWpNqZRWhx88hWU6njdp9RQk=;
 b=hUyDMr7kvQEODLfxwdFwEm2wnVuQDJbTNpssln0lmO5x8bqol6Sw1a9+ZXszuKPFmX
 PMtcItfPsdEGhRwlypZ7QeUdvL/oqLKLnkLrra1esyFXqdcmgJawVLim6aHw1p3FdQtr
 GgCPsqIl/IeXPrShsazJ+NyYbuArZTp4Wtz707jBpKKrr0CScFrKmjZ9qhRXpveqhyt+
 VTzWFE48LSZV7xGNucodvaKWhzQAh+kWIBt5B0yvEmhimSXPARrctstlLQSX8j84SgMB
 PgmcqlTsiuZYEwuYcmYFK+jRODH23pK/bfADK/aReOZeDBhhnWaAaiJ7rkRBHFbi0giw
 ewdg==
X-Gm-Message-State: AOAM531UBJ5WmGW0bwE9N7gRVMYVP9YE9K+SK0o5ZX4JsldbkPoj2JZ4
 ZOju3Kv+T6+GI81B2sRkUPO+qUJDIekezA==
X-Google-Smtp-Source: ABdhPJzYyhw6x4Wz8ugc9T68h6P8a2iM/iMyClQIg7Ch67BZvehQrYCFpor5W+ynVnexfbOMMOQAhg==
X-Received: by 2002:a63:491a:: with SMTP id w26mr511149pga.110.1640105273615; 
 Tue, 21 Dec 2021 08:47:53 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/31] tcg/loongarch64: Implement shl/shr/sar/rotl/rotr ops
Date: Tue, 21 Dec 2021 08:47:22 -0800
Message-Id: <20211221164737.1076007-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-17-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.h         |  4 +-
 tcg/loongarch64/tcg-target.c.inc     | 91 ++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 2975e03127..42f8e28741 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -17,6 +17,7 @@
 C_O0_I1(r)
 C_O1_I1(r, r)
 C_O1_I2(r, r, rC)
+C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rU)
 C_O1_I2(r, r, rW)
 C_O1_I2(r, 0, rZ)
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 2fd2745b63..d1ded50cb0 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -96,7 +96,7 @@ typedef enum {
 #define TCG_TARGET_HAS_div_i32          0
 #define TCG_TARGET_HAS_rem_i32          0
 #define TCG_TARGET_HAS_div2_i32         0
-#define TCG_TARGET_HAS_rot_i32          0
+#define TCG_TARGET_HAS_rot_i32          1
 #define TCG_TARGET_HAS_deposit_i32      1
 #define TCG_TARGET_HAS_extract_i32      1
 #define TCG_TARGET_HAS_sextract_i32     0
@@ -133,7 +133,7 @@ typedef enum {
 #define TCG_TARGET_HAS_div_i64          0
 #define TCG_TARGET_HAS_rem_i64          0
 #define TCG_TARGET_HAS_div2_i64         0
-#define TCG_TARGET_HAS_rot_i64          0
+#define TCG_TARGET_HAS_rot_i64          1
 #define TCG_TARGET_HAS_deposit_i64      1
 #define TCG_TARGET_HAS_extract_i64      1
 #define TCG_TARGET_HAS_sextract_i64     0
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 39df2885b5..2895769e68 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -608,6 +608,85 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_clzctz(s, OPC_CTZ_D, a0, a1, a2, c2, false);
         break;
 
+    case INDEX_op_shl_i32:
+        if (c2) {
+            tcg_out_opc_slli_w(s, a0, a1, a2 & 0x1f);
+        } else {
+            tcg_out_opc_sll_w(s, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_shl_i64:
+        if (c2) {
+            tcg_out_opc_slli_d(s, a0, a1, a2 & 0x3f);
+        } else {
+            tcg_out_opc_sll_d(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_shr_i32:
+        if (c2) {
+            tcg_out_opc_srli_w(s, a0, a1, a2 & 0x1f);
+        } else {
+            tcg_out_opc_srl_w(s, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_shr_i64:
+        if (c2) {
+            tcg_out_opc_srli_d(s, a0, a1, a2 & 0x3f);
+        } else {
+            tcg_out_opc_srl_d(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_sar_i32:
+        if (c2) {
+            tcg_out_opc_srai_w(s, a0, a1, a2 & 0x1f);
+        } else {
+            tcg_out_opc_sra_w(s, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_sar_i64:
+        if (c2) {
+            tcg_out_opc_srai_d(s, a0, a1, a2 & 0x3f);
+        } else {
+            tcg_out_opc_sra_d(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_rotl_i32:
+        /* transform into equivalent rotr/rotri */
+        if (c2) {
+            tcg_out_opc_rotri_w(s, a0, a1, (32 - a2) & 0x1f);
+        } else {
+            tcg_out_opc_sub_w(s, TCG_REG_TMP0, TCG_REG_ZERO, a2);
+            tcg_out_opc_rotr_w(s, a0, a1, TCG_REG_TMP0);
+        }
+        break;
+    case INDEX_op_rotl_i64:
+        /* transform into equivalent rotr/rotri */
+        if (c2) {
+            tcg_out_opc_rotri_d(s, a0, a1, (64 - a2) & 0x3f);
+        } else {
+            tcg_out_opc_sub_w(s, TCG_REG_TMP0, TCG_REG_ZERO, a2);
+            tcg_out_opc_rotr_d(s, a0, a1, TCG_REG_TMP0);
+        }
+        break;
+
+    case INDEX_op_rotr_i32:
+        if (c2) {
+            tcg_out_opc_rotri_w(s, a0, a1, a2 & 0x1f);
+        } else {
+            tcg_out_opc_rotr_w(s, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_rotr_i64:
+        if (c2) {
+            tcg_out_opc_rotri_d(s, a0, a1, a2 & 0x3f);
+        } else {
+            tcg_out_opc_rotr_d(s, a0, a1, a2);
+        }
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -657,6 +736,18 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
          */
         return C_O1_I2(r, r, rC);
 
+    case INDEX_op_shl_i32:
+    case INDEX_op_shl_i64:
+    case INDEX_op_shr_i32:
+    case INDEX_op_shr_i64:
+    case INDEX_op_sar_i32:
+    case INDEX_op_sar_i64:
+    case INDEX_op_rotl_i32:
+    case INDEX_op_rotl_i64:
+    case INDEX_op_rotr_i32:
+    case INDEX_op_rotr_i64:
+        return C_O1_I2(r, r, ri);
+
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
     case INDEX_op_nor_i32:
-- 
2.25.1


