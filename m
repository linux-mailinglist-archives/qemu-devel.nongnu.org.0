Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED323337614
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:49:02 +0100 (CET)
Received: from localhost ([::1]:34164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMcX-00040R-Tw
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTw-00032I-J6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:08 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:36367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTu-0006Bh-LH
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:08 -0500
Received: by mail-qk1-x72f.google.com with SMTP id n79so20782517qke.3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6sBjD/Gklksw/pC9kJWfSGVfQExpOAv9Sf85vKHjqp4=;
 b=KUUVTIjErqZ5IMtgdbdq+s81Wp9hkUCyhtWHhaW8Zy/QB9ay7j/I9TX4S6ouGAmErg
 fzOwtgKFPtXM7sUCady0GQ1HCogDqNgI2lKyqfy/2qOqeqCiiTO/WuMjWTdSdRk4zUH+
 8CQkyTflUk/jkoAGqwmEFahQdhtuyry+7IFUSw/S+wLn2qLXAZqVYDJIA+yNst+84v5j
 uQFpuWfUBetATNn588cj9o5EZEoRbdv42aVf8iatS5faeHI2n/wmdibvhCMVs6b6ovAY
 /sEmdyTH1LIW7OLxC1iZoHDRXMhQqzBkX+u5n7v2F/zQhsZ8ZWvS+h35zjmT4kqU2uwn
 vXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6sBjD/Gklksw/pC9kJWfSGVfQExpOAv9Sf85vKHjqp4=;
 b=bxAn5EWeWv8gQNbtTtDDJETuhskR30axLuvomM/EZ99l1gMmMJFKfcfCc0XgsE8GjA
 6u9V42LkPbMl4ByqCI5wy22vO0gGwiNNLgYU3CYIPkP1hsBy2/W2IoRGv1Rsx3BoBMtC
 zyuCJETaxanXIR8zY9ChPztum8DOO361nKBWPQ59B8AqOyxA0OA5s38fGbuESQ/MFkQN
 GzftIl8KEKILT0kQp42Xm33cNz+WoYG58okRmLCJyImfhGqxX7CTQpCnht10ra8mSbpy
 P7H0jxA8D9nwX/iE/Gi+QNeEp8H0XVj5pAYnCxR7Wk8okgyG/jBIyvg//3QyhG2neOhH
 8Hww==
X-Gm-Message-State: AOAM5319MG/aBJXFV0lroStmFcsTHvX2itiRKm04nF3MAgcAjW8R/1Gz
 k9YAf35XuJFI2upwlqOlgr89E+sUiQh9UyJs
X-Google-Smtp-Source: ABdhPJzVo2FjY7XXZGL/rEZ4E2w635YUM6PMLA/zqyNNeIq0Z3Nb89ThbBX4kpCxbOzITcjGAm59tA==
X-Received: by 2002:a05:620a:133b:: with SMTP id
 p27mr8105211qkj.382.1615473605694; 
 Thu, 11 Mar 2021 06:40:05 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/57] tcg/tci: Split out tci_args_rr
Date: Thu, 11 Mar 2021 08:39:05 -0600
Message-Id: <20210311143958.562625-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 67 +++++++++++++++++++++++++------------------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 5acf5c38c3..e5aba3a9fa 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -184,6 +184,13 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   s = signed ldst offset
  */
 
+static void tci_args_rr(const uint8_t **tb_ptr,
+                        TCGReg *r0, TCGReg *r1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+}
+
 static void tci_args_rrs(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, int32_t *i2)
 {
@@ -422,9 +429,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         CASE_32_64(mov)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = regs[r1];
             break;
         case INDEX_op_tci_movi_i32:
             t0 = *tb_ptr++;
@@ -635,58 +641,50 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif /* TCG_TARGET_REG_BITS == 32 */
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
         CASE_32_64(ext8s)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int8_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (int8_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
         CASE_32_64(ext16s)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int16_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (int16_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext8u_i32 || TCG_TARGET_HAS_ext8u_i64
         CASE_32_64(ext8u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint8_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (uint8_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i32 || TCG_TARGET_HAS_ext16u_i64
         CASE_32_64(ext16u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint16_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (uint16_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_bswap16_i32 || TCG_TARGET_HAS_bswap16_i64
         CASE_32_64(bswap16)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap16(t1));
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = bswap16(regs[r1]);
             break;
 #endif
 #if TCG_TARGET_HAS_bswap32_i32 || TCG_TARGET_HAS_bswap32_i64
         CASE_32_64(bswap32)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap32(t1));
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = bswap32(regs[r1]);
             break;
 #endif
 #if TCG_TARGET_HAS_not_i32 || TCG_TARGET_HAS_not_i64
         CASE_32_64(not)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ~t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = ~regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i32 || TCG_TARGET_HAS_neg_i64
         CASE_32_64(neg)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, -t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = -regs[r1];
             break;
 #endif
 #if TCG_TARGET_REG_BITS == 64
@@ -799,21 +797,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_ext32s_i64:
         case INDEX_op_ext_i32_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int32_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (int32_t)regs[r1];
             break;
         case INDEX_op_ext32u_i64:
         case INDEX_op_extu_i32_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint32_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (uint32_t)regs[r1];
             break;
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap64(t1));
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = bswap64(regs[r1]);
             break;
 #endif
 #endif /* TCG_TARGET_REG_BITS == 64 */
-- 
2.25.1


