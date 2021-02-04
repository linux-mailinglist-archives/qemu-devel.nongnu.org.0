Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D577530EA02
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:13:30 +0100 (CET)
Received: from localhost ([::1]:49984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7U9B-0003Y7-SN
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjH-0005Ph-1K
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:43 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:43291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tiy-0003wu-7d
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:36 -0500
Received: by mail-pg1-x52e.google.com with SMTP id n10so1016116pgl.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b0OZ8HZNEJw4TVjXNMfY9ukiBorqmrftQz6h6YJ1/P4=;
 b=JJNu6sHIoxvJg2SQXw3I2nYZ/AS0Nqi/b727N1o+HDijO2xALKqZ5ocBx3E0bMJdHh
 xq3eYZcKr3Cz6ZKFudiLPWEhS+3tkn6g28RNUSuTiuJCgMxn7lvpiGuIIBQeIqM+VP/n
 FhWoUi9/sEyhGirknOLFWPBZE7GmWJ8BjiXSApQ+gcuQVNMRKKcy2sDSQHk04Tn3Phnx
 VKiFPsDM3sv+B27HLjdI98FoHVit1dctxGXwwjcj+aNGIxcld6/613cqKSDUTvGP9T9F
 Dv4XlhXDo0qSfRAeV7VpZtimytg37V3pNYeQrPZma54Ukcl605bbxiOK4zJ6GaRH5zjS
 39Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b0OZ8HZNEJw4TVjXNMfY9ukiBorqmrftQz6h6YJ1/P4=;
 b=NoZeSeTeUAe9ntedKeoaow+W0mTFq5r7Ra1nrgHuAzCicEddGAoJhwZIy2XPMPrtlY
 5V+00lT7PgbJvI3vyukEfj7eOeVnGTMBYEJF7XFu45k3g1mg389a4SpUyG2mKikUqJVm
 IZrfnuxsRknrmIxun/4lGg55G7AxNAK5054GMa7YE3toJ6+jILBn7skKRCcxpeO38irq
 F97y6VxB3aSBLbSFPNAEs94JR115OgfQLGJdiiRsRSmL/lIrRB+yM6kWZT3fqmig1tCi
 n9Oej3iLs+yQ5cRUAY99PdkUMcllznbdVcDCnL3se3g2ApGAIMoUnR4vVeGxoCaWuxa4
 DZ3w==
X-Gm-Message-State: AOAM530iyz41hVvPzw81TcJdxrkA0OHR5r71r4PRdOOcb13j+NiG+XhA
 VSstcheAXLl0G36iVWX3IP9Wb3VUonEWPeuX
X-Google-Smtp-Source: ABdhPJyINdloymCbiCC88YjC7KTPp3iAgaoI5pYg83MLCmtnvkGOc2MN09YzOxo8dl+/CEz1YdiRjw==
X-Received: by 2002:a65:648e:: with SMTP id e14mr6492744pgv.453.1612403180967; 
 Wed, 03 Feb 2021 17:46:20 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 38/93] tcg/tci: Merge extension operations
Date: Wed,  3 Feb 2021 15:44:14 -1000
Message-Id: <20210204014509.882821-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This includes ext8s, ext8u, ext16s, ext16u.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 44 ++++++++------------------------------------
 1 file changed, 8 insertions(+), 36 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 894e87e1b0..cdfd9b7af8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -624,29 +624,29 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg64(regs, t1, t0, (uint32_t)t2 * tmp64);
             break;
 #endif /* TCG_TARGET_REG_BITS == 32 */
-#if TCG_TARGET_HAS_ext8s_i32
-        case INDEX_op_ext8s_i32:
+#if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
+        CASE_32_64(ext8s)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int8_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext16s_i32
-        case INDEX_op_ext16s_i32:
+#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
+        CASE_32_64(ext16s)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext8u_i32
-        case INDEX_op_ext8u_i32:
+#if TCG_TARGET_HAS_ext8u_i32 || TCG_TARGET_HAS_ext8u_i64
+        CASE_32_64(ext8u)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext16u_i32
-        case INDEX_op_ext16u_i32:
+#if TCG_TARGET_HAS_ext16u_i32 || TCG_TARGET_HAS_ext16u_i64
+        CASE_32_64(ext16u)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint16_t)t1);
@@ -796,34 +796,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 continue;
             }
             break;
-#if TCG_TARGET_HAS_ext8u_i64
-        case INDEX_op_ext8u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint8_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext8s_i64
-        case INDEX_op_ext8s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int8_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext16s_i64
-        case INDEX_op_ext16s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int16_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext16u_i64
-        case INDEX_op_ext16u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint16_t)t1);
-            break;
-#endif
 #if TCG_TARGET_HAS_ext32s_i64
         case INDEX_op_ext32s_i64:
 #endif
-- 
2.25.1


