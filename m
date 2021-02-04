Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3246030EA06
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:16:53 +0100 (CET)
Received: from localhost ([::1]:57994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UCS-0006we-8k
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjH-0005Pg-2r
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:44 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tj3-0003xR-7i
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:39 -0500
Received: by mail-pf1-x42e.google.com with SMTP id m6so1088396pfk.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v8YBF7O/DOHSCTIsDFGzgG9s+eMvXezLyegZpBv+3f8=;
 b=qQZFErvEvSf3WKH4o5e+pLASjbWG6DDNiVUGxJ6/LOHzlX5RVfIjbODitvuERaU1+0
 GMETioNuVvTsb5nJoNepZx9N+AJsueL0LGH2f1kZnqkGfuUEOcLf1kysPVmAT/5P+GkD
 knK1H2fXssiikOHSbMfUPxkkKb4pZlJenC2iL9MZWb3uFxObDWqG7GfRvIW3SSd8oi5G
 1q+2PkXN0F656IfgV36vUuMaH/4KQiFYxH4KGSQ0HDPYv89HUNKQD+uqEgQpXs24xwlv
 ypdZqhnUap9ya+m5Au8as+mKWUmED9jqOcyvU/enIdBG2PDJbBArphYOglDw0WOHIIO/
 0SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v8YBF7O/DOHSCTIsDFGzgG9s+eMvXezLyegZpBv+3f8=;
 b=jPNXSgLPTHyE5I+0HnSWwhfIFw1omN37sU0ezkTRjHvMipANxTH81Sq599QOcIStvx
 IpxuMY8glyVEtuGEwG5s7ByDH+UMxA9Kp1IkeInR6Vzknu5zPRQ3XoopnDdZDqb1yRPN
 l/xfzgkew+a8vURFhJfO9HWdZ/1574svYqUb7U4SQXiw7MTSTMGr4GnTX3usfjm1M0Df
 dAvKiNga6lvSTpcq3ew5eSCth7VsQid8Doh8B+7KiUfcz+tObHdeNK6O+FYRxVek7XgT
 Q2pX9Uf40YRiAeAZkEnywXgPAlwglHyUuQ6uRadnL5B4Xk+EKkWK5DLT3/jeIw3pwny3
 BclQ==
X-Gm-Message-State: AOAM532EwvZ5bNE6ykerJhwAooM3nbQDG0lLs9yHWGooUM53z3CSSzKd
 JYAD3a7gksK3BKzotOFdkNNWQED6LJR7Ekym
X-Google-Smtp-Source: ABdhPJyvKKfqf7vpGD51jd3vvwBCVc6ahAXwpNVyPMaQciTQlkoK2qvQjTRP1GBe19ywcx4pdZQoGg==
X-Received: by 2002:aa7:848c:0:b029:1d0:68f1:d6f1 with SMTP id
 u12-20020aa7848c0000b02901d068f1d6f1mr5769502pfn.21.1612403187046; 
 Wed, 03 Feb 2021 17:46:27 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 41/93] tcg/tci: Merge mov, not and neg operations
Date: Wed,  3 Feb 2021 15:44:17 -1000
Message-Id: <20210204014509.882821-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index c979215332..225cb698e8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -404,7 +404,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
             break;
 #endif
-        case INDEX_op_mov_i32:
+        CASE_32_64(mov)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1);
@@ -666,26 +666,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, bswap32(t1));
             break;
 #endif
-#if TCG_TARGET_HAS_not_i32
-        case INDEX_op_not_i32:
+#if TCG_TARGET_HAS_not_i32 || TCG_TARGET_HAS_not_i64
+        CASE_32_64(not)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ~t1);
             break;
 #endif
-#if TCG_TARGET_HAS_neg_i32
-        case INDEX_op_neg_i32:
+#if TCG_TARGET_HAS_neg_i32 || TCG_TARGET_HAS_neg_i64
+        CASE_32_64(neg)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, -t1);
             break;
 #endif
 #if TCG_TARGET_REG_BITS == 64
-        case INDEX_op_mov_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
-            break;
         case INDEX_op_tci_movi_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_i64(&tb_ptr);
@@ -815,20 +810,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, bswap64(t1));
             break;
 #endif
-#if TCG_TARGET_HAS_not_i64
-        case INDEX_op_not_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ~t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_neg_i64
-        case INDEX_op_neg_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, -t1);
-            break;
-#endif
 #endif /* TCG_TARGET_REG_BITS == 64 */
 
             /* QEMU specific operations. */
-- 
2.25.1


