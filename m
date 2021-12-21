Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7272147C44A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:58:22 +0100 (CET)
Received: from localhost ([::1]:58916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziSz-00069d-HG
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:58:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIu-0000EP-Uu
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:56 -0500
Received: from [2607:f8b0:4864:20::52e] (port=38654
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIr-0007ct-17
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:56 -0500
Received: by mail-pg1-x52e.google.com with SMTP id y9so12829083pgj.5
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cHpfaLVydfnDFFFHb5r43nae1+7GWHTxLwo4cKt6VDc=;
 b=pXKNKqfZjsDQ+6yOh6nvQ0YaCZMGFCD3yJMRbDKJtfogwvOYeB4j0YgzL1ofrOc++5
 AZIW7LDUZJfIzDyGgQ8Mhtm+ZfMSXriiWJySrlFcNKelkvidcWTU3VJSqVauWzLhLZZp
 f1CBL8gWMloQ8nY0GVmE2SqYJz0io1oo8kOicnj627B/33cBGog/lsAEQ65GbHBwO6UN
 JUaxN784UfykO5eojhI31JlCFn8S/9Naw0j7uDyFS6mop7tEIUbWlip5LN5jl/6q8i+3
 w4VGi31MadTkcLemLxLx362j+Vv/WTxluSNaZiMGII7MY0YUGGoLkzGFe5mOMD2SRZD3
 ESFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cHpfaLVydfnDFFFHb5r43nae1+7GWHTxLwo4cKt6VDc=;
 b=jSGB9QW1seWRo7SOzXkj7ysdxCoResEKjeKouAhCmIU+SKI0hrf3txziP341dXrV/p
 HhhcL99Oetx21X+5phwMO1NB+77Yc+qHlCXy3xbQ09n5LZFjsvNU8IJZir7dEJJNQwB/
 10evDIFkTO13T501HJ+eSYlr6UdiCoFBr402PW3wvuNoKPKmIsqc8W+duZwQ3FYvajvK
 3UyQDadd96d2YBe7Q1KoXMe0FIeAJ00mNVgjgFisUDik9vSF7czE4OJi/xuCwgase9k8
 BdYZ05b+6byKi4hDF5GyepInYdt7/09npb6oxc8b/oEHJX+kYSNuuqyjTaHsQambhcvg
 CSdQ==
X-Gm-Message-State: AOAM533s0Bb4TtN4eZ2uB2jT7GtCZjsNx7KeFEv1Adfl241JVbV3/ssb
 CV4ROclAuMF4+r9ye7x4Nm4Hn/104EhaAg==
X-Google-Smtp-Source: ABdhPJzP9MlS5xEtu8PdCLulaHR1/CJgmrtyo4g7ivk8xUPLIz3LNkkvDuyRU5FrjbFpgqci0zpiMg==
X-Received: by 2002:a63:5250:: with SMTP id s16mr3741012pgl.202.1640105271789; 
 Tue, 21 Dec 2021 08:47:51 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/31] tcg/loongarch64: Implement bswap{16,32,64} ops
Date: Tue, 21 Dec 2021 08:47:20 -0800
Message-Id: <20211221164737.1076007-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Message-Id: <20211221054105.178795-15-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.h     | 10 +++++-----
 tcg/loongarch64/tcg-target.c.inc | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 1c9d0a9988..5303001653 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -111,8 +111,8 @@ typedef enum {
 #define TCG_TARGET_HAS_ext16s_i32       1
 #define TCG_TARGET_HAS_ext8u_i32        1
 #define TCG_TARGET_HAS_ext16u_i32       1
-#define TCG_TARGET_HAS_bswap16_i32      0
-#define TCG_TARGET_HAS_bswap32_i32      0
+#define TCG_TARGET_HAS_bswap16_i32      1
+#define TCG_TARGET_HAS_bswap32_i32      1
 #define TCG_TARGET_HAS_not_i32          1
 #define TCG_TARGET_HAS_neg_i32          0
 #define TCG_TARGET_HAS_andc_i32         1
@@ -146,9 +146,9 @@ typedef enum {
 #define TCG_TARGET_HAS_ext8u_i64        1
 #define TCG_TARGET_HAS_ext16u_i64       1
 #define TCG_TARGET_HAS_ext32u_i64       1
-#define TCG_TARGET_HAS_bswap16_i64      0
-#define TCG_TARGET_HAS_bswap32_i64      0
-#define TCG_TARGET_HAS_bswap64_i64      0
+#define TCG_TARGET_HAS_bswap16_i64      1
+#define TCG_TARGET_HAS_bswap32_i64      1
+#define TCG_TARGET_HAS_bswap64_i64      1
 #define TCG_TARGET_HAS_not_i64          1
 #define TCG_TARGET_HAS_neg_i64          0
 #define TCG_TARGET_HAS_andc_i64         1
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 9eba8f8146..3b056dd358 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -545,6 +545,33 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_bstrins_d(s, a0, a2, args[3], args[3] + args[4] - 1);
         break;
 
+    case INDEX_op_bswap16_i32:
+    case INDEX_op_bswap16_i64:
+        tcg_out_opc_revb_2h(s, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tcg_out_ext16s(s, a0, a0);
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            tcg_out_ext16u(s, a0, a0);
+        }
+        break;
+
+    case INDEX_op_bswap32_i32:
+        /* All 32-bit values are computed sign-extended in the register.  */
+        a2 = TCG_BSWAP_OS;
+        /* fallthrough */
+    case INDEX_op_bswap32_i64:
+        tcg_out_opc_revb_2w(s, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tcg_out_ext32s(s, a0, a0);
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            tcg_out_ext32u(s, a0, a0);
+        }
+        break;
+
+    case INDEX_op_bswap64_i64:
+        tcg_out_opc_revb_d(s, a0, a1);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -576,6 +603,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_not_i64:
     case INDEX_op_extract_i32:
     case INDEX_op_extract_i64:
+    case INDEX_op_bswap16_i32:
+    case INDEX_op_bswap16_i64:
+    case INDEX_op_bswap32_i32:
+    case INDEX_op_bswap32_i64:
+    case INDEX_op_bswap64_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_andc_i32:
-- 
2.25.1


