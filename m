Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F1431E096
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:37:14 +0100 (CET)
Received: from localhost ([::1]:52884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTZR-000552-JB
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTKq-0006yV-AQ
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:09 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTKm-00077k-C5
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:08 -0500
Received: by mail-pj1-x102c.google.com with SMTP id fa16so2146915pjb.1
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sLU2XmKG3JbG1D9u9PmlE0yiGugHvDS0F3Tdhc3De6g=;
 b=OyUw7VdGURcIpM802vxHhZhiiSF1JUXUsMHvt9qCMycIxLxMwkzYoxlvB3W6uKH4c9
 /05QqDMj+FySSI3I/DrM8NoW1tph4tsGpPDom8rqkFLxwGv4IXYEII6yJRmq6XM/bVaM
 QdvEmduMDvIuD+eOH7miXoBZoKTZ8ppUH1clFG39x7Qbwmp/XQnXLqAVsa/LCyIQPzBq
 DO8BIemMunACzm5TuuR8VmuXjV1Z5YRsVsrFY52zkJRvOiDUBK0L2JO5GR8N85dqQExW
 Ya5+nxjw+Tvh921bIvyCfm/QW/KcnmOXcXHGXl5sZMHgWAKcEwrN/FLqQqgSawDPKR/j
 OtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sLU2XmKG3JbG1D9u9PmlE0yiGugHvDS0F3Tdhc3De6g=;
 b=q2OEpW7djvOgi/JsscCu1cusjFGyKp8pYpn1FQXquMB1o3MjNn6LlerCiOUaUNwNz7
 Wj4gJq86ihjsUXsZG/iY/6OhaLD3EXeqR+zT2cu69V6ktPQuEa0I88eTNmG5nZBaxlO9
 6cVKU/J50lM5EKLZ3uLJkiB5+z35u/FOqaaV1w9PomTzZAFpwAf0Fb5T5A3mV00u+4OW
 jxege39CDyORQ37Dh/3VfyjJk7ZddRLmrYQvn9jYa3muJ4hetSCiVLfVNI+ai9f2a4+T
 E9xupM2irBuNOe9YRi/sNLZF2egC+pNNc6+4W76oNgrWB3XsZu359ggxxNLLfZk7J8mB
 +zfQ==
X-Gm-Message-State: AOAM531VXbBdKI3ljRUYk5BXkwk+Wa20UmMiMcN4qpFX831pccWVajBp
 vHPE9rb0oG/Kq8NkR/YsNLJ5Cbs2xUcE/Q==
X-Google-Smtp-Source: ABdhPJztAOrTeUbjA+1MZMQj6+EUFuNiXihf8WukfthUc9/pq3hTqRRg2zp5kkhGMeCR7tj/jeFaVA==
X-Received: by 2002:a17:902:e5cc:b029:df:bc77:3aba with SMTP id
 u12-20020a170902e5ccb02900dfbc773abamr976081plf.72.1613593322556; 
 Wed, 17 Feb 2021 12:22:02 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/71] tcg/tci: Remove tci_read_r16s
Date: Wed, 17 Feb 2021 12:19:33 -0800
Message-Id: <20210217202036.1724901-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Use explicit casts for ext16s opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 2440da1746..8b91e6efc3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,13 +57,6 @@ static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
     return regs[index];
 }
 
-#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
-static int16_t tci_read_reg16s(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (int16_t)tci_read_reg(regs, index);
-}
-#endif
-
 #if TCG_TARGET_REG_BITS == 64
 static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 {
@@ -152,17 +145,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
-/* Read indexed register (16 bit signed) from bytecode. */
-static int16_t tci_read_r16s(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    int16_t value = tci_read_reg16s(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-#endif
-
 /* Read indexed register (32 bit) from bytecode. */
 static uint32_t tci_read_r32(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
@@ -671,8 +653,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16s_i32
         case INDEX_op_ext16s_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8u_i32
@@ -886,8 +868,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16s_i64
         case INDEX_op_ext16s_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i64
-- 
2.25.1


