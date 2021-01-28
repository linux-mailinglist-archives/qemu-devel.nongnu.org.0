Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B31930719C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:39:06 +0100 (CET)
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52pV-0004Y2-Nd
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:39:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52b8-0006NA-M5
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:14 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52b5-0005np-Ic
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:14 -0500
Received: by mail-pg1-x52c.google.com with SMTP id i7so3791579pgc.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xJrZEGVQR1/tg7o98CXOJgjBnTA9yUqVpyK8VFJm0nw=;
 b=St/YIEY64oz16NQj+W+1F1ozUtMerKJxAo7Wv0b41VnWCxXja7/FnDall2Nu2nSauy
 jfEWTPPLvxnzELaJwSizrgSnB6jr1ZnL3l9Z2yoHbVml+g9PYuFx/i0uS8xgjZzYbEPe
 5zsH6+4NbYG8K6YiZsybzXuIGnvvkiOFbu9NlsQnQBbQafemWWxvMsRevEseNR8AL6zD
 w3Q+vzxYFXxx3/VjQ1o+fbSTdlFn1fpjWfmYUBckq03nPdGkXy22wF/IY0uUOy0n1LKL
 S1fZDJ1Inik/IrwV56kKGQ3R3B3gQu9YmWzHcvUUPnm17wb88oHofjkgXq3pTZdxX5tu
 NB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xJrZEGVQR1/tg7o98CXOJgjBnTA9yUqVpyK8VFJm0nw=;
 b=LKWtFI1PszM5vs1e6PDpGgDLYkJSYhptkY0sGTWNeZ8JFbN0Y0Q7PtSSMzER/lXoXZ
 f5mRZJvfC1nDi4KrTZKOMCuqcdqmlit7jwy7YMxxeWEll2JqOZJQWaPN08oRkrCzLd8e
 JiUTKQXXoxL6gy94fH2HIPjL/PKz8BnyFB/Gx69igLB709L8dOaK0ITCaYVQ/pxstrhJ
 VehH2MPzbLZFJdhfyqvImBfhrfALWsC83/mdzC77ZsBpEZwVIL8zJilY2DrM9+vxaRqo
 Q64pwBEA7b3cZ/1dyYJCtZ2tzZMMncwnkAWXaS3Z1VBC35FGSBZgQxbDLMB742CnPSk+
 rKrg==
X-Gm-Message-State: AOAM531UM+2go4ztrMns6kj12o1tO0UkGJ5m2lNJytduOsChlXym9rP1
 Bfk0K+EYGHtIqtxMluZl9grF1fmIsinJ6TqP
X-Google-Smtp-Source: ABdhPJzWWvfvCLrI902nqtTdFPrHyEcnaRKN39JFEp8luQo2vzC3an9oqQp1mG2ZujfOJSKLw/jjYA==
X-Received: by 2002:aa7:8497:0:b029:1bf:47c6:523a with SMTP id
 u23-20020aa784970000b02901bf47c6523amr15004245pfn.0.1611822249897; 
 Thu, 28 Jan 2021 00:24:09 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:24:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/23] tcg/tci: Implement 64-bit division
Date: Wed, 27 Jan 2021 22:23:30 -1000
Message-Id: <20210128082331.196801-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivially implemented like other arithmetic.
Tested via check-tcg and the ppc64 target.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  4 ++--
 tcg/tci.c                | 28 ++++++++++++++++++++++------
 tcg/tci/tcg-target.c.inc | 12 ++++--------
 3 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index bb784e018e..7fc349a3de 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -100,8 +100,8 @@
 #define TCG_TARGET_HAS_extract_i64      0
 #define TCG_TARGET_HAS_sextract_i64     0
 #define TCG_TARGET_HAS_extract2_i64     0
