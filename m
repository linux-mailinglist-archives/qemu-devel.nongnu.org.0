Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2AC442C44
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:12:01 +0100 (CET)
Received: from localhost ([::1]:54596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrhw-0001fL-Mr
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW4-0007YG-PH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:44 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:39909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW3-0006rw-5c
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:44 -0400
Received: by mail-qt1-x829.google.com with SMTP id t40so18431844qtc.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c0LVKpqK5ZdwRcDR8+puDfp4OkQJywpu1yKfC81QITE=;
 b=jGy8ufsF9BlJqQg5ys9AI5hUcxHOZlITIFf3AeH1bU+N8OexQ654ptpdWe8L/niPlm
 c/Gf9rBQu0SYZ+iyraOYbTSnBAd0WU6AKEYuIXjUC9xzAKk9mcTeoImwRoE9dtGMz/fn
 nLUE865Vnx7Nl8Or34TWpT5D5FVPQaIHVOuTUNyeyx61xqp/UdoznJYTtneciB1lede6
 lHK93req04x/itHUPYqC4gpDTd7ynmpMKwEJFMBnd48zXDdgjJwAWMZXMocO+FG+XTjr
 S5N/RFfqMv0tGg3ao0rYKKe8LUXPQyWu8kRd067DJqgiDT+KBM4EUXZB2mr7/H41+Ti/
 L9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c0LVKpqK5ZdwRcDR8+puDfp4OkQJywpu1yKfC81QITE=;
 b=qkGt5Tb9vJqQJzfWhet8KRsLrNKeDa4AzbOKEv1aIZzcAqMLqjHKtyAqMSpDpvAw3R
 SbR1GBr/EszJBRVNasgZA76eCh+7Zf5k9yp5mQro9u8GtKLXmkSuiCJAM2XgzXLrEYAB
 st4tFXXXZoI8z1mxUl7AjIeagOac36SYa2o+32nmXuVG1Bj1UTbHLIDXnQRq5mMGiTzc
 25DFkBO6zeuqekQIqKNCCpHsPQckH3eYeQEXiE7VdE8zpTAAFdheoRPmVVSdeKIhf9cm
 v3NUDScMvG7joaXqZUsbhLIwOFnHwT2oPj9AIVByGOqPuyQYIHmvOBgD1wr0VMaXz0PD
 qvZw==
X-Gm-Message-State: AOAM533TnyPiQVPKI37jk5nzvwz/ZuNvlLEi0idgRk8sf8FTZ2kJ1The
 uVHtIVaCTR01d6Vez4hHGw1CRvejJ3+LVg==
X-Google-Smtp-Source: ABdhPJx5aCK0vIT0S2ce6ZHKmkCh1KdMr2aGpjTRCGyI6OYhOTe2nCrgZUv3XWXwMhRK0TVnA/EDJQ==
X-Received: by 2002:ac8:7d52:: with SMTP id h18mr20910290qtb.351.1635850782274; 
 Tue, 02 Nov 2021 03:59:42 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z26sm11789510qko.13.2021.11.02.03.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:59:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/12] target/arm: Use the constant variant of
 store_cpu_field() when possible
Date: Tue,  2 Nov 2021 06:59:31 -0400
Message-Id: <20211102105934.214596-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102105934.214596-1-richard.henderson@linaro.org>
References: <20211102105934.214596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When using a constant variable, we can replace the store_cpu_field()
call by store_cpu_field_constant() which avoid using TCG temporaries.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029231834.2476117-4-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 083a6d6ed7..52ba562c96 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -364,8 +364,7 @@ void clear_eci_state(DisasContext *s)
      * multiple insn executes.
      */
     if (s->eci) {
-        TCGv_i32 tmp = tcg_const_i32(0);
-        store_cpu_field(tmp, condexec_bits);
+        store_cpu_field_constant(0, condexec_bits);
         s->eci = 0;
     }
 }
@@ -740,9 +739,8 @@ void gen_set_condexec(DisasContext *s)
 {
     if (s->condexec_mask) {
         uint32_t val = (s->condexec_cond << 4) | (s->condexec_mask >> 1);
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_movi_i32(tmp, val);
-        store_cpu_field(tmp, condexec_bits);
+
+        store_cpu_field_constant(val, condexec_bits);
     }
 }
 
@@ -8362,8 +8360,6 @@ static bool trans_BL(DisasContext *s, arg_i *a)
 
 static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 {
-    TCGv_i32 tmp;
-
     /*
      * BLX <imm> would be useless on M-profile; the encoding space
      * is used for other insns from v8.1M onward, and UNDEFs before that.
@@ -8377,8 +8373,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
         return false;
     }
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
-    tmp = tcg_const_i32(!s->thumb);
-    store_cpu_field(tmp, thumb);
+    store_cpu_field_constant(!s->thumb, thumb);
     gen_jmp(s, (read_pc(s) & ~3) + a->imm);
     return true;
 }
@@ -8677,7 +8672,6 @@ static bool trans_LCTP(DisasContext *s, arg_LCTP *a)
      * doesn't cache branch information, all we need to do is reset
      * FPSCR.LTPSIZE to 4.
      */
-    TCGv_i32 ltpsize;
 
     if (!dc_isar_feature(aa32_lob, s) ||
         !dc_isar_feature(aa32_mve, s)) {
@@ -8688,8 +8682,7 @@ static bool trans_LCTP(DisasContext *s, arg_LCTP *a)
         return true;
     }
 
-    ltpsize = tcg_const_i32(4);
-    store_cpu_field(ltpsize, v7m.ltpsize);
+    store_cpu_field_constant(4, v7m.ltpsize);
     return true;
 }
 
@@ -9487,9 +9480,7 @@ static void arm_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
     /* Reset the conditional execution bits immediately. This avoids
        complications trying to do it at the end of the block.  */
     if (dc->condexec_mask || dc->condexec_cond) {
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_movi_i32(tmp, 0);
-        store_cpu_field(tmp, condexec_bits);
+        store_cpu_field_constant(0, condexec_bits);
     }
 }
 
-- 
2.25.1


