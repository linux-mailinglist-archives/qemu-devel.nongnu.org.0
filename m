Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BC52F5745
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:37:14 +0100 (CET)
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsVd-0001D7-7J
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCe-0003ji-I9
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:36 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCc-0003Vk-5V
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:36 -0500
Received: by mail-pf1-x42f.google.com with SMTP id h10so2448690pfo.9
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hx+ccawlJdzu7GbQDl+NdiAx6KUHgVaeD5cM1vlFohs=;
 b=ioEcRVLD562KYCAuiTBp9NS1P2W/RaGzMMNHWfEEl6OUCwSCCfMZZ2hFMOrK94wB4m
 0C0/xQ9SCFNtFOqrgeXQrbpUEN0HqRUab/8QPSCpr0dDXM7+9YbllFLTl8p+/nrCxVX1
 uGrz4gFbr41Fd3EFbAkwWb8+ainfRwOoHqoc+BxM39X6gezp3NEaJkjyaV+nVeqtRVLt
 GyKbnWiLZTTmOKFOACj6FIrJdzgg+zRWnAyLEYb9VEH//HJdJDGCUNGl3kKQnW7LWtdm
 FS0gfXSR5uhFj/br8xkoWVZMzFSkXZmwjS1HeX8OxqvLloBXrc7QeCPSN9mnjvO//4j4
 0V5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hx+ccawlJdzu7GbQDl+NdiAx6KUHgVaeD5cM1vlFohs=;
 b=Y1ckNDsAptrA6avzhf7h9UWb5F5hIuO79wUfJlX+AJOGHTsRyg0mw1vo+QwJtD/ZwK
 1TtLlSapNwLo/P4uJC8/2EJeS5fiY0Y2lFuMEfum17gsGvNKtN6s+vMtK5h9rRJZn5rn
 iGBi8bQIJpoT1keH2Z7YrNQ5Qv0yBeS7yQaa8aRKfKcmmbxWSUcB8rjajF6c3QJlgqYb
 5fsTwkC5fGz8a6QApkv3ryRe5h3AeQhpvFW7gQu7wIb7A52u5YTXavKbDtyi72nFJio6
 WNokC5ybKQBQfVVUxZzxVFTGg73/P7Rqhc8LGGJrYVcGBfuX+MeQRAiMWVXp8yPv5X07
 RAKg==
X-Gm-Message-State: AOAM530bLVMYmA1ooxAMjrV2Vatp8G5haaPlodl+s981sL4LADT+H8ec
 Rud34dftK7fvlDloxcu47uyI6eqNCjAqmA==
X-Google-Smtp-Source: ABdhPJwEQPK+WkK+F8BLiMOGnOdDaTz2zu2EzVboQJPL2mG8yb2qY0WfU+2U8hRsLGR36nLWMCSjJg==
X-Received: by 2002:a63:5526:: with SMTP id j38mr4995652pgb.177.1610590646706; 
 Wed, 13 Jan 2021 18:17:26 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/24] tcg/tci: Add special tci_movi_{i32,i64} opcodes
Date: Wed, 13 Jan 2021 16:16:47 -1000
Message-Id: <20210114021654.647242-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The normal movi opcodes are going away.  We need something
for TCI to use internally.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-opc.h    | 8 ++++++++
 tcg/tci.c                | 4 ++--
 tcg/tci/tcg-target.c.inc | 4 ++--
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index 70a76646c4..43711634f6 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -278,6 +278,14 @@ DEF(last_generic, 0, 0, 0, TCG_OPF_NOT_PRESENT)
 #include "tcg-target.opc.h"
 #endif
 
+#ifdef TCG_TARGET_INTERPRETER
+/* These opcodes are only for use between the tci generator and interpreter. */
+DEF(tci_movi_i32, 1, 0, 1, TCG_OPF_NOT_PRESENT)
+#if TCG_TARGET_REG_BITS == 64
+DEF(tci_movi_i64, 1, 0, 1, TCG_OPF_64BIT | TCG_OPF_NOT_PRESENT)
+#endif
+#endif
+
 #undef TLADDR_ARGS
 #undef DATA64_ARGS
 #undef IMPL
diff --git a/tcg/tci.c b/tcg/tci.c
index 2bcc4409be..2311aa7d3a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -593,7 +593,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t1 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg32(regs, t0, t1);
             break;
-        case INDEX_op_movi_i32:
+        case INDEX_op_tci_movi_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_i32(&tb_ptr);
             tci_write_reg32(regs, t0, t1);
@@ -864,7 +864,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t1 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg64(regs, t0, t1);
             break;
-        case INDEX_op_movi_i64:
+        case INDEX_op_tci_movi_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_i64(&tb_ptr);
             tci_write_reg64(regs, t0, t1);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index d5a4d9d37c..e9e5f94c04 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -529,13 +529,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     uint8_t *old_code_ptr = s->code_ptr;
     uint32_t arg32 = arg;
     if (type == TCG_TYPE_I32 || arg == arg32) {
-        tcg_out_op_t(s, INDEX_op_movi_i32);
+        tcg_out_op_t(s, INDEX_op_tci_movi_i32);
         tcg_out_r(s, t0);
         tcg_out32(s, arg32);
     } else {
         tcg_debug_assert(type == TCG_TYPE_I64);
 #if TCG_TARGET_REG_BITS == 64
-        tcg_out_op_t(s, INDEX_op_movi_i64);
+        tcg_out_op_t(s, INDEX_op_tci_movi_i64);
         tcg_out_r(s, t0);
         tcg_out64(s, arg);
 #else
-- 
2.25.1


