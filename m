Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CBD31166D
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:11:01 +0100 (CET)
Received: from localhost ([::1]:54452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AFe-0002f6-DG
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2q-0002NP-40
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:45 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2j-0003Ss-Jf
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:40 -0500
Received: by mail-pf1-x42a.google.com with SMTP id w14so5311555pfi.2
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rzqE8qXvCMMaAx4wVWdxYTRZ0dwbqGtPGHyjXMn8W48=;
 b=DEYMcJMJod0XWqkOZWL0nQ7S2E8INfJOFRnzIogdWrnd/LZSBwJTyTelqNPgujlq4/
 /684yoOCDbqDC/xUmn+J47VuRbfa7q0NITfesCY4auBj/LvVCGAdMMD/uiGITxyhGquH
 Gy4HX9t4V/zIOlmR44dIwcqwHSzNrI9N2g+8T01IlTzgAJ2V69dz4YyWnTSdZWqIbb6F
 7OL571c7C9FNehgkpFy2WwIP0oiSzi7Yrdk8c7LZ3hvriBr6bHKWX7PTkBMHjtmfNLFc
 Dfgdi7yyl5velkph1em15EboEeratZisGy6oZ5Hl5EYF2xcklkG3p1tr+VFHLgUUE76B
 oDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rzqE8qXvCMMaAx4wVWdxYTRZ0dwbqGtPGHyjXMn8W48=;
 b=Hqk66NtQErdSMplxAEM5tUtPxCqziBhFM1ziPDnNgk37nbh+cY6zTHzZElFO4B+ed8
 H2zJw2PELa6i1RCeehJ35LXDfaxoggCbNCmcl51Lu+yZ0tn8+VTwOTvXK5ritO91VFIA
 PpOhg61XxeN2s3LE/j14Pwn/wBS3xYtQb3Hw3AL/gRW11+ijZUZd8k3btwYL+DSXEXtz
 TczWLDRVTr3lyeIgXW9goo4XGSHy3V1yH1gO3Dl77b3r1HmT4kkUxMLOF+8DbN36kvg2
 H+p+lIxQrLBlhgxB5n/BBM1rWyU6xmwvuFa0EV6JQTXWKSQYMvE0qzuio9tFGowHIVa9
 ANbw==
X-Gm-Message-State: AOAM532zP8aECAXOJB3bp8oqPaEA/fJ/5OniKLEpeCZ0jYF4bCDzNBy9
 rcSUh+Zn7WmW4A2qg/kwyMdjorTzaFDWGGyz
X-Google-Smtp-Source: ABdhPJy+TIsCNtj9Wpl9mUHkkJ6fkYyPcSqy8F5XpM5MOS8+vvlNh7NP5uZhse/s8I6/GH+0CMsbqQ==
X-Received: by 2002:a63:606:: with SMTP id 6mr4461841pgg.331.1612565856361;
 Fri, 05 Feb 2021 14:57:36 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/46] tcg/tci: Remove dead code for TCG_TARGET_HAS_div2_*
Date: Fri,  5 Feb 2021 12:56:27 -1000
Message-Id: <20210205225650.1330794-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


