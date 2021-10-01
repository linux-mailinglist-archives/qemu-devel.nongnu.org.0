Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE7241F328
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:32:23 +0200 (CEST)
Received: from localhost ([::1]:39472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMOU-0003C2-Dr
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM51-0004rY-2J
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:15 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:43602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4u-000567-Mx
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:14 -0400
Received: by mail-qk1-x736.google.com with SMTP id 138so9803051qko.10
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nMBhe6wRyQJffJfKqR3e4B4BjhzuFHvBY7lYZ6XbL2k=;
 b=hiXQ3mmw5CBhTiIe+H0zJFUOd8tQlCu6I7USJ9pr7fUw9L66NMmICsOqxlPs8R3Gho
 llCdRf3wWjVoI138TAgVv4z65YGzmQHm3v/jEOPQE0Y8xOes4knIgigu/pbacllm25m/
 urZQGqYjvyFYSNJQ1yWzXpPNT9GhgxHTTE6tVuhkj1eqW/eN5McrYX9WyyHue8JekTBH
 pueo29vmGAM/b0VAcmg/XGr2OOTgqkn5YmSvaoneuDxmoOR0Nxob3nuoBQmO0hA6tnXK
 VZq57jP6FUnA3prwlFdPi2ai3LUlwMpV7Q0aJvWbEK933n9cOsGr+jcrbTDTc0w73tMM
 zenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nMBhe6wRyQJffJfKqR3e4B4BjhzuFHvBY7lYZ6XbL2k=;
 b=5DzzG1YWWdPShZwzBNEtzwvxHsZ5n0wtMY8Wz72523t2uaJDCUt1lKpt2kIq8UrWK9
 7RDuNPiQH511WX5Ho9m7cfIQJlJOyfNKmZXinL0givoplRY18fE7r9ZJg9J6tEPNwvTs
 a312WYX+GNJmvnJv6pp5WujsSquthcD5i/NeQ0UsNjez5s+PJyWZw2zV+TlJGtRESLU6
 +9jyk4VPLpiSJneqqkKVuZC8LaJbvJFG2xE2nnLBO2KKMBMV/lMfw7gDxzDn8dY15lJn
 AGHkcpTlvSD/qi8+w6GUuFaob2dbHUQZGG0+TINoppitBXOYxn1h7EbOXsQRl/a6/+49
 9DEg==
X-Gm-Message-State: AOAM532u7TqwLOxRktCUo8iPw+CDWTjLJRl/GjZ5phNcF57RXGSKzxNM
 KOPYZWVCzhMAq95X3MT0jWMl/KmsJJ5ygg==
X-Google-Smtp-Source: ABdhPJxXEptVnIRiJgPkCgvNAJHYlWUVI47UnRYTinbxOUAJ7QeFNfhiXJLtwJKYtyadGA1dEzujNg==
X-Received: by 2002:a37:67cb:: with SMTP id
 b194mr10154077qkc.379.1633108327799; 
 Fri, 01 Oct 2021 10:12:07 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/41] linux-user/host/riscv: Improve host_signal_write
Date: Fri,  1 Oct 2021 13:11:27 -0400
Message-Id: <20211001171151.1739472-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
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


