Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B993A32FD9C
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:46:02 +0100 (CET)
Received: from localhost ([::1]:56772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIekL-0005Xp-Nl
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb9-0006xg-5v
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:32 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb7-0002xk-1f
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:30 -0500
Received: by mail-pj1-x1031.google.com with SMTP id t9so1067667pjl.5
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fptILMWrA+pDg1XvV+KF1NfoqcnNqb93ja/TFgoMbqs=;
 b=d0/wzP1F0HqjaYfQpSm7clOdRrHySiwJyvPiTemJgTk0FU6AJAWK+nLbcHhNx1JtcM
 KMZjR3GuxwwsYJ7O1vZzaFr+4sCumaxqks9B/x3vSNkpy1XJXqYPQxlWeBh3jvTrRCn1
 hgpZBUt25MSyqlfeCVievTc2if8EjbteS1TPWuysgirIkRnvJm1bwTqx+P0pSEOfibIT
 UEYlAfKZ9g4ymnI5QOQXjo5bHpNFsxg6lXQWIJMQ0zOgn15/e0oXbLQDkLHrTMxtxuyy
 Xcze5eafAVDeF3deFTHxP/rOVHsKbXy7v5MYMaMnnR7FFvS8PC3OcXVa/BYzpsWwr2xA
 1c9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fptILMWrA+pDg1XvV+KF1NfoqcnNqb93ja/TFgoMbqs=;
 b=XfiufUDLfYjhpGzFu/C07Y2CeoT595777qrPb7SmGvlR0Crunqg93Te11DNivYXdjG
 j5w26DXVfvzxBlgRexKILKJAA+CDzKbAjhN7mjUcie2I+ShQbb09UYmosSKbZAtVRy7v
 uovDmCkc4sbSKxj+iwffpupaslyHqcF82HVIPRDD7DuFcwmmVaJhnRkNSxVBA46ETZw6
 8C3k50+NueI16TSD4UMFXaza5eefizw1tW3kF+58PqTm2Un1M9h+GrrkSVYTlyCHiEtJ
 tjCCyDPoMKZnSZJnRWofSUsnn8ig78ds8fMjIsIjo5kftWI8lq+9uZspgcmhx2xUaLj/
 qUNg==
X-Gm-Message-State: AOAM530uJvxX3sFyony1nLsP+Wk2I6u9+3VtjPhsBjArkH1+e4UnFEC3
 p+7K7clZwkYlcF+H0PaFz/3eUCTsjWT/Gw==
X-Google-Smtp-Source: ABdhPJzIVWSTZTOzTSaXZP0kNpx8Dhttw/2G3Nnx/6c/F8ft4XkxP/DIku4ajrY0kkcOhBWny/oXDQ==
X-Received: by 2002:a17:90b:e18:: with SMTP id
 ge24mr17269379pjb.199.1615066587677; 
 Sat, 06 Mar 2021 13:36:27 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/27] tcg/tci: Remove tci_read_r8
Date: Sat,  6 Mar 2021 13:35:58 -0800
Message-Id: <20210306213613.85168-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Use explicit casts for ext8u opcodes, and allow truncation
to happen with the store for st8 opcodes.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 1c667537fe..4ade0ccaf9 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -78,11 +78,6 @@ static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 }
 #endif
 
-static uint8_t tci_read_reg8(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (uint8_t)tci_read_reg(regs, index);
-}
-
 static uint16_t tci_read_reg16(const tcg_target_ulong *regs, TCGReg index)
 {
     return (uint16_t)tci_read_reg(regs, index);
@@ -169,14 +164,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-/* Read indexed register (8 bit) from bytecode. */
-static uint8_t tci_read_r8(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
-{
-    uint8_t value = tci_read_reg8(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
 /* Read indexed register (8 bit signed) from bytecode. */
 static int8_t tci_read_r8s(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
@@ -533,7 +520,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
             break;
         CASE_32_64(st8)
-            t0 = tci_read_r8(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint8_t *)(t1 + t2) = t0;
@@ -722,8 +709,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8u_i32
         case INDEX_op_ext8u_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i32
@@ -916,8 +903,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8u_i64
         case INDEX_op_ext8u_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8s_i64
-- 
2.25.1


