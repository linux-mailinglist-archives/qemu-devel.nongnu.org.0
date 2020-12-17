Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B352DD368
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:59:38 +0100 (CET)
Received: from localhost ([::1]:34946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpukj-0001pT-Nn
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpueF-0003tF-M2
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:56 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:45815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudx-0004yA-Rw
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:54 -0500
Received: by mail-ot1-x333.google.com with SMTP id h18so27515378otq.12
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g/NK8zJ+1oHnRf7YalpC2REaHWJdBcpCs5uuohec03c=;
 b=lMw0ZOywxjjM0quZ//K4uPZuJByne6EnDcoV1FVXTzSMKH5/ZrxoRzHsCGd2JBOPoM
 R+6w6O8b527f18ujJVzsL7s0AKEzuMQ44dsVEP9WM6qjr2PJFcWeJrnb13Zx9gWkF7c+
 ufKnFp2cesl+XodVV853+TOobu9dVusaMn9fjDfUNImACUNuNFBHFyg6x00vclSUYqVf
 M1G/3Ye2mylFi5L/4EaZA7o3FBegUmuaPk9zel+lO3COKIk2YjrjJNgjHtIgEpBJO9Ft
 eE2l2co83/WRd3OKJSuHtX4W+xSdC0VdENrIapx+g7nQCoLnr/aFcd60EE3IoBYZAWC9
 ++bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g/NK8zJ+1oHnRf7YalpC2REaHWJdBcpCs5uuohec03c=;
 b=dF7/EU5E3lEj/+yAtlPw7empPv9assxtHcvVSMFVmRQEnVS4V8db1gRdkJYaHiyQAp
 I8wC3bEa6wxim1Niztjq+KFi5r9jvVobg29H6kEc5lUCJIbnku3JdHJ7dq3H+eJvzGN5
 RGGaW8SZvqNfWxYec1Txql1LTzuapbFxuyJXJpr96RAnRJbVAV8i0DvFNIYBPUDxA0Wu
 p+F9zOThuGkaE15JcFsa3dLES3Fnr8/XYp8N8XXDHO2iYF14PE9MdursUVcxyuo/g/Ls
 DI414ubn6DvuC66LobhpdUNoMla3KBFGwwMjR5OuUuwKIjCXUhyqVNqlNohkJYTpXlXz
 XfoQ==
X-Gm-Message-State: AOAM532I0c+S/vPUSFMBo9ym8msmA+DpdaQlKX64ymDmj9cV8UW8C7jL
 XaOlZyP/cGpDrdSZGa35TH4HxWKSP0xqQTkz
X-Google-Smtp-Source: ABdhPJyMtuHmyTyy9XExp8/Nk9Rd900PD/2idBP0OCxU8vZH+LMWVRCuqLz0b1K7+o59idyseD2xaQ==
X-Received: by 2002:a9d:6b10:: with SMTP id g16mr28970771otp.301.1608216756522; 
 Thu, 17 Dec 2020 06:52:36 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/23] tcg/tci: Add special tci_movi_{i32,i64} opcodes
Date: Thu, 17 Dec 2020 08:52:09 -0600
Message-Id: <20201217145215.534637-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
index 67092e82c6..314455b386 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -273,6 +273,14 @@ DEF(last_generic, 0, 0, 0, TCG_OPF_NOT_PRESENT)
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
index 82039fd163..52b34bd70f 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -576,7 +576,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             t1 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg32(regs, t0, t1);
             break;
-        case INDEX_op_movi_i32:
+        case INDEX_op_tci_movi_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_i32(&tb_ptr);
             tci_write_reg32(regs, t0, t1);
@@ -847,7 +847,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             t1 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg64(regs, t0, t1);
             break;
-        case INDEX_op_movi_i64:
+        case INDEX_op_tci_movi_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_i64(&tb_ptr);
             tci_write_reg64(regs, t0, t1);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 231b9b1775..c8c8386a72 100644
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


