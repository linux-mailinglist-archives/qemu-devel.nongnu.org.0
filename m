Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A70C31E071
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:33:48 +0100 (CET)
Received: from localhost ([::1]:44300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTW7-0001Nn-2e
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLI-0007u0-4p
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:36 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLG-0007H0-K9
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:35 -0500
Received: by mail-pg1-x52b.google.com with SMTP id t11so9205589pgu.8
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nlAJBrBE2gOeL/pHL/++6ehY/SIfIXhi3tsdcdL4xk0=;
 b=cmbFUgyf1gJvU0VjWWrP6Of9Z7yDzW38d3BLHSN5nPLOyxtXhW1zEZyxtFgpOkJebS
 NNmJvaUUZgkQJCLw8JlNoImOr3viELb5wn/c1jY81i/+jFUwk2G39aSddn+2ov+hHEUH
 ILJdwFsZ2nsz8vSTMTFgmaqae5uXxY9zRzT7EngHsziiQUSdMziHgzS2GW55aPWOX4SL
 CtmWCJKcJbvrv7koD98Ogqy3O1Xf4TuaRcHWvgptFWoGeDTbQMRqJP155edTZiBoawNn
 guG3g9soZwYJ4DvNvLZaEbOeURWg6RDRosEyt1VWrExf4Avrd0Ph4EkMNOsz9lJkWezf
 jQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nlAJBrBE2gOeL/pHL/++6ehY/SIfIXhi3tsdcdL4xk0=;
 b=at1qrW4dbeJFmR13ViOF7w+5Rg/A1APXaDxdB4VtqwklPC0dCVvUYjlx2A1EwLzuEv
 3pRX2uMM6cICizXZHGVlGf0K12K6lRorxKLjQfvcxa5vfDH8vjy2ynPETnkAUmAZOlFn
 LWtE/RIXLlvW3j8zcyYKevpwtyn3Vey/Zyc4furoLLWIX6UQerNx3PYh+9m+kl6Lkjmg
 eJR+dePpGprEqqAMj3vLQE0TDG6dZfhZAWHfmHnvaKdLfQoZrHXL1sEGJFafcznldfYr
 Nk6A6/RvtLzYn4CFMooG9P9lZXklDWpsyEWQVqWFWhV87vgzEk+ipmn76DER7Cz6duED
 FZ/A==
X-Gm-Message-State: AOAM533ZKf7rU8L+jlHKjgbTKZ5uY5/L8oXyW7GJJsS77kJ2b/ScIuWd
 9ELhTHXKY/Ymg+rU6BCUNrMKFX/9pwzc2A==
X-Google-Smtp-Source: ABdhPJws838HTaUOF2MtJOR7Tuva6vJmrzBfi8GCbZN2JK+es+8Iy3inbDfX+ZYdApkzKrmjRCuSvA==
X-Received: by 2002:a63:f955:: with SMTP id q21mr975494pgk.274.1613593353457; 
 Wed, 17 Feb 2021 12:22:33 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/71] tcg/tci: Merge mov, not and neg operations
Date: Wed, 17 Feb 2021 12:19:41 -0800
Message-Id: <20210217202036.1724901-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
 tcg/tci.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 288a70287e..6a0bdf028b 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -387,7 +387,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
             break;
 #endif
-        case INDEX_op_mov_i32:
+        CASE_32_64(mov)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1);
@@ -649,26 +649,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -798,20 +793,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


