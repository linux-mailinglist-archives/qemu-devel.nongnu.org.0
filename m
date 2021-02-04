Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08F230EA07
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:16:57 +0100 (CET)
Received: from localhost ([::1]:58460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UCX-000786-12
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjH-0005Pi-2v
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:44 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:46780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tj1-0003xI-J1
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:40 -0500
Received: by mail-pf1-x430.google.com with SMTP id f63so1047502pfa.13
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KcXtBKnullZQYp/0sBEeRm33/576gXQq0HPnlvclX78=;
 b=Z6iAJ/16muHmobNDvO6b/Z6Mv/iocvZZlRJMSCA1sgU5FO4RvtR2hegIDCYEewbFu8
 aWnqNeX+WJFbLMCs4794znfXOtFBE0LgmOLv+YMpsblT3zFrC5Gw7sYVyx6DGSFuCljf
 I/7JJG8inEH2SeEbHwKHRR/4pGdquNgdV+Xa0Ggn64akzRnt7gMyFgH7hBXrDaM6sQgm
 +qfwmi7UqqmKjH/ofV91+FLiMAYMvSMH62cr9eJSCQwkC1ZUwEyQMgRlX0w15TI9NkkS
 mgSr2Zg5/6XuDsjQBQgtbTv08ElqIF2jlsZZsBAsHSKRxFf/doWVZCH2WI10PJOz8eHt
 pCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KcXtBKnullZQYp/0sBEeRm33/576gXQq0HPnlvclX78=;
 b=jb5VjqulXcxrGjHw2s/4P/R1Hr/St+o/7NP/ffW5eqT/2AOuDjpFBYB/N4hjEKThtb
 zbV5PXe030cIahrj8RtqXjvmpEAdKdC0clrYhmOfWSGjsLqw1R9u3VWvawJjS+5bBHVH
 84A9iYRQhNdx/zXwMn73fNxF+BQxf88ax8BxRjUF/IMb53xs/HO7OSLVhVVRDBG1jNUw
 69xs0/sTj4TBiD3KcW7MolFGclHGkZ/dF4ZWJ4zq5S3P8rGmrE2B3P+La/6xScjS0oUV
 6j/TP1LABuyUnZjLbZjg3FF+i0djvyCQ/MmM28hCUAGsUae+TalGD24xLBTUrESn3wQj
 kRAg==
X-Gm-Message-State: AOAM532NBp5rA6Sm05pk/M4Ondg5gTH/kPAWZk6GQA/uirvOqNZtbpUQ
 8vIhRJ/u4qIjEXXu+naZHAdKBRnNsskIP32v
X-Google-Smtp-Source: ABdhPJzMfvtH9kJnMH7R0FHeyWfXBcgH20soRASzSlAl6ByVyRIupz9uFogG0ErJkcbDp84LUQj2oA==
X-Received: by 2002:a62:115:0:b029:1b4:c593:acd4 with SMTP id
 21-20020a6201150000b02901b4c593acd4mr5771094pfb.2.1612403185497; 
 Wed, 03 Feb 2021 17:46:25 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 40/93] tcg/tci: Merge bswap operations
Date: Wed,  3 Feb 2021 15:44:16 -1000
Message-Id: <20210204014509.882821-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This includes bswap16 and bswap32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 1819652c5a..c979215332 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -652,15 +652,15 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, (uint16_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_bswap16_i32
-        case INDEX_op_bswap16_i32:
+#if TCG_TARGET_HAS_bswap16_i32 || TCG_TARGET_HAS_bswap16_i64
+        CASE_32_64(bswap16)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
-#if TCG_TARGET_HAS_bswap32_i32
-        case INDEX_op_bswap32_i32:
+#if TCG_TARGET_HAS_bswap32_i32 || TCG_TARGET_HAS_bswap32_i64
+        CASE_32_64(bswap32)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap32(t1));
@@ -808,20 +808,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint32_t)t1);
             break;
-#if TCG_TARGET_HAS_bswap16_i64
-        case INDEX_op_bswap16_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap16(t1));
-            break;
-#endif
-#if TCG_TARGET_HAS_bswap32_i64
-        case INDEX_op_bswap32_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap32(t1));
-            break;
-#endif
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
             t0 = *tb_ptr++;
-- 
2.25.1


