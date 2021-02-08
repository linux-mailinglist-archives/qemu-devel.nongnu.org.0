Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D11312912
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:53:43 +0100 (CET)
Received: from localhost ([::1]:35970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wgH-0000lx-LW
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRN-0001RR-GW
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:17 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRL-0005n8-J7
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:17 -0500
Received: by mail-pf1-x42c.google.com with SMTP id d26so7523461pfn.5
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v8YBF7O/DOHSCTIsDFGzgG9s+eMvXezLyegZpBv+3f8=;
 b=kwSt+kSIEAVd/qpw2OwWcTB5GK85di23YNDvGoGbQnglhTOOkm9MPb1FuKoxLwD42Y
 /azfxI3Ol0uQk0sZNL2Y+o02mYkzfpUcGTAyemD2UUwOUhqg7t2sF8xWxAPiVcKIx2L+
 1ngD+l8UAC5nGgOyI8on7D/dLbsk3VXTlzytZjmOhA4Y8SBgo0o2ZJMherLVLcpZI9Sf
 c6yKAe7/EjDhhxECBmJ1xUR8lem9MdKftjF10DqVmvSp+2k8/sYgS/zRR73vcKcCLM63
 zMZS5jRmCd1XkbpB7wna16jcnHUVUo/MooLXvV6YSED61iQYPhQWyDKtWcz8FWf0exTH
 zSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v8YBF7O/DOHSCTIsDFGzgG9s+eMvXezLyegZpBv+3f8=;
 b=bfBWZKLT074ixRMvJPCmLc7GW3Lhdv5Jz03zp1ZK9UDvctVX8s3qzmdfYvBwexp4Uq
 h9ePFdiWLbpiD9fK+uMQp7V81m7xFOceNY1KiMtOoh2+GYz1W8kuyCszHtw8Z4YYDse+
 1mM8JCZ7t5wAuOjDcKECSMQ325Nz45wzqg8SMO6V2sZ6+kyIJBFhw1/d+kcZVKI4sh6u
 x8JhRiYpN/w4V9gCH009wPjYhmSDBSELnzKAqFkKlJJ7iNeRVJB9HZVQkgQ+wkHjUBsy
 K0YbpKfLf70RvkwaTYtVBt6KwTNMPQoVf/T1Ba8qTt5BMwC5xCRm5PesWd+w/Tuunwt1
 ahYQ==
X-Gm-Message-State: AOAM533smgZLJpK+IEF+bu7jzuxYe7JZfjxeSlqIeCP5KHLi8hIUMln7
 yvt7qe9tCgeWU7WnkZeX79f/HCd7A/921Q==
X-Google-Smtp-Source: ABdhPJyWOAIAsCg2M4Fg0AM6MbOdkIe7M/cD35j3spV7qB9bRG1qqCUl6wDFNjINnORVfBwo5kUPqg==
X-Received: by 2002:a63:fc1c:: with SMTP id j28mr5454718pgi.281.1612751893931; 
 Sun, 07 Feb 2021 18:38:13 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/70] tcg/tci: Merge mov, not and neg operations
Date: Sun,  7 Feb 2021 18:36:58 -0800
Message-Id: <20210208023752.270606-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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


