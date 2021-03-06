Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ECD32FD96
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:44:19 +0100 (CET)
Received: from localhost ([::1]:48170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIeig-00027y-1D
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebD-0006zg-ID
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:35 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebB-0002yd-V1
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:35 -0500
Received: by mail-pl1-x631.google.com with SMTP id p5so3112380plo.4
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CWFm3ag7LIImv7AYnXLhQJhOkm+Ptc6YBLG0M9ot5EY=;
 b=wxMK1rsQwgQ2ujJT/ccnz5qdKxjNaZzpXJn5w528Vf9unN96BUll7GfvPiFK0WL56R
 7TWQf/3I6C+lEHRnxOwLW1gTzinR6eHyywuxvJ/BF52pF/vg1+qxbqCthxIqY/Z7XHil
 WvqvHQCH2alEO4ZIArKZFgaOEufuI5Ng1SGXG5+Tt0j3dwQQ/3QaepC50As99iIJ/KdT
 tXJ6WqHz8cTU8OlnK7ahqnWCXuTJRbiRIG8prukuaeEPHmFdpHGVHjrzG79jup/tp84g
 cuiIg2Uu59ny9IY9x1xkboDg53i7DOvf04uOghAvfdEauY8SKl4+JzPB4OTNLNRHRDr0
 pGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CWFm3ag7LIImv7AYnXLhQJhOkm+Ptc6YBLG0M9ot5EY=;
 b=p40e684fbvj4a8kcgjXhk0SjY0Seebc6ALZbvofTssSrCWx9GKtvtze2PMcUqAkvHz
 5av9kPUQUw3WBQnHKc33i+ICl8/2A+FP5fvFlhB6m45nh7vnmqppNXH04UV17CSs3Zt+
 7q1UNHVrbKXGU+FvR456Cx6JwGRDS/T5PCQ946kLlAs3U3kGuijx7/v3orYIbCD1C/UR
 uY+3H8i9wzpso0I+MsxIiau9+ai/l7Hy4sEwEHZMbAwBHNbK+6aL1fwD3dD8HXQLkY2X
 cDIXLJAk7Zx8newJ0ovXC8gNdMlkApmU8OpC7DaMYi528Yb0QjOgmteqIsooxqD8B2LN
 6S4Q==
X-Gm-Message-State: AOAM533qSP1lc3vCkjx6NI/b1ALTNEGPU1bp0OEJUgSeniwc5LE9OfHm
 bQ0id5Lx9r9xVEE03406xvU+/iRZqesNXQ==
X-Google-Smtp-Source: ABdhPJwi5mGU21tffwiP+hBqrEETJcrk2KOhTfQJWZ58j5P3IBMqTl8im65hPYivGAdmvsqt0YR4JA==
X-Received: by 2002:a17:90a:be0e:: with SMTP id
 a14mr185207pjs.131.1615066592624; 
 Sat, 06 Mar 2021 13:36:32 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/27] tcg/tci: Remove tci_read_r32s
Date: Sat,  6 Mar 2021 13:36:03 -0800
Message-Id: <20210306213613.85168-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use explicit casts for ext32s opcodes.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index a5aaa763f8..cef12f263d 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,13 +57,6 @@ static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
     return regs[index];
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (int32_t)tci_read_reg(regs, index);
-}
-#endif
-
 #if TCG_TARGET_REG_BITS == 64
 static uint64_t tci_read_reg64(const tcg_target_ulong *regs, TCGReg index)
 {
@@ -149,15 +142,6 @@ static uint64_t tci_read_r64(const tcg_target_ulong *regs,
     return tci_uint64(tci_read_r(regs, tb_ptr), low);
 }
 #elif TCG_TARGET_REG_BITS == 64
-/* Read indexed register (32 bit signed) from bytecode. */
-static int32_t tci_read_r32s(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    int32_t value = tci_read_reg32s(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 /* Read indexed register (64 bit) from bytecode. */
 static uint64_t tci_read_r64(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
@@ -870,8 +854,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         case INDEX_op_ext_i32_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int32_t)t1);
             break;
 #if TCG_TARGET_HAS_ext32u_i64
         case INDEX_op_ext32u_i64:
-- 
2.25.1


