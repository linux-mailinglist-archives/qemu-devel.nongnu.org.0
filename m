Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B31830E9FD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:12:00 +0100 (CET)
Received: from localhost ([::1]:46178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7U7i-0001nB-An
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tj1-0005IY-RV
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:31 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:38328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tin-0003vJ-5i
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:26 -0500
Received: by mail-pf1-x430.google.com with SMTP id y205so1075141pfc.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WwtU4XN3I/7BQWEoh7IwoY3+ESrnoHkEE2Q1sU/eyYI=;
 b=jUaSU7TB1TnycY8zIj9HVapyoDHalm5npBGBVq6N50IDErN5Fcx9aKMXf5lrqKijDk
 m9VSBXhanqEQsClO7iwc47IlJgkuPKhhn3tAdFixoSAAMNOYysnvq0WmmwnY478HCMtG
 IwGHQwxGEtvrxvUfIUXSLO4HMTkn0hWF4DbbbslEDOD1UxWFlhLCXp4Fu83kmCbkzedB
 /C7GjvqqQxFa6KSHkwzDjArlIwKKZ2wrOsmr7alA/5pRZU5dART/ZNENQSzAHb9r3u6g
 /6XcaHMraHqdDW11ZXmFUrvK/tvTBrOXBM7akbsKhJKgyeyJ1eQaEXi1bzV9pC9ccWj4
 Ye8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WwtU4XN3I/7BQWEoh7IwoY3+ESrnoHkEE2Q1sU/eyYI=;
 b=Xx/O2WA/wEgpBayIoZ8Q8whUDmJ0aZ9XmXC8434Ia4FdZ9GIxTeag2RM/RieavimH8
 VY8jOhYf2QsqqPjoApCeeSigPag392KtX+NTdN0XRWNAmQxVrUlMAuFCurBTwkZj0qQy
 shv9r4fYPP9q7oTvft9QqD5sECafXpcZyfMuD/+QzOdGPjrc6QbCJRrQ2XEJwHf9Iovj
 t/MshE+KvIwt+wRpQtvu1CSXKCuLU8EIsPfND5bx0oedu7oMx4JxOiuQJQpXlwaH1qFX
 /pDrDx+J9ghVBlle1uMc6b7VL+L7jS47LjeR6yxirpWEoS2Ip2JWPhkFcoWOO49Vccht
 rCeg==
X-Gm-Message-State: AOAM531JwC64HHzFIqoTZrLm45R3B/nd8TVgWCNOk8pUVF94pRpHrBYc
 6+Xck8nhUPYyBeqDyLTv6XocaWNYPB1xi5iZ
X-Google-Smtp-Source: ABdhPJw0p2vAZuan/NAlCuAKFpbp0Pp6zmeR0N9b3QLg2me1SPam2V2z9go742k2t9bQ9Pc4ERKaFA==
X-Received: by 2002:a63:43c6:: with SMTP id q189mr6565356pga.245.1612403171906; 
 Wed, 03 Feb 2021 17:46:11 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/93] tcg/tci: Remove tci_read_r16
Date: Wed,  3 Feb 2021 15:44:09 -1000
Message-Id: <20210204014509.882821-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Use explicit casts for ext16u opcodes, and allow truncation
to happen with the store for st8 opcodes, and with the call
for bswap16 opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 25db479e62..547be0c2f0 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -71,11 +71,6 @@ static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 }
 #endif
 
-static uint16_t tci_read_reg16(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (uint16_t)tci_read_reg(regs, index);
-}
-
 static uint32_t tci_read_reg32(const tcg_target_ulong *regs, TCGReg index)
 {
     return (uint32_t)tci_read_reg(regs, index);
@@ -157,15 +152,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-/* Read indexed register (16 bit) from bytecode. */
-static uint16_t tci_read_r16(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    uint16_t value = tci_read_reg16(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 #if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
 /* Read indexed register (16 bit signed) from bytecode. */
 static int16_t tci_read_r16s(const tcg_target_ulong *regs,
@@ -526,7 +512,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             *(uint8_t *)(t1 + t2) = t0;
             break;
         CASE_32_64(st16)
-            t0 = tci_read_r16(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint16_t *)(t1 + t2) = t0;
@@ -716,14 +702,14 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16u_i32
         case INDEX_op_ext16u_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_bswap16_i32
         case INDEX_op_bswap16_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
@@ -924,8 +910,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16u_i64
         case INDEX_op_ext16u_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext32s_i64
@@ -947,7 +933,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_bswap16_i64
         case INDEX_op_bswap16_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
-- 
2.25.1


