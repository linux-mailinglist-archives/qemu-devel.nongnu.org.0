Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A902E32FD8A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:38:11 +0100 (CET)
Received: from localhost ([::1]:50976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIeck-0000I3-Kh
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebA-0006yi-OS
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:33 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb8-0002xp-5i
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:32 -0500
Received: by mail-pl1-x634.google.com with SMTP id z7so3101176plk.7
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYlMX6zlz5iaj2ojk5WvGQj9gx5INTxGM9zOOFclYMU=;
 b=TVSDQHBwX1N+SEZLTa9KtHrm+0dzJqDZhuQd43NdLF5N4RGyulXWXbCFKRcU7lN3Sj
 SSf/n2N2agtJjhvdjQK2LDv/E2CxbXq1iQlgDOkC/WOTmrRnXhp3VS4vU8hRKUYP9QAB
 mpCC6fqQjkKpLC5HepETDt24yBB7eBmCH3rtWwGcpUf/DluMtKNhwx7UpjrxXPbyANk2
 B0kmzzXG03HIx9RuB0/C4ci797YIh7slOVbdbTfHi4V0FtCJQKRhh/mE5xUvCBxU08eu
 xy1b7Wy7rM85qkZbpuDYKAlFueZnVSD8hnH75I0fR7V/nAZ4Uqdx/otobxXdHTbWx1fC
 hRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYlMX6zlz5iaj2ojk5WvGQj9gx5INTxGM9zOOFclYMU=;
 b=DpA89AKmPz+yWQAkTouy8smzsE7J0wyh/dE00HT70922Mb4JlbnOwqpjWnGW5lKau8
 YWMQAz4c8GYMz2wCqClrDd444NWQvccmKUNaY2SRiepMB8wvTx5BncNNfqurfm0Er61D
 rhoVjULnuobuSc3qrNfsJ6DzNUMkzUh2Rnj6SHasfxpRcZd2ll8JottzACLpgphiDWBD
 jepEEH/AZZLKxhgmMvDbCbUd6s1LAu4FU9Q32T1a0+zU9bYnuPkRpnkiLkTCnOIdiNSm
 rr4WM7gxnJ4KYj8lHWyDn0WbjGse0v+3QqEriZaUAfaSUO8cbWezD3mzgOHqcao6hk2v
 uewA==
X-Gm-Message-State: AOAM531+jRtKmZ4s7bVoFdAgdy+H/6NjgNXtLXW4xNO8PLO6/TTstR+j
 2jd4bkHqDapizX5eaEXphyzi+ZrVth9XJQ==
X-Google-Smtp-Source: ABdhPJxPasY05Iy2A6qTzBnIU7lHJKKoKZraibn4nLSTGWOiLDdfAUN5S1pYe0MgfnXszAZEZ7H+tQ==
X-Received: by 2002:a17:90b:438a:: with SMTP id
 in10mr17024991pjb.165.1615066588594; 
 Sat, 06 Mar 2021 13:36:28 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/27] tcg/tci: Remove tci_read_r8s
Date: Sat,  6 Mar 2021 13:35:59 -0800
Message-Id: <20210306213613.85168-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Use explicit casts for ext8s opcodes.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 4ade0ccaf9..7325c8bfd0 100644
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
@@ -695,8 +678,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -910,8 +893,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


