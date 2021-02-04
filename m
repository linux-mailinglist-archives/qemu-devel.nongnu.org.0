Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA5730EA1D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:24:10 +0100 (CET)
Received: from localhost ([::1]:47148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UJV-00067q-Qp
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjJ-0005Qf-Bs
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:45 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tj8-0003yd-QB
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:44 -0500
Received: by mail-pg1-x52f.google.com with SMTP id b21so1028664pgk.7
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SycMd2jWeSgxswrzk2jq/EmJnAdi6ZgvEeestJkdRLA=;
 b=LcynX8psXkzYNk3VoqoKQOagTyVjc12L4P6IvTI6/+BN3EwSwjgvHlydoGWzwE2KZ0
 q4i5Z2FI5IiIsaIH0TUciUybrAAoPrCHSifCyxbMvzgwFN7qr4hHypUNVUHyDOILMXvX
 UYtre4vvp3Y3BO7VMFPu7IuZ0pno85Fz5nXLHM+E+NUh0iJYvKgvqNih5+mc2iOyPhSx
 EAfBJSddK0YCkx426ch7EJcAbONJZQhxAmLH1MrivIg3z4lErwNMXmjh+biZOuQHH5/o
 d/DT2FlzMf2xn55tgd7Mwvfv+WgzL6RdX/coIXfcVyPpqaskmMJpunOHAa1O1kg/Mcck
 si/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SycMd2jWeSgxswrzk2jq/EmJnAdi6ZgvEeestJkdRLA=;
 b=RSwhlJ3cVkxCEQ56KoblO7YtOGQMS4Eh8gMPuNDQqwqUsWTwHvrfKW6cdCOe1Nd5Yk
 I8AW/9Cw5vVCoJBiaNkDdpk09d+lKCVzVoyicHcHA7KCulrIJH20LpmhvwSCcHQDUc99
 6AKvJNm6RNo6mnMCT6kk2TQdgqhV6ATcm+OfZN1C5yU1QPYmb001qEkxyv+j0U0ySYiy
 y3pNDcIRkKJtEqGj0Nr9fKhXKy4iTRoZxIljBpKmpQAUl/BU3Rg3crRFWdS8IAssbHOG
 LUT8sZSNzdV6ggrBiXZklt557CA+PLD7GZnCNilAlC5BsVWwG4yMO15v17q+hpql4yek
 eZ4A==
X-Gm-Message-State: AOAM532T7WwciARFE0H3RDLKSgGH0d5Y/vnGjhO7l2Ongs6K30qCUJgq
 XZaDsIOEclCqAa/26COa2Y5/ZfKi/3Wppe/c
X-Google-Smtp-Source: ABdhPJzvSkA4ZPXN5TvawIx8JFllGSgVDBHjINHs53vDXz95zHlEk8BagoZM9IXWsfDiDXegITwymA==
X-Received: by 2002:a65:4083:: with SMTP id t3mr6562345pgp.150.1612403191984; 
 Wed, 03 Feb 2021 17:46:31 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 44/93] tcg/tci: Split out tci_args_rr
Date: Wed,  3 Feb 2021 15:44:20 -1000
Message-Id: <20210204014509.882821-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 67 +++++++++++++++++++++++++------------------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index be298ae39d..0bc5294e8b 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -184,6 +184,13 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   s = signed ldst offset
  */
 
+static void tci_args_rr(const uint8_t **tb_ptr,
+                        TCGReg *r0, TCGReg *r1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+}
+
 static void tci_args_rrs(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, int32_t *i2)
 {
@@ -439,9 +446,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         CASE_32_64(mov)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = regs[r1];
             break;
         case INDEX_op_tci_movi_i32:
             t0 = *tb_ptr++;
@@ -652,58 +658,50 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif /* TCG_TARGET_REG_BITS == 32 */
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
         CASE_32_64(ext8s)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int8_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (int8_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
         CASE_32_64(ext16s)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int16_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (int16_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext8u_i32 || TCG_TARGET_HAS_ext8u_i64
         CASE_32_64(ext8u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint8_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (uint8_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i32 || TCG_TARGET_HAS_ext16u_i64
         CASE_32_64(ext16u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint16_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (uint16_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_bswap16_i32 || TCG_TARGET_HAS_bswap16_i64
         CASE_32_64(bswap16)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap16(t1));
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = bswap16(regs[r1]);
             break;
 #endif
 #if TCG_TARGET_HAS_bswap32_i32 || TCG_TARGET_HAS_bswap32_i64
         CASE_32_64(bswap32)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap32(t1));
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = bswap32(regs[r1]);
             break;
 #endif
 #if TCG_TARGET_HAS_not_i32 || TCG_TARGET_HAS_not_i64
         CASE_32_64(not)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ~t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = ~regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i32 || TCG_TARGET_HAS_neg_i64
         CASE_32_64(neg)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, -t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = -regs[r1];
             break;
 #endif
 #if TCG_TARGET_REG_BITS == 64
@@ -816,21 +814,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_ext32s_i64:
         case INDEX_op_ext_i32_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int32_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (int32_t)regs[r1];
             break;
         case INDEX_op_ext32u_i64:
         case INDEX_op_extu_i32_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint32_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (uint32_t)regs[r1];
             break;
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap64(t1));
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = bswap64(regs[r1]);
             break;
 #endif
 #endif /* TCG_TARGET_REG_BITS == 64 */
-- 
2.25.1


