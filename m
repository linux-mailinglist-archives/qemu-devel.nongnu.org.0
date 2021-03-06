Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2488032FD9B
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:46:02 +0100 (CET)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIekL-0005V9-5R
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebJ-0007EO-5h
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:41 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebH-0002zN-Bh
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:40 -0500
Received: by mail-pf1-x432.google.com with SMTP id r5so4508030pfh.13
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fjh8f4OqF602Y2BfCtcg6Y74/rLBbqgNaPqxsRG9w20=;
 b=BNhoV6YP+vahyZszutEJDw1mIBbKdYsJc5L9YzyKhQEh+UvXm0qtJGdsMEDy3ORWpx
 //22kqc29QbR5D7PGwu36M8Xmn6Rm9DdJOwqANFHtsc6z8VcFeNk2ngd9curx58SVGmA
 qqas9DlDahmf1EG2bW3G4adQWgkLO14OXHKPmChAyCz9fYHhRXkFkKnONNQuWFt4aI+c
 qUFQlKxOSBIuyYiiaSR8kLDqYBcTyYLTxby1P5UP0s+pAFUiNFVS0Bi37uiHTsrVr88c
 2LSM/kJ6M+viykza2yPeskNYL8vScdsZx21vdeK0OPGFGbAia/9DLfLRtdG7enhE4K8Y
 u9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fjh8f4OqF602Y2BfCtcg6Y74/rLBbqgNaPqxsRG9w20=;
 b=uZJ2ETYeORGzjq01g0hsWZImqfPTQaOZWUUeXg2yENv6Triq8qeQOHB4nPsIOiq1XZ
 OHntG6EdONovMd7nESQITDv+JLtjNa/GCErqm+Lhp3hLGdgMoMGALwK01rPoOgNxC9EX
 su8AHKqin+HKDHT2oFpXZLTx2QvH3Q5sHMN6kri/48J5BoQk/f9bk+2vj+C2CqD2BqI5
 IzdTqM0nFIN9R9miHSf0VXPXlswnRKVvGN+Qtb/WPIfjkSYQ5XoU2shUo67O3MD74Fcq
 oxgUd5l2eqFZ2SVdIsSKfA+V9Jfw5XiRdAW+2UN5JgQbq3uvYPlagxQJi5B4J33qn5Zy
 Qtcw==
X-Gm-Message-State: AOAM5323FNWSM7hayMeJR14gp400kSFQHD5d4gv9zwmkE8TLyc+LMJ9Z
 4EMy0BnLiS8jKOg+6gwgq0FEd5bn/qriTw==
X-Google-Smtp-Source: ABdhPJw8QLgFv6HLkamHTBPKX3o3/G62QiDsvNHemDMWWyiwNmG6E7RQFkFAm4HvApTMVnvF7/6hdg==
X-Received: by 2002:aa7:8292:0:b029:1ed:d6e5:1333 with SMTP id
 s18-20020aa782920000b02901edd6e51333mr14799911pfm.55.1615066597957; 
 Sat, 06 Mar 2021 13:36:37 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/27] tcg/tci: Merge mov, not and neg operations
Date: Sat,  6 Mar 2021 13:36:08 -0800
Message-Id: <20210306213613.85168-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 66f2962d6e..3ccd30c39c 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -387,7 +387,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
             break;
 #endif
-        case INDEX_op_mov_i32:
+        CASE_32_64(mov)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1);
@@ -649,26 +649,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, bswap32(t1));
             break;
 #endif
-#if TCG_TARGET_HAS_not_i32
-        case INDEX_op_not_i32:
+#if TCG_TARGET_HAS_not_i32 || TCG_TARGET_HAS_not_i64
+        CASE_32_64(not)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ~t1);
             break;
 #endif
-#if TCG_TARGET_HAS_neg_i32
-        case INDEX_op_neg_i32:
+#if TCG_TARGET_HAS_neg_i32 || TCG_TARGET_HAS_neg_i64
+        CASE_32_64(neg)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, -t1);
             break;
 #endif
 #if TCG_TARGET_REG_BITS == 64
-        case INDEX_op_mov_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
-            break;
         case INDEX_op_tci_movi_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_i64(&tb_ptr);
@@ -802,20 +797,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, bswap64(t1));
             break;
 #endif
-#if TCG_TARGET_HAS_not_i64
-        case INDEX_op_not_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ~t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_neg_i64
-        case INDEX_op_neg_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, -t1);
-            break;
-#endif
 #endif /* TCG_TARGET_REG_BITS == 64 */
 
             /* QEMU specific operations. */
-- 
2.25.1


