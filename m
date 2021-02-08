Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0413B312907
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:45:44 +0100 (CET)
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wYY-0001Y2-Jn
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:45:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRG-0001Fp-Lx
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:10 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRE-0005jm-99
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:10 -0500
Received: by mail-pf1-x42d.google.com with SMTP id u143so2536472pfc.7
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ybRVe+0cbcMgdImiuixof8hM4eoxKsh03sT+tgpyyEY=;
 b=cAi50Qf84e7nSx599Ea0JBKI7RNk32ZqRh46M7ZyXA3wqsmCFgu7W+s4EQ5/9j3chI
 650fY7eVAD0G2dYn9grBVIezjjJj7NroZCgYsnuoqBnlywodg6d67omJZ72dxtAKTPTa
 jL0fjCd5T/JzTMqE63NIbYu/RgWvr39Ui1zeQMX/V2kLb/hzJMh0OTgB2l6MRM1fIJqf
 DiuPVn47BRGnbld4ryLFImaLR5y2Af+268fcC3+RpukIoZ4cBg0FiT3wpjl7Oviplepy
 bzyqH/u1Yz2r+8F34T/HY76VUEB5qOOlb9F7k+rROL6FA9LF6vAbZW/KwG2NiTmLqTdh
 O88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ybRVe+0cbcMgdImiuixof8hM4eoxKsh03sT+tgpyyEY=;
 b=T1vPfNVqfPN6E2YSVLB+PA2sezVxHiGRfDBN2zJ8oy4EIkjMMsXn9hkpzxwcDynd0Q
 njIKXFH5D3D3J0vslukbbtfjYXXdkdrAoTTdRjRBH8tY3lAs6twYiVova5vb0Wql8x7b
 vgkUCg9b1QlBCNctpKVBhWFKj8mOz2NJNayswQkAO/HXJINIYf9p+VsHBqWd+lGq5kA3
 0HbCpyxwKfQX1ZDcjBd8xC0oxz51kp/H2UpmW8LchhOP1WouMLdqoxUJzbRGBohBEJjr
 Ewotqc6JFWIcsySSTjEaGjSYVxVKo1yiPfuBWbuLvFhqw3XkpnFMrS2O9m18h6mzfQqV
 /X8Q==
X-Gm-Message-State: AOAM532tFn8Gr2WxllQm41os894/wlNrA5JjYDPufYKgZ7DL7Mucn8NB
 eOCQUkjvAGdOdxXvi+kVnmM91Fti8eat3g==
X-Google-Smtp-Source: ABdhPJwV2BXmlb6tf6qy+gCpOoLDOimqQ/RiCNtvBKjdZjwMygEcinRgXUYN+eDeYG4i6/hWBcNgHA==
X-Received: by 2002:a63:1f21:: with SMTP id f33mr15477808pgf.31.1612751887028; 
 Sun, 07 Feb 2021 18:38:07 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/70] tcg/tci: Remove tci_read_r32s
Date: Sun,  7 Feb 2021 18:36:52 -0800
Message-Id: <20210208023752.270606-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Use explicit casts for ext32s opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 72ec63e18e..9c8395397a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,13 +57,6 @@ static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
     return regs[index];
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (int32_t)tci_read_reg(regs, index);
-}
-#endif
-
 #if TCG_TARGET_REG_BITS == 64
 static uint64_t tci_read_reg64(const tcg_target_ulong *regs, TCGReg index)
 {
@@ -149,15 +142,6 @@ static uint64_t tci_read_r64(const tcg_target_ulong *regs,
     return tci_uint64(tci_read_r(regs, tb_ptr), low);
 }
 #elif TCG_TARGET_REG_BITS == 64
-/* Read indexed register (32 bit signed) from bytecode. */
-static int32_t tci_read_r32s(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    int32_t value = tci_read_reg32s(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 /* Read indexed register (64 bit) from bytecode. */
 static uint64_t tci_read_r64(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
@@ -887,8 +871,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         case INDEX_op_ext_i32_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int32_t)t1);
             break;
 #if TCG_TARGET_HAS_ext32u_i64
         case INDEX_op_ext32u_i64:
-- 
2.25.1


