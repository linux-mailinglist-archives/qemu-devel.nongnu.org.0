Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6A9312922
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:03:31 +0100 (CET)
Received: from localhost ([::1]:60352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wpm-0002u5-0X
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRn-0001fx-TI
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:43 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRc-0005sE-Ho
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:43 -0500
Received: by mail-pf1-x434.google.com with SMTP id q20so8752554pfu.8
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nLwOsyO0LIePZbanFLMg77EMdmZd3QPy/SBwJ8JDkus=;
 b=PJR28Wf/Mu/cRJvkPbAtCL+q5QDVf+hHtlp5JOQLbZ0P1Ku4zWe4F5KAAuEHvqknfU
 XxFyWF3nfVB+kXQVZ/GgHd1LuPcsP3HCaaQWP6rOnfi30vip37G5AN5o/OtSzoUo3QVD
 xFX9JmIUs6khv8TGQL1+rLGEYZ/HdCwGN0gduWzUcEaHkoPCvjGQ1B4BCPhMMlQYrBGf
 xCqe+bVy3Rslie7kTGcNZe135sZssQBFIYw3nI7uZxm1iLrrd5ax6Nmov1nY04vOEBCY
 mMuUXdm+NUqbjiR5hifnthAoMxmpDCGuAR4S3ZzECBwg0zMKmM+XiaJlfjRUUe4N9OCk
 6e9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nLwOsyO0LIePZbanFLMg77EMdmZd3QPy/SBwJ8JDkus=;
 b=CG7UH5gyqR6xFHFOBxi02ANlIytNL0f0f5PWgw+M3LYybFAFvEXWl49AgpHldjtFMd
 P8JNXQ/V7y6IcrDG0pjAoLO9+ZKLInEyy5thwNhK3H+nKVxxeh9Nur0crZQ8NnbbBeE8
 thElQNQ9dozNhkFpffWPffoR3GuVfdBLP/p9npzeCKxfEsRR2jLjl5TEJu29IQ+FAEBW
 yOU+B9rTNBCbuwi6H8HmfeAQDkaYncEddHpsPdzmT2gRs0UV5pNkXR0UCfAhII6mmN5J
 SjtqpJaF80jjAZWOhGquaTrx3+26UxG87kaIG2eLF3ZGM3ghm+4IeN9a2irgaWuAaGgO
 whzg==
X-Gm-Message-State: AOAM533qbHShlvxCs/MFZkuPcWxiFvu2zYbfueJtaVwfKylqE/cmakgf
 E9B8a8++83FvvHAVeWEZdaQy5No9RRr0ow==
X-Google-Smtp-Source: ABdhPJxQt7wOF8KwBa8UZA3RuznOWPJCb75shl8zmbG88LdgaMUy7t20f78LltX1p3SCKvI4Jw6ZyQ==
X-Received: by 2002:a62:e407:0:b029:1dc:1ef6:b2da with SMTP id
 r7-20020a62e4070000b02901dc1ef6b2damr4547570pfh.67.1612751911227; 
 Sun, 07 Feb 2021 18:38:31 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/70] tcg/tci: Split out tci_args_rrrr
Date: Sun,  7 Feb 2021 18:37:12 -0800
Message-Id: <20210208023752.270606-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
 tcg/tci.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 84d77855ee..cb24295cd9 100644
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
@@ -676,11 +685,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


