Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F5D312901
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:40:48 +0100 (CET)
Received: from localhost ([::1]:58134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wTn-000398-8Q
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRC-00019e-Hd
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:06 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:37576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRA-0005iY-T6
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:06 -0500
Received: by mail-pj1-x1033.google.com with SMTP id t2so2758873pjq.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0czCalkGz4G3rt/KJuGxDoZrx0T/yMn7B2Kkowe9hTk=;
 b=dNo8LMZ0qTgPXS4viJ3SsOETzX+m0qzkl+fDfEWJzhHLu5yAX+P38TIjsM9rVGBIut
 hRnf+jN4hNqdXVUdOSavOOrIXkIOZ5eoqqCum8AV+As9rAvbkSXLx+0/M/7TqaYUz4vv
 vb7QeN+Aua8tzQgME+mFGPapGsTMtZ90pncfKxxf8PUYR0tNazQgjR7TOsI8j+lv4JKr
 CPAhch6QkeDTQig72G7t88RPEPbbe28/EL4MSkb99WSVHAvbpDqtY4Nor+qmYRju9ApV
 xx2PhpxUu+ccuiN3450AhcSxbXQ9bFIZU4jX4rwI1mjTIT089AUXAv9YhIvSvepS6TeN
 uMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0czCalkGz4G3rt/KJuGxDoZrx0T/yMn7B2Kkowe9hTk=;
 b=KIrLWKDctPGBHBioO9nywzHm46RLV52oQv9KegUmTSCcAHZw4Nm3Xnl8jsHTgPgXkJ
 N/oreQRzownli3QEgQvRvy1Wl3xjMKaFjVUyU5f40IJ+ymOmAwVeLdZt9p6EeCkM7htc
 ov3swapRjmu/lcJSoTxDIvyAq/D7EcqYXDnPFJDe8jtc96+abqCcvjATifUNd6o+LTQV
 fT86/mrf4oOWtBaEhnHs374NyAxawKjTnwMYFiyPuzjDPRCAvCv4O8EJKa6dKkILGn0/
 eWsvX3Mh0dTmX/sMySEJMdvXXDuCJG5PlkurI5fWukbAhauz44XvUm2CFjq2pbno0yGV
 it8A==
X-Gm-Message-State: AOAM531iT0XEpakBD27PWq1V6dWd7Ts0Wo/XrKSu+2+HYSqflyV2hzKK
 ruN+6aReHcPV9/j4GmOq0PTixJb7zZlsHQ==
X-Google-Smtp-Source: ABdhPJzu2eEFQxTaoOxnq8ao4o8+ZhEGAx/dskJ7KSReZosaZww4T07TmG4HCCNcMVESwvJnWoahhw==
X-Received: by 2002:a17:90a:6342:: with SMTP id
 v2mr14284492pjs.150.1612751883683; 
 Sun, 07 Feb 2021 18:38:03 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/70] tcg/tci: Remove tci_read_r16
Date: Sun,  7 Feb 2021 18:36:49 -0800
Message-Id: <20210208023752.270606-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Use explicit casts for ext16u opcodes, and allow truncation
to happen with the store for st16 opcodes, and with the call
for bswap16 opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 25db479e62..547be0c2f0 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -71,11 +71,6 @@ static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 }
 #endif
 
-static uint16_t tci_read_reg16(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (uint16_t)tci_read_reg(regs, index);
-}
-
 static uint32_t tci_read_reg32(const tcg_target_ulong *regs, TCGReg index)
 {
     return (uint32_t)tci_read_reg(regs, index);
@@ -157,15 +152,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-/* Read indexed register (16 bit) from bytecode. */
-static uint16_t tci_read_r16(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    uint16_t value = tci_read_reg16(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 #if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
 /* Read indexed register (16 bit signed) from bytecode. */
 static int16_t tci_read_r16s(const tcg_target_ulong *regs,
@@ -526,7 +512,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             *(uint8_t *)(t1 + t2) = t0;
             break;
         CASE_32_64(st16)
-            t0 = tci_read_r16(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint16_t *)(t1 + t2) = t0;
@@ -716,14 +702,14 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16u_i32
         case INDEX_op_ext16u_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_bswap16_i32
         case INDEX_op_bswap16_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
@@ -924,8 +910,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16u_i64
         case INDEX_op_ext16u_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext32s_i64
@@ -947,7 +933,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_bswap16_i64
         case INDEX_op_bswap16_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
-- 
2.25.1


