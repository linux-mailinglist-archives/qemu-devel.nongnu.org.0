Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF2332A931
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:22:07 +0100 (CET)
Received: from localhost ([::1]:50790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9eo-0004Kh-6I
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HY-00033J-LD
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:04 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HW-0007bV-Kh
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:04 -0500
Received: by mail-pg1-x534.google.com with SMTP id t25so14355096pga.2
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CWFm3ag7LIImv7AYnXLhQJhOkm+Ptc6YBLG0M9ot5EY=;
 b=gt7UnfEP0pNrXs+6tVWNdwtmsuEug8fmhFW3kzP+QmzJ6zvVCV/vPedK+IT61noD2a
 MELaAQ5JV5fDk41q89KmRs27EhtOSc4J39nROWZLoScA4bHqBuneKX82l5F6Zqh6btaB
 ubP5yxeDK6Zo0lqjJIiRH7QOM0d4xHYTPrCB1n76mZOxdNHjZhthM0K1gzbvq5lcYkdh
 tuMe68yENBAq4H+CVR7oJ5br9+2U1Cy3M7k5Q4Y+DR2spsCp04QV1s2gtVFQ2wC8/vth
 THXifg7mDdTZIBDtiOSM3KzWMdw3PcCGVQybzXgvqdA+XWQWF74g9mZcEIUjEfWBYeFQ
 uuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CWFm3ag7LIImv7AYnXLhQJhOkm+Ptc6YBLG0M9ot5EY=;
 b=pliEk2R1kQRqgYomu1kTG0Mql3XlH7XgOc3X1cQkBe/XB9DxSLUoD5sS8O3kYrkPvK
 yCb01rxN4rBNq0MYcBF8EJ0ul1rBQh6hNgkLhe3tT137o24TcZc0Yc58GdmCmy40v686
 kNuPTiZC28R6Xx/mU62Gwp4IymEnUsdqv/ty4Qd+NtbckR+J4qKfw/5OPPCkW+0C/wrQ
 juUn37km3jRPKljJo+MuPahhsmiWZmL0u1oOdt3tGeH818Kk42KC/i0Pfmpn9dkQmDHe
 3tZPclY2XuiDlc2uNNE4Djywcpt9N8Id9jELglAIMRURHXkwcfbI1Jyh+gER3SdVpFZo
 sWEA==
X-Gm-Message-State: AOAM531LtwmWXXIIemSR6bKf/h3ZjpVJfuRj9g35FNc2eIQW2ncAG6gV
 Rj7yrh9Pe+U0UvB4ierkglYOuDngoDpo6A==
X-Google-Smtp-Source: ABdhPJzzeJpKDhBe9GoG3+OdF6ev/5nRCuDdVjCu/rDtZecQxMa1DCMcq1l1qvbHJOmQ0KsLL5EuSg==
X-Received: by 2002:a62:ae05:0:b029:1ed:9384:3e6f with SMTP id
 q5-20020a62ae050000b02901ed93843e6fmr20602260pff.44.1614707881398; 
 Tue, 02 Mar 2021 09:58:01 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:58:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/27] tcg/tci: Remove tci_read_r32s
Date: Tue,  2 Mar 2021 09:57:31 -0800
Message-Id: <20210302175741.1079851-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: alex.bennee@linaro.org,
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


