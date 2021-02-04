Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDD030E9CA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:00:56 +0100 (CET)
Received: from localhost ([::1]:40256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Tx1-0004GA-Mg
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:00:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiZ-00051I-VN
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:59 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiX-0003qU-0v
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:59 -0500
Received: by mail-pf1-x42b.google.com with SMTP id y205so1074765pfc.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rzqE8qXvCMMaAx4wVWdxYTRZ0dwbqGtPGHyjXMn8W48=;
 b=lZJQyPOO1KRBaGJWUaxPtMbyv5ZnjpvVgchjfLMlgsJdrzobET4BPO1b0pwD6C8RzD
 ZMBrPcGfdgpK992RRyi57neonIkdb3J9WhzhqKSntZj7Wtoa40oN+hytYuNl06o/4ifj
 M0FWJjuAMMWU72G9kog9LrIZqM/a65o5uAP1Da9/8Xg+sgk+EB6NCaREiOzuUG7eYKkc
 popXNDg4UKZ5pUPs9vmn4eewx60rYi2xtt7BGd9dZCDrwC6z6kt2Kb/hN1D2U2VJEmi4
 c1pzjE/VnFRfaEDnAByTlkcy5J7JEQiVprpvV6S62g3/O85zmHGlanAKxvAAcyNh9s4f
 YFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rzqE8qXvCMMaAx4wVWdxYTRZ0dwbqGtPGHyjXMn8W48=;
 b=mxezS9+9UHSPheQSjivWonwHShUayNIct6enY3M34lqQ0LQ9Vfwb9vNDaiYqUtRISi
 HUu4YHflwiYWaZkRE/w+EWONEbYZAW8Zkq8+sUQb/v3nu/pCkO9wXIZwmzsL//imTjz2
 ZB5IdI6HUuJW64d0W7WgA+r8oAEmNLBeS/pKbioUNOOS5OtSAaQyfncvIAxrNSj6VYlN
 VslpTSPi4YeP7j70Jns85vY8StzjHymiPbm/A/LFLAIoxBiFAN66iVpcdQU2Rx0kAmvg
 dApLHNJQjdmW6lUoWL6fkE2i19WbZQLvJw/XBFJF+N40q3x50h6DHxTolhCDXSGW06S5
 Y7rQ==
X-Gm-Message-State: AOAM5330jc+Dp1okB9QtS5D9kGJvmZQTODg8tktnxmFTVX2AKCV5g/Ea
 hpcJyeNJQIs9XCA+FHHJzn0GAFjesvafMUIa
X-Google-Smtp-Source: ABdhPJweLhPK8Av3gDK9TDMCUE0yrNUHjH24yAdIXtSUbg+jWxIoff/f9z10SkCVlHFvpnw+AoEjrQ==
X-Received: by 2002:a63:4507:: with SMTP id s7mr6512529pga.390.1612403155898; 
 Wed, 03 Feb 2021 17:45:55 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/93] tcg/tci: Remove dead code for TCG_TARGET_HAS_div2_*
Date: Wed,  3 Feb 2021 15:43:59 -1000
Message-Id: <20210204014509.882821-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not simultaneously support div and div2 -- it's one
or the other.  TCI is already using div, so remove div2.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 12 ------------
 tcg/tci/tcg-target.c.inc |  8 --------
 2 files changed, 20 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 36d594672f..25329345cf 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -652,7 +652,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_ri32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
-#if TCG_TARGET_HAS_div_i32
         case INDEX_op_div_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
@@ -677,12 +676,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_ri32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 % t2);
             break;
-#elif TCG_TARGET_HAS_div2_i32
-        case INDEX_op_div2_i32:
-        case INDEX_op_divu2_i32:
-            TODO();
-            break;
-#endif
         case INDEX_op_and_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
@@ -908,11 +901,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_remu_i64:
             TODO();
             break;
-#elif TCG_TARGET_HAS_div2_i64
-        case INDEX_op_div2_i64:
-        case INDEX_op_divu2_i64:
-            TODO();
-            break;
 #endif
         case INDEX_op_and_i64:
             t0 = *tb_ptr++;
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 82efb9af60..6dc5bac2f3 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -596,10 +596,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_remu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). */
         TODO();
         break;
-    case INDEX_op_div2_i64:     /* Optional (TCG_TARGET_HAS_div2_i64). */
-    case INDEX_op_divu2_i64:    /* Optional (TCG_TARGET_HAS_div2_i64). */
-        TODO();
-        break;
     case INDEX_op_brcond_i64:
         tcg_out_r(s, args[0]);
         tcg_out_ri64(s, const_args[1], args[1]);
@@ -639,10 +635,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_ri32(s, const_args[1], args[1]);
         tcg_out_ri32(s, const_args[2], args[2]);
         break;
-    case INDEX_op_div2_i32:     /* Optional (TCG_TARGET_HAS_div2_i32). */
-    case INDEX_op_divu2_i32:    /* Optional (TCG_TARGET_HAS_div2_i32). */
-        TODO();
-        break;
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-- 
2.25.1