-#define TCG_TARGET_HAS_div_i64          0
-#define TCG_TARGET_HAS_rem_i64          0
+#define TCG_TARGET_HAS_div_i64          1
+#define TCG_TARGET_HAS_rem_i64          1
 #define TCG_TARGET_HAS_ext8s_i64        1
 #define TCG_TARGET_HAS_ext16s_i64       1
 #define TCG_TARGET_HAS_ext32s_i64       1
diff --git a/tcg/tci.c b/tcg/tci.c
index 32931ea611..0065c854a4 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -889,14 +889,30 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_ri64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
-#if TCG_TARGET_HAS_div_i64
         case INDEX_op_div_i64:
-        case INDEX_op_divu_i64:
-        case INDEX_op_rem_i64:
-        case INDEX_op_remu_i64:
-            TODO();
+            t0 = *tb_ptr++;
+            t1 = tci_read_ri64(regs, &tb_ptr);
+            t2 = tci_read_ri64(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int64_t)t1 / (int64_t)t2);
+            break;
+        case INDEX_op_divu_i64:
+            t0 = *tb_ptr++;
+            t1 = tci_read_ri64(regs, &tb_ptr);
+            t2 = tci_read_ri64(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint64_t)t1 / (uint64_t)t2);
+            break;
+        case INDEX_op_rem_i64:
+            t0 = *tb_ptr++;
+            t1 = tci_read_ri64(regs, &tb_ptr);
+            t2 = tci_read_ri64(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int64_t)t1 % (int64_t)t2);
+            break;
+        case INDEX_op_remu_i64:
+            t0 = *tb_ptr++;
+            t1 = tci_read_ri64(regs, &tb_ptr);
+            t2 = tci_read_ri64(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint64_t)t1 % (uint64_t)t2);
             break;
-#endif
         case INDEX_op_and_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 842807ff2e..8c0e77a0be 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -146,12 +146,10 @@ static const TCGTargetOpDef tcg_target_op_defs[] = {
     { INDEX_op_add_i64, { R, RI, RI } },
     { INDEX_op_sub_i64, { R, RI, RI } },
     { INDEX_op_mul_i64, { R, RI, RI } },
-#if TCG_TARGET_HAS_div_i64
     { INDEX_op_div_i64, { R, R, R } },
     { INDEX_op_divu_i64, { R, R, R } },
     { INDEX_op_rem_i64, { R, R, R } },
     { INDEX_op_remu_i64, { R, R, R } },
-#endif
     { INDEX_op_and_i64, { R, RI, RI } },
 #if TCG_TARGET_HAS_andc_i64
     { INDEX_op_andc_i64, { R, RI, RI } },
@@ -678,6 +676,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_sar_i64:
     case INDEX_op_rotl_i64:     /* Optional (TCG_TARGET_HAS_rot_i64). */
     case INDEX_op_rotr_i64:     /* Optional (TCG_TARGET_HAS_rot_i64). */
+    case INDEX_op_div_i64:      /* Optional (TCG_TARGET_HAS_div_i64). */
+    case INDEX_op_divu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). */
+    case INDEX_op_rem_i64:      /* Optional (TCG_TARGET_HAS_div_i64). */
+    case INDEX_op_remu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). */
         tcg_out_r(s, args[0]);
         tcg_out_ri64(s, const_args[1], args[1]);
         tcg_out_ri64(s, const_args[2], args[2]);
@@ -691,12 +693,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_debug_assert(args[4] <= UINT8_MAX);
         tcg_out8(s, args[4]);
         break;
-    case INDEX_op_div_i64:      /* Optional (TCG_TARGET_HAS_div_i64). */
-    case INDEX_op_divu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). */
-    case INDEX_op_rem_i64:      /* Optional (TCG_TARGET_HAS_div_i64). */
-    case INDEX_op_remu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). */
-        TODO();
-        break;
     case INDEX_op_brcond_i64:
         tcg_out_r(s, args[0]);
         tcg_out_ri64(s, const_args[1], args[1]);
-- 
2.25.1


