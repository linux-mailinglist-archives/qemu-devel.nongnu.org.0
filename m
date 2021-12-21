Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C67747C449
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:58:17 +0100 (CET)
Received: from localhost ([::1]:58668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziSu-0005yA-52
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:58:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIw-0000KR-Ad
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:58 -0500
Received: from [2607:f8b0:4864:20::534] (port=37441
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIr-0007cp-4p
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:58 -0500
Received: by mail-pg1-x534.google.com with SMTP id a23so12831773pgm.4
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vbBqX8145SzL5fir9xbqnpl78evPfhWM7yUrolGINac=;
 b=BTFqde6fmni3EdnA2Chh4wkAGej+CRmKKM4rxXiAuT6Pf0lyboEWChpxOyBATZ95b2
 U5/SCOVqlLrDdCv4/wLdzL2g1t2qiXuXgPkcx73MBO9iBb58dxXxIqE34S45E+iXOICP
 VeHaAQv3WgshguhuFhItzd0HhDMd5pPCfatjrUZujunrygPUDFuO0I0d98yaU3n1n/E2
 iaI03jhpmG80BrbkOfyWoGYGT56acFs4trSGvCbfKrkNHE2wbBoqz8EbLeQ6ptVEiLmU
 wdDBbyKB8I1TLxiFeN4csXBSWMb+5i9ihRxnT+LiRDp8jR2K5cG+FLvk4nlnkN06FHyO
 Po/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vbBqX8145SzL5fir9xbqnpl78evPfhWM7yUrolGINac=;
 b=umU6I8kQn4h2k1jhocKtUULA8uzxIFfoG98yBkypT3Ip+jFwq1DrD1lM7yqRr8qJeI
 eXGdcjjZAORwucnoG5qZyeLrkwQd+I+fVMKXz6rh2ueyHCRZkyhLdjJUQjSU5lqE8fDr
 2wSv002EdBs5YXOQ1vb/Uqc3hr2Jyu8wwUYcJwUjcIkQa3ICXZy5euBMeIqjH3QXy1G9
 waIheewIgzh0p20bHsuInp5aYty/lfgpuRZ+TDZL69CVxF7Zm53sCugyzfqDikMDfZqL
 Ql57L+CpdBl5cbpKRTnGwlpecDYNT8HRN0xfpVtIbFrpDt/oDl6AiUJlBznusIkrHxPf
 nmZA==
X-Gm-Message-State: AOAM531KA+wYCe5AIes21ct2TK27p9ZMXL5/3KqU+jyOqudKzv/tkUi5
 EMTnIuDio0pvj7zQ/3IxSBYa/Y76nD5w8g==
X-Google-Smtp-Source: ABdhPJxkaz7o2QPue3iGbGx9tiAFuQJCAy/sq8DME3QSr79ZWDWCMNxkS3hoJqdbvsA2+3/YhCZMQA==
X-Received: by 2002:a05:6a00:114d:b0:4a2:87bd:37f with SMTP id
 b13-20020a056a00114d00b004a287bd037fmr4167375pfm.82.1640105270805; 
 Tue, 21 Dec 2021 08:47:50 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/31] tcg/loongarch64: Implement deposit/extract ops
Date: Tue, 21 Dec 2021 08:47:19 -0800
Message-Id: <20211221164737.1076007-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Message-Id: <20211221054105.178795-14-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.h         |  8 ++++----
 tcg/loongarch64/tcg-target.c.inc     | 21 +++++++++++++++++++++
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 9ac24b8ad0..d958183020 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -18,3 +18,4 @@ C_O0_I1(r)
 C_O1_I1(r, r)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, rU)
+C_O1_I2(r, 0, rZ)
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index cc9aecc681..1c9d0a9988 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -97,8 +97,8 @@ typedef enum {
 #define TCG_TARGET_HAS_rem_i32          0
 #define TCG_TARGET_HAS_div2_i32         0
 #define TCG_TARGET_HAS_rot_i32          0
-#define TCG_TARGET_HAS_deposit_i32      0
-#define TCG_TARGET_HAS_extract_i32      0
+#define TCG_TARGET_HAS_deposit_i32      1
+#define TCG_TARGET_HAS_extract_i32      1
 #define TCG_TARGET_HAS_sextract_i32     0
 #define TCG_TARGET_HAS_extract2_i32     0
 #define TCG_TARGET_HAS_add2_i32         0
@@ -134,8 +134,8 @@ typedef enum {
 #define TCG_TARGET_HAS_rem_i64          0
 #define TCG_TARGET_HAS_div2_i64         0
 #define TCG_TARGET_HAS_rot_i64          0
-#define TCG_TARGET_HAS_deposit_i64      0
-#define TCG_TARGET_HAS_extract_i64      0
+#define TCG_TARGET_HAS_deposit_i64      1
+#define TCG_TARGET_HAS_extract_i64      1
 #define TCG_TARGET_HAS_sextract_i64     0
 #define TCG_TARGET_HAS_extract2_i64     0
 #define TCG_TARGET_HAS_extrl_i64_i32    1
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d9508d5295..9eba8f8146 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -531,6 +531,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_extract_i32:
+        tcg_out_opc_bstrpick_w(s, a0, a1, a2, a2 + args[3] - 1);
+        break;
+    case INDEX_op_extract_i64:
+        tcg_out_opc_bstrpick_d(s, a0, a1, a2, a2 + args[3] - 1);
+        break;
+
+    case INDEX_op_deposit_i32:
+        tcg_out_opc_bstrins_w(s, a0, a2, args[3], args[3] + args[4] - 1);
+        break;
+    case INDEX_op_deposit_i64:
+        tcg_out_opc_bstrins_d(s, a0, a2, args[3], args[3] + args[4] - 1);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -560,6 +574,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ext_i32_i64:
     case INDEX_op_not_i32:
     case INDEX_op_not_i64:
+    case INDEX_op_extract_i32:
+    case INDEX_op_extract_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_andc_i32:
@@ -584,6 +600,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         /* LoongArch reg-imm bitops have their imms ZERO-extended */
         return C_O1_I2(r, r, rU);
 
+    case INDEX_op_deposit_i32:
+    case INDEX_op_deposit_i64:
+        /* Must deposit into the same register as input */
+        return C_O1_I2(r, 0, rZ);
+
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


