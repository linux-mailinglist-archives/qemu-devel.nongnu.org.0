Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2722312908
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:46:12 +0100 (CET)
Received: from localhost ([::1]:46700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wZ2-0001ff-0z
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:46:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRM-0001QF-Vj
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:17 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRK-0005lu-2x
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:16 -0500
Received: by mail-pg1-x52f.google.com with SMTP id n10so9242944pgl.10
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KcXtBKnullZQYp/0sBEeRm33/576gXQq0HPnlvclX78=;
 b=qhwLowwvWpw7Pi31T3PQdv1IxxWtx9tynLB8wu6+JZMxuTI22fvf8i+Ap4Ol/60KDU
 luq6iVqhVCB+CDj/PhISFOBvdOap4Y7vvXHdbajQU8MV/VOL+bjgi8m4PcjPEaArL464
 NQkK8cs6GIleY6E5X3S5o7FLN8r7NLGveaUuR+yAAAm8fO6EBelLBSqMBCBM8VHFfvDy
 51SYEBawGClTj30+vgheVmWYo9Q0w9LDBhQritRJLBAOiCsbYlrKk0mgLpRI4hh4I8OB
 ZQNQldC6kpGijvqjs7EDICz+0HQYxqfS6R7OogNEHzf1NJ4f6RSdC3fSyEPU4CrY9Iwx
 MI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KcXtBKnullZQYp/0sBEeRm33/576gXQq0HPnlvclX78=;
 b=oCyUbRWjFSxu0vqv482ME0tvJ9JY9Ap2K7y2IYrQh8vppS+hNrI5LTQhpq5mPcymCR
 AiKD5LA+cq1FwBFJeP9DvCn26KoG+bqVR2Nu7f/qMaKoZb4xL31ni5MGjh3KoAdYv/iQ
 7cQKn50eqBdFEGxezVchoyFCYSV5XCnTBODTmldV8OCqdREGASRmUQvpYHFh1qIXgriG
 zp/ohHwvH0BpqIBBYGtO4CTnnp989CGRk+Q6KdFetURBOCwuIrimW0I0vokBmSNCMRkb
 wytBGqB0lAKPAaZVYzTy5PdwXRLUAW/UtNWURVZ3oz3A+/r0RfEpjbDfIl0tVYUB+JJ0
 z4gw==
X-Gm-Message-State: AOAM531g+zRF7wDe7BN2E3Ybb41BDlBzyA54u1W8kGJ2lBdixo2P52Rk
 WZhEsAk28mKD2NhGw3ayCIGgyFzRN1KlQw==
X-Google-Smtp-Source: ABdhPJyknVvG31B2A6Y7BRdPA9S3RmVenyPcZY/vAYVAPq3xE7QDlz/QhN+jwzm++Mi90BZkU4Q7kg==
X-Received: by 2002:a63:4082:: with SMTP id
 n124mr15332554pga.340.1612751892753; 
 Sun, 07 Feb 2021 18:38:12 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/70] tcg/tci: Merge bswap operations
Date: Sun,  7 Feb 2021 18:36:57 -0800
Message-Id: <20210208023752.270606-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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


