Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CEE30E9F8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:09:27 +0100 (CET)
Received: from localhost ([::1]:40640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7U5G-0007rC-P8
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tiw-0005F0-Fi
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:24 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:55429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tin-0003vB-0S
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:22 -0500
Received: by mail-pj1-x1029.google.com with SMTP id s24so767912pjp.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r7Bqt7XeLpJxFziax4YcAvS468lSm4SfB1qZvFnNDEY=;
 b=rEFA1nE061rSgny28wXa4XZZSe36PAPAl1om1bEleHfoX2Xqyzig/BnjvLI8i1KZ0b
 gre2WSHy+HJdGcV4c596nLFSTjgi2UA+eEFUumQwlQiycuhRsDYBEYUhoe3FUOBDYoOh
 8T+BQlkJmaULIE0J4JikgXQiflEwvOGCUKgvfuNeJZDX1/peCxwyS9kAM7luK3tl5Wiu
 otl2NUH02t3Cy/n+YfqcXjVUfb1xOWgfaMX39bUQUDELaEa6L7Eh1ABX4GMbrPwUPqgj
 K284ywuXluhGN5rsQsozpOsllJpLmUZwvqQtF/5iTq/y4sm1odCYoqu4rlKZDflCTfEe
 DvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r7Bqt7XeLpJxFziax4YcAvS468lSm4SfB1qZvFnNDEY=;
 b=mB5dxXsqsgT5j5tHWcakERDHRPwA0vqVgYDYnQU7l5ZBFYKkW4XKNgzQ7/Vep93E9b
 OBXM/gfY1BSEzLR9LlN18wyHb7yJlf4ZfBqGvKs8d+ipW453sKAfBeh5x25veaW/mLJ8
 lDYu1PO3cfC+/lOKRYn1eaDhxPiEcujEgIWc4NhVXt8JqTVmTgoKOGWgjKS48nXxViYk
 wFEpyM3SLFBTq67wiSS/xRLDih7u5hdqT9HIG+0LDArY0i1239IiYtAkVr4a6JEjHUZ/
 csWBMzR1xb1/qdYpvA2swH+dEYbHfPOa7JM1KiK+hJPtTq+z8iY184zw3Iu5o6S9bo/C
 igmg==
X-Gm-Message-State: AOAM532jFsbcaundseiCJVb2cSyjK0b+Uk32RwXM/K/EBh/xhxFBL8KU
 DOewg/yHusaYKuw4MwRWW5NbN970YeqL6c77
X-Google-Smtp-Source: ABdhPJy31zrhNUUktb0os9EJ+FIwccQ58zBe4HnQ3nUaoSAArNUVpbZga2eQ9lm3GiEzKpC7V1eUKA==
X-Received: by 2002:a17:902:e211:b029:e2:843c:426e with SMTP id
 u17-20020a170902e211b02900e2843c426emr5546451plb.16.1612403170356; 
 Wed, 03 Feb 2021 17:46:10 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/93] tcg/tci: Remove tci_read_r8s
Date: Wed,  3 Feb 2021 15:44:08 -1000
Message-Id: <20210204014509.882821-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Use explicit casts for ext8s opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index c44a4aec7b..25db479e62 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,13 +57,6 @@ static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
     return regs[index];
 }
 
-#if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
-static int8_t tci_read_reg8s(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (int8_t)tci_read_reg(regs, index);
-}
-#endif
-
 #if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
 static int16_t tci_read_reg16s(const tcg_target_ulong *regs, TCGReg index)
 {
@@ -164,16 +157,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-#if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
-/* Read indexed register (8 bit signed) from bytecode. */
-static int8_t tci_read_r8s(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
-{
-    int8_t value = tci_read_reg8s(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-#endif
-
 /* Read indexed register (16 bit) from bytecode. */
 static uint16_t tci_read_r16(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
@@ -712,8 +695,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8s_i32
         case INDEX_op_ext8s_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i32
@@ -927,8 +910,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8s_i64
         case INDEX_op_ext8s_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i64
-- 
2.25.1


