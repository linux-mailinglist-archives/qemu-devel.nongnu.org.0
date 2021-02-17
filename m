Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EA331E097
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:37:14 +0100 (CET)
Received: from localhost ([::1]:52916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTZR-00055j-LO
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTKi-0006uw-4u
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:00 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTKd-000764-Ap
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:21:59 -0500
Received: by mail-pf1-x42e.google.com with SMTP id z15so9168030pfc.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s0epI5FYzBmDpaBBAxqnrVAuCgvURTvdHnKLPkRQG1c=;
 b=cCumBb77wX/VN/L/pDIDQjHxcnjs8CAweag3x/iTLSBKFSo404ZjZzHZX+QRz+w6mL
 7019CoNVmMNXLFwLz3LCljhdJL/4RlFwi+Sn1H1Ln7Ly1/giqbP53RBxZY2fmc03F7WS
 YUVofdpH8Y5quYrNqklHJHGm0TqjgxopyrFUJM7eKKAeGnpLP+00BQKQF78i1d9UeQvd
 aHLA8n66Ajzn1cGQ9IjBulyi1gkdstA8q3hKLWRv7RWOg9wIRWrhJGbz6i1HiEj3HKxP
 3cCFbcI2lQyfiLbF/JBXR/P5k377PzNKQyqTZCIUMOV46m/MKupEzlXlX5Tamy0KvZ7r
 /1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s0epI5FYzBmDpaBBAxqnrVAuCgvURTvdHnKLPkRQG1c=;
 b=eaXZfN6DBwFldinbl3HvwXHc+ut0I6YmP1ejAu3ksQHZTFogsF0nE7gjv/jW7C86k4
 Gfo6wEeWKRcbJ7pjuDtd9WECf7zJkpw/Xhrf7Rf04mUJn9hcXQoODaLYjP0fv95Bv5gx
 DbsTyp3BeRC/uU/IefwHMFF1Nib9HA3HgxZmUfnv3ao/SbyVKmu4uR3Ap75j1z3+SNxi
 WX5w5oCxg1HVBPbXmQGBNo4twK/7CsRBfZW2z3uy/L15PsU+21NsDPJrzsO/18RsrKnB
 lQa0MJt6Lq3QmAZrYZeoQJDPlrAUE4mmB8zH89/6wUh34wangbM/lb4pCy/iwVd6QduO
 Ezlw==
X-Gm-Message-State: AOAM532OCBOnwmezVro0TgaADC/MSWgiINL5LSBxmfAnds6MTidX7QAM
 QLLnHVUhMynQgqCIHKVq9ukmTzfVO0/Rhw==
X-Google-Smtp-Source: ABdhPJwcOG3650455PWUxfYN810dnzkYmEZaOhmQZR1yv9pDvg7F+okUi1v8beoMWc1WaCYt8OPdOw==
X-Received: by 2002:a05:6a00:7cf:b029:1ec:d659:e55c with SMTP id
 n15-20020a056a0007cfb02901ecd659e55cmr940730pfu.69.1613593311967; 
 Wed, 17 Feb 2021 12:21:51 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:21:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/71] tcg/tci: Remove tci_read_r8s
Date: Wed, 17 Feb 2021 12:19:31 -0800
Message-Id: <20210217202036.1724901-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Use explicit casts for ext8s opcodes.

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


