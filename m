Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61540312900
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:40:43 +0100 (CET)
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wTi-00037D-Dx
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRB-00017b-9l
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:05 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wR9-0005iK-Lk
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:05 -0500
Received: by mail-pl1-x62a.google.com with SMTP id y10so7018885plk.7
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r7Bqt7XeLpJxFziax4YcAvS468lSm4SfB1qZvFnNDEY=;
 b=kUgTCcYQ0K/MS0zvZUBPNlcNLrKrsRDQN11BeVg84JX29lK5q4ErlNDB+xXwhOAVuy
 p+9SOjmsWtTU9odnzsPVPtU/iXHN87SgIG5BSZPuh0ywjed61xvs0F4IiqQcqJWh74aq
 ZLVn4wOwi/6JOZInD5m1aQkLDtqF6WNftdvLju0tI0OuXZyo8WDCvR0kSv223QoG7jbj
 dol6seKxyNkKE5Spq6S9X1UZpymYejcnhTZv1aldhoWo1EjxMllBRsLgj9LXlSyP3wGb
 ee8wVfOO120+MAld89lyEBQYUV5u6X5VtmzrinndjXt7XumhONs9bxVZ8kPiYFOXgAYT
 +yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r7Bqt7XeLpJxFziax4YcAvS468lSm4SfB1qZvFnNDEY=;
 b=muRPUtqNf5uyPHfbFjHwpyYty7LqpgFwvi1139wVYEZV2Yz779kIJioFe5W+dNPTpP
 jo9BCTCvAAhl/4W4tA+AvFMbjPyOFDntSXPaqs3FA42RsOVw7HU2HHjHxkBiBd15xLrF
 JaLCpN3YEs2FbHYZlu/Wr4q9SfvmcDlvRyNNxWkHyIi2FNx8zCOt7QeNXs/yED96pqDs
 beKr3mFx8KTkNVdhnEOzqVl6KK4GBAZtw5b7tHduT24BWq9ND6cRBpiPzB2lmbAwARCD
 PU41Vo88Y9RZTeMHN7DdG89Pu9NM9RS2ZhYahR3jS097lP64aq60rpMMTPCtYidyWUPn
 G8dA==
X-Gm-Message-State: AOAM530K8YYohnlbtEQOGIPOYKd0nYcLnfgARHInbWLJxoF4tO8IoP2l
 8eTtS72KOdAH+09cNmc+UFFI34FQwbaRUQ==
X-Google-Smtp-Source: ABdhPJyqwM3UEf0WHYD8h/fuWSPyl0hlflK/ayo+aBOASOEFXYiJkyLoaGhmR6F9KLLBIvFMjG9VfQ==
X-Received: by 2002:a17:90a:d34b:: with SMTP id
 i11mr14627214pjx.235.1612751882411; 
 Sun, 07 Feb 2021 18:38:02 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/70] tcg/tci: Remove tci_read_r8s
Date: Sun,  7 Feb 2021 18:36:48 -0800
Message-Id: <20210208023752.270606-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Use explicit casts for ext8s opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index c44a4aec7b..25db479e62 100644
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
@@ -712,8 +695,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -927,8 +910,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


