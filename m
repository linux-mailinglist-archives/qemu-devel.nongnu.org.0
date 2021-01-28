Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3E330719A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:37:38 +0100 (CET)
Received: from localhost ([::1]:35096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52o5-000363-FY
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52b7-0006MX-Ii
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:13 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52b4-0005nk-28
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:13 -0500
Received: by mail-pf1-x436.google.com with SMTP id q20so3523033pfu.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m2ze6FL+5Rg8ehBHjUThMYSDxbo0AgwLwhZ3Mex+2Fk=;
 b=hRJWj2TuVDLgyxPGDzfoWgPf/W/mp8+JQiAjBS9J2XqZz7EUZua2GNUrjlixVz58p2
 8orQuMRaBkTX7gUm4SMSLUyrxsMYpFlTMGAdlWF7IJL/63Y8z3DCuuGwF9j5t8htlnIY
 08lDpsFVxvFvFpgdmU7JHJzLm0oolTyCQCsTDnR2O9PgBKoDjbiMkQWCrvGG16GaPuME
 vPsH1PvHtemV/64t885KLH9Gok8WxUi/J0xmf8AubC1C7TWonyFDpXOUb4jdNI45cpmD
 jHtX7GEeEsX5lqXYBN5O9X+8f91JNgXmhuaGDUDf4+dc4N8xvhkLtGcnI0kzeRC1HfOS
 QTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m2ze6FL+5Rg8ehBHjUThMYSDxbo0AgwLwhZ3Mex+2Fk=;
 b=uXpGCHi55ZR7LShrdw1cQaiDw8H9xt9gdtbSTcUt7WFK+4fkb+NtkSEzktDhLEa+/f
 Ed9rYhDLgappdxC6PEVTWH7gLQVNEF4Yut8qcFRboRRFndg3kQNu85EpGX0moyKhHwBb
 I4+sy8IMWa6L5a/ZHZSIGmU7UMPq2R1jfw9ZpoASSjFXVUVsm6kBGovVlQUH/QcQ93Bi
 ZpEz1crYfZvjsxKp/mRekt+wMwEnF2g2DkWwXWdB2OHA4jbyjhWQOQNUnLkfQ+DEx0NQ
 wFgnHIX6vUtlWqGiOgHPvVBxJG1L1Spnbnsjb26xI5HyCjcL1TSBJr+sI4BvpfwR/I3q
 yIHA==
X-Gm-Message-State: AOAM5312CTbpYW/HiLdj0nUYM9FPh2l4jtfhK9vYUBERJN174plHr5CM
 3fgdCpahPjKXJ4vexh1nOCzaWXiruqNRojJB
X-Google-Smtp-Source: ABdhPJyBdcKWIqvTbXWZmIJ/SnXlLYRf3O99f5sJNfnFMKYt1oysmzuIgHahIM16PO9hWgeSo5nYwg==
X-Received: by 2002:a62:5a86:0:b029:1ae:6b45:b6a9 with SMTP id
 o128-20020a625a860000b02901ae6b45b6a9mr14555952pfb.7.1611822248455; 
 Thu, 28 Jan 2021 00:24:08 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:24:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/23] tcg/tci: Remove dead code for TCG_TARGET_HAS_div2_*
Date: Wed, 27 Jan 2021 22:23:29 -1000
Message-Id: <20210128082331.196801-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

We do not simultaneously support div and div2 -- it's one
or the other.  TCI is already using div, so remove div2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 12 ------------
 tcg/tci/tcg-target.c.inc | 16 ----------------
 2 files changed, 28 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 2ce67a8fd3..32931ea611 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -647,7 +647,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_ri32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
-#if TCG_TARGET_HAS_div_i32
         case INDEX_op_div_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_ri32(regs, &tb_ptr);
@@ -672,12 +671,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -903,11 +896,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
index a60fa524a4..842807ff2e 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -71,15 +71,10 @@ static const TCGTargetOpDef tcg_target_op_defs[] = {
     { INDEX_op_add_i32, { R, RI, RI } },
     { INDEX_op_sub_i32, { R, RI, RI } },
     { INDEX_op_mul_i32, { R, RI, RI } },
-#if TCG_TARGET_HAS_div_i32
     { INDEX_op_div_i32, { R, R, R } },
     { INDEX_op_divu_i32, { R, R, R } },
     { INDEX_op_rem_i32, { R, R, R } },
     { INDEX_op_remu_i32, { R, R, R } },
-#elif TCG_TARGET_HAS_div2_i32
-    { INDEX_op_div2_i32, { R, R, "0", "1", R } },
-    { INDEX_op_divu2_i32, { R, R, "0", "1", R } },
-#endif
     /* TODO: Does R, RI, RI result in faster code than R, R, RI?
        If both operands are constants, we can optimize. */
     { INDEX_op_and_i32, { R, RI, RI } },
@@ -156,9 +151,6 @@ static const TCGTargetOpDef tcg_target_op_defs[] = {
     { INDEX_op_divu_i64, { R, R, R } },
     { INDEX_op_rem_i64, { R, R, R } },
     { INDEX_op_remu_i64, { R, R, R } },
-#elif TCG_TARGET_HAS_div2_i64
-    { INDEX_op_div2_i64, { R, R, "0", "1", R } },
-    { INDEX_op_divu2_i64, { R, R, "0", "1", R } },
 #endif
     { INDEX_op_and_i64, { R, RI, RI } },
 #if TCG_TARGET_HAS_andc_i64
@@ -705,10 +697,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
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
@@ -748,10 +736,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
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


