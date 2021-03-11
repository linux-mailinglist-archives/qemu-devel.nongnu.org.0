Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0336433762F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:52:21 +0100 (CET)
Received: from localhost ([::1]:43966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMfj-00007U-Uh
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUC-0003Kp-Om
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:24 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:40806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMU8-0006Jh-PX
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:24 -0500
Received: by mail-qk1-x72a.google.com with SMTP id l132so20781125qke.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tWt9l+M7f3QWN4u3GyxAdQRX+QI3GedTTpv25vEiGn4=;
 b=uncqWWaG4vFNjsTbWwBxi1WegtDF/Dcp8KM5CPWIRM6DXXMXCRBa7O33+P1ODJAPlU
 AEkRtcLi5MNvLj23S5y3PYpjeT4ANf6DTWmj64d5nMZWAJ1hnGBiRtbHrlgOju6/9XyI
 ulqkqTsOwDfPbuIljf4yZbxN/w/m43qA/e9P6fpDqPqM4Fqodfxr7FJoJo4cgYGY7uR8
 x+yUXAgZ3WJRCoJPCoSHp1VM8IfQ0T+rfkW5ZeCTW1jw1ObljS7GTajfXMwLBOtdHumY
 RNsvmhRF6ZEy8RKVtdBziLUnkKd0vvTB3spi8d5s5ha71f0h9NVPiLtYwLcJJiq8NUWx
 UkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tWt9l+M7f3QWN4u3GyxAdQRX+QI3GedTTpv25vEiGn4=;
 b=srX3GWQqVP1+pM2hBr4E/SFXNHfwyIILFSHxh31yTNUxUeqsba9KJT8N45myOya+Km
 qj/fg88ziedMltDChcQ+xsStnblj9eZ06hblgEqED/lPud2TT51F6tCgNiYTrUbaD3JK
 FOSLgyQTNOr3MhNqgBKmo/uZRtskpe8W+IN7wAsP4sJi2itfcr8nOJN9/uu01DJ7FQ4i
 ePzhaKiW5l8+JjJR4XHQ9j7jmhnDpQUjIsjCsNvqK5gxPLAydpjicqdmALX7HtengQjb
 pHnTr2ltTuAySFyIfRrMQ+mz4BoH0XX1GhS4CE/rBKch4qOs26F8aFbn5INGJ9/hUXPX
 8o9g==
X-Gm-Message-State: AOAM532YKtiwpuwcFi/x+E7108xPpewzPCDgwTR/RIHUvfShCUSNHpvW
 Cp0NK9h0Z7NedbGqA6qfthI4orf5uFtckKtM
X-Google-Smtp-Source: ABdhPJydwTdWGrT35HHeslrULcxlL2yR3wxpVMKW1H9lPeCd1EaN8WY5frelFJ4rqAat0YXTFpxIXQ==
X-Received: by 2002:ae9:e502:: with SMTP id w2mr8018921qkf.75.1615473619032;
 Thu, 11 Mar 2021 06:40:19 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/57] tcg/tci: Split out tci_args_rrrr
Date: Thu, 11 Mar 2021 08:39:16 -0600
Message-Id: <20210311143958.562625-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
 tcg/tci.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 8b38687d9a..10f58e4f25 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -237,6 +237,15 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
 }
 
 #if TCG_TARGET_REG_BITS == 32
+static void tci_args_rrrr(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+}
+
 static void tci_args_rrrrcl(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGCond *c4, void **l5)
 {
@@ -659,11 +668,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             }
             break;
         case INDEX_op_mulu2_i32:
-            t0 = *tb_ptr++;
-            t1 = *tb_ptr++;
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tmp64 = (uint32_t)tci_read_rval(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, (uint32_t)t2 * tmp64);
+            tci_args_rrrr(&tb_ptr, &r0, &r1, &r2, &r3);
+            tci_write_reg64(regs, r1, r0, (uint64_t)regs[r2] * regs[r3]);
             break;
 #endif /* TCG_TARGET_REG_BITS == 32 */
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
-- 
2.25.1


