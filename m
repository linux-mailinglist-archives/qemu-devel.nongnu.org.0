Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9F841082E
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 20:51:59 +0200 (CEST)
Received: from localhost ([::1]:48680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfRO-0005HK-Kg
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 14:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLS-00057y-4V
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:54 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:34709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLN-0006pp-2w
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:49 -0400
Received: by mail-pf1-x42b.google.com with SMTP id g14so12396080pfm.1
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nMBhe6wRyQJffJfKqR3e4B4BjhzuFHvBY7lYZ6XbL2k=;
 b=gMJHG5IGY0Go92Rn8xQnpykiF+BXx9y5AoInPCg6RLWbaXuFJDSIfh4uu1YMBLHNdW
 fF/25L6w6/Vn9HajjwdyUsN26WysJxG/P4F3ZwyVUIuO7qano3f1Wl9zNWvHUFiqyh7q
 XC3gH0zOTxfWzMaoMeWnecv1yBxilgUSkZ368F0DGy1mrLX5NAjYNuCNguKY4/hwMaQ0
 gAXQqqhdA9Ss9Lz+xVcXrgBtGB30fNY3e4Iw1d+w/bUKSdEQaDvknP/R60tvT/P9UIoJ
 B49GeUgOx8M1J6gwMNyQ2JJL+FcwaR+gAGp0rvhqz8SEYTfWNVBhTMcWgctVE79kQIlO
 Zv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nMBhe6wRyQJffJfKqR3e4B4BjhzuFHvBY7lYZ6XbL2k=;
 b=LyR0p9JUhsqDt0mr6IAMxwf6BVVeoyEPzyQ2TuDd089UJ2b4IiWK9g9jvMKV/dbvF1
 PtBTUiRiJ7uH2W+UT3QwujDWBQg0jr/qi7/dj97gVx1vToN88t4R/nQnjA7pRD9/ZaJO
 1oHoKXCtSJSvuxWD+5U70Bt9gdk9+cD+/iRqy2qzlnYd7L1nptEA0mKslBIjp24tjQDk
 gK2BEMrxiiOc8ViGstB6Dqg3LvvkkFAWfJNo89SdUrhoKnqEY5NT4osVPsLoMKeqm144
 sCuKGbfgSahz16WI43ZmhQhvYukFeRHaiLDoEOeZIQ2CQX46Oc/VaX1FX7oyIsENy1i5
 X/TA==
X-Gm-Message-State: AOAM5335xuIE0DJGQL5nC3XAdcoFV3af6i8zMy5sL0c3ylSOBdrNITj9
 QgJCO1QvteWdbLAruDS3sqqg6/fXj+fonA==
X-Google-Smtp-Source: ABdhPJylRsqv6Zoh4u7rWKpv11r8fMKBYD0C1OgCBT2cNEEjvVxl62kLIis7CcUzRqU39gnrxsduDA==
X-Received: by 2002:aa7:9094:0:b0:42a:ea30:5509 with SMTP id
 i20-20020aa79094000000b0042aea305509mr17464303pfa.30.1631990743400; 
 Sat, 18 Sep 2021 11:45:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/41] linux-user/host/riscv: Improve host_signal_write
Date: Sat, 18 Sep 2021 11:45:03 -0700
Message-Id: <20210918184527.408540-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not read 4 bytes before we determine the size of the insn.
Simplify triple switches in favor of checking major opcodes.
Include the missing cases of compact fsd and fsdsp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/riscv/host-signal.h | 83 ++++++++++-------------------
 1 file changed, 28 insertions(+), 55 deletions(-)

diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/host-signal.h
index 5860dce7d7..ab06d70964 100644
--- a/linux-user/host/riscv/host-signal.h
+++ b/linux-user/host/riscv/host-signal.h
@@ -17,65 +17,38 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
 
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
-    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
-
     /*
-     * Detect store by reading the instruction at the program
-     * counter. Note: we currently only generate 32-bit
-     * instructions so we thus only detect 32-bit stores
+     * Detect store by reading the instruction at the program counter.
+     * Do not read more than 16 bits, because we have not yet determined
+     * the size of the instruction.
      */
-    switch (((insn >> 0) & 0b11)) {
-    case 3:
-        switch (((insn >> 2) & 0b11111)) {
-        case 8:
-            switch (((insn >> 12) & 0b111)) {
-            case 0: /* sb */
-            case 1: /* sh */
-            case 2: /* sw */
-            case 3: /* sd */
-            case 4: /* sq */
-                return true;
-            default:
-                break;
-            }
-            break;
-        case 9:
-            switch (((insn >> 12) & 0b111)) {
-            case 2: /* fsw */
-            case 3: /* fsd */
-            case 4: /* fsq */
-                return true;
-            default:
-                break;
-            }
-            break;
-        default:
-            break;
-        }
+    const uint16_t *pinsn = (const uint16_t *)host_signal_pc(uc);
+    uint16_t insn = pinsn[0];
+
+    /* 16-bit instructions */
+    switch (insn & 0xe003) {
+    case 0xa000: /* c.fsd */
+    case 0xc000: /* c.sw */
+    case 0xe000: /* c.sd (rv64) / c.fsw (rv32) */
+    case 0xa002: /* c.fsdsp */
+    case 0xc002: /* c.swsp */
+    case 0xe002: /* c.sdsp (rv64) / c.fswsp (rv32) */
+        return true;
     }
 
-    /* Check for compressed instructions */
-    switch (((insn >> 13) & 0b111)) {
-    case 7:
-        switch (insn & 0b11) {
-        case 0: /*c.sd */
-        case 2: /* c.sdsp */
-            return true;
-        default:
-            break;
-        }
-        break;
-    case 6:
-        switch (insn & 0b11) {
-        case 0: /* c.sw */
-        case 3: /* c.swsp */
-            return true;
-        default:
-            break;
-        }
-        break;
-    default:
-        break;
+    /* 32-bit instructions, major opcodes */
+    switch (insn & 0x7f) {
+    case 0x23: /* store */
+    case 0x27: /* store-fp */
+        return true;
+    case 0x2f: /* amo */
+        /*
+         * The AMO function code is in bits 25-31, unread as yet.
+         * The AMO functions are LR (read), SC (write), and the
+         * rest are all read-modify-write.
+         */
+        insn = pinsn[1];
+        return (insn >> 11) != 2; /* LR */
     }
 
     return false;
-- 
2.25.1


