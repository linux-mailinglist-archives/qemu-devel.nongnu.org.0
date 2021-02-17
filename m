Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE1831E0A1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:40:54 +0100 (CET)
Received: from localhost ([::1]:33478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTcy-0000Ft-2G
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLX-000893-AD
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:51 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:42721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLU-0007L0-Gj
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:51 -0500
Received: by mail-pg1-x52f.google.com with SMTP id o38so9192480pgm.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R2pchzDBkrNufC2Bz/6i9wxXtvGi5yfeV/PYKcIix9Y=;
 b=cHVkgJi7HJHMLSwOoO2W+4kHwo0GwDFA14C1bo4zUsihRCbjquoQaRF+9pc4U9Kx9d
 kTEZDEzw5J8LQXIYL5Mv2gIvn0yumTwCU4gslHr7XsY2vRX8qUaroJZD/U7h5OgnjmOC
 Wxi5p38UQGna3VSic4QCPY1rYrMi6Af2gXEhHk1r5bc76N7klP+tG1XIFZDGMy9A6n9c
 pfwCWDxNETvo2SxCY1hz+pnwRrjVT1gvoTtPhlmtrSoxQclAjrzNv4n8mmh2nbcYTume
 ehguw6jLtGMdZpBY4UiHyx6O4NUptskDm8dLL+t/Ut0+RFfc+jNZzBomrJldXMY5AZVT
 8BGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R2pchzDBkrNufC2Bz/6i9wxXtvGi5yfeV/PYKcIix9Y=;
 b=iUOUssRnLmTVki3Q6SsoEQeyML3uTOHX5Ajc17yOoXDmtDDoux1pVcOq0sJcVmGOvt
 ZQlFZLVub4fMO+NHKy5cpVptbrc9ARxaZaq1ZreflhcUnJg6I6o+sg3CqQm5NhyrJdf+
 L5cRNyWgmjoCEU8wxVsroTBxaoCIsrBXSZNs67xuskqE2pbUjkJgVdB7iSZlM+t1C3YD
 uyAJALpLVXSEpcLUpzxB5R3aK+gn1xSCFxxvGpeQ2VBqTPDqyk2YPB97U5arLkQMOdhc
 avh6zE3aw0vn/3TWmumEBhgc5olhu4pBDA30Emcr0+fe9w1twGAssVWKmwm8kBhhcagU
 i+dg==
X-Gm-Message-State: AOAM533Uko4BtOlFAKzGfWD1wStNTEpqQQQBOG58Uqte9tdn1zrJMa0/
 Ib531XD6iEcvokDJbxOVQyGz3/4HbXPwxA==
X-Google-Smtp-Source: ABdhPJzJidBuqVz4OezJWuRC//PS2o2OGROrdMppyRsA4V+109gdwIeJdmkcz3eviTXWO7rNhXrO7Q==
X-Received: by 2002:aa7:8d05:0:b029:1ec:b460:f21d with SMTP id
 j5-20020aa78d050000b02901ecb460f21dmr1014943pfe.29.1613593367228; 
 Wed, 17 Feb 2021 12:22:47 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 25/71] tcg/tci: Split out tci_args_ri and tci_args_rI
Date: Wed, 17 Feb 2021 12:19:50 -0800
Message-Id: <20210217202036.1724901-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index c8df45ce28..cfbe039fa6 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -121,16 +121,6 @@ static int32_t tci_read_s32(const uint8_t **tb_ptr)
     return value;
 }
 
-#if TCG_TARGET_REG_BITS == 64
-/* Read constant (64 bit) from bytecode. */
-static uint64_t tci_read_i64(const uint8_t **tb_ptr)
-{
-    uint64_t value = *(const uint64_t *)(*tb_ptr);
-    *tb_ptr += sizeof(value);
-    return value;
-}
-#endif
-
 /* Read indexed register (native size) from bytecode. */
 static tcg_target_ulong
 tci_read_rval(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
@@ -180,6 +170,8 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   tci_args_<arguments>
  * where arguments is a sequence of
  *
+ *   i = immediate (uint32_t)
+ *   I = immediate (tcg_target_ulong)
  *   r = register
  *   s = signed ldst offset
  */
@@ -196,6 +188,22 @@ static void tci_args_rr(const uint8_t **tb_ptr,
     *r1 = tci_read_r(tb_ptr);
 }
 
+static void tci_args_ri(const uint8_t **tb_ptr,
+                        TCGReg *r0, tcg_target_ulong *i1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *i1 = tci_read_i32(tb_ptr);
+}
+
+#if TCG_TARGET_REG_BITS == 64
+static void tci_args_rI(const uint8_t **tb_ptr,
+                        TCGReg *r0, tcg_target_ulong *i1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *i1 = tci_read_i(tb_ptr);
+}
+#endif
+
 static void tci_args_rrr(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, TCGReg *r2)
 {
@@ -481,9 +489,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             regs[r0] = regs[r1];
             break;
         case INDEX_op_tci_movi_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_i32(&tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_ri(&tb_ptr, &r0, &t1);
+            regs[r0] = t1;
             break;
 
             /* Load/store operations (32 bit). */
@@ -703,9 +710,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
 #if TCG_TARGET_REG_BITS == 64
         case INDEX_op_tci_movi_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_i64(&tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_rI(&tb_ptr, &r0, &t1);
+            regs[r0] = t1;
             break;
 
             /* Load/store operations (64 bit). */
-- 
2.25.1


