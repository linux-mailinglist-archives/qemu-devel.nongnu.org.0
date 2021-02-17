Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE731E070
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:33:46 +0100 (CET)
Received: from localhost ([::1]:44088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTW5-0001Ia-8T
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTKj-0006vX-0y
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:01 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTKg-00076n-Qp
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:00 -0500
Received: by mail-pl1-x631.google.com with SMTP id e9so8041724plh.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EgfsM+xDw/5+yMWEqnFKIWyZYHRInwuGtrXJDDW2BOY=;
 b=bp59r9W52AqrOpQmmWqIIz2nu1XMR7KvXlp91r09l/gU3hlTAWA1xE8mGel3Vk0+JX
 bDey9MsJYU8GpqufIkdypXxzLxKNnCpAARQHmR+QhehuqCEMpfCmIXn0qakSUK/VlKeQ
 Qyhc3+oG0IAFzLG1UQt2Ifu0S34d+oWUasRs9/cC/ZUNd54wjiFFEUym/fHC+5o2DLqc
 vqHTvX8hmf6Fm4QsiukwAPpFvxNDF2blO2smwjcHmhSB9wPHdK+RsidtKSkAH0wgyl0F
 BcQXDNRnxHTnLu2w4lq20vaa0kBXqn2zI2tMb2+spBVRg3IQJAxos86fq8PDDxQugwNj
 9i6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EgfsM+xDw/5+yMWEqnFKIWyZYHRInwuGtrXJDDW2BOY=;
 b=GvFsapBe84ih1ILfiHw+a+BQPx9o7GpbThbe2iFMabXlmTHHBuw9y8XHKCMC5CssDf
 V10PG0hBB5cbNd3dJxKeWoSF8J9PsaGo1LJ8JKK2TltAGmPiRE+Wya4gjwj7K07OdWuY
 +jehRHeNFLeFDV+ExmejL95egBUYJUgValZ8q6JD8oWDaxn04SDZzKtI9YOnFXU0W3wG
 gfySciaHq3REM57g8qOtMn88ziA3EaBYj5z88ldQCVete+lE8Pr27ChxdYWIjdW+GoCu
 vwLIhHCpF93nCpmqQZn2PoaSbRVmBCR42aDswpYYIEUVuDuGNEq+PEo3dTutK8iGZdAh
 F+xA==
X-Gm-Message-State: AOAM532E+nWpXxAvM/4s5bmJYrjDAxn9iTTOJqaeQpDI8JIeeseG52Nz
 j0fQ7jlTw3pzbuGxJXLICkKxIsY0K52NAA==
X-Google-Smtp-Source: ABdhPJxU7AZwomfcOcTl6OB6ht9ZNjism8A2+6cr5W+2JxTlGotLVR3/2NUcgol08qC86cPnAcXQ1g==
X-Received: by 2002:a17:902:9a48:b029:e1:268d:e800 with SMTP id
 x8-20020a1709029a48b02900e1268de800mr905692plv.69.1613593317614; 
 Wed, 17 Feb 2021 12:21:57 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:21:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/71] tcg/tci: Remove tci_read_r16
Date: Wed, 17 Feb 2021 12:19:32 -0800
Message-Id: <20210217202036.1724901-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Use explicit casts for ext16u opcodes, and allow truncation
to happen with the store for st16 opcodes, and with the call
for bswap16 opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 7325c8bfd0..2440da1746 100644
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
@@ -509,7 +495,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             *(uint8_t *)(t1 + t2) = t0;
             break;
         CASE_32_64(st16)
-            t0 = tci_read_r16(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint16_t *)(t1 + t2) = t0;
@@ -699,14 +685,14 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -907,8 +893,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -930,7 +916,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


