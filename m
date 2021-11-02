Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587BB442C8D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:30:16 +0100 (CET)
Received: from localhost ([::1]:49356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrzb-00030L-7i
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhre3-0003kC-LE
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:01 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:44738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdx-0000ub-SL
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:57 -0400
Received: by mail-qt1-x831.google.com with SMTP id j1so11231364qtq.11
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aVqSiCZ8VIDZCZNfC7lcfLdqkY20k4N+WRPXdiuKsNc=;
 b=vwCWarHqA2Ijem+Zxi+VVu0pdgqTICc/pHNWdL1rnd9qDyUvnF5wDJUIMSLj249RW/
 DnWXAnmnPTeu6BfLBQJoRARIYZv5enPNKVFpPMlcoNxoCqh1xAwiuoiIJQW6Tt6WpWfC
 S9a3pXvFdEC00R9wIKmUdto6pM2fhMYrtJQRJuJF33+BUUUIdxc4uMydVM53n6JHQoil
 QLYrwCKTgjMnRhXLHCpnsw+ZzGkgeZ0LVwYYzOAgiwuYp6vqtyAE/ELKolcT7uhfAMZ9
 3Yv6RkXn4ZftpEWW8vW6k1AIAexqOACNBPK3JiQY0hLUZrr4DWf5Y6+T82fCOXR62UcO
 exWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aVqSiCZ8VIDZCZNfC7lcfLdqkY20k4N+WRPXdiuKsNc=;
 b=AMPd/tIDGCqSy8gDl92BrKzPN2d3+gDYzL9MCvoxbqBTm1qjjAiBom6GGDZtWZD9Ps
 MjB42hKPTMr/b28KVt4/uRiJz3u4mlCl0nxLRIxBIUMDJOoptU5fAa45nTKk2aetkHCe
 yhSZKTUz9d2u+jLrvGHYpqTxqPO7OqznlqhSLStPKg9zzxif498W1SgxtOHUIqbkx7W1
 CTJEBgIEwSqr06V/F9+Ei8sDMA83htIHlYHgqiCmIB/GEM1dLgem0vhadZOTpWP1x4KG
 33x8jgJlRe/6pGBh7BPWnh27HKgR/bcPGEHQ1Zn8y2dk6prpQ7x0gx3aHAT2rGin16Pg
 zdPQ==
X-Gm-Message-State: AOAM532efNAXhsHnPw3RmlfRBgopoiqU9Z6ZiPggCq0N7pW/UsBn3uJF
 TlQCFxA2cszr2ZWHbpKMwFE/uB9EBkfQ3Q==
X-Google-Smtp-Source: ABdhPJxTpVHDPiskai7Vq1TYA3CmF+F2pMrA2KzHpBlhcJo8Yib4OBSQnhsnWcu5oALsblmLi6opXw==
X-Received: by 2002:ac8:588d:: with SMTP id t13mr37586638qta.179.1635851271731; 
 Tue, 02 Nov 2021 04:07:51 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/60] linux-user/host/riscv: Improve host_signal_write
Date: Tue,  2 Nov 2021 07:06:57 -0400
Message-Id: <20211102110740.215699-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not read 4 bytes before we determine the size of the insn.
Simplify triple switches in favor of checking major opcodes.
Include the missing cases of compact fsd and fsdsp.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/riscv/host-signal.h | 83 ++++++++++-------------------
 1 file changed, 28 insertions(+), 55 deletions(-)

diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/host-signal.h
index df145b1527..3b168cb58b 100644
--- a/linux-user/host/riscv/host-signal.h
+++ b/linux-user/host/riscv/host-signal.h
@@ -18,65 +18,38 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
 
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


