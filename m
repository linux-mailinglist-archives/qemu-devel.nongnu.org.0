Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AEE32FD9A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:46:02 +0100 (CET)
Received: from localhost ([::1]:56618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIekL-0005UP-4L
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebH-000793-8P
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:39 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebF-0002z4-E7
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:38 -0500
Received: by mail-pl1-x62e.google.com with SMTP id d11so3096268plo.8
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rDTef7VWE7fxk2i0+V52DytmGBNiPfjpzsN2oBg9LYg=;
 b=wrTToI++D6HA53K6iBpU+sNuwARZQLQhkrLscFO7A30mHXtVIW5vpCDpUeNcFFYGw5
 4JSe+i7PewtfuzG50PcAsDfZt6usyrTD+NG8kPCXzTmNTLCjwznSnU7+zPL7fcxXrSVs
 DxZLxBzR5NydOtTes/aHuXoZtNCog1owPvTyTXSmoB5FElOR9TmcOW6QtsCIASNjIl99
 1UJTGhif97O7GOF1HMZDQhEqsVvHGC66BS4aERaeYRceQLEIykj9keW90PC55bMycSjU
 VVDmUtZqf7JxgtqgLx7fS6oLUPrHPckUEH60je5ZDETO81iRQKHRnGBVuEroh6CL7BQN
 FEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDTef7VWE7fxk2i0+V52DytmGBNiPfjpzsN2oBg9LYg=;
 b=q52KQU3+eqiE6ddHG5KSws6eevTE4wqcdlx68A3qwKsvmQqlYzkr+ffjFNCku1rwHl
 nFgvVklD1UkWA0fFd6W1JUzS65lhRAvT/ZU8+PcYUGLwlNbkW5RKpKAmA9oii8k+OZNw
 xNUyURR0XvA/sOz40poRkLjXqwogvYp2Oz1MfE4FKWsyTvzM4iq532jjsh/Ax9whh+TI
 Jiu5Mj1w0MZV6+iG3Gt0swD89GDFQcN8UN3tc80d4zHcOiinNcespp9W6okvTgMQe3qw
 tfbqXyqwytbdwjVQbtmmpPpm1JP5wnswCaNXrvvcZ3d4BSCZ+9ZaaQGdSG/BIL7A94v7
 8bMQ==
X-Gm-Message-State: AOAM532eYhbRoodm7TQcFO0VxPiP8KOwJW7iOtKGZylzXMCPWV9oLY0g
 IgkYsfCBF0s2b4tb3pmAIG2CteBA6oe3xg==
X-Google-Smtp-Source: ABdhPJxM4pmGtVVJH27orFK55leP1P3t+BHY98gMsDBv3uonN8StedwbpY5PXLg9YMXwLbR5lJISgg==
X-Received: by 2002:a17:902:6944:b029:e6:190d:56cd with SMTP id
 k4-20020a1709026944b02900e6190d56cdmr41659plt.53.1615066595083; 
 Sat, 06 Mar 2021 13:36:35 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/27] tcg/tci: Merge extension operations
Date: Sat,  6 Mar 2021 13:36:06 -0800
Message-Id: <20210306213613.85168-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes ext8s, ext8u, ext16s, ext16u.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 44 ++++++++------------------------------------
 1 file changed, 8 insertions(+), 36 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index d0bf810781..73f639d23a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -607,29 +607,29 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg64(regs, t1, t0, (uint32_t)t2 * tmp64);
             break;
 #endif /* TCG_TARGET_REG_BITS == 32 */
-#if TCG_TARGET_HAS_ext8s_i32
-        case INDEX_op_ext8s_i32:
+#if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
+        CASE_32_64(ext8s)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int8_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext16s_i32
-        case INDEX_op_ext16s_i32:
+#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
+        CASE_32_64(ext16s)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext8u_i32
-        case INDEX_op_ext8u_i32:
+#if TCG_TARGET_HAS_ext8u_i32 || TCG_TARGET_HAS_ext8u_i64
+        CASE_32_64(ext8u)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext16u_i32
-        case INDEX_op_ext16u_i32:
+#if TCG_TARGET_HAS_ext16u_i32 || TCG_TARGET_HAS_ext16u_i64
+        CASE_32_64(ext16u)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint16_t)t1);
@@ -779,34 +779,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 continue;
             }
             break;
-#if TCG_TARGET_HAS_ext8u_i64
-        case INDEX_op_ext8u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint8_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext8s_i64
-        case INDEX_op_ext8s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int8_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext16s_i64
-        case INDEX_op_ext16s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int16_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext16u_i64
-        case INDEX_op_ext16u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint16_t)t1);
-            break;
-#endif
 #if TCG_TARGET_HAS_ext32s_i64
         case INDEX_op_ext32s_i64:
 #endif
-- 
2.25.1


